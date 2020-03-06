section  .text

global _ft_strlen

_ft_strlen:
    push    rbp
    mov     rbp,rsp
    xor     rax,rax
    
loop:
    mov     byte cl,[rdi + rax]
    test    cl,cl
    jz      end
    inc     rax
    jmp     loop

end:
    leave
    ret