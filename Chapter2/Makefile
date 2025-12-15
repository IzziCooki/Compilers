# Define the C compiler
CC = gcc

# Define the source file and executable name
SRC = preproccess.c
EXE = preproccess

# Default target: compile and then run the program
all: run

$(EXE): $(SRC)
	$(CC) $(SRC) -o $(EXE)

run: $(EXE)
	./$(EXE)

clean:
	rm -f $(EXE)

