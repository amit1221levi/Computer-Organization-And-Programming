.global _start

.section .text
_start:
#your code here

movl (val),%eax 
movq head, %rbx # save the address of head in rbx
mov head, %rdx
movl $0, %ecx # set counter of identic values (have to be 2 to swap)
cmp $0,%rbx
je end_HW1

xor %rdi, %rdi
xor %rsp, %rsp
xor %rsi, %rsi
xor %r9, %r9
xor %r8, %r9

loop_ex5_HW1:

cmpl (%rbx), %eax # compare between actual value and val
jne continue_HW1 # jump to the next value
addl $1,%ecx # counter++
continue_HW1:
 mov 8(%rbx),%rbx # pointer = pointer->next 
 cmp $0, %rbx # check if the acutal new pointer is null (end of list)
jne loop_ex5_HW1 # restart for next value if not null
cmpl $2,%ecx  # counter == 2 ?
je swap_label_HW1 # counter == 2 so we go to swap handler
jmp end_HW1

swap_label_HW1:

mov head, %r11
cmpl (%r11), %eax
je handle_r2_direct_HW1
mov 8(%rdx), %rbx # rbx = head->next
mov head, %rsi # previousp1= head
loop_r1_HW1: # find r1 and prevr1
cmpl (%rbx), %eax # compare between actual value and val
je handle_r2_HW1
mov %rbx, %rsi # previous = pointer
mov 8(%rbx), %rbx # pointer=pointer->next
jmp loop_r1_HW1

handle_r2_direct_HW1:
mov head, %rbx
jmp handle_r2_HW1

handle_r2_HW1: # at this stage we have the previous and current of first node to swap
mov %rbx, %rdi # prevr2 = r1
mov 8(%rbx), %rsp # r2 = r1->next

loop_r2_HW1: # find r2 and prevr2
cmpl (%rsp), %eax # compare between actual value and val
je swap_HW1          # we found r2 and prevr2
mov %rsp, %rdi # prev2 = r2
mov 8(%rsp), %rsp  # r2 = r2->next
jmp loop_r2_HW1


swap_HW1:

# general case r1 and r2 different from start and end of list
cmp %rdx ,%rbx # r1 == head ?
je label_first_HW1
cmp $0, 8(%rsp)  # r2->next == null ?
je label_last_HW1
cmp 8(%rbx), %rsp
je follow_HW1
mov %rsp, 8(%rsi) # r1preve->next = r2
mov 8(%rbx), %r9 # r9 = r1->next r9 is a temp

mov 8(%rsp), %r10 # r10 = r2->next temp
mov %r9, 8(%rsp) # r2->next = r1->next
mov %rbx,8(%rdi) # prevr2->next= r1
mov %r10, 8(%rbx) # r1->next = r2->next
jmp end_HW1

# r1 == head (prevr1 == null)
label_first_HW1:
mov %rsp, (head)
mov 8(%rbx), %r9 # r9 = r1->next r9 is a temp
mov 8(%rsp), %r10 # r10 = r2->next temp

mov %r9, 8(%rsp) # r2->next = r1->next
mov %r10, 8(%rbx) # r1->next = r2->next
mov %rbx,8(%rdi) # prevr2->next= r1
jmp end_HW1

# r2->next == null
label_last_HW1:
mov %rbx, 8(%rdi)
mov 8(%rbx), %r9 # r9 = r1->next r9 is a temp
mov %rsp, 8(%rsi) # r1preve->next = r2
mov %r9, 8(%rsp) # r2->next = r1->next
movq $0, 8(%rbx) # r1->next = null
jmp end_HW1

follow_HW1:
mov 8(%rbx), %r9 # r9 = r1->next r9 is a temp
mov 8(%rsp), %r10 # r10 = r2->next temp
mov %rsp, 8(%rsi) # r1preve->next = r2
mov %r10, 8(%rbx) # r1->next = r2->next
mov %rbx, 8(%rsp)


end_HW1:


