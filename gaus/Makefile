libge: obj/matrix.o obj/pivot.o obj/piv_ge_solver.o
	ar rvs obj/libge.a $^

obj/matrix.o: matrix.c matrix.h
	gcc -c matrix.c -o obj/matrix.o
obj/pivot.o: pivot.c matrix.h
	gcc -c pivot.c -o obj/pivot.o
obj/piv_ge_solver.o: piv_ge_solver.c piv_ge_solver.h matrix.h
	gcc -c piv_ge_solver.c -o obj/piv_ge_solver.o

.PHONY: clean

clean:
	-rm /obj/*.o libge.a