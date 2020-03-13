BITS 64
SECTION .text

%ifdef DEBUG
    %define __strstr__ my_strstr
%else
    %define __strstr__ strstr
%endif

GLOBAL __strstr__

__strstr__:
    PUSH RCX

    XOR RCX, RCX
    XOR RAX, RAX
    CMP [RDI], BYTE 0x0
    CMP [RSI], BYTE 0x0
    JZ _strstr_end

_strstr_loop:
    MOV R8B, BYTE [RDI]
    MOV R9B, BYTE [RSI + RCX]
    
    CMP R9B, BYTE 0
    JZ _strstr_end
    
    CMP R8B, BYTE 0
    JZ _strchr_special_end

    INC RDI

    CMP R8B, R9B
    JZ  _strstr_found

    SUB RDI, RCX
    XOR RCX, RCX

    JMP _strstr_loop

_strstr_found:
    INC RCX
    JMP _strstr_loop

_strchr_special_end:
    XOR RCX, RCX
    XOR RDI, RDI
    JMP _strstr_end

_strstr_end:
    SUB RDI, RCX
    MOV RAX, RDI

    POP RCX

    RET