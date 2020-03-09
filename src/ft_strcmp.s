section  .text

global _ft_strcmp

_ft_strcmp:
    push    rbp
    mov     rbp,rsp
    xor     rax,rax
    xor     rcx,rcx

strcmp:
    mov     cl,[rsi]
    mov     al,[rdi]
    sub     rax,rcx
    jnz     end
    or      cl,cl
    jz      end
    inc     rdi
    inc     rsi
    jmp     strcmp

end:
    leave
    ret