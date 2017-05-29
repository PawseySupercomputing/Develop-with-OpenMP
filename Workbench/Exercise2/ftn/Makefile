CC=cc
F90=ftn
PRGENV=${PE_ENV}
CFLAGS=-g
SOURCE=pi-serial.f90
OBJ=pi-serial.o
EXE=pi-serial.out

ifeq ($(PRGENV),INTEL)
	OMP_FLAG=-openmp
else ifeq ($(PRGENV),GNU)
	OMP_FLAG=-fopenmp
else ifeq ($(PRGENV),CRAY)
	OMP_FLAG=-homp
endif 


%.o: %.f90 
	$(F90) -c -o $@ $< $(CFLAGS) $(OMP_FLAG)

pi-serial: $(OBJ)
	$(F90) $(CFLAGS) $(OBJ) -o $(EXE) $(OMP_FLAG)

clean:
	rm -rf $(EXE) $(OBJ)
