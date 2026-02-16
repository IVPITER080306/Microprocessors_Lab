.model tiny
.186
.data
	msg1 db 10, 13, 'Enter an array of 5: $'
	msg2 db 10, 13, 'Enter your key: $'
	msg3 db 10, 13, 'Your key is at position: $'
	msg4 db 10, 13, 'Key was not found $'
	
	array db 5 dup(?)
	key db ?
.code
	.startup
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	mov cl, 5
	lea di, array
	
	input_loop:
		mov ah, 01h
		int 21h
		mov [di], al
		inc di
		dec cl
		jnz input_loop
	
	lea dx, msg2
	mov ah, 09h
	int 21h
	
	mov ah, 01h
	int 21h
	mov key, al
	
	lea di, array
	mov cl, 5
	search_loop:
		mov al, [di]
		cmp al, key
		je found
		inc di
		dec cl
		jnz search_loop
		lea dx, msg4
		mov ah, 09h
		int 21h
		jmp done
		
		found:
			mov bl, 5
			sub bl, cl
			inc bl
			add bl, 30h
			lea dx, msg3
			mov ah, 09h
			int 21h
			mov dl, bl
			mov ah, 02h
			int 21h
	done:
	.exit
end