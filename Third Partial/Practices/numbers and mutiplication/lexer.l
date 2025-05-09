%option noyywrap
%{
  #include "y.tab.h"
%}

%%
[0-9]+\.[0-9]+    { yylval.fval = atof(yytext); return REAL; }
[0-9]+            { yylval.fval = atof(yytext); return ENTERO; }
\*                { return MULTIPLICACION; }
[ \t\n]+          { /* ignorar espacios */ }
.                 { printf("Carácter no válido: %s\n", yytext); }
%%
