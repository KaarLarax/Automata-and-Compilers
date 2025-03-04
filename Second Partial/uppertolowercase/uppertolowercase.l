%option noyywrap
%{
#include<stdio.h>
#include<string.h>

%}
/* Definiciones de patrones */

%%

[A-Z]+ {
    int i = 0;
    for (i = 0; i < strlen(yytext); i++) {
        printf("%c", (yytext[i] + 32));
    }
    printf("\n");
}

. ; // Ignorar cualquier otro caracter
\n ; // Ignorar saltos de línea

%%

int main() {
	yylex();
	return 0;
}