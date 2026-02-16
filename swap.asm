.model tiny
.186
.data
	array db 10, 20, 30, 40, 50
	len db 5
.code
	.startup
	lea si, array
	lea di, array
	mov bl, len
	mov bh, 0
	dec bx
	add di, bx
	
	mov cl, len
	shr cl, 1
	
	swap_loop:
		mov al, [si]
		mov bl, [di]
		
		mov [si], bl
		mov [di], al
		
		inc si
		dec di
		dec cl
		jnz swap_loop
	.exit
end