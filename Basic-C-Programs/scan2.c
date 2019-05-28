// Program to scan float
#include<stdio.h>						//Include the standard I/O library functions

int main(){								// Program executions begins from main function
	float f;
    printf("Enter a float: ");
// %f format string is used in case of floats
    scanf("%f", &f);
    printf("Value = %f\n\n", f);
    return 0;
}
