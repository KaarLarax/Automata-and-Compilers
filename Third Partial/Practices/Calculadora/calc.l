%{
#include "calc.tab.h"
#include <math.h>
%}

digit   [0-9]
%%
{digit}+(\.{digit}+)?    { yylval.fval = atof(yytext); return NUM; }
"^"                     { return POW; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
"sin"                   { return SIN; }
"cos"                   { return COS; }
"tan"                   { return TAN; }
[ \t\n]+                { /* ignorar espacios */ }
.                       { printf("Carácter inválido: %s\n", yytext); }

%%
int yywrap() { return 1; }
