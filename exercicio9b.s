.globaL _start

.section .text

_start:
	// i works the same way as 9a
	ldr r1, =A
	b for

for:
	mov r2, r1 // moves the address to a temporary register
	add r2, r3 //finds the i position in A[i]
	ldr r4, [r2] // loads the contents of A[i] on r4
	and r6, r4, #1 // isolate the LSB 
	cmp r6, #0 // i % 2 == 0 (LSB 0 = EVEN, LSB 1 = ODD)	 
	beq even
	add r4, r4, r4 // A[i] * 2
	str r4, [r2]
	b endcheck	

even:
	ldr r7, [r2, #4] // stores A[i+1] in r7
	add r4, r7 // A[i] + a[i+1]
	str r4, [r2]
	b endcheck

endcheck:
	add r3, #4 // i++ address
	add r5, #1 // i++ position
	cmp r5, #10
	bgt end // i < 10
	b for
end:
	mov r7, #1
	swi 0
.section .data

	A:
	.word 2, 5, 4, 2, 5, 1 ,5, 4, 1, 10
