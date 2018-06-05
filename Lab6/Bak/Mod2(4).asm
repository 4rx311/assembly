.586
.MODEL  flat, stdcall
OPTION CASEMAP:NONE

.CODE
Mod2 PROC C

mov esi,[ebx]   ; Array
mov edi,[ebx+4] ; ptr to E
mov ecx,4       ; quant elements in in string
rep movsd       ; write 1st string

mov esi,[ebx]
mov ecx,4
rep movsd       ; write 2st string (equaly 1)

ret

Mod2 endp
end