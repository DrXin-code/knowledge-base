org 100h
mov	ax, Message
	mov	bp, ax			; ES:BP = str address
	mov	cx, 10			; CX = str len
	mov	ax, 1301h		; AH = 13,  AL = 01h
	mov	bx, 000ch		; 	mov	dl, 0
	int	10h
mov si, normal ;�趨����Դ��ַ������������ʼ����
mov di, $$;�趨������Ŀ���ַ��$$�������ͷ��ʵ�ʾ���100h
mov cx, NormalSize;��ȡnormal����Ĵ�С�����Ǹ�Ⱦʱд��ģ�����ճ�����ֶ���д
memove:;����ѭ��
mov al, [si]
mov  [di], al
inc di;����Ŀ���ַ1
inc si;����Դ��ַ1
dec cx;���ٴ�С1�����Ϊ0���������
jnz memove
jmp normal;������ִ��Ȩ�޽�����normal
Message: db "i am virus"
NormalSize: dw 0x18
normal:
