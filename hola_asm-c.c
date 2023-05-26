#include <windows.h>

void main(void)
{
	char mensaje[] = "Hola Mundo!!\n\n";
	long int bytesEscritos;
	_asm
	{
		push -11
		call GetStdHandle

		push 0
		lea ebx, bytesEscritos
		push ebx
		push 15
		lea ebx, mensaje
		push ebx
		push eax
		call WriteConsoleA
	}
}