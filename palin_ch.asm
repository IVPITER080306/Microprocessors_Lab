.model tiny
.186
.data
	array db 1, 2, 3, 2, 1
	len db 5
.code
	.startup
	mov cl, len
	shr cl, 1
	jz is_palindrome
	mov bl, len
	dec bl
	mov bh, 0
	
	lea si, array
	lea di, array
	add di, bx
	
	palindrome_check:
		mov al, [si]
		cmp al, [di]
		jne not_palindrome
		inc si
		dec di
		dec cl
		jnz palindrome_check
		is_palindrome:
			mov al, 01
			jmp done
		not_palindrome:
			mov al, 00
		done:
	.exit
end