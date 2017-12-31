#include "stdio.h"
#include "string.h"
int strlonger(char *c,char *s)
{
	printf("%u\n",strlen(c) - strlen(s));
	return strlen(c) - strlen(s) >0;
}
float sum(float a[],int len)
{
	int i;
	float f=0.0;
	for(i=0;i<=len-1;++i)
		f+=a[i];
	return f;
}
int main()
{
	//float f[4]={1.2,2.3,9.9,2.3};
	//printf("%f\n",sum(f,0));
	printf("%d\n",strlonger("abc","abcde"));
	printf("%d\n",strlonger("abcdefg","abcde"));
	return 0;
}
