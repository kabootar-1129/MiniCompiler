all: mini_compiler

mini_compiler: lex.yy.c parser.tab.c semantic.o symbol_table.o
	gcc lex.yy.c parser.tab.c semantic.o symbol_table.o -o mini_compiler -lfl

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

semantic.o: semantic.c semantic.h symbol_table.h
	gcc -c semantic.c

symbol_table.o: symbol_table.c symbol_table.h
	gcc -c symbol_table.c

clean:
	rm -f *.o lex.yy.c parser.tab.c parser.tab.h mini_compiler
