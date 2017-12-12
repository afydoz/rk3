%{
#include <stdio.h>
char* mas[]={"Correct","Incorrect"};
%}
%START ODDODD ODDEVEN EVENODD EVENEVEN
%%
<EVENEVEN>0	BEGIN ODDEVEN;
<EVENEVEN>1	BEGIN EVENODD;
<EVENEVEN>\n	return 1;

<ODDODD>0	BEGIN EVENODD;
<ODDODD>1	BEGIN ODDEVEN;
<ODDODD>\n	return 1;

<ODDEVEN>1	BEGIN ODDODD;
<ODDEVEN>0	BEGIN EVENEVEN;
<ODDEVEN>\n	return 1;

<EVENODD>0	BEGIN ODDODD;
<EVENODD>1	BEGIN EVENEVEN;
<EVENODD>\n	return 0;

0		BEGIN ODDEVEN;
1		BEGIN EVENODD;
.|\n	return 1;
%%
int main()
{
	int result = yylex();
	printf("%s\n", mas[result]);
	return result;
}
