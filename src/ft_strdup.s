section  .text

global _ft_strdup
extern _malloc
extern _ft_strlen
extern _ft_strcpy

_ft_strdup:
    push    rbp
    mov     rbp,rsp
    push    rbx

strdup:
    mov     rbx,rdi
    call    _ft_strlen
    mov     rdi,rax
    call    _malloc
    test    rax,rax
    jz      end
    mov     rdi,rax  
    mov     rsi,rbx
    call    _ft_strcpy

end:
    pop     rbx
    leave
    ret