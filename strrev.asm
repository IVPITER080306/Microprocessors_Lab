.model tiny
.186
.data
	msg1 db 10, 13, 'Input Your String: $'
	msg2 db 10, 13, 'Your String Reversed is: $'
	
	str1 db 5 dup(?),'$'
.code
	.startup
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	lea si, str1
	mov cl, 5
	input_loop:
		mov ah, 01h
		int 21h
		mov [si], al
		inc si
		dec cl
		jnz input_loop
	
	lea si, str1
	lea di, str1
	add di, 5
	dec di
	mov cl, 5
	shr cl, 1
	reverse_loop:
		mov al, [si]
		xchg al, [di]
		mov [si], al
		inc si
		dec di
		dec cl
		jnz reverse_loop
	
	print_loop:
		lea dx, msg2
		mov ah, 09h
		int 21h
		
		lea dx, str1
		mov ah, 09h
		int 21h
	.exit
end