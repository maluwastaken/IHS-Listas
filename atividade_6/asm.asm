SECTION .data
    size dd 0
    v_atual dd 0
    temp dd 0
    temp2 dd 0


SECTION .text
    GLOBAL sort

sort:
    enter 0,0
    push ebx       

    mov eax,0
    mov ecx,[ebp+8] ;endereço do vetor
    mov edx,[ebp+12] ;tamanho do vetor
    
    mov dword[size],edx
    mov ebx, dword[temp]        ;pega o valor inicial de ebx que é 0
    call sortaux

    pop ebx
    leave
    ret


sortaux: ;insertion sort
    mov eax,dword[ecx+4*ebx]
    mov dword[v_atual],eax            ;assume o valor como a primeira posição 


    cmp ebx,dword[size]              ;compara se ebx é igual ao tamanho do vetor se sim, o loop externo acabou
    jge .finish2

    .loop:
        cmp ebx,dword[size]         ;compara se ebx é igual ao tamanho do vetor se sim, o loop interno acabou
        jge .finish1
    
        inc ebx                     ;incrementa ebx para pegar o proximo valor do vetor
        mov edx,dword[ecx+4*ebx]    
        cmp edx,dword[v_atual]      ;compara se o valor atual é maior ou igual ao proximo valor, se não for continua o loop
        jge .loop

        mov dword[v_atual],edx     ;se o proximo valor é um valor menor que o atual, trocamos o valor atual pelo proximo valor
        mov dword[temp2],ebx        ;salvamos a posição do menor valor no vetor

        jmp .loop

    .finish1:

        mov edx,dword[v_atual]             ;no final do primeiro loop, trocamos o valor da posição atual da posição i 
        mov ebx,dword[temp]                ; com o valor da posição que contem o menor numero
        xchg edx,dword[ecx+4*ebx]
        mov ebx,dword[temp2]
        mov dword[ecx+4*ebx],edx


        inc dword[temp]                 ;acrescentamos o valor de i, resetamos o valor da posição do nemor valor
        mov ebx,dword[temp]
        mov dword[temp2],ebx
        jmp sortaux
    .finish2:
                                        ;voltamos para a chamada da função
        ret

    
