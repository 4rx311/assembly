.586
.MODEL  flat, stdcall
OPTION CASEMAP:NONE

extern S:SDWORD, B:SDWORD, E:SDWORD

.CODE
Mod3 PROC C

    push EBP                ; Prolog
    mov EBP, ESP
    pusha
    
    xor EAX, EAX
    mov ECX, [EBP + 16]
    mov EDX, [EBP + 12]
    mov ESI, [EBP + 8]      ; Arr address
    mov EDI, [EBP + 4]      ; E address
    
    mov EAX, [ESI + 4]      ; EAX = Arr[2]
    add EAX,  B             ; EAX += B
    add EAX,  S             ; EAX += S
    
    mov [EDI], EAX          
    popa
    mov ESP, EBP            ; Epilog
    pop EBP
    ret 12                   ; return from proc

Mod3 endp
end