BITS 64
SECTION .text

%ifdef DEBUG
    %define __memset__ my_memset
%else
    %define __memset__ memset
%endif

GLOBAL __memset__:

__memset__:
    CMP RDX, 0
    JZ memset_end

memset_loop:
    DEC RDX
    MOV BYTE [RDI + RDX], SIL

    CMP RDX, 0
    JZ memset_end

    JMP memset_loop


memset_end:
    MOV rax, RDI

    RET