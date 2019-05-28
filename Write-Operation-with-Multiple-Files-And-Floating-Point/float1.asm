define(value_r, d16)
define(i_r, w19)
define(result_r, d17)

//Define register aliases
fp .req x29
lr .req x30
		.data
init_m: .double 5.5

		.text
fmt: 	.string "result = %f \n"

	.balign 4
power:
	stp fp, lr, [sp, -16]!					//Save FP and LR to stack, pre-increment sp
	mov fp, sp 
	cmp w0, 0								// Check if exponent == 0
	b.ne next								// Branch if it isnt
	fmov d0, 1.0							// Otherwise return 0
	b end
//Calculate 5.5^4
next:
	fmov value_r, d0						// Load 5.5 as base
	mov i_r, 2								// Initialise i to 2
	b test
top:
	fmul value_r, value_r, d0				// value *= base
	add i_r, i_r, 1							// i++
test:
	cmp i_r, w0								// Loop while i<=exponent
	b.le top
	
	fmov d0, value_r
end:
	ldp fp, lr, [sp], 16					//Restore FP and LR from stack, post-increment SP
    ret	
    
	.global main
main:
	stp fp, lr, [sp, -16]!					//Save FP and LR to stack, pre-increment sp
	mov fp, sp   
	adrp x19, init_m						// Load address of global var
	add x19, x19, :lo12: init_m
	ldr d0, [x19]							// Load value of global var
	mov w0, 4								// Load the value of exponent
	bl power								// Call power
	fmov result_r, d0						// Load returned value
	
	adrp x0, fmt							// Set 1st arg (high order bits)
    add x0, x0, :lo12:fmt					// Set 1st arg (lower 12 bits)  
	fmov d0, result_r
	bl printf
exit:	
	mov w0,0
 	ldp fp, lr, [sp], 16					//Restore FP and LR from stack, post-increment SP
    ret										//Return to caller
