; Template for console application
.586
.MODEL  flat, stdcall
OPTION CASEMAP:NONE

Include kernel32.inc
Include masm32.inc

IncludeLib kernel32.lib
IncludeLib masm32.lib

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
.CONST
MsgExit DB    "Press Enter to Exit",0AH,0DH,0
string1 DB 10 dup (?)         ; Text values
string2 DB ' ',13,10,0

;MsgNextLine DB "", 0AH, 0DH, 0

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
.DATA
reqIN   DB 'Choose betwee 1-4: ', 13, 10, 0
buffer  DB 10 dup ('0')  
reqOUT  DB 13,10,'Result E = '
resstr  DB 16 dup (2,7,6,5,2)
Str1    byte 'killallvowels!',0
vowelsarr byte 'eyuioa'
Str2    byte 14 dup (?)

B SDWORD 5
S SDWORD 2
D SDWORD 4
E SDWORD 16 dup (?)

Arr SDWORD  2,5,4,2,3,7,6,3
Count DWORD 4

nextstring  DB ' ', 13,10,0

public  B, S, D, E, Arr

extern Mod1:near
extern Mod2:near
extern Mod3:near
extern Mod4:near

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
.DATA?
inbuf    DB    100 DUP (?)

A SDWORD ?

Tabl DWORD 2 dup (?)

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         .CODE
Start:
        ;Input
         Invoke StdOut,ADDR reqIN
         Invoke StdIn,ADDR buffer,LengthOf buffer
         Invoke StripLF,ADDR buffer           
         Invoke atol, ADDR buffer
         mov A, EAX  

         ;mov A,2        
         ;Switch
         cmp A, 1
         je Case1
         cmp A, 2
         je Case2
         cmp A, 3
         je Case3
         cmp A, 4
         je Case4
         jmp Finish
         
Case1:;----------------------------------------------
         xor EAX, EAX
         call Mod1
         jmp Finish
         
Case2:;----------------------------------------------
         xor EAX, EAX
         xor EBX, EBX
         
         mov Tabl, offset Arr
         mov Tabl+4, offset E
         mov EBX, offset Tabl
         
         call Mod2
         mov eax,E
         mov ebx,0
         mov ecx,2
         jmp PrintArr
         jmp Finish

Case3:;----------------------------------------------
         xor EAX, EAX
         mov edx,4           ; we know that it is 5 elements
         mov eax,Arr[edx*4]
         mov ebx,B
         mov ecx,S
         call Mod3
         mov E,EAX
         
         jmp Finish        
        
Case4:;----------------------------------------------
    lea ebx,E
    push ebx        ; push ebx ))))))
    lea ebx,Str1    ;ptr to smth string 
    push ebx
    lea ebx,vowelsarr
    push ebx
    call Mod4
jmp Finish1

                                                                                                                            
CaseN:;----------------------------------------------                  
%ifdef            
         xor EAX, EAX
         lea ESI, Str1      ; our string address
         lea EDI, E         ; result string address

compare:                    
         cmpsb              ; compare byte from ESI, with byte from EDI
         je check           ; if true -> state3
         mov EAX, [ESI+4]   ; else, write to result
         mov [EDI+4], EAX
         jmp testend
         
increm:  
         inc ESI            ; ESI ++ - moving to the next 
         invoke StdOut,addr Str1
check:   
         mov EAX, [ESI]
         cmp EAX, 'a'
         je increm
    

testend:                    ; test end of string
         mov EAX, [ESI+4]
         cmp EAX, '!'
         je Finish
         jmp compare
         
         
         call Mod4
%endif


;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
%ifdef        
print_mas:                      ; Oleg's shit  
         mov ECX,2              ; Bcs we have 2 columns
            
cycle1:
```````  push ECX
         mov ECX,4              ; Because in 1 string we have 4 valuations
         push ECX
                    
         mov EAX,E[EBX*4]
         push EBX
         invoke dwtoa,EAX,addr string1
         invoke StdOut,addr string1
         pop ebx
         inc ebx
         pop ecx
    loop cycle1
           
         pop ecx
         invoke StdOut,addr string2
    loop print_mas
    
         jmp Finish
%endif     
     ; Den is a bitch ))
PrintArr:
        xor EAX, EAX
        push ecx
        mov ECX, 4             ; 2 columns
cycle:
        push ECX
        push EBX
        
        mov EAX, E[EBX*4]
        
        Invoke dwtoa, EAX, ADDR resstr
        Invoke StdOut,ADDR resstr
      
        pop EBX
        inc EBX
        pop ECX
    loop cycle
    
        push Count
        Invoke StdOut, ADDR nextstring              ;using it as /n
        pop Count
        dec Count
        pop ecx
        loop PrintArr
        
Finish1:
        Invoke StdOut,ADDR E
        jmp Exit        
        
Finish:         
        ; Output
        Invoke dwtoa,E,ADDR resstr
        Invoke StdOut, ADDR resstr
      
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Exit:   
         XOR    EAX,EAX
         Invoke StdOut,ADDR MsgExit
         Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
         Invoke ExitProcess,0
End    Start

