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

[(\-)+/*] {
    return OPERADOR;
}

[ \t\f\v] ;

. { return *yytext; }

%%

int yywrap() {
     return(1);
}

int yyerror(char* s) {
   fprintf(stderr, "%s\n", s);
   return 1;
}