%option noyywrap caseless
%{
#include<stdio.h>
#include<string.h>

int resultados[9] = {0}; // Inicializar todos los contadores en 0
int cantidadMaximaApariciones = 0;
char sentimientoPredominante[30]; // Nombre del sentimiento dominante

void calculo(char* p, int x) {
	if (x > cantidadMaximaApariciones) {
		cantidadMaximaApariciones = x;
		strcpy(sentimientoPredominante, p);
	}
}
extern FILE *yyin; 
%}

%%

(amor|querer|amar|cariño|ternura|admiración|afecto) { calculo("amor", ++resultados[0]); }
(alegría|feliz|contento|entusiasmo|risa|euforia|placer) { calculo("alegria", ++resultados[1]); }
(esperanza|optimismo|confianza|ilusión|motivación|inspirador) { calculo("esperanza", ++resultados[2]); }
(éxito|logro|triunfo|superación|avance|ganar|orgullo) { calculo("éxito", ++resultados[3]); }
(tristeza|llanto|soledad|vacío|desesperanza|perdido|dolor) { calculo("tristeza", ++resultados[4]); }
(miedo|temor|angustia|inseguridad|pánico|horror|amenaza) { calculo("miedo", ++resultados[5]); }
(enojo|ira|odio|rabia|resentimiento|frustración|venganza) { calculo("enojo", ++resultados[6]); }
(derrota|fracaso|decepción|perdida|humillación|rendirse) { calculo("derrota", ++resultados[7]); }
(cambio|duda|destino|misterio|sorpresa) { calculo("neutral", ++resultados[8]); }

. ; // Ignorar cualquier otro caracter
\n ; // Ignorar saltos de línea

%%

void mostrarResultados() {
	char *sentimientos[] = {
		"Amor", "Alegria", "Esperanza", "Exito", "Tristeza",
		"Miedo", "Enojo", "Derrota", "Neutral"
	};

	printf("\nResultados:\n");
	int i;
	for (i = 0; i < 9; i++) {

		printf("%s: %d apariciones\n", sentimientos[i], resultados[i]);
	}
	printf("\nEl sentimiento que predomina en el texto es %s con %d apariciones.\n", sentimientoPredominante, cantidadMaximaApariciones);
}

int main() {
	yyin = fopen("input.txt", "r");
	if (yyin == NULL) {
		printf("Error al abrir el archivo.\n");
		return 1;
	}
	yylex();
	mostrarResultados();

	fclose(yyin);
	return 0;
}
