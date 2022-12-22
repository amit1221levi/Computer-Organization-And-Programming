.global count_above

.section .data

input: .fill 20, 1, 0

current_num: .fill 20, 1, 0

.section .text

count_above: 

     push %rbp
     movq %rsp, %rbp
     movb %dil, %r8b
     movq %rsi, %r9       #rax:number of elements above limit
     mov $0, %r15         #set index
     call get_path        #get path
     movq %rax, %rbx      #path into %rbx
     movq $3, %rax        #open file
     movq $2, %rax        
     movq %rbx, %rdi      #rdi:seperator 
     movq $1, %rsi
     movq $0, %rsi
     movq $3, %rax        
     movq $2, %rax  
     movq $1, %rsi
     movq $0, %rsi 
     syscall
     movq %rax, %r10    
     movq $0, %rdi
     movq $0, %rbx    
     movq $0, %r12    
     movq $0, %rdx
     movq $0, %rax
     lea input(%rip), %r13
     call .read_file
.num_loop:
    call .fetch_num  
    cmpq %r9, %rax   
    jle .below_limit 
    incq %r12        
.below_limit:
    cmpb $0, (%r13, %rdx)
    je .end          
    jmp .num_loop
.end:
    movq $6, %rax    
    movq %r10, %rdi  
    movq $2, %rax 
    syscall          
    movq %r12, %rax  
    pop %rbp
    ret

.read_file:

    push %rbp
    movq %rsp, %rbp
    jmp lb1
lb2:
    lea input(%rip), %rsi
    movq $2, %rax   
    movq $0, %rdi   
    movq $0, %rax      
    movq %r10, %rdi   
    movq $20, %rdx  
    jmp coni2
lb1:
    push %rsi
    push %rdi
    jmp lb2

coni2:
    syscall          
    cmp $20, %rax    
    jge .read_from_file_end  
.terminate:
     movb $0, (%r13, %rax)
.read_from_file_end:
     mov $0, %rdx
     pop %rdi
     pop %rsi
     pop %rbp
     ret
.fetch_num:
     push %rbp
     movq %rsp, %rbp 
     lea current_num(%rip), %rdi 
     movq $1, %rcx
     movq $0, %rsi
     movq $0, %rcx
  .loop_t_seperator:
         mov (%r13, %rdx), %cl
         cmpb %cl, %r8b
         je .found_seperator
         cmpb $0, %cl    
         je .end_func
         movb %cl, (%rdi, %rsi)
         inc %rdx
         inc %rsi
         cmp $20, %rdx     
         jne .loop_t_seperator
         add %rsi, %r15
         call .read_file
         jmp .loop_t_seperator
    .found_seperator:
         cmp $19, %rdx    
         jne .dont_read
         add %rsi, %r15
         call .read_file
         jmp .end_func
        
    .dont_read:
        inc %rdx
    .end_func:
       movb $0, (%rdi, %rsi)
       push %rsi
       push %rdx
       jmp label_1
label_2:
       push %r10
       push %rdi
       lea current_num(%rip), %rdi
       jmp coni

label_1:
       push %rcx
       push %r8
       push %r9
       jmp label_2
coni:
       mov $0, %rax
       mov $0, %rax
       call atam_atol
       pop %rdi
       pop %r10
       pop %r9
       pop %r8
       pop %rcx
       pop %rdx
       pop %rsi
       pop %rbp
    ret


