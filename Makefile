# This Makefile compiles and links programs and libraries for NumClass

# Declare phony targets to avoid conflicts with file names
.PHONY: all clean loops recursives recursived loopd

# Compiler and flags
CC=gcc
AR=ar rcs
CFLAGS=-Wall

# Default target: build mains, maindloop, and maindrec
all: mains maindloop maindrec loops recursives

# Target to build the static library libclassloops.a
loops: libclassloops.a

# Target to build the static library libclassrec.a
recursives: libclassrec.a

# Target to build the dynamic library libclassrec.so
recursived: libclassrec.so

# Target to build the dynamic library libclassloops.so
loopd: libclassloops.so

# Target to build the main program mains
mains: main.o libclassrec.a
	$(CC) $(CFLAGS) main.o libclassrec.a -lm -o mains
# This Makefile compiles and links programs and libraries for NumClass

# Declare phony targets to avoid conflicts with file names
.PHONY: all clean loops recursives recursived loopd

# Compiler and flags
CC=gcc
AR=ar rcs
CFLAGS=-Wall

# Default target: build mains, maindloop, and maindrec
all: mains maindloop maindrec loops recursives

# Target to build the static library libclassloops.a
loops: libclassloops.a

# Target to build the static library libclassrec.a
recursives: libclassrec.a

# Target to build the dynamic library libclassrec.so
recursived: libclassrec.so

# Target to build the dynamic library libclassloops.so
loopd: libclassloops.so

# Target to build the main program mains
mains: main.o libclassrec.a
	$(CC) $(CFLAGS) main.o libclassrec.a -lm -o mains

# Target to build the main program maindloop
maindloop: main.o libclassloops.so
	$(CC) $(CFLAGS) main.o ./libclassloops.so -lm -o maindloop

# Target to build the main program maindrec
maindrec: main.o libclassrec.so
	$(CC) $(CFLAGS) main.o ./libclassrec.so -lm -o maindrec

# Target to compile main.c into main.o
main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c main.c

# Target to compile advancedClassificationLoop.c into advancedClassificationLoop.o
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(CFLAGS) -fPIC -c advancedClassificationLoop.c

# Target to compile advancedClassificationRecursion.c into advancedClassificationRecursion.o
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(CFLAGS) -fPIC -c advancedClassificationRecursion.c

# Target to compile basicClassification.c into basicClassification.o
basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(CFLAGS) -fPIC -c basicClassification.c

# Target to build the static library libclassloops.a
libclassloops.a: advancedClassificationLoop.o basicClassification.o
	$(AR) libclassloops.a advancedClassificationLoop.o basicClassification.o

# Target to build the static library libclassrec.a
libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	$(AR) libclassrec.a advancedClassificationRecursion.o basicClassification.o

# Target to build the dynamic library libclassloops.so
libclassloops.so: advancedClassificationLoop.o basicClassification.o
	$(CC) $(CFLAGS) -shared advancedClassificationLoop.o basicClassification.o -o libclassloops.so

# Target to build the dynamic library libclassrec.so
libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) $(CFLAGS) -shared advancedClassificationRecursion.o basicClassification.o -o libclassrec.so

# Target to clean up compiled files and executables
clean:
	rm -f *.o *.a *so *.gch mains maindloop maindrec

# Target to build the main program maindloop
maindloop: main.o libclassloops.so
	$(CC) $(CFLAGS) main.o ./libclassloops.so -lm -o maindloop

# Target to build the main program maindrec
maindrec: main.o libclassrec.so
	$(CC) $(CFLAGS) main.o ./libclassrec.so -lm -o maindrec

# Target to compile main.c into main.o
main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c main.c

# Target to compile advancedClassificationLoop.c into advancedClassificationLoop.o
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(CFLAGS) -fPIC -c advancedClassificationLoop.c

# Target to compile advancedClassificationRecursion.c into advancedClassificationRecursion.o
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(CFLAGS) -fPIC -c advancedClassificationRecursion.c

# Target to compile basicClassification.c into basicClassification.o
basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(CFLAGS) -fPIC -c basicClassification.c

# Target to build the static library libclassloops.a
libclassloops.a: advancedClassificationLoop.o basicClassification.o
	$(AR) libclassloops.a advancedClassificationLoop.o basicClassification.o

# Target to build the static library libclassrec.a
libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	$(AR) libclassrec.a advancedClassificationRecursion.o basicClassification.o

# Target to build the dynamic library libclassloops.so
libclassloops.so: advancedClassificationLoop.o basicClassification.o
	$(CC) $(CFLAGS) -shared advancedClassificationLoop.o basicClassification.o -o libclassloops.so

# Target to build the dynamic library libclassrec.so
libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) $(CFLAGS) -shared advancedClassificationRecursion.o basicClassification.o -o libclassrec.so

# Target to clean up compiled files and executables
clean:
	rm -f *.o *.a *so *.gch mains maindloop maindrec
