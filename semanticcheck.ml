open Ast;;
open Error;;
open Pp;;

type ptype = TypeInt | TypeFloat | TypeBool | TypeString 
| TypeArray of ptype * int  
| TypeUnion of ptype * ptype 
| TypeFunc of ptype * ptype 
| TypeMethod of ptype * ptype 
| TypeVoid
| TypeClass of string
| TypeClassDecl of string * string
| TypeNull



exception NeverHappen

(* return a type of a constant *)
let get_const_type c =
	match c with
	IntVal _ -> TypeInt
	| FloatVal _ -> TypeFloat
	| StringVal _ -> TypeString
	| BoolVal _ -> TypeBool
	| Null -> TypeClass "?null"

(* invoked when entering a scope *)
let enter_scope env = []::env

let find_global_scope env =
	let l = List.length env in
	if (l=0) then raise NeverHappen;
	List.nth env (l-1)

(* match_type: match type of right hand side to left hand side *)
(* t1: type of lhs *)
(* t2: type of rhs *)
let rec match_type t1 t2 =
	match (t1,t2) with
		| (TypeVoid,_)
		| (TypeBool,_)
		| (TypeInt,_)
		| (TypeString,_) -> if t1=t2 then true else false
		| (TypeFloat,_) -> if ((t1=t2)||(t2=TypeInt)) then true else false
		| (TypeUnion(a1,a2),TypeUnion(b1,b2)) -> if ((match_type a1 b1)&& (match_type a2 b2)) then true else false
		| (TypeFunc(a1,_),TypeFunc(b1,_)) -> if (match_type a1 b1) then true else false
		| (TypeArray(a1,i1),TypeArray(b1,i2)) -> if ((a1 = b1)&&(i1=i2)) then true else false
		| (TypeClass(id1),TypeClass(id2)) -> if (id1=id2) then true else false
		| (TypeClassDecl(id1,ext1),TypeClassDecl(id2,ext2)) -> if (id1=id2) then true else false
		| (TypeClass(id1),TypeClassDecl(id2,ext)) -> if ((id1=id2)||(id1=ext)) then true else false
		| (_,_) -> false
									 

(* return a declaration type of an identifier in a scope *)
and get_decl_type_in_top lst id =
	match lst with
		| [] -> (false,TypeVoid)
		| head::tail -> match head with (id1,decl)  -> 
					if (id1 = id) then (true,decl) else get_decl_type_in_top tail id 

(* return a declaration type of an identifier in a whole scope *)
and get_decl_type env id =
	match env with
		| [] -> raise (Undeclared_Identifier id)
		| head::tail  -> let tmp = get_decl_type_in_top head id in
							match tmp with (value,decl) -> 
							if value then decl else get_decl_type tail id

(*get parameters*)
and get_parameters lst =
	match lst with
	 | [] -> TypeVoid
	 | [(id, pt)] -> pt
	 | (id,pt)::tail -> TypeUnion(get_parameters tail, pt)
(* apply f to all statements in a statement list *)
and check_all_on_list f pl =
	match pl with
	[]	-> ()
	| head::tail -> (f head;check_all_on_list f tail)

(* return a type of a lvalue *)
and get_lvalue_type env l =
	match l with
	| Id i -> (get_decl_type env i)
	| Member(e1,e2) -> let et1 = get_expr_type env e1 in
						let et2 = get_expr_type env e2 in(
						if (et2<>TypeInt) then raise (Type_Mismatch_In_Expression (Lhs(l)));
							(match et1 with
							| TypeArray(pt,_) -> pt
							| _ -> raise (Type_Mismatch_In_Expression (Lhs(l)))
							)
						)
(* 	| Field(e,id) -> let et = get_expr_type env e in
						if (et = (TypeClass "Self")) *)
	| _ -> TypeInt

(* return a type of a list of expression *)	
and get_expr_list_type env el = 
	match el with
	[] -> TypeVoid
	| [e] -> let t = get_expr_type env e in t
	| head::tail -> let ht = get_expr_type env head in 
			  let tt = get_expr_list_type env tail in TypeUnion (ht,tt)

(* return a type of an expression *)
and get_expr_type env e =
	match e with
	| Self -> TypeClass "Self"
    | Lit c -> get_const_type c
  	| Lhs l -> get_lvalue_type env l
  	| Unary (uop,e1) -> let et = get_expr_type env e1 in
					(match uop with  
					NotOp -> if et = TypeBool then TypeBool else raise (Type_Mismatch_In_Expression e)
					| _ -> if (et = TypeInt || et = TypeFloat) then et else raise (Type_Mismatch_In_Expression e)
					)
	| Binary (biop,e1,e2) ->
		let et1 = get_expr_type env e1 in
		let et2 = get_expr_type env e2 in(
		match biop with
		|Plus |Minus |Mul -> if (((et1=TypeFloat)&&(match_type et1 et2))||
									((et2=TypeFloat)&&(match_type et2 et1))) then TypeFloat 
								else if ((et1=TypeInt)&&(match_type et1 et2)) then TypeInt
										else raise (Type_Mismatch_In_Expression e)
		|Div ->	if (((et1=TypeFloat)&&(match_type et1 et2))||
					((et2=TypeFloat)&&(match_type et2 et1))||
					((et1=TypeInt)&&(match_type et1 et2))) then TypeFloat 
				else raise (Type_Mismatch_In_Expression e)
		|IDiv | Mod -> if (et1=TypeInt && et1=et2) then TypeInt else raise (Type_Mismatch_In_Expression e)
		| And | Or -> if (et1=TypeBool && et1=et2) then TypeBool else raise (Type_Mismatch_In_Expression e) 
		| Eq | Neq -> if ((et1=et2) && ((et1==TypeInt)||(et1==TypeBool))) 
						then TypeBool else raise (Type_Mismatch_In_Expression e)
		| Ge | Gt | Le | Lt -> if ((et1=TypeInt||et1=TypeFloat) && (et2=TypeInt || et2=TypeFloat))
								then TypeBool else raise (Type_Mismatch_In_Expression e)
		|Concat -> if (et1=et2 && et1=TypeString) then TypeString 
					else raise (Type_Mismatch_In_Expression e)
		)
	|New(id,le) ->(
		try(
			let rt = get_decl_type env id in(
			match rt with
			| TypeClassDecl(id1,ext) -> TypeClassDecl(id1,ext)
			| _ -> raise (Type_Mismatch_In_Expression e)
			)
		)	
		with
		|Undeclared_Identifier id -> raise (Undeclared_Class id)
	)	
	| _ -> TypeInt
  
(* look up an identifier in a list *)
and lookup id lst =
	match lst with
		| [] -> false
		| (id1,typ) ::tail -> if id = id1 then true else lookup id tail

and lookup_class id lst =
	match lst with
		| [] -> raise (Undeclared_Class id)
		| (id1,typ) ::tail -> if id = id1 then () else lookup_class id tail

(* convert type type_expr -> ptype *)
and convert_type type_expr =
	match type_expr with
	IntType  -> TypeInt
	| FloatType -> TypeFloat
	| StringType -> TypeString
	| BoolType -> TypeBool
	| VoidType -> TypeVoid
	| ArrayType (t,n) -> TypeArray ((convert_type t), n) 
	| ClassType s -> TypeClass s

(* add a declaration into the environment *)
and add_decl env decl  =
 match env with 
  [] -> raise NeverHappen
  | head::_ ->
  (match decl with
		| VarDecl (id,typ) -> ( 
			match typ with
			|ClassType x ->	let genv = (find_global_scope env) in
							let _ = (lookup_class x genv) in 
							if (lookup id head) 
								then raise (Redeclared_Variable id)
							else add_new_id env id (convert_type typ)
			|ArrayType (typ,n) -> (
				match typ with
				|ClassType x ->	let genv = (find_global_scope env) in
								let _ = (lookup_class x genv) in 
								if (lookup id head) 
									then raise (Redeclared_Variable id)
								else add_new_id env id (convert_type typ)
				|_ 	-> 	if (lookup id head) 
							then raise (Redeclared_Variable id)
						else add_new_id env id (convert_type typ)
			)
			| _ ->	if (lookup id head) 
						then raise (Redeclared_Variable id)
					else add_new_id env id (convert_type typ)
		)
		| ConstDecl (id, exp) ->(  
			let et = get_expr_type env exp in
			if (lookup id head) 
				then raise (Redeclared_Constant id) 
			else add_new_id env id et		
		)
		| ClassDecl (id,ext,dl) ->(
			if (ext <> "") 
				then if not(lookup ext head) 
					then raise (Undeclared_Class ext);
			if (lookup id head) 
				then raise (Redeclared_Class id);
			let env1 = add_new_id env id (TypeClassDecl(id, ext)) in
			let env2 = enter_scope env1 in (
				try	(
					let child = add_decl_list env2 dl in 
					let hdchild =(List.rev (List.hd child)) in
					exitClass env1 hdchild
				)
				with
					| Redeclared_Constant id | Redeclared_Variable id -> raise (Redeclared_Attribute id)
					| Undeclared_Class id -> raise (Undeclared_Class id)
					| _ -> raise NeverHappen
			)
		)
	(* 	| MethodProDecl(rt,id,dl) -> *)
			

		| MethodDecl(rt,sc,id,dl,(lc,sl)) ->
			let env1 = enter_scope env in
			let env2 = (
				try add_decl_list env1 dl
			 	with 
			 	(Redeclared_Variable x) -> raise (Redeclared_Parameter x) 
			) in 
	 		let env3 = add_decl_list env2 lc in 
	 			(check_all_on_list (check_decl_in_statement env3) sl;env)


		| _ -> env
    )

(* add an id to symbol table *)
and add_new_id env id typ =
	match env with
		| [] -> raise NeverHappen
		| head::tail -> ((id,typ)::head)::tail
(* check a statement *)	
and check_decl_in_statement env st =
	match st with
	|Block(dl,sl) -> let env1 = add_decl_list (enter_scope env) dl in(
						(check_all_on_list (check_decl_in_statement env1) sl)
					)
	|IfThen(e,s) -> let t = get_expr_type env e in 
					 if (t = TypeBool) 
					 then (check_decl_in_statement env s) 
					 else raise (Type_Mismatch_In_Statement st)
	|IfThenElse (e,s1,s2) -> let t = get_expr_type env e in 
							 if (t = TypeBool) 
							 then ((check_decl_in_statement env s1);(check_decl_in_statement env s2)) 
							 else raise (Type_Mismatch_In_Statement st)
	|Assign(l,e) -> let rt = get_expr_type env e in 
					let lt = get_lvalue_type env l in 
					if (not (match_type lt rt)) 
					then raise (Type_Mismatch_In_Statement st)		 
	|While(e,s) -> let t = get_expr_type env e in 
					 if (t = TypeBool) 
					 then (check_decl_in_statement env s) 
					 else raise (Type_Mismatch_In_Statement st)
	|Repeat(sl,e) -> let et = get_expr_type env e in( 
						if (et<>TypeBool) then raise (Type_Mismatch_In_Statement st);
						(check_all_on_list (check_decl_in_statement env) sl)
					)
	|For(var,e1,b,e2,st1) ->( try(
								let vt = get_decl_type env var in
								let et1 = get_expr_type env e1 in
								let et2 = get_expr_type env e2 in
								if (vt=TypeInt && et1=TypeInt && et2=TypeInt)
									then check_decl_in_statement env st1
								else raise (Type_Mismatch_In_Statement st)
								)
							with
							|_ -> raise (Type_Mismatch_In_Statement st)
							)
	|Return(e) -> (try
					let _ = get_expr_type env e in ()
				with
				| _ -> raise (Type_Mismatch_In_Statement st)
				)
	|_ -> ()
			
(* add all declarations in a list into the enviroment *)
and add_decl_list env  decl_list =
	match decl_list with
		| []  -> env
		| head :: tail  -> let env1 = add_decl env head in add_decl_list env1 tail
	
and add_items env name lst =		
  match lst with
  	| [] -> env
  	| (id,pt)::tl ->
  		let newId = name^"."^id in 
			let env1 = add_new_id env newId pt in
			add_items env1 name tl
		
	
and exitClass env lst = 
		let hdEnv = List.hd env in
		let (name,pt) = List.hd hdEnv in 
  			add_items env name lst
				
(* initializing the environment *)
let initenv env =
	let env0 = add_new_id env "io" (TypeClass("io")) in
	let env1 = add_new_id env0 "io.readInt" (TypeMethod(TypeVoid,TypeInt)) in
	let env2 = add_new_id env1 "io.writeInt" (TypeMethod(TypeInt,TypeVoid)) in 
	let env3 = add_new_id env2 "io.writeIntLn" (TypeMethod(TypeInt,TypeVoid)) in 
	let env4 = add_new_id env3 "io.readReal" (TypeMethod(TypeVoid,TypeFloat)) in
	let env5 = add_new_id env4 "io.writeReal" (TypeMethod(TypeFloat,TypeVoid)) in 
	let env6 = add_new_id env5 "io.writeRealLn" (TypeMethod(TypeFloat,TypeVoid)) in 
	let env7 = add_new_id env6 "io.readBool" (TypeMethod(TypeVoid,TypeBool)) in
	let env8 = add_new_id env7 "io.writeBool" (TypeMethod(TypeBool,TypeVoid)) in 
	let env9 = add_new_id env8 "io.writeBoolLn" (TypeMethod(TypeBool,TypeVoid)) in 
	let env10 = add_new_id env9 "io.writeStr" (TypeMethod(TypeString,TypeVoid)) in
	let env11 = add_new_id env10 "io.writeStrLn" (TypeMethod(TypeString,TypeVoid)) in 
	let env12 = add_new_id env11 "io.writeLn" (TypeMethod(TypeString,TypeVoid)) in 
	env12
					   
					  
let rec string_of_type pt = 
match pt with
	| TypeInt 	-> "TypeInt"
	| TypeFloat -> "TypeFloat"
	| TypeBool 	-> "TypeBool"
	| TypeString -> "TypeString"
	| TypeArray (_,size) -> "TypeArray " ^ "[" ^ (string_of_int size) ^"]"  
	| TypeUnion (t1,t2) -> "TypeUnion ("^(string_of_type t1)^","^(string_of_type t2)^")"  
	| TypeFunc (t1,t2) -> "TypeFunc ("^(string_of_type t1)^") -> "^(string_of_type t2)
	| TypeMethod (t1,t2) -> "TypeMethod ("^(string_of_type t1)^") -> "^(string_of_type t2)
	| TypeVoid -> "TypeVoid"
	| TypeClass name ->  "TypeClass (" ^ name ^")"
	| TypeClassDecl (name,ext) ->  "TypeClassDecl (" ^ name ^ " : " ^ ext ^")"
	| TypeNull ->  "TypeNull"
		
let ptbl env = 
	Printf.printf "SCOPE LV 0\n\n";
	Printf.printf "Id\tType\n";
	Printf.printf "==================\n";
	let lst = List.hd env in
	let rec print_list lst = 
		match lst with
  	| [] -> Printf.printf "\n"
  	| (id,pt)::tl -> 
  		Printf.printf "%s\t%s\n" id (string_of_type pt); print_list tl
	in print_list lst
						  
(* check whole program *)
let check_program dl =
	(* let env = add_decl_list (initenv [[]]) dl in ptbl env; () *)
 	let _ = add_decl_list (initenv [[]]) dl in ()
