(* Lexer specification *)
(* Your name: 	DO HUY HUNG  *)
(* Your id: 	PUFMINF1204    *)

{

open Myparser	
open Lexing


exception UnrecognizeChar of string
exception UnrecognizeEscapedChar of string
exception UnterminateString
exception UnterminateComment
}
(*pre-define variable*)
let digit = ['0'-'9']
let letter = ['a'-'z' 'A'-'Z' '_']
let int_part = ['0'-'9']+
let ex_part = ['e' 'E']['+' '-']?['0' - '9']+

(*---------------------------------------------------------------------------------*)
rule token = parse
	| [' ' '\t'] 	{ token lexbuf } (*skip blanks*)
	| '\n'				{ new_line lexbuf; token lexbuf }
	| "(*"				{comment1 lexbuf}
	| '#'				{comment2 lexbuf}

	| '('				{LPAREN}
	| ')'				{RPAREN}
	| '['				{LSQBRA}
	| ']'				{RSQBRA}
	| '{'				{LCURBRA}
	| '}'				{RCURBRA}
	| ':' 				{COLON}
	| ';' 				{SEMICOLON}
	| "::"				{DOUBLECOLON}
	| '.'				{DOT}
	| ','				{COMMA}

	| '+'				{ADD}
	| '*'				{MUL}
	| '\\'				{INT_DIV}
	| ":="				{ASSIGN}
	| '<'				{LESS}
	| "<="				{LESS_EQUAL}
	| "<>"				{NEQUAL}
	| '!'				{LOGIC_NOT}
	| '^'				{CONCAT}
	| '-'				{SUB}
	| '/'				{FLOAT_DIV}
	| '%'				{MOD}
	| '='				{ASSIGN_CONST}
	| "=="				{EQUAL}
	| '>'				{GREATER}
	| ">="				{GREATER_EQUAL}
	| "&&"				{LOGIC_AND}
	| "||"				{LOGIC_OR}

	| "integer"			{INTEGER}
	| "bool"			{BOOL}
	| "extends"			{EXTENDS}
	| "string"			{STRING}
	| "break"			{BREAK}
	| "float"			{FLOAT}
	| "then"			{THEN}
	| "void"			{VOID}
	| "class"			{CLASS}
	| "for"				{FOR}
	| "to"				{TO}
	| "null"			{NULL}
	| "continue"		{CONTINUE}
	| "if"				{IF}
	| "until"			{UNTIL}
	| "self"			{SELF}
	| "do"				{DO}
	| "while"			{WHILE}
	| "downto"			{DOWNTO}
	| "new"				{NEW}
	| "return"			{RETURN}
	| "else"			{ELSE}
	| "repeat"			{REPEAT}
	| "true"|"false" as e	{BOOL_LIT (bool_of_string e)}

	|'"' 				{string_lit "" lexbuf}  (*call string_lit entry point*)
	| letter+(letter|digit)* as e	{ID e}
	| int_part "." ['0' - '9']* | int_part "." ['0' - '9']* ex_part | int_part ex_part as e	{FLOAT_LIT (float_of_string e)}
	| digit+ as e		{INT_LIT (int_of_string e)}
	| eof	     		{ EOF }
	| _          		{ raise (UnrecognizeChar (lexeme lexbuf)) } 
and
	string_lit a = parse
	|'\\' as c		{escape (a^(String.make 1 c)) lexbuf} (*call escape entry point*)
	|'"' 			{STRING_LIT a} (*return token when string match with given regular expression*)
	|'\n'|eof		{raise UnterminateString}
	| _	as b		{string_lit (a^(String.make 1 b)) lexbuf} (*recursively entry point*)
and
	escape c = parse
	|['b' 't' 'f' 'r' 'n' '"' '\\']	as d {string_lit (c^(String.make 1 d)) lexbuf}
	| _		{raise (UnrecognizeEscapedChar (lexeme lexbuf)) }
and
	comment1 = parse
	|"*)"	{token lexbuf}
	| eof	{raise UnterminateComment}
	| _		{comment1 lexbuf}
and 
	comment2 = parse
	|'\n'|eof	{token lexbuf}
	| _			{comment2 lexbuf}