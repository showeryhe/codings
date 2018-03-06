#include<stdio.h>

int is_leap_year(int year)
{
  char* yes = "leap";
  char* no = "not leap";
  if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0))
    {
      printf("%s\n", yes);
      return 0;
    }
    else
    {
      printf("%s\n", no);
      return 1;
    }
}

int main(void)
{
  int year;
  scanf("%d", &year);
  is_leap_year(year);
}
