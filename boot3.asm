[org 0x7c00]

mov ah, 0x0e
mov bx, toPrint ; move address of toPrint label to bx

printString:
    mov al, [bx] ; grab value from memory address in register bx (dereference address)
    cmp al, 0 ; strings are 0 terminated so if al now contains 0 jmp to end
    je end ; exit loop
    int 0x10 ; interrupt to force char to be printed
    inc bx ; step pointer
    jmp printString ; around we go again
end:

jmp $ ; jump to current mem address

toPrint:
    db "hello bios", 0

times 510-($-$$) db 0 ; db -> define byte 0 until 3+(510-3)
db 0x55, 0xaa ; define last two bytes