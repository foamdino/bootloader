mov ah, 0x0e
mov al, 'C'
int 0x10
mov ah, 0x0e
mov al, 't'
int 0x10
mov ah, 0x0e
mov al, 'h'
int 0x10
mov ah, 0x0e
mov al, 'u'
int 0x10
mov ah, 0x0e
mov al, 'l'
int 0x10
mov ah, 0x0e
mov al, 'h'
int 0x10
mov ah, 0x0e
mov al, 'u'
int 0x10

mov ah, 0x0e
mov al, 65
int 0x10 ; call interupt to print 'A'

loop:
    add al, 32 + 1
    int 0x10
    cmp al, 'z' ; check for end of alphabet here as we print 2 chars / iteration but we pre-print 'A'
    je exit
    sub al, 1fh
    int 0x10
    jmp loop

exit:
    jmp $ ; jump to current mem address

; $$ -> beginning of current section
; 510 bytes - (start of current code - beginning of current section)
; ($ - $$) = 3
times 510-($-$$) db 0 ; db -> define byte 0 until 3+(510-3)
db 0x55, 0xaa ; define last two bytes
; 3 + 510-3 + 2 = 512 bytes -> this is the correct length of an MBR