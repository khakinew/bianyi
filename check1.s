.section .data
fmt_sum:    .asciz "和: %d\n"
fmt_diff:   .asciz "差: %d\n"
fmt_prod:   .asciz "积: %d\n"
fmt_quot:   .asciz "商: %d\n"
fmtb:       .asciz "b: %d\n"
fmta:       .asciz "a: %d\n"
input_fmt:  .asciz "%d %d"
a:          .word 0
b:          .word 0

zero_message: .asciz "不能输入0.\n"

.section .text
.globl main

main:
la a0, input_fmt
la a1, a
la a2, b
call scanf

lw s0, a
lw s1, b

# 计算和
add t2, s0, s1
la a0, fmt_sum
mv a1, t2
call printf

# 计算差
sub t3, s0, s1
la a0, fmt_diff
mv a1, t3
call printf

# 计算乘积
mul t4, s0, s1
la a0, fmt_prod
mv a1, t4
call printf

# 计算商
beqz s1, zero_div   # 检查除数是否为零
div t5, s0, s1
la a0, fmt_quot
mv a1, t5
call printf
j end_div
zero_div:
la a0, zero_message  # 加载错误消息的地址
call printf

end_div:

# 打印 a 和 b
la a0, fmta
mv a1, s0
call printf

la a0, fmtb
mv a1, s1
call printf

# 交换 a 和 b
mv t2, s0
mv s0, s1
mv s1, t2

# 打印交换后的 a 和 b
la a0, fmta
mv a1, s0
call printf

la a0, fmtb
mv a1, s1
call printf

#结束
li a7, 93
li a0, 0
ecall
