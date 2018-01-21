#include <stdio.h>

int increment(int x)
{
	return x + 1;
}

int main(void)
{
	int i = 1, j = 2;
	increment(i); /* now i becomes 2 */
	increment(j); /* now j becomes 3 */
	return 0;
}
