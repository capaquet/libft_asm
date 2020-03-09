section  .text

global _ft_write

_ft_write:
    push    rbp
    mov     rbp,rsp

write:
    mov     rax, 0x2000004
    syscall
    jc      error

end:
    leave
    ret

error:
    mov     rax, -1
    jmp     end