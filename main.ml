open Types;;

let main () =
  let lexbuf = Lexing.from_string "(print hello world)" in
  let read () = Parser.main Lexer.token lexbuf in
  let sexp = read () in
  sexp;;

main ();;
