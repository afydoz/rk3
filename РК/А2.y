/* 
 * Q1 - EE
 * Q2 - EO
 * Q3 - OE- desired state
 * Q4 - OO
*/

%{
#include <stdio.h>
int yylex();
int yyerror(char const* );
%}

%token ONE ZERO 
%%
input: { printf ("enter the number\n"); }
     | input line

line:       '\n' { printf ("empty line\n"); }
    | error '\n' { yyerrok; }
    | Q3    '\n' { printf("correct\n"); }

Q1: Q2 ONE 
	| Q3 ZERO

Q2: ONE  
	| Q1 ONE
  | Q4 ZERO

Q3: ZERO   
	| Q1 ZERO
	| Q4 ONE  

Q4: Q2 ZERO 
	| Q3 ONE  
	 
%%
int main () {
	return yyparse();
}

int yylex () {
	int c = getchar();
	if ( c == '1' )
		return ONE;
	if ( c == '0' )
		return ZERO;
	if ( c == EOF )
		return 0;
  return c;
}
int yyerror (char const *s) {
	fprintf(stderr,"%s\n",s);
	return 0;
}
