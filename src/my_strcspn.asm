BITS 64
SECTION .text

%ifdef DEBUG
    %define __strcspn__ my_strcspn
%else
    %define __strcspn__ strcspn
%endif

GLOBAL __strcspn__:

__strcspn__:
    PUSH RBP
    MOV RBP, RSP
    PUSH R9
    XOR R9, R9
    XOR RAX, RAX

    JMP loop
loop:
    CMP BYTE [RDI], BYTE 0x0
    JZ end

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
    INC RAX
    JMP loop

end:
    MOV RSP, RBP
    POP RBP
    RET