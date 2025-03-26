%option noyywrap
%{
    #include <stdio.h>
    extern FILE *yyin;
%}
%%
[a-zA-Z]+ { printf("Text: %s\n", yytext); }
[0-9]+ { printf("Number: %s\n", yytext); }
[+\-*/] { printf("Operator: %s\n", yytext); }
[ ]+ { printf("Empty space: %s\n", yytext); }
\n { printf("New line detected\n"); }
. { printf("Unknown: %s\n", yytext); }
%%
 int main() {
    yyin = fopen("./input.txt", "r");
    if (yyin == NULL) {
		printf("Error al abrir el archivo.\n");
		return 1;
	}
    yylex();
    fclose(yyin);
    return 0;
}