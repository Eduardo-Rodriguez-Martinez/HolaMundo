; Este programa se ensambla y liga con el siguiente comando:
; ml hola_32bits.asm /Fe hola_32bits.exe /link /SUBSYSTEM:CONSOLE /DEFAULTLIB:"C:\Irvine\Kernel32.lib"
TITLE Hola mundo en ensamblador				(hola.asm)

.386
.MODEL flat, stdcall
.STACK 4096

; //Win32 Console handles
STD_OUTPUT_HANDLE EQU - 11

GetStdHandle PROTO,		; //get standard handle
	nStdHandle : DWORD	; //type of console handle

WriteConsoleA PROTO,					; //write a buffer to the console
	hConsoleOutput : DWORD,				; //output handle
	lpBuffer : PTR BYTE,				; //pointer to buffer
	nNumberOfCharsToWrite : DWORD,		; //size of buffer
	lpNumberOfCharsWritten : PTR DWORD,	; //ptr to number of bytes written
	lpReserved : DWORD					; //(not used)

ExitProcess PROTO,		; //exit program
	dwExitCode : DWORD	; //return code

.data
endl				EQU <0dh, 0ah>
mensaje				BYTE "Hola Mundo!!", endl
longitud			DWORD ($ - Mensaje)
manejadorConsola	DWORD 0
bytesEscritos		DWORD ?
.code
main PROC
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	mov manejadorConsola, eax

	INVOKE WriteConsoleA,
		manejadorConsola,
		ADDR mensaje,
		longitud,
		ADDR bytesEscritos,
		0

	INVOKE ExitProcess, 0
main endp
end main