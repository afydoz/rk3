%option noyywrap
%start LAST_ZERO LAST_ONE
%{
	//двоичные наборы, которые заканчиваются парой различных разрядов
	#include <stdio.h>
	char *mes[] = {"Correct", "Incorrect"};
%}
%%
<LAST_ZERO>0\n return 1;
<LAST_ZERO>1\n return 0;
<LAST_ZERO>1 BEGIN LAST_ONE;
<LAST_ZERO>0 ;

<LAST_ONE>1\n return 1;
<LAST_ONE>0\n return 0;
<LAST_ONE>0 BEGIN LAST_ZERO;
<LAST_ONE>1 ;
0 BEGIN LAST_ZERO;
1 BEGIN LAST_ONE;
.|\n return 1;
%%
int main(int argc, char *argv[])
{
	int ret = yylex();
	printf("%s bin set\n", mes[ret]);
	return ret;
}