; Copyright (c) 2022 Hasan ŞyheMuhamet
; this assembly code just for testing ass-assembly script on your machine
section	.text
   global _start
	
_start:
   mov	edx,length
   mov	ecx,message
   mov	ebx,1
   mov	eax,4
   int	0x80
	
   mov	eax,1
   int	0x80

section	.data
message db 'i am try to learn assembly language', 0xa
length equ $ - message