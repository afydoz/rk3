%start F E D C B A nine eight seven six five four three two one nul
%{
#include <stdio.h>
char *mes[] = {"Correct", "Incorrect"};
%}
%%
<F>[F]+\n BEGIN F;
<E>[EF]+\n BEGIN E;
<D>[D-F]+\n BEGIN D;
<C>[C-F]+\n BEGIN C;
<B>[B-F]+\n BEGIN B;
<A>[A-F]+\n BEGIN A;
<nine>[9A-F]+\n BEGIN nine;
<eight>[89A-F]+\n BEGIN eight;
<seven>[7-9A-F]+\n BEGIN seven;
<six>[6-9A-F]+\n BEGIN six;
<five>[5-9A-F]+\n BEGIN five;
<four>[4-9A-F]+\n BEGIN four;
<three>[3-9A-F]+\n BEGIN three;
<two>[2-9A-F]+\n BEGIN two;
<one>[1-9A-F]+\n BEGIN one;
<nul>[0-9A-F]+\n BEGIN nul;
;
%%
int main(int argc, char *argv[])
{
	int ret = yylex();
	printf("%s bin set\n", mes[ret]);
	return ret;
}
