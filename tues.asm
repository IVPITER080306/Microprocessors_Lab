.model tiny
.186
.data
	msg1 db 10, 13, 'Enter First Number: $'
	msg2 db 10, 13, 'Enter Second Number: $'
	msg3 db 10, 13, 'The larger number is: $'
	
	num1 db ?
	num2 db ?
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
	jmp start_input2
	
	num1_neg:
		mov ah, 01h
		int 21h
		sub al, 30h
		neg al
		mov num1, al
	
	start_input2:
		lea dx, msg2
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		
		cmp al, '-'
		je num2_neg
		
		sub al, 30h
		mov num2, al
		jmp compare_logic
		
			num2_neg:
				mov ah, 01h
				int 21h
				sub al, 30h
				neg al
				mov num2, al
	
	compare_logic:
		lea dx, msg3
		mov ah, 09h
		int 21h
		
		mov al, num1
		cmp al, num2
		jg num1_big
		
		mov al, num2
		jmp print_res
		
		num1_big:
			mov al, num1
	
	print_res:
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