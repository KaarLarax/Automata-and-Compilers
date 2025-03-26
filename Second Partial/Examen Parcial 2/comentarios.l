%option noyywrap caseless
%{
#include "y.tab.h"
#include<stdio.h>
#include<string.h>
%}

%%
\/\/.*        { return COMENTARIO1; }
\/\*([^*]|\*+[^*/])*\*+\/   { return COMENTARIO2; }
\n ;
. ;
%%