.global _start

.section .text
_start:
movq root, %rcx
movq $new_node, %rbx
jmp root_label_HW1

smaller_HW1:
cmp $0, 16(%rcx)     
je zero_rson_HW1
movq 16(%rcx), %rcx
jmp non_empty_tree_HW1

non_empty_tree_HW1:
movq (%rcx), %rdx      
cmpq (%rbx), %rdx
je end_HW1
cmpq (%rbx), %rdx
jg greater_HW1
jmp smaller_HW1

zero_lson_HW1:
addq $8,%rcx
movq %rbx,(%rcx)
jmp end_HW1

zero_rson_HW1:
movq %rbx, 16(%rcx)
jmp end_HW1

greater_HW1:          
cmp $0, 8(%rcx)
je zero_lson_HW1
mov 8(%rcx), %rcx
jmp non_empty_tree_HW1

root_label_HW1:
cmpq $0, %rcx
jne non_empty_tree_HW1
movq %rbx, (root)


end_HW1:





