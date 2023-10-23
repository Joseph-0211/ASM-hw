;Encryption Program               (Encrypt.asm)

; This program demonstrates simple symmetric
; encryption using the XOR instruction.

INCLUDE Irvine32.inc
BUFMAX = 128        ; maximum buffer size

.data
sPrompt  BYTE  "Enter the plain text: ",0
sKey  BYTE  "Enter the key: ",0
sEncrypt BYTE  "Cipher text: ",0
sDecrypt BYTE  "Decrypted:            ",0
buffer   BYTE   BUFMAX+1 DUP(0)
bufSize  DWORD  ?
keyBuffer   BYTE   BUFMAX+1 DUP(0)
keySize  DWORD  ?

.code
main PROC
    call  InputTheString      
    call  InputTheKey      
    call  CreateKey
    call  TranslateBuffer 
    mov   edx,OFFSET sEncrypt 
    call  DisplayMessage

    exit
main ENDP

InputTheString PROC
    pushad
    mov   edx,OFFSET sPrompt  
    call  WriteString
    mov   ecx,BUFMAX      
    mov   edx,OFFSET buffer   
    call  ReadString          
    mov   bufSize,eax        
    call  Crlf
    popad
    ret
InputTheString ENDP

InputTheKey PROC
    pushad
    mov   edx,OFFSET sKey  
    call  WriteString
    mov   ecx,BUFMAX      
    mov   edx,OFFSET keyBuffer   
    call  ReadString          
    mov   keySize,eax      
    call  Crlf
    popad
    ret
InputTheKey ENDP

CreateKey PROC
    pushad
    mov   ecx,bufSize     
    mov   esi,0           
    mov   edi,keySize
    sub   ecx,keySize
L1: 
    mov   al,buffer[esi]
    mov   keyBuffer[edi],al
    inc   esi            
    loop  L1
    popad
    ret
CreateKey ENDP

TranslateBuffer PROC
    pushad
    mov   ecx,bufSize    
    mov   esi,0           
L1: 
    mov   al,keyBuffer[esi]
    xor   buffer[esi],al 
    inc   esi            
    loop  L1
    popad
    ret
TranslateBuffer ENDP

DisplayMessage PROC
    pushad
    call  WriteString
    mov   ecx,bufSize   
    mov   esi,0          
L1:
    mov   al,buffer[esi]  
    call  WriteHex
    mov   al,' '
    call  WriteChar
    inc   esi
    loop  L1
    popad
    ret
DisplayMessage ENDP

END main