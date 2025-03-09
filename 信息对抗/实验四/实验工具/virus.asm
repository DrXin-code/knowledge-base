int main()
{
	_asm
	{
		call code_start
		nop
		nop
		nop
		nop
	code_start:
		pop eax
		mov ebx, 0x50901013		; 这里改为你学号后八位
		mov [eax], ebx
		jmp code_start
	}
}