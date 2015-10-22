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
#CC = gcc
#CFLAGS  = -Wall -O0 -g -pipe

#INCLUDES = $(shell ls ./include)

#HEADERS = $(shell ls ./include/*.h)

#OBJECTS = $(shell ls ./src/*.c | grep -v -e '^main' -e '^test' | sed 's:\.c$$:.o:')

#PROGRAMS = $(shell ls main*.c test*.c | sed 's:\.c$$::')

#all:
#	for prg in $(PROGRAMS);	\
#	do \
#	 $(MAKE) recurse PRG=$$prg || exit 42; \
#	done

#recurse: $(PRG).c Makefile $(HEADERS) $(OBJECTS)
#	$(CC) $(CFLAGS) -o $(PRG) $(PRG).c $(OBJECTS)

#clean:
#	rm -fr *~ *.o ./src/*.o ./include/*~ *.dSYM $(PROGRAMS) *.dot

DIR_INC = ./include
DIR_SRC = ./src
DIR_OBJ = ./obj
DIR_BIN = ./bin

SRC = $(wildcard ${DIR_SRC}/*.c)
OBJ = $(patsubst %.c,${DIR_OBJ}/%.o,$(notdir ${SRC}))

TARGET = main

BIN_TARGET = ${DIR_BIN}/${TARGET}

CC = gcc

CFLAGS = -Wall -O0 -g -pipe -I${DIR_INC}

${BIN_TARGET}:${OBJ}
	$(CC) $(OBJ)  -o $@

${DIR_OBJ}/%.o:${DIR_SRC}/%.c
	$(CC) $(CFLAGS) -c  $< -o $@

.PHONY:clean

clean:cleanObj cleanBin cleanBackup 

cleanObj:
	 -rm -rf ${DIR_OBJ}/*.o

cleanBin:
	-rm -rf ${BIN_TARGET}

cleanBackup:
	-rm -rf *~ ${DIR_INC}/*~ ${DIR_SRC}/*~
