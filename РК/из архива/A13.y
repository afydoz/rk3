%{
#include<stdio.h>
%}
%%
S: CORRECT '\n' {return 0;};
CORRECT: LAST_ONE '0'
|LAST_ZERO '1'
LAST_ONE: LAST_ZERO '1'
|'1'
| LAST_ONE '1'
LAST_ZERO: LAST_ZERO '0'
|'0'
| LAST_ONE '0'
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
int ret;
if((ret=yyparse())==0)
puts("Correct bin set");
return (ret);
}