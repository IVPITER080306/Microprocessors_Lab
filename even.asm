.model tiny
.186
.data
	array db 10, 23, 22, 34, 66, 25
.code
	mov cl, 06
	lea si, array
	mov bl, 00
	looping:
		mov al, [si]
		test al, 1
		jnz is_odd
		inc bl
	is_odd:
		inc si
		dec cl
		jnz looping
	mov byte ptr ds:[1000h], bl
.exit
end