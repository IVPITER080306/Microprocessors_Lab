.model tiny
.186
.data
	msg1 db 10, 13, 'Enter the array: $'
	msg2 db 10, 13, 'Enter the key to be found: $'
	msg3 db 10, 13, 'Key is at: $'
	msg4 db 10, 13, 'Key not found $'
	
	array db 10 dup(?)
	key db ?
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
	
	sort_array:
		mov ch, 10
		dec ch
		outer_loop:
			lea si, array
			mov cl, ch
			inner_loop:
				mov al, [si]
				cmp al, [si+1]
				jbe skip
				xchg al, [si+1]
				mov [si], al
				skip:
					inc si
					dec cl
					jnz inner_loop
				dec ch
				jnz outer_loop
	
	lea dx, msg2
	mov ah, 09h
	int 21h
	
	mov ah, 01h
	int 21h
	mov key, al
	
	mov dl, 0
	mov dh, 10
	dec dh
	
	
	binary_search:
	
		cmp dl, dh
		jg not_found
		
		lea si, array
		mov cl, dl
		add cl, dh
		shr cl, 1
		mov ch, 0
		add si, cx
		mov al, [si]
		cmp al, key
		je found
		jb right
		
		mov dh, cl
		dec dh
		jmp binary_search
		
		right:
			mov dl, cl
			inc dl
			jmp binary_search
		
		found:
			lea dx, msg3
			mov ah, 09h
			int 21h
			
			add cl, 30h
			mov dl, cl
			mov ah, 02h
			int 21h
			jmp done
		
		not_found:
			lea dx, msg4
			mov ah, 09h
			int 21h
		done:
	.exit
end