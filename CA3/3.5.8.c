#include "stdio.h"
#include "stdlib.h"
int var_ele(long n, int A[n][n], long i,long j)
{
    return A[i][j];
}
#define N 20
void main()
{
    int a[N][N];
	int **p = a;
    p = (int**)malloc(sizeof(int*) * N);
	for (int i = 0; i < N; ++i)
		p[i] = (int*)malloc(sizeof(int*) * N);
	a[5][20]=555;
	printf("%d\n", var_ele(N, a,5,20));
	system("pause");
}
