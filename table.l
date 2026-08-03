%{
#include <stdio.h>
#include <string.h>

struct symbol
{
    char name[50];
} table[100];

int count = 0;

// Function to check whether identifier already exists
int search(char *id)
{
    int i;
    for(i = 0; i < count; i++)
    {
        if(strcmp(table[i].name, id) == 0)
            return 1;
    }
    return 0;
}
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {
    if(!search(yytext))
    {
        strcpy(table[count].name, yytext);
        count++;
    }
}

[ \t\n]+      ;

.             ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    int i;

    printf("Enter the program:\n");
    yylex();

    printf("\nSymbol Table\n");
    printf("-----------------\n");
    printf("Index\tIdentifier\n");

    for(i = 0; i < count; i++)
    {
        printf("%d\t%s\n", i + 1, table[i].name);
    }

    return 0;
}
