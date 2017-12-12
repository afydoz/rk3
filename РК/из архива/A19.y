%expect 16
%{
#include<stdio.h>
%}
%%
S: CORRECT '\n' {return 0;};
CORRECT:
	f e d c b a nine eight seven six five four three two one zero

f: 
	| 'f'
	| f 'f'
	
e: 
	|'e'
	| e 'e'
	
d: 
	|'d'
	| d 'd'
	
c: 
	|'c'
	| c 'c'
	
b: 
	|'b'
	| b 'b'
	
a: 
	|'a'
	| a 'a'
	
nine:
	|'9'
	| nine '9'
	
eight:
	|'8'
	| eight '8'
	
seven:
	|'7'
	| seven '7'
	
six:
	|'6'
	| six '6'
	
five:
	|'5'
	| five '5'
	
four:
	|'4'
	| four '4'
	
three:
	|'3'
	| three '3'
	
two:
	|'2'
	| two '2'
	
one:
	|'1'
	| one '1'
	
zero:
	|'0'
	| zero '0'
	
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
