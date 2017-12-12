%{
#include <stdio.h>
char *mas[] = {"Correct", "Incorrect"};
%}
%%
S: C '\n' {return 0;}

C: T '1'
|F '0'

T: '1'
|T '1'
|F '0'

F: F '1'
|T '0'

C: '1' T
| '0' F

T: '1'
| '1' T
| '0' F

F: '1' F {return 1;}
| '0' T

%%
int yylex()
{
	return(getchar());
}

int yyerror(char *s)
{
	printf("%s", s);
}

int main() {
	int ret = yyparse();
	printf("%s bin set\n", mas[ret]);
	return ret;
	}