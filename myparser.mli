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

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
