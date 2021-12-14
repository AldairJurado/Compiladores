%{
    #include <stdio.h>
    int yylex();
    int yyerror(chat *s);

%}

%union{
    char *value;
    int numdata;
}

%token <value>ASIGNACION SUM RES MUL DIV POT MAYOR MENOR INCRE DECRE AND OR MAYIG MENIG IGUAL DIF
%token <value>COMPSUM COMPRES COMPMUL COMPDIV
%token <value>LLAVABRE LLAVCIERRA COMA DOSPUNT PARENTAB PARENTCIERR PUNTCOM 

%token <value>CHAR INT CADENA ID
%token <value>IF FOR ELSE WHILE


%type <value> TRADUCCION 
%type <value> EXPPRIM
%type <value> OPERADOR_COMPUESTO
%type <value> EXP
%type <value> OP
%type <value> TIPO
/*Gramatica del codigo*/

%start TRADUCCION
%%
/*Gramatica del codigo*/
EXPRIM
    :ID {$$ = $1;}
    |CADENA {$$ = $1;}
    | PARENTAB EXP PARENTCIERR {$$=$2;}
    ;
OP
	: SUM	{$$=$1;}
	| MUL	{$$=strdup($1);}
	| RES	{$$=$1;}
	| DIV	{$$=$1;}
	| POT	{$$=$1;}
	| NEG	{$$=$1;}
	;
TIPO
	: INT		{$$=$1;}
	| CHAR 		{$$=$1;}
	;
    %%