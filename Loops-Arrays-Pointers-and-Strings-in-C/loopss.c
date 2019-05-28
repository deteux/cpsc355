#include<stdio.h>
int main(){

    int i=0;			//Counter initialized to 0


// While loop
    while(i<10){
    
        printf("%d...getting there! \n", i);
        i=i+1;   //i++ or ++i

    }
    printf("%d!  \n Now going back... \n", i);

// For loop
    for(i=10;i>0;i--){
                printf("%d...getting there!\n", i);
    }
    printf("%d! ", i);


    return 0;
}
