.model tiny
.186
.code
       
.startup

    mov ax, 81h   
    mov cl, 20h
    div cl         

    mov byte ptr ds:[1000h], 81h   
    mov byte ptr ds:[1001h], 20h
    
    mov ds:[2000h], ah             

    .exit
end