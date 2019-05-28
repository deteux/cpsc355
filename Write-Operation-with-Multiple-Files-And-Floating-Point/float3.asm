
//Define register aliases
fp .req x29
lr .req x30
		.data
x_m: 	.word  -7
y_m: 	.single 0r2.0e-2
z_m: 	.double 0r0.0

		.text
fmt: 	.string "%4.4f / %4.4f = %4.4f \n decimal result = %ld \n"

		.balign 4
		.global main
main:
	stp fp, lr, [sp, -16]!					// Save FP and LR to stack, pre-increment sp
	mov fp, sp   
	
	adrp x0, fmt						// Set 1st arg
	add x0, x0, :lo12: fmt
		
	adrp x19, x_m
	add x19, x19, :lo12: x_m
	ldr w9, [x19]
	scvtf d0, w9						// Convert int to float and save in d0 - 2nd arg
	
	
	adrp x19, y_m
	add x19, x19, :lo12: y_m
	ldr s16, [x19]
	fcvt d1, s16						// Convert single to double and save in d1 - 3rd arg
	
	fdiv d2, d0, d1						// Set 4th arg as d2 = d0/d1
	
	adrp x19, z_m
	add x19, x19, :lo12: z_m
	str d2, [x19]						// Update Z
	fcvtns x1, d2						// Convert double to long int and save in x1 - 4th arg

	bl printf						// Call printf
	
exit:	
	mov w0,0
 	ldp fp, lr, [sp], 16					//Restore FP and LR from stack, post-increment SP
    ret								//Return to caller
