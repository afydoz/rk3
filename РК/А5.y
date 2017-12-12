%{
	#include <stdio.h>
	#include <math.h>
	int yylex(void);
	void yyerror(char const *);
%}
%token MINUS FIRST SECOND TAB
%%
InputMessage: {printf("Enter the Line:\n");}
     | InputMessage Line
;
Line: TAB
    | error TAB {yyerrok; }
    | FIRST SECOND TAB 		printf("%d+%d\n", $1, $2);
    | MINUS FIRST SECOND TAB    printf("-(%d+%d)\n", $2, $3);
;

%%
void yyerror(char const *s){fprintf(stderr, "%s\n", s);}
int yywrap() { return 0; }
int main() { return yyparse(); }
