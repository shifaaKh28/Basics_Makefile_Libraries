# Makefile for compiling and building targets

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall

# Target executables
TARGET1 = mains
TARGET2 = maindloop
TARGET3 = maindrec

# Static libraries
LIB = libclassloops.a
LIBREC = libclassrec.a

# Shared libraries
LIBREC_SO = libclassrec.so
LIBLOOP_SO = libclassloops.so

# Source files
SRC1 = main.c basicClassification.c advancedClassificationRecursion.c
SRC2 = main.c basicClassification.c advancedClassificationLoop.c
SRC3 = main.c basicClassification.c advancedClassificationRecursion.c

# Header file
HEADERS = NumClass.h

# Default target: build all executables and libraries
all: $(TARGET1) $(TARGET2) $(TARGET3) loops recursives

# Compilation rules for the executables
$(TARGET1): $(SRC1) $(HEADERS) $(LIBREC)
	$(CC) $(CFLAGS) -o $(TARGET1) $(SRC1) -L. -lclassrec

$(TARGET2): $(SRC2) $(HEADERS) $(LIBLOOP_SO)
	$(CC) $(CFLAGS) -fPIC -o $(TARGET2) $(SRC2) -L. -lclassloops

$(TARGET3): $(SRC3) $(HEADERS) $(LIBREC_SO)
	$(CC) $(CFLAGS) -fPIC -o $(TARGET3) $(SRC3) -L. -lclassrec

# Build static library for loops
recursives: $(LIBREC)

# Build shared library for recursion
recursived: $(LIBREC_SO)

# Build static library for loops
loops: $(LIB)

# Build shared library for loops
loopd: $(LIBLOOP_SO)

# Compilation rules for static libraries
$(LIB): advancedClassificationLoop.o basicClassification.o
	ar rcs $(LIB) advancedClassificationLoop.o basicClassification.o

$(LIBREC): advancedClassificationRecursion.o basicClassification.o
	ar rcs $(LIBREC) advancedClassificationRecursion.o basicClassification.o

# Compilation rules for shared libraries
$(LIBREC_SO): advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared -o $(LIBREC_SO) advancedClassificationRecursion.o basicClassification.o

$(LIBLOOP_SO): advancedClassificationLoop.o basicClassification.o
	$(CC) -shared -o $(LIBLOOP_SO) advancedClassificationLoop.o basicClassification.o

# Compilation rules for object files
advancedClassificationLoop.o: advancedClassificationLoop.c $(HEADERS)
	$(CC) $(CFLAGS) -fPIC -c -o advancedClassificationLoop.o advancedClassificationLoop.c

basicClassification.o: basicClassification.c $(HEADERS)
	$(CC) $(CFLAGS) -fPIC -c -o basicClassification.o basicClassification.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c $(HEADERS)
	$(CC) $(CFLAGS) -fPIC -c -o advancedClassificationRecursion.o advancedClassificationRecursion.c

# Clean rule to remove generated files
.PHONY: clean
clean:
	rm -f $(TARGET1) $(TARGET2) $(TARGET3) $(LIB) $(LIBREC) $(LIBREC_SO) $(LIBLOOP_SO) advancedClassificationLoop.o advancedClassificationRecursion.o basicClassification.o
