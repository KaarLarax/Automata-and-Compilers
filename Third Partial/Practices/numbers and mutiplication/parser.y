%{
  #include <stdio.h>
  #include <stdlib.h>

  int yylex(void);
  void yyerror(const char *s);
%}

%union {
    float fval;
}

%token <fval> REAL ENTERO
%token MULTIPLICACION

%type <fval> num expresion

%%
expresion:
    num MULTIPLICACION num {
        printf("Resultado: %.2f\n", $1 * $3);
    }
;

num:
    ENTERO
  | REAL
;

%%

void yyerror(const char *s) {
    printf("Error de sintaxis: %s\n", s);
}

int main() {
    printf("Ingresa una multiplicación (ej. 45 * 12.3): ");
    yyparse();
    return 0;
}