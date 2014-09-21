{
  open Parser
  exception Eof
}

rule token = parse
  [' ' '\t' '\n']              { token lexbuf }
| '('                          { LBRACKET }
| ')'                          { RBRACKET }
| ';' [^ '\n']*                { token lexbuf }
| ['0'-'9']                    { INT(Lexing.lexeme lexbuf) }
| ['A'-'z'] ['A'-'z' '0'-'9']* { NAME(Lexing.lexeme lexbuf) }
| '#t'                         { BOOL(TRUE) }
| '#f'                         { BOOL(FALSE) }
| '"' [^ '"']* '"'             { STRING(Lexing.lexeme lexbuf) }
| eof                          { raise eof }
