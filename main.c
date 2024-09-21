#include <stdio.h>
 int main()
 {
 int i, n, f;
 n = 5;
 i = 2;
 f = 1;
 while (i <= n)
{
  f = f * i;
  i = i + 1;
}
printf("Factorial of %d is %d\n", n, f);
}
