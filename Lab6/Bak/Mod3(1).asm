.586
.MODEL  flat, stdcall
OPTION CASEMAP:NONE

;extern S:SDWORD, B:SDWORD, E:SDWORD

.CODE
Mod3 PROC C
    add eax,ebx
    add eax,ecx
    Mod3 endp
  ret
end