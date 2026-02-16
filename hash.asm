.model tiny
.186
.data
	msg1 db 10, 13, 'Enter an array of values: $'
	msg2 db 10, 13, 'The hashmap is: $'
	
	array db 10 dup(?), '$'
	hashmap db 10 dup('0'), '$'
.code
	.startup
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	lea si, array
	mov cl, 10
	input_loop:
		mov ah, 01h
		int 21h
		mov [si], al
		inc si
		dec cl
		jnz input_loop
		
	lea si, array
	mov cl, 10
	hash_loop:
		mov al, [si]
		cmp al, '0'
		jl skip
		cmp al, '9'
		jg skip
		
		sub al, 30h
		mov bl, al
		mov bh, 0
		lea di, hashmap
		add di, bx
		inc byte ptr [di]
	skip:
		inc si
		dec cl
		jnz hash_loop
	print_result:
		lea dx, msg2
		mov ah, 09h
		int 21h
		
		lea dx, hashmap
		mov ah, 09h
		int 21h
	.exit
end