section .text
    global memmove

memmove:
    push rbp
    mov rbp, rsp
    xor rcx, rcx
    xor R8, R8
    sub rsp, rdx
    cmp rdx, 0x00
    je ret_rdi
loop:
    mov R8, qword [RSI + rcx]
    mov byte [rsp + rcx], r8b
    inc rcx
    cmp rcx, rdx
    jne loop
    mov rsi, rsp
    call memcpy
    jmp fend

memcpy:
    xor rcx,  rcx
    mov rax, RDI

memloop:
    cmp rcx, rdx
    je fend
    mov r8b, byte [rsi + rcx]
    mov byte [rax + rcx], r8b
    inc rcx
    jmp memloop

ret_rdi:
    mov rax, RDI
fend:
    mov rsp, rbp
    POP rbp
    jmp end

end:
    ret