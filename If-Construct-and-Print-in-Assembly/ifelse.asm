// Define Macros
define(a_r, x19)
define(b_r, x20)
define(c_r, x21)
define(d_r, x22)

//Define register aliases
fp .req x29
lr .req x30

	.global main			//Make main visible to OS
	.balign 4			//Instructions must be word aligned

main:
	stp fp, lr, [sp, -16]!		//Save FP and LR to stack, pre-increment sp
	mov fp, sp			//Update FP to current SP

	mov a_r, 60
	mov b_r, 40

	cmp a_r, b_r
	b.le next			//If a_r<=b_r go to next
	add c_r, a_r, b_r		//Else execute these instructions
	add d_r, c_r, 5
	b end				//Skip next and go to end

next:
	sub c_r, a_r, b_r
	sub d_r, c_r, 5
end:
	mov w0, 0 

	ldp fp, lr, [sp], 16            //Restore FP and LR from stack, post-increment SP
	ret                             //Return to caller


