%{
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
\*          { return MULT; }
\n          { return '\n'; }
[ \t]+      { /* ignorar espacios */ }
.           { return yytext[0]; }

%%

int yywrap() {
    return 1;
}