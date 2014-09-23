OCAMLC=ocamlc
OCAMLOPT=ocamlopt
OCAMLDEP=ocamldep
INCLUDES=
OCAMLFLAGS=$(INCLUDES) -g
OCAMLOPTFLAGS=$(INCLUDES)

# The list of object files for prog1
MAIN_OBJS=types.cmo parser.cmo lexer.cmo main.cmo

oclisp: .depend $(MAIN_OBJS)
	$(OCAMLC) -o olisp $(OCAMLFLAGS) $(MAIN_OBJS)

# Common rules
.SUFFIXES: .ml .mli .cmo .cmi .cmx .mll .mly

.mll.ml:
	ocamllex $<
.mly.ml:
	ocamlyacc $<
.ml.cmo:
	$(OCAMLC) $(OCAMLFLAGS) -c $<

.mli.cmi:
	$(OCAMLC) $(OCAMLFLAGS) -c $<

.ml.cmx:
	$(OCAMLOPT) $(OCAMLOPTFLAGS) -c $<

# Clean up
clean:
	rm -f olisp
	rm -f *~
	rm -f *.cm[iox]
	rm -f parser.ml parser.mli
	rm -f lexer.ml
	rm -f test.tmp

# Dependencies - have to do the
# parser.* dependencies by hand
# since they're not seen by
# make depend

parser.cmo : parser.cmi
parser.mli : parser.mly
parser.ml : parser.mly


.depend:
	$(OCAMLDEP) $(INCLUDES) *.mli *.ml *.mly *.mll > .depend

include .depend

