
//Passing values from shell into the program

define(i_r, w19) 
define(argc_r, w20) 
define(argv_r, x21)

// argc: the number of arguments passed from command line
// argv[]: an array of pointers to the arguments (represented as strings)

		.text
fmt: 	.string "%d\n"

		.balign 4
		.global main
main: 
		stp x29, x30, [sp, -16]!
		mov x29, sp
		
//Load arguments passed from shell
		mov argc_r, w0 								//Move value from x0 to argv_r - immediate value
		mov argv_r, x1								//Move value from x1 to argv_r - address
		
		mov i_r, 0 									// i=0
		b test
        
       
	
        add w1, w1, 20
        bl printf

top:    adrp x0, fmt
		add x0, x0, :lo12:fmt						// Set up 1st arg 
		ldr x1, [argv_r, i_r, SXTW 3]				// Set up 2nd arg 
		bl printf									// Call printf 
		add i_r, i_r, 1								// i++

test:
 		cmp i_r, argc_r
		b.lt top									// Loop while i < argc


ldp x29, x30, [sp], 16 
ret
