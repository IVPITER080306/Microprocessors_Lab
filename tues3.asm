.model tiny
.186
.data
	msg1 db 10, 13, 'The first number is: $'
	msg2 db 10, 13, 'The second number is: $'
	msg3 db 10, 13, 'The third number is: $'
	msg4 db 10, 13, 'The largest number is: $'
	
	num1 db ?
	num2 db ?
	num3 db ?
.code
	.startup
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	mov ah, 01h
	int 21h
	
	cmp al, '-'
	je num1_neg
	
	sub al, 30h
	mov num1, al
	jmp get_num2
	
	num1_neg:
		mov ah, 01h
		int 21h
		sub al, 30h
		neg al
		mov num1, al
	
	get_num2:
		lea dx, msg2
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		
		cmp al, '-'
		je num2_neg
		
		sub al, 30h
		mov num2, al
		jmp get_num3
		
		num2_neg:
			mov ah, 01h
			int 21h
			sub al, 30h
			neg al
			mov num2, al
	
	get_num3:
		lea dx, msg3
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		
		cmp al, '-'
		je num3_neg
		
		sub al, 30h
		mov num3, al
		jmp compare_logic
		
		num3_neg:
			mov ah, 01h
			int 21h
			sub al, 30h
			neg al
			mov num3, al
	
	compare_logic:
		lea dx, msg4
		mov ah, 09h
		int 21h
		
		mov al, num1
		cmp al, num2
		jg num3_compare
		mov al, num2
		jmp num3_compare
		
		num3_compare:
			cmp al, num3
			jl num3_is_big
			jmp print_logic
			
			num3_is_big:
				mov al, num3
	
	print_logic:
		cmp al, 0
		jge print_pos
		
		mov bl, al
		mov dl, '-'
		mov ah, 02h
		int 21h
		mov al, bl
		neg al
		
		print_pos:
			add al, 30h
			mov dl, al
			mov ah, 02h
			int 21h
	.exit
end