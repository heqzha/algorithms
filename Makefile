#
# This is an example Makefile for a algorithms program.
# Typing 'make' or 'make count' will create the executable file.
#

# define some Makefile variables for the compiler and compiler flags
# to use Makefile variables later in the Makefile: $()
#
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
#
# for C++ define  CC = g++
CC = gcc
CFLAGS  = -g -Wall

INCLUDES = $(shell ls ../include/*.h)

OBJECTS = $(shell ls ../src/*.c | grep - v -e '^main' -e '^test' | sed 's:\.c$$:.o:')

PROGRAMS = $(shell ls main*.c test*.c | sed 's:\.c$$::')

all:
	for prg in $(PROGRAMS);	\
	do \
	 $(MAKE) recurse PRG=$$prg || exit 42; \
	done

recurse: $(PRG).c Makefile $(INCLUDES) $(OBJECTS) %(CC) %(CFLAGS) -o $(PRG) $(PRG).c $(OBJECTS)

clean:
	rm -fr *~ *.o *.dSYM $(PROGRAMS) *.dot
