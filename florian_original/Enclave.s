	.file	"Enclave.cpp"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"i >= 0 && i < size"
.LC1:
	.string	"IncludeL3/trace_mem.h"
	.section	.text.unlikely._Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16,"ax",@progbits
.LCOLDB2:
	.section	.text._Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.type	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16, @function
_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16:
.LFB2107:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	subl	%edx, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r14
	subq	$264, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rdi
	movq	%rdi, 248(%rsp)
	xorl	%edi, %edi
	cmpl	$1, %eax
	movl	%esi, 44(%rsp)
	movl	%edx, 32(%rsp)
	movl	%ecx, 40(%rsp)
	movb	%sil, 11(%rsp)
	jle	.L22
	movl	%eax, %edx
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	addl	%eax, %eax
	cmpl	%eax, %edx
	jg	.L3
	sarl	%eax
.L2:
	movl	40(%rsp), %ebx
	subl	%eax, %ebx
	cmpl	%ebx, 32(%rsp)
	movl	%ebx, 20(%rsp)
	jge	.L30
	movslq	32(%rsp), %r8
	leaq	48(%rsp), %rbp
	leal	(%r8,%rax), %edi
	cltq
	movq	%r8, %rbx
	salq	$5, %rax
	salq	$5, %r8
	movl	%ebx, %r12d
	movq	%rax, 24(%rsp)
	leaq	80(%rsp), %rax
	movl	%edi, 36(%rsp)
	movl	%edi, %r15d
	movq	%r8, %r13
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L18:
	testl	%r12d, %r12d
	js	.L7
	cmpl	%r12d, 44(%r14)
	jg	.L8
.L7:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
.L8:
	movq	(%r14), %rax
	testl	%r15d, %r15d
	movq	(%rax,%r13), %rdx
	movq	%rdx, 48(%rsp)
	movq	8(%rax,%r13), %rdx
	movq	%rdx, 56(%rsp)
	movq	16(%rax,%r13), %rdx
	movq	%rdx, 64(%rsp)
	movq	24(%rax,%r13), %rdx
	movq	%rdx, 72(%rsp)
	js	.L9
	cmpl	44(%r14), %r15d
	jl	.L10
.L9:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
	movq	(%r14), %rax
.L10:
	movq	24(%rsp), %rbx
	addq	%r13, %rbx
	movq	(%rax,%rbx), %rdx
	movq	%rdx, 80(%rsp)
	movq	8(%rax,%rbx), %rdx
	movq	%rdx, 88(%rsp)
	movq	16(%rax,%rbx), %rdx
	movq	%rdx, 96(%rsp)
	movq	24(%rax,%rbx), %rdx
	movq	%rdx, 104(%rsp)
#APP
# 32 "IncludeL3/sort.h" 1
	# FOAV bitonic_compare_enter1 e1 (48(%rsp))
	# FOAV bitonic_compare_enter1 e2 (80(%rsp))
# 0 "" 2
# 33 "IncludeL3/sort.h" 1
	# FOAV bitonic_compare_enter2 i (%r12d)
	# FOAV bitonic_compare_enter2 j (%r15d)
# 0 "" 2
#NO_APP
	movzbl	11(%rsp), %edi
#APP
# 34 "IncludeL3/sort.h" 1
	# FOAV bitonic_compare_enter3 ascend (%dil)
# 0 "" 2
#NO_APP
	movl	48(%rsp), %edx
	movl	80(%rsp), %esi
#APP
# 88 "IncludeL3/sort.h" 1
	# FOAV ind_func_comp1 res ($0)
# 0 "" 2
#NO_APP
	xorl	%ecx, %ecx
	testl	%edx, %edx
	setne	%cl
	imull	72(%rsp), %ecx
	testl	%edx, %edx
	sete	%dl
	movzbl	%dl, %edx
	subl	%edx, %ecx
	xorl	%edx, %edx
	testl	%esi, %esi
	setne	%dl
	imull	104(%rsp), %edx
	testl	%esi, %esi
	sete	%sil
	xorl	%r9d, %r9d
	movzbl	%sil, %esi
	subl	%esi, %edx
	cmpl	$-1, %edx
	setne	%r9b
	xorl	%esi, %esi
	cmpl	%edx, %ecx
	setl	%sil
	imull	%esi, %r9d
	xorl	%esi, %esi
	cmpl	$-1, %edx
	sete	%sil
	leal	(%r9,%rsi), %edx
	xorl	%r9d, %r9d
	cmpl	$-1, %ecx
	setne	%r9b
	imull	%edx, %r9d
#APP
# 90 "IncludeL3/sort.h" 1
	# FOAV ind_func_comp2 res (%r9d)
# 0 "" 2
#NO_APP
	testl	%r9d, %r9d
	movq	(%rsp), %rdx
	sete	%r10b
	cmpb	%r10b, %dil
	cmovne	%rbp, %rdx
	testl	%r12d, %r12d
	movq	(%rdx), %rcx
	movq	%rcx, 112(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 120(%rsp)
	movq	16(%rdx), %rcx
	movq	24(%rdx), %rdx
	movq	%rcx, 128(%rsp)
	movq	%rdx, 136(%rsp)
	js	.L12
	cmpl	%r12d, 44(%r14)
	jg	.L13
.L12:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE6write2EiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$73, %esi
	movb	%r10b, 19(%rsp)
	movl	%r9d, 12(%rsp)
	call	__assert@PLT
	movzbl	19(%rsp), %r10d
	movq	(%r14), %rax
	movl	12(%rsp), %r9d
.L13:
#APP
# 83 "IncludeL3/trace_mem.h" 1
	# FOAV write_before i (%r12d)
# 0 "" 2
#NO_APP
	leaq	(%rax,%r13), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, 144(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 152(%rsp)
	movq	16(%rdx), %rcx
	movq	%rcx, 160(%rsp)
	movq	24(%rdx), %rcx
	movq	%rcx, 168(%rsp)
#APP
# 84 "IncludeL3/trace_mem.h" 1
	# FOAV write_before mem[i] (144(%rsp))
# 0 "" 2
# 85 "IncludeL3/trace_mem.h" 1
	# FOAV write_before elt (112(%rsp))
# 0 "" 2
#NO_APP
	movq	112(%rsp), %r11
	movq	120(%rsp), %rdi
	movq	128(%rsp), %rsi
	movq	136(%rsp), %rcx
	movq	%r11, (%rdx)
	movq	%rdi, 8(%rdx)
	movq	%rsi, 16(%rdx)
	movq	%rcx, 24(%rdx)
#APP
# 87 "IncludeL3/trace_mem.h" 1
	# FOAV write_after i (%r12d)
# 0 "" 2
#NO_APP
	movq	%r11, 144(%rsp)
	movq	%rdi, 152(%rsp)
	movq	%rsi, 160(%rsp)
	movq	%rcx, 168(%rsp)
#APP
# 88 "IncludeL3/trace_mem.h" 1
	# FOAV write_after mem[i] (144(%rsp))
# 0 "" 2
# 89 "IncludeL3/trace_mem.h" 1
	# FOAV write_after elt (112(%rsp))
# 0 "" 2
# 88 "IncludeL3/sort.h" 1
	# FOAV ind_func_comp1 res ($0)
# 0 "" 2
# 90 "IncludeL3/sort.h" 1
	# FOAV ind_func_comp2 res (%r9d)
# 0 "" 2
#NO_APP
	cmpb	%r10b, 11(%rsp)
	movq	(%rsp), %rdx
	cmove	%rbp, %rdx
	testl	%r15d, %r15d
	movq	(%rdx), %rcx
	movq	%rcx, 176(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 184(%rsp)
	movq	16(%rdx), %rcx
	movq	24(%rdx), %rdx
	movq	%rcx, 192(%rsp)
	movq	%rdx, 200(%rsp)
	js	.L15
	cmpl	44(%r14), %r15d
	jl	.L16
.L15:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE6write2EiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$73, %esi
	call	__assert@PLT
	movq	(%r14), %rax
	movq	192(%rsp), %rcx
.L16:
#APP
# 83 "IncludeL3/trace_mem.h" 1
	# FOAV write_before i (%r15d)
# 0 "" 2
#NO_APP
	addq	%rbx, %rax
	movq	(%rax), %rdx
	movq	%rdx, 208(%rsp)
	movq	8(%rax), %rdx
	movq	%rdx, 216(%rsp)
	movq	16(%rax), %rdx
	movq	%rdx, 224(%rsp)
	movq	24(%rax), %rdx
	movq	%rdx, 232(%rsp)
#APP
# 84 "IncludeL3/trace_mem.h" 1
	# FOAV write_before mem[i] (208(%rsp))
# 0 "" 2
# 85 "IncludeL3/trace_mem.h" 1
	# FOAV write_before elt (176(%rsp))
# 0 "" 2
#NO_APP
	movq	176(%rsp), %rdi
	movq	184(%rsp), %rsi
	movq	200(%rsp), %rdx
	movq	%rcx, 16(%rax)
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rdx, 24(%rax)
#APP
# 87 "IncludeL3/trace_mem.h" 1
	# FOAV write_after i (%r15d)
# 0 "" 2
#NO_APP
	movq	%rdi, 208(%rsp)
	movq	%rsi, 216(%rsp)
	movq	%rcx, 224(%rsp)
	movq	%rdx, 232(%rsp)
#APP
# 88 "IncludeL3/trace_mem.h" 1
	# FOAV write_after mem[i] (208(%rsp))
# 0 "" 2
# 89 "IncludeL3/trace_mem.h" 1
	# FOAV write_after elt (176(%rsp))
# 0 "" 2
#NO_APP
	addl	$1, %r12d
	addl	$1, %r15d
	addq	$32, %r13
	cmpl	%r12d, 20(%rsp)
	jne	.L18
	movl	32(%rsp), %eax
.L17:
	addl	$1, %eax
	cmpl	%eax, 36(%rsp)
	jle	.L5
	movzbl	44(%rsp), %esi
	movl	36(%rsp), %ecx
	movq	%r14, %rdi
	movl	32(%rsp), %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L5:
	movl	36(%rsp), %eax
	addl	$1, %eax
	cmpl	%eax, 40(%rsp)
	jle	.L1
	movq	248(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L28
	movzbl	44(%rsp), %esi
	movl	40(%rsp), %ecx
	movq	%r14, %rdi
	movl	36(%rsp), %edx
	addq	$264, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	.p2align 4,,10
	.p2align 3
.L1:
	.cfi_restore_state
	movq	248(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L28
	addq	$264, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L30:
	.cfi_restore_state
	movl	32(%rsp), %ebx
	addl	%ebx, %eax
	movl	%eax, 36(%rsp)
	movl	%ebx, %eax
	jmp	.L17
.L22:
	xorl	%eax, %eax
	jmp	.L2
.L28:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE2107:
	.size	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16, .-_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	.section	.text.unlikely._Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.LCOLDE2:
	.section	.text._Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.LHOTE2:
	.section	.text.unlikely._Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11,"ax",@progbits
.LCOLDB3:
	.section	.text._Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.type	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11, @function
_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11:
.LFB2102:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	subl	%edx, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r13
	movl	%esi, %r12d
	subq	$264, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rdi
	movq	%rdi, 248(%rsp)
	xorl	%edi, %edi
	cmpl	$1, %eax
	movl	%esi, 44(%rsp)
	movl	%edx, 32(%rsp)
	movl	%ecx, 40(%rsp)
	jle	.L52
	movl	%eax, %edx
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L33:
	addl	%eax, %eax
	cmpl	%eax, %edx
	jg	.L33
	sarl	%eax
.L32:
	movl	40(%rsp), %ebx
	subl	%eax, %ebx
	cmpl	%ebx, 32(%rsp)
	movl	%ebx, 20(%rsp)
	jge	.L59
	movslq	32(%rsp), %r8
	leal	(%r8,%rax), %edi
	cltq
	movq	%r8, %rbx
	salq	$5, %rax
	salq	$5, %r8
	movl	%ebx, %ebp
	movq	%rax, 24(%rsp)
	leaq	80(%rsp), %rax
	movq	%r13, %rbx
	movl	%edi, 36(%rsp)
	movl	%edi, %r15d
	movq	%r8, %r13
	movq	%rax, (%rsp)
	leaq	48(%rsp), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L48:
	testl	%ebp, %ebp
	js	.L37
	cmpl	%ebp, 44(%rbx)
	jg	.L38
.L37:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
.L38:
	movq	(%rbx), %rax
	testl	%r15d, %r15d
	movq	(%rax,%r13), %rdx
	movq	%rdx, 48(%rsp)
	movq	8(%rax,%r13), %rdx
	movq	%rdx, 56(%rsp)
	movq	16(%rax,%r13), %rdx
	movq	%rdx, 64(%rsp)
	movq	24(%rax,%r13), %rdx
	movq	%rdx, 72(%rsp)
	js	.L39
	cmpl	44(%rbx), %r15d
	jl	.L40
.L39:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
	movq	(%rbx), %rax
.L40:
	movq	24(%rsp), %rdi
	leaq	(%rdi,%r13), %r14
	movq	(%rax,%r14), %rdx
	movq	%rdx, 80(%rsp)
	movq	8(%rax,%r14), %rdx
	movq	%rdx, 88(%rsp)
	movq	16(%rax,%r14), %rdx
	movq	%rdx, 96(%rsp)
	movq	24(%rax,%r14), %rdx
	movq	%rdx, 104(%rsp)
#APP
# 32 "IncludeL3/sort.h" 1
	# FOAV bitonic_compare_enter1 e1 (48(%rsp))
	# FOAV bitonic_compare_enter1 e2 (80(%rsp))
# 0 "" 2
# 33 "IncludeL3/sort.h" 1
	# FOAV bitonic_compare_enter2 i (%ebp)
	# FOAV bitonic_compare_enter2 j (%r15d)
# 0 "" 2
# 34 "IncludeL3/sort.h" 1
	# FOAV bitonic_compare_enter3 ascend (%r12b)
# 0 "" 2
#NO_APP
	movl	84(%rsp), %edi
	cmpl	%edi, 52(%rsp)
	movl	56(%rsp), %ecx
	movl	88(%rsp), %esi
	setl	%dil
	xorl	%edx, %edx
	cmpl	%esi, %ecx
	sete	%dl
	movzbl	%dil, %edi
	imull	%edi, %edx
	xorl	%edi, %edi
	cmpl	%esi, %ecx
	setne	%dil
	cmpl	%esi, %ecx
	setl	%cl
	movzbl	%cl, %ecx
	imull	%edi, %ecx
	addl	%ecx, %edx
	movq	(%rsp), %rdx
	sete	%r10b
	cmpb	%r10b, %r12b
	cmovne	8(%rsp), %rdx
	testl	%ebp, %ebp
	movq	(%rdx), %rcx
	movq	%rcx, 112(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 120(%rsp)
	movq	16(%rdx), %rcx
	movq	24(%rdx), %rdx
	movq	%rcx, 128(%rsp)
	movq	%rdx, 136(%rsp)
	js	.L42
	cmpl	%ebp, 44(%rbx)
	jg	.L43
.L42:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE6write2EiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$73, %esi
	movb	%r10b, 19(%rsp)
	call	__assert@PLT
	movzbl	19(%rsp), %r10d
	movq	(%rbx), %rax
.L43:
#APP
# 83 "IncludeL3/trace_mem.h" 1
	# FOAV write_before i (%ebp)
# 0 "" 2
#NO_APP
	leaq	(%rax,%r13), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, 144(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 152(%rsp)
	movq	16(%rdx), %rcx
	movq	%rcx, 160(%rsp)
	movq	24(%rdx), %rcx
	movq	%rcx, 168(%rsp)
#APP
# 84 "IncludeL3/trace_mem.h" 1
	# FOAV write_before mem[i] (144(%rsp))
# 0 "" 2
# 85 "IncludeL3/trace_mem.h" 1
	# FOAV write_before elt (112(%rsp))
# 0 "" 2
#NO_APP
	movq	112(%rsp), %r11
	movq	120(%rsp), %rdi
	movq	128(%rsp), %rsi
	movq	136(%rsp), %rcx
	movq	%r11, (%rdx)
	movq	%rdi, 8(%rdx)
	movq	%rsi, 16(%rdx)
	movq	%rcx, 24(%rdx)
#APP
# 87 "IncludeL3/trace_mem.h" 1
	# FOAV write_after i (%ebp)
# 0 "" 2
#NO_APP
	movq	%r11, 144(%rsp)
	movq	%rdi, 152(%rsp)
	movq	%rsi, 160(%rsp)
	movq	%rcx, 168(%rsp)
#APP
# 88 "IncludeL3/trace_mem.h" 1
	# FOAV write_after mem[i] (144(%rsp))
# 0 "" 2
# 89 "IncludeL3/trace_mem.h" 1
	# FOAV write_after elt (112(%rsp))
# 0 "" 2
#NO_APP
	cmpb	%r10b, %r12b
	movq	(%rsp), %rdx
	cmove	8(%rsp), %rdx
	testl	%r15d, %r15d
	movq	(%rdx), %rcx
	movq	%rcx, 176(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 184(%rsp)
	movq	16(%rdx), %rcx
	movq	24(%rdx), %rdx
	movq	%rcx, 192(%rsp)
	movq	%rdx, 200(%rsp)
	js	.L45
	cmpl	44(%rbx), %r15d
	jl	.L46
.L45:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE6write2EiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$73, %esi
	call	__assert@PLT
	movq	(%rbx), %rax
	movq	192(%rsp), %rcx
.L46:
#APP
# 83 "IncludeL3/trace_mem.h" 1
	# FOAV write_before i (%r15d)
# 0 "" 2
#NO_APP
	addq	%r14, %rax
	movq	(%rax), %rdx
	movq	%rdx, 208(%rsp)
	movq	8(%rax), %rdx
	movq	%rdx, 216(%rsp)
	movq	16(%rax), %rdx
	movq	%rdx, 224(%rsp)
	movq	24(%rax), %rdx
	movq	%rdx, 232(%rsp)
#APP
# 84 "IncludeL3/trace_mem.h" 1
	# FOAV write_before mem[i] (208(%rsp))
# 0 "" 2
# 85 "IncludeL3/trace_mem.h" 1
	# FOAV write_before elt (176(%rsp))
# 0 "" 2
#NO_APP
	movq	176(%rsp), %rdi
	movq	184(%rsp), %rsi
	movq	200(%rsp), %rdx
	movq	%rcx, 16(%rax)
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rdx, 24(%rax)
#APP
# 87 "IncludeL3/trace_mem.h" 1
	# FOAV write_after i (%r15d)
# 0 "" 2
#NO_APP
	movq	%rdi, 208(%rsp)
	movq	%rsi, 216(%rsp)
	movq	%rcx, 224(%rsp)
	movq	%rdx, 232(%rsp)
#APP
# 88 "IncludeL3/trace_mem.h" 1
	# FOAV write_after mem[i] (208(%rsp))
# 0 "" 2
# 89 "IncludeL3/trace_mem.h" 1
	# FOAV write_after elt (176(%rsp))
# 0 "" 2
#NO_APP
	addl	$1, %ebp
	addl	$1, %r15d
	addq	$32, %r13
	cmpl	%ebp, 20(%rsp)
	jne	.L48
	movl	32(%rsp), %eax
	movq	%rbx, %r13
.L47:
	addl	$1, %eax
	cmpl	%eax, 36(%rsp)
	jle	.L35
	movzbl	44(%rsp), %esi
	movl	36(%rsp), %ecx
	movq	%r13, %rdi
	movl	32(%rsp), %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L35:
	movl	36(%rsp), %eax
	addl	$1, %eax
	cmpl	%eax, 40(%rsp)
	jle	.L31
	movq	248(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L58
	movzbl	44(%rsp), %esi
	movl	40(%rsp), %ecx
	movq	%r13, %rdi
	movl	36(%rsp), %edx
	addq	$264, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	.p2align 4,,10
	.p2align 3
.L31:
	.cfi_restore_state
	movq	248(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L58
	addq	$264, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L59:
	.cfi_restore_state
	movl	32(%rsp), %ebx
	addl	%ebx, %eax
	movl	%eax, 36(%rsp)
	movl	%ebx, %eax
	jmp	.L47
.L52:
	xorl	%eax, %eax
	jmp	.L32
.L58:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE2102:
	.size	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11, .-_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	.section	.text.unlikely._Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.LCOLDE3:
	.section	.text._Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.LHOTE3:
	.section	.text.unlikely._Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13,"ax",@progbits
.LCOLDB4:
	.section	.text._Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.type	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13, @function
_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13:
.LFB2104:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	subl	%edx, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r13
	movl	%esi, %r12d
	subq	$264, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rdi
	movq	%rdi, 248(%rsp)
	xorl	%edi, %edi
	cmpl	$1, %eax
	movl	%esi, 44(%rsp)
	movl	%edx, 32(%rsp)
	movl	%ecx, 40(%rsp)
	jle	.L81
	movl	%eax, %edx
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L62:
	addl	%eax, %eax
	cmpl	%eax, %edx
	jg	.L62
	sarl	%eax
.L61:
	movl	40(%rsp), %ebx
	subl	%eax, %ebx
	cmpl	%ebx, 32(%rsp)
	movl	%ebx, 20(%rsp)
	jge	.L88
	movslq	32(%rsp), %r8
	leal	(%r8,%rax), %edi
	cltq
	movq	%r8, %rbx
	salq	$5, %rax
	salq	$5, %r8
	movl	%ebx, %ebp
	movq	%rax, 24(%rsp)
	leaq	80(%rsp), %rax
	movq	%r13, %rbx
	movl	%edi, 36(%rsp)
	movl	%edi, %r15d
	movq	%r8, %r13
	movq	%rax, (%rsp)
	leaq	48(%rsp), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L77:
	testl	%ebp, %ebp
	js	.L66
	cmpl	%ebp, 44(%rbx)
	jg	.L67
.L66:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
.L67:
	movq	(%rbx), %rax
	testl	%r15d, %r15d
	movq	(%rax,%r13), %rdx
	movq	%rdx, 48(%rsp)
	movq	8(%rax,%r13), %rdx
	movq	%rdx, 56(%rsp)
	movq	16(%rax,%r13), %rdx
	movq	%rdx, 64(%rsp)
	movq	24(%rax,%r13), %rdx
	movq	%rdx, 72(%rsp)
	js	.L68
	cmpl	44(%rbx), %r15d
	jl	.L69
.L68:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
	movq	(%rbx), %rax
.L69:
	movq	24(%rsp), %rdi
	leaq	(%rdi,%r13), %r14
	movq	(%rax,%r14), %rdx
	movq	%rdx, 80(%rsp)
	movq	8(%rax,%r14), %rdx
	movq	%rdx, 88(%rsp)
	movq	16(%rax,%r14), %rdx
	movq	%rdx, 96(%rsp)
	movq	24(%rax,%r14), %rdx
	movq	%rdx, 104(%rsp)
#APP
# 32 "IncludeL3/sort.h" 1
	# FOAV bitonic_compare_enter1 e1 (48(%rsp))
	# FOAV bitonic_compare_enter1 e2 (80(%rsp))
# 0 "" 2
# 33 "IncludeL3/sort.h" 1
	# FOAV bitonic_compare_enter2 i (%ebp)
	# FOAV bitonic_compare_enter2 j (%r15d)
# 0 "" 2
# 34 "IncludeL3/sort.h" 1
	# FOAV bitonic_compare_enter3 ascend (%r12b)
# 0 "" 2
#NO_APP
	movl	108(%rsp), %edi
	cmpl	%edi, 76(%rsp)
	movl	56(%rsp), %ecx
	movl	88(%rsp), %esi
	setl	%dil
	xorl	%edx, %edx
	cmpl	%esi, %ecx
	sete	%dl
	movzbl	%dil, %edi
	imull	%edi, %edx
	xorl	%edi, %edi
	cmpl	%esi, %ecx
	setne	%dil
	cmpl	%esi, %ecx
	setl	%cl
	movzbl	%cl, %ecx
	imull	%edi, %ecx
	addl	%ecx, %edx
	movq	(%rsp), %rdx
	sete	%r10b
	cmpb	%r10b, %r12b
	cmovne	8(%rsp), %rdx
	testl	%ebp, %ebp
	movq	(%rdx), %rcx
	movq	%rcx, 112(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 120(%rsp)
	movq	16(%rdx), %rcx
	movq	24(%rdx), %rdx
	movq	%rcx, 128(%rsp)
	movq	%rdx, 136(%rsp)
	js	.L71
	cmpl	%ebp, 44(%rbx)
	jg	.L72
.L71:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE6write2EiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$73, %esi
	movb	%r10b, 19(%rsp)
	call	__assert@PLT
	movzbl	19(%rsp), %r10d
	movq	(%rbx), %rax
.L72:
#APP
# 83 "IncludeL3/trace_mem.h" 1
	# FOAV write_before i (%ebp)
# 0 "" 2
#NO_APP
	leaq	(%rax,%r13), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, 144(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 152(%rsp)
	movq	16(%rdx), %rcx
	movq	%rcx, 160(%rsp)
	movq	24(%rdx), %rcx
	movq	%rcx, 168(%rsp)
#APP
# 84 "IncludeL3/trace_mem.h" 1
	# FOAV write_before mem[i] (144(%rsp))
# 0 "" 2
# 85 "IncludeL3/trace_mem.h" 1
	# FOAV write_before elt (112(%rsp))
# 0 "" 2
#NO_APP
	movq	112(%rsp), %r11
	movq	120(%rsp), %rdi
	movq	128(%rsp), %rsi
	movq	136(%rsp), %rcx
	movq	%r11, (%rdx)
	movq	%rdi, 8(%rdx)
	movq	%rsi, 16(%rdx)
	movq	%rcx, 24(%rdx)
#APP
# 87 "IncludeL3/trace_mem.h" 1
	# FOAV write_after i (%ebp)
# 0 "" 2
#NO_APP
	movq	%r11, 144(%rsp)
	movq	%rdi, 152(%rsp)
	movq	%rsi, 160(%rsp)
	movq	%rcx, 168(%rsp)
#APP
# 88 "IncludeL3/trace_mem.h" 1
	# FOAV write_after mem[i] (144(%rsp))
# 0 "" 2
# 89 "IncludeL3/trace_mem.h" 1
	# FOAV write_after elt (112(%rsp))
# 0 "" 2
#NO_APP
	cmpb	%r10b, %r12b
	movq	(%rsp), %rdx
	cmove	8(%rsp), %rdx
	testl	%r15d, %r15d
	movq	(%rdx), %rcx
	movq	%rcx, 176(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 184(%rsp)
	movq	16(%rdx), %rcx
	movq	24(%rdx), %rdx
	movq	%rcx, 192(%rsp)
	movq	%rdx, 200(%rsp)
	js	.L74
	cmpl	44(%rbx), %r15d
	jl	.L75
.L74:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE6write2EiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$73, %esi
	call	__assert@PLT
	movq	(%rbx), %rax
	movq	192(%rsp), %rcx
.L75:
#APP
# 83 "IncludeL3/trace_mem.h" 1
	# FOAV write_before i (%r15d)
# 0 "" 2
#NO_APP
	addq	%r14, %rax
	movq	(%rax), %rdx
	movq	%rdx, 208(%rsp)
	movq	8(%rax), %rdx
	movq	%rdx, 216(%rsp)
	movq	16(%rax), %rdx
	movq	%rdx, 224(%rsp)
	movq	24(%rax), %rdx
	movq	%rdx, 232(%rsp)
#APP
# 84 "IncludeL3/trace_mem.h" 1
	# FOAV write_before mem[i] (208(%rsp))
# 0 "" 2
# 85 "IncludeL3/trace_mem.h" 1
	# FOAV write_before elt (176(%rsp))
# 0 "" 2
#NO_APP
	movq	176(%rsp), %rdi
	movq	184(%rsp), %rsi
	movq	200(%rsp), %rdx
	movq	%rcx, 16(%rax)
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rdx, 24(%rax)
#APP
# 87 "IncludeL3/trace_mem.h" 1
	# FOAV write_after i (%r15d)
# 0 "" 2
#NO_APP
	movq	%rdi, 208(%rsp)
	movq	%rsi, 216(%rsp)
	movq	%rcx, 224(%rsp)
	movq	%rdx, 232(%rsp)
#APP
# 88 "IncludeL3/trace_mem.h" 1
	# FOAV write_after mem[i] (208(%rsp))
# 0 "" 2
# 89 "IncludeL3/trace_mem.h" 1
	# FOAV write_after elt (176(%rsp))
# 0 "" 2
#NO_APP
	addl	$1, %ebp
	addl	$1, %r15d
	addq	$32, %r13
	cmpl	%ebp, 20(%rsp)
	jne	.L77
	movl	32(%rsp), %eax
	movq	%rbx, %r13
.L76:
	addl	$1, %eax
	cmpl	%eax, 36(%rsp)
	jle	.L64
	movzbl	44(%rsp), %esi
	movl	36(%rsp), %ecx
	movq	%r13, %rdi
	movl	32(%rsp), %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L64:
	movl	36(%rsp), %eax
	addl	$1, %eax
	cmpl	%eax, 40(%rsp)
	jle	.L60
	movq	248(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L87
	movzbl	44(%rsp), %esi
	movl	40(%rsp), %ecx
	movq	%r13, %rdi
	movl	36(%rsp), %edx
	addq	$264, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	.p2align 4,,10
	.p2align 3
.L60:
	.cfi_restore_state
	movq	248(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L87
	addq	$264, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L88:
	.cfi_restore_state
	movl	32(%rsp), %ebx
	addl	%ebx, %eax
	movl	%eax, 36(%rsp)
	movl	%ebx, %eax
	jmp	.L76
.L81:
	xorl	%eax, %eax
	jmp	.L61
.L87:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE2104:
	.size	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13, .-_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	.section	.text.unlikely._Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.LCOLDE4:
	.section	.text._Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.LHOTE4:
	.section	.text.unlikely._Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12,"ax",@progbits
.LCOLDB5:
	.section	.text._Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.type	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12, @function
_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12:
.LFB2103:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	subl	%edx, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r12
	movl	%esi, %ebp
	subq	$264, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rdi
	movq	%rdi, 248(%rsp)
	xorl	%edi, %edi
	cmpl	$1, %eax
	movl	%esi, 44(%rsp)
	movl	%edx, 32(%rsp)
	movl	%ecx, 40(%rsp)
	jle	.L110
	movl	%eax, %edx
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L91:
	addl	%eax, %eax
	cmpl	%eax, %edx
	jg	.L91
	sarl	%eax
.L90:
	movl	40(%rsp), %ebx
	subl	%eax, %ebx
	cmpl	%ebx, 32(%rsp)
	movl	%ebx, 20(%rsp)
	jge	.L117
	movslq	32(%rsp), %r8
	leal	(%r8,%rax), %edi
	cltq
	movq	%r8, %rbx
	salq	$5, %rax
	salq	$5, %r8
	movl	%ebx, %r14d
	movq	%rax, 24(%rsp)
	leaq	80(%rsp), %rax
	movq	%r12, %rbx
	movl	%edi, 36(%rsp)
	movl	%edi, %r15d
	movq	%r8, %r12
	movq	%rax, (%rsp)
	leaq	48(%rsp), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L106:
	testl	%r14d, %r14d
	js	.L95
	cmpl	%r14d, 44(%rbx)
	jg	.L96
.L95:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
.L96:
	movq	(%rbx), %rax
	testl	%r15d, %r15d
	movq	(%rax,%r12), %rdx
	movq	%rdx, 48(%rsp)
	movq	8(%rax,%r12), %rdx
	movq	%rdx, 56(%rsp)
	movq	16(%rax,%r12), %rdx
	movq	%rdx, 64(%rsp)
	movq	24(%rax,%r12), %rdx
	movq	%rdx, 72(%rsp)
	js	.L97
	cmpl	44(%rbx), %r15d
	jl	.L98
.L97:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
	movq	(%rbx), %rax
.L98:
	movq	24(%rsp), %rsi
	leaq	(%rsi,%r12), %r13
	movq	(%rax,%r13), %rdx
	movq	%rdx, 80(%rsp)
	movq	8(%rax,%r13), %rdx
	movq	%rdx, 88(%rsp)
	movq	16(%rax,%r13), %rdx
	movq	%rdx, 96(%rsp)
	movq	24(%rax,%r13), %rdx
	movq	%rdx, 104(%rsp)
#APP
# 32 "IncludeL3/sort.h" 1
	# FOAV bitonic_compare_enter1 e1 (48(%rsp))
	# FOAV bitonic_compare_enter1 e2 (80(%rsp))
# 0 "" 2
# 33 "IncludeL3/sort.h" 1
	# FOAV bitonic_compare_enter2 i (%r14d)
	# FOAV bitonic_compare_enter2 j (%r15d)
# 0 "" 2
# 34 "IncludeL3/sort.h" 1
	# FOAV bitonic_compare_enter3 ascend (%bpl)
# 0 "" 2
#NO_APP
	xorl	%r11d, %r11d
	movl	92(%rsp), %esi
	cmpl	%esi, 60(%rsp)
	movl	56(%rsp), %r10d
	movl	88(%rsp), %edi
	movl	52(%rsp), %ecx
	movl	84(%rsp), %edx
	setl	%r11b
	xorl	%esi, %esi
	cmpl	%edi, %r10d
	sete	%sil
	imull	%r11d, %esi
	xorl	%r11d, %r11d
	cmpl	%edi, %r10d
	setne	%r11b
	cmpl	%edi, %r10d
	setl	%dil
	movzbl	%dil, %edi
	imull	%edi, %r11d
	xorl	%edi, %edi
	addl	%r11d, %esi
	cmpl	%edx, %ecx
	sete	%dil
	imull	%edi, %esi
	xorl	%edi, %edi
	cmpl	%edx, %ecx
	setne	%dil
	cmpl	%edx, %ecx
	setl	%dl
	movzbl	%dl, %edx
	imull	%edi, %edx
	addl	%edx, %esi
	movq	(%rsp), %rdx
	sete	%r10b
	cmpb	%r10b, %bpl
	cmovne	8(%rsp), %rdx
	testl	%r14d, %r14d
	movq	(%rdx), %rcx
	movq	%rcx, 112(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 120(%rsp)
	movq	16(%rdx), %rcx
	movq	24(%rdx), %rdx
	movq	%rcx, 128(%rsp)
	movq	%rdx, 136(%rsp)
	js	.L100
	cmpl	%r14d, 44(%rbx)
	jg	.L101
.L100:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE6write2EiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$73, %esi
	movb	%r10b, 19(%rsp)
	call	__assert@PLT
	movzbl	19(%rsp), %r10d
	movq	(%rbx), %rax
.L101:
#APP
# 83 "IncludeL3/trace_mem.h" 1
	# FOAV write_before i (%r14d)
# 0 "" 2
#NO_APP
	leaq	(%rax,%r12), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, 144(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 152(%rsp)
	movq	16(%rdx), %rcx
	movq	%rcx, 160(%rsp)
	movq	24(%rdx), %rcx
	movq	%rcx, 168(%rsp)
#APP
# 84 "IncludeL3/trace_mem.h" 1
	# FOAV write_before mem[i] (144(%rsp))
# 0 "" 2
# 85 "IncludeL3/trace_mem.h" 1
	# FOAV write_before elt (112(%rsp))
# 0 "" 2
#NO_APP
	movq	112(%rsp), %r11
	movq	120(%rsp), %rdi
	movq	128(%rsp), %rsi
	movq	136(%rsp), %rcx
	movq	%r11, (%rdx)
	movq	%rdi, 8(%rdx)
	movq	%rsi, 16(%rdx)
	movq	%rcx, 24(%rdx)
#APP
# 87 "IncludeL3/trace_mem.h" 1
	# FOAV write_after i (%r14d)
# 0 "" 2
#NO_APP
	movq	%r11, 144(%rsp)
	movq	%rdi, 152(%rsp)
	movq	%rsi, 160(%rsp)
	movq	%rcx, 168(%rsp)
#APP
# 88 "IncludeL3/trace_mem.h" 1
	# FOAV write_after mem[i] (144(%rsp))
# 0 "" 2
# 89 "IncludeL3/trace_mem.h" 1
	# FOAV write_after elt (112(%rsp))
# 0 "" 2
#NO_APP
	cmpb	%r10b, %bpl
	movq	(%rsp), %rdx
	cmove	8(%rsp), %rdx
	testl	%r15d, %r15d
	movq	(%rdx), %rcx
	movq	%rcx, 176(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 184(%rsp)
	movq	16(%rdx), %rcx
	movq	24(%rdx), %rdx
	movq	%rcx, 192(%rsp)
	movq	%rdx, 200(%rsp)
	js	.L103
	cmpl	44(%rbx), %r15d
	jl	.L104
.L103:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE6write2EiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$73, %esi
	call	__assert@PLT
	movq	(%rbx), %rax
	movq	192(%rsp), %rcx
.L104:
#APP
# 83 "IncludeL3/trace_mem.h" 1
	# FOAV write_before i (%r15d)
# 0 "" 2
#NO_APP
	addq	%r13, %rax
	movq	(%rax), %rdx
	movq	%rdx, 208(%rsp)
	movq	8(%rax), %rdx
	movq	%rdx, 216(%rsp)
	movq	16(%rax), %rdx
	movq	%rdx, 224(%rsp)
	movq	24(%rax), %rdx
	movq	%rdx, 232(%rsp)
#APP
# 84 "IncludeL3/trace_mem.h" 1
	# FOAV write_before mem[i] (208(%rsp))
# 0 "" 2
# 85 "IncludeL3/trace_mem.h" 1
	# FOAV write_before elt (176(%rsp))
# 0 "" 2
#NO_APP
	movq	176(%rsp), %rdi
	movq	184(%rsp), %rsi
	movq	200(%rsp), %rdx
	movq	%rcx, 16(%rax)
	movq	%rdi, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rdx, 24(%rax)
#APP
# 87 "IncludeL3/trace_mem.h" 1
	# FOAV write_after i (%r15d)
# 0 "" 2
#NO_APP
	movq	%rdi, 208(%rsp)
	movq	%rsi, 216(%rsp)
	movq	%rcx, 224(%rsp)
	movq	%rdx, 232(%rsp)
#APP
# 88 "IncludeL3/trace_mem.h" 1
	# FOAV write_after mem[i] (208(%rsp))
# 0 "" 2
# 89 "IncludeL3/trace_mem.h" 1
	# FOAV write_after elt (176(%rsp))
# 0 "" 2
#NO_APP
	addl	$1, %r14d
	addl	$1, %r15d
	addq	$32, %r12
	cmpl	%r14d, 20(%rsp)
	jne	.L106
	movl	32(%rsp), %eax
	movq	%rbx, %r12
.L105:
	addl	$1, %eax
	cmpl	%eax, 36(%rsp)
	jle	.L93
	movzbl	44(%rsp), %esi
	movl	36(%rsp), %ecx
	movq	%r12, %rdi
	movl	32(%rsp), %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L93:
	movl	36(%rsp), %eax
	addl	$1, %eax
	cmpl	%eax, 40(%rsp)
	jle	.L89
	movq	248(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L116
	movzbl	44(%rsp), %esi
	movl	40(%rsp), %ecx
	movq	%r12, %rdi
	movl	36(%rsp), %edx
	addq	$264, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	.p2align 4,,10
	.p2align 3
.L89:
	.cfi_restore_state
	movq	248(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L116
	addq	$264, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L117:
	.cfi_restore_state
	movl	32(%rsp), %ebx
	addl	%ebx, %eax
	movl	%eax, 36(%rsp)
	movl	%ebx, %eax
	jmp	.L105
.L110:
	xorl	%eax, %eax
	jmp	.L90
.L116:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE2103:
	.size	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12, .-_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	.section	.text.unlikely._Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.LCOLDE5:
	.section	.text._Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.LHOTE5:
	.section	.text.unlikely._Z17write_block_sizesiR5Table,"ax",@progbits
.LCOLDB6:
	.section	.text._Z17write_block_sizesiR5Table,"ax",@progbits
.LHOTB6:
	.p2align 4,,15
	.globl	_Z17write_block_sizesiR5Table
	.hidden	_Z17write_block_sizesiR5Table
	.type	_Z17write_block_sizesiR5Table, @function
_Z17write_block_sizesiR5Table:
.LFB1953:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	testl	%edi, %edi
	jle	.L119
	movl	%edi, %eax
	movl	$-2147483648, %r15d
	movq	%rsi, %rbx
	subl	$1, %eax
	movq	%rsi, 8(%rsp)
	movl	%edi, 60(%rsp)
	movl	%eax, 56(%rsp)
	addq	$1, %rax
	xorl	%ebp, %ebp
	movq	%rax, 48(%rsp)
	xorl	%r14d, %r14d
	movl	%r15d, %r8d
	.p2align 4,,10
	.p2align 3
.L124:
	testl	%ebp, %ebp
	movl	%ebp, %r12d
	js	.L120
	cmpl	%ebp, 44(%rbx)
	jg	.L121
.L120:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	movl	%r8d, (%rsp)
	call	__assert@PLT
	movl	(%rsp), %r8d
.L121:
	movq	(%rbx), %r10
	movq	%rbp, %r13
	leal	1(%r14), %r9d
	salq	$5, %r13
	leaq	(%r10,%r13), %rdx
	movl	(%rdx), %eax
	movl	12(%rdx), %edi
	movl	8(%rdx), %esi
	movl	20(%rdx), %ecx
	movl	%eax, 16(%rsp)
	movl	%edi, 24(%rsp)
	movl	4(%rdx), %eax
	movl	24(%rdx), %edi
	cmpl	%r8d, %esi
	movl	%ecx, 32(%rsp)
	movl	28(%rdx), %ecx
	sete	%r15b
	movl	%esi, 36(%rsp)
	testl	%eax, %eax
	movl	%edi, 28(%rsp)
	movl	%esi, %edi
	sete	%sil
	cmpl	%r8d, %edi
	movl	%eax, 40(%rsp)
	movl	%esi, %edi
	movl	%ecx, 20(%rsp)
	movl	%eax, %ecx
	setne	%al
	andl	%r15d, %esi
	andl	%eax, %edi
	movzbl	%sil, %r11d
	xorl	$1, %esi
	movzbl	%dil, %r8d
	xorl	$1, %edi
	cmpl	$1, %ecx
	sete	%cl
	movzbl	%sil, %esi
	movzbl	%dil, %edi
	andl	%ecx, %eax
	andl	%r15d, %ecx
	xorl	$1, %eax
	movzbl	%al, %eax
	imull	%eax, %r14d
	imull	%r11d, %r9d
	imull	16(%rdx), %r11d
	imull	%esi, %r14d
	addl	%r9d, %r14d
	movl	%ecx, %r9d
	movzbl	%cl, %ecx
	imull	%edi, %r14d
	xorl	$1, %r9d
	movzbl	%r9b, %r9d
	imull	16(%rdx), %r9d
	addl	%r8d, %r14d
	imull	%r14d, %ecx
	imull	16(%rdx), %r8d
	addl	%r9d, %ecx
	imull	%eax, %ecx
	imull	%esi, %ecx
	addl	%r11d, %ecx
	imull	%edi, %ecx
	testl	%r12d, %r12d
	leal	(%r8,%rcx), %eax
	movl	%eax, (%rsp)
	js	.L122
	cmpl	%r12d, 44(%rbx)
	jg	.L123
.L122:
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__(%rip), %rdx
	leaq	.LC0(%rip), %rcx
	leaq	.LC1(%rip), %rdi
	movl	$93, %esi
	call	__assert@PLT
	movq	(%rbx), %r10
	leaq	(%r10,%r13), %rdx
.L123:
	movd	36(%rsp), %xmm1
	addq	$1, %rbp
	cmpq	48(%rsp), %rbp
	movd	24(%rsp), %xmm2
	movl	36(%rsp), %r8d
	movd	16(%rsp), %xmm0
	movd	40(%rsp), %xmm3
	punpckldq	%xmm2, %xmm1
	movd	20(%rsp), %xmm4
	punpckldq	%xmm3, %xmm0
	movd	32(%rsp), %xmm5
	punpcklqdq	%xmm1, %xmm0
	movd	28(%rsp), %xmm1
	punpckldq	%xmm4, %xmm1
	movups	%xmm0, (%rdx)
	movd	(%rsp), %xmm0
	punpckldq	%xmm5, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 16(%rdx)
	jne	.L124
	movslq	56(%rsp), %rax
	movq	%r10, (%rsp)
	movl	$-2147483648, %r13d
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	movl	%eax, %r15d
	salq	$5, %rax
	movq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L125:
	movq	8(%rsp), %rax
	movl	44(%rax), %r14d
	cmpl	%r15d, %r14d
	jg	.L128
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
	movq	8(%rsp), %rax
	movl	44(%rax), %r14d
	movq	(%rax), %rax
	movq	%rax, (%rsp)
.L128:
	movq	(%rsp), %rax
	leaq	(%rax,%rbp), %rdx
	movl	(%rdx), %eax
	movl	12(%rdx), %esi
	movl	%eax, 28(%rsp)
	movl	4(%rdx), %eax
	movl	%esi, 16(%rsp)
	movl	24(%rdx), %esi
	movl	%eax, %r9d
	movl	%eax, 24(%rsp)
	movl	8(%rdx), %eax
	movl	%esi, 48(%rsp)
	movl	28(%rdx), %esi
	cmpl	%r13d, %eax
	movl	%eax, 20(%rsp)
	movl	%esi, 40(%rsp)
	movl	%eax, %esi
	sete	%al
	testl	%r9d, %r9d
	sete	%cl
	cmpl	%r13d, %esi
	leal	1(%rbx), %r13d
	setne	%dil
	movl	%ecx, %esi
	andl	%eax, %ecx
	andl	%edi, %esi
	movzbl	%cl, %r10d
	xorl	$1, %ecx
	xorl	$1, %esi
	cmpl	$1, %r9d
	movzbl	%cl, %ecx
	sete	%r8b
	movzbl	%sil, %esi
	andl	%r8d, %eax
	andl	%r8d, %edi
	movzbl	%al, %r11d
	xorl	$1, %eax
	movzbl	%dil, %r9d
	movzbl	%al, %eax
	xorl	$1, %edi
	movl	%eax, %r8d
	movzbl	%dil, %edi
	imull	%r11d, %r13d
	imull	%ebx, %r8d
	imull	16(%rdx), %r11d
	addl	%r13d, %r8d
	imull	%edi, %r8d
	imull	%r12d, %eax
	addl	%r9d, %r8d
	imull	16(%rdx), %r9d
	addl	%eax, %r11d
	movl	%r10d, %eax
	imull	%edi, %r11d
	movl	20(%rdx), %edi
	imull	%ecx, %r8d
	addl	%r9d, %r11d
	imull	%r10d, %ebx
	imull	%ecx, %r11d
	addl	%r8d, %ebx
	imull	%r10d, %r12d
	imull	%esi, %ebx
	addl	%r11d, %r12d
	imull	%esi, %r12d
	imull	%ecx, %edi
	imull	16(%rdx), %ecx
	imull	%ebx, %eax
	imull	%r12d, %r10d
	addl	%edi, %eax
	imull	%esi, %eax
	addl	%r10d, %ecx
	imull	%ecx, %esi
	cmpl	%r14d, %r15d
	movl	%eax, 32(%rsp)
	movl	%esi, 36(%rsp)
	jl	.L129
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__(%rip), %rdx
	leaq	.LC0(%rip), %rcx
	leaq	.LC1(%rip), %rdi
	movl	$93, %esi
	call	__assert@PLT
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	leaq	(%rax,%rbp), %rdx
	movq	%rax, (%rsp)
.L129:
	movd	20(%rsp), %xmm1
	subl	$1, %r15d
	subq	$32, %rbp
	movd	16(%rsp), %xmm6
	cmpl	$-1, %r15d
	movl	20(%rsp), %r13d
	movd	28(%rsp), %xmm0
	movd	24(%rsp), %xmm7
	punpckldq	%xmm6, %xmm1
	movd	40(%rsp), %xmm2
	punpckldq	%xmm7, %xmm0
	movd	32(%rsp), %xmm3
	punpcklqdq	%xmm1, %xmm0
	movd	48(%rsp), %xmm1
	punpckldq	%xmm2, %xmm1
	movups	%xmm0, (%rdx)
	movd	36(%rsp), %xmm0
	punpckldq	%xmm3, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 16(%rdx)
	jne	.L125
	movl	60(%rsp), %eax
	testl	%eax, %eax
	jle	.L119
	movl	56(%rsp), %eax
	movq	(%rsp), %r11
	xorl	%r12d, %r12d
	movq	8(%rsp), %r14
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	addq	$1, %rax
	movq	%rax, 48(%rsp)
	movl	$-2147483648, %eax
	.p2align 4,,10
	.p2align 3
.L135:
	testl	%r12d, %r12d
	movl	%r12d, %r15d
	js	.L131
	cmpl	%r12d, 44(%r14)
	jg	.L132
.L131:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	movl	%eax, (%rsp)
	call	__assert@PLT
	movq	(%r14), %r11
	movl	(%rsp), %eax
.L132:
	movq	%r12, %rdi
	salq	$5, %rdi
	leaq	(%r11,%rdi), %rcx
	movq	%rdi, 40(%rsp)
	movl	12(%rcx), %edi
	movl	(%rcx), %edx
	movl	4(%rcx), %esi
	movl	20(%rcx), %r8d
	movl	%edi, 24(%rsp)
	movl	16(%rcx), %edi
	movl	%edx, 16(%rsp)
	movl	8(%rcx), %edx
	movl	%esi, (%rsp)
	movl	%edi, %r9d
	movl	%edi, 28(%rsp)
	movl	24(%rcx), %edi
	cmpl	%edx, %eax
	movl	%edx, 20(%rsp)
	sete	%bpl
	testl	%esi, %esi
	movl	%edi, 32(%rsp)
	movl	28(%rcx), %edi
	movl	%edi, 36(%rsp)
	sete	%dil
	cmpl	%edx, %eax
	setne	%dl
	movl	%edi, %r10d
	movl	%r9d, %eax
	andl	%edx, %r10d
	andl	%ebp, %edi
	movzbl	%r10b, %r10d
	imull	%r8d, %eax
	movl	%r10d, %esi
	movl	%r10d, %r9d
	xorl	$1, %esi
	movzbl	%sil, %esi
	addl	%ebx, %eax
	imull	%r10d, %eax
	imull	%r8d, %r9d
	imull	%esi, %ebx
	movl	%r9d, 8(%rsp)
	movzbl	%dil, %r9d
	xorl	$1, %edi
	movzbl	%dil, %edi
	addl	%eax, %ebx
	cmpl	$1, (%rsp)
	sete	%al
	andl	%eax, %edx
	andl	%ebp, %eax
	movl	%eax, %ebp
	movzbl	%al, %eax
	xorl	$1, %edx
	xorl	$1, %ebp
	movzbl	%dl, %edx
	movzbl	%bpl, %ebp
	imull	%r8d, %ebp
	imull	%r13d, %eax
	addl	%eax, %ebp
	imull	%edx, %ebp
	imull	%r9d, %r8d
	imull	%edi, %ebp
	imull	%r13d, %edx
	addl	%r8d, %ebp
	imull	%esi, %ebp
	addl	8(%rsp), %ebp
	imull	%edi, %edx
	imull	%ebp, %r9d
	imull	%ebp, %r10d
	leal	(%rdx,%r9), %r13d
	imull	%r13d, %esi
	testl	%r15d, %r15d
	leal	(%r10,%rsi), %r13d
	js	.L133
	cmpl	%r15d, 44(%r14)
	jg	.L134
.L133:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$93, %esi
	call	__assert@PLT
	movq	(%r14), %r11
	movq	40(%rsp), %rcx
	addq	%r11, %rcx
.L134:
	movl	20(%rsp), %eax
	movd	(%rsp), %xmm5
	addq	$1, %r12
	movd	24(%rsp), %xmm4
	movl	%ebp, (%rsp)
	movd	16(%rsp), %xmm0
	cmpq	%r12, 48(%rsp)
	movl	%eax, 8(%rsp)
	movd	36(%rsp), %xmm6
	movd	8(%rsp), %xmm1
	punpckldq	%xmm5, %xmm0
	movd	(%rsp), %xmm7
	punpckldq	%xmm4, %xmm1
	punpcklqdq	%xmm1, %xmm0
	movd	32(%rsp), %xmm1
	punpckldq	%xmm6, %xmm1
	movups	%xmm0, (%rcx)
	movd	28(%rsp), %xmm0
	punpckldq	%xmm7, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 16(%rcx)
	jne	.L135
.L127:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L119:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L127
	.cfi_endproc
.LFE1953:
	.size	_Z17write_block_sizesiR5Table, .-_Z17write_block_sizesiR5Table
	.section	.text.unlikely._Z17write_block_sizesiR5Table
.LCOLDE6:
	.section	.text._Z17write_block_sizesiR5Table
.LHOTE6:
	.section	.text.unlikely._Z7reversePc,"ax",@progbits
.LCOLDB7:
	.section	.text._Z7reversePc,"ax",@progbits
.LHOTB7:
	.p2align 4,,15
	.globl	_Z7reversePc
	.hidden	_Z7reversePc
	.type	_Z7reversePc, @function
_Z7reversePc:
.LFB1956:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	strlen@PLT
	movl	%eax, %r8d
	subl	$1, %eax
	testl	%eax, %eax
	jle	.L143
	cltq
	movq	%rbx, %rdi
	xorl	%edx, %edx
	addq	%rbx, %rax
	.p2align 4,,10
	.p2align 3
.L146:
	movzbl	(%rdi), %ecx
	movzbl	(%rax), %esi
	addl	$1, %edx
	addq	$1, %rdi
	subq	$1, %rax
	movb	%sil, -1(%rdi)
	movb	%cl, 1(%rax)
	movl	%edx, %ecx
	notl	%ecx
	addl	%r8d, %ecx
	cmpl	%ecx, %edx
	jl	.L146
.L143:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1956:
	.size	_Z7reversePc, .-_Z7reversePc
	.section	.text.unlikely._Z7reversePc
.LCOLDE7:
	.section	.text._Z7reversePc
.LHOTE7:
	.section	.text.unlikely._Z4itoaiPcPi,"ax",@progbits
.LCOLDB8:
	.section	.text._Z4itoaiPcPi,"ax",@progbits
.LHOTB8:
	.p2align 4,,15
	.globl	_Z4itoaiPcPi
	.hidden	_Z4itoaiPcPi
	.type	_Z4itoaiPcPi, @function
_Z4itoaiPcPi:
.LFB1957:
	.cfi_startproc
	movl	%edi, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sarl	$31, %eax
	movq	%rsi, %rbp
	xorl	%r10d, %r10d
	movl	%eax, %ecx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdx, %rsi
	xorl	%edi, %ecx
	movq	%rbp, %rbx
	movq	%rbp, %r8
	subl	%eax, %ecx
	movl	$1717986919, %r11d
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L154:
	movl	%r9d, %r10d
.L149:
	movl	%ecx, %eax
	addq	$1, %r8
	leal	1(%r10), %r9d
	imull	%r11d
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	addl	$48, %ecx
	movb	%cl, -1(%r8)
	testl	%edx, %edx
	movl	%edx, %ecx
	jne	.L154
	testl	%edi, %edi
	jns	.L150
	movslq	%r9d, %r9
	movb	$45, 0(%rbp,%r9)
	leal	2(%r10), %r9d
.L150:
	movslq	%r9d, %rax
	movq	%rbp, %rdi
	movb	$0, 0(%rbp,%rax)
	movl	%r9d, (%rsi)
	call	strlen@PLT
	movl	%eax, %edi
	subl	$1, %eax
	xorl	%edx, %edx
	movslq	%eax, %rsi
	addq	%rsi, %rbp
	testl	%eax, %eax
	jle	.L148
	.p2align 4,,10
	.p2align 3
.L155:
	movzbl	(%rbx), %eax
	movzbl	0(%rbp), %ecx
	addl	$1, %edx
	addq	$1, %rbx
	subq	$1, %rbp
	movb	%cl, -1(%rbx)
	movb	%al, 1(%rbp)
	movl	%edx, %eax
	notl	%eax
	addl	%edi, %eax
	cmpl	%edx, %eax
	jg	.L155
.L148:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1957:
	.size	_Z4itoaiPcPi, .-_Z4itoaiPcPi
	.section	.text.unlikely._Z4itoaiPcPi
.LCOLDE8:
	.section	.text._Z4itoaiPcPi
.LHOTE8:
	.section	.text.unlikely._Z9strm_hashjj,"ax",@progbits
.LCOLDB9:
	.section	.text._Z9strm_hashjj,"ax",@progbits
.LHOTB9:
	.p2align 4,,15
	.globl	_Z9strm_hashjj
	.hidden	_Z9strm_hashjj
	.type	_Z9strm_hashjj, @function
_Z9strm_hashjj:
.LFB1958:
	.cfi_startproc
	imull	$-862048943, %edi, %edi
	roll	$15, %edi
	imull	$461845907, %edi, %edi
	xorl	%esi, %edi
	roll	$13, %edi
	leal	-430675100(%rdi,%rdi,4), %eax
	xorl	$4, %eax
	movl	%eax, %edx
	shrl	$16, %edx
	xorl	%edx, %eax
	imull	$-2048144789, %eax, %eax
	movl	%eax, %edx
	shrl	$13, %edx
	xorl	%edx, %eax
	imull	$-1028477387, %eax, %eax
	movl	%eax, %edx
	shrl	$16, %edx
	xorl	%edx, %eax
	ret
	.cfi_endproc
.LFE1958:
	.size	_Z9strm_hashjj, .-_Z9strm_hashjj
	.section	.text.unlikely._Z9strm_hashjj
.LCOLDE9:
	.section	.text._Z9strm_hashjj
.LHOTE9:
	.section	.text.unlikely._Z8toStringPc5TableS0_,"ax",@progbits
.LCOLDB10:
	.section	.text._Z8toStringPc5TableS0_,"ax",@progbits
.LHOTB10:
	.p2align 4,,15
	.globl	_Z8toStringPc5TableS0_
	.hidden	_Z8toStringPc5TableS0_
	.type	_Z8toStringPc5TableS0_, @function
_Z8toStringPc5TableS0_:
.LFB1966:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movl	44(%rsi), %eax
	movq	%fs:40, %rbx
	movq	%rbx, 72(%rsp)
	xorl	%ebx, %ebx
	movq	%rdi, (%rsp)
	movq	%rsi, 16(%rsp)
	testl	%eax, %eax
	movl	%eax, 28(%rsp)
	jle	.L159
	xorl	%r12d, %r12d
	leaq	32(%rsp), %rbp
	leaq	48(%rsp), %rbx
	movq	%rdx, %r13
	movl	$1717986919, %r15d
	movq	%r12, %r14
	.p2align 4,,10
	.p2align 3
.L175:
	movq	16(%rsp), %rax
	movl	%r14d, %r9d
	cmpl	%r14d, 44(%rax)
	jg	.L195
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	leaq	.LC0(%rip), %rcx
	movl	$60, %esi
	movl	%r14d, 8(%rsp)
	call	__assert@PLT
	movq	16(%rsp), %rdi
	movq	%r14, %rax
	movl	8(%rsp), %r9d
	salq	$5, %rax
	movq	(%rdi), %rdx
	movl	12(%rdx,%rax), %r12d
.L178:
	cmpl	%r9d, 44(%r13)
	jg	.L162
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	movq	%rax, 8(%rsp)
	call	__assert@PLT
	movq	8(%rsp), %rax
.L162:
	movq	0(%r13), %rdx
	movq	%rbp, %rsi
	movq	%rbp, %rdi
	xorl	%r11d, %r11d
	movl	12(%rdx,%rax), %r10d
	movl	%r12d, %eax
	sarl	$31, %eax
	movl	%eax, %ecx
	xorl	%r12d, %ecx
	subl	%eax, %ecx
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L180:
	movl	%r9d, %r11d
.L163:
	movl	%ecx, %eax
	addq	$1, %rdi
	leal	1(%r11), %r9d
	imull	%r15d
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	addl	$48, %ecx
	movb	%cl, -1(%rdi)
	testl	%edx, %edx
	movl	%edx, %ecx
	jne	.L180
	testl	%r12d, %r12d
	jns	.L164
	movslq	%r9d, %r9
	movb	$45, 32(%rsp,%r9)
	leal	2(%r11), %r9d
.L164:
	movslq	%r9d, %r9
	movq	%rbp, %rax
	movb	$0, 32(%rsp,%r9)
.L165:
	movl	(%rax), %ecx
	addq	$4, %rax
	leal	-16843009(%rcx), %edx
	notl	%ecx
	andl	%ecx, %edx
	andl	$-2139062144, %edx
	je	.L165
	movl	%edx, %ecx
	shrl	$16, %ecx
	testl	$32896, %edx
	cmove	%ecx, %edx
	leaq	2(%rax), %rcx
	movl	%edx, %edi
	cmove	%rcx, %rax
	addb	%dl, %dil
	sbbq	$3, %rax
	xorl	%edx, %edx
	subq	%rbp, %rax
	leal	-1(%rax), %ecx
	movl	%eax, %edi
	movslq	%ecx, %rax
	addq	%rbp, %rax
	testl	%ecx, %ecx
	jle	.L169
	.p2align 4,,10
	.p2align 3
.L184:
	movzbl	(%rsi), %ecx
	movzbl	(%rax), %r8d
	addl	$1, %edx
	addq	$1, %rsi
	subq	$1, %rax
	movb	%r8b, -1(%rsi)
	movb	%cl, 1(%rax)
	movl	%edx, %ecx
	notl	%ecx
	addl	%edi, %ecx
	cmpl	%ecx, %edx
	jl	.L184
.L169:
	movl	%r10d, %eax
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	sarl	$31, %eax
	xorl	%r11d, %r11d
	movl	%eax, %ecx
	xorl	%r10d, %ecx
	subl	%eax, %ecx
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L181:
	movl	%r12d, %r11d
.L168:
	movl	%ecx, %eax
	addq	$1, %rdi
	leal	1(%r11), %r12d
	imull	%r15d
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	addl	$48, %ecx
	movb	%cl, -1(%rdi)
	testl	%edx, %edx
	movl	%edx, %ecx
	jne	.L181
	testl	%r10d, %r10d
	jns	.L171
	movslq	%r12d, %r12
	movb	$45, 48(%rsp,%r12)
	leal	2(%r11), %r12d
.L171:
	movslq	%r12d, %r12
	movq	%rbx, %rax
	movb	$0, 48(%rsp,%r12)
.L172:
	movl	(%rax), %ecx
	addq	$4, %rax
	leal	-16843009(%rcx), %edx
	notl	%ecx
	andl	%ecx, %edx
	andl	$-2139062144, %edx
	je	.L172
	movl	%edx, %ecx
	shrl	$16, %ecx
	testl	$32896, %edx
	cmove	%ecx, %edx
	leaq	2(%rax), %rcx
	movl	%edx, %edi
	cmove	%rcx, %rax
	addb	%dl, %dil
	sbbq	$3, %rax
	xorl	%edx, %edx
	subq	%rbx, %rax
	leal	-1(%rax), %ecx
	movl	%eax, %edi
	movslq	%ecx, %rax
	addq	%rbx, %rax
	testl	%ecx, %ecx
	jle	.L176
	.p2align 4,,10
	.p2align 3
.L185:
	movzbl	(%rsi), %ecx
	movzbl	(%rax), %r8d
	addl	$1, %edx
	addq	$1, %rsi
	subq	$1, %rax
	movb	%r8b, -1(%rsi)
	movb	%cl, 1(%rax)
	movl	%edx, %ecx
	notl	%ecx
	addl	%edi, %ecx
	cmpl	%ecx, %edx
	jl	.L185
.L176:
	movq	(%rsp), %rdi
	movq	%r9, %rdx
	movq	%rbp, %rsi
	movq	%r9, 8(%rsp)
	addq	$1, %r14
	call	strncpy@PLT
	movq	8(%rsp), %r9
	addq	(%rsp), %r9
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movb	$32, (%r9)
	addq	$1, %r9
	movq	%r9, %rdi
	movq	%r9, (%rsp)
	call	strncpy@PLT
	movq	(%rsp), %r9
	addq	%r12, %r9
	cmpl	%r14d, 28(%rsp)
	leaq	1(%r9), %rax
	movb	$10, (%r9)
	movq	%rax, (%rsp)
	jg	.L175
.L159:
	movq	(%rsp), %rax
	movb	$0, (%rax)
	movq	72(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L196
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L195:
	.cfi_restore_state
	movq	%rax, %rdi
	movq	%r14, %rax
	movq	(%rdi), %rdx
	salq	$5, %rax
	movl	12(%rdx,%rax), %r12d
	jmp	.L178
.L196:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1966:
	.size	_Z8toStringPc5TableS0_, .-_Z8toStringPc5TableS0_
	.section	.text.unlikely._Z8toStringPc5TableS0_
.LCOLDE10:
	.section	.text._Z8toStringPc5TableS0_
.LHOTE10:
	.section	.text.unlikely.printf,"ax",@progbits
.LCOLDB11:
	.section	.text.printf,"ax",@progbits
.LHOTB11:
	.p2align 4,,15
	.globl	printf
	.type	printf, @function
printf:
.LFB1967:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %r10
	subq	$8416, %rsp
	.cfi_def_cfa_offset 8432
	testb	%al, %al
	movq	%rsi, 8248(%rsp)
	movq	%rdx, 8256(%rsp)
	movq	%rcx, 8264(%rsp)
	movq	%r8, 8272(%rsp)
	movq	%r9, 8280(%rsp)
	je	.L198
	movaps	%xmm0, 8288(%rsp)
	movaps	%xmm1, 8304(%rsp)
	movaps	%xmm2, 8320(%rsp)
	movaps	%xmm3, 8336(%rsp)
	movaps	%xmm4, 8352(%rsp)
	movaps	%xmm5, 8368(%rsp)
	movaps	%xmm6, 8384(%rsp)
	movaps	%xmm7, 8400(%rsp)
.L198:
	movq	%fs:40, %rax
	movq	%rax, 8232(%rsp)
	xorl	%eax, %eax
	leaq	32(%rsp), %rdi
	movl	$1024, %ecx
	leaq	32(%rsp), %rbx
	movq	%r10, %rdx
	movl	$8192, %esi
	rep stosq
	leaq	8432(%rsp), %rax
	leaq	8(%rsp), %rcx
	movq	%rbx, %rdi
	movl	$8, 8(%rsp)
	movl	$48, 12(%rsp)
	movq	%rax, 16(%rsp)
	leaq	8240(%rsp), %rax
	movq	%rax, 24(%rsp)
	call	vsnprintf@PLT
	movq	%rbx, %rdi
	call	ocall_print_string@PLT
	movq	8232(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L201
	addq	$8416, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L201:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1967:
	.size	printf, .-printf
	.section	.text.unlikely.printf
.LCOLDE11:
	.section	.text.printf
.LHOTE11:
	.section	.rodata.str1.1
.LC12:
	.string	" "
.LC13:
	.string	"\n"
.LC14:
	.string	"\n\nTable length: %d\n\n"
	.section	.text.unlikely._Z11parseTablesPcRiS0_,"ax",@progbits
.LCOLDB15:
	.section	.text._Z11parseTablesPcRiS0_,"ax",@progbits
.LHOTB15:
	.p2align 4,,15
	.globl	_Z11parseTablesPcRiS0_
	.hidden	_Z11parseTablesPcRiS0_
	.type	_Z11parseTablesPcRiS0_, @function
_Z11parseTablesPcRiS0_:
.LFB1959:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1959
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rdi
	leaq	.LC12(%rip), %rsi
	movq	%rdx, %r13
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	call	strtok@PLT
	movq	%rax, %rdi
	call	atoi@PLT
	leaq	.LC13(%rip), %rsi
	xorl	%edi, %edi
	movl	%eax, 0(%r13)
	call	strtok@PLT
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, (%r15)
	addl	0(%r13), %eax
	movl	$32, %esi
	movl	_ZN8TraceMemIN5Table10TableEntryEE5countE(%rip), %edx
	movq	$0, 8(%r12)
	movq	$0, 16(%r12)
	movq	$0, 24(%r12)
	movq	$0, 32(%r12)
	leal	1(%rdx), %ecx
	movslq	%eax, %rdi
	movl	%edx, 40(%r12)
	movl	%eax, 44(%r12)
	movl	%ecx, _ZN8TraceMemIN5Table10TableEntryEE5countE(%rip)
	call	calloc@PLT
	movl	0(%r13), %esi
	leaq	.LC14(%rip), %rdi
	movq	%rax, (%r12)
	xorl	%eax, %eax
.LEHB0:
	call	printf
	movl	(%r15), %eax
	addl	0(%r13), %eax
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jg	.L219
	jmp	.L202
	.p2align 4,,10
	.p2align 3
.L204:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
	movq	%rbp, %rax
	addq	(%r12), %rax
	movl	20(%rax), %esi
	movl	16(%rax), %edx
	movl	24(%rax), %edi
	movl	%esi, 16(%rsp)
	xorl	%esi, %esi
	cmpl	%ebx, 0(%r13)
	movl	%edx, 20(%rsp)
	movl	28(%rax), %edx
	movl	%edi, 24(%rsp)
	setle	%sil
	testl	%ebx, %ebx
	movl	%edx, 28(%rsp)
	movl	%esi, 12(%rsp)
	js	.L206
	cmpl	%ebx, 44(%r12)
	jg	.L214
.L206:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$93, %esi
	call	__assert@PLT
.LEHE0:
	movq	%rbp, %rax
	addq	(%r12), %rax
	movl	12(%rsp), %ecx
	movl	24(%rsp), %esi
.L207:
	movl	%ecx, 4(%rax)
	movl	8(%rsp), %edx
	addl	$1, %ebx
	movl	20(%rsp), %ecx
	movl	$1, (%rax)
	addq	$32, %rbp
	movl	%r14d, 12(%rax)
	movl	%esi, 24(%rax)
	movl	%edx, 8(%rax)
	movl	16(%rsp), %edx
	movl	%ecx, 16(%rax)
	movl	28(%rsp), %ecx
	movl	%edx, 20(%rax)
	movl	%ecx, 28(%rax)
	movl	(%r15), %eax
	addl	0(%r13), %eax
	cmpl	%ebx, %eax
	jle	.L202
.L219:
	leaq	.LC12(%rip), %rsi
	xorl	%edi, %edi
	call	strtok@PLT
	movq	%rax, %rdi
	call	atoi@PLT
	leaq	.LC13(%rip), %rsi
	xorl	%edi, %edi
	movl	%eax, 8(%rsp)
	call	strtok@PLT
	movq	%rax, %rdi
	call	atoi@PLT
	testl	%ebx, %ebx
	movl	%eax, %r14d
	js	.L204
	cmpl	%ebx, 44(%r12)
	jle	.L204
	movq	%rbp, %rax
	addq	(%r12), %rax
	xorl	%edx, %edx
	cmpl	%ebx, 0(%r13)
	movl	16(%rax), %edi
	movl	20(%rax), %ecx
	setle	%dl
	movl	%edx, 12(%rsp)
	movl	%edi, 20(%rsp)
	movl	%ecx, 16(%rsp)
	movl	24(%rax), %edi
	movl	28(%rax), %ecx
	movl	%edi, 24(%rsp)
	movl	%ecx, 28(%rsp)
	movl	%edi, %esi
	movl	%edx, %ecx
	jmp	.L207
	.p2align 4,,10
	.p2align 3
.L202:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L215:
	.cfi_restore_state
	movq	16(%r12), %rdi
	movq	%rax, %rbx
	testq	%rdi, %rdi
	je	.L211
	movq	24(%r12), %rax
	cmpq	%rax, %rdi
	je	.L213
	leaq	-8(%rax), %rdx
	subq	%rdi, %rdx
	notq	%rdx
	andq	$-8, %rdx
	addq	%rax, %rdx
	movq	%rdx, 24(%r12)
.L213:
	call	_ZdlPv@PLT
.L211:
	movq	%rbx, %rdi
.LEHB1:
	call	_Unwind_Resume@PLT
.LEHE1:
.L214:
	movl	%esi, %ecx
	movl	24(%rsp), %esi
	jmp	.L207
	.cfi_endproc
.LFE1959:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table._Z11parseTablesPcRiS0_,"a",@progbits
.LLSDA1959:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1959-.LLSDACSB1959
.LLSDACSB1959:
	.uleb128 .LEHB0-.LFB1959
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L215-.LFB1959
	.uleb128 0
	.uleb128 .LEHB1-.LFB1959
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE1959:
	.section	.text._Z11parseTablesPcRiS0_
	.size	_Z11parseTablesPcRiS0_, .-_Z11parseTablesPcRiS0_
	.section	.text.unlikely._Z11parseTablesPcRiS0_
.LCOLDE15:
	.section	.text._Z11parseTablesPcRiS0_
.LHOTE15:
	.section	.text.unlikely._Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii,comdat
.LCOLDB16:
	.section	.text._Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii,comdat
.LHOTB16:
	.p2align 4,,15
	.weak	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	.hidden	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	.type	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii, @function
_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii:
.LFB1991:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebp
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	cmpl	$-1, %ecx
	movq	%rdi, 8(%rsp)
	movl	%ecx, 20(%rsp)
	je	.L313
.L222:
	movl	20(%rsp), %edx
	subl	%ebp, %edx
	movl	%edx, %ebx
	shrl	$31, %ebx
	addl	%ebx, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %ebx
	cmpl	%ebx, %ebp
	je	.L221
	movl	%eax, %edi
	movl	%ebx, %r14d
	xorl	$1, %edi
	cmpl	$-1, %ebx
	movb	%dil, 32(%rsp)
	je	.L314
.L225:
	movl	%r14d, %edx
	subl	%ebp, %edx
	movl	%edx, %r12d
	shrl	$31, %r12d
	addl	%r12d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r12d
	cmpl	%r12d, %ebp
	je	.L315
	cmpl	$-1, %r12d
	movl	%r12d, %r8d
	je	.L316
.L228:
	movl	%r8d, %edx
	subl	%ebp, %edx
	movl	%edx, %r13d
	shrl	$31, %r13d
	addl	%r13d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r13d
	cmpl	%r13d, %ebp
	je	.L317
	cmpl	$-1, %r13d
	movl	%r13d, %r10d
	je	.L318
.L231:
	movl	%r10d, %edx
	subl	%ebp, %edx
	movl	%edx, %r15d
	shrl	$31, %r15d
	addl	%r15d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r15d
	cmpl	%r15d, %ebp
	je	.L319
	cmpl	$-1, %r15d
	movl	%r15d, %r11d
	je	.L320
.L234:
	movl	%r11d, %edx
	subl	%ebp, %edx
	movl	%edx, %r9d
	shrl	$31, %r9d
	addl	%r9d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r9d
	cmpl	%r9d, %ebp
	je	.L321
	movl	%eax, 24(%rsp)
	movzbl	32(%rsp), %eax
	movl	%r9d, %ecx
	movq	8(%rsp), %rdi
	movl	%ebp, %edx
	movl	%r10d, 48(%rsp)
	movl	%r8d, 44(%rsp)
	movl	%r11d, 40(%rsp)
	movl	%r9d, 28(%rsp)
	movl	%eax, %esi
	movl	%eax, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %eax
	movl	40(%rsp), %r11d
	movl	28(%rsp), %r9d
	movq	8(%rsp), %rdi
	movzbl	%al, %eax
	movl	%r11d, %ecx
	movl	%eax, %esi
	movl	%r9d, %edx
	movl	%eax, 24(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r11d
	leal	1(%rbp), %eax
	movl	44(%rsp), %r8d
	movl	48(%rsp), %r10d
	movl	%eax, 28(%rsp)
	cmpl	%eax, %r11d
	jle	.L236
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r11d, %ecx
	movl	%ebp, %edx
	movl	%r10d, 44(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	44(%rsp), %r10d
	movl	40(%rsp), %r8d
.L236:
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%r15d, %edx
	movl	%r8d, 44(%rsp)
	movl	%r10d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r10d
	cmpl	28(%rsp), %r10d
	movl	44(%rsp), %r8d
	jle	.L233
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%ebp, %edx
	movl	%r8d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	40(%rsp), %r8d
	jmp	.L233
	.p2align 4,,10
	.p2align 3
.L221:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L315:
	.cfi_restore_state
	leal	1(%rbp), %esi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	movl	%esi, 28(%rsp)
.L227:
	movl	20(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, %r12d
	je	.L322
.L253:
	movl	%r12d, %eax
	subl	%ebx, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%r14d, %eax
	sarl	%eax
	leal	(%rax,%rbx), %r14d
	cmpl	%r14d, %ebx
	je	.L255
	cmpl	$-1, %r14d
	movl	%r14d, %r13d
	je	.L323
.L256:
	movl	%r13d, %eax
	subl	%ebx, %eax
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%r15d, %eax
	sarl	%eax
	leal	(%rax,%rbx), %r15d
	cmpl	%r15d, %ebx
	je	.L324
	cmpl	$-1, %r15d
	movl	%r15d, %r9d
	je	.L325
.L259:
	movl	%r9d, %eax
	subl	%ebx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebx, %eax
	cmpl	%eax, %ebx
	je	.L326
	movzbl	32(%rsp), %edi
	movl	%eax, %ecx
	movl	%ebx, %edx
	movl	%r9d, 44(%rsp)
	movl	%eax, 36(%rsp)
	movl	%edi, %esi
	movl	%edi, 40(%rsp)
	movq	8(%rsp), %rdi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	44(%rsp), %r9d
	movl	36(%rsp), %eax
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	44(%rsp), %r9d
	leal	1(%rbx), %eax
	movl	%eax, 36(%rsp)
	cmpl	%eax, %r9d
	jle	.L261
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%ebx, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L261:
	cmpl	$-1, %r13d
	movl	%r13d, %r9d
	je	.L327
.L262:
	movl	%r9d, %eax
	movl	%r9d, 44(%rsp)
	subl	%r15d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r15d, %eax
	cmpl	%eax, %r15d
	je	.L264
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r15d, %edx
	movl	%eax, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	44(%rsp), %r9d
	movl	48(%rsp), %eax
	movl	40(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	44(%rsp), %r9d
	leal	1(%r15), %eax
	cmpl	%eax, %r9d
	jle	.L264
	movl	40(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r15d, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L264:
	cmpl	36(%rsp), %r13d
	jle	.L258
	movl	40(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%ebx, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L258:
	cmpl	$-1, %r12d
	movl	%r12d, %r11d
	je	.L328
.L266:
	movl	%r11d, %eax
	subl	%r14d, %eax
	movl	%eax, %r13d
	shrl	$31, %r13d
	addl	%r13d, %eax
	sarl	%eax
	leal	(%rax,%r14), %r13d
	cmpl	%r13d, %r14d
	je	.L268
	cmpl	$-1, %r13d
	movl	%r13d, %r8d
	je	.L329
.L269:
	movl	%r8d, %eax
	subl	%r14d, %eax
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%r15d, %eax
	sarl	%eax
	leal	(%rax,%r14), %r15d
	cmpl	%r15d, %r14d
	je	.L330
	cmpl	$-1, %r15d
	movl	%r15d, %r9d
	je	.L331
.L272:
	movl	%r9d, %eax
	subl	%r14d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r14d, %eax
	cmpl	%eax, %r14d
	je	.L332
	movzbl	32(%rsp), %edi
	movl	%eax, %ecx
	movl	%r14d, %edx
	movl	%r8d, 56(%rsp)
	movl	%r11d, 52(%rsp)
	movl	%r9d, 48(%rsp)
	movl	%eax, 40(%rsp)
	movl	%edi, %esi
	movl	%edi, 44(%rsp)
	movq	8(%rsp), %rdi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	movl	40(%rsp), %eax
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	leal	1(%r14), %eax
	movl	52(%rsp), %r11d
	movl	56(%rsp), %r8d
	movl	%eax, 40(%rsp)
	cmpl	%eax, %r9d
	jle	.L274
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r14d, %edx
	movl	%r8d, 52(%rsp)
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	52(%rsp), %r8d
	movl	48(%rsp), %r11d
.L274:
	cmpl	$-1, %r8d
	movl	%r8d, %r9d
	je	.L333
.L275:
	movl	%r9d, %eax
	movl	%r9d, 48(%rsp)
	subl	%r15d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r15d, %eax
	cmpl	%eax, %r15d
	je	.L277
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r15d, %edx
	movl	%r8d, 60(%rsp)
	movl	%r11d, 56(%rsp)
	movl	%eax, 52(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	movl	52(%rsp), %eax
	movl	44(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	leal	1(%r15), %eax
	movl	56(%rsp), %r11d
	movl	60(%rsp), %r8d
	cmpl	%eax, %r9d
	jle	.L277
	movl	44(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r15d, %edx
	movl	%r8d, 52(%rsp)
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	52(%rsp), %r8d
	movl	48(%rsp), %r11d
.L277:
	cmpl	%r8d, 40(%rsp)
	jge	.L271
	movl	44(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r14d, %edx
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	48(%rsp), %r11d
.L271:
	cmpl	$-1, %r11d
	movl	%r11d, %r10d
	je	.L334
.L279:
	movl	%r10d, %eax
	subl	%r13d, %eax
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%r15d, %eax
	sarl	%eax
	leal	(%rax,%r13), %r15d
	cmpl	%r15d, %r13d
	je	.L281
	cmpl	$-1, %r15d
	movl	%r15d, %r8d
	je	.L335
.L282:
	movl	%r8d, %eax
	subl	%r13d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r13d, %eax
	cmpl	%eax, %r13d
	je	.L336
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r13d, %edx
	movl	%r10d, 60(%rsp)
	movl	%r11d, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movl	%eax, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movzbl	32(%rsp), %r9d
	movl	48(%rsp), %r8d
	movl	44(%rsp), %eax
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r8d, 52(%rsp)
	movl	%eax, %edx
	movl	%r9d, %esi
	movl	%r9d, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	52(%rsp), %r8d
	leal	1(%r13), %eax
	movl	48(%rsp), %r9d
	movl	56(%rsp), %r11d
	movl	60(%rsp), %r10d
	movl	%eax, 44(%rsp)
	cmpl	%eax, %r8d
	jle	.L284
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r13d, %edx
	movl	%r9d, %esi
	movl	%r10d, 52(%rsp)
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	52(%rsp), %r10d
	movl	48(%rsp), %r11d
.L284:
	cmpl	$-1, %r10d
	movl	%r10d, %r8d
	je	.L337
.L285:
	movl	%r8d, %eax
	movl	%r8d, 48(%rsp)
	subl	%r15d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r15d, %eax
	cmpl	%eax, %r15d
	je	.L287
	movzbl	32(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r15d, %edx
	movl	%r10d, 60(%rsp)
	movl	%r11d, 56(%rsp)
	movl	%eax, 52(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r8d
	movl	52(%rsp), %eax
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%eax, %edx
	movl	%r8d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	32(%rsp), %r8d
	leal	1(%r15), %eax
	movl	56(%rsp), %r11d
	movl	60(%rsp), %r10d
	cmpl	%eax, %r8d
	jle	.L287
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r15d, %edx
	movl	%r10d, 48(%rsp)
	movl	%r11d, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	48(%rsp), %r10d
	movl	32(%rsp), %r11d
.L287:
	cmpl	%r10d, 44(%rsp)
	jge	.L281
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%r13d, %edx
	movl	%r11d, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	32(%rsp), %r11d
.L281:
	cmpl	40(%rsp), %r11d
	jle	.L268
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r11d, %ecx
	movl	%r14d, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L268:
	cmpl	36(%rsp), %r12d
	jle	.L255
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r12d, %ecx
	movl	%ebx, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L255:
	movl	28(%rsp), %esi
	cmpl	%esi, 20(%rsp)
	jle	.L221
	movl	20(%rsp), %ecx
	movl	24(%rsp), %esi
	movl	%ebp, %edx
	movq	8(%rsp), %rdi
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	.p2align 4,,10
	.p2align 3
.L313:
	.cfi_restore_state
	movl	44(%rdi), %edi
	movl	%edi, 20(%rsp)
	jmp	.L222
	.p2align 4,,10
	.p2align 3
.L314:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r14d
	jmp	.L225
	.p2align 4,,10
	.p2align 3
.L319:
	movzbl	32(%rsp), %edi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	movl	%edi, 36(%rsp)
	leal	1(%rbp), %edi
	movl	%edi, 28(%rsp)
.L233:
	cmpl	$-1, %r8d
	movl	%r8d, %eax
	je	.L338
.L237:
	movl	%eax, %edx
	movl	%eax, 40(%rsp)
	subl	%r13d, %edx
	movl	%edx, %r15d
	shrl	$31, %r15d
	addl	%r15d, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r15d
	cmpl	%r15d, %r13d
	je	.L239
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movl	%r13d, %edx
	movl	%r8d, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %eax
	movl	24(%rsp), %esi
	movl	%r15d, %edx
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %eax
	leal	1(%r13), %edx
	movl	44(%rsp), %r8d
	cmpl	%edx, %eax
	jle	.L239
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r13d, %edx
	movl	%r8d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	40(%rsp), %r8d
.L239:
	cmpl	28(%rsp), %r8d
	jle	.L230
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%ebp, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L230:
	cmpl	$-1, %r14d
	movl	%r14d, %eax
	je	.L339
.L241:
	movl	%eax, %edx
	subl	%r12d, %edx
	movl	%edx, %r13d
	shrl	$31, %r13d
	addl	%r13d, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r13d
	cmpl	%r13d, %r12d
	je	.L243
	cmpl	$-1, %r13d
	movl	%r13d, %r15d
	je	.L340
.L244:
	movl	%r15d, %edx
	leal	1(%r12), %r9d
	subl	%r12d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%r8d, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r8d
	cmpl	%r8d, %r12d
	je	.L246
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r12d, %edx
	movl	%eax, 44(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	movl	24(%rsp), %esi
	movl	%r15d, %ecx
	movq	8(%rsp), %rdi
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r12), %r9d
	movl	44(%rsp), %eax
	cmpl	%r9d, %r15d
	jle	.L246
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movl	%r12d, %edx
	movl	%r9d, 44(%rsp)
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	44(%rsp), %r9d
	movl	40(%rsp), %eax
.L246:
	cmpl	$-1, %eax
	movl	%eax, %r8d
	je	.L341
.L247:
	movl	%r8d, %edx
	movl	%r8d, 40(%rsp)
	subl	%r13d, %edx
	movl	%edx, %r15d
	shrl	$31, %r15d
	addl	%r15d, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r15d
	cmpl	%r15d, %r13d
	je	.L249
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movl	%r13d, %edx
	movl	%r9d, 48(%rsp)
	movl	%eax, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	movl	36(%rsp), %esi
	movl	%r15d, %edx
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	leal	1(%r13), %edx
	movl	44(%rsp), %eax
	movl	48(%rsp), %r9d
	cmpl	%edx, %r8d
	jle	.L249
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r13d, %edx
	movl	%r9d, 44(%rsp)
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	44(%rsp), %r9d
	movl	40(%rsp), %eax
.L249:
	cmpl	%r9d, %eax
	jle	.L243
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r12d, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L243:
	cmpl	28(%rsp), %r14d
	jle	.L227
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebp, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	20(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, %r12d
	jne	.L253
.L322:
	movq	8(%rsp), %rax
	movl	44(%rax), %r12d
	jmp	.L253
	.p2align 4,,10
	.p2align 3
.L326:
	movzbl	32(%rsp), %eax
	movl	%eax, 40(%rsp)
	leal	1(%rbx), %eax
	movl	%eax, 36(%rsp)
	jmp	.L261
	.p2align 4,,10
	.p2align 3
.L325:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L259
	.p2align 4,,10
	.p2align 3
.L318:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r10d
	jmp	.L231
	.p2align 4,,10
	.p2align 3
.L317:
	movzbl	%al, %eax
	cmpl	$-1, %r14d
	movl	%eax, 24(%rsp)
	leal	1(%rbp), %eax
	movl	%eax, 28(%rsp)
	movzbl	32(%rsp), %eax
	movl	%eax, 36(%rsp)
	movl	%r14d, %eax
	jne	.L241
.L339:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L324:
	leal	1(%rbx), %eax
	cmpl	$-1, %r12d
	movl	%r12d, %r11d
	movl	%eax, 36(%rsp)
	jne	.L266
.L328:
	movq	8(%rsp), %rax
	movl	44(%rax), %r11d
	jmp	.L266
	.p2align 4,,10
	.p2align 3
.L316:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	jmp	.L228
	.p2align 4,,10
	.p2align 3
.L323:
	movq	8(%rsp), %rax
	movl	44(%rax), %r13d
	jmp	.L256
	.p2align 4,,10
	.p2align 3
.L330:
	leal	1(%r14), %eax
	movl	%eax, 40(%rsp)
	jmp	.L271
	.p2align 4,,10
	.p2align 3
.L329:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L334:
	movq	8(%rsp), %rax
	movl	44(%rax), %r10d
	jmp	.L279
	.p2align 4,,10
	.p2align 3
.L341:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	jmp	.L247
	.p2align 4,,10
	.p2align 3
.L340:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r15d
	jmp	.L244
	.p2align 4,,10
	.p2align 3
.L338:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L327:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L332:
	movzbl	32(%rsp), %eax
	movl	%eax, 44(%rsp)
	leal	1(%r14), %eax
	movl	%eax, 40(%rsp)
	jmp	.L274
	.p2align 4,,10
	.p2align 3
.L321:
	movzbl	32(%rsp), %esi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	leal	1(%rbp), %eax
	movl	%eax, 28(%rsp)
	movl	%esi, 36(%rsp)
	jmp	.L236
	.p2align 4,,10
	.p2align 3
.L336:
	leal	1(%r13), %eax
	movl	%eax, 44(%rsp)
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L337:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L285
	.p2align 4,,10
	.p2align 3
.L335:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L282
	.p2align 4,,10
	.p2align 3
.L333:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L275
	.p2align 4,,10
	.p2align 3
.L320:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r11d
	jmp	.L234
	.p2align 4,,10
	.p2align 3
.L331:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L272
	.cfi_endproc
.LFE1991:
	.size	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii, .-_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	.section	.text.unlikely._Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii,comdat
.LCOLDE16:
	.section	.text._Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii,comdat
.LHOTE16:
	.section	.text.unlikely._Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii,comdat
.LCOLDB17:
	.section	.text._Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii,comdat
.LHOTB17:
	.p2align 4,,15
	.weak	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	.hidden	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	.type	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii, @function
_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii:
.LFB1992:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebp
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	cmpl	$-1, %ecx
	movq	%rdi, 8(%rsp)
	movl	%ecx, 20(%rsp)
	je	.L434
.L343:
	movl	20(%rsp), %edx
	subl	%ebp, %edx
	movl	%edx, %ebx
	shrl	$31, %ebx
	addl	%ebx, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %ebx
	cmpl	%ebx, %ebp
	je	.L342
	movl	%eax, %edi
	movl	%ebx, %r14d
	xorl	$1, %edi
	cmpl	$-1, %ebx
	movb	%dil, 32(%rsp)
	je	.L435
.L346:
	movl	%r14d, %edx
	subl	%ebp, %edx
	movl	%edx, %r12d
	shrl	$31, %r12d
	addl	%r12d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r12d
	cmpl	%r12d, %ebp
	je	.L436
	cmpl	$-1, %r12d
	movl	%r12d, %r8d
	je	.L437
.L349:
	movl	%r8d, %edx
	subl	%ebp, %edx
	movl	%edx, %r13d
	shrl	$31, %r13d
	addl	%r13d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r13d
	cmpl	%r13d, %ebp
	je	.L438
	cmpl	$-1, %r13d
	movl	%r13d, %r10d
	je	.L439
.L352:
	movl	%r10d, %edx
	subl	%ebp, %edx
	movl	%edx, %r15d
	shrl	$31, %r15d
	addl	%r15d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r15d
	cmpl	%r15d, %ebp
	je	.L440
	cmpl	$-1, %r15d
	movl	%r15d, %r11d
	je	.L441
.L355:
	movl	%r11d, %edx
	subl	%ebp, %edx
	movl	%edx, %r9d
	shrl	$31, %r9d
	addl	%r9d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r9d
	cmpl	%r9d, %ebp
	je	.L442
	movl	%eax, 24(%rsp)
	movzbl	32(%rsp), %eax
	movl	%r9d, %ecx
	movq	8(%rsp), %rdi
	movl	%ebp, %edx
	movl	%r10d, 48(%rsp)
	movl	%r8d, 44(%rsp)
	movl	%r11d, 40(%rsp)
	movl	%r9d, 28(%rsp)
	movl	%eax, %esi
	movl	%eax, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %eax
	movl	40(%rsp), %r11d
	movl	28(%rsp), %r9d
	movq	8(%rsp), %rdi
	movzbl	%al, %eax
	movl	%r11d, %ecx
	movl	%eax, %esi
	movl	%r9d, %edx
	movl	%eax, 24(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r11d
	leal	1(%rbp), %eax
	movl	44(%rsp), %r8d
	movl	48(%rsp), %r10d
	movl	%eax, 28(%rsp)
	cmpl	%eax, %r11d
	jle	.L357
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r11d, %ecx
	movl	%ebp, %edx
	movl	%r10d, 44(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	44(%rsp), %r10d
	movl	40(%rsp), %r8d
.L357:
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%r15d, %edx
	movl	%r8d, 44(%rsp)
	movl	%r10d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r10d
	cmpl	28(%rsp), %r10d
	movl	44(%rsp), %r8d
	jle	.L354
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%ebp, %edx
	movl	%r8d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	40(%rsp), %r8d
	jmp	.L354
	.p2align 4,,10
	.p2align 3
.L342:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L436:
	.cfi_restore_state
	leal	1(%rbp), %esi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	movl	%esi, 28(%rsp)
.L348:
	movl	20(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, %r12d
	je	.L443
.L374:
	movl	%r12d, %eax
	subl	%ebx, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%r14d, %eax
	sarl	%eax
	leal	(%rax,%rbx), %r14d
	cmpl	%r14d, %ebx
	je	.L376
	cmpl	$-1, %r14d
	movl	%r14d, %r13d
	je	.L444
.L377:
	movl	%r13d, %eax
	subl	%ebx, %eax
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%r15d, %eax
	sarl	%eax
	leal	(%rax,%rbx), %r15d
	cmpl	%r15d, %ebx
	je	.L445
	cmpl	$-1, %r15d
	movl	%r15d, %r9d
	je	.L446
.L380:
	movl	%r9d, %eax
	subl	%ebx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebx, %eax
	cmpl	%eax, %ebx
	je	.L447
	movzbl	32(%rsp), %edi
	movl	%eax, %ecx
	movl	%ebx, %edx
	movl	%r9d, 44(%rsp)
	movl	%eax, 36(%rsp)
	movl	%edi, %esi
	movl	%edi, 40(%rsp)
	movq	8(%rsp), %rdi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	44(%rsp), %r9d
	movl	36(%rsp), %eax
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	44(%rsp), %r9d
	leal	1(%rbx), %eax
	movl	%eax, 36(%rsp)
	cmpl	%eax, %r9d
	jle	.L382
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%ebx, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L382:
	cmpl	$-1, %r13d
	movl	%r13d, %r9d
	je	.L448
.L383:
	movl	%r9d, %eax
	movl	%r9d, 44(%rsp)
	subl	%r15d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r15d, %eax
	cmpl	%eax, %r15d
	je	.L385
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r15d, %edx
	movl	%eax, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	44(%rsp), %r9d
	movl	48(%rsp), %eax
	movl	40(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	44(%rsp), %r9d
	leal	1(%r15), %eax
	cmpl	%eax, %r9d
	jle	.L385
	movl	40(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r15d, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L385:
	cmpl	36(%rsp), %r13d
	jle	.L379
	movl	40(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%ebx, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L379:
	cmpl	$-1, %r12d
	movl	%r12d, %r11d
	je	.L449
.L387:
	movl	%r11d, %eax
	subl	%r14d, %eax
	movl	%eax, %r13d
	shrl	$31, %r13d
	addl	%r13d, %eax
	sarl	%eax
	leal	(%rax,%r14), %r13d
	cmpl	%r13d, %r14d
	je	.L389
	cmpl	$-1, %r13d
	movl	%r13d, %r8d
	je	.L450
.L390:
	movl	%r8d, %eax
	subl	%r14d, %eax
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%r15d, %eax
	sarl	%eax
	leal	(%rax,%r14), %r15d
	cmpl	%r15d, %r14d
	je	.L451
	cmpl	$-1, %r15d
	movl	%r15d, %r9d
	je	.L452
.L393:
	movl	%r9d, %eax
	subl	%r14d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r14d, %eax
	cmpl	%eax, %r14d
	je	.L453
	movzbl	32(%rsp), %edi
	movl	%eax, %ecx
	movl	%r14d, %edx
	movl	%r8d, 56(%rsp)
	movl	%r11d, 52(%rsp)
	movl	%r9d, 48(%rsp)
	movl	%eax, 40(%rsp)
	movl	%edi, %esi
	movl	%edi, 44(%rsp)
	movq	8(%rsp), %rdi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	movl	40(%rsp), %eax
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	leal	1(%r14), %eax
	movl	52(%rsp), %r11d
	movl	56(%rsp), %r8d
	movl	%eax, 40(%rsp)
	cmpl	%eax, %r9d
	jle	.L395
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r14d, %edx
	movl	%r8d, 52(%rsp)
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	52(%rsp), %r8d
	movl	48(%rsp), %r11d
.L395:
	cmpl	$-1, %r8d
	movl	%r8d, %r9d
	je	.L454
.L396:
	movl	%r9d, %eax
	movl	%r9d, 48(%rsp)
	subl	%r15d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r15d, %eax
	cmpl	%eax, %r15d
	je	.L398
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r15d, %edx
	movl	%r8d, 60(%rsp)
	movl	%r11d, 56(%rsp)
	movl	%eax, 52(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	movl	52(%rsp), %eax
	movl	44(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	leal	1(%r15), %eax
	movl	56(%rsp), %r11d
	movl	60(%rsp), %r8d
	cmpl	%eax, %r9d
	jle	.L398
	movl	44(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r15d, %edx
	movl	%r8d, 52(%rsp)
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	52(%rsp), %r8d
	movl	48(%rsp), %r11d
.L398:
	cmpl	%r8d, 40(%rsp)
	jge	.L392
	movl	44(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r14d, %edx
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	48(%rsp), %r11d
.L392:
	cmpl	$-1, %r11d
	movl	%r11d, %r10d
	je	.L455
.L400:
	movl	%r10d, %eax
	subl	%r13d, %eax
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%r15d, %eax
	sarl	%eax
	leal	(%rax,%r13), %r15d
	cmpl	%r15d, %r13d
	je	.L402
	cmpl	$-1, %r15d
	movl	%r15d, %r8d
	je	.L456
.L403:
	movl	%r8d, %eax
	subl	%r13d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r13d, %eax
	cmpl	%eax, %r13d
	je	.L457
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r13d, %edx
	movl	%r10d, 60(%rsp)
	movl	%r11d, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movl	%eax, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movzbl	32(%rsp), %r9d
	movl	48(%rsp), %r8d
	movl	44(%rsp), %eax
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r8d, 52(%rsp)
	movl	%eax, %edx
	movl	%r9d, %esi
	movl	%r9d, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	52(%rsp), %r8d
	leal	1(%r13), %eax
	movl	48(%rsp), %r9d
	movl	56(%rsp), %r11d
	movl	60(%rsp), %r10d
	movl	%eax, 44(%rsp)
	cmpl	%eax, %r8d
	jle	.L405
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r13d, %edx
	movl	%r9d, %esi
	movl	%r10d, 52(%rsp)
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	52(%rsp), %r10d
	movl	48(%rsp), %r11d
.L405:
	cmpl	$-1, %r10d
	movl	%r10d, %r8d
	je	.L458
.L406:
	movl	%r8d, %eax
	movl	%r8d, 48(%rsp)
	subl	%r15d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r15d, %eax
	cmpl	%eax, %r15d
	je	.L408
	movzbl	32(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r15d, %edx
	movl	%r10d, 60(%rsp)
	movl	%r11d, 56(%rsp)
	movl	%eax, 52(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r8d
	movl	52(%rsp), %eax
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%eax, %edx
	movl	%r8d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	32(%rsp), %r8d
	leal	1(%r15), %eax
	movl	56(%rsp), %r11d
	movl	60(%rsp), %r10d
	cmpl	%eax, %r8d
	jle	.L408
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r15d, %edx
	movl	%r10d, 48(%rsp)
	movl	%r11d, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	48(%rsp), %r10d
	movl	32(%rsp), %r11d
.L408:
	cmpl	%r10d, 44(%rsp)
	jge	.L402
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%r13d, %edx
	movl	%r11d, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	32(%rsp), %r11d
.L402:
	cmpl	40(%rsp), %r11d
	jle	.L389
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r11d, %ecx
	movl	%r14d, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L389:
	cmpl	36(%rsp), %r12d
	jle	.L376
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r12d, %ecx
	movl	%ebx, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L376:
	movl	28(%rsp), %esi
	cmpl	%esi, 20(%rsp)
	jle	.L342
	movl	20(%rsp), %ecx
	movl	24(%rsp), %esi
	movl	%ebp, %edx
	movq	8(%rsp), %rdi
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	.p2align 4,,10
	.p2align 3
.L434:
	.cfi_restore_state
	movl	44(%rdi), %edi
	movl	%edi, 20(%rsp)
	jmp	.L343
	.p2align 4,,10
	.p2align 3
.L435:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r14d
	jmp	.L346
	.p2align 4,,10
	.p2align 3
.L440:
	movzbl	32(%rsp), %edi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	movl	%edi, 36(%rsp)
	leal	1(%rbp), %edi
	movl	%edi, 28(%rsp)
.L354:
	cmpl	$-1, %r8d
	movl	%r8d, %eax
	je	.L459
.L358:
	movl	%eax, %edx
	movl	%eax, 40(%rsp)
	subl	%r13d, %edx
	movl	%edx, %r15d
	shrl	$31, %r15d
	addl	%r15d, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r15d
	cmpl	%r15d, %r13d
	je	.L360
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movl	%r13d, %edx
	movl	%r8d, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %eax
	movl	24(%rsp), %esi
	movl	%r15d, %edx
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %eax
	leal	1(%r13), %edx
	movl	44(%rsp), %r8d
	cmpl	%edx, %eax
	jle	.L360
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r13d, %edx
	movl	%r8d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	40(%rsp), %r8d
.L360:
	cmpl	28(%rsp), %r8d
	jle	.L351
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%ebp, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L351:
	cmpl	$-1, %r14d
	movl	%r14d, %eax
	je	.L460
.L362:
	movl	%eax, %edx
	subl	%r12d, %edx
	movl	%edx, %r13d
	shrl	$31, %r13d
	addl	%r13d, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r13d
	cmpl	%r13d, %r12d
	je	.L364
	cmpl	$-1, %r13d
	movl	%r13d, %r15d
	je	.L461
.L365:
	movl	%r15d, %edx
	leal	1(%r12), %r9d
	subl	%r12d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%r8d, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r8d
	cmpl	%r8d, %r12d
	je	.L367
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r12d, %edx
	movl	%eax, 44(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	movl	24(%rsp), %esi
	movl	%r15d, %ecx
	movq	8(%rsp), %rdi
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r12), %r9d
	movl	44(%rsp), %eax
	cmpl	%r9d, %r15d
	jle	.L367
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movl	%r12d, %edx
	movl	%r9d, 44(%rsp)
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	44(%rsp), %r9d
	movl	40(%rsp), %eax
.L367:
	cmpl	$-1, %eax
	movl	%eax, %r8d
	je	.L462
.L368:
	movl	%r8d, %edx
	movl	%r8d, 40(%rsp)
	subl	%r13d, %edx
	movl	%edx, %r15d
	shrl	$31, %r15d
	addl	%r15d, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r15d
	cmpl	%r15d, %r13d
	je	.L370
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movl	%r13d, %edx
	movl	%r9d, 48(%rsp)
	movl	%eax, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	movl	36(%rsp), %esi
	movl	%r15d, %edx
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	leal	1(%r13), %edx
	movl	44(%rsp), %eax
	movl	48(%rsp), %r9d
	cmpl	%edx, %r8d
	jle	.L370
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r13d, %edx
	movl	%r9d, 44(%rsp)
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	44(%rsp), %r9d
	movl	40(%rsp), %eax
.L370:
	cmpl	%r9d, %eax
	jle	.L364
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r12d, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L364:
	cmpl	28(%rsp), %r14d
	jle	.L348
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebp, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	20(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, %r12d
	jne	.L374
.L443:
	movq	8(%rsp), %rax
	movl	44(%rax), %r12d
	jmp	.L374
	.p2align 4,,10
	.p2align 3
.L447:
	movzbl	32(%rsp), %eax
	movl	%eax, 40(%rsp)
	leal	1(%rbx), %eax
	movl	%eax, 36(%rsp)
	jmp	.L382
	.p2align 4,,10
	.p2align 3
.L446:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L380
	.p2align 4,,10
	.p2align 3
.L439:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r10d
	jmp	.L352
	.p2align 4,,10
	.p2align 3
.L438:
	movzbl	%al, %eax
	cmpl	$-1, %r14d
	movl	%eax, 24(%rsp)
	leal	1(%rbp), %eax
	movl	%eax, 28(%rsp)
	movzbl	32(%rsp), %eax
	movl	%eax, 36(%rsp)
	movl	%r14d, %eax
	jne	.L362
.L460:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L362
	.p2align 4,,10
	.p2align 3
.L445:
	leal	1(%rbx), %eax
	cmpl	$-1, %r12d
	movl	%r12d, %r11d
	movl	%eax, 36(%rsp)
	jne	.L387
.L449:
	movq	8(%rsp), %rax
	movl	44(%rax), %r11d
	jmp	.L387
	.p2align 4,,10
	.p2align 3
.L437:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	jmp	.L349
	.p2align 4,,10
	.p2align 3
.L444:
	movq	8(%rsp), %rax
	movl	44(%rax), %r13d
	jmp	.L377
	.p2align 4,,10
	.p2align 3
.L451:
	leal	1(%r14), %eax
	movl	%eax, 40(%rsp)
	jmp	.L392
	.p2align 4,,10
	.p2align 3
.L450:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L390
	.p2align 4,,10
	.p2align 3
.L455:
	movq	8(%rsp), %rax
	movl	44(%rax), %r10d
	jmp	.L400
	.p2align 4,,10
	.p2align 3
.L462:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	jmp	.L368
	.p2align 4,,10
	.p2align 3
.L461:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r15d
	jmp	.L365
	.p2align 4,,10
	.p2align 3
.L459:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L358
	.p2align 4,,10
	.p2align 3
.L448:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L383
	.p2align 4,,10
	.p2align 3
.L453:
	movzbl	32(%rsp), %eax
	movl	%eax, 44(%rsp)
	leal	1(%r14), %eax
	movl	%eax, 40(%rsp)
	jmp	.L395
	.p2align 4,,10
	.p2align 3
.L442:
	movzbl	32(%rsp), %esi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	leal	1(%rbp), %eax
	movl	%eax, 28(%rsp)
	movl	%esi, 36(%rsp)
	jmp	.L357
	.p2align 4,,10
	.p2align 3
.L457:
	leal	1(%r13), %eax
	movl	%eax, 44(%rsp)
	jmp	.L405
	.p2align 4,,10
	.p2align 3
.L458:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L406
	.p2align 4,,10
	.p2align 3
.L456:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L403
	.p2align 4,,10
	.p2align 3
.L454:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L396
	.p2align 4,,10
	.p2align 3
.L441:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r11d
	jmp	.L355
	.p2align 4,,10
	.p2align 3
.L452:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L393
	.cfi_endproc
.LFE1992:
	.size	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii, .-_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	.section	.text.unlikely._Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii,comdat
.LCOLDE17:
	.section	.text._Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii,comdat
.LHOTE17:
	.section	.text.unlikely._Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii,comdat
.LCOLDB18:
	.section	.text._Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii,comdat
.LHOTB18:
	.p2align 4,,15
	.weak	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	.hidden	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	.type	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii, @function
_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii:
.LFB1998:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebp
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	cmpl	$-1, %ecx
	movq	%rdi, 8(%rsp)
	movl	%ecx, 20(%rsp)
	je	.L555
.L464:
	movl	20(%rsp), %edx
	subl	%ebp, %edx
	movl	%edx, %ebx
	shrl	$31, %ebx
	addl	%ebx, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %ebx
	cmpl	%ebx, %ebp
	je	.L463
	movl	%eax, %edi
	movl	%ebx, %r14d
	xorl	$1, %edi
	cmpl	$-1, %ebx
	movb	%dil, 32(%rsp)
	je	.L556
.L467:
	movl	%r14d, %edx
	subl	%ebp, %edx
	movl	%edx, %r12d
	shrl	$31, %r12d
	addl	%r12d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r12d
	cmpl	%r12d, %ebp
	je	.L557
	cmpl	$-1, %r12d
	movl	%r12d, %r8d
	je	.L558
.L470:
	movl	%r8d, %edx
	subl	%ebp, %edx
	movl	%edx, %r13d
	shrl	$31, %r13d
	addl	%r13d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r13d
	cmpl	%r13d, %ebp
	je	.L559
	cmpl	$-1, %r13d
	movl	%r13d, %r10d
	je	.L560
.L473:
	movl	%r10d, %edx
	subl	%ebp, %edx
	movl	%edx, %r15d
	shrl	$31, %r15d
	addl	%r15d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r15d
	cmpl	%r15d, %ebp
	je	.L561
	cmpl	$-1, %r15d
	movl	%r15d, %r11d
	je	.L562
.L476:
	movl	%r11d, %edx
	subl	%ebp, %edx
	movl	%edx, %r9d
	shrl	$31, %r9d
	addl	%r9d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r9d
	cmpl	%r9d, %ebp
	je	.L563
	movl	%eax, 24(%rsp)
	movzbl	32(%rsp), %eax
	movl	%r9d, %ecx
	movq	8(%rsp), %rdi
	movl	%ebp, %edx
	movl	%r10d, 48(%rsp)
	movl	%r8d, 44(%rsp)
	movl	%r11d, 40(%rsp)
	movl	%r9d, 28(%rsp)
	movl	%eax, %esi
	movl	%eax, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %eax
	movl	40(%rsp), %r11d
	movl	28(%rsp), %r9d
	movq	8(%rsp), %rdi
	movzbl	%al, %eax
	movl	%r11d, %ecx
	movl	%eax, %esi
	movl	%r9d, %edx
	movl	%eax, 24(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r11d
	leal	1(%rbp), %eax
	movl	44(%rsp), %r8d
	movl	48(%rsp), %r10d
	movl	%eax, 28(%rsp)
	cmpl	%eax, %r11d
	jle	.L478
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r11d, %ecx
	movl	%ebp, %edx
	movl	%r10d, 44(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	44(%rsp), %r10d
	movl	40(%rsp), %r8d
.L478:
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%r15d, %edx
	movl	%r8d, 44(%rsp)
	movl	%r10d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r10d
	cmpl	28(%rsp), %r10d
	movl	44(%rsp), %r8d
	jle	.L475
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%ebp, %edx
	movl	%r8d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	40(%rsp), %r8d
	jmp	.L475
	.p2align 4,,10
	.p2align 3
.L463:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L557:
	.cfi_restore_state
	leal	1(%rbp), %esi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	movl	%esi, 28(%rsp)
.L469:
	movl	20(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, %r12d
	je	.L564
.L495:
	movl	%r12d, %eax
	subl	%ebx, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%r14d, %eax
	sarl	%eax
	leal	(%rax,%rbx), %r14d
	cmpl	%r14d, %ebx
	je	.L497
	cmpl	$-1, %r14d
	movl	%r14d, %r13d
	je	.L565
.L498:
	movl	%r13d, %eax
	subl	%ebx, %eax
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%r15d, %eax
	sarl	%eax
	leal	(%rax,%rbx), %r15d
	cmpl	%r15d, %ebx
	je	.L566
	cmpl	$-1, %r15d
	movl	%r15d, %r9d
	je	.L567
.L501:
	movl	%r9d, %eax
	subl	%ebx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebx, %eax
	cmpl	%eax, %ebx
	je	.L568
	movzbl	32(%rsp), %edi
	movl	%eax, %ecx
	movl	%ebx, %edx
	movl	%r9d, 44(%rsp)
	movl	%eax, 36(%rsp)
	movl	%edi, %esi
	movl	%edi, 40(%rsp)
	movq	8(%rsp), %rdi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	44(%rsp), %r9d
	movl	36(%rsp), %eax
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	44(%rsp), %r9d
	leal	1(%rbx), %eax
	movl	%eax, 36(%rsp)
	cmpl	%eax, %r9d
	jle	.L503
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%ebx, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L503:
	cmpl	$-1, %r13d
	movl	%r13d, %r9d
	je	.L569
.L504:
	movl	%r9d, %eax
	movl	%r9d, 44(%rsp)
	subl	%r15d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r15d, %eax
	cmpl	%eax, %r15d
	je	.L506
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r15d, %edx
	movl	%eax, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	44(%rsp), %r9d
	movl	48(%rsp), %eax
	movl	40(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	44(%rsp), %r9d
	leal	1(%r15), %eax
	cmpl	%eax, %r9d
	jle	.L506
	movl	40(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r15d, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L506:
	cmpl	36(%rsp), %r13d
	jle	.L500
	movl	40(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%ebx, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L500:
	cmpl	$-1, %r12d
	movl	%r12d, %r11d
	je	.L570
.L508:
	movl	%r11d, %eax
	subl	%r14d, %eax
	movl	%eax, %r13d
	shrl	$31, %r13d
	addl	%r13d, %eax
	sarl	%eax
	leal	(%rax,%r14), %r13d
	cmpl	%r13d, %r14d
	je	.L510
	cmpl	$-1, %r13d
	movl	%r13d, %r8d
	je	.L571
.L511:
	movl	%r8d, %eax
	subl	%r14d, %eax
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%r15d, %eax
	sarl	%eax
	leal	(%rax,%r14), %r15d
	cmpl	%r15d, %r14d
	je	.L572
	cmpl	$-1, %r15d
	movl	%r15d, %r9d
	je	.L573
.L514:
	movl	%r9d, %eax
	subl	%r14d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r14d, %eax
	cmpl	%eax, %r14d
	je	.L574
	movzbl	32(%rsp), %edi
	movl	%eax, %ecx
	movl	%r14d, %edx
	movl	%r8d, 56(%rsp)
	movl	%r11d, 52(%rsp)
	movl	%r9d, 48(%rsp)
	movl	%eax, 40(%rsp)
	movl	%edi, %esi
	movl	%edi, 44(%rsp)
	movq	8(%rsp), %rdi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	movl	40(%rsp), %eax
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	leal	1(%r14), %eax
	movl	52(%rsp), %r11d
	movl	56(%rsp), %r8d
	movl	%eax, 40(%rsp)
	cmpl	%eax, %r9d
	jle	.L516
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r14d, %edx
	movl	%r8d, 52(%rsp)
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	52(%rsp), %r8d
	movl	48(%rsp), %r11d
.L516:
	cmpl	$-1, %r8d
	movl	%r8d, %r9d
	je	.L575
.L517:
	movl	%r9d, %eax
	movl	%r9d, 48(%rsp)
	subl	%r15d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r15d, %eax
	cmpl	%eax, %r15d
	je	.L519
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r15d, %edx
	movl	%r8d, 60(%rsp)
	movl	%r11d, 56(%rsp)
	movl	%eax, 52(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	movl	52(%rsp), %eax
	movl	44(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	leal	1(%r15), %eax
	movl	56(%rsp), %r11d
	movl	60(%rsp), %r8d
	cmpl	%eax, %r9d
	jle	.L519
	movl	44(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r15d, %edx
	movl	%r8d, 52(%rsp)
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	52(%rsp), %r8d
	movl	48(%rsp), %r11d
.L519:
	cmpl	%r8d, 40(%rsp)
	jge	.L513
	movl	44(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r14d, %edx
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	48(%rsp), %r11d
.L513:
	cmpl	$-1, %r11d
	movl	%r11d, %r10d
	je	.L576
.L521:
	movl	%r10d, %eax
	subl	%r13d, %eax
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%r15d, %eax
	sarl	%eax
	leal	(%rax,%r13), %r15d
	cmpl	%r15d, %r13d
	je	.L523
	cmpl	$-1, %r15d
	movl	%r15d, %r8d
	je	.L577
.L524:
	movl	%r8d, %eax
	subl	%r13d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r13d, %eax
	cmpl	%eax, %r13d
	je	.L578
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r13d, %edx
	movl	%r10d, 60(%rsp)
	movl	%r11d, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movl	%eax, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movzbl	32(%rsp), %r9d
	movl	48(%rsp), %r8d
	movl	44(%rsp), %eax
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r8d, 52(%rsp)
	movl	%eax, %edx
	movl	%r9d, %esi
	movl	%r9d, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	52(%rsp), %r8d
	leal	1(%r13), %eax
	movl	48(%rsp), %r9d
	movl	56(%rsp), %r11d
	movl	60(%rsp), %r10d
	movl	%eax, 44(%rsp)
	cmpl	%eax, %r8d
	jle	.L526
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r13d, %edx
	movl	%r9d, %esi
	movl	%r10d, 52(%rsp)
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	52(%rsp), %r10d
	movl	48(%rsp), %r11d
.L526:
	cmpl	$-1, %r10d
	movl	%r10d, %r8d
	je	.L579
.L527:
	movl	%r8d, %eax
	movl	%r8d, 48(%rsp)
	subl	%r15d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r15d, %eax
	cmpl	%eax, %r15d
	je	.L529
	movzbl	32(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r15d, %edx
	movl	%r10d, 60(%rsp)
	movl	%r11d, 56(%rsp)
	movl	%eax, 52(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r8d
	movl	52(%rsp), %eax
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%eax, %edx
	movl	%r8d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	32(%rsp), %r8d
	leal	1(%r15), %eax
	movl	56(%rsp), %r11d
	movl	60(%rsp), %r10d
	cmpl	%eax, %r8d
	jle	.L529
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r15d, %edx
	movl	%r10d, 48(%rsp)
	movl	%r11d, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	48(%rsp), %r10d
	movl	32(%rsp), %r11d
.L529:
	cmpl	%r10d, 44(%rsp)
	jge	.L523
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%r13d, %edx
	movl	%r11d, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	32(%rsp), %r11d
.L523:
	cmpl	40(%rsp), %r11d
	jle	.L510
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r11d, %ecx
	movl	%r14d, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L510:
	cmpl	36(%rsp), %r12d
	jle	.L497
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r12d, %ecx
	movl	%ebx, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L497:
	movl	28(%rsp), %esi
	cmpl	%esi, 20(%rsp)
	jle	.L463
	movl	20(%rsp), %ecx
	movl	24(%rsp), %esi
	movl	%ebp, %edx
	movq	8(%rsp), %rdi
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	.p2align 4,,10
	.p2align 3
.L555:
	.cfi_restore_state
	movl	44(%rdi), %edi
	movl	%edi, 20(%rsp)
	jmp	.L464
	.p2align 4,,10
	.p2align 3
.L556:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r14d
	jmp	.L467
	.p2align 4,,10
	.p2align 3
.L561:
	movzbl	32(%rsp), %edi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	movl	%edi, 36(%rsp)
	leal	1(%rbp), %edi
	movl	%edi, 28(%rsp)
.L475:
	cmpl	$-1, %r8d
	movl	%r8d, %eax
	je	.L580
.L479:
	movl	%eax, %edx
	movl	%eax, 40(%rsp)
	subl	%r13d, %edx
	movl	%edx, %r15d
	shrl	$31, %r15d
	addl	%r15d, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r15d
	cmpl	%r15d, %r13d
	je	.L481
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movl	%r13d, %edx
	movl	%r8d, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %eax
	movl	24(%rsp), %esi
	movl	%r15d, %edx
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %eax
	leal	1(%r13), %edx
	movl	44(%rsp), %r8d
	cmpl	%edx, %eax
	jle	.L481
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r13d, %edx
	movl	%r8d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	40(%rsp), %r8d
.L481:
	cmpl	28(%rsp), %r8d
	jle	.L472
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%ebp, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L472:
	cmpl	$-1, %r14d
	movl	%r14d, %eax
	je	.L581
.L483:
	movl	%eax, %edx
	subl	%r12d, %edx
	movl	%edx, %r13d
	shrl	$31, %r13d
	addl	%r13d, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r13d
	cmpl	%r13d, %r12d
	je	.L485
	cmpl	$-1, %r13d
	movl	%r13d, %r15d
	je	.L582
.L486:
	movl	%r15d, %edx
	leal	1(%r12), %r9d
	subl	%r12d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%r8d, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r8d
	cmpl	%r8d, %r12d
	je	.L488
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r12d, %edx
	movl	%eax, 44(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	movl	24(%rsp), %esi
	movl	%r15d, %ecx
	movq	8(%rsp), %rdi
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r12), %r9d
	movl	44(%rsp), %eax
	cmpl	%r9d, %r15d
	jle	.L488
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movl	%r12d, %edx
	movl	%r9d, 44(%rsp)
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	44(%rsp), %r9d
	movl	40(%rsp), %eax
.L488:
	cmpl	$-1, %eax
	movl	%eax, %r8d
	je	.L583
.L489:
	movl	%r8d, %edx
	movl	%r8d, 40(%rsp)
	subl	%r13d, %edx
	movl	%edx, %r15d
	shrl	$31, %r15d
	addl	%r15d, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r15d
	cmpl	%r15d, %r13d
	je	.L491
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movl	%r13d, %edx
	movl	%r9d, 48(%rsp)
	movl	%eax, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	movl	36(%rsp), %esi
	movl	%r15d, %edx
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	leal	1(%r13), %edx
	movl	44(%rsp), %eax
	movl	48(%rsp), %r9d
	cmpl	%edx, %r8d
	jle	.L491
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r13d, %edx
	movl	%r9d, 44(%rsp)
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	44(%rsp), %r9d
	movl	40(%rsp), %eax
.L491:
	cmpl	%r9d, %eax
	jle	.L485
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r12d, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L485:
	cmpl	28(%rsp), %r14d
	jle	.L469
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebp, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	20(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, %r12d
	jne	.L495
.L564:
	movq	8(%rsp), %rax
	movl	44(%rax), %r12d
	jmp	.L495
	.p2align 4,,10
	.p2align 3
.L568:
	movzbl	32(%rsp), %eax
	movl	%eax, 40(%rsp)
	leal	1(%rbx), %eax
	movl	%eax, 36(%rsp)
	jmp	.L503
	.p2align 4,,10
	.p2align 3
.L567:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L501
	.p2align 4,,10
	.p2align 3
.L560:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r10d
	jmp	.L473
	.p2align 4,,10
	.p2align 3
.L559:
	movzbl	%al, %eax
	cmpl	$-1, %r14d
	movl	%eax, 24(%rsp)
	leal	1(%rbp), %eax
	movl	%eax, 28(%rsp)
	movzbl	32(%rsp), %eax
	movl	%eax, 36(%rsp)
	movl	%r14d, %eax
	jne	.L483
.L581:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L483
	.p2align 4,,10
	.p2align 3
.L566:
	leal	1(%rbx), %eax
	cmpl	$-1, %r12d
	movl	%r12d, %r11d
	movl	%eax, 36(%rsp)
	jne	.L508
.L570:
	movq	8(%rsp), %rax
	movl	44(%rax), %r11d
	jmp	.L508
	.p2align 4,,10
	.p2align 3
.L558:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	jmp	.L470
	.p2align 4,,10
	.p2align 3
.L565:
	movq	8(%rsp), %rax
	movl	44(%rax), %r13d
	jmp	.L498
	.p2align 4,,10
	.p2align 3
.L572:
	leal	1(%r14), %eax
	movl	%eax, 40(%rsp)
	jmp	.L513
	.p2align 4,,10
	.p2align 3
.L571:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L511
	.p2align 4,,10
	.p2align 3
.L576:
	movq	8(%rsp), %rax
	movl	44(%rax), %r10d
	jmp	.L521
	.p2align 4,,10
	.p2align 3
.L583:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	jmp	.L489
	.p2align 4,,10
	.p2align 3
.L582:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r15d
	jmp	.L486
	.p2align 4,,10
	.p2align 3
.L580:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L479
	.p2align 4,,10
	.p2align 3
.L569:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L504
	.p2align 4,,10
	.p2align 3
.L574:
	movzbl	32(%rsp), %eax
	movl	%eax, 44(%rsp)
	leal	1(%r14), %eax
	movl	%eax, 40(%rsp)
	jmp	.L516
	.p2align 4,,10
	.p2align 3
.L563:
	movzbl	32(%rsp), %esi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	leal	1(%rbp), %eax
	movl	%eax, 28(%rsp)
	movl	%esi, 36(%rsp)
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L578:
	leal	1(%r13), %eax
	movl	%eax, 44(%rsp)
	jmp	.L526
	.p2align 4,,10
	.p2align 3
.L579:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L527
	.p2align 4,,10
	.p2align 3
.L577:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L524
	.p2align 4,,10
	.p2align 3
.L575:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L517
	.p2align 4,,10
	.p2align 3
.L562:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r11d
	jmp	.L476
	.p2align 4,,10
	.p2align 3
.L573:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L514
	.cfi_endproc
.LFE1998:
	.size	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii, .-_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	.section	.text.unlikely._Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii,comdat
.LCOLDE18:
	.section	.text._Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii,comdat
.LHOTE18:
	.section	.text.unlikely._ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_,"axG",@progbits,_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC5ERKS8_,comdat
	.align 2
.LCOLDB19:
	.section	.text._ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_,"axG",@progbits,_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC5ERKS8_,comdat
.LHOTB19:
	.align 2
	.p2align 4,,15
	.weak	_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_
	.hidden	_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_
	.type	_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_, @function
_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_:
.LFB2000:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2000
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	8(%rsi), %rbx
	subq	(%rsi), %rbx
	movq	$0, 16(%rdi)
	movq	%rbx, %rax
	sarq	$3, %rax
	testq	%rax, %rax
	jne	.L605
.L584:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L605:
	.cfi_restore_state
	movabsq	$2305843009213693951, %rdx
	movq	%rsi, %r12
	movq	%rdi, %rbp
	cmpq	%rdx, %rax
	ja	.L606
	movq	%rbx, %rdi
.LEHB2:
	call	_Znwm@PLT
	addq	%rax, %rbx
	movq	%rax, 8(%rbp)
	movq	%rax, 0(%rbp)
	movq	%rbx, 16(%rbp)
	movq	(%r12), %rsi
	movq	%rax, %rcx
	movq	8(%r12), %rbx
	subq	%rsi, %rbx
	cmpq	$7, %rbx
	jle	.L584
	movq	%rbx, %rdx
	movq	%rcx, %rdi
	call	memcpy@PLT
	addq	%rax, %rbx
	movq	%rbx, 8(%rbp)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L606:
	.cfi_restore_state
	call	_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv@PLT
	movl	$8, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	_ZNSt9bad_allocC1Ev@PLT
	movq	_ZNSt9bad_allocD1Ev@GOTPCREL(%rip), %rdx
	leaq	_ZTISt9bad_alloc(%rip), %rsi
	movq	%rbx, %rdi
	call	__cxa_throw@PLT
.LEHE2:
.L595:
	movq	%rax, %rbx
.L590:
	movq	0(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L591
.L600:
	movq	8(%rbp), %rdx
	cmpq	%rdx, %rdi
	je	.L592
	subq	$8, %rdx
	movq	%rdx, 8(%rbp)
	jmp	.L600
.L592:
	call	_ZdlPv@PLT
.L591:
	movq	%rbx, %rdi
.LEHB3:
	call	_Unwind_Resume@PLT
.LEHE3:
	.cfi_endproc
.LFE2000:
	.section	.gcc_except_table._ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_,"aG",@progbits,_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC5ERKS8_,comdat
.LLSDA2000:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2000-.LLSDACSB2000
.LLSDACSB2000:
	.uleb128 .LEHB2-.LFB2000
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L595-.LFB2000
	.uleb128 0
	.uleb128 .LEHB3-.LFB2000
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE2000:
	.section	.text._ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_,"axG",@progbits,_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC5ERKS8_,comdat
	.size	_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_, .-_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_
	.section	.text.unlikely._ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_,"axG",@progbits,_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC5ERKS8_,comdat
.LCOLDE19:
	.section	.text._ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_,"axG",@progbits,_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC5ERKS8_,comdat
.LHOTE19:
	.weak	_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC1ERKS8_
	.hidden	_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC1ERKS8_
	.set	_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC1ERKS8_,_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC2ERKS8_
	.section	.text.unlikely._Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii,comdat
.LCOLDB20:
	.section	.text._Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii,comdat
.LHOTB20:
	.p2align 4,,15
	.weak	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	.hidden	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	.type	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii, @function
_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii:
.LFB2040:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebp
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	cmpl	$-1, %ecx
	movq	%rdi, 8(%rsp)
	movl	%ecx, 20(%rsp)
	je	.L699
.L608:
	movl	20(%rsp), %edx
	subl	%ebp, %edx
	movl	%edx, %ebx
	shrl	$31, %ebx
	addl	%ebx, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %ebx
	cmpl	%ebx, %ebp
	je	.L607
	movl	%eax, %edi
	movl	%ebx, %r14d
	xorl	$1, %edi
	cmpl	$-1, %ebx
	movb	%dil, 32(%rsp)
	je	.L700
.L611:
	movl	%r14d, %edx
	subl	%ebp, %edx
	movl	%edx, %r12d
	shrl	$31, %r12d
	addl	%r12d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r12d
	cmpl	%r12d, %ebp
	je	.L701
	cmpl	$-1, %r12d
	movl	%r12d, %r8d
	je	.L702
.L614:
	movl	%r8d, %edx
	subl	%ebp, %edx
	movl	%edx, %r13d
	shrl	$31, %r13d
	addl	%r13d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r13d
	cmpl	%r13d, %ebp
	je	.L703
	cmpl	$-1, %r13d
	movl	%r13d, %r10d
	je	.L704
.L617:
	movl	%r10d, %edx
	subl	%ebp, %edx
	movl	%edx, %r15d
	shrl	$31, %r15d
	addl	%r15d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r15d
	cmpl	%r15d, %ebp
	je	.L705
	cmpl	$-1, %r15d
	movl	%r15d, %r11d
	je	.L706
.L620:
	movl	%r11d, %edx
	subl	%ebp, %edx
	movl	%edx, %r9d
	shrl	$31, %r9d
	addl	%r9d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r9d
	cmpl	%r9d, %ebp
	je	.L707
	movl	%eax, 24(%rsp)
	movzbl	32(%rsp), %eax
	movl	%r9d, %ecx
	movq	8(%rsp), %rdi
	movl	%ebp, %edx
	movl	%r10d, 48(%rsp)
	movl	%r8d, 44(%rsp)
	movl	%r11d, 40(%rsp)
	movl	%r9d, 28(%rsp)
	movl	%eax, %esi
	movl	%eax, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	24(%rsp), %eax
	movl	40(%rsp), %r11d
	movl	28(%rsp), %r9d
	movq	8(%rsp), %rdi
	movzbl	%al, %eax
	movl	%r11d, %ecx
	movl	%eax, %esi
	movl	%r9d, %edx
	movl	%eax, 24(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %r11d
	leal	1(%rbp), %eax
	movl	44(%rsp), %r8d
	movl	48(%rsp), %r10d
	movl	%eax, 28(%rsp)
	cmpl	%eax, %r11d
	jle	.L622
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r11d, %ecx
	movl	%ebp, %edx
	movl	%r10d, 44(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	44(%rsp), %r10d
	movl	40(%rsp), %r8d
.L622:
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%r15d, %edx
	movl	%r8d, 44(%rsp)
	movl	%r10d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %r10d
	cmpl	28(%rsp), %r10d
	movl	44(%rsp), %r8d
	jle	.L619
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%ebp, %edx
	movl	%r8d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	40(%rsp), %r8d
	jmp	.L619
	.p2align 4,,10
	.p2align 3
.L607:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L701:
	.cfi_restore_state
	leal	1(%rbp), %esi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	movl	%esi, 28(%rsp)
.L613:
	movl	20(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, %r12d
	je	.L708
.L639:
	movl	%r12d, %eax
	subl	%ebx, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%r14d, %eax
	sarl	%eax
	leal	(%rax,%rbx), %r14d
	cmpl	%r14d, %ebx
	je	.L641
	cmpl	$-1, %r14d
	movl	%r14d, %r13d
	je	.L709
.L642:
	movl	%r13d, %eax
	subl	%ebx, %eax
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%r15d, %eax
	sarl	%eax
	leal	(%rax,%rbx), %r15d
	cmpl	%r15d, %ebx
	je	.L710
	cmpl	$-1, %r15d
	movl	%r15d, %r9d
	je	.L711
.L645:
	movl	%r9d, %eax
	subl	%ebx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebx, %eax
	cmpl	%eax, %ebx
	je	.L712
	movzbl	32(%rsp), %edi
	movl	%eax, %ecx
	movl	%ebx, %edx
	movl	%r9d, 44(%rsp)
	movl	%eax, 36(%rsp)
	movl	%edi, %esi
	movl	%edi, 40(%rsp)
	movq	8(%rsp), %rdi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	44(%rsp), %r9d
	movl	36(%rsp), %eax
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	44(%rsp), %r9d
	leal	1(%rbx), %eax
	movl	%eax, 36(%rsp)
	cmpl	%eax, %r9d
	jle	.L647
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%ebx, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L647:
	cmpl	$-1, %r13d
	movl	%r13d, %r9d
	je	.L713
.L648:
	movl	%r9d, %eax
	movl	%r9d, 44(%rsp)
	subl	%r15d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r15d, %eax
	cmpl	%eax, %r15d
	je	.L650
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r15d, %edx
	movl	%eax, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	44(%rsp), %r9d
	movl	48(%rsp), %eax
	movl	40(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	44(%rsp), %r9d
	leal	1(%r15), %eax
	cmpl	%eax, %r9d
	jle	.L650
	movl	40(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r15d, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L650:
	cmpl	36(%rsp), %r13d
	jle	.L644
	movl	40(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%ebx, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L644:
	cmpl	$-1, %r12d
	movl	%r12d, %r11d
	je	.L714
.L652:
	movl	%r11d, %eax
	subl	%r14d, %eax
	movl	%eax, %r13d
	shrl	$31, %r13d
	addl	%r13d, %eax
	sarl	%eax
	leal	(%rax,%r14), %r13d
	cmpl	%r13d, %r14d
	je	.L654
	cmpl	$-1, %r13d
	movl	%r13d, %r8d
	je	.L715
.L655:
	movl	%r8d, %eax
	subl	%r14d, %eax
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%r15d, %eax
	sarl	%eax
	leal	(%rax,%r14), %r15d
	cmpl	%r15d, %r14d
	je	.L716
	cmpl	$-1, %r15d
	movl	%r15d, %r9d
	je	.L717
.L658:
	movl	%r9d, %eax
	subl	%r14d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r14d, %eax
	cmpl	%eax, %r14d
	je	.L718
	movzbl	32(%rsp), %edi
	movl	%eax, %ecx
	movl	%r14d, %edx
	movl	%r8d, 56(%rsp)
	movl	%r11d, 52(%rsp)
	movl	%r9d, 48(%rsp)
	movl	%eax, 40(%rsp)
	movl	%edi, %esi
	movl	%edi, 44(%rsp)
	movq	8(%rsp), %rdi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	48(%rsp), %r9d
	movl	40(%rsp), %eax
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	48(%rsp), %r9d
	leal	1(%r14), %eax
	movl	52(%rsp), %r11d
	movl	56(%rsp), %r8d
	movl	%eax, 40(%rsp)
	cmpl	%eax, %r9d
	jle	.L660
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r14d, %edx
	movl	%r8d, 52(%rsp)
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	52(%rsp), %r8d
	movl	48(%rsp), %r11d
.L660:
	cmpl	$-1, %r8d
	movl	%r8d, %r9d
	je	.L719
.L661:
	movl	%r9d, %eax
	movl	%r9d, 48(%rsp)
	subl	%r15d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r15d, %eax
	cmpl	%eax, %r15d
	je	.L663
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r15d, %edx
	movl	%r8d, 60(%rsp)
	movl	%r11d, 56(%rsp)
	movl	%eax, 52(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	48(%rsp), %r9d
	movl	52(%rsp), %eax
	movl	44(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	48(%rsp), %r9d
	leal	1(%r15), %eax
	movl	56(%rsp), %r11d
	movl	60(%rsp), %r8d
	cmpl	%eax, %r9d
	jle	.L663
	movl	44(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r15d, %edx
	movl	%r8d, 52(%rsp)
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	52(%rsp), %r8d
	movl	48(%rsp), %r11d
.L663:
	cmpl	%r8d, 40(%rsp)
	jge	.L657
	movl	44(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r14d, %edx
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	48(%rsp), %r11d
.L657:
	cmpl	$-1, %r11d
	movl	%r11d, %r10d
	je	.L720
.L665:
	movl	%r10d, %eax
	subl	%r13d, %eax
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%r15d, %eax
	sarl	%eax
	leal	(%rax,%r13), %r15d
	cmpl	%r15d, %r13d
	je	.L667
	cmpl	$-1, %r15d
	movl	%r15d, %r8d
	je	.L721
.L668:
	movl	%r8d, %eax
	subl	%r13d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r13d, %eax
	cmpl	%eax, %r13d
	je	.L722
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r13d, %edx
	movl	%r10d, 60(%rsp)
	movl	%r11d, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movl	%eax, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movzbl	32(%rsp), %r9d
	movl	48(%rsp), %r8d
	movl	44(%rsp), %eax
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r8d, 52(%rsp)
	movl	%eax, %edx
	movl	%r9d, %esi
	movl	%r9d, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	52(%rsp), %r8d
	leal	1(%r13), %eax
	movl	48(%rsp), %r9d
	movl	56(%rsp), %r11d
	movl	60(%rsp), %r10d
	movl	%eax, 44(%rsp)
	cmpl	%eax, %r8d
	jle	.L670
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r13d, %edx
	movl	%r9d, %esi
	movl	%r10d, 52(%rsp)
	movl	%r11d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	52(%rsp), %r10d
	movl	48(%rsp), %r11d
.L670:
	cmpl	$-1, %r10d
	movl	%r10d, %r8d
	je	.L723
.L671:
	movl	%r8d, %eax
	movl	%r8d, 48(%rsp)
	subl	%r15d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r15d, %eax
	cmpl	%eax, %r15d
	je	.L673
	movzbl	32(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r15d, %edx
	movl	%r10d, 60(%rsp)
	movl	%r11d, 56(%rsp)
	movl	%eax, 52(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	48(%rsp), %r8d
	movl	52(%rsp), %eax
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%eax, %edx
	movl	%r8d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r8d
	leal	1(%r15), %eax
	movl	56(%rsp), %r11d
	movl	60(%rsp), %r10d
	cmpl	%eax, %r8d
	jle	.L673
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r15d, %edx
	movl	%r10d, 48(%rsp)
	movl	%r11d, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	48(%rsp), %r10d
	movl	32(%rsp), %r11d
.L673:
	cmpl	%r10d, 44(%rsp)
	jge	.L667
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%r13d, %edx
	movl	%r11d, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	32(%rsp), %r11d
.L667:
	cmpl	40(%rsp), %r11d
	jle	.L654
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r11d, %ecx
	movl	%r14d, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L654:
	cmpl	36(%rsp), %r12d
	jle	.L641
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r12d, %ecx
	movl	%ebx, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L641:
	movl	28(%rsp), %esi
	cmpl	%esi, 20(%rsp)
	jle	.L607
	movl	20(%rsp), %ecx
	movl	24(%rsp), %esi
	movl	%ebp, %edx
	movq	8(%rsp), %rdi
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	.p2align 4,,10
	.p2align 3
.L699:
	.cfi_restore_state
	movl	44(%rdi), %edi
	movl	%edi, 20(%rsp)
	jmp	.L608
	.p2align 4,,10
	.p2align 3
.L700:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r14d
	jmp	.L611
	.p2align 4,,10
	.p2align 3
.L705:
	movzbl	32(%rsp), %edi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	movl	%edi, 36(%rsp)
	leal	1(%rbp), %edi
	movl	%edi, 28(%rsp)
.L619:
	cmpl	$-1, %r8d
	movl	%r8d, %eax
	je	.L724
.L623:
	movl	%eax, %edx
	movl	%eax, 40(%rsp)
	subl	%r13d, %edx
	movl	%edx, %r15d
	shrl	$31, %r15d
	addl	%r15d, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r15d
	cmpl	%r15d, %r13d
	je	.L625
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movl	%r13d, %edx
	movl	%r8d, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %eax
	movl	24(%rsp), %esi
	movl	%r15d, %edx
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %eax
	leal	1(%r13), %edx
	movl	44(%rsp), %r8d
	cmpl	%edx, %eax
	jle	.L625
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r13d, %edx
	movl	%r8d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	40(%rsp), %r8d
.L625:
	cmpl	28(%rsp), %r8d
	jle	.L616
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%ebp, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L616:
	cmpl	$-1, %r14d
	movl	%r14d, %eax
	je	.L725
.L627:
	movl	%eax, %edx
	subl	%r12d, %edx
	movl	%edx, %r13d
	shrl	$31, %r13d
	addl	%r13d, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r13d
	cmpl	%r13d, %r12d
	je	.L629
	cmpl	$-1, %r13d
	movl	%r13d, %r15d
	je	.L726
.L630:
	movl	%r15d, %edx
	leal	1(%r12), %r9d
	subl	%r12d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%r8d, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r8d
	cmpl	%r8d, %r12d
	je	.L632
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r12d, %edx
	movl	%eax, 44(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %r8d
	movl	24(%rsp), %esi
	movl	%r15d, %ecx
	movq	8(%rsp), %rdi
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	leal	1(%r12), %r9d
	movl	44(%rsp), %eax
	cmpl	%r9d, %r15d
	jle	.L632
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movl	%r12d, %edx
	movl	%r9d, 44(%rsp)
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	44(%rsp), %r9d
	movl	40(%rsp), %eax
.L632:
	cmpl	$-1, %eax
	movl	%eax, %r8d
	je	.L727
.L633:
	movl	%r8d, %edx
	movl	%r8d, 40(%rsp)
	subl	%r13d, %edx
	movl	%edx, %r15d
	shrl	$31, %r15d
	addl	%r15d, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r15d
	cmpl	%r15d, %r13d
	je	.L635
	movl	24(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movl	%r13d, %edx
	movl	%r9d, 48(%rsp)
	movl	%eax, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %r8d
	movl	36(%rsp), %esi
	movl	%r15d, %edx
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %r8d
	leal	1(%r13), %edx
	movl	44(%rsp), %eax
	movl	48(%rsp), %r9d
	cmpl	%edx, %r8d
	jle	.L635
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r13d, %edx
	movl	%r9d, 44(%rsp)
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	44(%rsp), %r9d
	movl	40(%rsp), %eax
.L635:
	cmpl	%r9d, %eax
	jle	.L629
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r12d, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L629:
	cmpl	28(%rsp), %r14d
	jle	.L613
	movl	36(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebp, %edx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	20(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, %r12d
	jne	.L639
.L708:
	movq	8(%rsp), %rax
	movl	44(%rax), %r12d
	jmp	.L639
	.p2align 4,,10
	.p2align 3
.L712:
	movzbl	32(%rsp), %eax
	movl	%eax, 40(%rsp)
	leal	1(%rbx), %eax
	movl	%eax, 36(%rsp)
	jmp	.L647
	.p2align 4,,10
	.p2align 3
.L711:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L645
	.p2align 4,,10
	.p2align 3
.L704:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r10d
	jmp	.L617
	.p2align 4,,10
	.p2align 3
.L703:
	movzbl	%al, %eax
	cmpl	$-1, %r14d
	movl	%eax, 24(%rsp)
	leal	1(%rbp), %eax
	movl	%eax, 28(%rsp)
	movzbl	32(%rsp), %eax
	movl	%eax, 36(%rsp)
	movl	%r14d, %eax
	jne	.L627
.L725:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L627
	.p2align 4,,10
	.p2align 3
.L710:
	leal	1(%rbx), %eax
	cmpl	$-1, %r12d
	movl	%r12d, %r11d
	movl	%eax, 36(%rsp)
	jne	.L652
.L714:
	movq	8(%rsp), %rax
	movl	44(%rax), %r11d
	jmp	.L652
	.p2align 4,,10
	.p2align 3
.L702:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	jmp	.L614
	.p2align 4,,10
	.p2align 3
.L709:
	movq	8(%rsp), %rax
	movl	44(%rax), %r13d
	jmp	.L642
	.p2align 4,,10
	.p2align 3
.L716:
	leal	1(%r14), %eax
	movl	%eax, 40(%rsp)
	jmp	.L657
	.p2align 4,,10
	.p2align 3
.L715:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L655
	.p2align 4,,10
	.p2align 3
.L720:
	movq	8(%rsp), %rax
	movl	44(%rax), %r10d
	jmp	.L665
	.p2align 4,,10
	.p2align 3
.L727:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	jmp	.L633
	.p2align 4,,10
	.p2align 3
.L726:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r15d
	jmp	.L630
	.p2align 4,,10
	.p2align 3
.L724:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L623
	.p2align 4,,10
	.p2align 3
.L713:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L648
	.p2align 4,,10
	.p2align 3
.L718:
	movzbl	32(%rsp), %eax
	movl	%eax, 44(%rsp)
	leal	1(%r14), %eax
	movl	%eax, 40(%rsp)
	jmp	.L660
	.p2align 4,,10
	.p2align 3
.L707:
	movzbl	32(%rsp), %esi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	leal	1(%rbp), %eax
	movl	%eax, 28(%rsp)
	movl	%esi, 36(%rsp)
	jmp	.L622
	.p2align 4,,10
	.p2align 3
.L722:
	leal	1(%r13), %eax
	movl	%eax, 44(%rsp)
	jmp	.L670
	.p2align 4,,10
	.p2align 3
.L723:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L671
	.p2align 4,,10
	.p2align 3
.L721:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L668
	.p2align 4,,10
	.p2align 3
.L719:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L661
	.p2align 4,,10
	.p2align 3
.L706:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r11d
	jmp	.L620
	.p2align 4,,10
	.p2align 3
.L717:
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
	jmp	.L658
	.cfi_endproc
.LFE2040:
	.size	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii, .-_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	.section	.text.unlikely._Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii,comdat
.LCOLDE20:
	.section	.text._Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii,"axG",@progbits,_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii,comdat
.LHOTE20:
	.section	.rodata.str1.1
.LC21:
	.string	"dest_i < m"
.LC22:
	.string	"IncludeL3/sort.h"
	.section	.text.unlikely._Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei,"axG",@progbits,_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei,comdat
.LCOLDB23:
	.section	.text._Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei,"axG",@progbits,_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei,comdat
.LHOTB23:
	.p2align 4,,15
	.weak	_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei
	.hidden	_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei
	.type	_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei, @function
_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei:
.LFB2016:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movl	44(%rdi), %r12d
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	movl	%esi, 52(%rsp)
	movl	%r12d, %ebx
	shrl	$31, %ebx
	addl	%r12d, %ebx
	sarl	%ebx
	je	.L730
	cmpl	$-1, %ebx
	je	.L964
	leal	3(%r12), %ebp
	testl	%r12d, %r12d
	cmovns	%r12d, %ebp
	sarl	$2, %ebp
	testl	%ebp, %ebp
	je	.L733
	cmpl	$-1, %ebp
	je	.L965
	leal	7(%r12), %r13d
	testl	%r12d, %r12d
	movl	%ebx, 16(%rsp)
	cmovns	%r12d, %r13d
	sarl	$3, %r13d
	testl	%r13d, %r13d
	jne	.L1047
.L735:
	movl	16(%rsp), %edi
	movl	%edi, %eax
	movl	%edi, (%rsp)
	subl	%ebp, %eax
	movl	%eax, %r13d
	shrl	$31, %r13d
	addl	%eax, %r13d
	sarl	%r13d
	addl	%ebp, %r13d
	cmpl	%ebp, %r13d
	je	.L787
.L786:
	cmpl	$-1, %r13d
	movl	%r13d, 8(%rsp)
	je	.L1048
.L788:
	movl	8(%rsp), %eax
	subl	%ebp, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%eax, %r14d
	sarl	%r14d
	addl	%ebp, %r14d
	cmpl	%ebp, %r14d
	je	.L1049
	cmpl	$-1, %r14d
	movl	%r14d, 24(%rsp)
	je	.L1050
.L791:
	movl	24(%rsp), %eax
	subl	%ebp, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebp, %eax
	cmpl	%ebp, %eax
	je	.L1051
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1052
.L794:
	movl	%r10d, %edx
	subl	%ebp, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%ebp, %r8d
	cmpl	%ebp, %r8d
	je	.L1053
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movl	%ebp, %edx
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	movl	%r10d, 28(%rsp)
	movl	%r8d, 20(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r10d
	movl	20(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r10d
	leal	1(%rbp), %eax
	movl	%eax, 20(%rsp)
	cmpl	%eax, %r10d
	movl	32(%rsp), %eax
	jg	.L1054
.L796:
	movl	24(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1055
.L797:
	movl	%r10d, %edx
	movl	%r10d, 28(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L799
	movl	%eax, %edx
	movl	%r8d, %ecx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	movl	%r8d, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r10d
	movl	36(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %eax
	movl	28(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jg	.L1056
.L799:
	movl	20(%rsp), %edi
	cmpl	%edi, 24(%rsp)
	jle	.L793
	movl	24(%rsp), %ecx
	movl	%ebp, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L793:
	movl	8(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, 24(%rsp)
	je	.L1057
.L801:
	subl	%r14d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r14d, %eax
	cmpl	%eax, %r14d
	je	.L803
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1058
.L804:
	movl	%r10d, %edx
	subl	%r14d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%r14d, %r8d
	cmpl	%r8d, %r14d
	je	.L1059
	movl	%r8d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r10d, 32(%rsp)
	movl	%r8d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	movl	28(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	leal	1(%r14), %eax
	movl	%eax, 28(%rsp)
	cmpl	%eax, %r10d
	movl	36(%rsp), %eax
	jg	.L1060
.L806:
	movl	24(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1061
.L807:
	movl	%r10d, %edx
	movl	%r10d, 32(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L809
	movl	%eax, %edx
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	movl	40(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %eax
	movl	32(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jg	.L1062
.L809:
	movl	28(%rsp), %edi
	cmpl	%edi, 24(%rsp)
	jle	.L803
	movl	24(%rsp), %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L803:
	movl	20(%rsp), %edi
	cmpl	%edi, 8(%rsp)
	jle	.L790
	movl	8(%rsp), %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	jmp	.L790
.L1049:
	leal	1(%rbp), %eax
	movl	%eax, 20(%rsp)
.L790:
	movl	(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, 8(%rsp)
	je	.L1063
.L812:
	subl	%r13d, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%eax, %r14d
	sarl	%r14d
	addl	%r13d, %r14d
	cmpl	%r13d, %r14d
	je	.L814
	cmpl	$-1, %r14d
	movl	%r14d, 24(%rsp)
	je	.L1064
.L815:
	movl	24(%rsp), %eax
	subl	%r13d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r13d, %eax
	cmpl	%r13d, %eax
	je	.L1065
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1066
.L818:
	movl	%r10d, %edx
	subl	%r13d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%r13d, %r8d
	cmpl	%r13d, %r8d
	je	.L1067
	movl	%r8d, %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r10d, 32(%rsp)
	movl	%r8d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	movl	28(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	leal	1(%r13), %eax
	movl	%eax, 28(%rsp)
	cmpl	%eax, %r10d
	movl	36(%rsp), %eax
	jle	.L820
	movl	%r10d, %ecx
	movl	%r13d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	32(%rsp), %eax
.L820:
	movl	24(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1068
.L821:
	movl	%r10d, %edx
	movl	%r10d, 32(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L823
	movl	%eax, %edx
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	movl	40(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %eax
	movl	32(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jle	.L823
	movl	%r10d, %ecx
	movl	%eax, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L823:
	movl	28(%rsp), %edi
	cmpl	%edi, 24(%rsp)
	jle	.L817
	movl	24(%rsp), %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L817:
	movl	8(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, 24(%rsp)
	je	.L1069
.L825:
	subl	%r14d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r14d, %eax
	cmpl	%eax, %r14d
	je	.L827
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1070
.L828:
	movl	%r10d, %edx
	subl	%r14d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%r14d, %r8d
	cmpl	%r8d, %r14d
	je	.L1071
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movl	%r14d, %edx
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	movl	%r10d, 36(%rsp)
	movl	%r8d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %r10d
	movl	32(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %r10d
	leal	1(%r14), %eax
	movl	%eax, 32(%rsp)
	cmpl	%eax, %r10d
	movl	40(%rsp), %eax
	jle	.L830
	movl	%r10d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	36(%rsp), %eax
.L830:
	movl	24(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1072
.L831:
	movl	%r10d, %edx
	movl	%r10d, 36(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L833
	movl	%eax, %edx
	movl	%r8d, %ecx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	movl	%r8d, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %r10d
	movl	44(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %eax
	movl	36(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jle	.L833
	movl	%r10d, %ecx
	movl	%eax, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L833:
	movl	32(%rsp), %edi
	cmpl	%edi, 24(%rsp)
	jle	.L827
	movl	24(%rsp), %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L827:
	movl	8(%rsp), %edi
	cmpl	%edi, 28(%rsp)
	jge	.L814
	movl	%edi, %ecx
	movl	%r13d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L814:
	movl	(%rsp), %edi
	cmpl	%edi, 20(%rsp)
	jge	.L787
	movl	%edi, %ecx
	movl	%ebp, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L787:
	movl	16(%rsp), %eax
	cmpl	$1, %eax
	jle	.L733
	movl	%eax, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L733:
	cmpl	$-1, %r12d
	je	.L1073
	movl	%r12d, %eax
	movl	%r12d, 16(%rsp)
	subl	%ebx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%rbx), %ebp
	cmpl	%ebp, %ebx
	je	.L841
	cmpl	$-1, %ebp
	movl	%ebp, 8(%rsp)
	je	.L1074
.L842:
	movl	8(%rsp), %eax
	subl	%ebx, %eax
	movl	%eax, %r13d
	shrl	$31, %r13d
	addl	%eax, %r13d
	sarl	%r13d
	addl	%ebx, %r13d
	cmpl	%r13d, %ebx
	je	.L1075
	cmpl	$-1, %r13d
	movl	%r13d, 20(%rsp)
	jne	.L845
	movl	44(%r15), %eax
	movl	%eax, 20(%rsp)
.L845:
	movl	20(%rsp), %eax
	subl	%ebx, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%eax, %r14d
	sarl	%r14d
	addl	%ebx, %r14d
	cmpl	%r14d, %ebx
	jne	.L846
	leal	1(%rbx), %eax
	movl	%eax, (%rsp)
.L847:
	movl	8(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, 20(%rsp)
	je	.L1076
.L869:
	subl	%r13d, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%eax, %r14d
	sarl	%r14d
	addl	%r13d, %r14d
	cmpl	%r14d, %r13d
	je	.L871
	cmpl	$-1, %r14d
	movl	%r14d, 24(%rsp)
	je	.L1077
.L872:
	movl	24(%rsp), %eax
	subl	%r13d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r13d, %eax
	cmpl	%eax, %r13d
	je	.L1078
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1079
.L875:
	movl	%r10d, %edx
	subl	%r13d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%r13d, %r8d
	cmpl	%r8d, %r13d
	je	.L1080
	movl	%r8d, %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r10d, 32(%rsp)
	movl	%r8d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	movl	28(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	leal	1(%r13), %eax
	movl	%eax, 28(%rsp)
	cmpl	%eax, %r10d
	movl	36(%rsp), %eax
	jle	.L877
	movl	%r10d, %ecx
	movl	%r13d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	32(%rsp), %eax
.L877:
	movl	24(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1081
.L878:
	movl	%r10d, %edx
	movl	%r10d, 32(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L880
	movl	%eax, %edx
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	movl	40(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %eax
	movl	32(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jle	.L880
	movl	%r10d, %ecx
	movl	%eax, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L880:
	movl	28(%rsp), %edi
	cmpl	%edi, 24(%rsp)
	jle	.L874
	movl	24(%rsp), %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L874:
	movl	20(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, 24(%rsp)
	je	.L1082
.L882:
	subl	%r14d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r14d, %eax
	cmpl	%eax, %r14d
	je	.L884
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1083
.L885:
	movl	%r10d, %edx
	subl	%r14d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%r14d, %r8d
	cmpl	%r8d, %r14d
	je	.L1084
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movl	%r14d, %edx
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	movl	%r10d, 36(%rsp)
	movl	%r8d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %r10d
	movl	32(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %r10d
	leal	1(%r14), %eax
	movl	%eax, 32(%rsp)
	cmpl	%eax, %r10d
	movl	40(%rsp), %eax
	jle	.L887
	movl	%r10d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	36(%rsp), %eax
.L887:
	movl	24(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1085
.L888:
	movl	%r10d, %edx
	movl	%r10d, 36(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L890
	movl	%eax, %edx
	movl	%r8d, %ecx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	movl	%r8d, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %r10d
	movl	44(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %eax
	movl	36(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jle	.L890
	movl	%r10d, %ecx
	movl	%eax, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L890:
	movl	24(%rsp), %edi
	cmpl	%edi, 32(%rsp)
	jge	.L884
	movl	%edi, %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L884:
	movl	28(%rsp), %edi
	cmpl	%edi, 20(%rsp)
	jle	.L871
	movl	20(%rsp), %ecx
	movl	%r13d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L871:
	movl	8(%rsp), %edi
	cmpl	%edi, (%rsp)
	jge	.L844
	movl	%edi, %ecx
	movl	%ebx, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L844:
	movl	16(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, 8(%rsp)
	je	.L1086
.L894:
	subl	%ebp, %eax
	movl	%eax, %r13d
	shrl	$31, %r13d
	addl	%eax, %r13d
	sarl	%r13d
	addl	%ebp, %r13d
	cmpl	%ebp, %r13d
	je	.L896
	cmpl	$-1, %r13d
	movl	%r13d, 24(%rsp)
	je	.L1087
.L897:
	movl	24(%rsp), %eax
	subl	%ebp, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%eax, %r14d
	sarl	%r14d
	addl	%ebp, %r14d
	cmpl	%ebp, %r14d
	je	.L1088
	cmpl	$-1, %r14d
	movl	%r14d, 28(%rsp)
	je	.L1089
.L900:
	movl	28(%rsp), %eax
	subl	%ebp, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebp, %eax
	cmpl	%ebp, %eax
	je	.L1090
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1091
.L903:
	movl	%r10d, %edx
	subl	%ebp, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%ebp, %r8d
	cmpl	%ebp, %r8d
	je	.L1092
	movl	%r8d, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r10d, 32(%rsp)
	movl	%r8d, 20(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	movl	20(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	leal	1(%rbp), %eax
	movl	%eax, 20(%rsp)
	cmpl	%eax, %r10d
	movl	36(%rsp), %eax
	jle	.L905
	movl	%r10d, %ecx
	movl	%ebp, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	32(%rsp), %eax
.L905:
	movl	28(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1093
.L906:
	movl	%r10d, %edx
	movl	%r10d, 32(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L908
	movl	%eax, %edx
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	movl	40(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %eax
	movl	32(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jle	.L908
	movl	%r10d, %ecx
	movl	%eax, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L908:
	movl	28(%rsp), %edi
	cmpl	%edi, 20(%rsp)
	jge	.L902
	movl	%edi, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L902:
	movl	24(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, 28(%rsp)
	je	.L1094
.L910:
	subl	%r14d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r14d, %eax
	cmpl	%eax, %r14d
	je	.L912
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1095
.L913:
	movl	%r10d, %edx
	subl	%r14d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%r14d, %r8d
	cmpl	%r8d, %r14d
	je	.L1096
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movl	%r14d, %edx
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	movl	%r10d, 36(%rsp)
	movl	%r8d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %r10d
	movl	32(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %r10d
	leal	1(%r14), %eax
	movl	%eax, 32(%rsp)
	cmpl	%eax, %r10d
	movl	40(%rsp), %eax
	jle	.L915
	movl	%r10d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	36(%rsp), %eax
.L915:
	movl	28(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1097
.L916:
	movl	%r10d, %edx
	movl	%r10d, 36(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L918
	movl	%eax, %edx
	movl	%r8d, %ecx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	movl	%r8d, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %r10d
	movl	44(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %eax
	movl	36(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jle	.L918
	movl	%r10d, %ecx
	movl	%eax, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L918:
	movl	28(%rsp), %edi
	cmpl	%edi, 32(%rsp)
	jge	.L912
	movl	%edi, %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L912:
	movl	24(%rsp), %edi
	cmpl	%edi, 20(%rsp)
	jge	.L899
	movl	%edi, %ecx
	movl	%ebp, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L899:
	movl	8(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, 24(%rsp)
	je	.L1098
.L921:
	subl	%r13d, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%eax, %r14d
	sarl	%r14d
	addl	%r13d, %r14d
	cmpl	%r14d, %r13d
	je	.L923
	cmpl	$-1, %r14d
	movl	%r14d, 28(%rsp)
	je	.L1099
.L924:
	movl	28(%rsp), %eax
	subl	%r13d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r13d, %eax
	cmpl	%eax, %r13d
	je	.L1100
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1101
.L927:
	movl	%r10d, %edx
	subl	%r13d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%r13d, %r8d
	cmpl	%r8d, %r13d
	je	.L1102
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movl	%r13d, %edx
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	movl	%r10d, 36(%rsp)
	movl	%r8d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %r10d
	movl	32(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %r10d
	leal	1(%r13), %eax
	movl	%eax, 32(%rsp)
	cmpl	%eax, %r10d
	movl	40(%rsp), %eax
	jle	.L929
	movl	%r10d, %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	36(%rsp), %eax
.L929:
	movl	28(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1103
.L930:
	movl	%r10d, %edx
	movl	%r10d, 36(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L932
	movl	%eax, %edx
	movl	%r8d, %ecx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	movl	%r8d, 44(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %r10d
	movl	44(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %eax
	movl	36(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jle	.L932
	movl	%r10d, %ecx
	movl	%eax, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L932:
	movl	28(%rsp), %edi
	cmpl	%edi, 32(%rsp)
	jge	.L926
	movl	%edi, %ecx
	movl	%r13d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L926:
	movl	24(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, 28(%rsp)
	je	.L1104
.L934:
	subl	%r14d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r14d, %eax
	cmpl	%eax, %r14d
	je	.L936
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1105
.L937:
	movl	%r10d, %edx
	subl	%r14d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%r14d, %r8d
	cmpl	%r8d, %r14d
	je	.L1106
	movl	%r8d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 44(%rsp)
	movl	%r10d, 40(%rsp)
	movl	%r8d, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %r10d
	movl	36(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %r10d
	leal	1(%r14), %eax
	movl	%eax, 36(%rsp)
	cmpl	%eax, %r10d
	movl	44(%rsp), %eax
	jle	.L939
	movl	%r10d, %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	40(%rsp), %eax
.L939:
	movl	28(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1107
.L940:
	movl	%r10d, %edx
	movl	%r10d, 40(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L942
	movl	%eax, %edx
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 44(%rsp)
	movl	%r8d, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	40(%rsp), %r10d
	movl	48(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	44(%rsp), %eax
	movl	40(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jle	.L942
	movl	%r10d, %ecx
	movl	%eax, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L942:
	movl	36(%rsp), %edi
	cmpl	%edi, 28(%rsp)
	jle	.L936
	movl	28(%rsp), %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L936:
	movl	32(%rsp), %edi
	cmpl	%edi, 24(%rsp)
	jle	.L923
	movl	24(%rsp), %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L923:
	movl	8(%rsp), %edi
	cmpl	%edi, 20(%rsp)
	jge	.L896
	movl	%edi, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L896:
	movl	16(%rsp), %edi
	cmpl	%edi, (%rsp)
	jge	.L841
	movl	%edi, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L841:
	cmpl	$1, %r12d
	jle	.L730
	movl	%r12d, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L730:
	movl	52(%rsp), %ebx
	movq	(%r15), %rdi
	movslq	%ebx, %rsi
	salq	$5, %rsi
	call	realloc@PLT
	movslq	44(%r15), %rcx
	movq	%rax, (%r15)
	cmpl	%ecx, %ebx
	jle	.L948
	movl	52(%rsp), %edx
	xorl	%esi, %esi
	subl	%ecx, %edx
	salq	$5, %rcx
	movslq	%edx, %rdx
	leaq	(%rax,%rcx), %rdi
	salq	$5, %rdx
	call	memset@PLT
.L948:
	movl	52(%rsp), %eax
	movl	$1, %r12d
	cmpl	$1, %eax
	movl	%eax, 44(%r15)
	jle	.L728
	.p2align 4,,10
	.p2align 3
.L1037:
	addl	%r12d, %r12d
	cmpl	%r12d, %eax
	jg	.L1037
	leaq	96(%rsp), %rax
	sarl	%r12d
	movl	%r12d, 16(%rsp)
	movq	%rax, (%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L953:
	movl	52(%rsp), %ebp
	subl	16(%rsp), %ebp
	subl	$1, %ebp
	js	.L961
	movslq	16(%rsp), %rax
	movslq	%ebp, %r8
	salq	$5, %r8
	movq	%r8, %r12
	salq	$5, %rax
	movq	%rax, 56(%rsp)
	jmp	.L962
	.p2align 4,,10
	.p2align 3
.L955:
	movl	16(%rsp), %eax
	movl	44(%r15), %esi
	leal	0(%rbp,%rax), %r14d
	cmpl	%r14d, %esi
	jg	.L956
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
	movl	44(%r15), %esi
.L956:
	movq	56(%rsp), %rax
	movq	(%r15), %rcx
	leaq	(%rax,%r12), %r13
	movq	(%rcx,%r13), %rdx
	movq	%rdx, 96(%rsp)
	movq	8(%rcx,%r13), %rdx
	movq	%rdx, 104(%rsp)
	movq	16(%rcx,%r13), %rdx
	movq	%rdx, 112(%rsp)
	movq	24(%rcx,%r13), %rdx
	movq	%rdx, 120(%rsp)
#APP
# 121 "IncludeL3/sort.h" 1
	# FOAV oblivious_distribute1 i (%ebp)
	# FOAV oblivious_distribute1 j (16(%rsp))
# 0 "" 2
# 122 "IncludeL3/sort.h" 1
	# FOAV oblivious_distribute2 e (64(%rsp))
	# FOAV oblivious_distribute2 e1 (96(%rsp))
# 0 "" 2
# 123 "IncludeL3/sort.h" 1
	# FOAV oblivious_distribute3 dest_i (%ebx)
	# FOAV oblivious_distribute3 e1 (96(%rsp))
# 0 "" 2
#NO_APP
	cmpl	%r14d, %ebx
	movq	(%rsp), %rdx
	cmovl	8(%rsp), %rdx
	cmpl	%esi, %ebp
	movl	(%rdx), %eax
	movl	%eax, 48(%rsp)
	movl	4(%rdx), %eax
	movl	%eax, 44(%rsp)
	movl	8(%rdx), %eax
	movl	%eax, 28(%rsp)
	movl	12(%rdx), %eax
	movl	%eax, 20(%rsp)
	movl	16(%rdx), %eax
	movl	%eax, 32(%rsp)
	movl	20(%rdx), %eax
	movl	%eax, 24(%rsp)
	movl	24(%rdx), %eax
	movl	%eax, 40(%rsp)
	movl	28(%rdx), %eax
	movl	%eax, 36(%rsp)
	jl	.L958
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$93, %esi
	call	__assert@PLT
	movq	(%r15), %rcx
.L958:
	movd	28(%rsp), %xmm1
	leaq	(%rcx,%r12), %rdx
	cmpl	%r14d, %ebx
	movd	20(%rsp), %xmm2
	movd	48(%rsp), %xmm0
	movd	44(%rsp), %xmm3
	punpckldq	%xmm2, %xmm1
	movd	36(%rsp), %xmm4
	punpckldq	%xmm3, %xmm0
	movd	24(%rsp), %xmm5
	punpcklqdq	%xmm1, %xmm0
	movd	40(%rsp), %xmm1
	punpckldq	%xmm4, %xmm1
	movups	%xmm0, (%rdx)
	movd	32(%rsp), %xmm0
	punpckldq	%xmm5, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 16(%rdx)
	movq	8(%rsp), %rdx
	cmovl	(%rsp), %rdx
	cmpl	%r14d, 44(%r15)
	movl	(%rdx), %eax
	movl	%eax, 36(%rsp)
	movl	4(%rdx), %eax
	movl	%eax, 24(%rsp)
	movl	8(%rdx), %eax
	movl	%eax, 28(%rsp)
	movl	12(%rdx), %eax
	movl	%eax, 40(%rsp)
	movl	16(%rdx), %eax
	movl	%eax, 44(%rsp)
	movl	20(%rdx), %eax
	movl	%eax, 32(%rsp)
	movl	24(%rdx), %eax
	movl	%eax, 20(%rsp)
	movl	28(%rdx), %eax
	movl	%eax, 48(%rsp)
	jg	.L960
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$93, %esi
	call	__assert@PLT
	movq	(%r15), %rcx
.L960:
	movd	28(%rsp), %xmm1
	leaq	(%rcx,%r13), %rax
	subl	$1, %ebp
	movd	40(%rsp), %xmm6
	subq	$32, %r12
	cmpl	$-1, %ebp
	movd	36(%rsp), %xmm0
	movd	24(%rsp), %xmm7
	punpckldq	%xmm6, %xmm1
	movd	48(%rsp), %xmm2
	punpckldq	%xmm7, %xmm0
	movd	32(%rsp), %xmm3
	punpcklqdq	%xmm1, %xmm0
	movd	20(%rsp), %xmm1
	punpckldq	%xmm2, %xmm1
	movups	%xmm0, (%rax)
	movd	44(%rsp), %xmm0
	punpckldq	%xmm3, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 16(%rax)
	je	.L961
.L962:
	cmpl	44(%r15), %ebp
	jl	.L954
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
.L954:
	movq	(%r15), %rax
	xorl	%ebx, %ebx
	movq	(%rax,%r12), %rdx
	movq	%rdx, 64(%rsp)
	movq	8(%rax,%r12), %rdx
	movq	%rdx, 72(%rsp)
	movq	16(%rax,%r12), %rdx
	movq	24(%rax,%r12), %rax
	movq	%rdx, 80(%rsp)
	movq	%rax, 88(%rsp)
	mfence
	movl	64(%rsp), %eax
	testl	%eax, %eax
	setne	%bl
	imull	88(%rsp), %ebx
	mfence
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	subl	%eax, %ebx
	cmpl	%ebx, 52(%rsp)
	jg	.L955
	leaq	.LC21(%rip), %rcx
	leaq	_ZZ16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_EiE8__func__(%rip), %rdx
	leaq	.LC22(%rip), %rdi
	movl	$119, %esi
	call	__assert@PLT
	jmp	.L955
	.p2align 4,,10
	.p2align 3
.L961:
	sarl	16(%rsp)
	jne	.L953
.L728:
	movq	136(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L1108
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L964:
	.cfi_restore_state
	movl	%r12d, (%rsp)
	movl	%ebx, %ebp
	movl	%r12d, 16(%rsp)
	movl	%ebx, %r13d
	movl	%ebx, %r14d
	movl	%r12d, 8(%rsp)
.L969:
	movl	%ebx, %r8d
	movl	%r12d, 20(%rsp)
.L737:
	cmpl	$-1, %r8d
	je	.L971
	movl	%r8d, %r10d
	shrl	$31, %r10d
	addl	%r8d, %r10d
	sarl	%r10d
	jne	.L1109
.L740:
	cmpl	$-1, 20(%rsp)
	je	.L1110
	movl	20(%rsp), %r11d
	movl	%r11d, %edx
	subl	%r8d, %edx
	movl	%edx, %r10d
	shrl	$31, %r10d
	addl	%edx, %r10d
	sarl	%r10d
	addl	%r8d, %r10d
	cmpl	%r8d, %r10d
	je	.L745
.L744:
	movl	%r8d, %edx
	movl	%r10d, %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r8d, 28(%rsp)
	movl	%r11d, 24(%rsp)
	movl	%r10d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	24(%rsp), %r11d
	movl	32(%rsp), %r10d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r11d, %ecx
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r8d
	movl	24(%rsp), %r11d
	leal	1(%r8), %edx
	cmpl	%r11d, %edx
	jl	.L1111
.L745:
	movl	20(%rsp), %eax
	cmpl	$1, %eax
	jle	.L738
	movl	%eax, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L738:
	cmpl	$-1, 8(%rsp)
	je	.L1112
	movl	8(%rsp), %eax
	movl	%eax, %edx
	movl	%eax, 20(%rsp)
	subl	%r14d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%r14d, %r8d
	cmpl	%r14d, %r8d
	je	.L750
.L749:
	cmpl	$-1, %r8d
	movl	%r8d, %r11d
	je	.L1113
.L751:
	movl	%r11d, %edx
	subl	%r14d, %edx
	movl	%edx, %r10d
	shrl	$31, %r10d
	addl	%edx, %r10d
	sarl	%r10d
	addl	%r14d, %r10d
	cmpl	%r14d, %r10d
	je	.L1114
	movl	%r10d, %ecx
	xorl	%esi, %esi
	movl	%r14d, %edx
	movq	%r15, %rdi
	movl	%r8d, 32(%rsp)
	movl	%r11d, 28(%rsp)
	movl	%r10d, 24(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r11d
	movl	24(%rsp), %r10d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r11d, %ecx
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r11d
	leal	1(%r14), %eax
	movl	32(%rsp), %r8d
	movl	%eax, 24(%rsp)
	cmpl	%eax, %r11d
	jg	.L1115
.L753:
	movl	20(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, %r11d
	je	.L1116
.L754:
	movl	%r11d, %edx
	movl	%r11d, 28(%rsp)
	subl	%r8d, %edx
	movl	%edx, %r10d
	shrl	$31, %r10d
	addl	%edx, %r10d
	sarl	%r10d
	addl	%r8d, %r10d
	cmpl	%r8d, %r10d
	je	.L756
	movl	%r8d, %edx
	movl	%r10d, %ecx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r8d, 32(%rsp)
	movl	%r10d, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r11d
	movl	36(%rsp), %r10d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r11d, %ecx
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r8d
	movl	28(%rsp), %r11d
	leal	1(%r8), %edx
	cmpl	%edx, %r11d
	jg	.L1117
.L756:
	movl	24(%rsp), %edi
	cmpl	%edi, 20(%rsp)
	jle	.L750
	movl	20(%rsp), %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L750:
	movl	8(%rsp), %eax
	cmpl	$1, %eax
	jle	.L736
	movl	%eax, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L736:
	cmpl	$-1, (%rsp)
	je	.L1118
	movl	(%rsp), %edi
	movl	%edi, %eax
	movl	%edi, 20(%rsp)
	subl	%r13d, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%eax, %r14d
	sarl	%r14d
	addl	%r13d, %r14d
	cmpl	%r13d, %r14d
	je	.L762
.L761:
	cmpl	$-1, %r14d
	movl	%r14d, 8(%rsp)
	je	.L1119
.L763:
	movl	8(%rsp), %eax
	subl	%r13d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r13d, %eax
	cmpl	%r13d, %eax
	je	.L1120
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1121
.L766:
	movl	%r10d, %edx
	subl	%r13d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%r13d, %r8d
	cmpl	%r13d, %r8d
	je	.L1122
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movl	%r13d, %edx
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	movl	%r10d, 28(%rsp)
	movl	%r8d, 24(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r10d
	movl	24(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r10d
	leal	1(%r13), %eax
	movl	%eax, 24(%rsp)
	cmpl	%eax, %r10d
	movl	32(%rsp), %eax
	jg	.L1123
.L768:
	movl	8(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1124
.L769:
	movl	%r10d, %edx
	movl	%r10d, 28(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L771
	movl	%eax, %edx
	movl	%r8d, %ecx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	movl	%r8d, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r10d
	movl	36(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %eax
	movl	28(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jg	.L1125
.L771:
	movl	24(%rsp), %edi
	cmpl	%edi, 8(%rsp)
	jle	.L765
	movl	8(%rsp), %ecx
	movl	%r13d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L765:
	movl	20(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, 8(%rsp)
	je	.L1126
.L773:
	subl	%r14d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r14d, %eax
	cmpl	%r14d, %eax
	je	.L775
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1127
.L776:
	movl	%r10d, %edx
	subl	%r14d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%r14d, %r8d
	cmpl	%r14d, %r8d
	je	.L1128
	movl	%r8d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r10d, 32(%rsp)
	movl	%r8d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	movl	28(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	leal	1(%r14), %eax
	movl	%eax, 28(%rsp)
	cmpl	%eax, %r10d
	movl	36(%rsp), %eax
	jg	.L1129
.L778:
	movl	8(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1130
.L779:
	movl	%r10d, %edx
	movl	%r10d, 32(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L781
	movl	%eax, %edx
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	movl	40(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %eax
	movl	32(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jg	.L1131
.L781:
	movl	28(%rsp), %edi
	cmpl	%edi, 8(%rsp)
	jle	.L775
	movl	8(%rsp), %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L775:
	movl	24(%rsp), %edi
	cmpl	%edi, 20(%rsp)
	jle	.L762
	movl	20(%rsp), %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L762:
	movl	(%rsp), %eax
	cmpl	$1, %eax
	jle	.L760
	movl	%eax, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L760:
	cmpl	$-1, 16(%rsp)
	jne	.L735
	movl	44(%r15), %eax
	movl	%eax, (%rsp)
	subl	%ebp, %eax
	movl	%eax, %r13d
	shrl	$31, %r13d
	addl	%eax, %r13d
	sarl	%r13d
	addl	%ebp, %r13d
	cmpl	%ebp, %r13d
	jne	.L786
	jmp	.L733
.L846:
	cmpl	$-1, %r14d
	movl	%r14d, 24(%rsp)
	je	.L1132
.L848:
	movl	24(%rsp), %eax
	subl	%ebx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebx, %eax
	cmpl	%eax, %ebx
	je	.L1133
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1134
.L851:
	movl	%r10d, %edx
	subl	%ebx, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%ebx, %r8d
	cmpl	%r8d, %ebx
	je	.L1135
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movl	%ebx, %edx
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	movl	%r10d, 28(%rsp)
	movl	%r8d, (%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r10d
	movl	(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r10d
	leal	1(%rbx), %eax
	movl	%eax, (%rsp)
	cmpl	%eax, %r10d
	movl	32(%rsp), %eax
	jg	.L1136
.L853:
	movl	24(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1137
.L854:
	movl	%r10d, %edx
	movl	%r10d, 28(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L856
	movl	%eax, %edx
	movl	%r8d, %ecx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	movl	%r8d, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	28(%rsp), %r10d
	movl	36(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %eax
	movl	28(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jg	.L1138
.L856:
	movl	24(%rsp), %edi
	cmpl	%edi, (%rsp)
	jge	.L850
	movl	%edi, %ecx
	movl	%ebx, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L850:
	movl	20(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, 24(%rsp)
	je	.L1139
.L858:
	subl	%r14d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r14d, %eax
	cmpl	%eax, %r14d
	je	.L860
	cmpl	$-1, %eax
	movl	%eax, %r10d
	je	.L1140
.L861:
	movl	%r10d, %edx
	subl	%r14d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%r14d, %r8d
	cmpl	%r8d, %r14d
	je	.L1141
	movl	%r8d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r10d, 32(%rsp)
	movl	%r8d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	movl	28(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	leal	1(%r14), %eax
	movl	%eax, 28(%rsp)
	cmpl	%eax, %r10d
	movl	36(%rsp), %eax
	jg	.L1142
.L863:
	movl	24(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %r10d
	je	.L1143
.L864:
	movl	%r10d, %edx
	movl	%r10d, 32(%rsp)
	subl	%eax, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%edx, %r8d
	sarl	%r8d
	addl	%eax, %r8d
	cmpl	%r8d, %eax
	je	.L866
	movl	%eax, %edx
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	32(%rsp), %r10d
	movl	40(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	36(%rsp), %eax
	movl	32(%rsp), %r10d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jg	.L1144
.L866:
	movl	24(%rsp), %edi
	cmpl	%edi, 28(%rsp)
	jge	.L860
	movl	%edi, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
.L860:
	movl	20(%rsp), %edi
	cmpl	%edi, (%rsp)
	jge	.L847
	movl	%edi, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	jmp	.L847
.L1048:
	movl	44(%r15), %eax
	movl	%eax, 8(%rsp)
	jmp	.L788
.L1047:
	cmpl	$-1, %r13d
	movl	%ebp, (%rsp)
	je	.L1145
.L734:
	movl	%r13d, %eax
	movl	%ebx, 16(%rsp)
	shrl	$31, %eax
	addl	%r13d, %eax
	sarl	%eax
	testl	%eax, %eax
	movl	%eax, %r14d
	je	.L736
	movl	%r13d, 8(%rsp)
.L731:
	cmpl	$-1, %r14d
	je	.L969
	movl	%r14d, %r8d
	shrl	$31, %r8d
	addl	%r14d, %r8d
	sarl	%r8d
	je	.L738
	movl	%r14d, 20(%rsp)
	jmp	.L737
.L1073:
	movl	44(%r15), %eax
	movl	%eax, 16(%rsp)
	subl	%ebx, %eax
	movl	%eax, %ebp
	shrl	$31, %ebp
	addl	%eax, %ebp
	sarl	%ebp
	addl	%ebx, %ebp
	cmpl	%ebp, %ebx
	je	.L730
	cmpl	$-1, %ebp
	movl	%ebp, 8(%rsp)
	jne	.L842
.L1074:
	movl	44(%r15), %eax
	movl	%eax, 8(%rsp)
	jmp	.L842
.L1075:
	leal	1(%rbx), %eax
	movl	%eax, (%rsp)
	movl	16(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, 8(%rsp)
	jne	.L894
.L1086:
	movl	44(%r15), %eax
	movl	%eax, 8(%rsp)
	jmp	.L894
.L1088:
	leal	1(%rbp), %eax
	movl	%eax, 20(%rsp)
	jmp	.L899
.L1076:
	movl	44(%r15), %eax
	movl	%eax, 20(%rsp)
	jmp	.L869
.L1098:
	movl	44(%r15), %eax
	movl	%eax, 24(%rsp)
	jmp	.L921
.L1118:
	movl	44(%r15), %eax
	movl	%eax, 20(%rsp)
	subl	%r13d, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%eax, %r14d
	sarl	%r14d
	addl	%r13d, %r14d
	cmpl	%r14d, %r13d
	jne	.L761
	jmp	.L760
.L1063:
	movl	44(%r15), %eax
	movl	%eax, 8(%rsp)
	jmp	.L812
.L1087:
	movl	44(%r15), %eax
	movl	%eax, 24(%rsp)
	jmp	.L897
.L1078:
	leal	1(%r13), %eax
	movl	%eax, 28(%rsp)
	jmp	.L874
.L1120:
	leal	1(%r13), %eax
	movl	%eax, 24(%rsp)
	jmp	.L765
.L1100:
	leal	1(%r13), %eax
	movl	%eax, 32(%rsp)
	jmp	.L926
.L1051:
	leal	1(%rbp), %eax
	movl	%eax, 20(%rsp)
	jmp	.L793
.L1090:
	leal	1(%rbp), %eax
	movl	%eax, 20(%rsp)
	jmp	.L902
.L1065:
	leal	1(%r13), %eax
	movl	%eax, 28(%rsp)
	jmp	.L817
.L1133:
	leal	1(%rbx), %eax
	movl	%eax, (%rsp)
	jmp	.L850
.L1132:
	movl	44(%r15), %eax
	movl	%eax, 24(%rsp)
	jmp	.L848
.L1094:
	movl	44(%r15), %eax
	movl	%eax, 28(%rsp)
	jmp	.L910
.L1064:
	movl	44(%r15), %eax
	movl	%eax, 24(%rsp)
	jmp	.L815
.L1104:
	movl	44(%r15), %eax
	movl	%eax, 28(%rsp)
	jmp	.L934
.L1126:
	movl	44(%r15), %eax
	movl	%eax, 8(%rsp)
	jmp	.L773
.L1112:
	movl	44(%r15), %eax
	movl	%eax, 20(%rsp)
	subl	%r14d, %eax
	movl	%eax, %r8d
	shrl	$31, %r8d
	addl	%eax, %r8d
	sarl	%r8d
	addl	%r14d, %r8d
	cmpl	%r8d, %r14d
	jne	.L749
	jmp	.L736
.L1139:
	movl	44(%r15), %eax
	movl	%eax, 24(%rsp)
	jmp	.L858
.L1089:
	movl	44(%r15), %eax
	movl	%eax, 28(%rsp)
	jmp	.L900
.L1082:
	movl	44(%r15), %eax
	movl	%eax, 24(%rsp)
	jmp	.L882
.L1077:
	movl	44(%r15), %eax
	movl	%eax, 24(%rsp)
	jmp	.L872
.L1119:
	movl	44(%r15), %eax
	movl	%eax, 8(%rsp)
	jmp	.L763
.L1099:
	movl	44(%r15), %eax
	movl	%eax, 28(%rsp)
	jmp	.L924
.L1050:
	movl	44(%r15), %eax
	movl	%eax, 24(%rsp)
	jmp	.L791
.L1069:
	movl	44(%r15), %eax
	movl	%eax, 24(%rsp)
	jmp	.L825
.L1057:
	movl	44(%r15), %eax
	movl	%eax, 24(%rsp)
	jmp	.L801
.L1109:
	movl	%r8d, %r11d
.L739:
	movl	%r10d, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r8d, 32(%rsp)
	movl	%r11d, 24(%rsp)
	movl	%r10d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	24(%rsp), %r11d
	movl	28(%rsp), %r10d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r11d, %ecx
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii
	movl	24(%rsp), %r11d
	movl	32(%rsp), %r8d
	cmpl	$1, %r11d
	jle	.L740
	movl	%r11d, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r8d, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	24(%rsp), %r8d
	jmp	.L740
.L1131:
	movl	%r10d, %ecx
	movl	%eax, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	jmp	.L781
.L1129:
	movl	%r10d, %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	32(%rsp), %eax
	jmp	.L778
.L1125:
	movl	%r10d, %ecx
	movl	%eax, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	jmp	.L771
.L1123:
	movl	%r10d, %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 28(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	28(%rsp), %eax
	jmp	.L768
.L1117:
	movl	%r11d, %ecx
	movl	%r8d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	jmp	.L756
.L1115:
	movl	%r11d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r8d, 28(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	28(%rsp), %r8d
	jmp	.L753
.L1062:
	movl	%r10d, %ecx
	movl	%eax, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	jmp	.L809
.L1060:
	movl	%r10d, %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	32(%rsp), %eax
	jmp	.L806
.L1056:
	movl	%r10d, %ecx
	movl	%eax, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	jmp	.L799
.L1144:
	movl	%r10d, %ecx
	movl	%eax, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	jmp	.L866
.L1142:
	movl	%r10d, %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	32(%rsp), %eax
	jmp	.L863
.L1138:
	movl	%r10d, %ecx
	movl	%eax, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	jmp	.L856
.L1111:
	movl	%r11d, %ecx
	movl	%r8d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	jmp	.L745
.L1136:
	movl	%r10d, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 28(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	28(%rsp), %eax
	jmp	.L853
.L1054:
	movl	%r10d, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 28(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_Z13ind_func_compIS1_XadL_ZNS0_9entry_indES1_EEEbT_S3_EEEvP8TraceMemIS3_Ebii.part.16
	movl	28(%rsp), %eax
	jmp	.L796
.L1135:
	leal	1(%rbx), %edi
	movl	%edi, (%rsp)
	jmp	.L853
.L1114:
	leal	1(%r14), %eax
	movl	%eax, 24(%rsp)
	jmp	.L753
.L1071:
	leal	1(%r14), %edi
	movl	%edi, 32(%rsp)
	jmp	.L830
.L1059:
	leal	1(%r14), %edi
	movl	%edi, 28(%rsp)
	jmp	.L806
.L1128:
	leal	1(%r14), %edi
	movl	%edi, 28(%rsp)
	jmp	.L778
.L1122:
	leal	1(%r13), %edi
	movl	%edi, 24(%rsp)
	jmp	.L768
.L1141:
	leal	1(%r14), %edi
	movl	%edi, 28(%rsp)
	jmp	.L863
.L1092:
	leal	1(%rbp), %edi
	movl	%edi, 20(%rsp)
	jmp	.L905
.L1053:
	leal	1(%rbp), %edi
	movl	%edi, 20(%rsp)
	jmp	.L796
.L1080:
	leal	1(%r13), %edi
	movl	%edi, 28(%rsp)
	jmp	.L877
.L1067:
	leal	1(%r13), %edi
	movl	%edi, 28(%rsp)
	jmp	.L820
.L1102:
	leal	1(%r13), %edi
	movl	%edi, 32(%rsp)
	jmp	.L929
.L1106:
	leal	1(%r14), %edi
	movl	%edi, 36(%rsp)
	jmp	.L939
.L1084:
	leal	1(%r14), %edi
	movl	%edi, 32(%rsp)
	jmp	.L887
.L1096:
	leal	1(%r14), %edi
	movl	%edi, 32(%rsp)
	jmp	.L915
.L1095:
	movl	44(%r15), %r10d
	jmp	.L913
.L1097:
	movl	44(%r15), %r10d
	jmp	.L916
.L1093:
	movl	44(%r15), %r10d
	jmp	.L906
.L1140:
	movl	44(%r15), %r10d
	jmp	.L861
.L1137:
	movl	44(%r15), %r10d
	jmp	.L854
.L1110:
	movl	44(%r15), %r11d
	movl	%r11d, %edx
	subl	%r8d, %edx
	movl	%edx, %r10d
	shrl	$31, %r10d
	addl	%edx, %r10d
	sarl	%r10d
	addl	%r8d, %r10d
	cmpl	%r8d, %r10d
	jne	.L744
	jmp	.L738
.L1105:
	movl	44(%r15), %r10d
	jmp	.L937
.L1083:
	movl	44(%r15), %r10d
	jmp	.L885
.L1085:
	movl	44(%r15), %r10d
	jmp	.L888
.L1081:
	movl	44(%r15), %r10d
	jmp	.L878
.L1052:
	movl	44(%r15), %r10d
	jmp	.L794
.L1079:
	movl	44(%r15), %r10d
	jmp	.L875
.L1107:
	movl	44(%r15), %r10d
	jmp	.L940
.L1103:
	movl	44(%r15), %r10d
	jmp	.L930
.L1066:
	movl	44(%r15), %r10d
	jmp	.L818
.L1101:
	movl	44(%r15), %r10d
	jmp	.L927
.L1058:
	movl	44(%r15), %r10d
	jmp	.L804
.L1055:
	movl	44(%r15), %r10d
	jmp	.L797
.L1127:
	movl	44(%r15), %r10d
	jmp	.L776
.L1121:
	movl	44(%r15), %r10d
	jmp	.L766
.L1124:
	movl	44(%r15), %r10d
	jmp	.L769
.L1116:
	movl	44(%r15), %r11d
	jmp	.L754
.L1134:
	movl	44(%r15), %r10d
	jmp	.L851
.L1113:
	movl	44(%r15), %r11d
	jmp	.L751
.L971:
	movl	%ebx, %r10d
	movl	%r12d, %r11d
	jmp	.L739
.L1130:
	movl	44(%r15), %r10d
	jmp	.L779
.L1143:
	movl	44(%r15), %r10d
	jmp	.L864
.L1091:
	movl	44(%r15), %r10d
	jmp	.L903
.L1070:
	movl	44(%r15), %r10d
	jmp	.L828
.L1061:
	movl	44(%r15), %r10d
	jmp	.L807
.L1072:
	movl	44(%r15), %r10d
	jmp	.L831
.L1068:
	movl	44(%r15), %r10d
	jmp	.L821
.L1145:
	movl	%ebx, 16(%rsp)
	movl	%ebx, %r14d
	movl	%r12d, 8(%rsp)
	jmp	.L731
.L965:
	movl	%r12d, (%rsp)
	movl	%ebx, %r13d
	jmp	.L734
.L1108:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE2016:
	.size	_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei, .-_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei
	.section	.text.unlikely._Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei,"axG",@progbits,_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei,comdat
.LCOLDE23:
	.section	.text._Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei,"axG",@progbits,_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei,comdat
.LHOTE23:
	.section	.rodata.str1.1
.LC24:
	.string	"t0.data.size == output_size"
.LC25:
	.string	"IncludeL3/join.h"
.LC26:
	.string	"t1.data.size == output_size"
	.section	.text.unlikely._Z4joinR5TableS0_S0_,"ax",@progbits
.LCOLDB27:
	.section	.text._Z4joinR5TableS0_S0_,"ax",@progbits
.LHOTB27:
	.p2align 4,,15
	.globl	_Z4joinR5TableS0_S0_
	.hidden	_Z4joinR5TableS0_S0_
	.type	_Z4joinR5TableS0_S0_, @function
_Z4joinR5TableS0_S0_:
.LFB1955:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %rax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r15
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	44(%rax), %eax
	movq	%rsi, 64(%rsp)
	movq	%rdi, 8(%rsp)
	movq	%fs:40, %rsi
	movq	%rsi, 168(%rsp)
	xorl	%esi, %esi
	movl	44(%rdx), %esi
	movl	%eax, 52(%rsp)
	addl	%esi, %eax
	movl	%esi, 72(%rsp)
	movl	%eax, 28(%rsp)
	movl	44(%rdi), %eax
	movl	%eax, %esi
	movl	%eax, 24(%rsp)
	shrl	$31, %eax
	addl	%esi, %eax
	sarl	%eax
	movl	%eax, 20(%rsp)
	je	.L1148
	cmpl	$-1, %eax
	je	.L1562
	leal	3(%rsi), %ebp
	testl	%esi, %esi
	cmovns	%esi, %ebp
	sarl	$2, %ebp
	testl	%ebp, %ebp
	je	.L1151
	cmpl	$-1, %ebp
	je	.L1563
	leal	7(%rsi), %r12d
	testl	%esi, %esi
	movl	%eax, 32(%rsp)
	cmovns	%esi, %r12d
	sarl	$3, %r12d
	testl	%r12d, %r12d
	jne	.L1708
.L1153:
	movl	32(%rsp), %edi
	movl	%edi, %eax
	movl	%edi, 36(%rsp)
	subl	%ebp, %eax
	movl	%eax, %ebx
	shrl	$31, %ebx
	addl	%ebx, %eax
	sarl	%eax
	leal	(%rax,%rbp), %ebx
	cmpl	%ebp, %ebx
	je	.L1184
.L1183:
	cmpl	$-1, %ebx
	movl	%ebx, %r14d
	je	.L1709
.L1185:
	movl	%r14d, %eax
	subl	%ebp, %eax
	movl	%eax, %r12d
	shrl	$31, %r12d
	addl	%r12d, %eax
	sarl	%eax
	leal	(%rax,%rbp), %r12d
	cmpl	%ebp, %r12d
	je	.L1710
	cmpl	$-1, %r12d
	movl	%r12d, %r13d
	je	.L1711
.L1188:
	movl	%r13d, %eax
	subl	%ebp, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebp, %eax
	cmpl	%ebp, %eax
	je	.L1712
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movl	%eax, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %eax
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%r13d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%rbp), %eax
	cmpl	%eax, %r13d
	movl	%eax, 40(%rsp)
	jle	.L1190
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%ebp, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L1190:
	cmpl	$-1, %r14d
	movl	%r14d, %r13d
	je	.L1713
.L1191:
	movl	%r13d, %eax
	subl	%r12d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r12d, %eax
	cmpl	%eax, %r12d
	je	.L1193
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	xorl	%esi, %esi
	movl	%r12d, %edx
	movl	%eax, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %eax
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	$1, %esi
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r12), %eax
	cmpl	%eax, %r13d
	jle	.L1193
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L1193:
	cmpl	40(%rsp), %r14d
	jle	.L1187
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L1187:
	movl	32(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, %r14d
	je	.L1714
.L1195:
	movl	%r14d, %eax
	subl	%ebx, %eax
	movl	%eax, %r12d
	shrl	$31, %r12d
	addl	%r12d, %eax
	sarl	%eax
	leal	(%rax,%rbx), %r12d
	cmpl	%ebx, %r12d
	je	.L1197
	cmpl	$-1, %r12d
	movl	%r12d, %r13d
	je	.L1715
.L1198:
	movl	%r13d, %eax
	subl	%ebx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebx, %eax
	cmpl	%ebx, %eax
	je	.L1716
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	xorl	%esi, %esi
	movl	%ebx, %edx
	movl	%eax, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %eax
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	$1, %esi
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%rbx), %eax
	cmpl	%eax, %r13d
	jle	.L1200
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movl	%eax, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	48(%rsp), %eax
.L1200:
	cmpl	$-1, %r14d
	movl	%r14d, %r13d
	je	.L1717
.L1201:
	movl	%r13d, %edx
	subl	%r12d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r8d
	cmpl	%r8d, %r12d
	je	.L1203
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movl	%eax, 56(%rsp)
	movl	%r8d, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r8d
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%r13d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r12), %edx
	movl	56(%rsp), %eax
	cmpl	%edx, %r13d
	jle	.L1203
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%r12d, %edx
	xorl	%esi, %esi
	movl	%eax, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	48(%rsp), %eax
.L1203:
	cmpl	%eax, %r14d
	jle	.L1197
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebx, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L1197:
	movl	40(%rsp), %edi
	cmpl	%edi, 32(%rsp)
	jle	.L1184
	movl	32(%rsp), %ecx
	movq	8(%rsp), %rdi
	movl	%ebp, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L1184:
	movl	36(%rsp), %eax
	cmpl	$1, %eax
	jg	.L1718
.L1151:
	cmpl	$-1, 24(%rsp)
	je	.L1719
.L1207:
	movl	24(%rsp), %edi
	movl	20(%rsp), %esi
	movl	%edi, %eax
	movl	%edi, 32(%rsp)
	subl	%esi, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%rsi), %r10d
	cmpl	%r10d, %esi
	je	.L1210
	cmpl	$-1, %r10d
	movl	%r10d, %eax
	je	.L1720
.L1211:
	movl	20(%rsp), %edi
	movl	%eax, %edx
	subl	%edi, %edx
	movl	%edx, %ebx
	shrl	$31, %ebx
	addl	%ebx, %edx
	sarl	%edx
	leal	(%rdx,%rdi), %ebx
	cmpl	%ebx, %edi
	je	.L1721
	cmpl	$-1, %ebx
	movl	%ebx, %r13d
	je	.L1722
.L1214:
	movl	%r13d, %edx
	subl	%edi, %edx
	movl	%edx, %ebp
	shrl	$31, %ebp
	addl	%ebp, %edx
	sarl	%edx
	leal	(%rdx,%rdi), %ebp
	cmpl	%ebp, %edi
	je	.L1723
	cmpl	$-1, %ebp
	movl	%ebp, %r14d
	je	.L1724
.L1217:
	movl	%r14d, %edx
	subl	%edi, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rdi), %r12d
	cmpl	%r12d, %edi
	je	.L1725
	movl	%edi, %edx
	movq	8(%rsp), %rdi
	movl	%r12d, %ecx
	movl	$1, %esi
	movl	%eax, 48(%rsp)
	movl	%r10d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%r14d, %ecx
	movl	%r12d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	20(%rsp), %eax
	movl	40(%rsp), %r10d
	addl	$1, %eax
	cmpl	%eax, %r14d
	movl	%eax, 36(%rsp)
	movl	48(%rsp), %eax
	jle	.L1219
	movl	20(%rsp), %edx
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	48(%rsp), %eax
	movl	40(%rsp), %r10d
.L1219:
	cmpl	$-1, %r13d
	movl	%r13d, %r14d
	je	.L1726
.L1220:
	movl	%r14d, %edx
	subl	%ebp, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r12d
	cmpl	%r12d, %ebp
	je	.L1222
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%r12d, %ecx
	movl	%ebp, %edx
	movl	%eax, 48(%rsp)
	movl	%r10d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movq	8(%rsp), %rdi
	movl	%r12d, %edx
	movl	%r14d, %ecx
	movl	$1, %esi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%rbp), %edx
	movl	40(%rsp), %r10d
	movl	48(%rsp), %eax
	cmpl	%edx, %r14d
	jle	.L1222
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	48(%rsp), %eax
	movl	40(%rsp), %r10d
.L1222:
	cmpl	36(%rsp), %r13d
	jle	.L1216
	movl	20(%rsp), %edx
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	$1, %esi
	movl	%eax, 48(%rsp)
	movl	%r10d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	48(%rsp), %eax
	movl	40(%rsp), %r10d
	jmp	.L1216
.L1723:
	movl	%edi, %esi
	addl	$1, %esi
	movl	%esi, 36(%rsp)
.L1216:
	cmpl	$-1, %eax
	movl	%eax, %r14d
	je	.L1727
.L1224:
	movl	%r14d, %edx
	subl	%ebx, %edx
	movl	%edx, %r13d
	shrl	$31, %r13d
	addl	%r13d, %edx
	sarl	%edx
	leal	(%rdx,%rbx), %r13d
	cmpl	%r13d, %ebx
	je	.L1226
	cmpl	$-1, %r13d
	movl	%r13d, %r12d
	je	.L1728
.L1227:
	movl	%r12d, %edx
	subl	%ebx, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rbx), %ebp
	cmpl	%ebp, %ebx
	je	.L1729
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%ebp, %ecx
	movl	%ebx, %edx
	movl	%eax, 56(%rsp)
	movl	%r10d, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movq	8(%rsp), %rdi
	movl	%r12d, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%rbx), %eax
	movl	48(%rsp), %r10d
	cmpl	%eax, %r12d
	movl	%eax, 40(%rsp)
	movl	56(%rsp), %eax
	jle	.L1229
	movq	8(%rsp), %rdi
	movl	%r12d, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	56(%rsp), %eax
	movl	48(%rsp), %r10d
.L1229:
	cmpl	$-1, %r14d
	movl	%r14d, %r8d
	je	.L1730
.L1230:
	movl	%r8d, %edx
	subl	%r13d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r12d
	cmpl	%r12d, %r13d
	je	.L1232
	cmpl	$-1, %r12d
	movl	%r12d, %ebp
	je	.L1731
.L1233:
	movl	%ebp, %edx
	subl	%r13d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r9d
	cmpl	%r9d, %r13d
	je	.L1732
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	xorl	%esi, %esi
	movl	%r13d, %edx
	movl	%r8d, 80(%rsp)
	movl	%eax, 76(%rsp)
	movl	%r10d, 56(%rsp)
	movl	%r9d, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r9d
	movq	8(%rsp), %rdi
	movl	%ebp, %ecx
	movl	$1, %esi
	movl	%r9d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r13), %eax
	movl	56(%rsp), %r10d
	movl	80(%rsp), %r8d
	cmpl	%eax, %ebp
	movl	%eax, 48(%rsp)
	movl	76(%rsp), %eax
	jle	.L1235
	movq	8(%rsp), %rdi
	movl	%ebp, %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	80(%rsp), %r8d
	movl	76(%rsp), %eax
	movl	56(%rsp), %r10d
.L1235:
	cmpl	$-1, %r8d
	movl	%r8d, %ebp
	je	.L1733
.L1236:
	movl	%ebp, %edx
	subl	%r12d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r9d
	cmpl	%r9d, %r12d
	je	.L1238
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movl	%r8d, 88(%rsp)
	movl	%eax, 80(%rsp)
	movl	%r10d, 76(%rsp)
	movl	%r9d, 56(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	56(%rsp), %r9d
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%ebp, %ecx
	movl	%r9d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r12), %edx
	movl	76(%rsp), %r10d
	movl	80(%rsp), %eax
	movl	88(%rsp), %r8d
	cmpl	%edx, %ebp
	jle	.L1238
	movq	8(%rsp), %rdi
	movl	%ebp, %ecx
	movl	%r12d, %edx
	xorl	%esi, %esi
	movl	%r8d, 80(%rsp)
	movl	%eax, 76(%rsp)
	movl	%r10d, 56(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	80(%rsp), %r8d
	movl	76(%rsp), %eax
	movl	56(%rsp), %r10d
.L1238:
	cmpl	48(%rsp), %r8d
	jle	.L1232
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r13d, %edx
	xorl	%esi, %esi
	movl	%eax, 56(%rsp)
	movl	%r10d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	56(%rsp), %eax
	movl	48(%rsp), %r10d
.L1232:
	cmpl	40(%rsp), %r14d
	jle	.L1226
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebx, %edx
	xorl	%esi, %esi
	movl	%eax, 48(%rsp)
	movl	%r10d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	48(%rsp), %eax
	movl	40(%rsp), %r10d
.L1226:
	cmpl	36(%rsp), %eax
	jle	.L1213
	movl	20(%rsp), %edx
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	xorl	%esi, %esi
	movl	%r10d, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	40(%rsp), %r10d
.L1213:
	movl	32(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %eax
	je	.L1734
.L1242:
	movl	%eax, %edx
	subl	%r10d, %edx
	movl	%edx, %r14d
	shrl	$31, %r14d
	addl	%r14d, %edx
	sarl	%edx
	leal	(%rdx,%r10), %r14d
	cmpl	%r10d, %r14d
	je	.L1244
	cmpl	$-1, %r14d
	movl	%r14d, %r12d
	je	.L1735
.L1245:
	movl	%r12d, %edx
	subl	%r10d, %edx
	movl	%edx, %ebx
	shrl	$31, %ebx
	addl	%ebx, %edx
	sarl	%edx
	leal	(%rdx,%r10), %ebx
	cmpl	%r10d, %ebx
	je	.L1736
	cmpl	$-1, %ebx
	movl	%ebx, %r13d
	je	.L1737
.L1248:
	movl	%r13d, %edx
	subl	%r10d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r10), %ebp
	cmpl	%r10d, %ebp
	je	.L1738
	movq	8(%rsp), %rdi
	movl	%r10d, %edx
	xorl	%esi, %esi
	movl	%ebp, %ecx
	movl	%eax, 48(%rsp)
	movl	%r10d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r10d
	leal	1(%r10), %eax
	cmpl	%eax, %r13d
	movl	%eax, 40(%rsp)
	movl	48(%rsp), %eax
	jle	.L1250
	movq	8(%rsp), %rdi
	movl	%r10d, %edx
	movl	%r13d, %ecx
	movl	$1, %esi
	movl	%eax, 56(%rsp)
	movl	%r10d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	56(%rsp), %eax
	movl	48(%rsp), %r10d
.L1250:
	cmpl	$-1, %r12d
	movl	%r12d, %r13d
	je	.L1739
.L1251:
	movl	%r13d, %edx
	subl	%ebx, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rbx), %ebp
	cmpl	%ebp, %ebx
	je	.L1253
	movq	8(%rsp), %rdi
	movl	%ebp, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movl	%eax, 56(%rsp)
	movl	%r10d, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movq	8(%rsp), %rdi
	movl	%ebp, %edx
	xorl	%esi, %esi
	movl	%r13d, %ecx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%rbx), %edx
	movl	48(%rsp), %r10d
	movl	56(%rsp), %eax
	cmpl	%edx, %r13d
	jle	.L1253
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%ebx, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	56(%rsp), %eax
	movl	48(%rsp), %r10d
.L1253:
	cmpl	40(%rsp), %r12d
	jle	.L1247
	movq	8(%rsp), %rdi
	movl	%r10d, %edx
	movl	%r12d, %ecx
	xorl	%esi, %esi
	movl	%eax, 56(%rsp)
	movl	%r10d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	56(%rsp), %eax
	movl	48(%rsp), %r10d
.L1247:
	cmpl	$-1, %eax
	movl	%eax, %r13d
	je	.L1740
.L1255:
	movl	%r13d, %edx
	subl	%r14d, %edx
	movl	%edx, %r12d
	shrl	$31, %r12d
	addl	%r12d, %edx
	sarl	%edx
	leal	(%rdx,%r14), %r12d
	cmpl	%r12d, %r14d
	je	.L1257
	cmpl	$-1, %r12d
	movl	%r12d, %ebp
	je	.L1741
.L1258:
	movl	%ebp, %edx
	subl	%r14d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r14), %ebx
	cmpl	%ebx, %r14d
	je	.L1742
	movq	8(%rsp), %rdi
	movl	%ebx, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movl	%eax, 76(%rsp)
	movl	%r10d, 56(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%ebp, %ecx
	movl	%ebx, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r14), %eax
	movl	56(%rsp), %r10d
	cmpl	%eax, %ebp
	movl	%eax, 48(%rsp)
	movl	76(%rsp), %eax
	jle	.L1260
	movq	8(%rsp), %rdi
	movl	%ebp, %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	76(%rsp), %eax
	movl	56(%rsp), %r10d
.L1260:
	cmpl	$-1, %r13d
	movl	%r13d, %r8d
	je	.L1743
.L1261:
	movl	%r8d, %edx
	subl	%r12d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r12), %ebp
	cmpl	%ebp, %r12d
	je	.L1263
	cmpl	$-1, %ebp
	movl	%ebp, %ebx
	je	.L1744
.L1264:
	movl	%ebx, %edx
	subl	%r12d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r9d
	cmpl	%r9d, %r12d
	je	.L1745
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movl	%r8d, 88(%rsp)
	movl	%eax, 80(%rsp)
	movl	%r10d, 76(%rsp)
	movl	%r9d, 56(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	56(%rsp), %r9d
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%ebx, %ecx
	movl	%r9d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r12), %eax
	movl	76(%rsp), %r10d
	movl	88(%rsp), %r8d
	cmpl	%eax, %ebx
	movl	%eax, 56(%rsp)
	movl	80(%rsp), %eax
	jle	.L1266
	movq	8(%rsp), %rdi
	movl	%ebx, %ecx
	movl	%r12d, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	88(%rsp), %r8d
	movl	80(%rsp), %eax
	movl	76(%rsp), %r10d
.L1266:
	cmpl	$-1, %r8d
	movl	%r8d, %ebx
	je	.L1746
.L1267:
	movl	%ebx, %edx
	subl	%ebp, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r9d
	cmpl	%r9d, %ebp
	je	.L1269
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	xorl	%esi, %esi
	movl	%ebp, %edx
	movl	%r8d, 92(%rsp)
	movl	%eax, 88(%rsp)
	movl	%r10d, 80(%rsp)
	movl	%r9d, 76(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	76(%rsp), %r9d
	movq	8(%rsp), %rdi
	movl	%ebx, %ecx
	movl	$1, %esi
	movl	%r9d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%rbp), %edx
	movl	80(%rsp), %r10d
	movl	88(%rsp), %eax
	movl	92(%rsp), %r8d
	cmpl	%edx, %ebx
	jle	.L1269
	movq	8(%rsp), %rdi
	movl	%ebx, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movl	%r8d, 88(%rsp)
	movl	%eax, 80(%rsp)
	movl	%r10d, 76(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	88(%rsp), %r8d
	movl	80(%rsp), %eax
	movl	76(%rsp), %r10d
.L1269:
	cmpl	56(%rsp), %r8d
	jle	.L1263
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movl	%eax, 76(%rsp)
	movl	%r10d, 56(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	76(%rsp), %eax
	movl	56(%rsp), %r10d
.L1263:
	cmpl	48(%rsp), %r13d
	jle	.L1257
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movl	%eax, 56(%rsp)
	movl	%r10d, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	56(%rsp), %eax
	movl	48(%rsp), %r10d
.L1257:
	cmpl	40(%rsp), %eax
	jle	.L1244
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r10d, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L1244:
	movl	36(%rsp), %edi
	cmpl	%edi, 32(%rsp)
	jle	.L1210
	movl	32(%rsp), %ecx
	movl	20(%rsp), %edx
	movl	$1, %esi
	movq	8(%rsp), %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L1210:
	movl	24(%rsp), %eax
	cmpl	$1, %eax
	jle	.L1148
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L1148:
	movl	$1, %edi
	call	get_time@PLT
	movq	8(%rsp), %rbx
	movl	28(%rsp), %edi
	movq	%rbx, %rsi
	call	_Z17write_block_sizesiR5Table
	movl	$1, %edi
	movl	%eax, 76(%rsp)
	call	get_time@PLT
	movl	44(%rbx), %r13d
	movl	%r13d, %eax
	shrl	$31, %eax
	addl	%r13d, %eax
	sarl	%eax
	movl	%eax, %edi
	movl	%eax, 20(%rsp)
	je	.L1276
	cmpl	$-1, %eax
	je	.L1602
	leal	3(%r13), %eax
	testl	%r13d, %r13d
	cmovns	%r13d, %eax
	sarl	$2, %eax
	testl	%eax, %eax
	movl	%eax, %r9d
	je	.L1279
	cmpl	$-1, %eax
	je	.L1603
	leal	7(%r13), %ebp
	testl	%r13d, %r13d
	movl	%edi, 24(%rsp)
	cmovns	%r13d, %ebp
	sarl	$3, %ebp
	testl	%ebp, %ebp
	jne	.L1747
.L1281:
	movl	24(%rsp), %edi
	movl	%edi, %eax
	movl	%edi, 28(%rsp)
	subl	%r9d, %eax
	movl	%eax, %ebx
	shrl	$31, %ebx
	addl	%ebx, %eax
	sarl	%eax
	leal	(%rax,%r9), %ebx
	cmpl	%r9d, %ebx
	je	.L1319
.L1318:
	cmpl	$-1, %ebx
	movl	%ebx, %r8d
	je	.L1748
.L1320:
	movl	%r8d, %eax
	subl	%r9d, %eax
	movl	%eax, %ebp
	shrl	$31, %ebp
	addl	%ebp, %eax
	sarl	%eax
	leal	(%rax,%r9), %ebp
	cmpl	%r9d, %ebp
	je	.L1749
	cmpl	$-1, %ebp
	movl	%ebp, %r14d
	je	.L1750
.L1323:
	movl	%r14d, %eax
	subl	%r9d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%r9), %r12d
	cmpl	%r9d, %r12d
	je	.L1751
	movq	8(%rsp), %rdi
	movl	%r9d, %edx
	movl	%r12d, %ecx
	movl	$1, %esi
	movl	%r8d, 36(%rsp)
	movl	%r9d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%r14d, %ecx
	movl	%r12d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	32(%rsp), %r9d
	movl	36(%rsp), %r8d
	leal	1(%r9), %eax
	cmpl	%eax, %r14d
	movl	%eax, 32(%rsp)
	jle	.L1325
	movq	8(%rsp), %rdi
	movl	%r9d, %edx
	movl	%r14d, %ecx
	xorl	%esi, %esi
	movl	%r8d, 40(%rsp)
	movl	%r9d, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	40(%rsp), %r8d
	movl	36(%rsp), %r9d
.L1325:
	cmpl	$-1, %r8d
	movl	%r8d, %r14d
	je	.L1752
.L1326:
	movl	%r14d, %eax
	subl	%ebp, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%rbp), %r12d
	cmpl	%r12d, %ebp
	je	.L1328
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%r12d, %ecx
	movl	%ebp, %edx
	movl	%r9d, 40(%rsp)
	movl	%r8d, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%rbp), %eax
	movl	36(%rsp), %r8d
	movl	40(%rsp), %r9d
	cmpl	%eax, %r14d
	jle	.L1328
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	40(%rsp), %r9d
	movl	36(%rsp), %r8d
.L1328:
	cmpl	32(%rsp), %r8d
	jle	.L1322
	movq	8(%rsp), %rdi
	movl	%r9d, %edx
	movl	%r8d, %ecx
	movl	$1, %esi
	movl	%r9d, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %r9d
	jmp	.L1322
.L1749:
	leal	1(%r9), %eax
	movl	%eax, 32(%rsp)
.L1322:
	movl	24(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, %r8d
	je	.L1753
.L1330:
	movl	%r8d, %eax
	subl	%ebx, %eax
	movl	%eax, %ebp
	shrl	$31, %ebp
	addl	%ebp, %eax
	sarl	%eax
	leal	(%rax,%rbx), %ebp
	cmpl	%ebx, %ebp
	je	.L1332
	cmpl	$-1, %ebp
	movl	%ebp, %r14d
	je	.L1754
.L1333:
	movl	%r14d, %eax
	subl	%ebx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%rbx), %r12d
	leal	1(%rbx), %eax
	cmpl	%ebx, %r12d
	je	.L1335
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%r12d, %ecx
	movl	%ebx, %edx
	movl	%r9d, 40(%rsp)
	movl	%r8d, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%rbx), %eax
	movl	36(%rsp), %r8d
	movl	40(%rsp), %r9d
	cmpl	%eax, %r14d
	jle	.L1335
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movl	%r9d, 48(%rsp)
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	48(%rsp), %r9d
	movl	40(%rsp), %eax
	movl	36(%rsp), %r8d
.L1335:
	cmpl	$-1, %r8d
	movl	%r8d, %r14d
	je	.L1755
.L1336:
	movl	%r14d, %edx
	subl	%ebp, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r12d
	cmpl	%r12d, %ebp
	je	.L1338
	movq	8(%rsp), %rdi
	movl	%r12d, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movl	%r9d, 48(%rsp)
	movl	%eax, 40(%rsp)
	movl	%r8d, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movq	8(%rsp), %rdi
	movl	%r12d, %edx
	xorl	%esi, %esi
	movl	%r14d, %ecx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%rbp), %edx
	movl	36(%rsp), %r8d
	movl	40(%rsp), %eax
	movl	48(%rsp), %r9d
	cmpl	%edx, %r14d
	jle	.L1338
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebp, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	48(%rsp), %r9d
	movl	40(%rsp), %eax
	movl	36(%rsp), %r8d
.L1338:
	cmpl	%eax, %r8d
	jle	.L1332
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%ebx, %edx
	xorl	%esi, %esi
	movl	%r9d, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %r9d
.L1332:
	movl	32(%rsp), %esi
	cmpl	%esi, 24(%rsp)
	jle	.L1319
	movl	24(%rsp), %ecx
	movq	8(%rsp), %rdi
	movl	%r9d, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L1319:
	movl	28(%rsp), %eax
	cmpl	$1, %eax
	jle	.L1279
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L1279:
	cmpl	$-1, %r13d
	je	.L1756
	movl	20(%rsp), %edi
	movl	%r13d, %eax
	movl	%r13d, 24(%rsp)
	subl	%edi, %eax
	movl	%eax, %ebx
	shrl	$31, %ebx
	addl	%ebx, %eax
	sarl	%eax
	leal	(%rax,%rdi), %ebx
	cmpl	%ebx, %edi
	je	.L1345
	cmpl	$-1, %ebx
	movl	%ebx, 28(%rsp)
	je	.L1757
.L1346:
	movl	20(%rsp), %edi
	movl	28(%rsp), %eax
	subl	%edi, %eax
	movl	%eax, %ebp
	shrl	$31, %ebp
	addl	%ebp, %eax
	sarl	%eax
	leal	(%rax,%rdi), %ebp
	cmpl	%ebp, %edi
	je	.L1758
	cmpl	$-1, %ebp
	movl	%ebp, %r9d
	jne	.L1349
	movq	8(%rsp), %rax
	movl	44(%rax), %r9d
.L1349:
	movl	20(%rsp), %esi
	movl	%r9d, %eax
	subl	%esi, %eax
	movl	%eax, %r12d
	shrl	$31, %r12d
	addl	%r12d, %eax
	sarl	%eax
	leal	(%rax,%rsi), %r12d
	cmpl	%r12d, %esi
	jne	.L1350
	movl	%esi, %eax
	addl	$1, %eax
	movl	%eax, 32(%rsp)
.L1351:
	movl	28(%rsp), %eax
	cmpl	$-1, %eax
	movl	%eax, %r14d
	je	.L1759
.L1363:
	movl	%r14d, %eax
	subl	%ebp, %eax
	movl	%eax, %r12d
	shrl	$31, %r12d
	addl	%r12d, %eax
	sarl	%eax
	leal	(%rax,%rbp), %r12d
	cmpl	%r12d, %ebp
	je	.L1365
	cmpl	$-1, %r12d
	movl	%r12d, %r8d
	je	.L1760
.L1366:
	movl	%r8d, %eax
	subl	%ebp, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebp, %eax
	cmpl	%eax, %ebp
	je	.L1761
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	xorl	%esi, %esi
	movl	%ebp, %edx
	movl	%r8d, 36(%rsp)
	movl	%eax, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r8d
	movl	40(%rsp), %eax
	movl	$1, %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r8d
	leal	1(%rbp), %eax
	cmpl	%eax, %r8d
	jle	.L1368
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movl	%eax, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %eax
.L1368:
	cmpl	$-1, %r14d
	movl	%r14d, %r8d
	je	.L1762
.L1369:
	movl	%r8d, %edx
	movl	%r8d, 36(%rsp)
	subl	%r12d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r9d
	cmpl	%r9d, %r12d
	je	.L1371
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movl	%eax, 48(%rsp)
	movl	%r9d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r8d
	movl	40(%rsp), %r9d
	xorl	%esi, %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r9d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r8d
	leal	1(%r12), %edx
	movl	48(%rsp), %eax
	cmpl	%edx, %r8d
	jle	.L1371
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r12d, %edx
	xorl	%esi, %esi
	movl	%eax, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %eax
.L1371:
	cmpl	%eax, %r14d
	jle	.L1365
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebp, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L1365:
	movl	32(%rsp), %edi
	cmpl	%edi, 28(%rsp)
	jle	.L1348
	movl	28(%rsp), %ecx
	movl	20(%rsp), %edx
	xorl	%esi, %esi
	movq	8(%rsp), %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L1348:
	movl	24(%rsp), %edi
	cmpl	$-1, %edi
	movl	%edi, %eax
	je	.L1763
.L1374:
	movl	%eax, %edx
	subl	%ebx, %edx
	movl	%edx, %ebp
	shrl	$31, %ebp
	addl	%ebp, %edx
	sarl	%edx
	leal	(%rdx,%rbx), %ebp
	cmpl	%ebx, %ebp
	je	.L1376
	cmpl	$-1, %ebp
	movl	%ebp, %r14d
	je	.L1764
.L1377:
	movl	%r14d, %edx
	subl	%ebx, %edx
	movl	%edx, %r12d
	shrl	$31, %r12d
	addl	%r12d, %edx
	sarl	%edx
	leal	(%rdx,%rbx), %r12d
	cmpl	%ebx, %r12d
	je	.L1765
	cmpl	$-1, %r12d
	movl	%r12d, %r8d
	je	.L1766
.L1380:
	movl	%r8d, %edx
	subl	%ebx, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rbx), %r9d
	cmpl	%r9d, %ebx
	je	.L1767
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	xorl	%esi, %esi
	movl	%ebx, %edx
	movl	%eax, 40(%rsp)
	movl	%r8d, 36(%rsp)
	movl	%r9d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r8d
	movl	28(%rsp), %r9d
	movl	$1, %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r9d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r8d
	leal	1(%rbx), %eax
	movl	%eax, 28(%rsp)
	cmpl	%eax, %r8d
	movl	40(%rsp), %eax
	jle	.L1382
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movl	%eax, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %eax
.L1382:
	cmpl	$-1, %r14d
	movl	%r14d, %r8d
	je	.L1768
.L1383:
	movl	%r8d, %edx
	movl	%r8d, 36(%rsp)
	subl	%r12d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r9d
	cmpl	%r9d, %r12d
	je	.L1385
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movl	%eax, 48(%rsp)
	movl	%r9d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r8d
	movl	40(%rsp), %r9d
	xorl	%esi, %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r9d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r8d
	leal	1(%r12), %edx
	movl	48(%rsp), %eax
	cmpl	%edx, %r8d
	jle	.L1385
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r12d, %edx
	xorl	%esi, %esi
	movl	%eax, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %eax
.L1385:
	cmpl	28(%rsp), %r14d
	jle	.L1379
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebx, %edx
	xorl	%esi, %esi
	movl	%eax, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %eax
.L1379:
	cmpl	$-1, %eax
	movl	%eax, %r14d
	je	.L1769
.L1387:
	movl	%r14d, %edx
	subl	%ebp, %edx
	movl	%edx, %r12d
	shrl	$31, %r12d
	addl	%r12d, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r12d
	cmpl	%r12d, %ebp
	je	.L1389
	cmpl	$-1, %r12d
	movl	%r12d, %r9d
	je	.L1770
.L1390:
	movl	%r9d, %edx
	subl	%ebp, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rbp), %r8d
	cmpl	%r8d, %ebp
	je	.L1771
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movl	%eax, 48(%rsp)
	movl	%r9d, 36(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r9d
	movl	40(%rsp), %r8d
	xorl	%esi, %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r9d
	leal	1(%rbp), %r8d
	movl	48(%rsp), %eax
	cmpl	%r8d, %r9d
	jle	.L1392
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%ebp, %edx
	xorl	%esi, %esi
	movl	%r8d, 40(%rsp)
	movl	%eax, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	40(%rsp), %r8d
	movl	36(%rsp), %eax
.L1392:
	cmpl	$-1, %r14d
	movl	%r14d, %r9d
	je	.L1772
.L1393:
	movl	%r9d, %edx
	movl	%r9d, 36(%rsp)
	subl	%r12d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r10d
	cmpl	%r10d, %r12d
	je	.L1395
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	xorl	%esi, %esi
	movl	%r12d, %edx
	movl	%r8d, 56(%rsp)
	movl	%eax, 48(%rsp)
	movl	%r10d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r9d
	movl	40(%rsp), %r10d
	movl	$1, %esi
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r9d
	leal	1(%r12), %edx
	movl	48(%rsp), %eax
	movl	56(%rsp), %r8d
	cmpl	%edx, %r9d
	jle	.L1395
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movl	%r8d, 40(%rsp)
	movl	%eax, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	40(%rsp), %r8d
	movl	36(%rsp), %eax
.L1395:
	cmpl	%r8d, %r14d
	jle	.L1389
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movl	%eax, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %eax
.L1389:
	cmpl	28(%rsp), %eax
	jle	.L1376
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L1376:
	movl	32(%rsp), %edi
	cmpl	%edi, 24(%rsp)
	jle	.L1345
	movl	24(%rsp), %ecx
	movl	20(%rsp), %edx
	movl	$1, %esi
	movq	8(%rsp), %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L1345:
	cmpl	$1, %r13d
	jle	.L1276
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
.L1276:
	movl	$1, %edi
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	call	get_time@PLT
	movl	52(%rsp), %edx
	testl	%edx, %edx
	jle	.L1407
	movq	%r15, 40(%rsp)
	movq	64(%rsp), %r15
	jmp	.L1688
	.p2align 4,,10
	.p2align 3
.L1774:
	movq	8(%rsp), %rax
	cmpl	%ebx, 44(%rax)
	jg	.L1695
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
	movq	8(%rsp), %rax
.L1695:
	movq	%rbp, %rdx
	addq	(%rax), %rdx
	cmpl	%ebx, 44(%r15)
	movl	(%rdx), %r11d
	movl	4(%rdx), %r10d
	movl	8(%rdx), %r9d
	movl	12(%rdx), %r8d
	movl	16(%rdx), %eax
	movl	20(%rdx), %r14d
	movl	24(%rdx), %r13d
	movl	28(%rdx), %r12d
	jg	.L1406
.L1558:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$93, %esi
	movl	%r11d, 36(%rsp)
	movl	%r10d, 32(%rsp)
	movl	%r8d, 28(%rsp)
	movl	%eax, 24(%rsp)
	movl	%r9d, 20(%rsp)
	call	__assert@PLT
	movl	36(%rsp), %r11d
	movl	32(%rsp), %r10d
	movl	28(%rsp), %r8d
	movl	24(%rsp), %eax
	movl	20(%rsp), %r9d
.L1406:
	movq	%rbp, %rdx
	addl	$1, %ebx
	addq	(%r15), %rdx
	addq	$32, %rbp
	cmpl	%ebx, 52(%rsp)
	movl	%r11d, (%rdx)
	movl	%r10d, 4(%rdx)
	movl	%r9d, 8(%rdx)
	movl	%r8d, 12(%rdx)
	movl	%eax, 16(%rdx)
	movl	%r14d, 20(%rdx)
	movl	%r13d, 24(%rdx)
	movl	%r12d, 28(%rdx)
	je	.L1773
.L1688:
	testl	%ebx, %ebx
	jns	.L1774
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC0(%rip), %rcx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
	movq	8(%rsp), %rax
	movq	%rbp, %rdx
	addq	(%rax), %rdx
	movl	(%rdx), %r11d
	movl	4(%rdx), %r10d
	movl	8(%rdx), %r9d
	movl	12(%rdx), %r8d
	movl	16(%rdx), %eax
	movl	20(%rdx), %r14d
	movl	24(%rdx), %r13d
	movl	28(%rdx), %r12d
	jmp	.L1558
	.p2align 4,,10
	.p2align 3
.L1773:
	movq	40(%rsp), %r15
.L1407:
	movq	64(%rsp), %rax
	movl	44(%rax), %esi
	testl	%esi, %esi
	jle	.L1775
	movq	%r15, 56(%rsp)
	movq	(%rax), %rdi
	xorl	%r12d, %r12d
	xorl	%r14d, %r14d
	movq	%rax, %r15
	jmp	.L1409
	.p2align 4,,10
	.p2align 3
.L1776:
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	leaq	.LC0(%rip), %rcx
	movl	$93, %esi
	addl	%ebx, %r14d
	call	__assert@PLT
	movd	36(%rsp), %xmm1
	movq	(%r15), %rdi
	leal	1(%r12), %eax
	movd	40(%rsp), %xmm4
	movl	44(%r15), %edx
	movd	24(%rsp), %xmm0
	movd	32(%rsp), %xmm5
	punpckldq	%xmm4, %xmm1
	addq	%rdi, %r13
	movd	20(%rsp), %xmm6
	movl	%ebp, 20(%rsp)
	punpckldq	%xmm5, %xmm0
	movd	20(%rsp), %xmm7
	cmpl	%eax, %edx
	punpcklqdq	%xmm1, %xmm0
	movd	28(%rsp), %xmm1
	punpckldq	%xmm6, %xmm1
	movups	%xmm0, 0(%r13)
	movd	48(%rsp), %xmm0
	punpckldq	%xmm7, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 16(%r13)
	jle	.L1696
.L1411:
	addq	$1, %r12
	movl	44(%r15), %esi
.L1409:
	movq	%r12, %r13
	salq	$5, %r13
	leaq	(%rdi,%r13), %rax
	movl	4(%rax), %ebx
	movl	(%rax), %ecx
	movl	20(%rax), %ebp
	movl	%ebx, 32(%rsp)
	movl	8(%rax), %ebx
	movl	%ebx, 36(%rsp)
	movl	12(%rax), %ebx
	movl	%ebx, 40(%rsp)
	movl	16(%rax), %ebx
	movl	%ebx, 48(%rsp)
	movl	28(%rax), %ebx
	movl	%ebx, 20(%rsp)
	xorl	%ebx, %ebx
	testl	%ecx, %ecx
	setne	%bl
	xorl	%edx, %edx
	imull	%ebp, %ebx
	testl	%ecx, %ecx
	sete	%dl
	subl	%edx, %ebx
	setne	%dl
	movzbl	%dl, %edx
	imull	%edx, %ecx
	movl	%ecx, 24(%rsp)
	xorl	%ecx, %ecx
	testl	%ebx, %ebx
	sete	%cl
	imull	24(%rax), %ecx
	imull	%r14d, %edx
	addl	%edx, %ecx
	cmpl	%r12d, %esi
	movl	%ecx, 28(%rsp)
	jle	.L1776
	movd	36(%rsp), %xmm1
	addl	%ebx, %r14d
	movd	40(%rsp), %xmm2
	movd	24(%rsp), %xmm0
	movd	32(%rsp), %xmm3
	punpckldq	%xmm2, %xmm1
	movd	20(%rsp), %xmm4
	movl	%ebp, 20(%rsp)
	punpckldq	%xmm3, %xmm0
	movd	20(%rsp), %xmm5
	punpcklqdq	%xmm1, %xmm0
	movd	28(%rsp), %xmm1
	punpckldq	%xmm4, %xmm1
	movups	%xmm0, (%rax)
	movd	48(%rsp), %xmm0
	punpckldq	%xmm5, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 16(%rax)
	leal	1(%r12), %eax
	cmpl	%eax, %esi
	jg	.L1411
.L1696:
	movq	64(%rsp), %r13
	movl	%r14d, %esi
	movq	56(%rsp), %r15
	movq	%r13, %rdi
	call	_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei
	movl	$1, %edi
	call	get_time@PLT
	testl	%r14d, %r14d
	movl	$0, 96(%rsp)
	jle	.L1413
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	movl	%r14d, 56(%rsp)
	movq	%r15, 80(%rsp)
	jmp	.L1418
	.p2align 4,,10
	.p2align 3
.L1778:
	leaq	128(%rsp), %rax
.L1556:
	movq	(%rax), %rdx
	movq	%rdx, 96(%rsp)
	movq	8(%rax), %rdx
	movq	%rdx, 104(%rsp)
	movq	16(%rax), %rdx
	movq	%rdx, 112(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	testl	%ebp, %ebp
	sete	%al
	imull	%eax, %r12d
	movl	152(%rsp), %eax
	addl	%r12d, %eax
	addl	$1, %r12d
	movl	%eax, 20(%rsp)
	movl	%eax, 152(%rsp)
	movl	144(%rsp), %eax
	movl	%eax, %esi
	movl	%eax, 24(%rsp)
	movl	148(%rsp), %eax
	movl	%eax, %edi
	movl	%eax, 28(%rsp)
	movl	%r15d, %eax
	cltd
	idivl	%esi
	imull	%edi, %edx
	addl	%edx, %eax
	cmpl	%r15d, 44(%r13)
	movl	%eax, 32(%rsp)
	movl	%eax, 156(%rsp)
	movl	132(%rsp), %eax
	movl	%eax, 36(%rsp)
	movl	136(%rsp), %eax
	movl	%eax, 40(%rsp)
	movl	140(%rsp), %eax
	movl	%eax, 48(%rsp)
	jg	.L1416
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$93, %esi
	call	__assert@PLT
	movq	%r14, %rcx
	addq	0(%r13), %rcx
.L1416:
	movd	40(%rsp), %xmm1
	movl	%ebp, 40(%rsp)
	addq	$1, %rbx
	movd	48(%rsp), %xmm2
	cmpl	%ebx, 56(%rsp)
	movd	40(%rsp), %xmm0
	movd	36(%rsp), %xmm3
	punpckldq	%xmm2, %xmm1
	movd	32(%rsp), %xmm4
	punpckldq	%xmm3, %xmm0
	movd	28(%rsp), %xmm5
	punpcklqdq	%xmm1, %xmm0
	movd	20(%rsp), %xmm1
	punpckldq	%xmm4, %xmm1
	movups	%xmm0, (%rcx)
	movd	24(%rsp), %xmm0
	punpckldq	%xmm5, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 16(%rcx)
	jle	.L1777
.L1418:
	movl	%ebx, %r15d
	cmpl	%ebx, 44(%r13)
	jg	.L1414
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
.L1414:
	movq	%rbx, %r14
	salq	$5, %r14
	movq	%r14, %rcx
	addq	0(%r13), %rcx
	movq	8(%rcx), %rax
	movq	(%rcx), %rbp
	movq	%rax, 136(%rsp)
	movq	16(%rcx), %rax
	movq	%rbp, 128(%rsp)
	movq	%rax, 144(%rsp)
	movq	24(%rcx), %rax
	movq	%rax, 152(%rsp)
#APP
# 79 "IncludeL3/db_primitives.h" 1
	# FOAV obliv_expand1 e (128(%rsp))
	# FOAV obliv_expand1 last (96(%rsp))
# 0 "" 2
#NO_APP
	testl	%ebp, %ebp
	jne	.L1778
	movq	104(%rsp), %rax
	movq	96(%rsp), %rbp
	movq	%rax, 136(%rsp)
	movq	112(%rsp), %rax
	movq	%rbp, 128(%rsp)
	movq	%rax, 144(%rsp)
	movq	120(%rsp), %rax
	movq	%rax, 152(%rsp)
	leaq	96(%rsp), %rax
	jmp	.L1556
	.p2align 4,,10
	.p2align 3
.L1777:
	movq	80(%rsp), %r15
.L1413:
	movl	$1, %edi
	call	get_time@PLT
	movl	72(%rsp), %eax
	testl	%eax, %eax
	jle	.L1425
	movslq	52(%rsp), %rax
	xorl	%ebx, %ebx
	movq	%rax, %rbp
	salq	$5, %rax
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L1426:
	testl	%ebp, %ebp
	movl	%ebx, %r11d
	js	.L1422
	movq	8(%rsp), %rax
	cmpl	44(%rax), %ebp
	jl	.L1423
.L1422:
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	movl	%r11d, 20(%rsp)
	call	__assert@PLT
	movl	20(%rsp), %r11d
	movq	8(%rsp), %rax
.L1423:
	movq	%r12, %rdx
	addq	(%rax), %rdx
	cmpl	%r11d, 44(%r15)
	movl	16(%rdx), %esi
	movl	20(%rdx), %edi
	movl	(%rdx), %r10d
	movl	4(%rdx), %r9d
	movl	8(%rdx), %r8d
	movl	12(%rdx), %eax
	movl	%esi, 20(%rsp)
	movl	%edi, 24(%rsp)
	movl	24(%rdx), %r14d
	movl	28(%rdx), %r13d
	jg	.L1424
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$93, %esi
	movl	%r10d, 40(%rsp)
	movl	%r9d, 36(%rsp)
	movl	%r8d, 32(%rsp)
	movl	%eax, 28(%rsp)
	call	__assert@PLT
	movl	40(%rsp), %r10d
	movl	36(%rsp), %r9d
	movl	32(%rsp), %r8d
	movl	28(%rsp), %eax
.L1424:
	movq	%rbx, %rdx
	addl	$1, %ebp
	addq	$1, %rbx
	salq	$5, %rdx
	addq	(%r15), %rdx
	addq	$32, %r12
	cmpl	%ebx, 72(%rsp)
	movl	%eax, 12(%rdx)
	movl	20(%rsp), %eax
	movl	%r10d, (%rdx)
	movl	%r9d, 4(%rdx)
	movl	%r8d, 8(%rdx)
	movl	%r14d, 24(%rdx)
	movl	%eax, 16(%rdx)
	movl	24(%rsp), %eax
	movl	%r13d, 28(%rdx)
	movl	%eax, 20(%rdx)
	jg	.L1426
.L1425:
	movl	44(%r15), %esi
	testl	%esi, %esi
	jle	.L1779
	movq	(%r15), %rdi
	xorl	%r12d, %r12d
	xorl	%r14d, %r14d
	jmp	.L1427
	.p2align 4,,10
	.p2align 3
.L1780:
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	leaq	.LC0(%rip), %rcx
	movl	$93, %esi
	addl	%ebx, %r14d
	call	__assert@PLT
	movd	8(%rsp), %xmm4
	movq	(%r15), %rdi
	leal	1(%r12), %edx
	movd	32(%rsp), %xmm1
	movl	%ebp, 8(%rsp)
	movd	20(%rsp), %xmm0
	movl	44(%r15), %eax
	movd	36(%rsp), %xmm5
	punpckldq	%xmm4, %xmm1
	addq	%rdi, %r13
	movd	40(%rsp), %xmm6
	punpckldq	%xmm5, %xmm0
	movd	28(%rsp), %xmm7
	cmpl	%eax, %edx
	punpcklqdq	%xmm1, %xmm0
	movd	24(%rsp), %xmm1
	punpckldq	%xmm6, %xmm1
	movups	%xmm0, 0(%r13)
	movd	8(%rsp), %xmm0
	punpckldq	%xmm7, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 16(%r13)
	jge	.L1560
.L1429:
	addq	$1, %r12
	movl	44(%r15), %esi
.L1427:
	movq	%r12, %r13
	salq	$5, %r13
	leaq	(%rdi,%r13), %rax
	movl	4(%rax), %ebx
	movl	(%rax), %ecx
	movl	16(%rax), %ebp
	movl	%ebx, 36(%rsp)
	movl	8(%rax), %ebx
	movl	%ebx, 32(%rsp)
	movl	12(%rax), %ebx
	movl	%ebx, 8(%rsp)
	movl	20(%rax), %ebx
	movl	%ebx, 28(%rsp)
	movl	28(%rax), %ebx
	movl	%ebx, 40(%rsp)
	xorl	%ebx, %ebx
	testl	%ecx, %ecx
	setne	%bl
	xorl	%edx, %edx
	imull	%ebp, %ebx
	testl	%ecx, %ecx
	sete	%dl
	subl	%edx, %ebx
	setne	%dl
	movzbl	%dl, %edx
	imull	%edx, %ecx
	movl	%ecx, 20(%rsp)
	xorl	%ecx, %ecx
	testl	%ebx, %ebx
	sete	%cl
	imull	24(%rax), %ecx
	imull	%r14d, %edx
	addl	%edx, %ecx
	cmpl	%r12d, %esi
	movl	%ecx, 24(%rsp)
	jle	.L1780
	movd	8(%rsp), %xmm6
	movl	%ebp, 8(%rsp)
	addl	%ebx, %r14d
	movd	32(%rsp), %xmm1
	movd	20(%rsp), %xmm0
	movd	36(%rsp), %xmm7
	punpckldq	%xmm6, %xmm1
	movd	40(%rsp), %xmm2
	punpckldq	%xmm7, %xmm0
	movd	28(%rsp), %xmm3
	punpcklqdq	%xmm1, %xmm0
	movd	24(%rsp), %xmm1
	punpckldq	%xmm2, %xmm1
	movups	%xmm0, (%rax)
	movd	8(%rsp), %xmm0
	punpckldq	%xmm3, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 16(%rax)
	leal	1(%r12), %eax
	cmpl	%esi, %eax
	jl	.L1429
.L1560:
	movl	%r14d, %esi
	movq	%r15, %rdi
	call	_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei
	movl	$1, %edi
	call	get_time@PLT
	testl	%r14d, %r14d
	movl	$0, 96(%rsp)
	jle	.L1431
	xorl	%ebx, %ebx
	movl	%r14d, 48(%rsp)
	xorl	%r12d, %r12d
	movq	%rbx, %r13
	movq	%r15, %r14
	jmp	.L1436
	.p2align 4,,10
	.p2align 3
.L1782:
	leaq	128(%rsp), %rax
.L1557:
	movq	(%rax), %rdx
	movq	%rdx, 96(%rsp)
	movq	8(%rax), %rdx
	movq	%rdx, 104(%rsp)
	movq	16(%rax), %rdx
	movq	%rdx, 112(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	testl	%ebp, %ebp
	sete	%al
	imull	%eax, %r12d
	movl	152(%rsp), %eax
	addl	%r12d, %eax
	addl	$1, %r12d
	movl	%eax, 8(%rsp)
	movl	%eax, 152(%rsp)
	movl	144(%rsp), %eax
	movl	%eax, %esi
	movl	%eax, 20(%rsp)
	movl	148(%rsp), %eax
	movl	%eax, %edi
	movl	%eax, 24(%rsp)
	movl	%r15d, %eax
	cltd
	idivl	%esi
	imull	%edi, %edx
	addl	%edx, %eax
	cmpl	%r15d, 44(%r14)
	movl	%eax, 28(%rsp)
	movl	%eax, 156(%rsp)
	movl	132(%rsp), %eax
	movl	%eax, 32(%rsp)
	movl	136(%rsp), %eax
	movl	%eax, 40(%rsp)
	movl	140(%rsp), %eax
	movl	%eax, 36(%rsp)
	jg	.L1434
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$93, %esi
	call	__assert@PLT
	addq	(%r14), %rbx
	movq	%rbx, %rcx
.L1434:
	movd	36(%rsp), %xmm6
	movl	%ebp, 36(%rsp)
	addq	$1, %r13
	movd	40(%rsp), %xmm1
	cmpl	%r13d, 48(%rsp)
	movd	36(%rsp), %xmm0
	movd	32(%rsp), %xmm7
	punpckldq	%xmm6, %xmm1
	movd	28(%rsp), %xmm2
	punpckldq	%xmm7, %xmm0
	movd	24(%rsp), %xmm3
	punpcklqdq	%xmm1, %xmm0
	movd	8(%rsp), %xmm1
	punpckldq	%xmm2, %xmm1
	movups	%xmm0, (%rcx)
	movd	20(%rsp), %xmm0
	punpckldq	%xmm3, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movups	%xmm0, 16(%rcx)
	jle	.L1781
.L1436:
	movl	%r13d, %r15d
	cmpl	%r13d, 44(%r14)
	jg	.L1432
	leaq	.LC0(%rip), %rcx
	leaq	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$60, %esi
	call	__assert@PLT
.L1432:
	movq	%r13, %rbx
	salq	$5, %rbx
	movq	%rbx, %rcx
	addq	(%r14), %rcx
	movq	8(%rcx), %rax
	movq	(%rcx), %rbp
	movq	%rax, 136(%rsp)
	movq	16(%rcx), %rax
	movq	%rbp, 128(%rsp)
	movq	%rax, 144(%rsp)
	movq	24(%rcx), %rax
	movq	%rax, 152(%rsp)
#APP
# 79 "IncludeL3/db_primitives.h" 1
	# FOAV obliv_expand1 e (128(%rsp))
	# FOAV obliv_expand1 last (96(%rsp))
# 0 "" 2
#NO_APP
	testl	%ebp, %ebp
	jne	.L1782
	movq	104(%rsp), %rax
	movq	96(%rsp), %rbp
	movq	%rax, 136(%rsp)
	movq	112(%rsp), %rax
	movq	%rbp, 128(%rsp)
	movq	%rax, 144(%rsp)
	movq	120(%rsp), %rax
	movq	%rax, 152(%rsp)
	leaq	96(%rsp), %rax
	jmp	.L1557
	.p2align 4,,10
	.p2align 3
.L1781:
	movq	%r14, %r15
.L1431:
	movl	$1, %edi
	call	get_time@PLT
	movq	64(%rsp), %rax
	movl	76(%rsp), %edi
	cmpl	44(%rax), %edi
	je	.L1437
	leaq	.LC24(%rip), %rcx
	leaq	_ZZ4joinR5TableS0_S0_E8__func__(%rip), %rdx
	leaq	.LC25(%rip), %rdi
	movl	$53, %esi
	call	__assert@PLT
.L1437:
	movl	76(%rsp), %ebp
	cmpl	44(%r15), %ebp
	je	.L1438
	leaq	.LC26(%rip), %rcx
	leaq	_ZZ4joinR5TableS0_S0_E8__func__(%rip), %rdx
	leaq	.LC25(%rip), %rdi
	movl	$54, %esi
	call	__assert@PLT
	movl	44(%r15), %ebp
.L1438:
	movl	%ebp, %ebx
	shrl	$31, %ebx
	addl	%ebp, %ebx
	sarl	%ebx
	je	.L1440
	cmpl	$-1, %ebx
	je	.L1643
	leal	3(%rbp), %r12d
	testl	%ebp, %ebp
	cmovns	%ebp, %r12d
	sarl	$2, %r12d
	testl	%r12d, %r12d
	je	.L1443
	cmpl	$-1, %r12d
	je	.L1644
	leal	7(%rbp), %eax
	testl	%ebp, %ebp
	movl	%ebx, %r13d
	cmovns	%ebp, %eax
	sarl	$3, %eax
	testl	%eax, %eax
	movl	%eax, %r14d
	jne	.L1783
.L1445:
	movl	%r13d, %eax
	movl	%r13d, 8(%rsp)
	subl	%r12d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%r12), %r14d
	cmpl	%r12d, %r14d
	je	.L1476
.L1475:
	cmpl	$-1, %r14d
	movl	%r14d, %r10d
	je	.L1784
.L1477:
	movl	%r10d, %edx
	subl	%r12d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%r8d, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r8d
	cmpl	%r12d, %r8d
	je	.L1785
	cmpl	$-1, %r8d
	movl	%r8d, %r9d
	je	.L1786
.L1480:
	movl	%r9d, %edx
	subl	%r12d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r12), %eax
	cmpl	%r12d, %eax
	je	.L1787
	movl	%eax, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r8d, 32(%rsp)
	movl	%r10d, 28(%rsp)
	movl	%r9d, 24(%rsp)
	movl	%eax, 20(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r9d
	movl	20(%rsp), %eax
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r9d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r9d
	leal	1(%r12), %eax
	movl	28(%rsp), %r10d
	movl	32(%rsp), %r8d
	movl	%eax, 20(%rsp)
	cmpl	%eax, %r9d
	jle	.L1482
	movl	%r9d, %ecx
	movl	%r12d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r8d, 28(%rsp)
	movl	%r10d, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	28(%rsp), %r8d
	movl	24(%rsp), %r10d
.L1482:
	cmpl	$-1, %r10d
	movl	%r10d, %r11d
	je	.L1788
.L1483:
	movl	%r11d, %edx
	movl	%r11d, 24(%rsp)
	subl	%r8d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r8), %r9d
	cmpl	%r9d, %r8d
	je	.L1485
	movl	%r8d, %edx
	movl	%r9d, %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, 36(%rsp)
	movl	%r8d, 28(%rsp)
	movl	%r9d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r11d
	movl	32(%rsp), %r9d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r11d, %ecx
	movl	%r9d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	28(%rsp), %r8d
	movl	24(%rsp), %r11d
	movl	36(%rsp), %r10d
	leal	1(%r8), %edx
	cmpl	%edx, %r11d
	jle	.L1485
	movl	%r11d, %ecx
	movl	%r8d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	24(%rsp), %r10d
.L1485:
	cmpl	20(%rsp), %r10d
	jle	.L1479
	movl	%r10d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	jmp	.L1479
.L1785:
	leal	1(%r12), %eax
	movl	%eax, 20(%rsp)
.L1479:
	cmpl	$-1, %r13d
	movl	%r13d, %r10d
	je	.L1789
.L1487:
	movl	%r10d, %edx
	subl	%r14d, %edx
	movl	%edx, %r8d
	shrl	$31, %r8d
	addl	%r8d, %edx
	sarl	%edx
	leal	(%rdx,%r14), %r8d
	cmpl	%r8d, %r14d
	je	.L1489
	cmpl	$-1, %r8d
	movl	%r8d, %r9d
	je	.L1790
.L1490:
	movl	%r9d, %edx
	leal	1(%r14), %eax
	subl	%r14d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r14), %r11d
	cmpl	%r11d, %r14d
	je	.L1492
	movl	%r11d, %ecx
	xorl	%esi, %esi
	movl	%r14d, %edx
	movq	%r15, %rdi
	movl	%r8d, 36(%rsp)
	movl	%r10d, 32(%rsp)
	movl	%r9d, 24(%rsp)
	movl	%r11d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r9d
	movl	28(%rsp), %r11d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r9d, %ecx
	movl	%r11d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r9d
	leal	1(%r14), %eax
	movl	32(%rsp), %r10d
	movl	36(%rsp), %r8d
	cmpl	%eax, %r9d
	jle	.L1492
	movl	%r9d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	movl	%r8d, 28(%rsp)
	movl	%r10d, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	32(%rsp), %eax
	movl	28(%rsp), %r8d
	movl	24(%rsp), %r10d
.L1492:
	cmpl	$-1, %r10d
	movl	%r10d, %r11d
	je	.L1791
.L1493:
	movl	%r11d, %edx
	movl	%r11d, 24(%rsp)
	subl	%r8d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r8), %r9d
	cmpl	%r9d, %r8d
	je	.L1495
	movl	%r8d, %edx
	movl	%r9d, %ecx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	movl	%r10d, 36(%rsp)
	movl	%r8d, 28(%rsp)
	movl	%r9d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r11d
	movl	32(%rsp), %r9d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r11d, %ecx
	movl	%r9d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	28(%rsp), %r8d
	movl	24(%rsp), %r11d
	movl	36(%rsp), %r10d
	movl	40(%rsp), %eax
	leal	1(%r8), %edx
	cmpl	%edx, %r11d
	jle	.L1495
	movl	%r11d, %ecx
	movl	%r8d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 28(%rsp)
	movl	%r10d, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	28(%rsp), %eax
	movl	24(%rsp), %r10d
.L1495:
	cmpl	%eax, %r10d
	jle	.L1489
	movl	%r10d, %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L1489:
	cmpl	20(%rsp), %r13d
	jle	.L1476
	movl	%r13d, %ecx
	movl	%r12d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L1476:
	movl	8(%rsp), %eax
	cmpl	$1, %eax
	jle	.L1443
	movl	%eax, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L1443:
	cmpl	$-1, %ebp
	je	.L1792
	movl	%ebp, %eax
	movl	%ebp, 8(%rsp)
	subl	%ebx, %eax
	movl	%eax, %r12d
	shrl	$31, %r12d
	addl	%r12d, %eax
	sarl	%eax
	leal	(%rax,%rbx), %r12d
	cmpl	%r12d, %ebx
	je	.L1502
	cmpl	$-1, %r12d
	movl	%r12d, %eax
	je	.L1793
.L1503:
	movl	%eax, %edx
	subl	%ebx, %edx
	movl	%edx, %r13d
	shrl	$31, %r13d
	addl	%r13d, %edx
	sarl	%edx
	leal	(%rdx,%rbx), %r13d
	cmpl	%r13d, %ebx
	je	.L1794
	cmpl	$-1, %r13d
	movl	%r13d, %r9d
	jne	.L1506
	movl	44(%r15), %r9d
.L1506:
	movl	%r9d, %edx
	subl	%ebx, %edx
	movl	%edx, %r14d
	shrl	$31, %r14d
	addl	%r14d, %edx
	sarl	%edx
	leal	(%rdx,%rbx), %r14d
	cmpl	%r14d, %ebx
	jne	.L1507
	leal	1(%rbx), %esi
	movl	%esi, 20(%rsp)
.L1508:
	cmpl	$-1, %eax
	movl	%eax, %r9d
	je	.L1795
.L1516:
	movl	%r9d, %edx
	subl	%r13d, %edx
	movl	%edx, %r14d
	shrl	$31, %r14d
	addl	%r14d, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r14d
	cmpl	%r14d, %r13d
	je	.L1518
	cmpl	$-1, %r14d
	movl	%r14d, %r8d
	je	.L1796
.L1519:
	movl	%r8d, %edx
	leal	1(%r13), %r11d
	subl	%r13d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r10d
	cmpl	%r10d, %r13d
	je	.L1521
	movl	%r10d, %ecx
	xorl	%esi, %esi
	movl	%r13d, %edx
	movq	%r15, %rdi
	movl	%r9d, 36(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%r10d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r8d
	movl	28(%rsp), %r10d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r8d, %ecx
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r8d
	leal	1(%r13), %r11d
	movl	32(%rsp), %eax
	movl	36(%rsp), %r9d
	cmpl	%r11d, %r8d
	jle	.L1521
	movl	%r8d, %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r11d, 32(%rsp)
	movl	%r9d, 28(%rsp)
	movl	%eax, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	32(%rsp), %r11d
	movl	28(%rsp), %r9d
	movl	24(%rsp), %eax
.L1521:
	cmpl	$-1, %r9d
	movl	%r9d, %r10d
	je	.L1797
.L1522:
	movl	%r10d, %edx
	movl	%r10d, 24(%rsp)
	subl	%r14d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r14), %r8d
	cmpl	%r8d, %r14d
	je	.L1524
	movl	%r8d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r11d, 40(%rsp)
	movl	%r9d, 36(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r10d
	movl	28(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r10d
	leal	1(%r14), %edx
	movl	32(%rsp), %eax
	movl	36(%rsp), %r9d
	movl	40(%rsp), %r11d
	cmpl	%edx, %r10d
	jle	.L1524
	movl	%r10d, %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r11d, 32(%rsp)
	movl	%r9d, 28(%rsp)
	movl	%eax, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	32(%rsp), %r11d
	movl	28(%rsp), %r9d
	movl	24(%rsp), %eax
.L1524:
	cmpl	%r11d, %r9d
	jle	.L1518
	movl	%r9d, %ecx
	movl	%r13d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	24(%rsp), %eax
.L1518:
	cmpl	20(%rsp), %eax
	jle	.L1505
	movl	%eax, %ecx
	movl	%ebx, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L1505:
	movl	8(%rsp), %esi
	cmpl	$-1, %esi
	movl	%esi, %eax
	je	.L1798
.L1527:
	movl	%eax, %edx
	subl	%r12d, %edx
	movl	%edx, %r13d
	shrl	$31, %r13d
	addl	%r13d, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r13d
	cmpl	%r13d, %r12d
	je	.L1529
	cmpl	$-1, %r13d
	movl	%r13d, %r9d
	je	.L1799
.L1530:
	movl	%r9d, %edx
	subl	%r12d, %edx
	movl	%edx, %r14d
	shrl	$31, %r14d
	addl	%r14d, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r14d
	cmpl	%r14d, %r12d
	je	.L1800
	cmpl	$-1, %r14d
	movl	%r14d, %r10d
	je	.L1801
.L1533:
	movl	%r10d, %edx
	subl	%r12d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r8d
	cmpl	%r8d, %r12d
	je	.L1802
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movl	%r12d, %edx
	movq	%r15, %rdi
	movl	%r9d, 36(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r10d, 28(%rsp)
	movl	%r8d, 24(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	28(%rsp), %r10d
	movl	24(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	28(%rsp), %r10d
	leal	1(%r12), %eax
	movl	36(%rsp), %r9d
	movl	%eax, 24(%rsp)
	cmpl	%eax, %r10d
	movl	32(%rsp), %eax
	jle	.L1535
	movl	%r10d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r9d, 32(%rsp)
	movl	%eax, 28(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	32(%rsp), %r9d
	movl	28(%rsp), %eax
.L1535:
	cmpl	$-1, %r9d
	movl	%r9d, %r10d
	je	.L1803
.L1536:
	movl	%r10d, %edx
	movl	%r10d, 28(%rsp)
	subl	%r14d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r14), %r8d
	cmpl	%r8d, %r14d
	je	.L1538
	movl	%r8d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r9d, 40(%rsp)
	movl	%eax, 36(%rsp)
	movl	%r8d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	28(%rsp), %r10d
	movl	32(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	28(%rsp), %r10d
	leal	1(%r14), %edx
	movl	36(%rsp), %eax
	movl	40(%rsp), %r9d
	cmpl	%edx, %r10d
	jle	.L1538
	movl	%r10d, %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r9d, 32(%rsp)
	movl	%eax, 28(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	32(%rsp), %r9d
	movl	28(%rsp), %eax
.L1538:
	cmpl	24(%rsp), %r9d
	jle	.L1532
	movl	%r9d, %ecx
	movl	%r12d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 28(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	28(%rsp), %eax
.L1532:
	cmpl	$-1, %eax
	movl	%eax, %r9d
	je	.L1804
.L1540:
	movl	%r9d, %edx
	subl	%r13d, %edx
	movl	%edx, %r14d
	shrl	$31, %r14d
	addl	%r14d, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r14d
	cmpl	%r14d, %r13d
	je	.L1542
	cmpl	$-1, %r14d
	movl	%r14d, %r10d
	je	.L1805
.L1543:
	movl	%r10d, %edx
	leal	1(%r13), %r11d
	subl	%r13d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r13), %r8d
	cmpl	%r8d, %r13d
	je	.L1545
	movl	%r8d, %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r9d, 40(%rsp)
	movl	%eax, 36(%rsp)
	movl	%r10d, 28(%rsp)
	movl	%r8d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	28(%rsp), %r10d
	movl	32(%rsp), %r8d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	28(%rsp), %r10d
	leal	1(%r13), %r11d
	movl	36(%rsp), %eax
	movl	40(%rsp), %r9d
	cmpl	%r11d, %r10d
	jle	.L1545
	movl	%r10d, %ecx
	movl	%r13d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r11d, 36(%rsp)
	movl	%r9d, 32(%rsp)
	movl	%eax, 28(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	36(%rsp), %r11d
	movl	32(%rsp), %r9d
	movl	28(%rsp), %eax
.L1545:
	cmpl	$-1, %r9d
	movl	%r9d, %r10d
	je	.L1806
.L1546:
	movl	%r10d, %edx
	movl	%r10d, 28(%rsp)
	subl	%r14d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r14), %r8d
	cmpl	%r8d, %r14d
	je	.L1548
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movl	%r14d, %edx
	movq	%r15, %rdi
	movl	%r11d, 48(%rsp)
	movl	%r9d, 40(%rsp)
	movl	%eax, 36(%rsp)
	movl	%r8d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	28(%rsp), %r10d
	movl	32(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	28(%rsp), %r10d
	leal	1(%r14), %edx
	movl	36(%rsp), %eax
	movl	40(%rsp), %r9d
	movl	48(%rsp), %r11d
	cmpl	%edx, %r10d
	jle	.L1548
	movl	%r10d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r11d, 36(%rsp)
	movl	%r9d, 32(%rsp)
	movl	%eax, 28(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	36(%rsp), %r11d
	movl	32(%rsp), %r9d
	movl	28(%rsp), %eax
.L1548:
	cmpl	%r11d, %r9d
	jle	.L1542
	movl	%r9d, %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 28(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	28(%rsp), %eax
.L1542:
	cmpl	24(%rsp), %eax
	jle	.L1529
	movl	%eax, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L1529:
	movl	20(%rsp), %esi
	cmpl	%esi, 8(%rsp)
	jle	.L1502
	movl	8(%rsp), %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L1502:
	cmpl	$1, %ebp
	jle	.L1440
	movl	%ebp, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L1440:
	movq	168(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L1807
	addq	$184, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %edi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	get_time@PLT
	.p2align 4,,10
	.p2align 3
.L1602:
	.cfi_restore_state
	movl	%eax, %r12d
	movl	%edi, %ebp
	movl	%r13d, 28(%rsp)
	movl	%edi, %r9d
	movl	%r13d, 24(%rsp)
	movl	%r13d, %r8d
.L1607:
	movl	20(%rsp), %r14d
	movl	%r13d, %eax
	jmp	.L1283
	.p2align 4,,10
	.p2align 3
.L1562:
	movl	%eax, %r13d
	movl	%eax, %r12d
	movl	24(%rsp), %eax
	movl	%r13d, %ebp
	movl	%eax, 36(%rsp)
	movl	%eax, 32(%rsp)
	movl	%eax, %r14d
.L1567:
	movl	20(%rsp), %r8d
	movl	24(%rsp), %eax
	jmp	.L1155
	.p2align 4,,10
	.p2align 3
.L1643:
	movl	%ebp, 8(%rsp)
	movl	%ebx, %r12d
	movl	%ebp, %r13d
	movl	%ebx, %r14d
	movl	%ebx, %r8d
	movl	%ebp, %r9d
.L1648:
	movl	%ebx, %eax
	movl	%ebp, %r11d
	jmp	.L1447
	.p2align 4,,10
	.p2align 3
.L1718:
	movq	8(%rsp), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	%eax, %ecx
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	cmpl	$-1, 24(%rsp)
	jne	.L1207
.L1719:
	movq	8(%rsp), %rax
	movl	20(%rsp), %edi
	movl	44(%rax), %eax
	movl	%eax, 32(%rsp)
	subl	%edi, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%rdi), %r10d
	cmpl	%r10d, %edi
	je	.L1148
	cmpl	$-1, %r10d
	movl	%r10d, %eax
	jne	.L1211
.L1720:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L1211
	.p2align 4,,10
	.p2align 3
.L1507:
	cmpl	$-1, %r14d
	movl	%r14d, %r8d
	je	.L1808
.L1509:
	movl	%r8d, %edx
	subl	%ebx, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rbx), %r10d
	cmpl	%r10d, %ebx
	je	.L1809
	movl	%r10d, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r9d, 32(%rsp)
	movl	%eax, 28(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%r10d, 20(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r8d
	movl	20(%rsp), %r10d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r8d, %ecx
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r8d
	leal	1(%rbx), %eax
	movl	32(%rsp), %r9d
	movl	%eax, 20(%rsp)
	cmpl	%eax, %r8d
	movl	28(%rsp), %eax
	jle	.L1511
	movl	%r8d, %ecx
	movl	%ebx, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r9d, 28(%rsp)
	movl	%eax, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	28(%rsp), %r9d
	movl	24(%rsp), %eax
.L1511:
	cmpl	$-1, %r9d
	movl	%r9d, %r10d
	je	.L1810
.L1512:
	movl	%r10d, %edx
	movl	%r10d, 24(%rsp)
	subl	%r14d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r14), %r8d
	cmpl	%r8d, %r14d
	je	.L1514
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movl	%r14d, %edx
	movq	%r15, %rdi
	movl	%r9d, 36(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r10d
	movl	28(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r10d
	leal	1(%r14), %edx
	movl	32(%rsp), %eax
	movl	36(%rsp), %r9d
	cmpl	%edx, %r10d
	jle	.L1514
	movl	%r10d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r9d, 28(%rsp)
	movl	%eax, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	28(%rsp), %r9d
	movl	24(%rsp), %eax
.L1514:
	cmpl	20(%rsp), %r9d
	jle	.L1508
	movl	%r9d, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	24(%rsp), %eax
	jmp	.L1508
	.p2align 4,,10
	.p2align 3
.L1350:
	cmpl	$-1, %r12d
	movl	%r12d, %r14d
	je	.L1811
.L1352:
	movl	%r14d, %eax
	subl	%esi, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%esi, %eax
	cmpl	%eax, %esi
	je	.L1812
	movq	8(%rsp), %rdi
	movl	%esi, %edx
	movl	%eax, %ecx
	movl	$1, %esi
	movl	%r9d, 36(%rsp)
	movl	%eax, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	32(%rsp), %eax
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%r14d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	20(%rsp), %eax
	movl	36(%rsp), %r9d
	addl	$1, %eax
	cmpl	%eax, %r14d
	movl	%eax, 32(%rsp)
	jle	.L1354
	movl	20(%rsp), %edx
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %r9d
.L1354:
	cmpl	$-1, %r9d
	je	.L1813
	movl	%r9d, %eax
	subl	%r12d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%r12), %r14d
	cmpl	%r14d, %r12d
	je	.L1357
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%r12d, %edx
	xorl	%esi, %esi
	movl	%r9d, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r9d
	movl	%r9d, %r8d
	movl	%r9d, %eax
.L1358:
	movl	%eax, %edx
	movl	%eax, 36(%rsp)
	subl	%r14d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r14), %r10d
	cmpl	%r14d, %r10d
	je	.L1360
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	xorl	%esi, %esi
	movl	%r14d, %edx
	movl	%r8d, 56(%rsp)
	movl	%r9d, 48(%rsp)
	movl	%r10d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %eax
	movl	40(%rsp), %r10d
	movl	$1, %esi
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %eax
	leal	1(%r14), %edx
	movl	48(%rsp), %r9d
	movl	56(%rsp), %r8d
	cmpl	%edx, %eax
	jg	.L1814
.L1360:
	leal	1(%r12), %eax
	cmpl	%r8d, %eax
	jge	.L1357
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movl	%r9d, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %r9d
.L1357:
	cmpl	32(%rsp), %r9d
	jle	.L1351
	movl	20(%rsp), %edx
	movq	8(%rsp), %rdi
	movl	%r9d, %ecx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	jmp	.L1351
.L1710:
	leal	1(%rbp), %eax
	movl	%eax, 40(%rsp)
	jmp	.L1187
.L1784:
	movl	44(%r15), %r10d
	jmp	.L1477
.L1748:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L1320
.L1722:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r13d
	movl	20(%rsp), %edi
	jmp	.L1214
.L1709:
	movq	8(%rsp), %rax
	movl	44(%rax), %r14d
	jmp	.L1185
.L1708:
	cmpl	$-1, %r12d
	je	.L1565
	movl	%ebp, 36(%rsp)
.L1152:
	movl	%r12d, %r13d
	movl	20(%rsp), %eax
	shrl	$31, %r13d
	addl	%r12d, %r13d
	sarl	%r13d
	movl	%eax, 32(%rsp)
	testl	%r13d, %r13d
	je	.L1154
	movl	%r12d, %r14d
.L1149:
	cmpl	$-1, %r13d
	je	.L1567
	movl	%r13d, %eax
	shrl	$31, %eax
	addl	%r13d, %eax
	sarl	%eax
	movl	%eax, %r8d
	je	.L1156
	movl	%r13d, %eax
.L1155:
	cmpl	$-1, %r8d
	je	.L1569
	movl	%r8d, %ebx
	shrl	$31, %ebx
	addl	%r8d, %ebx
	sarl	%ebx
	jne	.L1815
.L1158:
	cmpl	$-1, %eax
	je	.L1816
	movl	%eax, %edx
	movl	%eax, 40(%rsp)
	subl	%r8d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r8), %ebx
	cmpl	%r8d, %ebx
	je	.L1163
.L1162:
	movq	8(%rsp), %rdi
	movl	%r8d, %edx
	xorl	%esi, %esi
	movl	%ebx, %ecx
	movl	%eax, 56(%rsp)
	movl	%r8d, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %ecx
	movq	8(%rsp), %rdi
	movl	%ebx, %edx
	movl	$1, %esi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	48(%rsp), %r8d
	movl	56(%rsp), %eax
	leal	1(%r8), %edx
	cmpl	40(%rsp), %edx
	jl	.L1817
.L1163:
	cmpl	$1, %eax
	jg	.L1818
.L1156:
	cmpl	$-1, %r14d
	je	.L1819
	movl	%r14d, %eax
	movl	%r14d, %ebx
	subl	%r13d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r13d, %eax
	cmpl	%r13d, %eax
	je	.L1168
.L1167:
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r13d, %edx
	movl	$1, %esi
	movl	%eax, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %eax
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%ebx, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r13), %eax
	cmpl	%ebx, %eax
	jge	.L1168
	movq	8(%rsp), %rdi
	movl	%ebx, %ecx
	movl	%r13d, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L1168:
	cmpl	$1, %r14d
	jle	.L1154
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L1154:
	cmpl	$-1, 36(%rsp)
	je	.L1820
	movl	36(%rsp), %r14d
	movl	%r14d, %eax
	subl	%r12d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%r12), %ebx
	cmpl	%r12d, %ebx
	je	.L1173
.L1172:
	cmpl	$-1, %ebx
	movl	%ebx, %r13d
	je	.L1821
.L1174:
	movl	%r13d, %eax
	subl	%r12d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r12d, %eax
	cmpl	%r12d, %eax
	je	.L1822
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movl	%eax, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %eax
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%r13d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r12), %eax
	cmpl	%eax, %r13d
	jle	.L1176
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%r12d, %edx
	xorl	%esi, %esi
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	40(%rsp), %eax
.L1176:
	cmpl	$-1, %r14d
	movl	%r14d, %r13d
	je	.L1823
.L1177:
	movl	%r13d, %edx
	subl	%ebx, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rbx), %r8d
	cmpl	%ebx, %r8d
	je	.L1179
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movl	%ebx, %edx
	movl	%eax, 48(%rsp)
	movl	%r8d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	$1, %esi
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%rbx), %edx
	movl	48(%rsp), %eax
	cmpl	%edx, %r13d
	jle	.L1179
	movq	8(%rsp), %rdi
	movl	%r13d, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	40(%rsp), %eax
.L1179:
	cmpl	%eax, %r14d
	jle	.L1173
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L1173:
	movl	36(%rsp), %eax
	cmpl	$1, %eax
	jle	.L1171
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
.L1171:
	movl	32(%rsp), %edi
	cmpl	$-1, %edi
	jne	.L1153
	movq	8(%rsp), %rax
	movl	44(%rax), %edx
	movl	%edx, %eax
	subl	%ebp, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	leal	(%rax,%rbp), %ebx
	cmpl	%ebp, %ebx
	je	.L1151
	movl	%edi, 36(%rsp)
	movl	%edx, 32(%rsp)
	jmp	.L1183
.L1747:
	cmpl	$-1, %ebp
	je	.L1605
	movl	%r9d, 28(%rsp)
.L1280:
	movl	%ebp, %r12d
	movl	20(%rsp), %eax
	shrl	$31, %r12d
	addl	%ebp, %r12d
	sarl	%r12d
	movl	%eax, 24(%rsp)
	testl	%r12d, %r12d
	je	.L1282
	movl	%ebp, %r8d
.L1277:
	cmpl	$-1, %r12d
	je	.L1607
	movl	%r12d, %r14d
	shrl	$31, %r14d
	addl	%r12d, %r14d
	sarl	%r14d
	je	.L1284
	movl	%r12d, %eax
.L1283:
	cmpl	$-1, %r14d
	je	.L1609
	movl	%r14d, %ebx
	shrl	$31, %ebx
	addl	%r14d, %ebx
	sarl	%ebx
	jne	.L1824
.L1286:
	cmpl	$-1, %eax
	je	.L1825
	movl	%eax, %edx
	movl	%eax, 32(%rsp)
	subl	%r14d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r14), %ebx
	cmpl	%r14d, %ebx
	je	.L1291
.L1290:
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%ebx, %ecx
	movl	%r14d, %edx
	movl	%r9d, 48(%rsp)
	movl	%eax, 40(%rsp)
	movl	%r8d, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	32(%rsp), %ecx
	movq	8(%rsp), %rdi
	movl	%ebx, %edx
	movl	$1, %esi
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r14), %edx
	cmpl	32(%rsp), %edx
	movl	36(%rsp), %r8d
	movl	40(%rsp), %eax
	movl	48(%rsp), %r9d
	jl	.L1826
.L1291:
	cmpl	$1, %eax
	jg	.L1827
.L1284:
	cmpl	$-1, %r8d
	je	.L1828
	movl	%r8d, %eax
	movl	%r8d, %ebx
	subl	%r12d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%r12), %r14d
	cmpl	%r12d, %r14d
	je	.L1296
.L1295:
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movl	%r9d, 36(%rsp)
	movl	%r8d, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%ebx, %ecx
	movl	%r14d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%r12), %eax
	movl	32(%rsp), %r8d
	movl	36(%rsp), %r9d
	cmpl	%eax, %ebx
	jle	.L1296
	movq	8(%rsp), %rdi
	movl	%ebx, %ecx
	movl	%r12d, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %r9d
	movl	32(%rsp), %r8d
.L1296:
	cmpl	$1, %r8d
	jle	.L1282
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	%r9d, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	32(%rsp), %r9d
.L1282:
	cmpl	$-1, 28(%rsp)
	je	.L1829
	movl	28(%rsp), %r14d
	movl	%r14d, %eax
	subl	%ebp, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%rbp), %ebx
	cmpl	%ebp, %ebx
	je	.L1301
.L1300:
	cmpl	$-1, %ebx
	movl	%ebx, %r12d
	je	.L1830
.L1302:
	movl	%r12d, %eax
	subl	%ebp, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebp, %eax
	cmpl	%ebp, %eax
	je	.L1831
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movl	%r9d, 36(%rsp)
	movl	%eax, 32(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	32(%rsp), %eax
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%r12d, %ecx
	movl	%eax, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	leal	1(%rbp), %eax
	movl	36(%rsp), %r9d
	cmpl	%eax, %r12d
	movl	%eax, 32(%rsp)
	jle	.L1304
	movq	8(%rsp), %rdi
	movl	%r12d, %ecx
	movl	%ebp, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %r9d
.L1304:
	cmpl	$-1, %r14d
	movl	%r14d, %eax
	je	.L1832
.L1305:
	movl	%eax, %edx
	subl	%ebx, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rbx), %r12d
	cmpl	%ebx, %r12d
	je	.L1307
	cmpl	$-1, %r12d
	movl	%r12d, %r8d
	je	.L1833
.L1308:
	movl	%r8d, %edx
	subl	%ebx, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rbx), %r10d
	cmpl	%ebx, %r10d
	je	.L1834
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movl	%r9d, 56(%rsp)
	movl	%eax, 48(%rsp)
	movl	%r8d, 40(%rsp)
	movl	%r10d, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	movl	36(%rsp), %r10d
	xorl	%esi, %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	leal	1(%rbx), %eax
	movl	56(%rsp), %r9d
	movl	%eax, 36(%rsp)
	cmpl	%eax, %r8d
	movl	48(%rsp), %eax
	jg	.L1835
.L1310:
	cmpl	$-1, %eax
	movl	%eax, %r8d
	je	.L1836
.L1311:
	movl	%r8d, %edx
	movl	%r8d, 40(%rsp)
	subl	%r12d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r12), %r10d
	cmpl	%r10d, %r12d
	je	.L1313
	movq	8(%rsp), %rdi
	movl	%r10d, %ecx
	xorl	%esi, %esi
	movl	%r12d, %edx
	movl	%r9d, 80(%rsp)
	movl	%eax, 56(%rsp)
	movl	%r10d, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	movl	48(%rsp), %r10d
	movl	$1, %esi
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %r8d
	leal	1(%r12), %edx
	movl	56(%rsp), %eax
	movl	80(%rsp), %r9d
	cmpl	%edx, %r8d
	jg	.L1837
.L1313:
	cmpl	36(%rsp), %eax
	jle	.L1307
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%ebx, %edx
	movl	$1, %esi
	movl	%r9d, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %r9d
.L1307:
	cmpl	32(%rsp), %r14d
	jle	.L1301
	movq	8(%rsp), %rdi
	movl	%r14d, %ecx
	movl	%ebp, %edx
	movl	$1, %esi
	movl	%r9d, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	32(%rsp), %r9d
.L1301:
	movl	28(%rsp), %eax
	cmpl	$1, %eax
	jle	.L1299
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movl	%r9d, 28(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	28(%rsp), %r9d
.L1299:
	movl	24(%rsp), %esi
	cmpl	$-1, %esi
	jne	.L1281
	movq	8(%rsp), %rax
	movl	44(%rax), %edx
	movl	%edx, %eax
	subl	%r9d, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	leal	(%rax,%r9), %ebx
	cmpl	%r9d, %ebx
	je	.L1279
	movl	%esi, 28(%rsp)
	movl	%edx, 24(%rsp)
	jmp	.L1318
.L1783:
	cmpl	$-1, %eax
	movl	%r12d, 8(%rsp)
	je	.L1838
.L1444:
	movl	%r14d, %r8d
	movl	%ebx, %r13d
	shrl	$31, %r8d
	addl	%r14d, %r8d
	sarl	%r8d
	testl	%r8d, %r8d
	je	.L1446
	movl	%r14d, %r9d
.L1441:
	cmpl	$-1, %r8d
	je	.L1648
	movl	%r8d, %eax
	shrl	$31, %eax
	addl	%r8d, %eax
	sarl	%eax
	je	.L1448
	movl	%r8d, %r11d
.L1447:
	cmpl	$-1, %eax
	je	.L1650
	movl	%eax, %r10d
	shrl	$31, %r10d
	addl	%eax, %r10d
	sarl	%r10d
	jne	.L1839
.L1450:
	cmpl	$-1, %r11d
	je	.L1840
	movl	%r11d, %edx
	movl	%r11d, 20(%rsp)
	subl	%eax, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rax), %r10d
	cmpl	%eax, %r10d
	je	.L1455
.L1454:
	movl	%eax, %edx
	movl	%r10d, %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r9d, 40(%rsp)
	movl	%r8d, 36(%rsp)
	movl	%r11d, 32(%rsp)
	movl	%eax, 24(%rsp)
	movl	%r10d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	28(%rsp), %r10d
	movl	20(%rsp), %ecx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %eax
	movl	32(%rsp), %r11d
	movl	36(%rsp), %r8d
	movl	40(%rsp), %r9d
	leal	1(%rax), %edx
	cmpl	%edx, 20(%rsp)
	jg	.L1841
.L1455:
	cmpl	$1, %r11d
	jg	.L1842
.L1448:
	cmpl	$-1, %r9d
	je	.L1843
	movl	%r9d, %edx
	movl	%r9d, 20(%rsp)
	subl	%r8d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r8), %r10d
	cmpl	%r10d, %r8d
	je	.L1460
.L1459:
	movl	%r8d, %edx
	movl	%r10d, %ecx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r9d, 32(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%r10d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	28(%rsp), %r10d
	movl	20(%rsp), %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r8d
	movl	32(%rsp), %r9d
	leal	1(%r8), %edx
	cmpl	%edx, 20(%rsp)
	jle	.L1460
	movl	20(%rsp), %ecx
	movl	%r8d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r9d, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	24(%rsp), %r9d
.L1460:
	cmpl	$1, %r9d
	jle	.L1446
	movl	%r9d, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L1446:
	cmpl	$-1, 8(%rsp)
	je	.L1844
	movl	8(%rsp), %r9d
	movl	%r9d, %edx
	subl	%r14d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r14), %eax
	cmpl	%r14d, %eax
	je	.L1465
.L1464:
	cmpl	$-1, %eax
	movl	%eax, %r8d
	je	.L1845
.L1466:
	movl	%r8d, %edx
	leal	1(%r14), %r11d
	subl	%r14d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r14), %r10d
	cmpl	%r14d, %r10d
	je	.L1468
	movl	%r10d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 32(%rsp)
	movl	%r9d, 28(%rsp)
	movl	%r8d, 20(%rsp)
	movl	%r10d, 24(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	20(%rsp), %r8d
	movl	24(%rsp), %r10d
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r8d, %ecx
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	20(%rsp), %r8d
	leal	1(%r14), %r11d
	movl	28(%rsp), %r9d
	movl	32(%rsp), %eax
	cmpl	%r11d, %r8d
	jle	.L1468
	movl	%r8d, %ecx
	movl	%r14d, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r11d, 28(%rsp)
	movl	%eax, 24(%rsp)
	movl	%r9d, 20(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	28(%rsp), %r11d
	movl	24(%rsp), %eax
	movl	20(%rsp), %r9d
.L1468:
	cmpl	$-1, %r9d
	movl	%r9d, %r10d
	je	.L1846
.L1469:
	movl	%r10d, %edx
	movl	%r10d, 20(%rsp)
	subl	%eax, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%rax), %r8d
	cmpl	%r8d, %eax
	je	.L1471
	movl	%eax, %edx
	movl	%r8d, %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r11d, 36(%rsp)
	movl	%r9d, 32(%rsp)
	movl	%eax, 24(%rsp)
	movl	%r8d, 28(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	20(%rsp), %r10d
	movl	28(%rsp), %r8d
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r10d, %ecx
	movl	%r8d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %eax
	movl	20(%rsp), %r10d
	movl	32(%rsp), %r9d
	movl	36(%rsp), %r11d
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jle	.L1471
	movl	%r10d, %ecx
	movl	%eax, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r11d, 24(%rsp)
	movl	%r9d, 20(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	24(%rsp), %r11d
	movl	20(%rsp), %r9d
.L1471:
	cmpl	%r11d, %r9d
	jle	.L1465
	movl	%r9d, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L1465:
	movl	8(%rsp), %eax
	cmpl	$1, %eax
	jle	.L1463
	movl	%eax, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
.L1463:
	cmpl	$-1, %r13d
	jne	.L1445
	movl	44(%r15), %edx
	movl	%edx, %eax
	subl	%r12d, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	leal	(%rax,%r12), %r14d
	cmpl	%r12d, %r14d
	je	.L1443
	movl	%r13d, 8(%rsp)
	movl	%edx, %r13d
	jmp	.L1475
	.p2align 4,,10
	.p2align 3
.L1756:
	movq	8(%rsp), %rax
	movl	20(%rsp), %esi
	movl	44(%rax), %eax
	movl	%eax, 24(%rsp)
	subl	%esi, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%rsi), %ebx
	cmpl	%ebx, %esi
	je	.L1276
	cmpl	$-1, %ebx
	movl	%ebx, 28(%rsp)
	jne	.L1346
.L1757:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	movl	%eax, 28(%rsp)
	jmp	.L1346
	.p2align 4,,10
	.p2align 3
.L1792:
	movl	44(%r15), %eax
	movl	%eax, 8(%rsp)
	subl	%ebx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%rbx), %r12d
	cmpl	%r12d, %ebx
	je	.L1440
	cmpl	$-1, %r12d
	movl	%r12d, %eax
	jne	.L1503
.L1793:
	movl	44(%r15), %eax
	jmp	.L1503
	.p2align 4,,10
	.p2align 3
.L1758:
	movl	%edi, %eax
	movl	24(%rsp), %edi
	addl	$1, %eax
	movl	%eax, 32(%rsp)
	cmpl	$-1, %edi
	movl	%edi, %eax
	jne	.L1374
.L1763:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L1374
	.p2align 4,,10
	.p2align 3
.L1721:
	movl	%edi, %eax
	movl	32(%rsp), %edi
	addl	$1, %eax
	movl	%eax, 36(%rsp)
	cmpl	$-1, %edi
	movl	%edi, %eax
	jne	.L1242
.L1734:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L1242
	.p2align 4,,10
	.p2align 3
.L1794:
	movl	8(%rsp), %esi
	leal	1(%rbx), %eax
	movl	%eax, 20(%rsp)
	cmpl	$-1, %esi
	movl	%esi, %eax
	jne	.L1527
.L1798:
	movl	44(%r15), %eax
	jmp	.L1527
.L1736:
	leal	1(%r10), %esi
	movl	%esi, 40(%rsp)
	jmp	.L1247
.L1765:
	leal	1(%rbx), %edi
	movl	%edi, 28(%rsp)
	jmp	.L1379
.L1800:
	leal	1(%r12), %edi
	movl	%edi, 24(%rsp)
	jmp	.L1532
.L1779:
	movq	%r15, %rdi
	xorl	%esi, %esi
	call	_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei
	movl	$1, %edi
	call	get_time@PLT
	jmp	.L1431
.L1775:
	movq	%rax, %rdi
	xorl	%esi, %esi
	call	_Z16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_Ei
	movl	$1, %edi
	call	get_time@PLT
	jmp	.L1413
.L1799:
	movl	44(%r15), %r9d
	jmp	.L1530
.L1759:
	movq	8(%rsp), %rax
	movl	44(%rax), %r14d
	jmp	.L1363
.L1844:
	movl	44(%r15), %r9d
	movl	%r9d, %edx
	subl	%r14d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	leal	(%rdx,%r14), %eax
	cmpl	%r14d, %eax
	jne	.L1464
	jmp	.L1463
.L1740:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r13d
	jmp	.L1255
.L1829:
	movq	8(%rsp), %rax
	movl	44(%rax), %r14d
	movl	%r14d, %eax
	subl	%ebp, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%rbp), %ebx
	cmpl	%ebp, %ebx
	jne	.L1300
	jmp	.L1299
.L1804:
	movl	44(%r15), %r9d
	jmp	.L1540
.L1789:
	movl	44(%r15), %r10d
	jmp	.L1487
.L1795:
	movl	44(%r15), %r9d
	jmp	.L1516
.L1735:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r12d
	jmp	.L1245
.L1769:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r14d
	jmp	.L1387
.L1714:
	movq	8(%rsp), %rax
	movl	44(%rax), %r14d
	jmp	.L1195
.L1753:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L1330
.L1820:
	movq	8(%rsp), %rax
	movl	44(%rax), %r14d
	movl	%r14d, %eax
	subl	%r12d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%r12), %ebx
	cmpl	%r12d, %ebx
	jne	.L1172
	jmp	.L1171
.L1727:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r14d
	jmp	.L1224
.L1764:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r14d
	jmp	.L1377
.L1812:
	movl	%esi, %eax
	addl	$1, %eax
	movl	%eax, 32(%rsp)
	jmp	.L1354
.L1751:
	leal	1(%r9), %eax
	movl	%eax, 32(%rsp)
	jmp	.L1325
.L1802:
	leal	1(%r12), %edi
	movl	%edi, 24(%rsp)
	jmp	.L1535
.L1767:
	leal	1(%rbx), %esi
	movl	%esi, 28(%rsp)
	jmp	.L1382
.L1729:
	leal	1(%rbx), %edi
	movl	%edi, 40(%rsp)
	jmp	.L1229
.L1809:
	leal	1(%rbx), %esi
	movl	%esi, 20(%rsp)
	jmp	.L1511
.L1771:
	leal	1(%rbp), %r8d
	jmp	.L1392
.L1712:
	leal	1(%rbp), %eax
	movl	%eax, 40(%rsp)
	jmp	.L1190
.L1761:
	leal	1(%rbp), %eax
	jmp	.L1368
.L1822:
	leal	1(%r12), %eax
	jmp	.L1176
.L1716:
	leal	1(%rbx), %eax
	jmp	.L1200
.L1725:
	leal	1(%rdi), %edi
	movl	%edi, 36(%rsp)
	jmp	.L1219
.L1742:
	leal	1(%r14), %edi
	movl	%edi, 48(%rsp)
	jmp	.L1260
.L1787:
	leal	1(%r12), %eax
	movl	%eax, 20(%rsp)
	jmp	.L1482
.L1831:
	leal	1(%rbp), %eax
	movl	%eax, 32(%rsp)
	jmp	.L1304
.L1738:
	leal	1(%r10), %esi
	movl	%esi, 40(%rsp)
	jmp	.L1250
.L1818:
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	jmp	.L1156
.L1827:
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movl	%r9d, 36(%rsp)
	movl	%r8d, 32(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	36(%rsp), %r9d
	movl	32(%rsp), %r8d
	jmp	.L1284
.L1842:
	movl	%r11d, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r9d, 24(%rsp)
	movl	%r8d, 20(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	24(%rsp), %r9d
	movl	20(%rsp), %r8d
	jmp	.L1448
.L1839:
	movl	%eax, 20(%rsp)
.L1449:
	movl	%r10d, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	movl	%r9d, 36(%rsp)
	movl	%r8d, 32(%rsp)
	movl	%r11d, 28(%rsp)
	movl	%r10d, 24(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	24(%rsp), %r10d
	movl	20(%rsp), %ecx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%r10d, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii
	cmpl	$1, 20(%rsp)
	movl	28(%rsp), %r11d
	movl	32(%rsp), %r8d
	movl	36(%rsp), %r9d
	movl	40(%rsp), %eax
	jle	.L1450
	movl	20(%rsp), %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movl	%eax, 36(%rsp)
	movl	%r9d, 32(%rsp)
	movl	%r8d, 28(%rsp)
	movl	%r11d, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	36(%rsp), %eax
	movl	32(%rsp), %r9d
	movl	28(%rsp), %r8d
	movl	24(%rsp), %r11d
	jmp	.L1450
.L1824:
	movl	%r14d, 32(%rsp)
.L1285:
	movq	8(%rsp), %rdi
	xorl	%edx, %edx
	movl	%ebx, %ecx
	movl	$1, %esi
	movl	%r9d, 48(%rsp)
	movl	%eax, 40(%rsp)
	movl	%r8d, 36(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	32(%rsp), %ecx
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%ebx, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	cmpl	$1, 32(%rsp)
	movl	36(%rsp), %r8d
	movl	40(%rsp), %eax
	movl	48(%rsp), %r9d
	jle	.L1286
	movl	32(%rsp), %ecx
	movq	8(%rsp), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	48(%rsp), %r9d
	movl	40(%rsp), %eax
	movl	36(%rsp), %r8d
	jmp	.L1286
.L1815:
	movl	%r8d, 40(%rsp)
.L1157:
	movq	8(%rsp), %rdi
	xorl	%edx, %edx
	movl	%ebx, %ecx
	movl	$1, %esi
	movl	%eax, 56(%rsp)
	movl	%r8d, 48(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	40(%rsp), %ecx
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	movl	%ebx, %edx
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii
	cmpl	$1, 40(%rsp)
	movl	48(%rsp), %r8d
	movl	56(%rsp), %eax
	jle	.L1158
	movl	40(%rsp), %ecx
	movq	8(%rsp), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	56(%rsp), %eax
	movl	48(%rsp), %r8d
	jmp	.L1158
.L1837:
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%r12d, %edx
	movl	$1, %esi
	movl	%r9d, 48(%rsp)
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	48(%rsp), %r9d
	movl	40(%rsp), %eax
	jmp	.L1313
.L1835:
	movq	8(%rsp), %rdi
	movl	%r8d, %ecx
	movl	%ebx, %edx
	xorl	%esi, %esi
	movl	%r9d, 48(%rsp)
	movl	%eax, 40(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	48(%rsp), %r9d
	movl	40(%rsp), %eax
	jmp	.L1310
.L1841:
	movl	20(%rsp), %ecx
	movl	%eax, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	movl	%r9d, 32(%rsp)
	movl	%r8d, 28(%rsp)
	movl	%r11d, 24(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_7t1_compES1_S1_EEEvP8TraceMemIT_Ebii.part.13
	movl	32(%rsp), %r9d
	movl	28(%rsp), %r8d
	movl	24(%rsp), %r11d
	jmp	.L1455
.L1826:
	movl	32(%rsp), %ecx
	movq	8(%rsp), %rdi
	movl	%r14d, %edx
	movl	$1, %esi
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	48(%rsp), %r9d
	movl	40(%rsp), %eax
	movl	36(%rsp), %r8d
	jmp	.L1291
.L1817:
	movl	40(%rsp), %ecx
	movq	8(%rsp), %rdi
	movl	%r8d, %edx
	movl	$1, %esi
	movl	%eax, 48(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_9attr_compES1_S1_EEEvP8TraceMemIT_Ebii.part.11
	movl	48(%rsp), %eax
	jmp	.L1163
.L1814:
	movq	8(%rsp), %rdi
	movl	%eax, %ecx
	movl	%r14d, %edx
	movl	$1, %esi
	movl	%r8d, 40(%rsp)
	movl	%r9d, 36(%rsp)
	call	_Z13bitonic_mergeIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii.part.12
	movl	40(%rsp), %r8d
	movl	36(%rsp), %r9d
	jmp	.L1360
.L1752:
	movq	8(%rsp), %rax
	movl	44(%rax), %r14d
	jmp	.L1326
.L1797:
	movl	44(%r15), %r10d
	jmp	.L1522
.L1791:
	movl	44(%r15), %r11d
	jmp	.L1493
.L1743:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	jmp	.L1261
.L1741:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %ebp
	jmp	.L1258
.L1739:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r13d
	jmp	.L1251
.L1806:
	movl	44(%r15), %r10d
	jmp	.L1546
.L1805:
	movl	44(%r15), %r10d
	jmp	.L1543
.L1803:
	movl	44(%r15), %r10d
	jmp	.L1536
.L1801:
	movl	44(%r15), %r10d
	jmp	.L1533
.L1737:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r13d
	jmp	.L1248
.L1730:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r8d
	jmp	.L1230
.L1726:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r14d
	jmp	.L1220
.L1813:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	movl	%r8d, %eax
	movl	%r8d, 36(%rsp)
	subl	%r12d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%rax,%r12), %r14d
	cmpl	%r14d, %r12d
	je	.L1357
	xorl	%esi, %esi
	movl	%r14d, %ecx
	movl	%r12d, %edx
	movl	%r9d, 40(%rsp)
	call	_Z12bitonic_sortIN5Table10TableEntryEXadL_ZNS0_8tid_compES1_S1_EEEvP8TraceMemIT_Ebii
	movl	36(%rsp), %r8d
	movl	40(%rsp), %r9d
	cmpl	$-1, %r8d
	jne	.L1629
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L1358
.L1810:
	movl	44(%r15), %r10d
	jmp	.L1512
.L1772:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r9d
	jmp	.L1393
.L1770:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r9d
	jmp	.L1390
.L1768:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	jmp	.L1383
.L1766:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r8d
	jmp	.L1380
.L1762:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	jmp	.L1369
.L1755:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r14d
	jmp	.L1336
.L1823:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r13d
	jmp	.L1177
.L1828:
	movq	8(%rsp), %rax
	movl	44(%rax), %ebx
	movl	%ebx, %eax
	subl	%r12d, %eax
	movl	%eax, %r14d
	shrl	$31, %r14d
	addl	%eax, %r14d
	sarl	%r14d
	addl	%r12d, %r14d
	cmpl	%r14d, %r12d
	jne	.L1295
	jmp	.L1282
.L1843:
	movl	44(%r15), %eax
	movl	%eax, %edx
	movl	%eax, 20(%rsp)
	subl	%r8d, %edx
	movl	%edx, %r10d
	shrl	$31, %r10d
	addl	%edx, %r10d
	sarl	%r10d
	addl	%r8d, %r10d
	cmpl	%r10d, %r8d
	jne	.L1459
	jmp	.L1446
.L1821:
	movq	8(%rsp), %rax
	movl	44(%rax), %r13d
	jmp	.L1174
.L1819:
	movq	8(%rsp), %rax
	movl	44(%rax), %ebx
	movl	%ebx, %eax
	subl	%r13d, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%r13d, %eax
	cmpl	%r13d, %eax
	jne	.L1167
	jmp	.L1154
.L1846:
	movl	44(%r15), %r10d
	jmp	.L1469
.L1845:
	movl	44(%r15), %r8d
	jmp	.L1466
.L1832:
	movq	8(%rsp), %rax
	movl	44(%rax), %eax
	jmp	.L1305
.L1830:
	movq	8(%rsp), %rax
	movl	44(%rax), %r12d
	jmp	.L1302
.L1717:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r13d
	jmp	.L1201
.L1788:
	movl	44(%r15), %r11d
	jmp	.L1483
.L1790:
	movl	44(%r15), %r9d
	jmp	.L1490
.L1728:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r12d
	jmp	.L1227
.L1796:
	movl	44(%r15), %r8d
	jmp	.L1519
.L1760:
	movq	8(%rsp), %rax
	movl	44(%rax), %r8d
	jmp	.L1366
.L1754:
	movq	8(%rsp), %rax
	movl	44(%rax), %r14d
	jmp	.L1333
.L1715:
	movq	8(%rsp), %rax
	movl	44(%rax), %r13d
	jmp	.L1198
.L1713:
	movq	8(%rsp), %rax
	movl	44(%rax), %r13d
	jmp	.L1191
.L1711:
	movq	8(%rsp), %rax
	movl	44(%rax), %r13d
	jmp	.L1188
.L1750:
	movq	8(%rsp), %rax
	movl	44(%rax), %r14d
	jmp	.L1323
.L1811:
	movq	8(%rsp), %rax
	movl	44(%rax), %r14d
	jmp	.L1352
.L1786:
	movl	44(%r15), %r9d
	jmp	.L1480
.L1724:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r14d
	movl	20(%rsp), %edi
	jmp	.L1217
.L1808:
	movl	44(%r15), %r8d
	jmp	.L1509
.L1834:
	leal	1(%rbx), %edi
	movl	%edi, 36(%rsp)
	jmp	.L1310
.L1745:
	leal	1(%r12), %esi
	movl	%esi, 56(%rsp)
	jmp	.L1266
.L1732:
	leal	1(%r13), %edi
	movl	%edi, 48(%rsp)
	jmp	.L1235
.L1569:
	movl	24(%rsp), %esi
	movl	20(%rsp), %ebx
	movl	%esi, 40(%rsp)
	jmp	.L1157
.L1650:
	movl	%ebx, %r10d
	movl	%ebp, 20(%rsp)
	jmp	.L1449
.L1609:
	movl	20(%rsp), %ebx
	movl	%r13d, 32(%rsp)
	jmp	.L1285
.L1825:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %edi
	movl	%edi, %edx
	movl	%edi, 32(%rsp)
	subl	%r14d, %edx
	movl	%edx, %ebx
	shrl	$31, %ebx
	addl	%edx, %ebx
	sarl	%ebx
	addl	%r14d, %ebx
	cmpl	%ebx, %r14d
	jne	.L1290
	jmp	.L1284
.L1816:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %esi
	movl	%esi, %edx
	movl	%esi, 40(%rsp)
	subl	%r8d, %edx
	movl	%edx, %ebx
	shrl	$31, %ebx
	addl	%edx, %ebx
	sarl	%ebx
	addl	%r8d, %ebx
	cmpl	%ebx, %r8d
	jne	.L1162
	jmp	.L1156
.L1833:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %r8d
	jmp	.L1308
.L1744:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %ebx
	jmp	.L1264
.L1733:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %ebp
	jmp	.L1236
.L1746:
	movq	8(%rsp), %rdi
	movl	44(%rdi), %ebx
	jmp	.L1267
.L1731:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %ebp
	jmp	.L1233
.L1836:
	movq	8(%rsp), %rsi
	movl	44(%rsi), %r8d
	jmp	.L1311
.L1840:
	movl	44(%r15), %esi
	movl	%esi, %edx
	movl	%esi, 20(%rsp)
	subl	%eax, %edx
	movl	%edx, %r10d
	shrl	$31, %r10d
	addl	%edx, %r10d
	sarl	%r10d
	addl	%eax, %r10d
	cmpl	%r10d, %eax
	jne	.L1454
	jmp	.L1448
.L1629:
	movl	%r8d, %eax
	jmp	.L1358
.L1838:
	movl	%ebx, %r13d
	movl	%ebx, %r8d
	movl	%ebp, %r9d
	jmp	.L1441
.L1605:
	movl	%r9d, 28(%rsp)
	movl	%edi, 24(%rsp)
	movl	%edi, %r12d
	movl	%r13d, %r8d
	jmp	.L1277
.L1565:
	movl	%esi, %r14d
	movl	%ebp, 36(%rsp)
	movl	%eax, 32(%rsp)
	movl	%eax, %r13d
	jmp	.L1149
.L1807:
	call	__stack_chk_fail@PLT
.L1644:
	movl	%ebp, 8(%rsp)
	movl	%ebx, %r14d
	jmp	.L1444
.L1603:
	movl	%edi, %ebp
	movl	%r13d, 28(%rsp)
	jmp	.L1280
.L1563:
	movl	%eax, %r12d
	movl	24(%rsp), %eax
	movl	%eax, 36(%rsp)
	jmp	.L1152
	.cfi_endproc
.LFE1955:
	.size	_Z4joinR5TableS0_S0_, .-_Z4joinR5TableS0_S0_
	.section	.text.unlikely._Z4joinR5TableS0_S0_
.LCOLDE27:
	.section	.text._Z4joinR5TableS0_S0_
.LHOTE27:
	.section	.rodata.str1.1
.LC28:
	.string	"Enclave begin\n"
.LC29:
	.string	"Enclave end\n"
	.section	.text.unlikely.process_input,"ax",@progbits
.LCOLDB30:
	.section	.text.process_input,"ax",@progbits
.LHOTB30:
	.p2align 4,,15
	.globl	process_input
	.hidden	process_input
	.type	process_input, @function
process_input:
.LFB1968:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1968
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	.LC28(%rip), %rdi
	subq	$280, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rax
	movq	%rax, 264(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %r13
.LEHB4:
	call	printf
	leaq	12(%rsp), %rcx
	leaq	8(%rsp), %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	_Z11parseTablesPcRiS0_
.LEHE4:
.LEHB5:
	call	init_time@PLT
.LEHE5:
	movslq	8(%rsp), %rdi
	movl	_ZN8TraceMemIN5Table10TableEntryEE5countE(%rip), %ebx
	movl	$32, %esi
	movq	$0, 72(%rsp)
	movq	$0, 80(%rsp)
	leaq	112(%rsp), %rbp
	movq	$0, 88(%rsp)
	movq	$0, 96(%rsp)
	movl	%ebx, 104(%rsp)
	movl	%edi, 108(%rsp)
	call	calloc@PLT
	movslq	12(%rsp), %rdi
	movq	%rax, 64(%rsp)
	leal	2(%rbx), %eax
	addl	$1, %ebx
	movl	$32, %esi
	movq	$0, 120(%rsp)
	movl	%ebx, 152(%rsp)
	leaq	64(%rsp), %rbx
	movq	$0, 128(%rsp)
	movq	$0, 136(%rsp)
	movq	$0, 144(%rsp)
	movl	%edi, 156(%rsp)
	movl	%eax, _ZN8TraceMemIN5Table10TableEntryEE5countE(%rip)
	call	calloc@PLT
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	movq	%rax, 112(%rsp)
.LEHB6:
	call	_Z4joinR5TableS0_S0_
	movq	112(%rsp), %rax
	leaq	16(%rbp), %rsi
	leaq	224(%rsp), %rdi
	leaq	208(%rsp), %rbp
	movq	%rax, 208(%rsp)
	movq	120(%rsp), %rax
	movq	%rax, 216(%rsp)
	call	_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC1ERKS8_
.LEHE6:
	movl	152(%rsp), %eax
	leaq	16(%rbx), %rsi
	leaq	160(%rsp), %rbx
	leaq	16(%rbx), %rdi
	movl	%eax, 248(%rsp)
	movl	156(%rsp), %eax
	movl	%eax, 252(%rsp)
	movq	64(%rsp), %rax
	movq	%rax, 160(%rsp)
	movq	72(%rsp), %rax
	movq	%rax, 168(%rsp)
.LEHB7:
	call	_ZNSt3__16vectorIN8TraceMemIN5Table10TableEntryEE8LogEntryENS_9allocatorIS5_EEEC1ERKS8_
.LEHE7:
	movl	104(%rsp), %eax
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	movl	%eax, 200(%rsp)
	movl	108(%rsp), %eax
	movl	%eax, 204(%rsp)
.LEHB8:
	call	_Z8toStringPc5TableS0_
.LEHE8:
	movq	176(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1848
	movq	184(%rsp), %rdx
	cmpq	%rdx, %rdi
	je	.L1850
	leaq	-8(%rdx), %rax
	subq	%rdi, %rax
	notq	%rax
	andq	$-8, %rax
	addq	%rdx, %rax
	movq	%rax, 184(%rsp)
.L1850:
	call	_ZdlPv@PLT
.L1848:
	movq	224(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1851
	movq	232(%rsp), %rdx
	cmpq	%rdx, %rdi
	je	.L1853
	leaq	-8(%rdx), %rax
	subq	%rdi, %rax
	notq	%rax
	andq	$-8, %rax
	addq	%rdx, %rax
	movq	%rax, 232(%rsp)
.L1853:
	call	_ZdlPv@PLT
.L1851:
	leaq	.LC29(%rip), %rdi
	xorl	%eax, %eax
.LEHB9:
	call	printf
.LEHE9:
	movq	128(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1854
	movq	136(%rsp), %rdx
	cmpq	%rdx, %rdi
	je	.L1856
	leaq	-8(%rdx), %rax
	subq	%rdi, %rax
	notq	%rax
	andq	$-8, %rax
	addq	%rdx, %rax
	movq	%rax, 136(%rsp)
.L1856:
	call	_ZdlPv@PLT
.L1854:
	movq	80(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1857
	movq	88(%rsp), %rdx
	cmpq	%rdx, %rdi
	je	.L1859
	leaq	-8(%rdx), %rax
	subq	%rdi, %rax
	notq	%rax
	andq	$-8, %rax
	addq	%rdx, %rax
	movq	%rax, 88(%rsp)
.L1859:
	call	_ZdlPv@PLT
.L1857:
	movq	32(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1847
	movq	40(%rsp), %rdx
	cmpq	%rdx, %rdi
	je	.L1862
	leaq	-8(%rdx), %rax
	subq	%rdi, %rax
	notq	%rax
	andq	$-8, %rax
	addq	%rdx, %rax
	movq	%rax, 40(%rsp)
.L1862:
	call	_ZdlPv@PLT
.L1847:
	movq	264(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L1938
	addq	$280, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L1888:
	.cfi_restore_state
	movq	%rax, %rbx
.L1882:
	movq	32(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1883
	movq	40(%rsp), %rax
	xorl	%ecx, %ecx
	movq	%rax, %rdx
.L1885:
	cmpq	%rdx, %rdi
	je	.L1884
	subq	$8, %rdx
	movl	$1, %ecx
	jmp	.L1885
.L1938:
	call	__stack_chk_fail@PLT
.L1891:
	movq	176(%rsp), %rdi
	movq	%rax, %rbx
	testq	%rdi, %rdi
	je	.L1868
	movq	184(%rsp), %rdx
	xorl	%ecx, %ecx
	movq	%rdx, %rax
.L1866:
	cmpq	%rax, %rdi
	je	.L1865
	subq	$8, %rax
	movl	$1, %ecx
	jmp	.L1866
.L1890:
	movq	%rax, %rbx
.L1868:
	movq	224(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1873
	movq	232(%rsp), %rdx
	xorl	%ecx, %ecx
	movq	%rdx, %rax
.L1871:
	cmpq	%rax, %rdi
	je	.L1870
	subq	$8, %rax
	movl	$1, %ecx
	jmp	.L1871
.L1889:
	movq	%rax, %rbx
.L1873:
	movq	128(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1874
	movq	136(%rsp), %rax
	xorl	%ecx, %ecx
	movq	%rax, %rdx
.L1876:
	cmpq	%rdx, %rdi
	je	.L1875
	subq	$8, %rdx
	movl	$1, %ecx
	jmp	.L1876
.L1870:
	movq	%rdx, %rax
	subq	%rdi, %rax
	andq	$-8, %rax
	subq	%rax, %rdx
	testb	%cl, %cl
	je	.L1872
	movq	%rdx, 232(%rsp)
.L1872:
	call	_ZdlPv@PLT
	jmp	.L1873
.L1875:
	movq	%rax, %rdx
	subq	%rdi, %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	testb	%cl, %cl
	je	.L1877
	movq	%rax, 136(%rsp)
.L1877:
	call	_ZdlPv@PLT
.L1874:
	movq	80(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1882
	movq	88(%rsp), %rax
	xorl	%ecx, %ecx
	movq	%rax, %rdx
.L1880:
	cmpq	%rdx, %rdi
	je	.L1879
	subq	$8, %rdx
	movl	$1, %ecx
	jmp	.L1880
.L1884:
	movq	%rax, %rdx
	subq	%rdi, %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	testb	%cl, %cl
	je	.L1886
	movq	%rax, 40(%rsp)
.L1886:
	call	_ZdlPv@PLT
.L1883:
	movq	%rbx, %rdi
.LEHB10:
	call	_Unwind_Resume@PLT
.LEHE10:
.L1865:
	movq	%rdx, %rax
	subq	%rdi, %rax
	andq	$-8, %rax
	subq	%rax, %rdx
	testb	%cl, %cl
	je	.L1867
	movq	%rdx, 184(%rsp)
.L1867:
	call	_ZdlPv@PLT
	jmp	.L1868
.L1879:
	movq	%rax, %rdx
	subq	%rdi, %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	testb	%cl, %cl
	je	.L1881
	movq	%rax, 88(%rsp)
.L1881:
	call	_ZdlPv@PLT
	jmp	.L1882
	.cfi_endproc
.LFE1968:
	.section	.gcc_except_table.process_input,"a",@progbits
.LLSDA1968:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1968-.LLSDACSB1968
.LLSDACSB1968:
	.uleb128 .LEHB4-.LFB1968
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB5-.LFB1968
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L1888-.LFB1968
	.uleb128 0
	.uleb128 .LEHB6-.LFB1968
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L1889-.LFB1968
	.uleb128 0
	.uleb128 .LEHB7-.LFB1968
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L1890-.LFB1968
	.uleb128 0
	.uleb128 .LEHB8-.LFB1968
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L1891-.LFB1968
	.uleb128 0
	.uleb128 .LEHB9-.LFB1968
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L1889-.LFB1968
	.uleb128 0
	.uleb128 .LEHB10-.LFB1968
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
.LLSDACSE1968:
	.section	.text.process_input
	.size	process_input, .-process_input
	.section	.text.unlikely.process_input
.LCOLDE30:
	.section	.text.process_input
.LHOTE30:
	.section	.rodata._ZZ16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_EiE8__func__,"a",@progbits
	.align 16
	.type	_ZZ16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_EiE8__func__, @object
	.size	_ZZ16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_EiE8__func__, 17
_ZZ16obliv_distributeIN5Table10TableEntryEXadL_ZNS0_9entry_indES1_EEEvP8TraceMemIT_EiE8__func__:
	.string	"obliv_distribute"
	.section	.rodata._ZZN8TraceMemIN5Table10TableEntryEE6write2EiS1_E8__func__,"a",@progbits
	.type	_ZZN8TraceMemIN5Table10TableEntryEE6write2EiS1_E8__func__, @object
	.size	_ZZN8TraceMemIN5Table10TableEntryEE6write2EiS1_E8__func__, 7
_ZZN8TraceMemIN5Table10TableEntryEE6write2EiS1_E8__func__:
	.string	"write2"
	.section	.rodata._ZZ4joinR5TableS0_S0_E8__func__,"a",@progbits
	.type	_ZZ4joinR5TableS0_S0_E8__func__, @object
	.size	_ZZ4joinR5TableS0_S0_E8__func__, 5
_ZZ4joinR5TableS0_S0_E8__func__:
	.string	"join"
	.section	.rodata._ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__,"a",@progbits
	.type	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__, @object
	.size	_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__, 6
_ZZN8TraceMemIN5Table10TableEntryEE5writeEiS1_E8__func__:
	.string	"write"
	.section	.rodata._ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__,"a",@progbits
	.type	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__, @object
	.size	_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__, 5
_ZZN8TraceMemIN5Table10TableEntryEE4readEiE8__func__:
	.string	"read"
	.hidden	_ZN8TraceMemIN5Table10TableEntryEE5countE
	.weak	_ZN8TraceMemIN5Table10TableEntryEE5countE
	.section	.bss._ZN8TraceMemIN5Table10TableEntryEE5countE,"awG",@nobits,_ZN8TraceMemIN5Table10TableEntryEE5countE,comdat
	.align 4
	.type	_ZN8TraceMemIN5Table10TableEntryEE5countE, @gnu_unique_object
	.size	_ZN8TraceMemIN5Table10TableEntryEE5countE, 4
_ZN8TraceMemIN5Table10TableEntryEE5countE:
	.zero	4
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
