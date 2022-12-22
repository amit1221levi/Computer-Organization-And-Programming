.global _start

.section .text
_start:
xor %rsi, %rsi
xor %rax, %rax
movl (num),%eax             # Store num
leaq (source), %rbx         # Store source
leaq (destination), %rcx    # Store destination

cmpl $0, %eax               # Check if num is 0   
je end_HW1  

cmpl $0, %eax
jge choose_copy_HW1
imul $-1, %eax              # Make num positive
backward_copy_HW1:
addq %rax, %rbx
decq %rbx
backward_copy_loop_HW1:
movb (%rbx), %dl
movb %dl, (%rcx)
subq $1, %rbx
addq $1, %rcx
addq $1, %rsi
cmpq %rsi, %rax
jg backward_copy_loop_HW1
jmp end_HW1

choose_copy_HW1:
forward_copy_HW1:
movb (%rbx), %dl
movb %dl, (%rcx)
addq $1, %rbx
addq $1, %rcx
addq $1, %rsi
cmpq %rsi, %rax
jg forward_copy_HW1

end_HW1:
