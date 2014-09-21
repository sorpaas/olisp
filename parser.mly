%token <string> NAME
%token LBRACKET
%token RBRACKET
%token EOF
%start main
%type <Types.sexp> main
%%

main:
  sexp { $1 }
;

sexp:
  list { $1 }
| atom { $1 }
;


list:
  LBRACKET RBRACKET { Types.Atom "nil" }
| LBRACKET inside_list RBRACKET { $2 }
;

inside_list:
  sexp { Types.Cons ($1, Types.Atom "nil") }
| sexp inside_list { Types.Cons ($1, $2) }
;

atom:
  NAME { Types.Atom $1 }
;
