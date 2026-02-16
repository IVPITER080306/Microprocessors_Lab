.model tiny
.186
.data
	array db 10, 11, 21, 32, 44, 56, 36, 44, 12, 67
	len db 10
	key db 44
.code
	.startup
	mov ch, len
	dec ch
	outer_loop:
		mov cl, ch
		lea si, array
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
	
	mov dl, 0
	mov dh, len
	dec dh
	
	binary_search:
		cmp dl, dh
		ja not_found
		
		mov cl, dl
		add cl, dh
		shr cl, 1
		
		mov bl, cl
		mov bh, 0
		
		lea si, array
		add si, bx
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
		
		not_found:
			mov bl, 0ffh
			jmp done
		
		found:
			mov bl, cl
		done:
	.exit
end