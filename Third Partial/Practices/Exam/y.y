%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(const char *s);
%}

%token NUMBER
%token MULT

%%

line:
    expr '\n' { printf("Expresión válida.\n"); }
  | '\n'      { /* Ignorar líneas vacías */ }
  ;

expr:
    NUMBER MULT NUMBER { printf("Multiplicación válida: %d * %d\n", $1, $3); }
  | error              { 
        printf("Error en la expresión. Cerrando el programa.\n"); 
        exit(1);  // Salir del programa en caso de error
    }
  ;

%%

int main() {
    printf("Ingrese una expresión:\n");
    if (yyparse() != 0) {
        printf("Error al analizar la entrada. Cerrando el programa.\n");
        return 1;
    }
    return 0;
}

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}