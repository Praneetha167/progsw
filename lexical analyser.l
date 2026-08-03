%{
#include <stdio.h>
#include <string.h>

char type[200][30];
char token[200][50];
int count = 0;

void store(char *t, char *s)
{
    strcpy(type[count], t);
    strcpy(token[count], s);
    count++;
}
%}

%%

int|float|char|double|void|if|else|while|for|return|main    { store("Keyword", yytext); }

[0-9]+    { store("Number", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*    { store("Identifier", yytext); }

"=="|"!="|">="|"<="|"="|"+"|"-"|"*"|"/"|">"|"<"    { store("Operator", yytext); }

"("|")"|"{"|"}"|";"|","    { store("Special Symbol", yytext); }

[ \t\n]+    ;

.    { store("Unknown", yytext); }

%%

int yywrap()
{
    return 1;
}

int main()
{
    int i;

    printf("Enter a C program:\n");
    yylex();

    printf("\nLexical Analysis Output\n");
    printf("----------------------------------\n");
    printf("%-18s%s\n", "Token Type", "Lexeme");
    printf("----------------------------------\n");

    for(i = 0; i < count; i++)
    {
        printf("%-18s%s\n", type[i], token[i]);
    }

    return 0;
}
