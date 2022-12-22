.globl my_ili_handler

.text
.align 4, 0x90

my_ili_handler:
  pushq %rax
  pushq %rbx
  pushq %rcx
  pushq %rdx	
  pushq %r8
  pushq %r9
  pushq %r10
  pushq %r11
  pushq %r12
  pushq %r13
  pushq %r14
  pushq %r15
  pushq %rsi
  pushq %rbp
  pushq %rsp

  movq $0, %rdi
  movq $0, %rax
  movq $0, %rbx
  movq $0, %rdx
  movq 120(%rsp),%rbx
  cmpb $0x0f, (%rbx)
  je two_byte

  movb (%rbx), %dl
  movq %rdx, %rdi
  call what_to_do
  cmpq $0, %rax
  jne my_handler_HW2
  jmp default_handler_HW2

two_byte:

  movw (%rbx),%dx
  shr $8, %rdx  
  movq %rdx, %rdi
  call what_to_do
  cmpq $0, %rax
  jne my_handler_HW2
  jmp default_handler_HW2
  

default_handler_HW2:
  popq %rsp
  popq %rbp
  popq %rsi
  popq %r15
  popq %r14
  popq %r13
  popq %r12
  popq %r11
  popq %r10
  popq %r9
  popq %r8
  popq %rdx
  popq %rcx
  popq %rbx
  popq %rax

  jmp * old_ili_handler
  jmp end

my_handler_HW2:
  movq %rax, %rdi
  
  popq %rsp
  popq %rbp
  popq %rsi
  popq %r15
  popq %r14
  popq %r13
  popq %r12
  popq %r11
  popq %r10
  popq %r9
  popq %r8
  popq %rdx
  popq %rcx
  popq %rbx
  popq %rax
	
  addq $2, (%rsp) 
	
end:
  iretq