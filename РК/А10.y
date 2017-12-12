%{
#include<stdio.h>
int yylex(void);
int yyerror(char const *);
%}

%%
S: CORRECT '\n' {puts("Correct bin set"); return 0;}

CORRECT: LAST_ONE
|LAST_ZERO

LAST_ONE: '1' '1' LAST_ZERO 
|'1' '1'

LAST_ZERO: '0' '0' LAST_ONE 
|'0' '0'

%%
int yylex()
{
return(getchar());
}
int yyerror(char const *s)
{
printf("%s\n",s);
return(1);
}
int main()
{
return (yyparse());
}