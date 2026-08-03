%{
#include <stdio.h>
#include <string.h>

char type[100][20];
char token[100][50];
int count = 0;

void store(char *t, char *s)
{
    strcpy(type[count], t);
    strcpy(token[count], s);
    count++;
}
%}

%%

int|float|char|double|if|else|while|for|return|void|main {
    store("Keyword", yytext);
}

[0-9]+ {
    store("Number", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    store("Identifier", yytext);
}

"=="|"!="|">="|"<="|"="|"+"|"-"|"*"|"/"|">"|"<" {
    store("Operator", yytext);
}

"("|")"|"{"|"}"|";"|"," {
    store("Special Symbol", yytext);
}

[ \t\n]+ ;

. {
    store("Unknown", yytext);
}

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

    printf("\nRecognized Tokens\n");
    printf("---------------------------\n");

    for(i = 0; i < count; i++)
    {
        printf("%-18s %s\n", type[i], token[i]);
    }

    return 0;
}
