section .text
    global memcpy

memcpy:
    push rbp
    mov rbp, rsp
    XOR rcx, rcx
    mov RAX, RDI

.loop:
    cmp rcx, rdx
    je end
    mov R8B, byte [rsi + rcx]
    mov byte [rax + rcx], R8B
    inc rcx
    jmp .loop

end:
    pop rbp
    ret
