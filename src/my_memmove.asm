BITS    64

SECTION     .text

%ifdef DEBUG
    %define __memmove__ my_memmove
%else
    %define __memmove__ memmove
%endif

GLOBAL __memmove__

__memmove__:
    CMP     RDI,RSI
    JG      memcopy
    MOV     RCX, RDX
    REP     MOVSB
    RET

memcopy:
    CMP     RDX, 0
    JZ      memcopy_end

memcopy_loop:
    DEC     RDX

    MOV     R10B, BYTE[RSI + RDX]
    MOV     BYTE[RDI + RDX], R10B

    CMP     RDX, 0
    JZ      memcopy_end

    JMP     memcopy_loop

memcopy_end:
    MOV     RAX, RDI

    RET