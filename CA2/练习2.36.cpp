#include "stdio.h"
typedef long long ll;
//这个函数检查x * y是否不会溢出 
bool tmulti_ok(ll x, ll y)
{
	if (x == 0 || y == 0)
		return true;
	ll p = x * y;
	//if(x % ()) 
}
int div16(int x)
{
	///*
	int b = (x & 0x80000000);
	int y = (b >> 31) & 0x0F;
	int res = (y + x) >> 4;
	return res; //与下面的等价
	//*/
	
	//return (x + ((x >> 31) & 0x0F)) >> 4;
}
int main()
{
	//printf("%d\n", div16(16));
	//printf("%d\n", div16(32));
	//printf("%d\n", div16(64));
	//printf("%d\n", div16(-16));
	//printf("%d\n", div16(-128));
	printf("%d\n", div16(-32));
	//printf("%d\n", div16(30));
}
