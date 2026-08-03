%{
#include <stdio.h>

int words = 0;
int lines = 0;
%}

%%

[ \t]+          ;

\n              { lines++; }

[a-zA-Z0-9_]+   { words++; }

.               ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the text:\n");

    yylex();

    printf("\nResult\n");
    printf("-------------------\n");
    printf("Number of Words : %d\n", words);
    printf("Number of Lines : %d\n", lines);

    return 0;
}
