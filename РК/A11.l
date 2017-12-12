%start T F
%{
	#include <stdio.h>
	char *mes[] = {"Correct", "Incorrect"};
%}
%%

<T>0 ;			
<T>1 BEGIN F;		
<T>0\n return 0;

<F>0 return 1; 
<F>0\n return 1;
<F>1 BEGIN T;
<F>1\n return 0;

0 BEGIN T;
1 BEGIN F;
.|\n return 1;
%%
int main(int argc, char *argv[])
{
	int ret = yylex();
	printf("%s bin set\n", mes[ret]);
	return ret;
}
