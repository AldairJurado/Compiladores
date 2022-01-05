%{
    #include <stdio.h>
    int yylex();
    int yyerror(chat *s);

%}

%union{
    char *value;
    int numdata;
}

%token <value>'=' SUM RES MUL DIV POT '>' '<' INCRE DECRE AND OR MAYIG MENIG IGUAL DIF
%token <value>COMPSUM COMPRES COMPMUL COMPDIV OPDER OPIZQ
%token <value> '{' '}' ',' ':' '(' ')' ';' '[' ']' '?' '|' '^'

%token <value>CHAR INT CADENA ID
%token <value>IF FOR ELSE WHILE


%type <value> TRADUCCION 
%type <value> EXPPRIM
%type <value> OPERADOR_COMPUESTO
%type <value> EXP
%type <value> OP
%type <value> TIPO
%type <value> ASIGNACION
%type <valor> NOMTIPO
%type <valor> LISTEXP
%type <valor> EXPOP
%type <valor> EXPCAST
%type <valor> EXPCAST
%type <valor> RELACIONAL
%type <valor> ASIGNACION
%type <valor> EXPCOND
%type <valor> EXPOR
%type <valor> EXPORAND
%type <valor> EXPORINCL
%type <valor> OPASIGN
%type <valor> EXPOREXCL
%type <valor> OPASIGN
%type <valor> EXP
%type <valor> EXPIGUALDAD
%type <valor> EXPREL
%type <valor> EXPCAMBIO
%type <valor> EXPAD
%type <valor> EXPMUL
/*Gramatica del codigo*/

%start TRADUCCION
%%
/*Gramatica del codigo*/
EXPRIM
    :ID {$$ = $1;}
    |CADENA {$$ = $1;}
    | '(' EXP ')' {$$=$2;}
    ;
OP
	: SUM	{$$=$1;}
	| MUL	{$$=strdup($1);}
	| RES	{$$=$1;}
	| DIV	{$$=$1;}
	| NEG	{$$=$1;}
	;
TIPO
	: INT		{$$=$1;}
	| CHAR 		{$$=$1;}
	;
OPERADOR_COMPUESTO
	: EXPRIM {$$ = $1;}
	| EXPRIM '(' ')' 			{strcat($1,"()");$$ = $1;}
    | EXPRIM  '[' EXP']'	{strcat($1,"[");strcat($1,$3);strcat($1,"]");$$=$1;}
	| EXPRIM '(' LISTEXP ')'		{strcat($1,"(");strcat($1,$3);strcat($1,")");$$=$1;}
	| EXPRIM '.' ID   	{strcat($1,".");strcat($1,$3);$$=$1;}
    | EXPRIM DECRE	{strcat($1," ");strcat($1,$2);$$=$1;}
	| EXPRIM INCRE	{strcat($1," ");strcat($1,$2);$$=$1;}

	;
LISTEXP
	: ASIGNACION {$$ =$1;}
	| LISTEXP ',' ASIGNACIONn	{strcat($1,", ");strcat($1,$3);$$=$1;}
	;
EXPOP
    : OPERADOR_COMPUESTO	{$$ = $1;}
	| INCRE EXPOP	{strcat($1," ");strcat($1,$2);$$=$1;}
	| DECRE EXPOP	{strcat($1," ");strcat($1,$2);$$=$1;}
	| OP EXPCAST 	{strcat($1," ");strcat($1,$2);$$=$1;}
EXPCAST 
	: EXPOP {$$=$1;}
	| '(' NOMTIPO ')' EXPCAST  {strcat($1,$2);strcat($1,$3);strcat($1,$4);$$=$1;}
	;
ASIGNACION
	: EXPCOND	{$$=$1;}
	| EXPOP OPASIG ASIGNACION {strcat($1,$2);strcat($1,$3);$$=$1;}
	;
EXPCOND
	: EXPOR 	{$$=$1;}
	| EXPOR '?' EXP ':' EXPCOND 	{strcat($1," ");strcat($1,$2);$$=$1;}
	;
EXPOR
	: EXPAND 	{$$=$1;}
	| EXPOR OR EXPORAND 	{strcat($1,$2);strcat($1,$3);$$=$1;}
	;
EXPORAND
	: EXPORINCL	{$$=$1;}
	| EXPORAND AND EXPORINCL	{strcat($1,$2);strcat($1,$3);$$=$1;}
	;
EXPORINCL
	: EXPOREXCL {$$=$1;}
	| EXPOREXCL '|' EXPOREXCL {strcat($1," | ");strcat($1,$3);$$=$1;}
	;  
EXPOREXCL
	: EXPAND {$$=$1;}
	| EXPOREXCL '^' EXPORAND 	{strcat($1," ^ ");strcat($1,$3);$$=$1;}
	;  
OPASIGN
	: '=' {$$ =$1;}
	| COMPDIV 	{$$=$1;}
	| COMPSUM 	{$$=$1;}
	| COMPRES 	{$$=$1;}
	| COMPMUL   {$$=$1;}
	;
EXP
	: ASIGNACION	{$$=$1;}
	| EXP ',' ASIGNACION	{strcat($1,", ");strcat($1,$3);$$=$1;}
	;   
EXPIGUALDAD
	: EXPREL	{$$ = $1;}
	| EXPIGUALDAD IGUAL EXPREL 	{strcat($1,$2);strcat($1,$3);$$=$1;}
	| EXPIGUALDAD DIF EXPREL 	{strcat($1,$2);strcat($1,$3);$$=$1;}
	;  
EXPREL
	: EXPCAMB 	{$$=$1;}
	| EXPREL '<' EXPCAMB 	{strcat($1,$2);strcat($1,$3);$$=$1;}
	| EXPREL '>' EXPCAMB 	{strcat($1,$2);strcat($1,$3);$$=$1;}
	| EXPREL MENIG EXPCAMB 	{strcat($1,$2);strcat($1,$3);$$=$1;}
	| EXPREL MAYIG EXPCAMB 	{strcat($1,$2);strcat($1,$3);$$=$1;}
	;  
EXPCAMBIO
	: EXPAD 	{$$=$1;}
	| EXPCAMBIO OPIZQ EXPAD 	{strcat($1,$2);strcat($1,$3);$$=$1;}
	| EXPCAMBIO OPDER EXPAD  	{strcat($1,$2);strcat($1,$3);$$=$1;}
	;  
EXPAD
	: EXPMUL {$$=$1;}
	| EXPAD '+' EXPMUL 	{strcat($1," + ");strcat($1,$3);$$=$1;}
	| EXPAD '-' EXPMUL 	{strcat($1," - ");strcat($1,$3);$$=$1;}
	;
EXPMUL
	: EXPCAST	{$$=$1;}
	| EXPMUL '*' EXPCAST	{strcat($1," * ");strcat($1,$3);$$=$1;}
	| EXPMUL '/' EXPCAST 	{strcat($1," / ");strcat($1,$3);$$=$1;}
	;           
    %%