section  .text

global _ft_atoi_base

_ft_atoi_base:
    push    rbp
    mov     rbp,rsp
    push    rbx
    xor     rax,rax
    xor     rbx,rbx
    xor     rdx,rdx

check_base_not_null_not_empty:
    test    rsi,rsi
    jz      error
    mov     cl, byte [rsi]
    test    cl,cl
    jz      error
    mov     cl,[rsi + 1]
    test    cl,cl
    jz      error
    xor     cl,cl

check_base_valid_char:
    mov     cl, byte [rsi + rdx]    
    cmp     cl,45
    je      error
    cmp     cl,43
    je      error
    inc     rdx
    mov     cl, byte [rsi + rdx]
    test    cl,cl
    jnz     check_base_valid_char
    xor     rdx,rdx        

check_str_not_null_not_empty:
    test    rsi,rdi
    jz      error
    mov     cl, byte [rdi]
    test    cl,cl
    jz      error
    xor     cl,cl

check_pos:
    mov     cl, byte [rsi]    
    cmp     cl,43
    jne     check_neg
    inc     rdi
    jmp     atoi_base

check_neg:
    mov     cl, byte [rsi]    
    cmp     cl,45
    je      atoi_base
    mov     r10,-1
    inc     rdi  

atoi_base:
    mov     r11,10
    mul     r11
    xor     rdx,rdx

search_char:
    mov     cl, byte [rsi + rdx]
    cmp     cl, byte [rdi + rbx]
    jne     next_char
    add     rax,rdx
    inc     rbx
    mov     cl, byte [rdi + rbx]
    test    cl,cl
    jz      end
    jmp     atoi_base

next_char:
    inc     rdx
    mov     cl, byte [rsi + rdx]
    test    cl,cl
    jz      error
    jmp     search_char

end:
    cmp     r10,-1
    je      set_neg
    pop     rbx
    leave
    ret

set_neg:
    mul     r10
    xor     r10,r10
    jmp     end

error:
    xor     rax,rax
    jmp     end