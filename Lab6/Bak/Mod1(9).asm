.586
.MODEL  flat, stdcall
OPTION CASEMAP:NONE

extern S:SDWORD, B:SDWORD, D:SDWORD, E:SDWORD

.CODE
Mod1 PROC c
    ; B + S + 1
    mov EAX, B
    add EAX, S
    inc EAX
    
    ; B - S - 1
    mov EBX, B 
    sub EBX, S
    dec EBX
    idiv EBX
    
    mov E, EAX
    
    
    ret

Mod1 endp
end