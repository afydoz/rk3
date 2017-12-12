%{
#include <stdio.h>
void yyerror(char const *s) {printf("%s\n",s);}
int yylex() {return getchar();}
%}

%%


line:
| one '\n' {printf("Correct\n");return 0;}
| two '\n' {printf("Correct\n");return 0;}
| three '\n' {printf("Correct\n");return 0;}
| four '\n' {printf("Correct\n");return 0;}
| five '\n' {printf("Correct\n");return 0;}
| six '\n' {printf("Correct\n");return 0;}
| seven '\n' {printf("Correct\n");return 0;}
| eight '\n' {printf("Correct\n");return 0;}
| nine '\n' {printf("Correct\n");return 0;}
;

nine: '9'
| nine '9';

eight: '8'
| eight '8'
| eight '9';

seven: '7'
| seven '7'
| seven '8'
| seven '9';

six: '6'
| six '6'
| six '7'
| six '8'
| six '9';

five: '5'
| five '5'
| five '6'
| five '7'
| five '8'
| five '9';

four: '4'
| four '4'
| four '5'
| four '6'
| four '7'
| four '8'
| four '9';

three: '3'
| three '3'
| three '4'
| three '5'
| three '6'
| three '7'
| three '8'
| three '9';

two: '2'
| two '2'
| two '3'
| two '4'
| two '5'
| two '6'
| two '7'
| two '8'
| two '9';

one: '1'
| one '1'
| one '2'
| one '3'
| one '4'
| one '5'
| one '6'
| one '7'
| one '8'
| one '9';

%%
int main() {yyparse();}