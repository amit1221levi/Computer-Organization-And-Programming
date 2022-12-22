.global _start

.section .text
_start:
	lea array1,%rax
	lea array2,%rbx
	lea mergedArray,%rdx
	movl $0,(%rdx)
	cmp $0,(%rax)
	jne no_zero1_HW1
	cmpl $0,(%rbx)
	je done_HW1
	no_zero1_HW1:
	movl (%rax),%edi
	cmpl (%rbx),%edi
	jae arr1_f_HW1
	jmp arr2_f_HW1
	arr1_f_HW1:
		movl %edi,(%rdx)
		addq $4,%rax
		jmp loop_HW1
	arr2_f_HW1:
		movl (%rbx),%edi
		movl %edi,(%rdx)
		addq $4,%rbx
		jmp loop_HW1	

	loop_HW1:
		cmp $0,(%rax)
		jne no_zero_HW1
		cmpl $0,(%rbx)
		je done_HW1
		no_zero_HW1:
			movl (%rax),%edi
			cmpl (%rbx),%edi
			jae arr1_label_HW1
			jmp arr2_label_HW1
	arr1_label_HW1:
		cmpl %edi,(%rdx)
		je array1_e_HW1
		addq $4,%rdx
		mov %edi,(%rdx)
		array1_e_HW1:
		addq $4,%rax
		jmp loop_HW1

	arr2_label_HW1:
		movl (%rbx),%edi
		cmpl %edi,(%rdx)
		je array2_e_HW1
		addq $4,%rdx
		movl %edi,(%rdx)
		array2_e_HW1:
		addq $4,%rbx
		jmp loop_HW1
	done_HW1:

		
	

















		
		