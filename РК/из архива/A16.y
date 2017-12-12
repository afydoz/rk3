%{
#include <stdio.h>
%}
%%
s: 
| one 	 '\n'	{printf("Correct\n"); return(0);}
| two 	 '\n'	{printf("Correct\n"); return(0);}
| three '\n'	{printf("Correct\n"); return(0);}
| four  '\n'  {printf("Correct\n"); return(0);}
| five  '\n'  {printf("Correct\n"); return(0);}
| six   '\n'  {printf("Correct\n"); return(0);}
| seven '\n'  {printf("Correct\n"); return(0);}
| eight '\n'  {printf("Correct\n"); return(0);}
| nine  '\n'  {printf("Correct\n"); return(0);}
;
nine:  
| '9' nine
;
eight: 
| '9' nine
| '8' eight
;
seven: 
| '9' nine 
| '8' eight
| '7' seven
;
six: 
| '9' nine
| '8' eight
| '7' seven
| '6' six 
;
five: 
| '9' nine
| '8' eight
| '7' seven
| '6' six  
| '5' five
;
four:  
| '9' nine
| '8' eight
| '7' seven
| '6' six
| '5' five
| '4' four 
;
three: 
| '9' nine
| '8' eight
| '7' seven
| '6' six  
| '5' five
| '4' four 
| '3' three
;
two: '2' 
| '9' nine
| '8' eight
| '7' seven
| '6' six
| '5' five
| '4' four
| '3' three
| '2' two 
;
one: '1' 
| '9' nine
| '8' eight
| '7' seven
| '6' six
| '5' five
| '4' four
| '3' three
| '2' two 
| '1' one 
;
%%
#include <stdio.h>

main() { 
	yyparse();
}

yyerror( mes ) char *mes; {  printf( "%s\n", mes ); }

yylex() {
 return getchar();
}

