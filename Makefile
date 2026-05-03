all:
	ocamlopt.opt -o forktest unix.cmxa forktest.ml
clean:
	rm -f *.cm?
	rm -f *.o
	rm -f forktest
