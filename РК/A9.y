%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *);
%}
%token END
%%
input: 
	| input line;
	
line: '\n' {printf("Empty line\n");}
    | error '\n'  {yyerrok;}
    | start
    ;

    Q1: END {printf("incorrect\n");}
        |'1'Q5
        |'0'Q2

    Q2: END {printf("correct\n");}
        |'1'Q3
        |'0'Q1

    Q3: END {printf("incorrect\n");}
        |'1'Q4
        |'0'Q5

    Q4: END {printf("incorrect\n");}
        |'1'Q2
        |'0'Q6

    Q5: END {printf("incorrect\n");}
        |'1'Q6
        |'0'Q3
    
    Q6: END {printf("incorrect\n");}
        |'1'Q1
        |'0'Q4


    start: '1'Q5
            |'0'Q2
            ;
    

%%
int yylex(void)
{
    int c;
    c=getchar();
    if(c=='1')
    return c;
    if(c=='0')
    return c;
    if(c==' ' || c=='\t' || c=='\n')
    return END;
    if (c==EOF)
        return 0;

    return c;
}
void yyerror(char const *s)
{
     fprintf(stderr, "%s\n", s);
}
int main() {return(yyparse());}