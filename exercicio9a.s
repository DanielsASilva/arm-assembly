.global _start

.section .text


// for this program, the i will need to be divided in two parts, the r3 register will be responsible for navigating the real array, 
// being incremented with offsets of 4 to get to the next position, the r5 register will be responsible for showing the position.
_start:
	ldr r1, =A // gets the array starting position in memory
	mov r3, #0 // i=0
	b for
for:
	mov r2, r1 // moves the address to a temporary register
	add r2, r3 // finds the i position in A[i]
	ldr r4, [r2] // loads the contents of A[i] on r4
	add r4, r5 // A[i]+i
	str r4, [r2] // stores the new value in memory
	add r5, #1 // i++ position
	add r3, #4 // i++ address
	cmp r5, #10
	bgt end // i < 10
	b for
end:	  
	mov r7, #1
	swi 0
.section .data

		A:
			.word 2, 4, 6, 8, 9, 11, 12, 15, 1, 17
