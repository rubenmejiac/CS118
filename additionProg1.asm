; Programmer: Ruben Antonio Mejia Corleto
; CS 118 Spring 2021
; Professor Patil
; Description: Project 4
;           Program 1: simple addition
;			program that clears the screen, locates the cursor near the middle of the screen, 
;           prompts the user for two integers, adds the integers, and displays their sum.

include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib

.data
prompt BYTE "Please enter an integer number: ",0
resultMsg BYTE "The sum of the two integers is: ",0
int1 DWORD ?
int2 DWORD ?
sum DWORD ?

.code
main PROC
;clear the screen
    call Clrscr

;move the cursor to the midle of the screen
    MOV DH, 13    ;vertical (y) coordinate, screen max 24
    MOV DL, 40    ;horizontal (x) coordinate, screen max 80
    CALL GoToXY   ;locate the cursor at set position

    MOV EDX, OFFSET prompt    
    CALL WriteString
    CALL ReadInt    ;read integer
    MOV int1,EAX

    CALL WriteString
    CALL ReadInt    ;read integer
    MOV int2,EAX

;adds the two integers
    MOV EAX, int1
    ADD EAX, int2
    MOV sum, EAX

;display the sum
    MOV EDX, OFFSET resultMsg
    call WriteString
    MOV EAX, sum
    call WriteInt

    call Crlf
    call WaitMsg
    exit
main ENDP

END main
