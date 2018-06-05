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
    
    invoke dwtoa, eax, addr Str2
    mov ECX, 4          ; count
    mov ESI,[EBX]       ; Arr address
    mov EDI,[EBX+4]     ; E address
    
    rep movsd

    %ifdef   ;Restoring registers
    pop EAX
    pop ECX
    pop ESI
    pop EDI
    %endif
Mod2 endp
end