	.file	"Pointers.cpp"
	.section	.text.unlikely._Z17checksum_internalPcm,"ax",@progbits
.LCOLDB0:
	.section	.text._Z17checksum_internalPcm,"ax",@progbits
.LHOTB0:
	.p2align 4,,15
	.globl	_Z17checksum_internalPcm
	.hidden	_Z17checksum_internalPcm
	.type	_Z17checksum_internalPcm, @function
_Z17checksum_internalPcm:
.LFB0:
	.cfi_startproc
	cmpq	$1, %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	jbe	.L14
	leaq	-2(%rsi), %rcx
	movq	%rdi, %rdx
	andl	$15, %edx
	movq	%rcx, %r11
	shrq	%rdx
	shrq	%r11
	negq	%rdx
	leaq	1(%r11), %r9
	andl	$7, %edx
	cmpq	%r9, %rdx
	cmova	%r9, %rdx
	cmpq	$10, %r9
	ja	.L50
	movq	%r9, %rdx
.L3:
	cmpq	$1, %rdx
	leaq	2(%rdi), %r8
	movswl	(%rdi), %eax
	je	.L5
	movswl	2(%rdi), %ecx
	leaq	4(%rdi), %r8
	addl	%ecx, %eax
	cmpq	$2, %rdx
	leaq	-4(%rsi), %rcx
	je	.L5
	movswl	4(%rdi), %ecx
	leaq	6(%rdi), %r8
	addl	%ecx, %eax
	cmpq	$3, %rdx
	leaq	-6(%rsi), %rcx
	je	.L5
	movswl	6(%rdi), %ecx
	leaq	8(%rdi), %r8
	addl	%ecx, %eax
	cmpq	$4, %rdx
	leaq	-8(%rsi), %rcx
	je	.L5
	movswl	8(%rdi), %ecx
	leaq	10(%rdi), %r8
	addl	%ecx, %eax
	cmpq	$5, %rdx
	leaq	-10(%rsi), %rcx
	je	.L5
	movswl	10(%rdi), %ecx
	leaq	12(%rdi), %r8
	addl	%ecx, %eax
	cmpq	$6, %rdx
	leaq	-12(%rsi), %rcx
	je	.L5
	movswl	12(%rdi), %ecx
	leaq	14(%rdi), %r8
	addl	%ecx, %eax
	cmpq	$7, %rdx
	leaq	-14(%rsi), %rcx
	je	.L5
	movswl	14(%rdi), %ecx
	leaq	16(%rdi), %r8
	addl	%ecx, %eax
	cmpq	$8, %rdx
	leaq	-16(%rsi), %rcx
	je	.L5
	movswl	16(%rdi), %ecx
	leaq	18(%rdi), %r8
	addl	%ecx, %eax
	cmpq	$9, %rdx
	leaq	-18(%rsi), %rcx
	je	.L5
	movswl	18(%rdi), %ecx
	leaq	20(%rdi), %r8
	addl	%ecx, %eax
	leaq	-20(%rsi), %rcx
.L5:
	cmpq	%rdx, %r9
	je	.L6
.L4:
	movq	%r9, %rbx
	subq	%rdx, %r11
	subq	%rdx, %rbx
	leaq	-8(%rbx), %r10
	shrq	$3, %r10
	addq	$1, %r10
	cmpq	$6, %r11
	leaq	0(,%r10,8), %rbp
	jbe	.L7
	pxor	%xmm0, %xmm0
	leaq	(%rdi,%rdx,2), %r11
	xorl	%edx, %edx
	pxor	%xmm4, %xmm4
.L9:
	movdqa	(%r11), %xmm1
	movdqa	%xmm4, %xmm2
	addq	$1, %rdx
	addq	$16, %r11
	pcmpgtw	%xmm1, %xmm2
	movdqa	%xmm1, %xmm3
	cmpq	%rdx, %r10
	punpcklwd	%xmm2, %xmm3
	punpckhwd	%xmm2, %xmm1
	paddd	%xmm3, %xmm0
	paddd	%xmm1, %xmm0
	ja	.L9
	movdqa	%xmm0, %xmm1
	leaq	(%r8,%rbp,2), %r8
	psrldq	$8, %xmm1
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %edx
	addl	%edx, %eax
	movq	%rbp, %rdx
	negq	%rdx
	cmpq	%rbp, %rbx
	leaq	(%rcx,%rdx,2), %rcx
	je	.L6
.L7:
	movswl	(%r8), %edx
	addl	%edx, %eax
	leaq	-2(%rcx), %rdx
	cmpq	$1, %rdx
	jbe	.L6
	movswl	2(%r8), %edx
	addl	%edx, %eax
	leaq	-4(%rcx), %rdx
	cmpq	$1, %rdx
	jbe	.L6
	movswl	4(%r8), %edx
	addl	%edx, %eax
	leaq	-6(%rcx), %rdx
	cmpq	$1, %rdx
	jbe	.L6
	movswl	6(%r8), %edx
	addl	%edx, %eax
	leaq	-8(%rcx), %rdx
	cmpq	$1, %rdx
	jbe	.L6
	movswl	8(%r8), %edx
	addl	%edx, %eax
	leaq	-10(%rcx), %rdx
	cmpq	$1, %rdx
	jbe	.L6
	movswl	10(%r8), %edx
	addl	%edx, %eax
	leaq	-12(%rcx), %rdx
	cmpq	$1, %rdx
	jbe	.L6
	movswl	12(%r8), %edx
	addl	%edx, %eax
.L6:
	leaq	(%rdi,%r9,2), %rdi
	andl	$1, %esi
.L2:
	testq	%rsi, %rsi
	je	.L13
	movsbl	(%rdi), %edx
	addl	%edx, %eax
.L13:
	notl	%eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L50:
	.cfi_restore_state
	testq	%rdx, %rdx
	jne	.L3
	movq	%rdi, %r8
	movq	%rsi, %rcx
	xorl	%eax, %eax
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L14:
	xorl	%eax, %eax
	jmp	.L2
	.cfi_endproc
.LFE0:
	.size	_Z17checksum_internalPcm, .-_Z17checksum_internalPcm
	.section	.text.unlikely._Z17checksum_internalPcm
.LCOLDE0:
	.section	.text._Z17checksum_internalPcm
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Checksum(0x%p, %zu) = 0x%x\n"
.LC2:
	.string	"SGX_SUCCESS"
	.section	.text.unlikely.ecall_pointer_user_check,"ax",@progbits
.LCOLDB3:
	.section	.text.ecall_pointer_user_check,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	ecall_pointer_user_check
	.hidden	ecall_pointer_user_check
	.type	ecall_pointer_user_check, @function
ecall_pointer_user_check:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	subq	$120, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	call	sgx_is_outside_enclave@PLT
	cmpl	$1, %eax
	jne	.L92
	xorl	%eax, %eax
	movq	%rsp, %rdi
	movl	$12, %ecx
	rep stosq
	cmpq	$100, %rbx
	movl	$100, %eax
	movq	%rsp, %rdx
	cmova	%rax, %rbx
	movq	%rbp, %rsi
	cmpl	$8, %ebx
	movl	$0, (%rdi)
	movq	%rsp, %rdi
	jb	.L53
	movl	%ebx, %ecx
	shrl	$3, %ecx
	rep movsq
.L53:
	xorl	%eax, %eax
	testb	$4, %bl
	je	.L54
	movl	(%rsi), %eax
	movl	%eax, (%rdi)
	movl	$4, %eax
.L54:
	testb	$2, %bl
	je	.L55
	movzwl	(%rsi,%rax), %ecx
	movw	%cx, (%rdi,%rax)
	addq	$2, %rax
.L55:
	testb	$1, %bl
	je	.L56
	movzbl	(%rsi,%rax), %ecx
	movb	%cl, (%rdi,%rax)
.L56:
	cmpq	$1, %rbx
	jbe	.L72
	leaq	-2(%rbx), %rcx
	movq	%rcx, %rax
	shrq	%rax
	leaq	1(%rax), %r8
	subq	$7, %rax
	shrq	$3, %rax
	addq	$1, %rax
	cmpq	$13, %rcx
	leaq	0(,%rax,8), %rdi
	jbe	.L73
	pxor	%xmm0, %xmm0
	xorl	%ecx, %ecx
	pxor	%xmm3, %xmm3
.L60:
	movq	%rcx, %rsi
	movdqa	%xmm3, %xmm2
	salq	$4, %rsi
	addq	$1, %rcx
	movdqa	(%rdx,%rsi), %xmm1
	cmpq	%rcx, %rax
	pcmpgtw	%xmm1, %xmm2
	movdqa	%xmm1, %xmm4
	punpckhwd	%xmm2, %xmm1
	punpcklwd	%xmm2, %xmm4
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	ja	.L60
	movdqa	%xmm0, %xmm1
	movq	%rdi, %rax
	leaq	(%rdx,%rdi,2), %rsi
	negq	%rax
	cmpq	%r8, %rdi
	psrldq	$8, %xmm1
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	leaq	(%rbx,%rax,2), %rax
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %ecx
	je	.L62
.L58:
	movswl	(%rsi), %edi
	addl	%edi, %ecx
	leaq	-2(%rax), %rdi
	cmpq	$1, %rdi
	jbe	.L62
	movswl	2(%rsi), %edi
	addl	%edi, %ecx
	leaq	-4(%rax), %rdi
	cmpq	$1, %rdi
	jbe	.L62
	movswl	4(%rsi), %edi
	addl	%edi, %ecx
	leaq	-6(%rax), %rdi
	cmpq	$1, %rdi
	jbe	.L62
	movswl	6(%rsi), %edi
	addl	%edi, %ecx
	leaq	-8(%rax), %rdi
	cmpq	$1, %rdi
	jbe	.L62
	movswl	8(%rsi), %edi
	addl	%edi, %ecx
	leaq	-10(%rax), %rdi
	cmpq	$1, %rdi
	jbe	.L62
	movswl	10(%rsi), %edi
	subq	$12, %rax
	addl	%edi, %ecx
	cmpq	$1, %rax
	jbe	.L62
	movswl	12(%rsi), %eax
	addl	%eax, %ecx
.L62:
	movq	%rbx, %rax
	leaq	(%rdx,%r8,2), %rdx
	andl	$1, %eax
.L57:
	testq	%rax, %rax
	je	.L64
	movsbl	(%rdx), %eax
	addl	%eax, %ecx
.L64:
	leaq	.LC1(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	notl	%ecx
	movq	%rbp, %rsi
	call	printf@PLT
	cmpq	$12, %rbx
	movl	$12, %eax
	leaq	.LC2(%rip), %rdx
	cmovbe	%rbx, %rax
	cmpl	$8, %eax
	jnb	.L65
	testb	$4, %al
	jne	.L93
	testl	%eax, %eax
	je	.L66
	movzbl	.LC2(%rip), %ecx
	testb	$2, %al
	movb	%cl, 0(%rbp)
	jne	.L94
.L66:
	movq	104(%rsp), %rdx
	xorq	%fs:40, %rdx
	movq	%rbx, %rax
	jne	.L95
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L65:
	.cfi_restore_state
	movq	.LC2(%rip), %rcx
	movq	%rcx, 0(%rbp)
	movl	%eax, %ecx
	movq	-8(%rdx,%rcx), %rsi
	movq	%rsi, -8(%rbp,%rcx)
	leaq	8(%rbp), %rcx
	andq	$-8, %rcx
	subq	%rcx, %rbp
	subq	%rbp, %rdx
	addl	%eax, %ebp
	andl	$-8, %ebp
	cmpl	$8, %ebp
	jb	.L66
	andl	$-8, %ebp
	xorl	%eax, %eax
.L69:
	movl	%eax, %esi
	addl	$8, %eax
	movq	(%rdx,%rsi), %rdi
	cmpl	%ebp, %eax
	movq	%rdi, (%rcx,%rsi)
	jb	.L69
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L73:
	movq	%rbx, %rax
	xorl	%ecx, %ecx
	movq	%rdx, %rsi
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L93:
	movl	%eax, %eax
	movl	.LC2(%rip), %ecx
	movl	-4(%rdx,%rax), %edx
	movl	%ecx, 0(%rbp)
	movl	%edx, -4(%rbp,%rax)
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L72:
	movq	%rbx, %rax
	xorl	%ecx, %ecx
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L94:
	movl	%eax, %eax
	movzwl	-2(%rdx,%rax), %edx
	movw	%dx, -2(%rbp,%rax)
	jmp	.L66
.L92:
	call	abort@PLT
.L95:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1:
	.size	ecall_pointer_user_check, .-ecall_pointer_user_check
	.section	.text.unlikely.ecall_pointer_user_check
.LCOLDE3:
	.section	.text.ecall_pointer_user_check
.LHOTE3:
	.section	.text.unlikely.ecall_pointer_in,"ax",@progbits
.LCOLDB4:
	.section	.text.ecall_pointer_in,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	ecall_pointer_in
	.hidden	ecall_pointer_in
	.type	ecall_pointer_in, @function
ecall_pointer_in:
.LFB15:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$4, %esi
	movq	%rdi, %rbx
	call	sgx_is_within_enclave@PLT
	cmpl	$1, %eax
	jne	.L99
	movl	$1234, (%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L99:
	.cfi_restore_state
	call	abort@PLT
	.cfi_endproc
.LFE15:
	.size	ecall_pointer_in, .-ecall_pointer_in
	.section	.text.unlikely.ecall_pointer_in
.LCOLDE4:
	.section	.text.ecall_pointer_in
.LHOTE4:
	.section	.rodata.str1.1
.LC5:
	.string	"*val == 0"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"Enclave/Edger8rSyntax/Pointers.cpp"
	.section	.text.unlikely.ecall_pointer_out,"ax",@progbits
.LCOLDB7:
	.section	.text.ecall_pointer_out,"ax",@progbits
.LHOTB7:
	.p2align 4,,15
	.globl	ecall_pointer_out
	.hidden	ecall_pointer_out
	.type	ecall_pointer_out, @function
ecall_pointer_out:
.LFB3:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$4, %esi
	movq	%rdi, %rbx
	call	sgx_is_within_enclave@PLT
	cmpl	$1, %eax
	jne	.L104
	movl	(%rbx), %eax
	testl	%eax, %eax
	je	.L102
	leaq	.LC5(%rip), %rcx
	leaq	_ZZ17ecall_pointer_outE8__func__(%rip), %rdx
	leaq	.LC6(%rip), %rdi
	movl	$107, %esi
	call	__assert@PLT
.L102:
	movl	$1234, (%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L104:
	.cfi_restore_state
	call	abort@PLT
	.cfi_endproc
.LFE3:
	.size	ecall_pointer_out, .-ecall_pointer_out
	.section	.text.unlikely.ecall_pointer_out
.LCOLDE7:
	.section	.text.ecall_pointer_out
.LHOTE7:
	.section	.text.unlikely.ecall_pointer_in_out,"ax",@progbits
.LCOLDB8:
	.section	.text.ecall_pointer_in_out,"ax",@progbits
.LHOTB8:
	.p2align 4,,15
	.globl	ecall_pointer_in_out
	.hidden	ecall_pointer_in_out
	.type	ecall_pointer_in_out, @function
ecall_pointer_in_out:
.LFB4:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$4, %esi
	movq	%rdi, %rbx
	call	sgx_is_within_enclave@PLT
	cmpl	$1, %eax
	jne	.L108
	movl	$1234, (%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L108:
	.cfi_restore_state
	call	abort@PLT
	.cfi_endproc
.LFE4:
	.size	ecall_pointer_in_out, .-ecall_pointer_in_out
	.section	.text.unlikely.ecall_pointer_in_out
.LCOLDE8:
	.section	.text.ecall_pointer_in_out
.LHOTE8:
	.section	.rodata.str1.1
.LC9:
	.string	"val == 0"
.LC10:
	.string	"val == 1234"
	.section	.text.unlikely.ocall_pointer_attr,"ax",@progbits
.LCOLDB11:
	.section	.text.ocall_pointer_attr,"ax",@progbits
.LHOTB11:
	.p2align 4,,15
	.globl	ocall_pointer_attr
	.hidden	ocall_pointer_attr
	.type	ocall_pointer_attr, @function
ocall_pointer_attr:
.LFB5:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	leaq	4(%rsp), %rbx
	movl	$0, 4(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rdi
	call	ocall_pointer_user_check@PLT
	testl	%eax, %eax
	jne	.L111
	movq	%rbx, %rdi
	movl	$0, 4(%rsp)
	call	ocall_pointer_in@PLT
	testl	%eax, %eax
	jne	.L111
	movl	4(%rsp), %eax
	testl	%eax, %eax
	jne	.L117
.L112:
	movq	%rbx, %rdi
	movl	$0, 4(%rsp)
	call	ocall_pointer_out@PLT
	testl	%eax, %eax
	jne	.L111
	cmpl	$1234, 4(%rsp)
	je	.L113
	leaq	.LC10(%rip), %rcx
	leaq	_ZZ18ocall_pointer_attrE8__func__(%rip), %rdx
	leaq	.LC6(%rip), %rdi
	movl	$143, %esi
	call	__assert@PLT
.L113:
	movq	%rbx, %rdi
	movl	$0, 4(%rsp)
	call	ocall_pointer_in_out@PLT
	testl	%eax, %eax
	jne	.L111
	cmpl	$1234, 4(%rsp)
	je	.L109
	leaq	.LC10(%rip), %rcx
	leaq	_ZZ18ocall_pointer_attrE8__func__(%rip), %rdx
	leaq	.LC6(%rip), %rdi
	movl	$149, %esi
	call	__assert@PLT
.L109:
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L118
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L117:
	.cfi_restore_state
	leaq	.LC9(%rip), %rcx
	leaq	_ZZ18ocall_pointer_attrE8__func__(%rip), %rdx
	leaq	.LC6(%rip), %rdi
	movl	$137, %esi
	call	__assert@PLT
	jmp	.L112
.L111:
	call	abort@PLT
.L118:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5:
	.size	ocall_pointer_attr, .-ocall_pointer_attr
	.section	.text.unlikely.ocall_pointer_attr
.LCOLDE11:
	.section	.text.ocall_pointer_attr
.LHOTE11:
	.section	.rodata.str1.1
.LC12:
	.string	"0987654321"
	.section	.text.unlikely.ecall_pointer_string,"ax",@progbits
.LCOLDB13:
	.section	.text.ecall_pointer_string,"ax",@progbits
.LHOTB13:
	.p2align 4,,15
	.globl	ecall_pointer_string
	.hidden	ecall_pointer_string
	.type	ecall_pointer_string, @function
ecall_pointer_string:
.LFB6:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	strlen@PLT
	movq	%rbx, %rdi
	leaq	.LC12(%rip), %rsi
	movq	%rax, %rdx
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	strncpy@PLT
	.cfi_endproc
.LFE6:
	.size	ecall_pointer_string, .-ecall_pointer_string
	.section	.text.unlikely.ecall_pointer_string
.LCOLDE13:
	.section	.text.ecall_pointer_string
.LHOTE13:
	.section	.text.unlikely.ecall_pointer_string_const,"ax",@progbits
.LCOLDB14:
	.section	.text.ecall_pointer_string_const,"ax",@progbits
.LHOTB14:
	.p2align 4,,15
	.globl	ecall_pointer_string_const
	.hidden	ecall_pointer_string_const
	.type	ecall_pointer_string_const, @function
ecall_pointer_string_const:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	strlen@PLT
	movq	%rax, %rdi
	call	_Znam@PLT
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	strlen@PLT
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	call	strncpy@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZdaPv@PLT
	.cfi_endproc
.LFE7:
	.size	ecall_pointer_string_const, .-ecall_pointer_string_const
	.section	.text.unlikely.ecall_pointer_string_const
.LCOLDE14:
	.section	.text.ecall_pointer_string_const
.LHOTE14:
	.section	.text.unlikely.ecall_pointer_size,"ax",@progbits
.LCOLDB15:
	.section	.text.ecall_pointer_size,"ax",@progbits
.LHOTB15:
	.p2align 4,,15
	.globl	ecall_pointer_size
	.hidden	ecall_pointer_size
	.type	ecall_pointer_size, @function
ecall_pointer_size:
.LFB13:
	.cfi_startproc
	movq	%rsi, %rdx
	leaq	.LC12(%rip), %rsi
	jmp	strncpy@PLT
	.cfi_endproc
.LFE13:
	.size	ecall_pointer_size, .-ecall_pointer_size
	.section	.text.unlikely.ecall_pointer_size
.LCOLDE15:
	.section	.text.ecall_pointer_size
.LHOTE15:
	.section	.text.unlikely.ecall_pointer_count,"ax",@progbits
.LCOLDB18:
	.section	.text.ecall_pointer_count,"ax",@progbits
.LHOTB18:
	.p2align 4,,15
	.globl	ecall_pointer_count
	.hidden	ecall_pointer_count
	.type	ecall_pointer_count, @function
ecall_pointer_count:
.LFB9:
	.cfi_startproc
	movl	%esi, %ecx
	subl	$1, %ecx
	js	.L157
	movslq	%esi, %r9
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	salq	$2, %r9
	leaq	-16(%rdi,%r9), %rdx
	andl	$15, %edx
	shrq	$2, %rdx
	cmpl	%edx, %esi
	cmovbe	%esi, %edx
	cmpl	$6, %esi
	cmovbe	%esi, %edx
	testl	%edx, %edx
	je	.L136
	movslq	%ecx, %rax
	cmpl	$1, %edx
	movl	$0, (%rdi,%rax,4)
	leal	-2(%rsi), %eax
	je	.L128
	movl	%ecx, %ebx
	movslq	%eax, %r8
	subl	%eax, %ebx
	cmpl	$2, %edx
	leal	-3(%rsi), %eax
	movl	%ebx, (%rdi,%r8,4)
	je	.L128
	movl	%ecx, %ebx
	movslq	%eax, %r8
	subl	%eax, %ebx
	cmpl	$3, %edx
	leal	-4(%rsi), %eax
	movl	%ebx, (%rdi,%r8,4)
	je	.L128
	movl	%ecx, %ebx
	movslq	%eax, %r8
	subl	%eax, %ebx
	cmpl	$4, %edx
	leal	-5(%rsi), %eax
	movl	%ebx, (%rdi,%r8,4)
	je	.L128
	movl	%ecx, %ebx
	movslq	%eax, %r8
	subl	%eax, %ebx
	cmpl	$5, %edx
	leal	-6(%rsi), %eax
	movl	%ebx, (%rdi,%r8,4)
	je	.L128
	movl	%ecx, %ebx
	movslq	%eax, %r8
	subl	%eax, %ebx
	leal	-7(%rsi), %eax
	movl	%ebx, (%rdi,%r8,4)
.L128:
	cmpl	%edx, %esi
	je	.L124
.L127:
	subl	%edx, %esi
	movl	%ecx, %ebx
	movl	%edx, %r10d
	leal	-4(%rsi), %r8d
	subl	%edx, %ebx
	shrl	$2, %r8d
	addl	$1, %r8d
	cmpl	$2, %ebx
	leal	0(,%r8,4), %r11d
	jbe	.L130
	movl	%eax, -4(%rsp)
	notq	%r10
	movd	-4(%rsp), %xmm4
	movl	%ecx, -4(%rsp)
	leaq	-12(%r9,%r10,4), %rdx
	movd	-4(%rsp), %xmm5
	xorl	%r9d, %r9d
	pshufd	$0, %xmm4, %xmm0
	movdqa	.LC17(%rip), %xmm2
	pshufd	$0, %xmm5, %xmm3
	addq	%rdi, %rdx
	paddd	.LC16(%rip), %xmm0
.L132:
	movdqa	%xmm3, %xmm1
	addl	$1, %r9d
	subq	$16, %rdx
	psubd	%xmm0, %xmm1
	pshufd	$27, %xmm1, %xmm1
	paddd	%xmm2, %xmm0
	movaps	%xmm1, 16(%rdx)
	cmpl	%r9d, %r8d
	ja	.L132
	subl	%r11d, %eax
	cmpl	%r11d, %esi
	je	.L124
.L130:
	movl	%ecx, %esi
	movslq	%eax, %rdx
	subl	%eax, %esi
	movl	%esi, (%rdi,%rdx,4)
	leal	-1(%rax), %edx
	cmpl	$-1, %edx
	je	.L124
	movl	%ecx, %ebx
	subl	$2, %eax
	movslq	%edx, %rsi
	subl	%edx, %ebx
	cmpl	$-1, %eax
	movl	%ebx, (%rdi,%rsi,4)
	je	.L124
	movslq	%eax, %rdx
	subl	%eax, %ecx
	movl	%ecx, (%rdi,%rdx,4)
.L124:
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.L157:
	rep ret
	.p2align 4,,10
	.p2align 3
.L136:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%ecx, %eax
	jmp	.L127
	.cfi_endproc
.LFE9:
	.size	ecall_pointer_count, .-ecall_pointer_count
	.section	.text.unlikely.ecall_pointer_count
.LCOLDE18:
	.section	.text.ecall_pointer_count
.LHOTE18:
	.section	.text.unlikely.ecall_pointer_isptr_readonly,"ax",@progbits
.LCOLDB19:
	.section	.text.ecall_pointer_isptr_readonly,"ax",@progbits
.LHOTB19:
	.p2align 4,,15
	.globl	ecall_pointer_isptr_readonly
	.hidden	ecall_pointer_isptr_readonly
	.type	ecall_pointer_isptr_readonly, @function
ecall_pointer_isptr_readonly:
.LFB10:
	.cfi_startproc
	movq	%rsi, %rdx
	leaq	.LC12(%rip), %rsi
	jmp	strncpy@PLT
	.cfi_endproc
.LFE10:
	.size	ecall_pointer_isptr_readonly, .-ecall_pointer_isptr_readonly
	.section	.text.unlikely.ecall_pointer_isptr_readonly
.LCOLDE19:
	.section	.text.ecall_pointer_isptr_readonly
.LHOTE19:
	.section	.text.unlikely._Z14get_buffer_lenPKc,"ax",@progbits
.LCOLDB20:
	.section	.text._Z14get_buffer_lenPKc,"ax",@progbits
.LHOTB20:
	.p2align 4,,15
	.globl	_Z14get_buffer_lenPKc
	.hidden	_Z14get_buffer_lenPKc
	.type	_Z14get_buffer_lenPKc, @function
_Z14get_buffer_lenPKc:
.LFB11:
	.cfi_startproc
	movl	$40, %eax
	ret
	.cfi_endproc
.LFE11:
	.size	_Z14get_buffer_lenPKc, .-_Z14get_buffer_lenPKc
	.section	.text.unlikely._Z14get_buffer_lenPKc
.LCOLDE20:
	.section	.text._Z14get_buffer_lenPKc
.LHOTE20:
	.section	.rodata._ZZ18ocall_pointer_attrE8__func__,"a",@progbits
	.align 16
	.type	_ZZ18ocall_pointer_attrE8__func__, @object
	.size	_ZZ18ocall_pointer_attrE8__func__, 19
_ZZ18ocall_pointer_attrE8__func__:
	.string	"ocall_pointer_attr"
	.section	.rodata._ZZ17ecall_pointer_outE8__func__,"a",@progbits
	.align 16
	.type	_ZZ17ecall_pointer_outE8__func__, @object
	.size	_ZZ17ecall_pointer_outE8__func__, 18
_ZZ17ecall_pointer_outE8__func__:
	.string	"ecall_pointer_out"
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC16:
	.long	0
	.long	-1
	.long	-2
	.long	-3
	.align 16
.LC17:
	.long	-4
	.long	-4
	.long	-4
	.long	-4
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
