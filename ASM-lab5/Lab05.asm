Include Irvine32.inc
 
.data
prompt1 BYTE "Enter Value X : ", 0
prompt2 BYTE "Enter Value Y : ", 0
prompt3 BYTE "GCD IS:", 0
prompt4 BYTE "Do it again ?(y/n): ", 0
X DWORD ?
Y DWORD ?

.code
main PROC
    mov   edx,OFFSET prompt1
    call  WriteString
    call  ReadInt
    mov   X,eax
    mov   edx,OFFSET prompt2
    call  WriteString
    call  ReadInt
    mov   Y,eax
    mov   eax,X
    mov   ebx,Y
    cmp   eax,0
    JG    L2
    neg   eax
    mov   X,eax

L1:    
    call  Crlf
    call  Crlf
    mov   edx,OFFSET prompt1
    call  WriteString
    call  ReadInt
    mov   X,eax
    mov   edx,OFFSET prompt2
    call  WriteString
    call  ReadInt
    mov   Y,eax
    mov   eax,X
    mov   ebx,Y
    cmp   eax,0
    JG    L2
    neg   eax
    mov   X,eax

L2:
    cmp   ebx,0
    JG    L3
    neg   ebx
    mov   Y,ebx
    mov   edx,0

L3: 
    mov   eax,X
    cdq
    mov   ebx,Y 
    idiv  ebx
    mov   X,ebx
    mov   Y,edx
    cmp   edx,0
    JG    L3

    mov   edx,OFFSET prompt3
    call  WriteString
    mov   eax,X
    call  WriteInt
    call  Crlf
    mov   edx,OFFSET prompt4
    call  WriteString
    call  ReadChar
    call  WriteChar
    cmp   al,'y'  
    JE    L1

    exit
main ENDP

END main
