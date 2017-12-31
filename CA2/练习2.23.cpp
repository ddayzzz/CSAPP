#include "stdio.h"
int fun1(unsigned word)
{
	return (int)((word<<24)>>24);
 } 
 int fun2(unsigned word)
 {
 	return ((int)word<<24)>>24;
  } 
int main()
{
	printf("%d\n",0x87654321);
	printf("0X%X, 0x%x, 0x%x\n",(unsigned)(0x00000076),fun1(0x00000076),fun2(0x00000076));
	printf("0X%X, 0x%x, 0x%x\n",(unsigned)(0x87654321),fun1(0x87654321),fun2(0x87654321));
	printf("0X%X, 0x%x, 0x%x\n",(unsigned)(0x000000c9),fun1(0x000000c9),fun2(0x000000c9));
	printf("0X%X, 0x%x, 0x%x\n",(unsigned)(0xffffffff),fun1(0xffffffff),fun2(0xffffffff));
	return 0;	
} 
