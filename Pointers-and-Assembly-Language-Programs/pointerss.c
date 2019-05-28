#include<stdio.h>
int main(){

    int* pointer;
        int c;
        c=22;
        printf("\n Address of c: %p\n", &c);
        printf("Value of c: %d\n\n", c);

        pointer = &c; 					//Now pointer stores the address of c
        printf("Address of pointer: %p\n", &pointer);
        printf("Content of pointer: %d\n\n", *pointer);	//Value at address of c that is stored in pointer

        c=11; 						//Change value of c
        printf("Address of pointer: %p \n", &pointer);
        printf("Address of c stored in pointer: %p\n", pointer);

        printf("Content of pointer :%d\n\n", *pointer);

        *pointer=2; 					//Set the value at the address that pointer is pointing to
        printf("Address of c: %p \n", &c);
        printf("Value of c: %d \n\n", c);
        return 0;
    }

