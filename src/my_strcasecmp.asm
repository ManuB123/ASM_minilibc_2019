BITS 64
SECTION .text

%ifdef DEBUG
    %define __strcasecmp__ my_strcasecmp
%else
    %define __strcasecmp__ strcasecmp
%endif

GLOBAL __strcasecmp__:

__strcasecmp__:
    MOV R8B, BYTE [RDI]
    MOV R9B, BYTE [RSI]

    INC RDI
    INC RSI

    CMP R8B, BYTE 0
    JZ strcasecmp_end
    CMP R9B, BYTE 0
    JZ strcasecmp_end
    CMP R8B, R9B
    JNZ strcasecmp_compare_first

    JMP __strcasecmp__

strcasecmp_compare_first:
    CMP R8B, 0x41
    JL strcasecmp_compare_second
    CMP R8B, 0x5A
    JG strcasecmp_compare_second

    ADD R8B, 32
    
    JMP strcasecmp_compare_second

strcasecmp_compare_second:
    CMP R9B, 0x41
    JL strcasecmp_lower_compare
    CMP R9B, 0x5A
    JG strcasecmp_lower_compare

    ADD R9B, 32
    
    JMP strcasecmp_lower_compare

strcasecmp_lower_compare:
    CMP R8B, R9B
    JNZ strcasecmp_end
    
    JMP __strcasecmp__

strcasecmp_end:
    MOVZX RAX, R8B
    MOVZX RCX, R9B
    SUB RAX, RCX

    RET