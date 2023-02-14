section .text
    global strchr  ; Declare the label "strchr" as a global symbol

strchr:
    cmp  rdi, 0 ; Compare the value of rdi with 0
    je  return_null          ; If they are equal, jump to the label "return_null"
    mov  rax, rdi  ; Move the value of rdi into rcx
    mov  bl, sil ; Move the value of sil into bl
    cmp byte [rax], 0 ; Compare the first character of the string with 0
    je  return_null ; If they are equal, jump to the label ".done"

loop:
    cmp  byte [rax], bl ; Compare the value of the byte at rdi with bl (second argument)
    je  done          ; If they are equal, jump to the label ".done"
    cmp byte [rax], 0 ; Compare the value of the byte at rdi with 0
    je  return_null ; If they are equal, jump to the label ".done"
    inc  rax           ; Increment the value of rax by 1
    jmp  loop         ; Jump to the label ".loop"

return_null:
    xor rax, rax ; Set RAX to 0
    ret; Return from the function

done:
    ret               ; Return from the function
