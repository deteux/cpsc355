
#include <stdio.h>

int main(int argc, char *argv[]) {
// argc: the number of arguments passed from command line
// argv[]: an array of pointers to the arguments (represented as strings)

	register int i;
	

	for (i = 0; i < argc; i++) { 
	
	printf("%s\n", argv[i]);
	
	}
return 0; 
}