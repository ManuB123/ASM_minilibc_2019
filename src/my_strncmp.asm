BITS 64
SECTION .text

%ifdef DEBUG
    %define __strncmp__ my_strncmp
%else
    %define __strncmp__ strncmp
%endif

GLOBAL __strncmp__

__strncmp__:
    CMP RDX, 0
    JZ strncmp_end
    
    DEC RDX

strncmp_loop:
    MOV R8B, BYTE [RDI]
    MOV R9B, BYTE [RSI]
    
    CMP RDX, 0
    JZ strncmp_end
    CMP R8B, BYTE 0
    JZ strncmp_end
    CMP R9B, BYTE 0
    JZ strncmp_end
    CMP R8B, R9B
    JNZ strncmp_end

    INC RDI
    INC RSI
    DEC RDX
    
    JMP strncmp_loop

strncmp_end:
    MOVZX RAX, BYTE [RDI]
    MOVZX RCX, BYTE [RSI]
    SUB RAX, RCX

    RET