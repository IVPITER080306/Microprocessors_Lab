.model tiny
.186
.data
	msg1 db 10, 13, 'Enter a number: $'
	msg2 db 10, 13, 'Pyramid is formed!!!!! $'
	
	num db ?
	clr_line db 10, 13, '$'
.code
	.startup
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	mov ah, 01h
	int 21h
	sub al, 30h
	mov bl, 10
	mul bl
	mov num, al
	mov ah, 01h
	int 21h
	sub al, 30h
	add num, al
	
	lea dx, clr_line
	mov ah, 09h
	int 21h
	
	mov cl, 1
	row_logic:
		mov al, num
		mov bl, cl
		
	star_logic:
		mov dl, '*'
		mov ah, 02h
		int 21h
		dec bl
		jnz star_logic
		inc cl
		mov al, num
		cmp cl, al
		ja print_response
		lea dx, clr_line
		mov ah, 09h
		int 21h
		jmp row_logic
		
	print_response:
		lea dx, msg2
		mov ah, 09h
		int 21h
	.exit
end