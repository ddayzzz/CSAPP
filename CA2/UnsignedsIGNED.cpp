#include "stdio.h"
#include "limits.h" 
int main()
{
	int si=INT_MIN;
	unsigned ui=si;
	printf("%u\n",ui);
	//����λ��������⣺
	int n=0x0008000;
	short f=n;
	printf("%d\n",f); 
	return 0;
}
