.model tiny
.186
.data
	array db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	len db 10
	k db 2
.code
	.startup
	mov cl, len
	mov bl, len
	dec bl
	mov bh, 0
	shr cl, 1
	lea si, array
	lea di, array
	add di, bx
	reverse_array:
		mov al, [si]
		xchg al, [di]
		mov [si], al
		inc si
		dec di
		dec cl
		jnz reverse_array
	mov cl, k
	shr cl, 1
	mov bl, k
	dec bl
	mov bh, 0
	lea si, array
	lea di, array
	add di, bx
	reverse_k:
		mov al, [si]
		xchg al, [di]
		mov [si], al
		inc si
		dec di
		dec cl
		jnz reverse_k
	mov cl, len
	sub cl, k
	shr cl, 1
	mov bl, k
	mov bh, 0
	mov dl, len
	dec dl
	mov dh, 0
	lea si, array
	add si, bl
	lea di, array
	add di, dx
	reverse_rest:
		mov al, [si]
		xchg al, [di]
		mov [si], al
		inc si
		dec di
		dec cl
		jnz reverse_rest
	.exit
end