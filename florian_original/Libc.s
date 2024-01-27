	.file	"Libc.cpp"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"ptr != NULL"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Enclave/TrustedLibrary/Libc.cpp"
	.section	.text.unlikely.ecall_malloc_free,"ax",@progbits
.LCOLDB2:
	.section	.text.ecall_malloc_free,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.globl	ecall_malloc_free
	.hidden	ecall_malloc_free
	.type	ecall_malloc_free, @function
ecall_malloc_free:
.LFB0:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$100, %edi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L5
	movq	%rax, %rdi
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
	leaq	.LC1(%rip), %rdi
	leaq	.LC0(%rip), %rcx
	leaq	_ZZ17ecall_malloc_freeE8__func__(%rip), %rdx
	movl	$46, %esi
	movq	%rax, 8(%rsp)
	call	__assert@PLT
	movq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	movq	%rax, %rdi
	jmp	free@PLT
	.cfi_endproc
.LFE0:
	.size	ecall_malloc_free, .-ecall_malloc_free
	.section	.text.unlikely.ecall_malloc_free
.LCOLDE2:
	.section	.text.ecall_malloc_free
.LHOTE2:
	.section	.text.unlikely.ecall_sgx_cpuid,"ax",@progbits
.LCOLDB3:
	.section	.text.ecall_sgx_cpuid,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	ecall_sgx_cpuid
	.hidden	ecall_sgx_cpuid
	.type	ecall_sgx_cpuid, @function
ecall_sgx_cpuid:
.LFB1:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	sgx_cpuid@PLT
	testl	%eax, %eax
	jne	.L9
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L9:
	.cfi_restore_state
	call	abort@PLT
	.cfi_endproc
.LFE1:
	.size	ecall_sgx_cpuid, .-ecall_sgx_cpuid
	.section	.text.unlikely.ecall_sgx_cpuid
.LCOLDE3:
	.section	.text.ecall_sgx_cpuid
.LHOTE3:
	.section	.rodata._ZZ17ecall_malloc_freeE8__func__,"a",@progbits
	.align 16
	.type	_ZZ17ecall_malloc_freeE8__func__, @object
	.size	_ZZ17ecall_malloc_freeE8__func__, 18
_ZZ17ecall_malloc_freeE8__func__:
	.string	"ecall_malloc_free"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
