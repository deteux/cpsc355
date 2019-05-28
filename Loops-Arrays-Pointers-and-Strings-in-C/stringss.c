:q#include:q#include#include<stdio.h>
#include<string.h>
int main () {

    /* Example 1 */
    char greeting[6] = {'H', 'e', 'l', 'l', 'o', '\0'};
    printf("\n Greeting message: %s\n", greeting);

    /* Example 2 */

    char string1[] = "A string declared as an array.\n";

    /* Example 3 */

    char *string2 = "A string declared as a pointer.\n";

    /* Example 4 */

    char string3[30];

    strcpy(string3, "A string constant copied in.\n");      //can also use strcpy function from string.h header file

//Print the strings
    printf("\n String 1 is: %s", string1);
    printf("\n String 2 is: %s",string2);
    printf("\n String 3 is: %s",string3);

//Copy one string to another
    strcpy(string3, string1);

    printf("\n String 3 is: %s\n\n",string3);

    int len=strlen(string2);    //strlen is defined in string.h
    printf("Length of string 2 is %d\n", len-1);


//Comparison of two strings
    int comparison;
    char string11[] = "alpha";
    char string22[] = "ALPHA";

    comparison = strcmp (string11, string22);    //strcmp is defined in string.h
    printf ("%d\n", comparison);

    return 0;
}

