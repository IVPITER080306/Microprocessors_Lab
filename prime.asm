.model tiny
.186
.data
	num db 21
.code
	.startup
	mov cl, num
	dec cl
	cmp num, 1
	je not_prime
	cmp num, 2
	je is_prime
	prime_check:
		mov ah, 0
		mov al, num
		div cl
		cmp ah, 0
		je not_prime
		dec cl
		cmp cl,1
		jne prime_check
		is_prime:
			mov bl, 1
		jmp done
		not_prime:
			mov bl, 0
		done:
	.exit
end