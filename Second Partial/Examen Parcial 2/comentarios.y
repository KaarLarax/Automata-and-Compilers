%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s);
%}

%token COMENTARIO1 COMENTARIO2

%%
input:
    comentarios
    ;

comentarios:
    comentario
    | comentarios comentario
    ;

comentario:
    COMENTARIO1 { printf("Comentario de una linea encontrado.\n"); }
    | COMENTARIO2 { printf("Comentario de multiples lineas encontrado.\n"); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyin = fopen("input.txt", "r");
    if (!yyin) {
        printf("Error al abrir el archivo.\n");
        return 1;
    }

    yyparse();

    fclose(yyin);
    return 0;
}