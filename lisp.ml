open Types;;

let rec print = function
  | Atom "nil" -> print_string "\n";
		  ()
  | Cons (Atom h, t) -> print_string h;
			print t;
			();
  | x -> print_string "unsupported function";
	 ();;

let eval = function
  | Cons (h, t) -> if h = Atom "print" then print t
		   else print_string "unsupported function"
  | Atom x -> print_string "unsupported function";;
