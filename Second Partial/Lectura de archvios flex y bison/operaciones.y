%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;
%}

%token NUMBER OP SALTO

%%

input: 
  input expr
  | expr
  | error SALTO { 
    yyerrok; 
      printf("Error en la línea, se ignorará y continuará con la siguiente.\n");
  }
  ;

expr:
    term OP term { 
      int resultado = 0;
      float resultadoDivision = -900000000.00;
      if ($2 == '+') {
        puts("Suma");
        resultado = $1 + $3;
      } else if ($2 == '-') {
        puts("Resta");
        resultado = $1 - $3;
      } else if ($2 == '*') {
        puts("Multiplicacion");
        resultado = $1 * $3;
      } else {
        puts("Division");
        if ($3 == 0) {
          printf("Operacion invalida\n");
        } else {
          resultadoDivision = (float) $1 / (float) $3; 
        }
      }
      if (resultadoDivision != -900000000.00) {
        printf("Resultado: %f\n", resultadoDivision);
      } else if (resultado != 0) {
        printf("Resultado: %d\n", resultado); 
      } else {
        puts("Error de division entre 0");
      }
    }
  ;

term:
    NUMBER
  ;

%%

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Uso: %s <archivo>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error al abrir el archivo");
        return 1;
    }

    yyin = file;
    yyparse();
    fclose(file);

    return 0;
}

int yyerror(const char *s) {
    printf("Error de sintaxis: %s\n", s);
    return 0;
}
