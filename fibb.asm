.model tiny
.186
.data
	fibb db 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0
	len db 11
.code
	.startup
	mov cl, len
	sub cl, 2
	lea si, fibb
	fibonacci_gen:
		mov al, [si]
		add al, [si+1]
		mov [si+2], al
		inc si
		dec cl
		jnz fibonacci_gen
	.exit
end