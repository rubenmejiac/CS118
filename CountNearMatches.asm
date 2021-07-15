; Programmer: Ruben Antonio Mejia Corleto
; CS 118 Spring 2021
; Professor Patil
; Description: Project 8
;
; Write a procedure named CountNearMatches that receives pointers to two arrays of 
; signed doublewords, a parameter that indicates the length of the two arrays, and 
; a parameter that indicates the maximum allowed difference (called diff) between 
; any two matching elements. For each element x(i) in the ﬁrst array, if the difference
; between it and the corresponding y(i) in the second array is less than or equal to diff, 
; increment a count. At the end, return a count of the number of nearly matching array 
; elements in EAX. Display this value.
;
; Write a test program that calls CountNearMatches and passes pointers
; to two different pairs of arrays. Use the INVOKE statement to call your procedure and 
; pass stack parameters. Create a PROTO declaration for CountMatches. 
; Save and restore any registers (other than EAX) changed by your procedure.

include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib

CountNearMatches PROTO, ptrArray1:PTR SDWORD, ptrArray2:PTR SDWORD, 
                        szArray:DWORD, diff:DWORD

    .data
    array1 SDWORD 1,2,3,4,5,6,7,8
    array2 SDWORD 5,44,7,65,8,7,23,4
    cnt DWORD ?,0
    dif1 DWORD 11
    dif2 DWORD 0

    .code
    main PROC		
            INVOKE CountNearMatches, ADDR array1, LENGTHOF array1, dif1
            call WriteInt
            call Crlf
            INVOKE CountNearMatches, ADDR array2, LENGTHOF array2, dif2
            call WriteInt
            call Crlf
            exit
            main ENDP

    CountNearMatches PROC USES edx ebx edi esi ecx, ptrArray1:PTR SDWORD, 
                               szArray:DWORD, diff:DWORD
            mov esi,ptrArray1
            mov edi,ptrArray2
            mov ecx,szArray

    L1:
    mov ebx,0
    mov ebx,[esi]
    mov edx,0
    mov edx,[edi]
    .IF ebx > edx
            mov eax,ebx
            sub eax,edx
    .ELSE
            mov eax,edx
            sub eax,ebx
    .ENDIF
    .IF (eax <= diff)
            inc cnt
    .ENDIF
    add esi, SIZEOF SDWORD
    add edi, SIZEOF SDWORD
    loop L1

    mov eax,0
    mov eax,cnt
    mov cnt,0
    ret
    CountNearMatches ENDP
    END main
