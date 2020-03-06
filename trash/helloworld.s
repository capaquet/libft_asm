section .text
    global start
    global _main
    global traitement

load:
    MOV  RDI,1
    MOV  RSI,msg
    MOV  RDX,10

traitement:

    MOV  R10,[RSI]     ; Extraction du caractère
    OR   R10,R10        ;\ Si le caractère
    JZ   sortie       ;/ est nul, c'est fini

    MOV  RAX,0x2000004
    syscall              ; Sinon, on affiche
    INC     RSI          ; On incrémente le pointeur

    JMP  traitement   ; Et on recommence
    ret

sortie:
    ret
start:
    call _main
    ret

_main:
    call load
    call traitement
    ret

section .data
msg: db "Hello, World !"
