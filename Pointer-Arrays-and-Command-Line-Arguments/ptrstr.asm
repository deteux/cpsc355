//Array of Pointers

define(i_r, w19) 
define(base_r, x20)

// This section contains program text (machine code) - programmer initialized
		.text 								
fmt: 	.string "\n\tseason[%d] = %s\n\n"
spr_var: 	.string "spring"
sum_var: 	.string "summer" 
fal_var: 	.string "fall"
win_var: 	.string  "winter"

// This section contains programmer-initialized data
			.data 								// Create array of pointers
			.balign 8 							// Must be double-word aligned 
season_var: .dword spr_var, sum_var, fal_var, win_var

		.text 
		.balign 4 
		.global main
main: 
		stp x29, x30, [sp, -16]! 
		mov x29, sp
		mov i_r, 0 
		b test
top: 
		adrp x0, fmt 
		add x0, x0,:lo12:fmt 				// set up 1st arg
		mov w1, i_r					// set up 2nd arg
		adrp base_r, season_var				// Load array base address
		add base_r, base_r, :lo12:season_var
		
		ldr x2, [base_r, i_r, SXTW 3] 		// set up 3rd arg bl printf

		bl printf
		add i_r, i_r, 1 

test:
		cmp i_r, 4 
		b.lt top
		
		
		ldp x29, x30, [sp], 16 
		ret
