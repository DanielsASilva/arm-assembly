.global _start

.section .text

_start:
	ldr r1, =string // gets string starting position from memory
	ldr r2, =x // gets x address
	ldr r3, =y // gets y address
	ldrb r2, [r2] // loads the value on the address
	ldrb r3, [r3]
	ldrb r4, [r1] // loads the first char into r4
	b checkx
checkx:
	cmp r4, r2
	beq replacechar // char == x
	b getchar // char != x
replacechar:
	strb r3, [r1] // replacing char for y
	b getchar
getchar:
	add r1, #1 // gets the position of the next char
	ldrb r4, [r1] // loads the next char on r4
	cmp r4, #0
	beq print // char == '\0'
	b checkx // char != '\0'
print:
	ldr r1, =string
	mov r2, #size
	mov r0, #1
	mov r7, #4
	swi 0
	b end
end:
	mov r7, #1
	swi 0

.section .data
	string:
	.asciz "sobstitoi"
	.set size, . - string
	
	x:
	.ascii "o"

	y:
	.ascii "u"
