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
    
    mov ECX, 4          ; count
    ;mov ESI,[EBX]       ; Arr address
    ;mov EDI,[EBX+4]     ; E address
    lea esi,[ebx]
    lea edi,[ebx+4]
    
    loop1: movsd
    loop loop1
    
    ;rep movsd

 %ifdef   ;Restoring registers
    pop EAX
    pop ECX
    pop ESI
    pop EDI
%endif
Mod2 endp
end