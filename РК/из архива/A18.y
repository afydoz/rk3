%{
//16-ричн. сист. счисл., цифры по возрастающей
#include <stdio.h>
%}

%%

exp:
|one       '\n' {printf("Correct\n"); return(0);}
|two       '\n' {printf("Correct\n"); return(0);}
|three     '\n' {printf("Correct\n"); return(0);}
|four      '\n' {printf("Correct\n"); return(0);}
|five      '\n' {printf("Correct\n"); return(0);}
|six       '\n' {printf("Correct\n"); return(0);}
|seven     '\n' {printf("Correct\n"); return(0);}
|eight     '\n' {printf("Correct\n"); return(0);}
|nine      '\n' {printf("Correct\n"); return(0);}
|ten       '\n' {printf("Correct\n"); return(0);}
|eleven    '\n' {printf("Correct\n"); return(0);}
|twelve    '\n' {printf("Correct\n"); return(0);}
|thirteen  '\n' {printf("Correct\n"); return(0);}
|fourteen  '\n' {printf("Correct\n"); return(0);}
|fifteen   '\n' {printf("Correct\n"); return(0);}
;

fifteen:
| 'F' fifteen

fourteen:
| 'F' fifteen
| 'E' fourteen

thirteen:
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen

twelve:
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen
| 'C' twelve

eleven:
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen
| 'C' twelve
| 'B' eleven

ten:
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen
| 'C' twelve
| 'B' eleven
| 'A' ten

nine: '9'
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen
| 'C' twelve
| 'B' eleven
| 'A' ten 
| '9' nine

eight: '8'
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen
| 'C' twelve
| 'B' eleven
| 'A' ten 
| '9' nine
| '8' eight

seven: '7'
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen
| 'C' twelve
| 'B' eleven
| 'A' ten 
| '9' nine
| '8' eight
| '7' seven

six:
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen
| 'C' twelve
| 'B' eleven
| 'A' ten 
| '9' nine
| '8' eight
| '7' seven
| '6' six

five:
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen
| 'C' twelve
| 'B' eleven
| 'A' ten 
| '9' nine
| '8' eight
| '7' seven
| '6' six
| '5' five

four:
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen
| 'C' twelve
| 'B' eleven
| 'A' ten 
| '9' nine
| '8' eight
| '7' seven
| '6' six
| '5' five
| '4' four

three:
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen
| 'C' twelve
| 'B' eleven
| 'A' ten 
| '9' nine
| '8' eight
| '7' seven
| '6' six
| '5' five
| '4' four
| '3' three

two:
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen
| 'C' twelve
| 'B' eleven
| 'A' ten 
| '9' nine
| '8' eight
| '7' seven
| '6' six
| '5' five
| '4' four
| '3' three
| '2' two

one:
| 'F' fifteen
| 'E' fourteen
| 'D' thirteen
| 'C' twelve
| 'B' eleven
| 'A' ten 
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

yyerror(mes) char *mes; { printf("%s\n", mes);}

yylex(){
     return getchar();
}