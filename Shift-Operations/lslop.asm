//Logical shift left: easy way to multiply by a power of 2
sfmt: .string "%08d x (2 to the power %08d) = %0d \n"               //Define string format for printf


//Define register aliases
fp .req x29
lr .req x30

//Define m4 macros
define(x_reg, x19)
define(y_reg, x20)
define(z_reg, x21)


//Define main function
.global main          					  //Make "main" visible to OS
.balign 4        				          //Instructions must be word aligned
	
main:
    stp fp, lr, [sp, -16]!    			  //Save FP and LR to stack, allocating 16 bytes, pre-increment sp
    mov fp, sp               		      //Update FP to current SP


//LSL operation 
    mov x_reg, 0x05              	      //0000 0101	= 5
    mov y_reg, 0x02						  //0000 0010   = 2  
    lsl z_reg, x_reg, y_reg               //0001 0100   = 5 x 2^2 = 20


print:
        adrp x0, sfmt            	       //Set 1st arg (high order bits)
        add x0, x0, :lo12:sfmt  	       //Set 1st arg (lower 12 bits)
        mov x1, x_reg
        mov x2, y_reg
        mov x3, z_reg


        b exit


exit:
    bl printf                		       //Call printf function
    mov w0, 0                		       //Set up return value of 0 from main
end:
    ldp fp, lr, [sp], 16      	   	       //Restore FP and LR from stack, post-increment SP
    ret                       			   //Return to caller

