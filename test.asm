.model tiny
.186
.data
	msg1 db 10, 13, 'Enter a string: $'
	msg2 db 10, 13, 'The new string is: $'
	
	str1 db 20 dup(?), '$'
.code
	.startup
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	lea si, str1
	mov cl, 20
	input_loop:
		mov ah, 01h
		int 21h
		mov [si], al
		inc si
		dec cl
		jnz input_loop
	
	lea si, str1
	lea di, str1
	mov bl, 20
	dec bl
	mov bh, 0
	add di, bx
	mov cl, 20
	shr cl, 1
	reverse_string:
		mov al, [si]
		xchg al, [di]
		mov [si], al
		inc si
		dec di
		dec cl
		jnz reverse_string
	
	print_result:
		lea dx, msg2
		mov ah, 09h
		int 21h
		
		lea dx, str1
		mov ah, 09h
		int 21h
	.exit
end