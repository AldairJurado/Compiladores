/*Cabeceras de C (declaracion de funciones y variables)*/
%{
    #include <stdio.h>
    #include "Grammar.tab.h"
    void showError();
    
%}
/*Expresiones regulares*/

numbers ([0-9])+  /*acepta numeros de uno o mas digitos*/
alpha ([a-zA-Z])+ /*acepta el alfabeto*/
id {L}({L}|{D})* /*Si se encuentra un caracter seguido de mas caracteres o numeros */
/*Especificacion de Tokens*/
%%
{id}}       {sscanf(yytext,"%s,yylval.value");return(ID);}  /*Si se encuentra un caracter seguido de mas caracteres o numeros */
"else"      {sscanf(yytext,"%s,yylval.value");return(ELSE);}
"for"       {sscanf(yytext,"%s,yylval.value");return(FOR);}
"while"     {sscanf(yytext,"%s,yylval.value");return(WHILE);}
"int"       {sscanf(yytext,"%s,yylval.value");return(INT);}
"char"      {sscanf(yytext,"%s,yylval.value");return(CHAR);}
"string"    {sscanf(yytext,"%s,yylval.value");return(CADENA);}    
"{"         {sscanf(yytext,"%s,yylval.value");return('{');}
"}"         {sscanf(yytext,"%s,yylval.value");return('}');}
","         {sscanf(yytext,"%s,yylval.value");return(',');}
":"         {sscanf(yytext,"%s,yylval.value");return(':');}
"("         {sscanf(yytext,"%s,yylval.value");return('(');}
")"         {sscanf(yytext,"%s,yylval.value");return(')');}
"["         {sscanf(yytext,"%s,yylval.value");return('[');}
"]"         {sscanf(yytext,"%s,yylval.value");return(']');}
"+"         {sscanf(yytext,"%s,yylval.value");return(SUM);}
"-"         {sscanf(yytext,"%s,yylval.value");return(RES);}
"*"         {sscanf(yytext,"%s,yylval.value");return(MUL);}
"/"         {sscanf(yytext,"%s,yylval.value");return(DIV);}
"^"         {sscanf(yytext,"%s,yylval.value");return('^');}
"!"         {sscanf(yytext,"%s,yylval.value");return('!');}
";"         {sscanf(yytext,"%s,yylval.value"),return(';');}
"="         {sscanf(yytext,"%s,yylval.value");return('=');}
"+="        {sscanf(yytext,"%s,yylval.value");return(COMPSUM);}
"-="        {sscanf(yytext,"%s,yylval.value");return(COMPRES);}
"*="        {sscanf(yytext,"%s,yylval.value");return(COMPMUL);}
"/="        {sscanf(yytext,"%s,yylval.value");return(COMPDIV);}
">"         {sscanf(yytext,"%s,yylval.value");return('>');}
"<"         {sscanf(yytext,"%s,yylval.value");return('<');}
"++"        {sscanf(yytext,"%s,yylval.value");return(INCRE);}
"--"         {sscanf(yytext,"%s,yylval.value");return(DECRE);}
"&&"         {sscanf(yytext,"%s,yylval.value");return(AND);}
"||"         {sscanf(yytext,"%s,yylval.value");return(OR);}
">="         {sscanf(yytext,"%s,yylval.value");return(MAYIG);}
"<="         {sscanf(yytext,"%s,yylval.value");return(MENIG);}
"=="         {sscanf(yytext,"%s,yylval.value");return(IGUAL);}
"!="         {sscanf(yytext,"%s,yylval.value");return(DIF);}
">>"		 {sscanf(yytext,"%s,yylval.value")); return(OPDER); }
"<<"		 {sscanf(yytext,"%s,yylval.value")); return(OPIZQ); }
"?"			 {sscanf(yytext,"%s,yylval.value")); return('?'); }
"|"			 {sscanf(yytext,"%s,yylval.value"); return('|'); }
.           {showError(); return(OTHER);}

%%

/*Funciones*/
void showError(){
    printf("Otra entrada");
}