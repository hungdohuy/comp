type token =
  | EOF
  | ID of (string)
  | LPAREN
  | RPAREN
  | LSQBRA
  | RSQBRA
  | LCURBRA
  | RCURBRA
  | COLON
  | SEMICOLON
  | DOUBLECOLON
  | DOT
  | COMMA
  | MAIN_CLASS
  | MAIN_METHOD
  | INTEGER
  | BOOL
  | EXTENDS
  | STRING
  | BREAK
  | FLOAT
  | STRING_LIT of (string)
  | FLOAT_LIT of (float)
  | INT_LIT of (int)
  | BOOL_LIT of (bool)
  | THEN
  | VOID
  | CLASS
  | FOR
  | TO
  | NULL
  | CONTINUE
  | IF
  | UNTIL
  | SELF
  | DO
  | WHILE
  | DOWNTO
  | NEW
  | RETURN
  | ELSE
  | REPEAT
  | ADD
  | MUL
  | INT_DIV
  | ASSIGN
  | LESS
  | LESS_EQUAL
  | NEQUAL
  | LOGIC_NOT
  | CONCAT
  | SUB
  | FLOAT_DIV
  | MOD
  | EQUAL
  | GREATER
  | GREATER_EQUAL
  | LOGIC_AND
  | LOGIC_OR

open Parsing;;
let _ = parse_error;;
# 6 "myparser.mly"

# 67 "myparser.ml"
let yytransl_const = [|
    0 (* EOF *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LSQBRA *);
  261 (* RSQBRA *);
  262 (* LCURBRA *);
  263 (* RCURBRA *);
  264 (* COLON *);
  265 (* SEMICOLON *);
  266 (* DOUBLECOLON *);
  267 (* DOT *);
  268 (* COMMA *);
  269 (* MAIN_CLASS *);
  270 (* MAIN_METHOD *);
  271 (* INTEGER *);
  272 (* BOOL *);
  273 (* EXTENDS *);
  274 (* STRING *);
  275 (* BREAK *);
  276 (* FLOAT *);
  281 (* THEN *);
  282 (* VOID *);
  283 (* CLASS *);
  284 (* FOR *);
  285 (* TO *);
  286 (* NULL *);
  287 (* CONTINUE *);
  288 (* IF *);
  289 (* UNTIL *);
  290 (* SELF *);
  291 (* DO *);
  292 (* WHILE *);
  293 (* DOWNTO *);
  294 (* NEW *);
  295 (* RETURN *);
  296 (* ELSE *);
  297 (* REPEAT *);
  298 (* ADD *);
  299 (* MUL *);
  300 (* INT_DIV *);
  301 (* ASSIGN *);
  302 (* LESS *);
  303 (* LESS_EQUAL *);
  304 (* NEQUAL *);
  305 (* LOGIC_NOT *);
  306 (* CONCAT *);
  307 (* SUB *);
  308 (* FLOAT_DIV *);
  309 (* MOD *);
  310 (* EQUAL *);
  311 (* GREATER *);
  312 (* GREATER_EQUAL *);
  313 (* LOGIC_AND *);
  314 (* LOGIC_OR *);
    0|]

let yytransl_block = [|
  257 (* ID *);
  277 (* STRING_LIT *);
  278 (* FLOAT_LIT *);
  279 (* INT_LIT *);
  280 (* BOOL_LIT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\002\000\005\000\004\000\004\000\004\000\
\004\000\007\000\009\000\009\000\009\000\009\000\008\000\008\000\
\003\000\003\000\010\000\006\000\006\000\011\000\012\000\012\000\
\013\000\014\000\014\000\000\000"

let yylen = "\002\000\
\002\000\003\000\003\000\005\000\005\000\001\000\002\000\002\000\
\003\000\001\000\001\000\001\000\001\000\001\000\004\000\003\000\
\001\000\002\000\005\000\001\000\002\000\001\000\001\000\002\000\
\004\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\028\000\000\000\000\000\000\000\000\000\
\000\000\001\000\000\000\000\000\000\000\000\000\018\000\000\000\
\000\000\002\000\003\000\000\000\000\000\000\000\022\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\019\000\021\000\
\024\000\000\000\000\000\004\000\007\000\000\000\027\000\011\000\
\014\000\013\000\012\000\000\000\000\000\009\000\025\000\000\000\
\005\000"

let yydgoto = "\002\000\
\004\000\005\000\006\000\027\000\028\000\021\000\000\000\000\000\
\044\000\007\000\022\000\023\000\024\000\025\000"

let yysindex = "\005\000\
\237\254\000\000\003\255\000\000\001\000\240\254\247\254\013\255\
\014\255\000\000\020\255\026\000\015\255\027\000\000\000\028\255\
\255\254\000\000\000\000\018\255\024\255\028\255\000\000\028\255\
\025\255\021\255\027\255\028\255\006\255\028\255\000\000\000\000\
\000\000\250\254\034\255\000\000\000\000\028\255\000\000\000\000\
\000\000\000\000\000\000\029\255\036\255\000\000\000\000\031\255\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\037\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\033\255\000\000\252\254\000\000\254\254\
\000\000\000\000\000\000\035\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\037\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\039\000\010\000\000\000\014\000\241\255\000\000\000\000\
\000\000\000\000\000\000\022\000\000\000\017\000"

let yytablesize = 284
let yytable = "\020\000\
\010\000\029\000\020\000\008\000\023\000\001\000\032\000\003\000\
\040\000\041\000\013\000\042\000\037\000\043\000\012\000\009\000\
\015\000\011\000\016\000\017\000\008\000\020\000\046\000\023\000\
\026\000\018\000\019\000\009\000\020\000\030\000\031\000\026\000\
\034\000\036\000\035\000\045\000\017\000\047\000\048\000\049\000\
\026\000\006\000\038\000\008\000\014\000\033\000\039\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\011\000"

let yycheck = "\001\001\
\000\000\017\000\007\001\001\001\007\001\001\000\022\000\027\001\
\015\001\016\001\027\001\018\001\028\000\020\001\005\000\013\001\
\007\000\027\001\006\001\006\001\001\001\026\001\038\000\026\001\
\026\001\000\000\000\000\013\001\001\001\012\001\007\001\026\001\
\008\001\007\001\014\001\002\001\000\000\009\001\003\001\009\001\
\008\001\007\001\029\000\007\001\006\000\024\000\030\000\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\027\001"

let yynames_const = "\
  EOF\000\
  LPAREN\000\
  RPAREN\000\
  LSQBRA\000\
  RSQBRA\000\
  LCURBRA\000\
  RCURBRA\000\
  COLON\000\
  SEMICOLON\000\
  DOUBLECOLON\000\
  DOT\000\
  COMMA\000\
  MAIN_CLASS\000\
  MAIN_METHOD\000\
  INTEGER\000\
  BOOL\000\
  EXTENDS\000\
  STRING\000\
  BREAK\000\
  FLOAT\000\
  THEN\000\
  VOID\000\
  CLASS\000\
  FOR\000\
  TO\000\
  NULL\000\
  CONTINUE\000\
  IF\000\
  UNTIL\000\
  SELF\000\
  DO\000\
  WHILE\000\
  DOWNTO\000\
  NEW\000\
  RETURN\000\
  ELSE\000\
  REPEAT\000\
  ADD\000\
  MUL\000\
  INT_DIV\000\
  ASSIGN\000\
  LESS\000\
  LESS_EQUAL\000\
  NEQUAL\000\
  LOGIC_NOT\000\
  CONCAT\000\
  SUB\000\
  FLOAT_DIV\000\
  MOD\000\
  EQUAL\000\
  GREATER\000\
  GREATER_EQUAL\000\
  LOGIC_AND\000\
  LOGIC_OR\000\
  "

let yynames_block = "\
  ID\000\
  STRING_LIT\000\
  FLOAT_LIT\000\
  INT_LIT\000\
  BOOL_LIT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'main_decl) in
    Obj.repr(
# 83 "myparser.mly"
               ()
# 329 "myparser.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'main_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'manyclassdecl) in
    Obj.repr(
# 84 "myparser.mly"
                              ()
# 337 "myparser.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'manyclassdecl) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'main_decl) in
    Obj.repr(
# 85 "myparser.mly"
                              ()
# 345 "myparser.ml"
               : unit))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'main_member_decl) in
    Obj.repr(
# 90 "myparser.mly"
                                                   ()
# 352 "myparser.ml"
               : 'main_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 94 "myparser.mly"
                                          ()
# 358 "myparser.ml"
               : 'main_method))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'main_method) in
    Obj.repr(
# 97 "myparser.mly"
             ()
# 365 "myparser.ml"
               : 'main_member_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'main_method) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'list_members_decl) in
    Obj.repr(
# 98 "myparser.mly"
                                ()
# 373 "myparser.ml"
               : 'main_member_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'list_members_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'main_method) in
    Obj.repr(
# 99 "myparser.mly"
                                ()
# 381 "myparser.ml"
               : 'main_member_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'list_members_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'main_method) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'list_members_decl) in
    Obj.repr(
# 100 "myparser.mly"
                                                  ()
# 390 "myparser.ml"
               : 'main_member_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'oneconstdecl) in
    Obj.repr(
# 104 "myparser.mly"
              ()
# 397 "myparser.ml"
               : 'manyconstdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 108 "myparser.mly"
         ()
# 403 "myparser.ml"
               : 'common_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 109 "myparser.mly"
        ()
# 409 "myparser.ml"
               : 'common_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 110 "myparser.mly"
         ()
# 415 "myparser.ml"
               : 'common_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 111 "myparser.mly"
       ()
# 421 "myparser.ml"
               : 'common_type))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'common_type) in
    Obj.repr(
# 116 "myparser.mly"
                                ()
# 429 "myparser.ml"
               : 'oneconstdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'common_type) in
    Obj.repr(
# 117 "myparser.mly"
                       ()
# 437 "myparser.ml"
               : 'oneconstdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'oneclassdecl) in
    Obj.repr(
# 121 "myparser.mly"
              ()
# 444 "myparser.ml"
               : 'manyclassdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'oneclassdecl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'manyclassdecl) in
    Obj.repr(
# 122 "myparser.mly"
                             ()
# 452 "myparser.ml"
               : 'manyclassdecl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'list_members_decl) in
    Obj.repr(
# 126 "myparser.mly"
                                            ()
# 460 "myparser.ml"
               : 'oneclassdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'member_decl) in
    Obj.repr(
# 130 "myparser.mly"
             ()
# 467 "myparser.ml"
               : 'list_members_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'member_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'list_members_decl) in
    Obj.repr(
# 131 "myparser.mly"
                                ()
# 475 "myparser.ml"
               : 'list_members_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'many_variables_decl) in
    Obj.repr(
# 135 "myparser.mly"
                     ()
# 482 "myparser.ml"
               : 'member_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'onerow_var_decl) in
    Obj.repr(
# 139 "myparser.mly"
                 ()
# 489 "myparser.ml"
               : 'many_variables_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'onerow_var_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'many_variables_decl) in
    Obj.repr(
# 140 "myparser.mly"
                                      ()
# 497 "myparser.ml"
               : 'many_variables_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'list_id) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'common_type) in
    Obj.repr(
# 144 "myparser.mly"
                                     ()
# 505 "myparser.ml"
               : 'onerow_var_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 148 "myparser.mly"
    ()
# 512 "myparser.ml"
               : 'list_id))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'list_id) in
    Obj.repr(
# 149 "myparser.mly"
                   ()
# 520 "myparser.ml"
               : 'list_id))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : unit)
