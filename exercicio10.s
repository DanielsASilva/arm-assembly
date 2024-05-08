.global _start

.section .text
_start:
	ldr r0, =A // gets A starting position in memory
	ldr r1, =B // gets B starting position in memory
	mov r6, #3 // C = 3
	b for

for:
	mov r2, r0 // moves A address to r2
	mov r3, r1 // moves B addres to r3
	add r2, r8 // adds the offset and finds i position in A
	add r3, r8 // adds the offset and finds i position in B
	ldr r4, [r2] // loads the contents of A[i]
	ldr r5, [r3] // loads the contents of B[i]
	cmp r4, r5
	blt if1 // A[i] < B[i]
	b else
if1:
	cmp r2, #0
	bne ifoperation // A[i] != 0
	b else
ifoperation:
	add r5, r6 // B[i] + C
	str r5, [r2] // A[i] = B[i] + C
	b endcheck
else:
	sub r5, r6 // B[i] - C
	str r5, [r2] // A[i] = B[i] - C
	b endcheck
endcheck:
	add r7, #1 // i++ position
	add r8, #4 // i++ address offset
	cmp r7, #100 // i < 100
	bgt end
	b for
end:
	mov r7, #1
	swi 0
.section .data

	A:
	.word  3, 8, 1, 5, 9, 2, 4, 6, 7, 10, 17, 12, 0, 15, 11, 13, 18, 16, 20, 14, 19, 2, 6, 3, 8, 5, 10, 7, 9, 4, 1, 12, 14, 15, 11, 18, 16, 19, 0, 20, 17, 13, 2, 3, 4, 1, 5, 7, 6, 9, 8, 10, 11, 12, 13, 15, 14, 16, 17, 18, 19, 0, 20, 3, 8, 2, 7, 6, 1, 4, 9, 5, 10, 11, 12, 0, 13, 15, 14, 18, 17, 19, 16, 20, 3, 1, 2, 4, 5, 7, 9, 8, 6, 10, 12, 11, 13, 0, 15, 14, 16

	B:
	.word 6, 5, 4, 9, 3, 7, 2, 1, 0, 8, 13, 10, 14, 11, 12, 15, 19, 16, 17, 18, 20, 7, 3, 5, 8, 4, 2, 6, 9, 1, 0, 12, 11, 10, 14, 15, 13, 17, 16, 20, 18, 19, 3, 7, 2, 4, 8, 6, 1, 5, 0, 9, 11, 10, 12, 14, 13, 15, 17, 16, 18, 19, 20, 5, 4, 6, 3, 7, 9, 8, 2, 0, 1, 13, 11, 14, 15, 12, 10, 16, 18, 17, 19, 20, 3, 5, 4, 8, 6, 7, 9, 2, 1, 0, 12, 11, 10, 13, 14, 15
