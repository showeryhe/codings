#include <stdio.h>

int main()
{
	int hour, minute, total_minute;
	hour = 8;
	minute = 59;
	total_minute = hour * 60 + minute;
	printf("%d:%d is %d minutes after 00:00.\n", hour, minute, total_minute);
	printf("%d hours and %d an hour.\n", hour, minute / 60); /* Thus truncted */
	printf("%d hours and %d percent of an hour.\n", hour, minute * 100 / 60);
	minute = -59;
	printf("%d hours and %d an hour.\n", hour, minute / 60); /* Thus truncted */
	printf("%d hours and %f percent of an hour.\n", hour, minute / 60.0);
	return 0;	/* the ";" here cannot be forgotten */
}
