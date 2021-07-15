; Programmer: Ruben Antonio Mejia Corleto
; CS 118 Spring 2021
; Professor Patil
; 04/26/2021
; Description: Midterm on Chapter 6:
;			Create a procedure named CalcGrade that receives an integer value between 0 and 75, 
;			and returns a single capital letter in the AL register. 
;			Preserve all other register values between calls to the procedure. 
;			The letter returned by the procedure should be displayed and should be according
; 			to the following ranges:
;				Score 70 to 75  Grade A
;				Score 60 to 69  Grade B
;				Score 50 to 59 Grade C
;				Score 0 to 49 Grade F
;	Write a test program that
;			1. asks the user to enter integer between 0 and 75, inclusive. 
;			   If the user enters invalid number, please display error message.
;			2. Pass it to the CalcGrade procedure. 
;			3. Repeat steps 1 and 2 three times so that you collect three scores from the user
;			   and display the respective grade for each score. 

include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib

.data
instruction BYTE "Please enter an integer number between 0 and 75: ", 0
userNum DWORD ?
studentGrade BYTE "The student's grade is: ", 0
lowerLimit DWORD 0
upperLimit DWORD 75
nonValidInput BYTE "Value is out of range, enter a number between 0 and 75.", 0

.code
main PROC
    call Clrscr
	mov eax, lowerLimit
    mov ebx, upperLimit
    call	WriteString
	call	CrLf
	jmp		askUser

askUser:
	mov		edx, OFFSET instruction			;get the user input
	call	WriteString
	call	ReadInt
	mov		userNum, eax
	call	CrLf

;validate value is in range 0 to 75
	mov		ebx, upperLimit					
	cmp		ebx, eax						
	jge		upperLimitOk					;if ebx >= eax value is within upper limit range
	mov		edx, OFFSET nonValidInput		;else, out of range
	call	WriteString
	call	CrLf
	jmp		askUser							;loop back to ask user for new value

upperLimitOk:								;userNum is below upperLimit
	mov		ebx, lowerLimit					
	cmp		ebx, eax
	jle		limitOk							;if ebx <= eax value is within lower limit range
	mov		edx, OFFSET nonValidInput		;else, out of range
	call	WriteString
	jmp		askUser							;loop back to ask user for new value

limitOk:
  	mov edx, offset userNum
	call CalcGrade
	call crlf
	exit
main ENDP

;calculate grade procedure
CalcGrade PROC
    .IF eax >= 70   
      mov al,'A'    
    .ELSEIF eax >= 60
      mov al,'B'
    .ELSEIF eax >= 50
      mov al,'C'
    .ELSE
      mov al,'F'
    .ENDIF
    mov edx,OFFSET studentGrade
    call WriteString
    call WriteChar    
    call Crlf
    ret
CalcGrade ENDP

END main