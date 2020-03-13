BITS 64
SECTION .text

%ifdef DEBUG
    %define __strpbrk__ my_strpbrk
%else
    %define __strpbrk__ strpbrk
%endif

GLOBAL __strpbrk__:

__strpbrk__:
    PUSH RBP
    MOV RBP, RSP
    PUSH R9
    XOR R9, R9
    XOR RAX, RAX

    CMP [RSI], BYTE 0x0
    JZ special_exit
    JMP loop
loop:
    CMP BYTE [RDI], BYTE 0x0
    JZ special_exit

    MOV R9, RSI

    JMP check
check:
    MOV R10b, [RDI]
    CMP [R9], BYTE 0x0
    JZ continue
    CMP R10b, [R9]
    JZ end
    INC R9
    JMP check

continue:
    INC RDI
    JMP loop

special_exit:
    XOR RDI, RDI
    JMP end

end:
    MOV RAX, RDI
    MOV RSP, RBP
    POP RBP
    RET