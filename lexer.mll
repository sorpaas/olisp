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
| ['A'-'z'] ['A'-'z' '0'-'9']* { SYMBOL(Lexing.lexeme lexbuf) }
| '#t'                         { TRUE }
| '#f'                         { FALSE }
| '"' [^ '"']* '"'             { STRING(Lexing.lexeme lexbuf) }
| eof                          { raise eof }
