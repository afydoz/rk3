%{
#include<stdio.h>
char* mas[]={"Correct","Incorrect"};
%}
%%
S: CORRECT '\n' {return 0;}
;
CORRECT: T '0'
	   | F '1'
;

T : '0'
  | T '0' 
  | F '1'
;

F : '1'
  | F '0'
  | T '1'
;

%%
int yylex()
{
	return(getchar());
}
int yyerror(char *s)
{
	printf("%s\n",s);
	return(1);
}
int main(int argc, char *argv[])
{
	int ret=yyparse();
    printf("%s Bin set\n",mas[ret]);
	return (ret);
}
