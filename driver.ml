(****************************************************************************)
(* The Driver                                                        *)
(*                                                                          *)
(* Author: Phung Nguyen                                      *)
(* Date: 2011/4                                                    *)
(****************************************************************************)
open Mylexer;;
open Myparser;;
open Error;;
open Semanticcheck;;
open Pp;;
open Ast;;

(****************************************************************************)

let parse_program chan =
  let lexbuf = Lexing.from_channel chan in
       Myparser.program Mylexer.token lexbuf
  

let parse_program_of_file filename =
  let input_chan = open_in filename in
  let res =  (parse_program input_chan)   in 
  let _ = try (check_program res)
			with Type_Mismatch_In_Expression e -> 
			print_string ("TypeMismatch In Expression: "^(print_expr e))
				|Type_Mismatch_In_Statement s -> print_string ("TypeMismatch In Statement: " ^(print_stmt s))
				|Undeclared_Identifier s -> print_string ("Undeclared Identifier: "^ s)
				|Undeclared_Class s -> print_string ("Undeclared Class: "^ s)
				|Undeclared_Method s -> print_string ("Undeclared Method: "^ s)
				|Undeclared_Attribute s-> print_string ("Undeclared Attribute: "^ s)
				|Redeclared_Variable s -> print_string ("Redeclared Variable: "^s)
				|Redeclared_Class s -> print_string ("Redeclared Class: "^s) 
				|Redeclared_Attribute s -> print_string ("Redeclared Attribute: "^s)				
				|Redeclared_Method s -> print_string ("Redeclared Method: "^s)
				|Redeclared_Parameter s -> print_string ("Redeclared Parameter: "^s)
				|Redeclared_Constant s -> print_string ("Redeclared Constant: "^s)
				|No_Prototype s -> print_string ("No Prototype of "^s)
				|No_Implementation s -> print_string ("No Implementation of "^s)
  in
  close_in input_chan 

(****************************************************************************)

let interpret_program_from_file filename =
	 parse_program_of_file filename 
	 
let _ =
  interpret_program_from_file Sys.argv.(1)
