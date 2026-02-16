.model tiny
.186
.data
array db 10, 20, 30, 40, 01, 02, 03
.code
	.startup
		lea si, array
		mov cl, 06
		mov al, [si]
		looping:
			cmp al, [si+1]
			jbe skip
			mov al, [si+1]
			skip:
				inc si
				dec cl
				jnz looping
			mov ds: [1000h], al
	.exit
end
