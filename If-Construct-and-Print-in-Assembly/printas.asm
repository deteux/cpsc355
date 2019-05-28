//Program to calculate y=x^2+x+1 for x=[1,10]
fmt: .string "x is %d, y is %d\n"

	.global main			//Make main visible to OS
	.balign 4			//Instructions must be word aligned

//Define register aliases
fp .req x29
lr .req x30

//Define m4 macros
define(x_r, x19)
define(y_r, x20)
define(z_r, x21)

main:
	stp fp, lr, [sp, -16]!      //Save FP and LR to stack, pre-increment sp
	mov fp, sp                  //Update FP to current SP

	mov x_r, 0
loop:
	add x_r, x_r, 1				//x=x+1
	cmp x_r, 10
	b.gt exit  					

	mul z_r, x_r, x_r			//z=x*x
	add y_r, z_r, x_r			//y=x*x+x
	add y_r, y_r, 1				//y=x*x+x+1

print:
	ldr x0, =fmt				//Set string as 1st argument
//Pass variable arguments
	mov x1, x_r 				//Set 2nd arg
	mov x2, y_r  				//Set 3rd arg
	bl printf					//Call printf
	
	b loop


//Set address of string to be printed
exit:

	mov w0, 0 					//Set up return value of 0 from main

	ldp fp, lr, [sp], 16            //Restore FP and LR from stack, post-increment SP
	ret                             //Return to OS

