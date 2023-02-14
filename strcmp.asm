section .text
    global strcmp

strcmp:
    xor rcx, rcx ; set counter to 0

loop:
    mov al, byte [rdi + rcx] ; load byte from string 1
    mov bl, byte [rsi + rcx] ; load byte from string 2
    cmp al, 0x00 ; check if end of string 1
    je end ; if end of string 1, jump to end
    cmp bl, 0x00 ; check if end of string 2
    je end ; if end of string 2, jump to end
    cmp al, bl ; compare bytes
    jne end ; if not equal, jump to end
    inc rcx ; increment counter
    jmp loop ; jump to loop

equal:
    xor rcx, rcx ; set rcx to 0
    ret ; return

end:
    sub al, bl
    movsx rax, al
    ret
