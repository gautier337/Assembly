section .text
    global strrchr  ; Declare the label "strchr" as a global symbol

strrchr:
    cmp  rdi, 0 ; Compare the value of rdi with 0
    je  return_null          ; If they are equal, jump to the label "return_null"
    mov  rax, rdi  ; Move the value of rdi into rax
    mov  bl, sil ; Move the value of sil into bl
    cmp byte [rax], 0 ; Compare the first character of the string with 0
    je  return_null ; If they are equal, jump to the label ".done"

forward_pointer_to_end:
    cmp  byte [rax], 0 ; Compare the value of the byte at rax with 0
    je loop ; jump to loop if ZF is set
	je	return_null
    inc  rax           ; Increment the value of rax by 1
    jmp  forward_pointer_to_end         ; Jump to the label ".loop"

loop:
    cmp  byte [rax], bl ; Compare the value of the byte at rax with bl (second argument)
    je  done          ; If they are equal, jump to the label ".done"
    cmp rax, rdi ; Compare the value of rax with rdi
	je return_null  ; If they are equal, jump to the label ".done"
    dec  rax           ; decrement the value of rax by 1
    jmp  loop         ; Jump to the label ".loop"

return_null:
    xor rax, rax ; Set RAX to 0
    ret; Return from the function

done:
    ret               ; Return from the function
