

sfmt: .string "0x%x OR 0x%x = 0x%x\n"               //Define string format for printf

//Define register aliases
fp .req x29
lr .req x30

//Define m4 macros
define(x_reg, x19)
define(y_reg, x20)
define(z_reg, x21)

.global main
.balign 4               //Instructions must be word aligned

main:
	stp fp, lr, [sp, -16]!      //Save FP and LR to stack, pre-increment sp
	mov fp, sp                  //Update FP to current SP


//Exclusive OR operation
	mov x_reg, 0xAA                //1010 1010
	mov y_reg, 0xF0                //1111 0000
	eor z_reg, x_reg, y_reg        //0101 1010

	b exit

exit:
	adrp x0, sfmt                  //Set 1st arg (high order bits)
	add x0, x0, :lo12:sfmt         //Set 1st arg (lower 12 bits)

// Set arguments
	mov x1, x_reg
	mov x2, y_reg
	mov x3, z_reg

	bl printf                       //Call printf function
	mov w0, 0                       //Set up return value of 0 from main
end:
	ldp fp, lr, [sp], 16            //Restore FP and LR from stack, post-increment SP
	ret                             //Return to caller

