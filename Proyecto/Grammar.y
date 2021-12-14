%{
    #include <stdio.h>
    int yylex();
    int yyerror(chat *s);

%}

%union{
    char *value;
    int numdata;
}

%token ASIGNACION SUM RES MUL DIV POT MAYOR MENOR INCRE DECRE AND OR MAYIG MENIG IGUAL DIF
%token COMPSUM COMPRES COMPMUL COMPDIV
%token LLAVABRE LLAVCIERRA COMA DOSPUNT PARENTAB PARENTCIERR PUNTCOM

%type <name>    STRING
%type <numbers> NUM
%type <name>    PIC



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