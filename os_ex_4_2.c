#include <stdio.h>

void print_gewei(int x)
{
	int g;
	g = x % 10;
	printf("gewei of %d is %d.\n", x, g);
}

void print_shiwei(int x)
{
	int s;
	s = (x % 100)/10;
	printf("shiwei of %d is %d.\n", x, s);
}

int main(void)
{
	print_gewei(199);
	print_shiwei(238);
}
