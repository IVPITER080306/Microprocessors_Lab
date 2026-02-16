.model tiny
.186
.data
	array db 10, 20 , 01, 03, 05, 21, 23, 40, 43, 06
	len db 10
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
			jbe skip_swap
			xchg al, [si+1]
			mov [si], al
			skip_swap:
				inc si
				dec cl
				jnz inner_loop
			dec ch
			jnz outer_loop
	.exit
end