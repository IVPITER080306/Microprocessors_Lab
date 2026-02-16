.model tiny
.186
.data
	fac dw 6
.code
	.startup
	mov ax, fac
	mov cx, fac
	dec cx
	factorial:
		mul cx
		dec cx
		cmp cx, 1
		jne factorial
	.exit
end