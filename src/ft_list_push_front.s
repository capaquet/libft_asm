section  .text

global      _ft_list_push_front
extern      _malloc

_ft_list_push_front:
    push    rbp
    mov     rbp,rsp
    push    rdi
    push    rsi

    mov     rdi,len
    call    _malloc
    test    rax, rax
    jz      end

    pop     rsi
    mov     [rax + data],rsi

    pop     rdi
    mov     r11,[rdi]
    mov     [rax + data + next],r11

    mov     [rdi],rax

end:
    leave
    ret

section .data
        size_i:             
        struc node
            data: resb  8
            next: resb  8
        endstruc
        len: equ $ - size_i 