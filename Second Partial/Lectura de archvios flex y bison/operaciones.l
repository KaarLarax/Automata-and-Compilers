%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

DIGIT [0-9]
OPERATOR [+*/\-]
SALTO [\n]

%%

{DIGIT}+    { yylval = atoi(yytext); return NUMBER; }
{OPERATOR}  { yylval = yytext[0]; return OP; }
{SALTO}  {return SALTO;} 
. ;

%%

int yywrap() {
    return 1;  // Indica que no hay más entradas
}
