BITS 64
SECTION .text

%ifdef DEBUG
    %define __strlen__ my_strlen
%else
    %define __strlen__ strlen
%endif

GLOBAL __strlen__:

__strlen__:
    PUSH RCX
    XOR RCX, RCX

loop:
    CMP [RDI], BYTE 0x0
    JZ end

    INC RCX
    INC RDI
    JMP loop

end:
    MOV RAX, RCX
    POP RCX
    RET
