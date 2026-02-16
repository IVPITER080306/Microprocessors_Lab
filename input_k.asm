.model tiny
.186
.data
	msg1 db 10, 13, 'Enter desired array: $'
	msg2 db 10, 13, 'Enter value of k: $'
	msg3 db 10, 13, 'k times reversed array is: $'
	
	array db 5 dup(?), '$'
	k db ?
	len db 5
.code
	.startup
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	lea si, array
	mov cl, len
	input_loop:
		mov ah, 01h
		int 21h
		mov [si], al
		inc si
		dec cl
		jnz input_loop
	input_k:
		lea dx, msg2
		mov ah, 09h
		int 21h
		
		lea di, k
		mov ah, 01h
		int 21h
		sub al, 30h
		mov [di], al
		
	lea si, array
	mov bh, 0
	mov bl, len
	dec bl
	lea di, array
	add di, bx
	mov cl,len
	shr cl, 1
	reverse_array:
		mov al, [si]
		xchg al, [di]
		mov [si], al
		inc si
		dec di
		dec cl
		jnz reverse_array
	
	lea si, array
	lea di, array
	mov bh, 0
	mov bl, k
	dec bl
	add di, bx
	mov cl, k
	shr cl, 1
	cmp cl, 0
	je start_rest
	reverse_k:
		mov al, [si]
		xchg al, [di]
		mov [si], al
		inc si
		dec di
		dec cl
		jnz reverse_k
		
	start_rest:
		lea si,array
		lea di, array
		mov bl, k
		mov bh, 0
		mov dl, len
		dec dl
		mov dh, 0
		add si, bx
		add di, dx
		mov cl, len
		sub cl, k
		shr cl, 1
		cmp cl, 0
		je print_result
	reverse_rest:
		mov al, [si]
		xchg al, [di]
		mov [si], al
		inc si
		dec di
		dec cl
		jnz reverse_rest
	
	print_result:
		lea dx, msg3
		mov ah, 09h
		int 21h
		
		lea dx, array
		mov ah, 09h
		int 21h
	.exit
end