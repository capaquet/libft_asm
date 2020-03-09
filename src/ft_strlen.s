section  .text

global _ft_strlen

_ft_strlen:
    push    rbp
    mov     rbp,rsp
    xor     rax,rax
    
strlen:
    mov     byte cl,[rdi + rax]
    test    cl,cl
    jz      end
    inc     rax
    jmp     strlen

end:
    leave
    ret