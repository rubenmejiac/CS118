; Programmer: Ruben Antonio Mejia Corleto
; CS 118 Spring 2021
; Professor Patil
; Description: Project 7
;           Greatest Common Divisor (GCD)
;			The GCD algorithm involves integer division in a loop, described by the 
;           following pseudocode:
;   int GCD(int x, int y)
;   {
;       x = abs(x)     // absolute value
;       y = abs(y)
;       do {
;                   int n = x % y
;                   x = y
;                   y = n
;          } while (y > 0)
;     return x
;   }
;   Implement this function in assembly language and write a test program that collects
;   two numbers from the user and calls the function, passing it the two values. 
;   Display the result on the screen.

include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib

.data
prompt BYTE "Please enter an integer number: ",0
resultMsg BYTE " The GCD of the two numbers is: ",0
val1 DWORD ?
val2 DWORD ?

.code
main PROC
   call Clrscr
   mov edx, OFFSET prompt    
   call WriteString
   call ReadInt    
   mov val1,eax
   call WriteString
   call ReadInt    
   mov val2,eax
   call pMsgScreen
   call gcd
exit
main ENDP

pMsgScreen PROC
   mov eax,val1
   call WriteDec
   mov edx,OFFSET prompt
   call WriteString
   mov eax,val2
   call WriteDec
   mov edx,OFFSET resultMsg
   call WriteString
   ret
pMsgScreen ENDP

gcd PROC
mov eax,val1
cdq
mov ebx,val2
div ebx
L1:
   mov eax,ebx
   mov ebx,edx
   cmp ebx,0
   je endgcd
   mov val1,edx
   cdq
   div ebx
   loop L1
endgcd:
   call WriteDec
   call crlf
   ret
gcd ENDP

END main
