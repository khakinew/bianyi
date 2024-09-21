#include <stdio.h>

int main() {
    int arr[] = {54, 24, 33, 99, 50};
    int size = 5; // 数组大小
    int sum = 0;  // 和
    int avg = 0;  // 平均值
    int max = arr[0]; // 最大值，初始化为第一个元素
    int min = arr[0]; // 最小值，初始化为第一个元素

    // 计算总和、最大值和最小值
    for (int i = 0; i < size; i++) {
        sum += arr[i];
        if (arr[i] > max) {
            max = arr[i]; // 更新最大值
        }
        if (arr[i] < min) {
            min = arr[i]; // 更新最小值
        }
    }

    // 计算平均值
    avg = sum / size;

    printf("数组总和: %d\n", sum);
    printf("平均值: %d\n", avg);
    printf("最大值: %d\n", max);
    printf("最小值: %d\n", min);

    return 0;
}

