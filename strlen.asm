section .text
    global strlen  ; Declare the label "strlen" as a global symbol

strlen:           ; Label "strlen" represents the start of the function
    mov rax, 0  ; set register rax to 0 (accumulator register)
    mov rcx, 0  ; Zero out the rcx register (counter register)
    mov rdi, rdi  ; Move the value of rdi into rdi (destination register)

loop:            ; Label ".loop" represents the start of a loop
    cmp byte [rdi + rcx], 0 ; Compare the value at the address in rdi + rcx with 0
    je done      ; If the result of the comparison is equal, jump to label ".done"
    inc rcx       ; Increment the rcx register
    jmp loop     ; Jump back to the start of the loop

done:            ; Label ".done" represents the end of the loop
    mov rax, rcx  ; Move the value of rcx into rax
    ret           ; Return from the function
