/*Cabeceras de C (declaracion de funciones y variables)*/
%{
    #include <stdio.h>
    #include "test.tab.h"
    void showError();
    
%}
/*Expresiones regulares*/

numbers([0-9])+
alpha([a-zA-Z])+ /*acepta el alfabeto*/

/*Especificacion de Tokens*/
%%
{alpha}     {sscanf(yytext,"%s,yylval.name");return(STRING);} /*la primera funcion tomara el valor de la cadena y agregara ese valor a la otra cadena nt: yytext es el nombre de la variable que se tiene cuando se ingresa una cadena en el compilador*/
{numbers}   {yylval.numdata = atoi(yytext); return(NUM);} /*pasa algo similar a arriba,solo que convierte el texto a un numero entero*/
";"         {return(SEMICOLON);}
.           {showError(); return(OTHER);}

%%

/*Funciones*/
void showError(){
    printf("Otra entrada");
}