
%{
#include <stdio.h>
int yylex();
int yyerror(char const* );
%}

%token ONE ZERO 
%%
input: { printf ("enter the number:\n"); }
     | input line

line:       '\n' { printf ("empty line\n"); }
    | error '\n' { yyerrok; }
    | OO    '\n' { printf("correct one\n"); }




EE:  ONE EO
	| ZERO OE

EO: ONE  
	| ONE EE
  | ZERO OO

OE: ZERO   
	| ZERO EE
	| ONE OO  

OO:  ZERO EO 
	| ONE OE
	 
%%
int main () 
{
	return yyparse();
}

int yylex () 
{
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
