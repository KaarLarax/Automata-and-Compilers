%option nocaseless
%{
#include<stdio.h>
#include "y.tab.h"

extern YYSTYPE yylval;

int yywrap();

int yyerror(char* s);

%}
/* Definiciones de patrones */

%%

[0-9]+ {
    return NUMERO;
}

[+\-*/] {
    return OPERADOR;
}

[ \t\f\v\n]+  /* Ignorar espacios y saltos de línea */

. { printf("Carácter no reconocido: %s\n", yytext); }

%%

int yywrap() {
     return(1);
}

int yyerror(char* s) {
   fprintf(stderr, "%s\n", s);
   return 1;
}