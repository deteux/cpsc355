define(value_r, d16)
define(result_r, d17)

//Define register aliases
fp .req x29
lr .req x30
		.data
x_m: 	.double 0r-7.5			//0r means it's a real number

		.text
fmt: 	.string " Negative = %2.3f \n"
fmt1: 	.string " Square = %.4f \n"
fmt2: 	.string " Absolute value = %f \n"

	.balign 4
//Get square of the value 
sqr:
	stp fp, lr, [sp, -16]!					//Save FP and LR to stack, pre-increment sp
	mov fp, sp 
	fabs value_r, d0
	fmul value_r, value_r, d0

	adrp x0, fmt1							// Set 1st arg (high order bits)
    add x0, x0, :lo12:fmt1					// Set 1st arg (lower 12 bits)  
	fmov d0, value_r

	bl printf
	
	ldp fp, lr, [sp], 16					//Restore FP and LR from stack, post-increment SP
    ret	

// Negate the value
neg:
	stp fp, lr, [sp, -16]!					//Save FP and LR to stack, pre-increment sp
	mov fp, sp 
	fneg value_r, d0						// Negate the number
	adrp x0, fmt							// Set 1st arg (high order bits)
    add x0, x0, :lo12:fmt					// Set 1st arg (lower 12 bits)  
	fmov d0, value_r
	bl printf
	
	ldp fp, lr, [sp], 16					//Restore FP and LR from stack, post-increment SP
    ret
// Get the absolute value	
absolute:
	stp fp, lr, [sp, -16]!					//Save FP and LR to stack, pre-increment sp
	mov fp, sp 
	fabs value_r, d0						// Negate the number
	adrp x0, fmt2							// Set 1st arg (high order bits)
    add x0, x0, :lo12:fmt2					// Set 1st arg (lower 12 bits)  
	fmov d0, value_r
	bl printf
	
	ldp fp, lr, [sp], 16					//Restore FP and LR from stack, post-increment SP
    ret	
	.global main
main:
	stp fp, lr, [sp, -16]!					//Save FP and LR to stack, pre-increment sp
	mov fp, sp   
	
	fmov d0, 3.5
	bl neg									// Call sqr
	
	fmov d0, 5.5
	bl sqr	
	
	adrp x19, x_m
	add x19, x19, :lo12: x_m
	ldr d0, [x19]
	bl absolute
	
exit:	
	mov w0,0
 	ldp fp, lr, [sp], 16					//Restore FP and LR from stack, post-increment SP
    ret										//Return to caller
