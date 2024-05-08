.section .text
.global _start

_start:
	mov r0, #0 // x
	mov r1, #32 // a
	mov r2, #16 // b

	cmp r1, #0 // compare a to 0
	bge and // if a >=o branch to and
	b end // if not jump to end

and:
	cmp r2, #50 // compare b to 50
	addle r0, #1 // if b <= 50, add 1 to x
	b end // jump to end

end: 
	mov r7, #1 // exit syscall
	swi #0 // invoke syscall

