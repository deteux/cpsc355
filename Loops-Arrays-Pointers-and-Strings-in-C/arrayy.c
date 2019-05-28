/* Program to calculate the sum of digits in an array */

#include <stdio.h>

int main()
{
    int a[10], i, n, sum=0;								
    a[0] = 10;
    a[1] = 11;
    printf("Enter the no. of elements: (max =10): ");
    scanf("%d", &n);

// Create a loop to retrieve n values from user
    for(i=0; i<n; i++){
        printf("Enter the element no. %d: ", i+1);

        scanf("%d", &a[i]);
    }
// Loop to print the number from the array
    for(i=0; i<n; i++){
        printf("\n a[%d] = %d", i, a[i]);
	}

// Loop to calculate the sum of array
    for (i=0; i<n; i++){
        sum = sum + a[i];
	}

    printf("\n Sum = %d \n", sum);
    return 0;
    
}
