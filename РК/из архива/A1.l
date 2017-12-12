%option noyywrap
%start T F0 F1 F01
%{
	//чётное число нулей и единиц
	//F0 - нужен ноль для перехода в T, F1 - нужна единица, F01 - нужно и то, и другое
	#include <stdio.h>
	char *mes[] = {"Correct", "Incorrect"};
%}
%%
<F0>[^01\n] return 1;
<F0>0 BEGIN T;
<F0>1 BEGIN F01;
<F0>\n return 1;

<F1>[^01\n] return 1;
<F1>1 BEGIN T;
<F1>0 BEGIN F01;
<F1>\n return 1;

<F01>[^01\n] return 1;
<F01>1 BEGIN F0;
<F01>0 BEGIN F1;
<F01>\n return 1;

<T>[^01\n] return 1;
<T>\n return 0;
<T>1 BEGIN F1;
<T>0 BEGIN F0;

0 BEGIN F0;
1 BEGIN F1;
.|\n return 1;
%%
int main(int argc, char *argv[])
{
	int ret = yylex();
	printf("%s bin set\n", mes[ret]);
	return ret;
}