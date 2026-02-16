.model tiny
.186
.data
	msg1 db 10, 13, 'Enter your String: $'
	msg2 db 10, 13, 'The new String is: $'
	
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
	mov cl, 20
	scan_loop:
		mov al, [si]
		cmp al, 'c'
		je scan_more
		restart_scan:
			inc si
			dec cl
			jnz scan_loop
			jmp print_result
	scan_more:
		mov al, [si+1]
		cmp al, 'a'
		je last_scan
		jmp restart_scan
	last_scan:
		mov al, [si+2]
		cmp al, 't'
		je cat_found
		jmp restart_scan
	cat_found:
		mov byte ptr [si], 'd'
		mov byte ptr [si+1], 'o'
		mov byte ptr [si+2], 'g'
		jmp restart_scan
	print_result:
		lea dx, msg2
		mov ah, 09h
		int 21h
		
		lea dx, str1
		mov ah, 09h
		int 21h
	.exit
end