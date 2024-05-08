.global _start

.section .text
_start:
	mov r1, #2
	mov r2, #7
multiply:
	add r0, r1
	add r3, #1
	cmp r3, r2
	bge end
	b multiply
end:
	mov r7, #1
	swi #0
