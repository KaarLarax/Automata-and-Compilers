%option noyywrap caseless
%{
	#include<stdio.h>
	#include<string.h>

	// Contadores de personajes
	int harry = 0, hermione = 0, ron = 0, dumbledore = 0, voldemort = 0, snape = 0;
	int hagrid = 0, draco = 0, sirius = 0, neville = 0, ginny = 0, luna = 0;

	// Variables para el calculo del personaje con mas apariciones
	int maximo = 0;
	char personajePrincipal[30]; // Para almacenar el nombre del personaje con mas apariciones

	// Funcion para calcular el personaje con mas apariciones
	void calculo(char* p, int x) {
		if (x > maximo) {
			maximo = x;
			strcpy(personajePrincipal, p); // Actualizamos el personaje principal
		}
	}

	extern FILE *yyin;
%}

%%

[hH]arry { harry++; calculo("Harry", harry); }
[hH]ermione { hermione++; calculo("Hermione", hermione); }
[rR]on { ron++; calculo("Ron", ron); }
[dD]umbledore { dumbledore++; calculo("Dumbledore", dumbledore); }
[vV]oldemort { voldemort++; calculo("Voldemort", voldemort); }
[sS]nape { snape++; calculo("Snape", snape); }
[hH]agrid { hagrid++; calculo("Hagrid", hagrid); }
[dD]raco { draco++; calculo("Draco", draco); }
[sS]irius { sirius++; calculo("Sirius", sirius); }
[nN]eville { neville++; calculo("Neville", neville); }
[gG]inny { ginny++; calculo("Ginny", ginny); }
[lL]una { luna++; calculo("Luna", luna); }

. { /* Consumir cualquier otro caracter */ }
\n { /* Consumir saltos de línea */ }

%%

int main()
{
	yyin = fopen("./input.txt", "r");
	if (yyin == NULL) {
		printf("Error al abrir el archivo.\n");
		return 1;
	}
	yylex();

	// Mostrar los resultados
	printf("Apariciones de los personajes de Harry Potter:\n");
	printf("Harry: %d\n", harry);
	printf("Hermione: %d\n", hermione);
	printf("Ron: %d\n", ron);
	printf("Dumbledore: %d\n", dumbledore);
	printf("Voldemort: %d\n", voldemort);
	printf("Snape: %d\n", snape);
	printf("Hagrid: %d\n", hagrid);
	printf("Draco: %d\n", draco);
	printf("Sirius: %d\n", sirius);
	printf("Neville: %d\n", neville);
	printf("Ginny: %d\n", ginny);
	printf("Luna: %d\n", luna);

	// Mostrar el personaje que mas aparece
	printf("El personaje que mas aparece es: %s con %d apariciones.\n", personajePrincipal, maximo);

	fclose(yyin);
	return 0;
}
