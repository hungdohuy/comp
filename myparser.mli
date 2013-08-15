type token =
  | EOF
  | PRIMTYPE of (string)
  | BOOLVAL of (string)
  | INTVAL of (string)
  | FLOATVAL of (string)
  | STRINGVAL of (string)
  | ID of (string)
  | BREAK
  | CONTINUE
  | ASSIGN
  | RETURN
  | WHILE
  | REPEAT
  | UNTIL
  | FOR
  | DO
  | DOWNTO
  | TO
  | IF
  | THEN
  | ELSE
  | CLASS
  | EXTENDS
  | NEW
  | NULL
  | SELF
  | VOIDTYPE
  | INITCONST
  | LP
  | RP
  | LSB
  | RSB
  | LB
  | RB
  | DOUBLECOLON
  | COLON
  | COMMA
  | SEMICOLON
  | DOT
  | ADDOP of (char)
  | MULOP of (char)
  | MULINTOP of (char)
  | RELOP of (string)
  | EQOP of (string)
  | LOGICOP of (string)
  | CONCAT
  | NOTOP

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.programAST
