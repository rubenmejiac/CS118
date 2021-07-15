; Programmer: Ruben Antonio Mejia Corleto
; CS 118 Spring 2021
; Professor Patil
; Description: Project 2:
;			This program subtracts three 16-bit integers
;			and displays the results with a call Dump.

include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib

.data
valu1	WORD  16384
valu2	WORD  1024
valu3	WORD  8192
tValu	WORD  ?

.code
main PROC

	mov	ax,valu1		; move 16384 to the AX register
	sub	ax,valu2		; subtract 1024
	sub	ax,valu3		; subtract 8192
	mov	tValu,ax		; store the result
	call	DumpRegs		; display the register

	exit

main ENDP
END main