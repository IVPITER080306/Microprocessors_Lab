.model tiny
.186
.data
	newline db 0Dh, 0Ah, '$'
	userString db 21, ? , 21 dup('$')
.code
	.startup
	mov ah, 0Ah
	lea dx, userString
	int 21h
	
	mov ah, 09h
	lea dx, newline
	int 21h
	
	mov ah, 09h
	lea dx, userString+2
	int 21h
	.exit
end