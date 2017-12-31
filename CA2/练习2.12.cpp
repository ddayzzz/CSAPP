#include "stdio.h"
#include "limits.h"
int main()
{
	int x=0x87654321;
	int mi1=0xffffffff;
	printf("%x\n",~((~0)<<8));
	//A:
	int a=x & (~((~0)<<8));
	printf("0x%x\n",a);
	//B
	int b=~x | a;
	printf("0x%x\n",b);
	//C
	int c=~((~0)<<8)| x;
	printf("0x%x\n",c);
	unsigned int k=UINT_MAX;
	printf("%u",k);
	return 0;
}
