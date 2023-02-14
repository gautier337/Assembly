section .text
    global strcasecmp

strcasecmp:
    xor rax, rax
    xor rcx, rcx
    xor r8, r8
    cmp byte [rsi + rcx], 0x00
    je empty_rsi

loop:
    mov al, byte [rdi + rcx]
    mov r8b, byte [rsi + rcx]
    cmp al, 0x00
    je fend
    cmp r8b, 0x00
    je fend
    cmp al, "z"
    jle lower

check_r8:
    cmp r8b, "z"
    jle lower_r8
check_diff:
    cmp al, r8b
    jne fend
    inc rcx
    jmp loop

lower:
    cmp al, "a"
    jge addicant
    jmp check_r8
addicant:
    add rax, 32
    jmp check_r8

lower_r8:
    cmp r8b, "a"
    jge addicant_r8
    jmp check_diff
addicant_r8:
    add r8, 32
    jmp check_diff

ret_greater:
    mov al, [rdi + rcx]
    add al, 32
    jmp end

empty_rsi:
    cmp byte [rdi + rcx], "z"
    jle ret_lower
    jmp ret_rdi_value

ret_lower:
    cmp byte [rdi + rcx], "a"
    jge ret_greater
    jmp ret_rdi_value

fend:
    sub al, r8b
    movsx rax, al
    jmp end
ret_rdi_value:
    mov al, byte [rdi + rcx]
    jmp end

end:
    ret