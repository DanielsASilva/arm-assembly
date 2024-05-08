.global _start

.section .text
_start:

	mov %r0, $1
	ldr %r1, =message
	mov %r2, $13
	mov %r7, $4	
	swi $0
	
	mov %r0, $0
	mov %r7, $1
	swi $0
	
.section .data
	message:
	.ascii "Hello World!\n"
