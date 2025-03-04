%option noyywrap
%{
#include <stdio.h>
%}

%%
[a-z]*ae[a-z]*   { printf("TOKEN: Palabra con 'ae': %s\n", yytext); }
[a-z]*ai[a-z]*   { printf("TOKEN: Palabra con 'ai': %s\n", yytext); }
[a-z]*ao[a-z]*   { printf("TOKEN: Palabra con 'ao': %s\n", yytext); }
[a-z]*au[a-z]*   { printf("TOKEN: Palabra con 'au': %s\n", yytext); }

(00[01]*)|([01]*00) { printf("TOKEN: Palabra binaria iniciando o terminando con '00': %s\n", yytext); }

[0-9]+          { printf("TOKEN: Número entero: %s\n", yytext); }
[0-9]+\.[0-9]+  { printf("TOKEN: Número decimal: %s\n", yytext); }

class           { printf("TOKEN: Palabra reservada de Java: %s\n", yytext); }
public          { printf("TOKEN: Palabra reservada de Java: %s\n", yytext); }
static          { printf("TOKEN: Palabra reservada de Java: %s\n", yytext); }
void            { printf("TOKEN: Palabra reservada de Java: %s\n", yytext); }
return          { printf("TOKEN: Palabra reservada de Java: %s\n", yytext); }

[A-Z][a-z]*     { printf("TOKEN: Nombre propio: %s\n", yytext); }

[ \t\n]         { /* Ignorar espacios, tabulaciones y saltos de línea */ }

.               { printf("TOKEN NO RECONOCIDO: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}

