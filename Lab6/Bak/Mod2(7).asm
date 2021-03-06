.586
.MODEL  flat, stdcall
OPTION CASEMAP:NONE

.CODE
Mod2 PROC C
    ;Saving registers
    ;Invoke StdOut,ADDR requestL
    %ifdef    
    push EAX
    push ECX
    push ESI
    push EDI
    %endif
    
    ;invoke dwtoa, eax, addr Str2
    ;%ifdef
    mov ECX, 4          ; count
    mov ESI,[EBX]       ; Arr address
    mov EDI,[EBX+4]     ; E address
    
    rep movsd
    ;%endif
    
    %ifdef
    ;Duplication of array
    xor EAX, EAX
    mov ESI, [EBX + 4]      ;ESI = Arr adress
    mov EDI, [EBX + 8]      ;EDI = E adress
    
    mov EAX,        [ESI]           ;EAX  = Arr[1]
    mov [EDI],      EAX             ;E[1] = EAX 
    mov [EDI + 16], EAX             ;E[5] = EAX
    mov EAX,        [ESI + 4]       ;EAX  = Arr[2]
    mov [EDI + 4],  EAX             ;E[2] = EAX
    mov [EDI + 20], EAX             ;E[6] = EAX
    mov EAX,        [ESI + 8]       ;EAX  = Arr[3]
    mov [EDI + 8],  EAX             ;E[3] = EAX
    mov [EDI + 24], EAX             ;E[7] = EAX
    mov EAX,        [ESI + 12]      ;EAX  = Arr[4]
    mov [EDI + 12], EAX             ;E[4] = EAX
    mov [EDI + 28], EAX             ;E[8] = EAX
    mov edx,[EBX]
    mov [EBX],[EBX+4]
    mov [EBX],edx
    %endif

    %ifdef   ;Restoring registers
    pop EAX
    pop ECX
    pop ESI
    pop EDI
    %endif
Mod2 endp
ret
end