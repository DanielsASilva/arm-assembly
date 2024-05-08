.global _start

.section .text

_start:
	ldr r4, =vetorX // stores the vetorX start address
	add r5, r4, #256 // stores the end address of vetorX
	b count1

count1:
	cmp r4, r5 // checks if the vector has been fully traveled 
	beq end
	ldr r6, [r4] // gets the value at the current addres
	cmp r6, #1
	beq add1 //if the value is one, add one and go to the next character
	add r4, #4 // go to the next character
	b count1

add1:
	add r0, #1 // count
	add r4, #4 // go to the next character
	b count1

end:
	ldr r2, =numerosDe1
	str r0, [r2] // stores the count at numerosDe1

	mov r7, #1
	mov r0, #0
	swi 0

.section .data
	
	vetorX: .space 64
	//vetorX: .word 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0
	numerosDe1: .word 0
