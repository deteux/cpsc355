	.global main			//Make main visible to OS
	.balign 4			//Instructions must be word aligned
main:
	mov x19, #20			//Load x19 with value 20 
	
	mov x20, 30			//Load x20 with value 30
	
	add x21, x19, x20		//Add the two and store result in x21
	
	sub x21, x21, #10		//Subtract 10 from previous result
	mov w0, 0
	ret
