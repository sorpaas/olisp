{
  open Parser
  exception Eof
}

rule token = parse
  [' ' '\t' '\n']    { token lexbuf }
| '('                { LBRACKET }
| ')'                { RBRACKET }
| ';' [^ '\n']*      { token lexbuf }
| ['A'-'z' '0'-'9']+ { NAME(Lexing.lexeme lexbuf) }
| eof                { raise eof }
