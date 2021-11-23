%{
    #include <stdio.h>
    int yylex();
    int yyerror(chat *s);

%}

%token STRING NUM OTHER SEMICOLON PIC

%type <name>    STRING
%type <numbers> NUM
%type <name>    PIC

%union{
    char name[20];
    int numdata;
}

%%
/*Gramatica del codigo*/
prog:
    stmts
    ;
    stmt:
        STRING{
            printf("Hola a ti tambien %s", $l);
        }
        | NUM{
            printf("Eso es un numero");
        }
        | OTHER
    ;
    %%