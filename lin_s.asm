.model tiny
.186
.data
	array db 01, 03, 05, 32, 46, 53, 22, 12, 08, 30
	key db 32
.code
	.startup
	mov cl, 10
	lea si, array
	find:
		mov al, [si]
		cmp al, key
		je found
		inc si
		dec cl
		jnz find
		mov byte ptr ds:[2000h], 00
		jmp done
			found:
			mov byte ptr ds:[2000h], 01
				done:
	.exit
end