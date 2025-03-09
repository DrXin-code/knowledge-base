org 100h
mov	ax, Message
	mov	bp, ax			; ES:BP = str address
	mov	cx, 10			; CX = str len
	mov	ax, 1301h		; AH = 13,  AL = 01h
	mov	bx, 000ch		; 	mov	dl, 0
	int	10h
mov si, normal ;设定拷贝源地址，即正常程序开始部分
mov di, $$;设定拷贝的目标地址，$$代表程序头，实际就是100h
mov cx, NormalSize;获取normal程序的大小，这是感染时写入的，我们粘贴后手动填写
memove:;拷贝循环
mov al, [si]
mov  [di], al
inc di;增加目标地址1
inc si;增加源地址1
dec cx;减少大小1，如果为0则结束拷贝
jnz memove
jmp normal;将程序执行权限交出给normal
Message: db "i am virus"
NormalSize: dw 0x18
normal:
