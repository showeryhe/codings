#include <stdio.h>

int gcd(int a, int b){
  if (a%b == 0){
    return b;
  }
  else{
    return gcd(b, a%b);
  }
}

int main(void){
  int a, b, g;
  scanf("%d %d", &a, &b);
  if (a*a + b*b == 0){
    g = -1;
  }
  else{
    if (b == 0){
      g = a;
    }
    else{
        if (b < 0){
          g = gcd(a, -b);
        }
        else{
          g = gcd(a, b);
        }
      }
    }
  //有没有一个取绝对值的方便函数？
  return g;
}
