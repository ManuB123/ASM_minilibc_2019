BITS 64
SECTION .text

%ifdef DEBUG
    %define __strcmp__ my_strcmp
%else
    %define __strcmp__ strcmp
%endif

GLOBAL __strcmp__:

__strcmp__:
    MOV R8B, BYTE [RDI]
    MOV R9B, BYTE [RSI]
    
    CMP R8B, BYTE 0
    JZ _strcmp_end
    CMP R9B, BYTE 0
    JZ _strcmp_end
    CMP R8B, R9B
    JNZ _strcmp_end

    INC RDI
    INC RSI
    
    JMP __strcmp__

_strcmp_end:
    MOVZX RAX, R8B
    MOVZX RCX, R9B
    SUB RAX, RCX

    RET
