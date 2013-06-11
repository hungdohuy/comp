(****************************************************************************)
(* The Driver                                                        *)
(*                                                                          *)
(* Author: Phung Nguyen                                      *)
(* Date: 2011/3                                                    *)
(****************************************************************************)
open Mylexer;;
(****************************************************************************)


(* print out each token to check *)
let print tk =
	match tk with
	| COMMENT e -> print_string("COMMENT("^e^") ")
	| ID e -> print_string ("ID("^ e^ ") ")
	| INTEGER		-> print_string("INTEGER ")
	| BOOL		-> print_string("BOOL ")
	| EXTENDS		-> print_string("EXTENDS ")
	| STRING		-> print_string("STRING ")
	| BOOL_LIT	e	-> print_string("BOOL_LIT("^(string_of_bool e)^") ")
	| BREAK		-> print_string("BREAK ")
	| FLOAT		-> print_string("FLOAT ")
	| STRING_LIT e	-> print_string("STRING_LIT("^e^") ")
	| FLOAT_LIT	e	-> print_string("FLOAT_LIT("^(string_of_float e)^") ")
	| INT_LIT e 		-> print_string("INT_LIT("^(string_of_int e)^") ")
	| THEN		-> print_string("THEN ")
	| VOID		-> print_string("VOID ")
	| CLASS		-> print_string("CLASS ")
	| FOR		-> print_string("FOR ")
	| TO		-> print_string("TO ")
	| NULL		-> print_string("NULL ")
	| CONTINUE		-> print_string("CONTINUE ")
	| IF		-> print_string("IF ")
	| UNTIL		-> print_string("UNTIL ")
	| SELF		-> print_string("SELF ")
	| DO		-> print_string("DO ")
	| WHILE		-> print_string("WHILE ")
	| DOWNTO		-> print_string("DOWNTO ")
	| NEW		-> print_string("NEW ")
	| RETURN		-> print_string("RETURN ")
	| ELSE		-> print_string("ELSE ")
	| REPEAT		-> print_string("REPEAT ")
	| LPAREN -> print_string("LPAREN ")
	| RPAREN -> print_string("RPAREN ")
	| LSQBRA -> print_string("LSQBRA ")
	| RSQBRA -> print_string("RSQBRA ")
	| LCURBRA -> print_string("LCURBRA ")
	| RCURBRA -> print_string("RCURBRA ")
	| COLON -> print_string("COLON ")
	| SEMICOLON -> print_string("SEMICOLON ")
	| DOUBLECOLON -> print_string("DOUBLECOLON ")
	| ADD	->	print_string("ADD ")
	| MUL	->	print_string("MUL ")
	| INT_DIV	->	print_string("INT_DIV ")
	| ASSIGN	->	print_string("ASSIGN ")
	| LESS	->	print_string("LESS ")
	| LESS_EQUAL	->	print_string("LESS_EQUAL ")
	| NEQUAL	->	print_string("NEQUAL ")
	| LOGIC_NOT	->	print_string("LOGIC_NOT ")
	| CONCAT	->	print_string("CONCAT ")
	| SUB	->	print_string("SUB ")
	| FLOAT_DIV	->	print_string("FLOAT_DIV ")
	| MOD	->	print_string("MOD ")
	| EQUAL	->	print_string("EQUAL ")
	| GREATER	->	print_string("GREATER ")
	| GREATER_EQUAL	->	print_string("GREATER_EQUAL ")
	| LOGIC_AND	->	print_string("LOGIC_AND ")
	| LOGIC_OR	->	print_string("LOGIC_OR ")
	| DOT	->	print_string("DOT ")
	| COMMA	->	print_string("COMMA ")
	| EOF -> print_string "EOF\n"

(* call recursively lexical analyzer tk *)
let rec pp tk buf =
	let token = tk buf in
	match token with
	EOF -> (print token; 1)
	| _ -> (print token; let sum = pp tk buf in sum+1)

(* create lexer buffer from a channel *)
let parse_program chan =
  let lexbuf = Lexing.from_channel chan in  try
  (let sum = pp Mylexer.token lexbuf in print_string("Total token detected is: "^(string_of_int sum)^"\n"))
  with UnrecognizeChar x -> print_string ("Unrecognized Char "^x^"\n")
  | UnrecognizeEscapedChar x -> print_string("UnrecognizeEscapedChar "^x^"\n")
  | UnterminateString -> print_string "Unterminated string\n"
  | UnterminateComment -> print_string "Unterminated Comment\n"
(* main function *)
let driver filename =
  let input_chan = open_in filename in
  let _ = (parse_program input_chan) in 
  close_in input_chan

(* Entry point *)
let _ = driver Sys.argv.(1) 



(****************************************************************************)
