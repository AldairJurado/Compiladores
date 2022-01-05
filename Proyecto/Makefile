a.out: Grammar.tab.o main.o lex.yy.o 	
	gcc main.o lex.yy.o Grammar.tab.o 

main.o: main.c
	gcc -c main.c

lex.yy.o: lex.yy.c
	gcc -c lex.yy.c

Grammar.tab.o: Grammar.tab.c
	gcc -c Grammar.tab.c

lex.yy.c: Grammar.l
	flex Grammar.l

Grammar.tab.c: Grammar.y
	bison -d Grammar.y

clean:
	rm -f a.out main.o lex.yy.o Grammar.tab.o lex.yy.c Grammar.tab.c Grammar.tab.h

run:a.out
	./a.out