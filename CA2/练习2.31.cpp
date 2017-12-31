#include "stdio.h"
#include <limits.h>
//buggy code 
int tadd_ok(char x, char y)
{
	char sum = x + y;
	return (sum - x == y) && (sum - y == x);
}
//不会发生溢出的代码 ref:http://blog.csdn.net/u011225147/article/details/53707614
int tadd_ok_noof(int x, int y)
{
	/*
	bool hig_data = x & 1u << 30 && y & 1u << 30;
	bool hig_sign = x & 1u << 31 && y & 1u << 31;
	//符号位存在进位或最高的数据位存在进位 那么就会溢出
	return hig_data == hig_sign;
	*/
	/*
	分几种情况 负+负 <0 如果sum>=0 溢出
			正+正>0 如果sum<=0 溢出
	*/
	int sum = x + y;
	if (x > 0 && y > 0)
		return !(sum & 1u << 31);
	if (x < 0 && y < 0)
		return sum & 1u << 31;
	return true;
}
int main()
{
	char c = 255;
	char a = 2;
	char b = -255;
	//printf("%d\n", tadd_ok(c, a));
	int i = INT_MAX;
	int m = INT_MIN;
	printf("%d\n%d\n%d\n", tadd_ok_noof(i, 1), tadd_ok_noof(m, -1), tadd_ok_noof(i, -1));
	return 0;
}
