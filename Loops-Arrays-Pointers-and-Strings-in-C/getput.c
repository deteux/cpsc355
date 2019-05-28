#include<stdio.h>		//Include the standard I/O library functions

int main(){			// Program executions begins from main function

	printf("Enter a character: ");
	char ch = getchar(); 			// Get the character from user
	putchar(ch);				// Print the character
	printf("\n The character %c is %d in ASCII\n", ch, ch);
	char sum = ch + 10;			// Add 10 to ASCII value of character ch	
	printf("%c(%d) is the sum of %c and 10", sum, sum, ch);
	return 0;
	
}


