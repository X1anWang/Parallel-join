	.file	"Arrays.cpp"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"arr[i] == i"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Enclave/Edger8rSyntax/Arrays.cpp"
	.section	.text.unlikely.ecall_array_user_check,"ax",@progbits
.LCOLDB2:
	.section	.text.ecall_array_user_check,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.globl	ecall_array_user_check
	.hidden	ecall_array_user_check
	.type	ecall_array_user_check, @function
ecall_array_user_check:
.LFB0:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	$16, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbp
	call	sgx_is_outside_enclave@PLT
	cmpl	$1, %eax
	jne	.L8
	xorl	%ebx, %ebx
	movl	$3, %r12d
.L4:
	cmpl	%ebx, 0(%rbp)
	je	.L3
	leaq	.LC0(%rip), %rcx
	leaq	_ZZ22ecall_array_user_checkE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$47, %esi
	call	__assert@PLT
.L3:
	movl	%r12d, %eax
	addq	$4, %rbp
	subl	%ebx, %eax
	addl	$1, %ebx
	movl	%eax, -4(%rbp)
	cmpl	$4, %ebx
	jne	.L4
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	call	abort@PLT
	.cfi_endproc
.LFE0:
	.size	ecall_array_user_check, .-ecall_array_user_check
	.section	.text.unlikely.ecall_array_user_check
.LCOLDE2:
	.section	.text.ecall_array_user_check
.LHOTE2:
	.section	.text.unlikely.ecall_array_in,"ax",@progbits
.LCOLDB3:
	.section	.text.ecall_array_in,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	ecall_array_in
	.hidden	ecall_array_in
	.type	ecall_array_in, @function
ecall_array_in:
.LFB1:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$3, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
.L11:
	cmpl	%ebx, 0(%rbp)
	je	.L10
	leaq	.LC0(%rip), %rcx
	leaq	_ZZ14ecall_array_inE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$59, %esi
	call	__assert@PLT
.L10:
	movl	%r12d, %eax
	addq	$4, %rbp
	subl	%ebx, %eax
	addl	$1, %ebx
	movl	%eax, -4(%rbp)
	cmpl	$4, %ebx
	jne	.L11
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	ecall_array_in, .-ecall_array_in
	.section	.text.unlikely.ecall_array_in
.LCOLDE3:
	.section	.text.ecall_array_in
.LHOTE3:
	.section	.rodata.str1.1
.LC4:
	.string	"arr[i] == 0"
	.section	.text.unlikely.ecall_array_out,"ax",@progbits
.LCOLDB5:
	.section	.text.ecall_array_out,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	ecall_array_out
	.hidden	ecall_array_out
	.type	ecall_array_out, @function
ecall_array_out:
.LFB2:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	(%rdi), %esi
	movq	%rdi, %rbx
	testl	%esi, %esi
	jne	.L20
	movl	4(%rbx), %ecx
	movl	$3, (%rbx)
	testl	%ecx, %ecx
	jne	.L21
.L16:
	movl	8(%rbx), %edx
	movl	$2, 4(%rbx)
	testl	%edx, %edx
	jne	.L22
.L17:
	movl	12(%rbx), %eax
	movl	$1, 8(%rbx)
	testl	%eax, %eax
	jne	.L23
.L18:
	movl	$0, 12(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	.cfi_restore_state
	leaq	.LC4(%rip), %rcx
	leaq	_ZZ15ecall_array_outE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$72, %esi
	call	__assert@PLT
	movl	4(%rbx), %ecx
	movl	$3, (%rbx)
	testl	%ecx, %ecx
	je	.L16
.L21:
	leaq	_ZZ15ecall_array_outE8__func__(%rip), %rdx
	leaq	.LC4(%rip), %rcx
	leaq	.LC1(%rip), %rdi
	movl	$72, %esi
	call	__assert@PLT
	movl	8(%rbx), %edx
	movl	$2, 4(%rbx)
	testl	%edx, %edx
	je	.L17
.L22:
	leaq	.LC4(%rip), %rcx
	leaq	_ZZ15ecall_array_outE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$72, %esi
	call	__assert@PLT
	movl	12(%rbx), %eax
	movl	$1, 8(%rbx)
	testl	%eax, %eax
	je	.L18
.L23:
	leaq	.LC4(%rip), %rcx
	leaq	_ZZ15ecall_array_outE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$72, %esi
	call	__assert@PLT
	movl	$0, 12(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
	.size	ecall_array_out, .-ecall_array_out
	.section	.text.unlikely.ecall_array_out
.LCOLDE5:
	.section	.text.ecall_array_out
.LHOTE5:
	.section	.text.unlikely.ecall_array_in_out,"ax",@progbits
.LCOLDB6:
	.section	.text.ecall_array_in_out,"ax",@progbits
.LHOTB6:
	.p2align 4,,15
	.globl	ecall_array_in_out
	.hidden	ecall_array_in_out
	.type	ecall_array_in_out, @function
ecall_array_in_out:
.LFB3:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$3, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
.L26:
	cmpl	%ebx, 0(%rbp)
	je	.L25
	leaq	.LC0(%rip), %rcx
	leaq	_ZZ18ecall_array_in_outE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$84, %esi
	call	__assert@PLT
.L25:
	movl	%r12d, %eax
	addq	$4, %rbp
	subl	%ebx, %eax
	addl	$1, %ebx
	movl	%eax, -4(%rbp)
	cmpl	$4, %ebx
	jne	.L26
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3:
	.size	ecall_array_in_out, .-ecall_array_in_out
	.section	.text.unlikely.ecall_array_in_out
.LCOLDE6:
	.section	.text.ecall_array_in_out
.LHOTE6:
	.section	.text.unlikely.ecall_array_isary,"ax",@progbits
.LCOLDB7:
	.section	.text.ecall_array_isary,"ax",@progbits
.LHOTB7:
	.p2align 4,,15
	.globl	ecall_array_isary
	.hidden	ecall_array_isary
	.type	ecall_array_isary, @function
ecall_array_isary:
.LFB4:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	$40, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbp
	call	sgx_is_outside_enclave@PLT
	cmpl	$1, %eax
	jne	.L35
	xorl	%ebx, %ebx
	movl	$9, %r12d
	.p2align 4,,10
	.p2align 3
.L32:
	cmpl	%ebx, 0(%rbp)
	je	.L31
	leaq	.LC0(%rip), %rcx
	leaq	_ZZ17ecall_array_isaryE8__func__(%rip), %rdx
	leaq	.LC1(%rip), %rdi
	movl	$99, %esi
	call	__assert@PLT
.L31:
	movl	%r12d, %eax
	addq	$4, %rbp
	subl	%ebx, %eax
	addl	$1, %ebx
	movl	%eax, -4(%rbp)
	cmpl	$10, %ebx
	jne	.L32
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L35:
	.cfi_restore_state
	call	abort@PLT
	.cfi_endproc
.LFE4:
	.size	ecall_array_isary, .-ecall_array_isary
	.section	.text.unlikely.ecall_array_isary
.LCOLDE7:
	.section	.text.ecall_array_isary
.LHOTE7:
	.section	.rodata._ZZ17ecall_array_isaryE8__func__,"a",@progbits
	.align 16
	.type	_ZZ17ecall_array_isaryE8__func__, @object
	.size	_ZZ17ecall_array_isaryE8__func__, 18
_ZZ17ecall_array_isaryE8__func__:
	.string	"ecall_array_isary"
	.section	.rodata._ZZ18ecall_array_in_outE8__func__,"a",@progbits
	.align 16
	.type	_ZZ18ecall_array_in_outE8__func__, @object
	.size	_ZZ18ecall_array_in_outE8__func__, 19
_ZZ18ecall_array_in_outE8__func__:
	.string	"ecall_array_in_out"
	.section	.rodata._ZZ15ecall_array_outE8__func__,"a",@progbits
	.align 16
	.type	_ZZ15ecall_array_outE8__func__, @object
	.size	_ZZ15ecall_array_outE8__func__, 16
_ZZ15ecall_array_outE8__func__:
	.string	"ecall_array_out"
	.section	.rodata._ZZ14ecall_array_inE8__func__,"a",@progbits
	.align 8
	.type	_ZZ14ecall_array_inE8__func__, @object
	.size	_ZZ14ecall_array_inE8__func__, 15
_ZZ14ecall_array_inE8__func__:
	.string	"ecall_array_in"
	.section	.rodata._ZZ22ecall_array_user_checkE8__func__,"a",@progbits
	.align 16
	.type	_ZZ22ecall_array_user_checkE8__func__, @object
	.size	_ZZ22ecall_array_user_checkE8__func__, 23
_ZZ22ecall_array_user_checkE8__func__:
	.string	"ecall_array_user_check"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
