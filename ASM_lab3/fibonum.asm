INCLUDE Irvine32.inc

.data
fibonum DWORD 32 DUP(?)

.code
main proc
	mov	[fibonum],1			
	mov [fibonum+4],1
	mov eax,1
	call WriteInt
	call Crlf
	call WriteInt
	call Crlf
	mov ecx,28
	mov esi,4

L1:
	sub esi,4
	mov eax,[fibonum+esi]
	add esi,4
	add eax,[fibonum+esi]
	call WriteInt
	call Crlf
	add esi,4
	mov [fibonum+esi],eax
	loop L1

main endp
end main