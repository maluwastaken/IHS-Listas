SECTION .text
    GLOBAL sort


sort:
    enter 0,0
    push ebx       

    mov eax,0
    mov ecx,[ebp+8] ;endereço do vetor
    mov edx,[ebp+12] ;tamanho do vetor
    add edx,ecx

    mov eax,dword[ecx]
    push eax
    mov dword[ecx],1000
    mov ebx,0
    call maior


    pop ebx
    leave
    ret


maior: ;posicao atual do vetor {ecx}, e coloca o maior valor na pilha
    cmp ecx,edx
    je .finish
    cmp ebx,dword[ebp+12]
    je .finish2

    pop eax
    cmp eax,dword[ecx+4*ebx]
    jle .troca

    push eax

    inc ebx
    jmp maior

    .troca:
    push dword[ecx+4*ebx]
    mov dword[ecx+4*ebx],eax
    inc ebx
    jmp maior

    .finish2:
        inc ecx
        mov ebx,0
        jmp maior
    .finish:
        ret
        


          



    
    

 
