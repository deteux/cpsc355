// Bit Clear Operation & Test Operation

sfmt: .string "%08x became %08x after BIC for bit 1. \n And zero flag was set after TST for bit 3\n"          
										  //Define string format for printf


//Define register aliases
fp .req x29
lr .req x30

//Define m4 macros for BIC
define(u_reg, x19)
define(v_reg, x20)
define(w_reg, x21)
define(x_reg, x22)




//Define main function
.global main          					  //Make "main" visible to OS
.balign 4        				          //Instructions must be word aligned
	
main:
    stp fp, lr, [sp, -16]!    			  //Save FP and LR to stack, pre-increment sp, pre-increment sp
    mov fp, sp               		      //Update FP to current SP


//ANDS operation -  test if bit 2 is set
    mov u_reg, 0x07              	      //		0000 0111	= 7
    mov v_reg, 0x05					      //		0000 0101   = 5  
    bic w_reg, u_reg, v_reg               //		0000 0010   = 2
       
    tst u_reg, 0x08              		  // 		0000 1000   = 8 
    b.eq print							  // 		xzr  = 1
    b exit


print:
        adrp x0, sfmt            	       //Set 1st arg (high order bits)
        add x0, x0, :lo12:sfmt  	       //Set 1st arg (lower 12 bits)
        mov x1, u_reg
        mov x2, w_reg
		bl printf						   //Call printf
        b exit


exit:
                    		      
    mov w0, 0                		       //Set up return value of 0 from main
end:
    ldp fp, lr, [sp], 16      	   	       //Restore FP and LR from stack, post-increment SP
    ret                       			   //Return to caller

