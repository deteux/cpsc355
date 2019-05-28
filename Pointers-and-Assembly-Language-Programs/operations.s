	.global main			//Make main visible to OS
	.balign 4			//Instructions must be word aligned

//Define register aliases
fp .req x29
lr .req x30

main:
	stp fp, lr, [sp, -16]!      //Save FP and LR to stack, pre-increment sp
	mov fp, sp                  //Update FP to current SP

//Custom code
	mov x19, #45
	add x19,x19, 1
	
	mov x20, #10
	add x22, x19, x20
	
	mov x19, 20
	mov x20, #60
	add x19, x19, x20
	
	sub x20, x20, x19
	mul x19, x19, x20
//Exit the program
	ldp fp, lr, [sp], 16            //Restore FP and LR from stack, post-increment SP
	ret                             //Return to OS
