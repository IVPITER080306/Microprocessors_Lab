.model tiny
.186
.data
	mat1 db 1, 2, 3, 4
	mat2 db 5, 6, 7, 8
	res db 0, 0, 0, 0
	len db 4
	
.code
	.startup
	mov cl, len
	lea si, mat1
	lea bx, mat2
	lea di, res
	
	add_mat:
		mov al, [si]
		add al, [bx]
		mov [di], al
		inc si
		inc bx
		inc di
		dec cl
		jnz add_mat		
	.exit
end