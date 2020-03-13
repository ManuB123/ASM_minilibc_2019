BITS    64
SECTION     .text

%ifdef DEBUG
    %define __memcpy__ my_memcpy
%else
    %define __memcpy__ memcpy
%endif

GLOBAL __memcpy__

__memcpy__:
    CMP     RDX, 0
    JZ      memcpy_end

memcpy_loop:
    DEC     RDX

    MOV     R10B, BYTE[RSI + RDX]
    MOV     BYTE[RDI + RDX], R10B

    CMP     RDX, 0
    JZ      memcpy_end

    JMP     memcpy_loop

memcpy_end:
    MOV     RAX, RDI

    RET