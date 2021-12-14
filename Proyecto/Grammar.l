/*Cabeceras de C (declaracion de funciones y variables)*/
%{
    #include <stdio.h>
    #include "Grammar.tab.h"
    void showError();
    
%}
/*Expresiones regulares*/

numbers([0-9])+  /*acepta numeros de uno o mas digitos*/
alpha([a-zA-Z])+ /*acepta el alfabeto*/

/*Especificacion de Tokens*/
%%
 
{numbers}   {yylval.numdata = atoi(yytext); return(NUM);} /*pasa algo similar a arriba,solo que convierte el texto a un numero entero*/
"if"        {sscanf(yytext,"%s,yylval.value");return(IF);}/*la primera funcion tomara el valor de la cadena y agregara ese valor a la otra cadena nt: yytext es el nombre de la variable que se tiene cuando se ingresa una cadena en el compilador*/
"else"      {sscanf(yytext,"%s,yylval.value");return(FOR);}
"for"       {sscanf(yytext,"%s,yylval.value");return(FOR);}
"while"     {sscanf(yytext,"%s,yylval.value");return(WHILE);}
"int"       {sscanf(yytext,"%s,yylval.value");return(INT);}
"char"      {sscanf(yytext,"%s,yylval.value");return(FOR);}

"{"         {sscanf(yytext,"%s,yylval.value");return(LLAVABRE);}
"}"         {sscanf(yytext,"%s,yylval.value");return(LLAVCIERRA);}
","         {sscanf(yytext,"%s,yylval.value");return(COMA);}
":"         {sscanf(yytext,"%s,yylval.value");return(DOSPUNT);}
"("         {sscanf(yytext,"%s,yylval.value");return(PARENTAB);}
")"         {sscanf(yytext,"%s,yylval.value");return(PARENTCIERR);}
"+"         {sscanf(yytext,"%s,yylval.value");return(SUM);}
"-"         {sscanf(yytext,"%s,yylval.value");return(RES);}
"*"         {sscanf(yytext,"%s,yylval.value");return(MUL);}
"/"         {sscanf(yytext,"%s,yylval.value");return(DIV);}
"^"         {sscanf(yytext,"%s,yylval.value");return(POT);}
";"         {yytext,"%s,return(PUNTCOM);}
"="         {sscanf(yytext,"%s,yylval.value");return(ASIGNACION);}
"+="        {sscanf(yytext,"%s,yylval.value");return(COMPSUM);}
"-="        {sscanf(yytext,"%s,yylval.value");return(COMPRES);}
"*="        {sscanf(yytext,"%s,yylval.value");return(COMPMUL);}
"/="        {sscanf(yytext,"%s,yylval.value");return(COMPDIV);}
">"         {sscanf(yytext,"%s,yylval.value");return(MAYOR);}
"<"         {sscanf(yytext,"%s,yylval.value");return(MENOR);}
"++"        {sscanf(yytext,"%s,yylval.value");return(INCRE);}
"--"         {sscanf(yytext,"%s,yylval.value");return(DECRE);}
"&&"         {sscanf(yytext,"%s,yylval.value");return(AND);}
"||"         {sscanf(yytext,"%s,yylval.value");return(OR);}
">="         {sscanf(yytext,"%s,yylval.value");return(MAYIG);}
"<="         {sscanf(yytext,"%s,yylval.value");return(MENIG);}
"=="         {sscanf(yytext,"%s,yylval.value");return(IGUAL);}
"!="         {sscanf(yytext,"%s,yylval.value");return(DIF);}
.           {showError(); return(OTHER);}

%%

/*Funciones*/
void showError(){
    printf("Otra entrada");
}