open Types;;
open Lisp;;

let main () =
  let lexbuf = Lexing.from_string "(print hello world again and again)" in
  let read () = Parser.main Lexer.token lexbuf in
  let sexp = read () in
  eval sexp;;

main ();;
