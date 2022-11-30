[ORG 0x7C00]

; Text Mode AH and AL
    mov ah, 0x00 ;Function tipe
    mov al, 0x13
    int 0x10

; Parameters Used
    mov al, 0x01 ;Pixel color
    mov bh, 0x00 ;Page number
    mov cx, 0x00 ;posX
    mov dx, 0x00 ;posY

LOOP:
    mov ah, 0x0C
    int 0x10 ;Call Function
    cmp al,0xFF
    je ResetColor
    inc cx
    cmp cx, 0x0140
    jne LOOP
    mov cx, 0x00
    inc dx
    cmp dx, 0xC8
    jne LOOP
    mov dx, 0x00
    inc al
    cmp al,0xFF
    je ResetColor
    jmp LOOP

ResetColor:
    mov al, 0x00
    jmp LOOP

times 510-($-$$) db 0

db 0x55
db 0xAA