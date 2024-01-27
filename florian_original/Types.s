	.file	"Types.cpp"
	.section	.text.unlikely._Z12almost_equaldd,"ax",@progbits
.LCOLDB2:
	.section	.text._Z12almost_equaldd,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.globl	_Z12almost_equaldd
	.hidden	_Z12almost_equaldd
	.type	_Z12almost_equaldd, @function
_Z12almost_equaldd:
.LFB316:
	.cfi_startproc
	movapd	%xmm0, %xmm2
	movsd	.LC0(%rip), %xmm3
	subsd	%xmm1, %xmm2
	addsd	%xmm0, %xmm1
	movsd	.LC1(%rip), %xmm0
	andpd	%xmm3, %xmm2
	andpd	%xmm3, %xmm1
	mulsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm0
	ucomisd	%xmm2, %xmm0
	setnb	%al
	ret
	.cfi_endproc
.LFE316:
	.size	_Z12almost_equaldd, .-_Z12almost_equaldd
	.section	.text.unlikely._Z12almost_equaldd
.LCOLDE2:
	.section	.text._Z12almost_equaldd
.LHOTE2:
	.section	.text.unlikely._Z12almost_equalff,"ax",@progbits
.LCOLDB5:
	.section	.text._Z12almost_equalff,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	_Z12almost_equalff
	.hidden	_Z12almost_equalff
	.type	_Z12almost_equalff, @function
_Z12almost_equalff:
.LFB318:
	.cfi_startproc
	movaps	%xmm0, %xmm2
	movss	.LC3(%rip), %xmm3
	subss	%xmm1, %xmm2
	addss	%xmm0, %xmm1
	movss	.LC4(%rip), %xmm0
	andps	%xmm3, %xmm2
	andps	%xmm3, %xmm1
	mulss	%xmm1, %xmm0
	addss	%xmm0, %xmm0
	ucomiss	%xmm2, %xmm0
	setnb	%al
	ret
	.cfi_endproc
.LFE318:
	.size	_Z12almost_equalff, .-_Z12almost_equalff
	.section	.text.unlikely._Z12almost_equalff
.LCOLDE5:
	.section	.text._Z12almost_equalff
.LHOTE5:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"val == 0x12"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"Enclave/Edger8rSyntax/Types.cpp"
	.section	.text.unlikely.ecall_type_char,"ax",@progbits
.LCOLDB8:
	.section	.text.ecall_type_char,"ax",@progbits
.LHOTB8:
	.p2align 4,,15
	.globl	ecall_type_char
	.hidden	ecall_type_char
	.type	ecall_type_char, @function
ecall_type_char:
.LFB320:
	.cfi_startproc
	cmpb	$18, %dil
	je	.L3
	leaq	.LC6(%rip), %rcx
	leaq	_ZZ15ecall_type_charE8__func__(%rip), %rdx
	leaq	.LC7(%rip), %rdi
	movl	$67, %esi
	jmp	__assert@PLT
	.p2align 4,,10
	.p2align 3
.L3:
	rep ret
	.cfi_endproc
.LFE320:
	.size	ecall_type_char, .-ecall_type_char
	.section	.text.unlikely.ecall_type_char
.LCOLDE8:
	.section	.text.ecall_type_char
.LHOTE8:
	.section	.rodata.str1.1
.LC9:
	.string	"val == 1234"
	.section	.text.unlikely.ecall_type_int,"ax",@progbits
.LCOLDB10:
	.section	.text.ecall_type_int,"ax",@progbits
.LHOTB10:
	.p2align 4,,15
	.globl	ecall_type_int
	.hidden	ecall_type_int
	.type	ecall_type_int, @function
ecall_type_int:
.LFB321:
	.cfi_startproc
	cmpl	$1234, %edi
	je	.L6
	leaq	.LC9(%rip), %rcx
	leaq	_ZZ14ecall_type_intE8__func__(%rip), %rdx
	leaq	.LC7(%rip), %rdi
	movl	$78, %esi
	jmp	__assert@PLT
	.p2align 4,,10
	.p2align 3
.L6:
	rep ret
	.cfi_endproc
.LFE321:
	.size	ecall_type_int, .-ecall_type_int
	.section	.text.unlikely.ecall_type_int
.LCOLDE10:
	.section	.text.ecall_type_int
.LHOTE10:
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"almost_equal(val, (float)1234.0)"
	.section	.text.unlikely.ecall_type_float,"ax",@progbits
.LCOLDB13:
	.section	.text.ecall_type_float,"ax",@progbits
.LHOTB13:
	.p2align 4,,15
	.globl	ecall_type_float
	.hidden	ecall_type_float
	.type	ecall_type_float, @function
ecall_type_float:
.LFB322:
	.cfi_startproc
	movaps	%xmm0, %xmm2
	movss	.LC3(%rip), %xmm3
	movss	.LC11(%rip), %xmm1
	subss	%xmm1, %xmm2
	addss	%xmm0, %xmm1
	movss	.LC4(%rip), %xmm0
	andps	%xmm3, %xmm2
	andps	%xmm3, %xmm1
	mulss	%xmm1, %xmm0
	addss	%xmm0, %xmm0
	ucomiss	%xmm2, %xmm0
	jb	.L10
	rep ret
	.p2align 4,,10
	.p2align 3
.L10:
	leaq	.LC12(%rip), %rcx
	leaq	_ZZ16ecall_type_floatE8__func__(%rip), %rdx
	leaq	.LC7(%rip), %rdi
	movl	$89, %esi
	jmp	__assert@PLT
	.cfi_endproc
.LFE322:
	.size	ecall_type_float, .-ecall_type_float
	.section	.text.unlikely.ecall_type_float
.LCOLDE13:
	.section	.text.ecall_type_float
.LHOTE13:
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"almost_equal(val, (double)1234.5678)"
	.section	.text.unlikely.ecall_type_double,"ax",@progbits
.LCOLDB16:
	.section	.text.ecall_type_double,"ax",@progbits
.LHOTB16:
	.p2align 4,,15
	.globl	ecall_type_double
	.hidden	ecall_type_double
	.type	ecall_type_double, @function
ecall_type_double:
.LFB323:
	.cfi_startproc
	movsd	.LC14(%rip), %xmm1
	movapd	%xmm0, %xmm2
	movsd	.LC0(%rip), %xmm3
	subsd	%xmm1, %xmm2
	addsd	%xmm0, %xmm1
	movsd	.LC1(%rip), %xmm0
	andpd	%xmm3, %xmm2
	andpd	%xmm3, %xmm1
	mulsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm0
	ucomisd	%xmm2, %xmm0
	jb	.L13
	rep ret
	.p2align 4,,10
	.p2align 3
.L13:
	leaq	.LC15(%rip), %rcx
	leaq	_ZZ17ecall_type_doubleE8__func__(%rip), %rdx
	leaq	.LC7(%rip), %rdi
	movl	$100, %esi
	jmp	__assert@PLT
	.cfi_endproc
.LFE323:
	.size	ecall_type_double, .-ecall_type_double
	.section	.text.unlikely.ecall_type_double
.LCOLDE16:
	.section	.text.ecall_type_double
.LHOTE16:
	.section	.rodata.str1.1
.LC17:
	.string	"val == (size_t)12345678"
	.section	.text.unlikely.ecall_type_size_t,"ax",@progbits
.LCOLDB18:
	.section	.text.ecall_type_size_t,"ax",@progbits
.LHOTB18:
	.p2align 4,,15
	.globl	ecall_type_size_t
	.hidden	ecall_type_size_t
	.type	ecall_type_size_t, @function
ecall_type_size_t:
.LFB324:
	.cfi_startproc
	cmpq	$12345678, %rdi
	je	.L14
	leaq	.LC17(%rip), %rcx
	leaq	_ZZ17ecall_type_size_tE8__func__(%rip), %rdx
	leaq	.LC7(%rip), %rdi
	movl	$111, %esi
	jmp	__assert@PLT
	.p2align 4,,10
	.p2align 3
.L14:
	rep ret
	.cfi_endproc
.LFE324:
	.size	ecall_type_size_t, .-ecall_type_size_t
	.section	.text.unlikely.ecall_type_size_t
.LCOLDE18:
	.section	.text.ecall_type_size_t
.LHOTE18:
	.section	.rodata.str1.1
.LC19:
	.string	"val == (wchar_t)0x1234"
	.section	.text.unlikely.ecall_type_wchar_t,"ax",@progbits
.LCOLDB20:
	.section	.text.ecall_type_wchar_t,"ax",@progbits
.LHOTB20:
	.p2align 4,,15
	.globl	ecall_type_wchar_t
	.hidden	ecall_type_wchar_t
	.type	ecall_type_wchar_t, @function
ecall_type_wchar_t:
.LFB325:
	.cfi_startproc
	cmpl	$4660, %edi
	je	.L16
	leaq	.LC19(%rip), %rcx
	leaq	_ZZ18ecall_type_wchar_tE8__func__(%rip), %rdx
	leaq	.LC7(%rip), %rdi
	movl	$122, %esi
	jmp	__assert@PLT
	.p2align 4,,10
	.p2align 3
.L16:
	rep ret
	.cfi_endproc
.LFE325:
	.size	ecall_type_wchar_t, .-ecall_type_wchar_t
	.section	.text.unlikely.ecall_type_wchar_t
.LCOLDE20:
	.section	.text.ecall_type_wchar_t
.LHOTE20:
	.section	.rodata.str1.1
.LC21:
	.string	"val.struct_foo_0 == 1234"
.LC22:
	.string	"val.struct_foo_1 == 5678"
	.section	.text.unlikely.ecall_type_struct,"ax",@progbits
.LCOLDB23:
	.section	.text.ecall_type_struct,"ax",@progbits
.LHOTB23:
	.p2align 4,,15
	.globl	ecall_type_struct
	.hidden	ecall_type_struct
	.type	ecall_type_struct, @function
ecall_type_struct:
.LFB326:
	.cfi_startproc
	cmpl	$1234, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rsi, %rbx
	je	.L19
	leaq	.LC21(%rip), %rcx
	leaq	_ZZ17ecall_type_structE8__func__(%rip), %rdx
	leaq	.LC7(%rip), %rdi
	movl	$133, %esi
	call	__assert@PLT
.L19:
	cmpq	$5678, %rbx
	je	.L18
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	leaq	.LC22(%rip), %rcx
	leaq	_ZZ17ecall_type_structE8__func__(%rip), %rdx
	leaq	.LC7(%rip), %rdi
	movl	$134, %esi
	jmp	__assert@PLT
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE326:
	.size	ecall_type_struct, .-ecall_type_struct
	.section	.text.unlikely.ecall_type_struct
.LCOLDE23:
	.section	.text.ecall_type_struct
.LHOTE23:
	.section	.rodata.str1.1
.LC24:
	.string	"val1 == ENUM_FOO_0"
	.section	.text.unlikely.ecall_type_enum_union,"ax",@progbits
.LCOLDB25:
	.section	.text.ecall_type_enum_union,"ax",@progbits
.LHOTB25:
	.p2align 4,,15
	.globl	ecall_type_enum_union
	.hidden	ecall_type_enum_union
	.type	ecall_type_enum_union, @function
ecall_type_enum_union:
.LFB327:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	movl	%edi, %ebp
	movl	$8, %esi
	movq	%rbx, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	sgx_is_outside_enclave@PLT
	cmpl	$1, %eax
	jne	.L29
	testl	%ebp, %ebp
	movl	$2, (%rbx)
	jne	.L30
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	.cfi_restore_state
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	leaq	.LC24(%rip), %rcx
	leaq	_ZZ21ecall_type_enum_unionE8__func__(%rip), %rdx
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	leaq	.LC7(%rip), %rdi
	movl	$151, %esi
	jmp	__assert@PLT
.L29:
	.cfi_restore_state
	call	abort@PLT
	.cfi_endproc
.LFE327:
	.size	ecall_type_enum_union, .-ecall_type_enum_union
	.section	.text.unlikely.ecall_type_enum_union
.LCOLDE25:
	.section	.text.ecall_type_enum_union
.LHOTE25:
	.section	.rodata._ZZ21ecall_type_enum_unionE8__func__,"a",@progbits
	.align 16
	.type	_ZZ21ecall_type_enum_unionE8__func__, @object
	.size	_ZZ21ecall_type_enum_unionE8__func__, 22
_ZZ21ecall_type_enum_unionE8__func__:
	.string	"ecall_type_enum_union"
	.section	.rodata._ZZ17ecall_type_structE8__func__,"a",@progbits
	.align 16
	.type	_ZZ17ecall_type_structE8__func__, @object
	.size	_ZZ17ecall_type_structE8__func__, 18
_ZZ17ecall_type_structE8__func__:
	.string	"ecall_type_struct"
	.section	.rodata._ZZ18ecall_type_wchar_tE8__func__,"a",@progbits
	.align 16
	.type	_ZZ18ecall_type_wchar_tE8__func__, @object
	.size	_ZZ18ecall_type_wchar_tE8__func__, 19
_ZZ18ecall_type_wchar_tE8__func__:
	.string	"ecall_type_wchar_t"
	.section	.rodata._ZZ17ecall_type_size_tE8__func__,"a",@progbits
	.align 16
	.type	_ZZ17ecall_type_size_tE8__func__, @object
	.size	_ZZ17ecall_type_size_tE8__func__, 18
_ZZ17ecall_type_size_tE8__func__:
	.string	"ecall_type_size_t"
	.section	.rodata._ZZ17ecall_type_doubleE8__func__,"a",@progbits
	.align 16
	.type	_ZZ17ecall_type_doubleE8__func__, @object
	.size	_ZZ17ecall_type_doubleE8__func__, 18
_ZZ17ecall_type_doubleE8__func__:
	.string	"ecall_type_double"
	.section	.rodata._ZZ16ecall_type_floatE8__func__,"a",@progbits
	.align 16
	.type	_ZZ16ecall_type_floatE8__func__, @object
	.size	_ZZ16ecall_type_floatE8__func__, 17
_ZZ16ecall_type_floatE8__func__:
	.string	"ecall_type_float"
	.section	.rodata._ZZ14ecall_type_intE8__func__,"a",@progbits
	.align 8
	.type	_ZZ14ecall_type_intE8__func__, @object
	.size	_ZZ14ecall_type_intE8__func__, 15
_ZZ14ecall_type_intE8__func__:
	.string	"ecall_type_int"
	.section	.rodata._ZZ15ecall_type_charE8__func__,"a",@progbits
	.align 16
	.type	_ZZ15ecall_type_charE8__func__, @object
	.size	_ZZ15ecall_type_charE8__func__, 16
_ZZ15ecall_type_charE8__func__:
	.string	"ecall_type_char"
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1018167296
	.section	.rodata.cst16
	.align 16
.LC3:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC4:
	.long	872415232
	.align 4
.LC11:
	.long	1150959616
	.section	.rodata.cst8
	.align 8
.LC14:
	.long	1834810029
	.long	1083394629
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
