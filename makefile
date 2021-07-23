FC = pgf90
FFLAGS = -r8 -Mfree -O3 -Minform=severe

TARGETS = vkplate

ALL : $(TARGETS)

SRC = $(wildcard *.f)
OBJ = $(patsubst %.f, %.o, $(SRC))

vkplate : $(OBJ)
	$(FC) -o vkplate $(OBJ)

solidsolve.mod: solidsolve.f
	$(FC) -c $(FFLAGS) solidsolve.f

%.o: %.f solidsolve.mod
	$(FC) -c $(FFLAGS) $*.f

clean:  
	rm -rf $(OBJ) $(TARGETS) *.mod *.vtk

