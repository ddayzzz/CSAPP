#include "stdio.h"
int bitCount(int x) {
	/*思路
需要进行移位操作
mask1 = 0x5555 5555，2位一组
mask2 = 0x3333 3333，4位一组
mask3 = 0x0F0F 0F0F，8位一组
mask4 = 0x00FF 00FF，16位一组
mask5 = 0x0000 FFFF，32位一组最终求和
	 */
    int _mask1 = 0x55;
    int _mask2 = 0x33;
    int _mask3 = 0x0f;
    int _mask4  =0xff;
    int _mask5 = 0xff;
    _mask1 = (_mask1<<8) + _mask1;
    _mask1 = (_mask1<<16) + _mask1;
    _mask2 = (_mask2<<8) + _mask2;
    _mask2 = (_mask2<<16) + _mask2;
    _mask3 = (_mask3<<8) + _mask3;
    _mask3 = (_mask3<<16) + _mask3;
    _mask4 = (_mask4<<8);
    _mask4 = ~((_mask4<<16) + _mask4);
    _mask5 = (_mask5<<8) + _mask5;
    printf("%x\n%x\n%x\n%x\n%x\n",_mask1,_mask2,_mask3,_mask4,_mask5);
    x = (x & _mask1) + ((x>>1) & _mask1);
    x = (x & _mask2) + ((x>>2) & _mask2);
    x = (x & _mask3) + ((x>>4) & _mask3);
    x = (x & _mask4) + ((x>>8) & _mask4);
    x = (x & _mask5) + ((x>>16) & _mask5);
    return x;
}
int logicalShift(int x, int n) {
    //强制进行逻辑右移
    int mask = (!n ^ 1);
    mask = (mask<<31)>>(n+((mask<<31)>>31));
    return x>>n & ~mask;
  }
int main()
{
    //printf("%d\n",bitCount(0x80000000));
    //printf("%x\n",logicalShift(0x80000000,1));
    //int x=0x1;
    //printf("%x\n%x\n",x<<31,0x1<<31);
    int u = (int)0xf23815cf;
    int x = 0x7fffffff;

    printf("%d\n",(((1<<31) & x)>>31));
	return 0;
}
