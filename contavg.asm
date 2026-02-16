.model tiny
.186
.data
	msg1 db 10, 13, 'Start entering the number: $'
	msg2 db 10, 13, 'The current mean is: $'
	
	count db 0
	sum db 0
.code
	.startup
	mov cl, 5
	avg_loop:
		lea dx, msg1
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		sub al, 30h
		
		add sum, al
		inc count
		
		mov ax, 0
		mov al, sum
		div count
		mov bl,al
		
		lea dx, msg2
		mov ah, 09h
		int 21h
		
		mov dl, bl
		add dl, 30h
		mov ah, 02h
		int 21h
		
		dec cl
		jnz avg_loop
	.exit
end