%{
#include <stdio.h>
int yylex(void);
void yyerror(char const*);
char* mas[]={"Correct","Incorrect"};
%}

%%
line:  A '\n' { return 0;}

A: |'1'E 
   |'0'B 
B: '1'F 
   |'0'A    
C: '1'A 
   |'0'D 
D: '1'B 
   |'0'C 
E: '1'C 
   |'0'F 
F: '1'D 
   |'0'E
 
%%

void yyerror(char const *s) 
{
}

int yylex()
{
	return (getchar());
}

int main(int argc, char* argv[])
{
	int ret=yyparse();
    printf("%s Bin set\n",mas[ret]);
	return (ret);
}
