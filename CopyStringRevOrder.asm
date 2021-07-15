; Programmer: Ruben Antonio Mejia Corleto
; CS 118 Spring 2021
; Professor Patil
; 03/22/2021
; Description: Project 3:
;			This program copies a string in reverse order. 
;			It uses a loop and indirect addressing that copies a string from source
;			to target, reversing the character order in the process.

include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib

.data
source BYTE "This is the Source String",0
target BYTE SIZEOF source DUP('#')

.code
main PROC

	mov	esi, 0		
	mov	edi,LENGTHOF source - 1		
	mov	ecx,SIZEOF source				
	
 Lp:
	mov eax, 0
	mov al,source[esi]
	mov target [edi],al
	inc esi
	dec edi
	loop Lp

INVOKE ExitProcess,0
main ENDP

END main