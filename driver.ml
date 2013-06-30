(****************************************************************************)
(* The Driver                                                        *)
(*                                                                          *)
(* Author: Phung Nguyen                                      *)
(* Date: 2013/6                                                    *)
(****************************************************************************)
open Mylexer;;
open Myparser;;
open Pp;;

(*exception Error of exn*(int*int*string)*)
exception Error of int*int*string
(****************************************************************************)

let parse_program chan =
  let lexbuf = Lexing.from_channel chan in
  try
       Myparser.program Mylexer.token lexbuf
     with  _ -> 
      begin
         let curr = lexbuf.Lexing.lex_start_p in
         let line = curr.Lexing.pos_lnum in
         let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
         let tok = Lexing.lexeme lexbuf in
         raise (Error (line,cnum,tok))
       end
  

let parse_program_of_file filename =
  let input_chan = open_in filename in
  let res = (parse_program input_chan) in 
  let _ = close_in input_chan in
  print_string (print_program res)

(****************************************************************************)

let interpret_program_from_file filename =
	 parse_program_of_file filename 
	 
let _ =
  interpret_program_from_file Sys.argv.(1)



(****************************************************************************)
