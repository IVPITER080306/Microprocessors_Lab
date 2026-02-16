.model tiny
.186
.data
	msg1 db 10, 13, 'Enter a number: $'
	msg2 db 10, 13, 'Number is Prime $'
	msg3 db 10, 13, 'Number is not Prime $'
	
	num1 db ?, ?
.code
	.startup
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	lea di, num1
	mov ah, 01h
	int 21h
	cmp al, '-'
	je neg_num
	mov byte ptr [di], al
	inc di
	sub al, 30h
	mov ah, 0
	mov cl, 10
	mul cl
	mov bl, al
	mov ah, 01h
	int 21h
	sub al, 30h
	mov byte ptr [di], al
	add bl, al
	
	
	cmp bl, 2
	je prime
	
	cmp bl, 1
	je not_prime
	
	cmp bl, 0
	je not_prime
	
	mov cl, bl
	dec cl
	prime_logic:
		mov ah, 0
		mov al, bl
		div cl
		cmp ah, 0
		je not_prime
		dec cl
		cmp cl, 1
		jne prime_logic
		jmp prime
	
	not_prime:
		lea dx, msg3
		mov ah, 09h
		int 21h
		jmp done
	
	neg_num:
		mov ah, 01h
		int 21h
		mov ah, 01h
		int 21h
		lea dx, msg3
		mov ah, 09h
		int 21h
		jmp done
		
	prime:
		lea dx, msg2
		mov ah, 09h
		int 21h
		
	done:
	.exit
end