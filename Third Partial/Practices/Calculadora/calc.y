%{
#include <stdio.h>
#include <math.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
    double fval;
}

%token <fval> NUM
%token SIN COS TAN
%token POW
%token LPAREN RPAREN

%type <fval> expr

%%
input:
    expr    { 
                printf("Operación: \n");
                printf("Resultado: %.6f\n", $1); 
            }
    ;

expr:
      NUM                           { $$ = $1; }
    | SIN LPAREN expr RPAREN       { $$ = sin($3); }
    | COS LPAREN expr RPAREN       { $$ = cos($3); }
    | TAN LPAREN expr RPAREN       { $$ = tan($3); }
    | expr POW expr                { $$ = pow($1, $3); }
    | LPAREN expr RPAREN           { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
