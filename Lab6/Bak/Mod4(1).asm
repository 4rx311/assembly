.586
.MODEL  flat, stdcall
OPTION CASEMAP:NONE

.CODE
Mod4 PROC C
    push ebp            ; prolog
    mov ebp,esp         ; prolog

    mov esi,[ebp+8]     ; ptr to vowels arr
    mov ecx,6           ; because we have 6 vowels

cycle1: 
    mov edi,[ebp+12]    ; mother points to string
    mov al,[esi+0]      ; next valwes in al
    push ecx
    mov ecx,14          ; length string = 14 elements
        
compare:
    scasb
    je change
  loop compare
    jmp fin_compare
    
change:
    mov bh,95
    mov 0[edi-1],bh
    dec ecx
    jcxz fin_compare    ; jump to zero
    jmp compare
    
fin_compare:
    pop ecx
    inc esi                  
  loop cycle1
        
    mov ecx,15
    mov esi,[ebp+12]
    mov edi,[ebp+16]
    
rep movsb

    mov esp,ebp
    pop ebp 
    
  ret 12
        
Mod4 endp
end