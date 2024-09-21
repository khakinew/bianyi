.section  .data
arr:        .word 54, 24, 33, 99, 50

size:       .word 5                        # 数组大小，5个元素
sum:        .word 0                         # 和
avg:        .word 0                         # 平均值
max:        .word 0                         # 最大值
min:        .word 0                         # 最小值
sum_format: .asciz "数组总和: %d\n"
avg_format: .asciz "平均值: %d\n"
max_format: .asciz "最大值: %d\n"
min_format: .asciz "最小值: %d\n"

.section    .text

.globl main
main:
la a0, arr        # 数组首地址
lw t1, size      # 数组大小
li t2, 0          # 累加器
li t3, 4          # 地址偏移
lw t5, 0(a0)      # 加载第一个元素,赋值给最小值
mv t6, t5          # 同时赋值给最大值

loop:
lw t4, 0(a0)       # 加载下一个数组元素
add t2, t2, t4     # 累加
addi a0, a0, 4     # 指向下一个数组元素
addi t1, t1, -1    # 数组大小减1

#更新最大值和最小值
blt t4, t6, min_check  # 如果 t4 < 最大值，跳到最小值检查
mv t6, t4          # 更新最大值为 t4
min_check:
bgt t4, t5, max_check  # 如果 t4 > 最小值，跳到最大值检查
mv t5, t4          # 更新最小值为 t4
max_check:

bnez t1, loop      # 如果 t1 不为0，继续循环
#存储和
la a1, sum
sw t2, 0(a1)

#平均值
lw t1, size        # 重新加载数组大小
div t2, t2, t1     # sum/ size
la a1, avg
sw t2, 0(a1)

#最大值和最小值
la a1, max         # 加载 max 的地址
sw t6, 0(a1)       # 最大值存储到 max
la a1, min

sw t5, 0(a1)

#输出结果
la a0, sum_format
lw a1, sum
call printf

la a0, avg_format
lw a1, avg
call printf

la a0, max_format
lw a1, max
call printf

la a0, min_format
lw a1, min
call printf

#结束
li a7, 93
li a0, 0
ecall
