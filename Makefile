# variables
FC=gfortran
CFLAGS=-c -g -Og -Wall
FFLAGS=-L/home/pato/src/lia/lapack -llapack -lrefblas
# linking
a.out: main.o
	$(FC) main.o $(FFLAGS)

# compiling
main.o: main.f90
	$(FC) $(CFLAGS) main.f90


# cleanup
clean:
	rm *.o a.out

# run
run:
	make
	./a.out