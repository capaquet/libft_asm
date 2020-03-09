section  .text

global _ft_read

_ft_read:
    push    rbp
    mov     rbp,rsp

read:
    mov     rax, 0x2000003
    syscall
    jc      error

end:
    leave
    ret

error:
    mov     rax, -1
    jmp     end