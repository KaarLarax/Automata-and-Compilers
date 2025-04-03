%{
    #include <stdio.h>
    #include <stdlib.h>
    
    void yyerror(const char *s);

    int yylex(void);
%}

%token INSERT INTO VALUES IDENTIFIER LPAREN RPAREN COMMA NUMBER STRING SEMICOLON

%%

stmt: INSERT INTO IDENTIFIER LPAREN column_list RPAREN VALUES LPAREN value_list RPAREN SEMICOLON
    { printf("Instrucción SQL válida\n"); }
    ;

column_list: IDENTIFIER
           | column_list COMMA IDENTIFIER
           ;

value_list: value
          | value_list COMMA value
          ;

value: NUMBER
     | STRING
     ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Ingrese una instrucción INSERT INTO SQL:\n");
    yyparse();
    return 0;
}