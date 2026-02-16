.model tiny
.186
.data
	msg1 db 10, 13, 'Enter an array: $'
	msg2 db 10, 13, 'The prime number list is: $'
	
	array db 10 dup(?)
	primemap db 10 dup(?), '$'
.code
	.startup
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	lea di, array
	mov cl, 10
	input_loop:
		mov ah, 01h
		int 21h
		mov [di], al
		inc di
		dec cl
		jnz input_loop
	
	lea di, array
	lea si, primemap
	mov ch, 10
	prime_loop:
		mov al, [di]
		sub al, 30h
		mov cl, al
		dec cl
		
		cmp al, 2
		je prime
		
		cmp al, 1
		je not_prime
		
		cmp al, 0
		je not_prime
		
		prime_check:
			mov al, [di]
			sub al, 30h
			mov ah, 0
			div cl
			cmp ah, 0
			je not_prime
			dec cl
			cmp cl, 1
			jne prime_check
			prime:
				mov bl, '1'
				mov [si], bl
				inc si
				inc di
				dec ch
				jnz prime_loop
				jmp print_results
			not_prime:
				mov bl, '0'
				mov [si], bl
				inc si
				inc di
				dec ch
				jnz prime_loop
	print_results:
		lea dx, msg2
		mov ah, 09h
		int 21h
		
		lea dx, primemap
		mov ah, 09h
		int 21h
	.exit
end