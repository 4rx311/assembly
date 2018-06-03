.586
.MODEL  flat, stdcall
OPTION CASEMAP:NONE

.CODE
Mod2 PROC C
    ;Saving registers
    push EAX
    push ECX
    push ESI
    push EDI
    
    ;mov ESI, [EBX]
    ;lea EDI, [EBX + 4]
    ;mov ECX, 4
    
    ;cycle:
    ;movsd
    ;loop cycle
    
    
    ;Making duplication of array
    xor EAX, EAX
    mov ESI, [EBX + 4]      ;ESI = Arr adress
    mov EDI, [EBX + 8]      ;EDI = E adress
    
    mov EAX,        [ESI]           ;EAX = Arr[1]
    mov [EDI],      EAX             ;E[1] = EAX 
    mov [EDI + 16], EAX             ;E[5] = EAX
    mov EAX,        [ESI + 4]       ;EAX = Arr[2]
    mov [EDI + 4],  EAX             ;E[2] = EAX
    mov [EDI + 20], EAX             ;E[6] = EAX
    mov EAX,        [ESI + 8]       ;EAX = Arr[3]
    mov [EDI + 8],  EAX             ;E[3] = EAX
    mov [EDI + 24], EAX             ;E[7] = EAX
    mov EAX,        [ESI + 12]      ;EAX = Arr[4]
    mov [EDI + 12], EAX             ;E[4] = EAX
    mov [EDI + 28], EAX             ;E[8] = EAX
    
    ;Restoring registers
    pop EAX
    pop ECX
    pop ESI
    pop EDI

Mod2 endp
end