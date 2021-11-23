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
{alpha}     {return(STRING);}
{numbers}   {return(NUM);}
";"         {return(SEMICOLON);}
.           {showError(); return(OTHER);}

%%

/*Funciones*/
void showError(){
    printf("Otra entrada");
}