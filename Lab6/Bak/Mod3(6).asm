.586
.MODEL  flat, stdcall
OPTION CASEMAP:NONE

.CODE
Mod3 PROC C

    push EBP
    mov EBP, ESP
    pusha
    
    xor EAX, EAX
    mov ESI, [EBP + 8]      ; Arr address
    mov EDI, [EBP + 4]      ; E address
    
    mov EAX, [ESI + 4]
    
    


Mod3 endp
end