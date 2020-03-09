section  .text

global _ft_atoi_base

_ft_atoi_base:
    push    rbp
    mov     rbp,rsp
    xor     rax,rax
    xor     rbx,rbx
    xor     rdx,rdx

check_base_not_null_not_empty:
    test    rsi,rsi
    jz      error
    mov     byte cl,[rsi]
    test    cl,cl
    jz      error
    mov     cl,[rsi + 1]
    test    cl,cl
    jz      error
    xor     cl,cl

check_base_valid_char:
    mov     byte cl,[rsi + rdx]    
    cmp     cl,45
    je      error
    cmp     cl,43
    je      error
    inc     rdx
    mov     byte cl,[rsi + rdx]
    test    cl,cl
    jnz     check_base_valid_char
    xor     rdx,rdx        

check_str_not_null_not_empty:
    test    rsi,rdi
    jz      error
    mov     byte cl,[rdi]
    test    cl,cl
    jz      error
    xor     cl,cl

check_pos:
    mov     byte cl,[rsi]    
    cmp     cl,43
    jne     check_neg
    inc     rdi
    jmp     atoi_base

check_neg:
    mov     byte cl,[rsi]    
    cmp     cl,45
    je      atoi_base
    mov     r15,-1
    inc     rdi  

atoi_base:
    mov     r12,10
    mul     r12
    xor     rdx,rdx

search_char:
    mov     byte cl,[rsi + rdx]
    cmp     byte cl,[rdi + rbx]
    jne     next_char
    add     rax,rdx
    inc     rbx
    mov     byte cl,[rdi + rbx]
    test    cl,cl
    jz      end
    jmp     atoi_base

next_char:
    inc     rdx
    mov     cl,[rsi + rdx]
    test    cl,cl
    jz      error
    jmp     search_char

end:
    cmp     r15,-1
    je      set_neg
    leave
    ret

set_neg:
    mul     r15
    xor     r15,r15
    jmp     end

error:
    xor     rax,rax
    jmp     end