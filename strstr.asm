section .text
global strstr

strstr:
    push rbp ; sauvegarde le sommet de pile
    mov rbp, rsp ; définit rbp comme nouveau sommet de pile
    xor rax, rax ; initialise rax à zéro
    cmp byte [rsi], 0x00 ; vérifie si la première chaîne est vide
    je empty_rsi ; saute si la première chaîne est vide
    mov r8, rdi ; copie la première chaîne dans r8
    xor rcx, rcx ; initialise rcx à zéro

loop:
    mov al, byte [r8 + rcx] ; charge un caractère de la première chaîne
    cmp al, 0x00 ; vérifie si la fin de la première chaîne a été atteinte
    je end ; saute si la fin de la première chaîne a été atteinte
    push rcx ; sauvegarde rcx sur la pile
    xor rcx, rcx ; initialise rcx à zéro
    xor rdx, rdx ; initialise rdx à zéro

compare:
    mov bl, byte [r8 + rcx] ;charge un caractère de la première chaîne
    cmp bl, 0x00 ; vérifie si la fin de la première chaîne a été atteinte
    je not_found ; saute si la fin de la première chaîne a été atteinte
    cmp byte [rsi + rdx], 0x00 ; vérifie si la fin de la deuxième chaîne a été atteinte
    je found ; saute si la fin de la deuxième chaîne a été atteinte
    cmp bl, byte [rsi + rdx] ; vérifie si les caractères sont égaux
    jne not_found ; saute si les caractères ne sont pas égaux
    inc rdx ; incrémente rdx
    jmp compare ; recommence la comparaison

not_found:
    pop rcx ; récupère rcx depuis la pile
    inc rcx ; incrémente rcx
    jmp loop ; recommence la boucle principale

found:
    mov rax, r8 ; charge la première chaîne dans rax
    add rax, rcx ; ajoute rcx à rax pour obtenir l'adresse de la sous-chaîne trouvée
    jmp end ; saute à la fin

empty_rsi:
    mov rax, rdi ; définit rax comme étant égal à la première chaîne

end:
    mov rsp, rbp ; rétablit le sommet de pile
    pop rbp ; récupère le sommet de pile sauvegardé
    ret ; retourne rax (pointeur vers la sous-chaîne trouvée ou null si non trouvée)