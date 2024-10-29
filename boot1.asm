jmp $ ; jump to current mem address

; $$ -> beginning of current section
; 510 bytes - (start of current code - beginning of current section)
; ($ - $$) = 3
times 510-($-$$) db 0 ; db -> define byte 0 until 3+(510-3)
db 0x55, 0xaa ; define last two bytes
; 3 + 510-3 + 2 = 512 bytes -> this is the correct length of an MBR