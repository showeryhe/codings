#include<stdio.h>

void print_parity(int x)
{
	if (x % 2 == 0)
		printf("%d is even.\n", x);
	else
		printf("%d is odd.\n", x);
}


void print_pos(int x)
{
	if (x > 0)
		printf("%d is positive.\n", x);
	else if (x < 0)
		printf("%d is negative.\n", x);
	else 
		printf("%d is zero.\n", x);
}
int main(void)
{
	print_parity(17);
	print_parity(18);
	print_pos(1);
	print_pos(0);
	print_pos(-3);
}
