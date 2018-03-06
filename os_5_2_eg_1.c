#include<math.h>
#include<stdio.h>

double distance(double x1, double y1, double x2, double y2)
{
  double dx = x1 - x2;
  double dy = y1 - y2;
  return sqrt(dx*dx + dy*dy);
}

float area(float d)
{
  return(3.1415*d*d / 4); // Pi?
}

int main(void)
{
  double x1, y1, x2, y2;
  scanf("%lf %lf %lf %lf", &x1, &y1, &x2, &y2);
  //双精度对应格式字符为%lf
  double d = distance(x1, y1, x2, y2);
  double a = area(d);
  printf("The area is %f.\n", a);
  return 0;
  //编译的命令应该是 gcc -Wall os_5_2_eg_1.c -lm
}
