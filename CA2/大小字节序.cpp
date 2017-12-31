// 函数解释器.cpp : 定义控制台应用程序的入口点。
//

#include "stdio.h"

typedef unsigned char *byte_ptr; 
void showbits(byte_ptr b,int len)
{
	for(int i=0;i<len;++i)
	{
		printf("Address is 0x%x, Value is 0x%.2x\n",b,b[i]);
	}
	printf("\n");
}
int main()
{
	int ii = 3510593;
	int iihexa=0x00359141;
	float f=3510593.0;
	float fhexa=0x4A564504;
	
	showbits((byte_ptr)&ii,sizeof(ii));
	showbits((byte_ptr)&iihexa,sizeof(iihexa));
	showbits((byte_ptr)&f,sizeof(f));
	showbits((byte_ptr)&fhexa,sizeof(fhexa));
	
	printf("%d\n",sizeof(long)) ;
    return 0;
}


