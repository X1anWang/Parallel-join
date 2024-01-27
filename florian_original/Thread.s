	.file	"Thread.cpp"
	.section	.text.unlikely.ecall_increase_counter,"ax",@progbits
.LCOLDB0:
	.section	.text.ecall_increase_counter,"ax",@progbits
.LHOTB0:
	.p2align 4,,15
	.globl	ecall_increase_counter
	.hidden	ecall_increase_counter
	.type	ecall_increase_counter, @function
ecall_increase_counter:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%ebp, %ebp
	movl	$500, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L3:
	leaq	_ZL12global_mutex(%rip), %rdi
	call	sgx_thread_mutex_lock@PLT
	movq	_ZL14global_counter(%rip), %rax
	leaq	_ZL12global_mutex(%rip), %rdi
	addq	$1, %rax
	cmpq	$2000, %rax
	movq	%rax, _ZL14global_counter(%rip)
	movl	$2000, %eax
	cmove	%rax, %rbp
	call	sgx_thread_mutex_unlock@PLT
	subl	$1, %ebx
	jne	.L3
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	ecall_increase_counter, .-ecall_increase_counter
	.section	.text.unlikely.ecall_increase_counter
.LCOLDE0:
	.section	.text.ecall_increase_counter
.LHOTE0:
	.section	.text.unlikely.ecall_producer,"ax",@progbits
.LCOLDB1:
	.section	.text.ecall_producer,"ax",@progbits
.LHOTB1:
	.p2align 4,,15
	.globl	ecall_producer
	.hidden	ecall_producer
	.type	ecall_producer, @function
ecall_producer:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	_ZL6buffer(%rip), %rbp
	movl	$2000, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L11:
	leaq	216+_ZL6buffer(%rip), %rdi
	call	sgx_thread_mutex_lock@PLT
	movl	200+_ZL6buffer(%rip), %ecx
	cmpl	$49, %ecx
	jle	.L9
	.p2align 4,,10
	.p2align 3
.L12:
	leaq	216+_ZL6buffer(%rip), %rsi
	leaq	280+_ZL6buffer(%rip), %rdi
	call	sgx_thread_cond_wait@PLT
	movl	200+_ZL6buffer(%rip), %ecx
	cmpl	$49, %ecx
	jg	.L12
.L9:
	movslq	204+_ZL6buffer(%rip), %rax
	movl	$1374389535, %edx
	leaq	256+_ZL6buffer(%rip), %rdi
	addl	$1, %ecx
	movl	%ecx, 200+_ZL6buffer(%rip)
	movq	%rax, %rsi
	movl	%eax, 0(%rbp,%rax,4)
	addl	$1, %esi
	movl	%esi, %eax
	imull	%edx
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	$4, %edx
	subl	%eax, %edx
	imull	$50, %edx, %edx
	subl	%edx, %esi
	movl	%esi, 204+_ZL6buffer(%rip)
	call	sgx_thread_cond_signal@PLT
	leaq	216+_ZL6buffer(%rip), %rdi
	call	sgx_thread_mutex_unlock@PLT
	subl	$1, %ebx
	jne	.L11
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	ecall_producer, .-ecall_producer
	.section	.text.unlikely.ecall_producer
.LCOLDE1:
	.section	.text.ecall_producer
.LHOTE1:
	.section	.text.unlikely.ecall_consumer,"ax",@progbits
.LCOLDB2:
	.section	.text.ecall_consumer,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.globl	ecall_consumer
	.hidden	ecall_consumer
	.type	ecall_consumer, @function
ecall_consumer:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	_ZL6buffer(%rip), %rbp
	movl	$500, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L19:
	leaq	216+_ZL6buffer(%rip), %rdi
	call	sgx_thread_mutex_lock@PLT
	movl	200+_ZL6buffer(%rip), %ecx
	testl	%ecx, %ecx
	jg	.L17
	.p2align 4,,10
	.p2align 3
.L20:
	leaq	216+_ZL6buffer(%rip), %rsi
	leaq	256+_ZL6buffer(%rip), %rdi
	call	sgx_thread_cond_wait@PLT
	movl	200+_ZL6buffer(%rip), %ecx
	testl	%ecx, %ecx
	jle	.L20
.L17:
	movslq	208+_ZL6buffer(%rip), %rax
	movl	$1374389535, %edx
	leaq	280+_ZL6buffer(%rip), %rdi
	subl	$1, %ecx
	movl	%ecx, 200+_ZL6buffer(%rip)
	movq	%rax, %rsi
	movl	$0, 0(%rbp,%rax,4)
	addl	$1, %esi
	movl	%esi, %eax
	imull	%edx
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	$4, %edx
	subl	%eax, %edx
	imull	$50, %edx, %edx
	subl	%edx, %esi
	movl	%esi, 208+_ZL6buffer(%rip)
	call	sgx_thread_cond_signal@PLT
	leaq	216+_ZL6buffer(%rip), %rdi
	call	sgx_thread_mutex_unlock@PLT
	subl	$1, %ebx
	jne	.L19
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
	.size	ecall_consumer, .-ecall_consumer
	.section	.text.unlikely.ecall_consumer
.LCOLDE2:
	.section	.text.ecall_consumer
.LHOTE2:
	.section	.data._ZL6buffer,"aw",@progbits
	.align 32
	.type	_ZL6buffer, @object
	.size	_ZL6buffer, 304
_ZL6buffer:
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.zero	176
	.long	0
	.long	0
	.long	0
	.zero	4
	.quad	0
	.long	1
	.long	0
	.quad	0
	.quad	0
	.quad	0
	.long	0
	.zero	4
	.quad	0
	.quad	0
	.long	0
	.zero	4
	.quad	0
	.quad	0
	.section	.data._ZL12global_mutex,"aw",@progbits
	.align 32
	.type	_ZL12global_mutex, @object
	.size	_ZL12global_mutex, 40
_ZL12global_mutex:
	.quad	0
	.long	1
	.long	0
	.quad	0
	.quad	0
	.quad	0
	.section	.bss._ZL14global_counter,"aw",@nobits
	.align 8
	.type	_ZL14global_counter, @object
	.size	_ZL14global_counter, 8
_ZL14global_counter:
	.zero	8
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
