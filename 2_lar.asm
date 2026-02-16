.model tiny
.186
.data
	array db 10, 20, 21, 30, 30, 25, 40, 45, 60, 60
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
	mov bl, len
	mov bh, 0
	dec bx
	lea si, array
	add si, bx
	mov al, [si]
	scan_back:
		cmp al, [si-1]
		jne found
		dec si
		dec bl
		jnz scan_back
	found:
		mov al, [si-1]
		mov byte ptr ds:[1000h], al
	.exit
end