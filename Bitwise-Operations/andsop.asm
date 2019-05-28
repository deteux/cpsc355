//ANDS: Sets/clears N & Z flags, V & C are always cleared.

//Test if bit is set/clear.


sfmt: .string "Bit was clear. \n"               //Define string format for printf
fmt: .string "Bit was set\n"


//Define register aliases
fp .req x29
lr .req x30

//Define m4 macros
define(x_reg, x19)
define(y_reg, x20)
define(z_reg, x21)


//Define main function
.global main            //Make "main" visible to OS
.balign 4               //Instructions must be word aligned

main:
    stp fp, lr, [sp, -16]!      //Save FP and LR to stack, pre-increment sp
    mov fp, sp                  //Update FP to current SP


//ANDS operation -  
    mov x_reg, 0xAA                    //1010 1010
    mov y_reg, 0x08                    //0000 1000
    ands z_reg, x_reg, y_reg           //0000 1000, Z=0
    b.eq bitclear			//for eq=true, z=1, result of ands must be zero
    b bitset

bitclear:
        adrp x0, sfmt                  //Set 1st arg (high order bits)
        add x0, x0, :lo12:sfmt         //Set 1st arg (lower 12 bits)
        b exit
bitset:
        adrp x0, fmt                  //Set 1st arg (high order bits)
        add x0, x0, :lo12:fmt         //Set 1st arg (lower 12 bits)


exit:
    bl printf                       //Call printf function
    mov w0, 0                       //Set up return value of 0 from main
end:
    ldp fp, lr, [sp], 16            //Restore FP and LR from stack, post-increment SP
    ret                             //Return to caller
