.model tiny
.186
.data
	msg1 db 10, 13, 'Enter an alphabet: $'
	msg2 db 10, 13, 'Enter a valid character: $'
	msg3 db 10, 13, 'The Upper-Case value is: $'
	
	char1 db ?
.code
	.startup
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	take_char:
		mov ah, 01h
		int 21h
		
		cmp al, 'A'
		jl invalid_char
		cmp al, 'z'
		jg invalid_char
		
		cmp al, ']'
		je invalid_char
		
		cmp al, '['
		je invalid_char
		
		cmp al, '^'
		je invalid_char
		
		cmp al, '_'
		je invalid_char
		
		cmp al, 05ch
		je invalid_char
		
		cmp al, 060h
		je invalid_char
		
		jmp compare_logic
	
	invalid_char:
		lea dx, msg2
		mov ah, 09h
		int 21h
		jmp take_char
	
	compare_logic:
		cmp al, 'a'
		jge convert_to_capital
		mov char1,al
		jmp print_logic
		
		convert_to_capital:
			sub al, 20h
			mov char1, al
	
	print_logic:
		lea dx, msg3
		mov ah, 09h
		int 21h
		
		mov dl, char1
		mov ah, 02h
		int 21h
	.exit
end