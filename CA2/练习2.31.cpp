#include "stdio.h"
#include <limits.h>
//buggy code 
int tadd_ok(char x, char y)
{
	char sum = x + y;
	return (sum - x == y) && (sum - y == x);
}
//���ᷢ������Ĵ��� ref:http://blog.csdn.net/u011225147/article/details/53707614
int tadd_ok_noof(int x, int y)
{
	/*
	bool hig_data = x & 1u << 30 && y & 1u << 30;
	bool hig_sign = x & 1u << 31 && y & 1u << 31;
	//����λ���ڽ�λ����ߵ�����λ���ڽ�λ ��ô�ͻ����
	return hig_data == hig_sign;
	*/
	/*
	�ּ������ ��+�� <0 ���sum>=0 ���
			��+��>0 ���sum<=0 ���
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
