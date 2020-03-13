BITS 64
SECTION .text

%ifdef DEBUG
    %define __strchr__ my_strchr
%else
    %define __strchr__ strchr
%endif

GLOBAL __strchr__:

__strchr__:
    XOR RAX, RAX

_strchr_loop:
    CMP BYTE [RDI], SIL
    JZ _strchr_end

    CMP [RDI], BYTE 0
    JZ _strchr_special_end

    INC RDI
    JMP _strchr_loop

_strchr_special_end:
    XOR RDI, RDI

    JMP _strchr_end

_strchr_end:
    XOR RAX, RAX
    MOV RAX, RDI

    RET