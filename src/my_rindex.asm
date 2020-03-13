BITS 64
SECTION .text

%ifdef DEBUG
    %define __rindex__ my_rindex
%else
    %define __rindex__ rindex
%endif

GLOBAL __rindex__:

__rindex__:
    XOR RAX, RAX
loop:
    CMP SIL, BYTE[RDI]
    CMOVE RAX, RDI

    CMP [RDI], BYTE 0
    JZ end

    INC RDI
    JMP loop
end:
    RET
