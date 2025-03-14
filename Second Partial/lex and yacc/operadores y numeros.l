%option noyywrap nocaseless
%{
#include<stdio.h>
#include<string.h>

%}
/* Definiciones de patrones */

%%

[a-zA-Z0-9._%+-]+@uaeh.edu.mx {
    printf("Correo valido: %s\n", yytext);
}

. ; // Ignorar cualquier otro caracter
\n ; // Ignorar saltos de línea

%%

int main() {
	yylex();
    printf("hola");
	return 0;
}