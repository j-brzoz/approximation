aprox: obj/main.o obj/splines.o obj/points.o obj/aproksymator_na_bazie.o gaus/obj/libge.a
	$(CC) -o bin/aprox obj/main.o obj/splines.o obj/points.o obj/aproksymator_na_bazie.o -L gaus/obj -l ge

czebyszew: obj/main.o obj/splines.o obj/points.o obj/aproksymator_czebyszew.o gaus/obj/libge.a
	$(CC) -o bin/czebyszew  obj/main.o obj/splines.o obj/points.o obj/aproksymator_czebyszew.o -L gaus/obj -l ge

intrp: obj/main.o obj/splines.o obj/points.o obj/interpolator.o gaus/obj/libge.a
	$(CC) -o bin/intrp  obj/main.o obj/splines.o obj/points.o obj/interpolator.o -L gaus/obj -l ge

prosta: obj/main.o obj/splines.o obj/points.o obj/prosta.o
	$(CC) -o bin/prosta  obj/main.o obj/splines.o obj/points.o obj/prosta.o	

obj/main.o:
	$(CC) -c src/main.c -o obj/main.o

obj/splines.o:
	$(CC) -c src/splines.c -o obj/splines.o

obj/points.o:
	$(CC) -c src/points.c -o obj/points.o

obj/aproksymator_na_bazie.o: src/makespl.h src/points.h gaus/piv_ge_solver.h
	$(CC) -I gaus -c src/aproksymator_na_bazie.c -o obj/aproksymator_na_bazie.o

obj/aproksymator_czebyszew.o: src/makespl.h src/points.h gaus/piv_ge_solver.h
	$(CC) -I gaus -c src/aproksymator_czebyszew.c -o obj/aproksymator_czebyszew.o

obj/interpolator.o: src/makespl.h src/points.h gaus/piv_ge_solver.h
	$(CC) -I gaus -c src/interpolator.c -o obj/interpolator.o

obj/prosta.o: src/makespl.h 
	$(CC) -c src/prosta.c -o obj/prosta.o

.PHONY: clean

clean:
	-rm obj/*.o aprox intrp prosta czebyszew
