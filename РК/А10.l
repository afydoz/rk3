%option noyywrap
%start LAST_ZERO LAST_ONE
%{
//пары из нулей и единиц чередуются друг с другом
#include <stdio.h>
char *mes[] = {"Correct", "Incorrect"};
%}
%%
<LAST_ZERO>11 BEGIN LAST_ONE;
<LAST_ZERO>11\n return 0;
<LAST_ZERO>00 return 1;

<LAST_ONE>00 BEGIN LAST_ZERO;
<LAST_ONE>00\n return 0;
<LAST_ONE>11 return 1;

00 BEGIN LAST_ZERO;
11 BEGIN LAST_ONE; 
00\n return 0;
11\n return 0;
.|\n return 1;
%%
int main(int argc, char *argv[])
{
int ret = yylex();
printf("%s bin set\n", mes[ret]);
return ret;
}
