CC = gcc
CFLAGS = -Wall
MAIN = pruebaMorfo
LEX_FILE = lex.yy
TEST_NUMBERS = 1 2 3

all: pruebaMorfo

pruebaMorfo:
	flex alfa.l
	$(CC) $(CFLAGS) -c $(LEX_FILE).c
	$(CC) $(CFLAGS) -c $(MAIN).c
	$(CC) -o $(MAIN) $(MAIN).o $(LEX_FILE).o

clean:
	rm -rf *.o *.exe misalida* lex.yy.clean

test: pruebaMorfo
	@printf "\n"
	@for number in $(TEST_NUMBERS) ; do \
		printf "\n\nDirerencias $$number\n" ; \
		./$(MAIN) entrada$$number.txt misalida$$number.txt; \
		diff -B -b salida$$number.txt misalida$$number.txt ; \
	done
	@printf "\n"

	