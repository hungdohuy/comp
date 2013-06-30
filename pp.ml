(****************************************************************************)
(* Pretty Printing of expressions                                           *)
(*                                                                          *)
(* Author: Phung Nguyen                                                      *)
(* Date: 6/2013                                                            *)
(****************************************************************************)

open Ast;;

(****************************************************************************)
let print_ident i = i
(****************************************************************************)
let print_list proc separate openc closec lst =
		openc^
			(try
			(List.fold_left 
			(fun str e -> str^separate^(proc e)) 
			(proc (List.hd lst)) 
			(List.tl lst))
			with _ -> "")
		^closec 
(****************************************************************************)
let rec print_cst c =  match c with
    IntVal i -> string_of_int i 
  | FloatVal f -> string_of_float f
  | BoolVal b -> string_of_bool b
  | StringVal s -> s
  | Null -> "null"

(****************************************************************************)
and print_expr e = match e with
    Lit c -> print_cst c
  | Lhs lv -> print_lvalue lv
  | Unary (uop, e') -> ((print_unop uop) ^"("^(print_expr e')^")") 
  | Binary (op, e1', e2') -> ("("^(print_expr e1')^")"^(print_binop op)^"("^(print_expr e2')^")")
  | CallExp (e1,id,param_lst) ->((print_expr e1)^"."^id^(print_list_expr param_lst))
  | Self -> "self"
  | New (id,el) -> "new "^id^(print_list_expr el)
   


(****************************************************************************)
and print_lvalue lv = match lv with
    Id id -> id
  | Member (e1,e2) -> ((print_expr e1) ^"[("^(print_expr e2)^")]")
  | Field(e1,id) ->(print_expr e1)^"."^id
 

(****************************************************************************)

and print_type_expr typ = 
  match typ with
    IntType -> "integer"
  | FloatType -> "float"
  | BoolType -> "bool"
  | StringType -> "string"
  | VoidType -> "void"
  | ArrayType (t,n) -> 
      ((print_type_expr t)^"["^(string_of_int n)^"]") 
  | ClassType t -> t
 
and print_unop = function
  | UMinus -> "-"
  | UPlus -> "+"
  | NotOp -> "not"

and print_binop = function
  | Plus -> " + "
  | Minus -> "-"
  | Mul -> "*"
  | Div -> "/"
  | IDiv -> "\\"
  | Mod -> "%"
  | And -> "&&"
  | Or -> "||"
  | Ge -> ">="
  | Eq -> "=="
  | Neq -> "<>"
  | Gt -> ">"
  | Lt -> "<"
  | Le -> "<="
  | Concat -> "^"

and print_stmt s =
	match s with
    Return(e) -> "Return "^(print_expr  e)
  | Assign(l,e) -> (print_lvalue l)^":="^(print_expr e)
  | Call(e,i,l) -> "Call"^(print_expr e)^"."^(print_ident i)^"("^(print_list_expr l)^")"
  | IfThen(b,bl) -> "If "^(print_expr b)^" Then "^(print_stmt bl)
  | IfThenElse(b,b1,b2) -> "If "^(print_expr b)^" Then "^(print_stmt b1)^" Else "^(print_stmt b2)
  | While(b,b1) ->"While "^(print_expr b)^" do "^(print_stmt b1) 
  | Repeat(ls,e)-> "Repeat\n"^(print_list_stmt ls)^"\nUntil"^(print_expr e)
  | Continue ->"continue"
  | Break -> "break"
  | Block(lvd,ls) -> "{"^(print_list_decl lvd) ^ (print_list_stmt ls) ^"}"
  | For(i,e,b,e',s) -> "For("^i^"="^(print_expr e)^","^(print_expr e')^","^i^(match b with true ->"++" | false -> "--")^")"^(print_stmt s)  

and print_program p = (print_list_decl p)
	
and print_decl decl =
match decl with
| VarDecl (i,t)	-> "("^(print_ident i)^","^(print_type_expr t)^")"
| ConstDecl (i,e) -> "ConstDecl(" ^(print_ident i)^","^(print_expr e)^")"
| ClassDecl (i,s,dl) -> "Class "^i^(if s = "" then " " else (" Extends "^s^" "))^(print_list_decl dl)
| MethodDecl (t,s,m,pl,b) -> (print_type_expr t)^" "^s^"::"^m^(print_list_par pl)^(print_body b)
| MethodProDecl(t,m,pl) -> (print_type_expr t)^" "^m^(print_list_par pl)^";"
| ConstructorDecl (m,pl) -> m^(print_list_par pl)^";"
and print_body body = match body with (dl,sl) -> "{"^(print_list_decl dl) ^ (print_list_stmt sl) ^"}"
and print_list_stmt i = print_list print_stmt "\n" "[" "]" i
and print_list_decl l = print_list print_decl "," "{" "}" l	
and print_list_expr l = print_list print_expr ", " "(" ")" l
and print_list_par l = print_list print_decl "," "(" ")" l
