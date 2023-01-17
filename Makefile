aprox: main.o splines.o points.o bin/aproksymator_na_bazie.o gaus/bin/libge.a
	$(CC) -o bin/aprox main.o splines.o points.o bin/aproksymator_na_bazie.o -L gaus/bin -l ge

czebyszew: main.o splines.o points.o bin/aproksymator_czebyszew.o gaus/bin/libge.a
	$(CC) -o bin/czebyszew  main.o splines.o points.o bin/aproksymator_czebyszew.o -L gaus/bin -l ge

intrp: main.o splines.o points.o bin/interpolator.o gaus/bin/libge.a
	$(CC) -o bin/intrp  main.o splines.o points.o bin/interpolator.o -L gaus/bin -l ge

prosta: main.o splines.o points.o prosta.o
	$(CC) -o bin/prosta  main.o splines.o points.o prosta.o	

bin/aproksymator_na_bazie.o: makespl.h points.h gaus/piv_ge_solver.h
	$(CC) -I gaus -c aproksymator_na_bazie.c -o bin/aproksymator_na_bazie.o

bin/aproksymator_czebyszew.o: makespl.h points.h gaus/piv_ge_solver.h
	$(CC) -I gaus -c aproksymator_czebyszew.c -o bin/aproksymator_czebyszew.o

bin/interpolator.o: makespl.h points.h gaus/piv_ge_solver.h
	$(CC) -I gaus -c interpolator.c -o bin/interpolator.o

.PHONY: clean

clean:
	-rm bin/*.o aprox intrp prosta czebyszew
