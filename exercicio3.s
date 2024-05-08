.global _start

.section .text
_start:
	ldr r4, =msg // stores the string address
	b loopformatting
	
loopformatting:
	ldrb r2, [r4] // stores the value of the current position of r4 in r1
	cmp r2, #0 // checks if r1 is the end of the string
	beq setupreversing // if it is go to the next step
	
	// compares r1 to 97, the first lowercase ascii character, values lower
	// than 97 are uppercase characters by an offset of 32
	cmp r2, #97 
	subge r2, #32 // if r1 >= 97, uppercase the character
	addle r2, #32 // if ri <= 97, lowercase the character
	
	//bl nostringcheck

	strb r2, [r4] // stores the new character at the memory position in r4
	add r4, #1 // goes to the next position of the string
	
	b loopformatting

setupreversing:
	ldr r4, =msg // address to the start of the string 
	add r3, r4,#endstr // address to the end of the string (/0)
	sub r3, #1 // address to the last character of the string
	b loopreversing // goes to the loop step of the reversing

loopreversing:
	bgt end // if r4 > r3 the string has been fully reversed
	// store the values of the start and end of the string in two registers
	ldrb r1, [r4]
	ldrb r2, [r3]
	
	// swap the position of the values
	strb r2, [r4]
	strb r1, [r3]
	
	// go to the next position
	add r4, #1
	sub r3, #1	

	cmp r4, r3
	bgt end // if r4 > r3 the string has been fully reversed

	b loopreversing

nostringcheck:
	cmp r2, #65
	blt endnostring
	cmp r2, #122
	bgt endnostring
	cmp r2, #90
	bgt nostringcheck1

nostringcheck1:
	cmp r2, #97
	blt endnostring
	bx lr

end:	
	// print the new string in the terminal
	ldr r1, =msg
	mov r2, #9
	mov r0, #1
	mov r7, #4
	swi 0
	
	// exit the program
	mov r7, #1
	mov r0, #0
	swi 0
endnostring:
	mov r7, #1
	mov r0, #0
	swi 0

.section .data
	msg:
	.asciz "HArdwArE"
	.set endstr, . - msg
