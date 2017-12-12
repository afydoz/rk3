%{
    #include<stdio.h>
    int yylex();
    void yyerror(char *s) {
        fprintf (stderr, "%s\n", s);
    }
%}

%token ZERO
%token ONE

%%
input: {printf("Enter the line:\n");}
| input line;

line: '\n' {printf("Empty line\n");}
| error '\n' {yyerrok; }
| Q1 '\n' {printf("Correct\n");}
;


Q1:Q2 ONE
|Q2 ZERO
;

Q2:Q1 ONE
|Q1 ZERO
|ZERO
|ONE
;

%%
int main(void){
    return(yyparse());
}
int yylex(void){
    int c;
    c = getchar();
    if(c == '1')
    return ONE;
    if(c == '0')
    return ZERO;
    if(c == EOF)
    return 0;
    
    return c;
}
