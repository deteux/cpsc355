	.global main			//Make main visible to OS
	.balign 4			//Instructions must be word aligned

//Define register aliases
fp .req x29
lr .req x30

main:
	stp fp, lr, [sp, -16]!      //Save FP and LR to stack, pre-increment sp
	mov fp, sp                  //Update FP to current SP

	mov x19, 1
	mov x20, 20
loopstart: 
	add x19, x19, 1
	cmp x19, x20
	b.le loopstart				//Loop while x19 is <= x20




	ldp fp, lr, [sp], 16            //Restore FP and LR from stack, post-increment SP
	ret                             //Return to OS


