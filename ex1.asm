.global _start

.section .text
_start:
#your code here

cmp $0,num 
je end_hw1

mov (num), %rax
and $3, %rax
cmp $0, %rax
je DIVIDE_HW1
movb $0, (Bool)
jmp end_hw1

DIVIDE_HW1:
movb $1, (Bool)

end_hw1:

