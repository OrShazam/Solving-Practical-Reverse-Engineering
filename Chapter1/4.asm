strlen:
    mov rdx,rdi
    xor rcx,rcx
    inc rcx
    neg rcx
    repne scasb
    add rcx, 2
    neg rcx
    mov rdi,rdx
    mov rax,rcx
    ret 
strchr:
    xor rax,rax
    lea rsi,rsi
    mov al, BYTE PTR[rsi]
    xor rcx,rcx
    inc rcx
    neg rcx
    repne scasb
    mov rax,rdi
    ret 
memcpy:
    mov rax,rdi
    mov rbx,rsi
    mov rcx, rdx
    rep movsb
    mov rdi,rax
    mov rsi,rbx
    ret 
memset:
    xor rax,rax
    mov rbx, rdi
    lea rsi,rsi
    mov al, BYTE PTR[rsi]
    mov rcx,rdx
    rep stosb
    mov rdi,rbx
    ret 
strcmp:
    xor rax,rax
    xor rbx,rbx
    xor rcx,rcx
    .check:
        mov bl, BYTE PTR[rdi]
        mov cl, BYTE PTR[rsi]
        test bl,bl
        jz ret_zero
        test cl,cl
        jz ret_zero 
        cmp  bl,cl
        jg ret_one
        jl ret_minus_one
        jmp .check
    ret_zero:
        ret
    ret_one:
        inc rax
        ret
    ret_minus_one:
        dec rax
        ret          
strset:
    call memset
    ret 
    
    
