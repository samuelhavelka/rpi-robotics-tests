# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

CC=gcc
IDIR=include
ODIR=src
CFLAGS=-I$(IDIR)

# link lgpio library
LIBS=-llgpio

# prepend header files with IDIR
_DEPS = motor.h gps.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

# prepend object files with ODIR
_OBJ = motor.o gps.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c $< -o $@ $(CFLAGS) $(LIBS)


main: $(OBJ)
	$(CC) $@.c -o $@.o $^ $(CFLAGS) $(LIBS)

# perform cleanup
.PHONY: clean
clean:
	rm -f $(ODIR)/*.o *~ core
	rm -f *.o *~ core