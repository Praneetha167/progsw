#include<stdio.h>
#include<string.h>

struct Symbol
{
    char name[20];
    char type[20];
    int value;
};

int main()
{
    struct Symbol table[100];
    int n, i;

    printf("Enter number of symbols: ");
    scanf("%d", &n);

    for(i = 0; i < n; i++)
    {
        printf("\nEnter Symbol Name: ");
        scanf("%s", table[i].name);

        printf("Enter Data Type: ");
        scanf("%s", table[i].type);

        printf("Enter Value: ");
        scanf("%d", &table[i].value);
    }

    printf("\nSYMBOL TABLE\n");
    printf("Name\tType\tValue\n");

    for(i = 0; i < n; i++)
    {
        printf("%s\t%s\t%d\n",
               table[i].name,
               table[i].type,
               table[i].value);
    }

    return 0;
}

------------------------------------------------------------

    
#include <stdio.h>
#include <string.h>

struct Symbol
{
    char name[20];
    char type[20];
    int size;
};

struct Symbol table[50];
int count = 0;

void insert()
{
    printf("Enter symbol name: ");
    scanf("%s", table[count].name);

    printf("Enter data type: ");
    scanf("%s", table[count].type);

    printf("Enter size: ");
    scanf("%d", &table[count].size);

    count++;
    printf("Symbol inserted successfully\n");
}

void display()
{
    int i;

    printf("\nName\tType\tSize\n");

    for(i = 0; i < count; i++)
    {
        printf("%s\t%s\t%d\n",
        table[i].name,
        table[i].type,
        table[i].size);
    }
}

void search()
{
    char name[20];
    int i;

    printf("Enter symbol to search: ");
    scanf("%s", name);

    for(i = 0; i < count; i++)
    {
        if(strcmp(table[i].name, name) == 0)
        {
            printf("Symbol Found\n");
            printf("Name: %s\n", table[i].name);
            printf("Type: %s\n", table[i].type);
            printf("Size: %d\n", table[i].size);
            return;
        }
    }

    printf("Symbol Not Found\n");
}

void delete()
{
    char name[20];
    int i, j;

    printf("Enter symbol to delete: ");
    scanf("%s", name);

    for(i = 0; i < count; i++)
    {
        if(strcmp(table[i].name, name) == 0)
        {
            for(j = i; j < count - 1; j++)
                table[j] = table[j + 1];

            count--;
            printf("Symbol Deleted\n");
            return;
        }
    }

    printf("Symbol Not Found\n");
}

int main()
{
    int choice;

    while(1)
    {
        printf("\n1.Insert");
        printf("\n2.Display");
        printf("\n3.Search");
        printf("\n4.Delete");
        printf("\n5.Exit");

        printf("\nEnter your choice: ");
        scanf("%d", &choice);

        switch(choice)
        {
            case 1: insert(); break;
            case 2: display(); break;
            case 3: search(); break;
            case 4: delete(); break;
            case 5: return 0;
            default: printf("Invalid Choice\n");
        }
    }
}

