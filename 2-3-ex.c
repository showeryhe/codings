#include<stdio.h>

int main()
{
	int x, y, n;
	x = 17;
	y = 16;
	n = 4;
	printf("The floor of %d / %d is %d.\n", x, n, x / n);
	printf("The ceiling of %d / %d is %d.\n", x, n, (-17) / 4 );
	printf("The ceiling of %d / %d is %d.\n", y, n, - (-y) / n);
	return 0;
}
