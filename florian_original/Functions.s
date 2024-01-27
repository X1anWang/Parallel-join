	.file	"Functions.cpp"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"memcmp(s1, s2, strlen(s1)) == 0"
	.align 8
.LC1:
	.string	"Enclave/Edger8rSyntax/Functions.cpp"
	.section	.text.unlikely.ecall_function_calling_convs,"ax",@progbits
.LCOLDB2:
	.section	.text.ecall_function_calling_convs,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.globl	ecall_function_calling_convs
	.hidden	ecall_function_calling_convs
	.type	ecall_function_calling_convs, @function
ecall_function_calling_convs:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$1024, %ecx
	movl	$12594, %edx
	movl	$12345, %esi
	movl	$10, %r8d
	subq	$8248, %rsp
	.cfi_def_cfa_offset 8272
	movq	%fs:40, %rax
	movq	%rax, 8232(%rsp)
	xorl	%eax, %eax
	movabsq	$4050765991979987505, %rax
	leaq	32(%rsp), %rdi
	leaq	16(%rsp), %rbp
	movq	%rax, (%rsp)
	movl	$12345, %eax
	movw	%dx, 24(%rsp)
	movw	%ax, 8(%rsp)
	movabsq	$3689632501694216496, %rax
	movq	%rbp, %rdx
	movq	%rax, 16(%rsp)
	xorl	%eax, %eax
	movb	$0, 10(%rsp)
	rep stosq
	movabsq	$4050765991979987505, %rax
	movw	%si, 40(%rsp)
	xorl	%edi, %edi
	movq	%rsp, %rsi
	movb	$0, 26(%rsp)
	movq	%rax, 32(%rsp)
	call	memccpy@PLT
	testl	%eax, %eax
	jne	.L14
	movq	%rsp, %rbx
	movq	%rsp, %rdx
.L3:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L3
	movl	%eax, %ecx
	movq	%rbx, %rdi
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	movl	%eax, %esi
	cmove	%rcx, %rdx
	addb	%al, %sil
	movq	%rbp, %rsi
	sbbq	$3, %rdx
	subq	%rbx, %rdx
	call	memcmp@PLT
	testl	%eax, %eax
	je	.L1
	leaq	.LC0(%rip), %rcx
	leaq	_ZZ28ecall_function_calling_convsE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$58, %esi
	call	__assert@PLT
.L1:
	movq	8232(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L15
	addq	$8248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L14:
	call	abort@PLT
	.cfi_endproc
.LFE0:
	.size	ecall_function_calling_convs, .-ecall_function_calling_convs
	.section	.text.unlikely.ecall_function_calling_convs
.LCOLDE2:
	.section	.text.ecall_function_calling_convs
.LHOTE2:
	.section	.text.unlikely.ecall_function_public,"ax",@progbits
.LCOLDB3:
	.section	.text.ecall_function_public,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	ecall_function_public
	.hidden	ecall_function_public
	.type	ecall_function_public, @function
ecall_function_public:
.LFB1:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	ocall_function_allow@PLT
	testl	%eax, %eax
	jne	.L19
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	call	abort@PLT
	.cfi_endproc
.LFE1:
	.size	ecall_function_public, .-ecall_function_public
	.section	.text.unlikely.ecall_function_public
.LCOLDE3:
	.section	.text.ecall_function_public
.LHOTE3:
	.section	.text.unlikely.ecall_function_private,"ax",@progbits
.LCOLDB4:
	.section	.text.ecall_function_private,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	ecall_function_private
	.hidden	ecall_function_private
	.type	ecall_function_private, @function
ecall_function_private:
.LFB2:
	.cfi_startproc
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE2:
	.size	ecall_function_private, .-ecall_function_private
	.section	.text.unlikely.ecall_function_private
.LCOLDE4:
	.section	.text.ecall_function_private
.LHOTE4:
	.section	.rodata._ZZ28ecall_function_calling_convsE8__func__,"a",@progbits
	.align 16
	.type	_ZZ28ecall_function_calling_convsE8__func__, @object
	.size	_ZZ28ecall_function_calling_convsE8__func__, 29
_ZZ28ecall_function_calling_convsE8__func__:
	.string	"ecall_function_calling_convs"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
