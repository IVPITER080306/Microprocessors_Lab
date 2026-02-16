.model tiny
.186
.data
    
    storedUser db 'Username  '  
    storedPass db 'lmao    '    
    
    msgUser  db 'Enter Username: $'
    msgPass  db 0Dh, 0Ah, 'Enter Password: $'
    msgHello db 0Dh, 0Ah, 'Hello $'
    newline  db 0Dh, 0Ah, '$'
    
    
    inUser db 10 dup(?)
    terminator db '$'       
    inPass db 8 dup(?)

.code
    .startup
    mov ah, 09h
    lea dx, msgUser
    int 21h

    mov cx, 10
    lea si, inUser
    
    readUserLoop:
        mov ah, 01h
        int 21h
        mov [si], al
        inc si              
        dec cx
        jnz readUserLoop
    
    
    lea si, inUser
    lea di, storedUser
    mov cx, 10
    
    checkUser:
        mov al, [si]
        cmp al, [di]
        jne exitProgram
        inc si
        inc di
        dec cx              
        jnz checkUser
    
   
    mov ah, 09h
    lea dx, msgPass
    int 21h
    
    mov cx, 08
    lea si, inPass
    
    readPassLoop:
        mov ah, 07h        
        int 21h
        mov [si], al
        inc si
        
        ; Print Star
        mov dl, '*'
        mov ah, 02h
        int 21h
        
        dec cx
        jnz readPassLoop

  
    lea si, inPass
    lea di, storedPass
    mov cx, 08
    
    checkPass:
        mov al, [si]
        cmp al, [di]
        jne exitProgram     
        inc si
        inc di
        dec cx
        jnz checkPass

    
    mov ah, 09h
    lea dx, msgHello
    int 21h
    
    
    lea dx, inUser
    mov ah, 09h
    int 21h

    exitProgram:
    .exit
end