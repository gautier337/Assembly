section .text
    global memset

memset:
    mov rax, rdi                ; copy pointer to rax
    mov bl, sil                 ; copy character to fill with to bl
    mov rcx, rdx                ; copy number of bytes to fill to rcx

loop:
    cmp rcx, 0                  ; check if we are done
    je end                     ; if so, jump to end
    mov byte [rax], bl          ; fill byte at rax with the character
    inc rax                     ; increment rax
    dec rcx                     ; decrement rcx
    jmp loop                    ; jump to loop

end:
    ret
