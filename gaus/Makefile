libge: bin/matrix.o bin/pivot.o bin/piv_ge_solver.o
	ar rvs bin/libge.a $^

bin/matrix.o: matrix.c matrix.h
	gcc -c matrix.c -o bin/matrix.o
bin/pivot.o: pivot.c matrix.h
	gcc -c pivot.c -o bin/pivot.o
bin/piv_ge_solver.o: piv_ge_solver.c piv_ge_solver.h matrix.h
	gcc -c piv_ge_solver.c -o bin/piv_ge_solver.o

.PHONY: clean

clean:
	-rm /bin/*.o libge.a