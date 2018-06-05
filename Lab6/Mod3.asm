.586
.MODEL  flat, stdcall
OPTION CASEMAP:NONE

.CODE
Mod3 PROC C
    add eax,ebx
    add eax,ecx
    Mod3 endp
  ret
end