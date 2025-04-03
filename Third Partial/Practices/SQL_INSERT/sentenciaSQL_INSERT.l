%{
    #include <stdio.h>
    #include "y.tab.h"
    
    extern YYSTYPE yylval;
    
    int yywrap();
    
    int yyerror(char* s);
%}

%%
[ \t\n]+      ; // Ignorar espacios y saltos de línea
INSERT         return INSERT;
INTO           return INTO;
VALUES         return VALUES;
[a-zA-Z_][a-zA-Z0-9_]*  return IDENTIFIER;
\(             return LPAREN;
\)             return RPAREN;
,              return COMMA;
[0-9]+         return NUMBER;
'[^']*'        return STRING;
;              return SEMICOLON;
.              return yytext[0];

%%

int yywrap() {
    return 1;
}