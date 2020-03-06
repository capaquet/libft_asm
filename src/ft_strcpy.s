section  .text

global _ft_strcpy

_ft_strcpy:
    push    rbp
    mov     rbp,rsp
    mov     rax,rdi
    
loop:
    mov     byte cl,[rsi]
    test    cl,cl
    mov     byte [rdi], 0x0
    jz      end
    mov     byte [rdi],cl
    inc     rdi
    inc     rsi
    jmp     loop

end:
    leave
    ret