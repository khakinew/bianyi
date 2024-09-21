#include <stdio.h>

int main() {
    int a, b;

    // 输入两个整数
    printf("请输入两个整数: ");
    scanf("%d %d", &a, &b);

    // 计算和
    int sum = a + b;
    printf("和: %d\n", sum);

    // 计算差
    int diff = a - b;
    printf("差: %d\n", diff);

    // 计算乘积
    int prod = a * b;
    printf("积: %d\n", prod);

    // 计算商
    if (b == 0) {
        printf("不能输入0.\n");
    } else {
        int quot = a / b;
        printf("商: %d\n", quot);
    }

    // 打印 a 和 b
    printf("a: %d\n", a);
    printf("b: %d\n", b);

    // 交换 a 和 b
    int temp = a;
    a = b;
    b = temp;

    // 打印交换后的 a 和 b
    printf("交换后的 a: %d\n", a);
    printf("交换后的 b: %d\n", b);

    return 0;
}

