%START K
%{
#include<stdio.h>
#include<math.h>
#include"y.tab.h"
extern int yylval;
%}

%%
[ \t\n] return TAB;
[-] return MINUS;
[0-9]+/\.[0-9]+ {yylval=atoi(yytext); BEGIN K; return FIRST;}
<K>[0-9]+ {yylval=atoi(yytext); BEGIN 0; return SECOND;}
. ;
