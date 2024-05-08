.section .text
.global _start

_start:
	// loading variables into registers
	mov r0, #0 // n
	mov r1, #3 // a
	mov r2, #4 // b
	mov r3, #10 // m
	
	cmp r2, r3 // does the first comparation
	blt and // if the comparation is true branch to the and condition
	b else // if the comparation is false branch to the else condition

and:
	cmp r0, r1 // does the second comparation
	blt store
	b else // if the comparation is false branch to the else condition

store:
	mov r0, r2 // n = b
	b end

else:
	mov r0, r3 // n = m
	b end

end:
	mov r7, #1 // exit syscall
	swi #0 // invoke syscall
	
