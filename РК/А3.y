%{
#include <stdio.h>
int yylex();
int yyerror();
%}
%%
exp: eo'\n' {return 0;};
oo: '1'oe
	|'0'eo ;
oe: '1'oo
	|'0'ee
	|'0' ;
eo: '1'ee
	|'0'oo
	|'1' ;
ee: '1'eo
	|'0'oe ;
%%
int yylex() {
	int c=getchar();
	return c;
}
int yyerror () {
	printf("Incorrect\n");
	return 1;
}
int main (int argc, char* argv[]) {
	int res;
	if ((res=yyparse())==0)
		puts("Correct binset");
	return res;
}
