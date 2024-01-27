	.file	"Libcxx.cpp"
	.section	.text.unlikely._ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE,"axG",@progbits,_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE,comdat
	.align 2
.LCOLDB0:
	.section	.text._ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE,"axG",@progbits,_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE,comdat
.LHOTB0:
	.align 2
	.p2align 4,,15
	.weak	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	.hidden	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	.type	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE, @function
_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE:
.LFB2116:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2116
	testq	%rsi, %rsi
	je	.L220
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
	movq	%rsi, %rbp
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	(%rsi), %r12
	testq	%r12, %r12
	je	.L3
	movq	(%r12), %r13
	testq	%r13, %r13
	je	.L4
	movq	0(%r13), %r14
	testq	%r14, %r14
	je	.L5
	movq	(%r14), %r15
	testq	%r15, %r15
	je	.L6
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L7
	movq	(%rax), %rsi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L7:
	movq	8(%r15), %rax
	testq	%rax, %rax
	je	.L8
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L8:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L6:
	movq	8(%r14), %r15
	testq	%r15, %r15
	je	.L9
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L10
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L10:
	movq	8(%r15), %rax
	testq	%rax, %rax
	je	.L11
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L11:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L9:
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L5:
	movq	8(%r13), %r14
	testq	%r14, %r14
	je	.L12
	movq	(%r14), %r15
	testq	%r15, %r15
	je	.L13
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L14
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L14:
	movq	8(%r15), %rax
	testq	%rax, %rax
	je	.L15
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L15:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L13:
	movq	8(%r14), %r15
	testq	%r15, %r15
	je	.L16
	movq	(%r15), %rsi
	movq	%rbx, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%r15), %rsi
	movq	%rbx, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L16:
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L12:
	movq	%r13, %rdi
	call	_ZdlPv@PLT
.L4:
	movq	8(%r12), %r13
	testq	%r13, %r13
	je	.L17
	movq	0(%r13), %r14
	testq	%r14, %r14
	je	.L18
	movq	(%r14), %r15
	testq	%r15, %r15
	je	.L19
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L20
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L20:
	movq	8(%r15), %rax
	testq	%rax, %rax
	je	.L21
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L21:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L19:
	movq	8(%r14), %r15
	testq	%r15, %r15
	je	.L22
	movq	(%r15), %rsi
	movq	%rbx, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%r15), %rsi
	movq	%rbx, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L22:
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L18:
	movq	8(%r13), %r14
	testq	%r14, %r14
	je	.L23
	movq	(%r14), %r15
	testq	%r15, %r15
	je	.L24
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L25
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L25:
	movq	8(%r15), %rax
	testq	%rax, %rax
	je	.L26
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L26:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L24:
	movq	8(%r14), %r15
	testq	%r15, %r15
	je	.L27
	movq	(%r15), %rsi
	movq	%rbx, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%r15), %rsi
	movq	%rbx, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L27:
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L23:
	movq	%r13, %rdi
	call	_ZdlPv@PLT
.L17:
	movq	%r12, %rdi
	call	_ZdlPv@PLT
.L3:
	movq	8(%rbp), %r12
	testq	%r12, %r12
	je	.L28
	movq	(%r12), %r13
	testq	%r13, %r13
	je	.L29
	movq	0(%r13), %r14
	testq	%r14, %r14
	je	.L30
	movq	(%r14), %r15
	testq	%r15, %r15
	je	.L31
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L32
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L32:
	movq	8(%r15), %rax
	testq	%rax, %rax
	je	.L33
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L33:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L31:
	movq	8(%r14), %r15
	testq	%r15, %r15
	je	.L34
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L35
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L35:
	movq	8(%r15), %rax
	testq	%rax, %rax
	je	.L36
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L36:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L34:
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L30:
	movq	8(%r13), %r14
	testq	%r14, %r14
	je	.L37
	movq	(%r14), %r15
	testq	%r15, %r15
	je	.L38
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L39
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L39:
	movq	8(%r15), %rax
	testq	%rax, %rax
	je	.L40
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L40:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L38:
	movq	8(%r14), %r15
	testq	%r15, %r15
	je	.L41
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L42
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L42:
	movq	8(%r15), %rax
	testq	%rax, %rax
	je	.L43
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L43:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L41:
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L37:
	movq	%r13, %rdi
	call	_ZdlPv@PLT
.L29:
	movq	8(%r12), %r13
	testq	%r13, %r13
	je	.L44
	movq	0(%r13), %r14
	testq	%r14, %r14
	je	.L45
	movq	(%r14), %r15
	testq	%r15, %r15
	je	.L46
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L47
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L47:
	movq	8(%r15), %rax
	testq	%rax, %rax
	je	.L48
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L48:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L46:
	movq	8(%r14), %r15
	testq	%r15, %r15
	je	.L49
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L50
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L50:
	movq	8(%r15), %rax
	testq	%rax, %rax
	je	.L51
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L51:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L49:
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L45:
	movq	8(%r13), %r14
	testq	%r14, %r14
	je	.L52
	movq	(%r14), %r15
	testq	%r15, %r15
	je	.L53
	movq	(%r15), %rsi
	movq	%rbx, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%r15), %rsi
	movq	%rbx, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L53:
	movq	8(%r14), %r15
	testq	%r15, %r15
	je	.L54
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L55
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L55:
	movq	8(%r15), %rax
	testq	%rax, %rax
	je	.L56
	movq	(%rax), %rsi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	movq	8(%rax), %rsi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
.L56:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L54:
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L52:
	movq	%r13, %rdi
	call	_ZdlPv@PLT
.L44:
	movq	%r12, %rdi
	call	_ZdlPv@PLT
.L28:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	jmp	_ZdlPv@PLT
	.p2align 4,,10
	.p2align 3
.L220:
	rep ret
	.cfi_endproc
.LFE2116:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table._ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE,"aG",@progbits,_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE,comdat
.LLSDA2116:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2116-.LLSDACSB2116
.LLSDACSB2116:
.LLSDACSE2116:
	.section	.text._ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE,"axG",@progbits,_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE,comdat
	.size	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE, .-_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	.section	.text.unlikely._ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE,"axG",@progbits,_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE,comdat
.LCOLDE0:
	.section	.text._ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE,"axG",@progbits,_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE,comdat
.LHOTE0:
	.section	.text.unlikely._ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_,"axG",@progbits,_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_,comdat
.LCOLDB1:
	.section	.text._ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_,"axG",@progbits,_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_,comdat
.LHOTB1:
	.p2align 4,,15
	.weak	_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_
	.hidden	_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_
	.type	_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_, @function
_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_:
.LFB2241:
	.cfi_startproc
	cmpq	%rdi, %rsi
	sete	24(%rsi)
	je	.L222
	movq	16(%rsi), %rdx
	cmpb	$0, 24(%rdx)
	jne	.L222
	.p2align 4,,10
	.p2align 3
.L227:
	movq	16(%rdx), %rax
	movq	(%rax), %rcx
	cmpq	%rdx, %rcx
	je	.L265
	testq	%rcx, %rcx
	je	.L238
	cmpb	$0, 24(%rcx)
	jne	.L238
	cmpq	%rax, %rdi
	movb	$1, 24(%rdx)
	sete	24(%rax)
	movb	$1, 24(%rcx)
.L229:
	cmpq	%rax, %rdi
	je	.L222
	movq	16(%rax), %rdx
	movq	%rax, %rsi
	cmpb	$0, 24(%rdx)
	je	.L227
.L222:
	rep ret
	.p2align 4,,10
	.p2align 3
.L265:
	movq	8(%rax), %r8
	testq	%r8, %r8
	je	.L228
	cmpb	$0, 24(%r8)
	jne	.L228
	cmpq	%rax, %rdi
	movb	$1, 24(%rdx)
	sete	24(%rax)
	movb	$1, 24(%r8)
	jmp	.L229
	.p2align 4,,10
	.p2align 3
.L238:
	movq	(%rdx), %rdi
	movq	%rax, %rcx
	cmpq	%rdi, %rsi
	je	.L266
.L239:
	movq	8(%rcx), %rax
	movb	$1, 24(%rdx)
	movb	$0, 24(%rcx)
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 8(%rcx)
	je	.L243
	movq	%rcx, 16(%rdx)
.L243:
	movq	16(%rcx), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rcx), %rdx
	cmpq	%rcx, (%rdx)
	je	.L267
	movq	%rax, 8(%rdx)
.L245:
	movq	%rcx, (%rax)
	movq	%rax, 16(%rcx)
	ret
.L267:
	movq	%rax, (%rdx)
	jmp	.L245
.L266:
	movq	8(%rdi), %rcx
	testq	%rcx, %rcx
	movq	%rcx, (%rdx)
	je	.L240
	movq	%rdx, 16(%rcx)
	movq	16(%rdx), %rax
.L240:
	movq	%rax, 16(%rdi)
	movq	16(%rdx), %rax
	cmpq	%rdx, (%rax)
	je	.L268
	movq	%rdi, 8(%rax)
.L242:
	movq	%rdx, 8(%rdi)
	movq	%rdi, 16(%rdx)
	movq	%rdi, %rdx
	movq	16(%rdi), %rcx
	jmp	.L239
.L228:
	cmpq	(%rcx), %rsi
	je	.L269
	movq	8(%rcx), %rdx
	movq	(%rdx), %rsi
	testq	%rsi, %rsi
	movq	%rsi, 8(%rcx)
	je	.L232
	movq	%rcx, 16(%rsi)
	movq	16(%rcx), %rax
.L232:
	movq	%rax, 16(%rdx)
	movq	16(%rcx), %rax
	cmpq	(%rax), %rcx
	je	.L270
	movq	%rdx, 8(%rax)
.L234:
	movq	%rcx, (%rdx)
	movq	%rdx, 16(%rcx)
.L231:
	movq	16(%rdx), %rax
	movb	$1, 24(%rdx)
	movq	(%rax), %rdx
	movb	$0, 24(%rax)
	movq	8(%rdx), %rcx
	testq	%rcx, %rcx
	movq	%rcx, (%rax)
	je	.L235
	movq	%rax, 16(%rcx)
.L235:
	movq	16(%rax), %rcx
	movq	%rcx, 16(%rdx)
	movq	16(%rax), %rcx
	cmpq	(%rcx), %rax
	je	.L271
	movq	%rdx, 8(%rcx)
.L237:
	movq	%rax, 8(%rdx)
	movq	%rdx, 16(%rax)
	ret
.L269:
	movq	16(%rsi), %rdx
	jmp	.L231
.L271:
	movq	%rdx, (%rcx)
	jmp	.L237
.L268:
	movq	%rdi, (%rax)
	jmp	.L242
.L270:
	movq	%rdx, (%rax)
	jmp	.L234
	.cfi_endproc
.LFE2241:
	.size	_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_, .-_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_
	.section	.text.unlikely._ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_,"axG",@progbits,_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_,comdat
.LCOLDE1:
	.section	.text._ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_,"axG",@progbits,_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_,comdat
.LHOTE1:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"m['a'] == 1"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Enclave/TrustedLibrary/Libcxx.cpp"
	.section	.rodata.str1.1
.LC4:
	.string	"m['b'] == 2"
.LC5:
	.string	"m['c'] == 3"
.LC6:
	.string	"m['d'] == 4"
.LC7:
	.string	"m.find('e') == m.end()"
	.section	.text.unlikely.ecall_map,"ax",@progbits
.LCOLDB8:
	.section	.text.ecall_map,"ax",@progbits
.LHOTB8:
	.p2align 4,,15
	.globl	ecall_map
	.hidden	ecall_map
	.type	ecall_map, @function
ecall_map:
.LFB2069:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2069
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	$40, %edi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$32, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	8(%rsp), %rax
	movq	$0, 8(%rsp)
	movq	$0, 16(%rsp)
	movq	%rsp, %r12
	movq	%rax, (%rsp)
.LEHB0:
	call	_Znwm@PLT
	movq	(%rsp), %rdx
	movb	$97, 28(%rax)
	leaq	8(%rsp), %rbp
	movl	$1, 32(%rax)
	movq	$0, (%rax)
	movq	%rax, 8(%rsp)
	movq	$0, 8(%rax)
	movq	(%rdx), %rdx
	movq	%rbp, 16(%rax)
	testq	%rdx, %rdx
	je	.L456
	movq	%rdx, (%rsp)
.L456:
	movq	%rax, %rsi
	movq	%rax, %rdi
	call	_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_
	movq	8(%rsp), %rbx
	addq	$1, 16(%rsp)
	testq	%rbx, %rbx
	je	.L450
	leaq	8(%r12), %rdx
	movq	%rbx, %rbp
	.p2align 4,,10
	.p2align 3
.L275:
	cmpb	$98, 28(%rbp)
	jle	.L276
.L464:
	movq	0(%rbp), %rax
	testq	%rax, %rax
	je	.L450
	movq	%rbp, %rdx
	movq	%rax, %rbp
	cmpb	$98, 28(%rbp)
	jg	.L464
.L276:
	je	.L280
	movq	8(%rbp), %rax
	testq	%rax, %rax
	je	.L281
	leaq	8(%rbp), %rdx
	movq	%rax, %rbp
	jmp	.L275
	.p2align 4,,10
	.p2align 3
.L450:
	movq	%rbp, %rbx
.L274:
	movl	$40, %edi
	call	_Znwm@PLT
	movb	$98, 28(%rax)
	movl	$2, 32(%rax)
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rax, (%rbx)
	movq	(%rsp), %rdx
	movq	(%rdx), %rdx
	testq	%rdx, %rdx
	je	.L377
	movq	%rdx, (%rsp)
	movq	(%rbx), %rsi
.L282:
	movq	8(%rsp), %rdi
	call	_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_
	movq	8(%rsp), %rbx
	addq	$1, 16(%rsp)
	testq	%rbx, %rbx
	jne	.L371
	leaq	8(%r12), %rbp
	.p2align 4,,10
	.p2align 3
.L451:
	movq	%rbp, %rbx
.L283:
	movl	$40, %edi
	call	_Znwm@PLT
	movb	$99, 28(%rax)
	movl	$3, 32(%rax)
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rax, (%rbx)
	movq	(%rsp), %rdx
	movq	(%rdx), %rdx
	testq	%rdx, %rdx
	je	.L379
	movq	%rdx, (%rsp)
	movq	(%rbx), %rsi
.L291:
	movq	8(%rsp), %rdi
	leaq	8(%r12), %rbp
	movq	%rbp, %r13
	call	_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_
	movq	8(%rsp), %rbx
	addq	$1, 16(%rsp)
	testq	%rbx, %rbx
	je	.L292
	jmp	.L372
	.p2align 4,,10
	.p2align 3
.L280:
	cmpq	$0, (%rdx)
	je	.L465
.L371:
	leaq	8(%r12), %rdx
	movq	%rbx, %rbp
	.p2align 4,,10
	.p2align 3
.L284:
	cmpb	$99, 28(%rbp)
	jle	.L285
.L466:
	movq	0(%rbp), %rax
	testq	%rax, %rax
	je	.L451
	movq	%rbp, %rdx
	movq	%rax, %rbp
	cmpb	$99, 28(%rbp)
	jg	.L466
.L285:
	je	.L289
	movq	8(%rbp), %rax
	testq	%rax, %rax
	je	.L290
	leaq	8(%rbp), %rdx
	movq	%rax, %rbp
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L289:
	cmpq	$0, (%rdx)
	je	.L467
.L372:
	leaq	8(%r12), %rdx
	movq	%rbx, %rbp
	.p2align 4,,10
	.p2align 3
.L293:
	cmpb	$100, 28(%rbp)
	jle	.L294
.L468:
	movq	0(%rbp), %rax
	testq	%rax, %rax
	je	.L295
	movq	%rbp, %rdx
	movq	%rax, %rbp
	cmpb	$100, 28(%rbp)
	jg	.L468
.L294:
	je	.L298
	movq	8(%rbp), %rax
	testq	%rax, %rax
	je	.L299
	leaq	8(%rbp), %rdx
	movq	%rax, %rbp
	jmp	.L293
	.p2align 4,,10
	.p2align 3
.L295:
	movq	%rbp, %r13
.L292:
	movl	$40, %edi
	call	_Znwm@PLT
	movb	$100, 28(%rax)
	movl	$4, 32(%rax)
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	movq	%rbp, 16(%rax)
	movq	%rax, 0(%r13)
	movq	(%rsp), %rdx
	movq	(%rdx), %rdx
	testq	%rdx, %rdx
	je	.L381
	movq	%rdx, (%rsp)
	movq	0(%r13), %rsi
.L300:
	movq	8(%rsp), %rdi
	call	_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_
	movq	8(%rsp), %rbx
	addq	$1, 16(%rsp)
	testq	%rbx, %rbx
	jne	.L373
	leaq	8(%r12), %rbx
.L452:
	movq	%rbx, %rbp
.L307:
	movl	$40, %edi
	call	_Znwm@PLT
	movq	$0, (%rax)
	movb	$97, 28(%rax)
	movq	%rax, %r13
	movl	$0, 32(%rax)
	movq	$0, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	%rax, 0(%rbp)
	movq	(%rsp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L384
	movq	%rax, (%rsp)
	movq	0(%rbp), %rsi
.L310:
	movq	8(%rsp), %rdi
	call	_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_
	addq	$1, 16(%rsp)
	jmp	.L308
	.p2align 4,,10
	.p2align 3
.L298:
	cmpq	$0, (%rdx)
	je	.L469
.L373:
	leaq	8(%r12), %rdx
	.p2align 4,,10
	.p2align 3
.L302:
	cmpb	$97, 28(%rbx)
	jle	.L303
.L470:
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L452
	movq	%rbx, %rdx
	movq	%rax, %rbx
	cmpb	$97, 28(%rbx)
	jg	.L470
.L303:
	je	.L471
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L309
	leaq	8(%rbx), %rdx
	movq	%rax, %rbx
	jmp	.L302
	.p2align 4,,10
	.p2align 3
.L471:
	movq	(%rdx), %r13
	testq	%r13, %r13
	je	.L472
.L308:
	cmpl	$1, 32(%r13)
	je	.L314
	leaq	.LC2(%rip), %rcx
	leaq	_ZZ9ecall_mapE8__func__(%rip), %rdx
	leaq	.LC3(%rip), %rdi
	movl	$81, %esi
	call	__assert@PLT
.L314:
	movq	8(%rsp), %rbx
	testq	%rbx, %rbx
	je	.L385
	leaq	8(%r12), %rdx
	.p2align 4,,10
	.p2align 3
.L313:
	cmpb	$98, 28(%rbx)
	jle	.L315
.L473:
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L453
	movq	%rbx, %rdx
	movq	%rax, %rbx
	cmpb	$98, 28(%rbx)
	jg	.L473
.L315:
	je	.L474
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L321
	leaq	8(%rbx), %rdx
	movq	%rax, %rbx
	jmp	.L313
	.p2align 4,,10
	.p2align 3
.L385:
	leaq	8(%r12), %rbx
.L453:
	movq	%rbx, %rbp
.L319:
	movl	$40, %edi
	call	_Znwm@PLT
	movq	$0, (%rax)
	movb	$98, 28(%rax)
	movq	%rax, %r13
	movl	$0, 32(%rax)
	movq	$0, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	%rax, 0(%rbp)
	movq	(%rsp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L387
	movq	%rax, (%rsp)
	movq	0(%rbp), %rsi
.L322:
	movq	8(%rsp), %rdi
	call	_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_
	addq	$1, 16(%rsp)
	jmp	.L320
	.p2align 4,,10
	.p2align 3
.L474:
	movq	(%rdx), %r13
	testq	%r13, %r13
	je	.L475
.L320:
	cmpl	$2, 32(%r13)
	je	.L326
	leaq	.LC4(%rip), %rcx
	leaq	_ZZ9ecall_mapE8__func__(%rip), %rdx
	leaq	.LC3(%rip), %rdi
	movl	$82, %esi
	call	__assert@PLT
.L326:
	movq	8(%rsp), %rbx
	testq	%rbx, %rbx
	je	.L388
	leaq	8(%r12), %rdx
	.p2align 4,,10
	.p2align 3
.L325:
	cmpb	$99, 28(%rbx)
	jle	.L327
.L476:
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L454
	movq	%rbx, %rdx
	movq	%rax, %rbx
	cmpb	$99, 28(%rbx)
	jg	.L476
.L327:
	je	.L477
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L333
	leaq	8(%rbx), %rdx
	movq	%rax, %rbx
	jmp	.L325
	.p2align 4,,10
	.p2align 3
.L388:
	leaq	8(%r12), %rbx
.L454:
	movq	%rbx, %rbp
.L331:
	movl	$40, %edi
	call	_Znwm@PLT
	movq	$0, (%rax)
	movb	$99, 28(%rax)
	movq	%rax, %r13
	movl	$0, 32(%rax)
	movq	$0, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	%rax, 0(%rbp)
	movq	(%rsp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L390
	movq	%rax, (%rsp)
	movq	0(%rbp), %rsi
.L334:
	movq	8(%rsp), %rdi
	call	_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_
	addq	$1, 16(%rsp)
	jmp	.L332
	.p2align 4,,10
	.p2align 3
.L477:
	movq	(%rdx), %r13
	testq	%r13, %r13
	je	.L478
.L332:
	cmpl	$3, 32(%r13)
	je	.L338
	leaq	.LC5(%rip), %rcx
	leaq	_ZZ9ecall_mapE8__func__(%rip), %rdx
	leaq	.LC3(%rip), %rdi
	movl	$83, %esi
	call	__assert@PLT
.L338:
	movq	8(%rsp), %rbx
	testq	%rbx, %rbx
	je	.L391
	leaq	8(%r12), %rdx
	.p2align 4,,10
	.p2align 3
.L337:
	cmpb	$100, 28(%rbx)
	jle	.L339
.L479:
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L455
	movq	%rbx, %rdx
	movq	%rax, %rbx
	cmpb	$100, 28(%rbx)
	jg	.L479
.L339:
	je	.L480
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L345
	leaq	8(%rbx), %rdx
	movq	%rax, %rbx
	jmp	.L337
	.p2align 4,,10
	.p2align 3
.L391:
	leaq	8(%r12), %rbx
.L455:
	movq	%rbx, %rbp
.L343:
	movl	$40, %edi
	call	_Znwm@PLT
	movq	$0, (%rax)
	movb	$100, 28(%rax)
	movq	%rax, %r13
	movl	$0, 32(%rax)
	movq	$0, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	%rax, 0(%rbp)
	movq	(%rsp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L393
	movq	%rax, (%rsp)
	movq	0(%rbp), %rsi
.L346:
	movq	8(%rsp), %rdi
	call	_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_
	addq	$1, 16(%rsp)
	jmp	.L344
	.p2align 4,,10
	.p2align 3
.L480:
	movq	(%rdx), %r13
	testq	%r13, %r13
	je	.L481
.L344:
	cmpl	$4, 32(%r13)
	je	.L350
	leaq	.LC6(%rip), %rcx
	leaq	_ZZ9ecall_mapE8__func__(%rip), %rdx
	leaq	.LC3(%rip), %rdi
	movl	$84, %esi
	call	__assert@PLT
.LEHE0:
.L350:
	movq	8(%rsp), %rbx
	testq	%rbx, %rbx
	je	.L272
	movq	%rbx, %rax
	leaq	8(%r12), %rdx
	jmp	.L352
	.p2align 4,,10
	.p2align 3
.L482:
	movq	%rax, %rdx
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L351
.L352:
	cmpb	$100, 28(%rax)
	jg	.L482
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L352
.L351:
	leaq	8(%r12), %rax
	cmpq	%rax, %rdx
	je	.L355
	cmpb	$101, 28(%rdx)
	jle	.L483
.L355:
	movq	(%rbx), %rbp
	testq	%rbp, %rbp
	je	.L356
	movq	0(%rbp), %r13
	testq	%r13, %r13
	je	.L357
	movq	0(%r13), %r14
	testq	%r14, %r14
	je	.L358
	movq	(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L358:
	movq	8(%r13), %r14
	testq	%r14, %r14
	je	.L359
	movq	(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L359:
	movq	%r13, %rdi
	call	_ZdlPv@PLT
.L357:
	movq	8(%rbp), %r13
	testq	%r13, %r13
	je	.L360
	movq	0(%r13), %r14
	testq	%r14, %r14
	je	.L361
	movq	(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L361:
	movq	8(%r13), %r14
	testq	%r14, %r14
	je	.L362
	movq	(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L362:
	movq	%r13, %rdi
	call	_ZdlPv@PLT
.L360:
	movq	%rbp, %rdi
	call	_ZdlPv@PLT
.L356:
	movq	8(%rbx), %rbp
	testq	%rbp, %rbp
	je	.L363
	movq	0(%rbp), %r13
	testq	%r13, %r13
	je	.L364
	movq	0(%r13), %r14
	testq	%r14, %r14
	je	.L365
	movq	(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L365:
	movq	8(%r13), %r14
	testq	%r14, %r14
	je	.L366
	movq	(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L366:
	movq	%r13, %rdi
	call	_ZdlPv@PLT
.L364:
	movq	8(%rbp), %r13
	testq	%r13, %r13
	je	.L367
	movq	0(%r13), %r14
	testq	%r14, %r14
	je	.L368
	movq	(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L368:
	movq	8(%r13), %r14
	testq	%r14, %r14
	je	.L369
	movq	(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	8(%r14), %rsi
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%r14, %rdi
	call	_ZdlPv@PLT
.L369:
	movq	%r13, %rdi
	call	_ZdlPv@PLT
.L367:
	movq	%rbp, %rdi
	call	_ZdlPv@PLT
.L363:
	movq	%rbx, %rdi
	call	_ZdlPv@PLT
.L272:
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L484
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L483:
	.cfi_restore_state
	leaq	.LC7(%rip), %rcx
	leaq	_ZZ9ecall_mapE8__func__(%rip), %rdx
	leaq	.LC3(%rip), %rdi
	movl	$86, %esi
.LEHB1:
	call	__assert@PLT
.LEHE1:
	movq	8(%rsp), %rbx
	testq	%rbx, %rbx
	jne	.L355
	jmp	.L272
	.p2align 4,,10
	.p2align 3
.L333:
	leaq	8(%rbx), %rbp
	jmp	.L331
	.p2align 4,,10
	.p2align 3
.L345:
	leaq	8(%rbx), %rbp
	jmp	.L343
	.p2align 4,,10
	.p2align 3
.L309:
	leaq	8(%rbx), %rbp
	jmp	.L307
	.p2align 4,,10
	.p2align 3
.L321:
	leaq	8(%rbx), %rbp
	jmp	.L319
	.p2align 4,,10
	.p2align 3
.L290:
	leaq	8(%rbp), %rbx
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L299:
	leaq	8(%rbp), %r13
	jmp	.L292
	.p2align 4,,10
	.p2align 3
.L281:
	leaq	8(%rbp), %rbx
	jmp	.L274
.L377:
	movq	%rax, %rsi
	jmp	.L282
.L384:
	movq	%r13, %rsi
	jmp	.L310
.L379:
	movq	%rax, %rsi
	jmp	.L291
.L387:
	movq	%r13, %rsi
	jmp	.L322
.L393:
	movq	%r13, %rsi
	jmp	.L346
.L390:
	movq	%r13, %rsi
	jmp	.L334
.L381:
	movq	%rax, %rsi
	jmp	.L300
.L465:
	movq	%rdx, %rbx
	jmp	.L274
.L469:
	movq	%rdx, %r13
	jmp	.L292
.L475:
	movq	%rdx, %rbp
	jmp	.L319
.L481:
	movq	%rdx, %rbp
	jmp	.L343
.L484:
	call	__stack_chk_fail@PLT
.L399:
	movq	8(%rsp), %rsi
	movq	%rax, %rbx
	movq	%r12, %rdi
	call	_ZNSt3__16__treeINS_12__value_typeIciEENS_19__map_value_compareIcS2_NS_4lessIcEELb1EEENS_9allocatorIS2_EEE7destroyEPNS_11__tree_nodeIS2_PvEE
	movq	%rbx, %rdi
.LEHB2:
	call	_Unwind_Resume@PLT
.LEHE2:
.L472:
	movq	%rdx, %rbp
	jmp	.L307
.L467:
	movq	%rdx, %rbx
	jmp	.L283
.L478:
	movq	%rdx, %rbp
	jmp	.L331
	.cfi_endproc
.LFE2069:
	.section	.gcc_except_table.ecall_map,"a",@progbits
.LLSDA2069:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2069-.LLSDACSB2069
.LLSDACSB2069:
	.uleb128 .LEHB0-.LFB2069
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L399-.LFB2069
	.uleb128 0
	.uleb128 .LEHB1-.LFB2069
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L399-.LFB2069
	.uleb128 0
	.uleb128 .LEHB2-.LFB2069
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSE2069:
	.section	.text.ecall_map
	.size	ecall_map, .-ecall_map
	.section	.text.unlikely.ecall_map
.LCOLDE8:
	.section	.text.ecall_map
.LHOTE8:
	.section	.rodata.str1.1
.LC9:
	.string	"foo"
.LC10:
	.string	"__rhs != nullptr"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"/opt/intel/new-sgxsdk/include/libcxx/string"
	.section	.rodata.str1.1
.LC12:
	.string	"foo == e.what()"
.LC13:
	.string	""
.LC14:
	.string	"foo == clone.what()"
.LC15:
	.string	"false"
	.section	.text.unlikely.ecall_exception,"ax",@progbits
.LCOLDB16:
	.section	.text.ecall_exception,"ax",@progbits
.LHOTB16:
	.p2align 4,,15
	.globl	ecall_exception
	.hidden	ecall_exception
	.type	ecall_exception, @function
ecall_exception:
.LFB1591:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1591
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	.LC9(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$3, %edx
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	leaq	16(%rsp), %rbx
	movq	$0, 16(%rsp)
	movq	$0, 24(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movq	$0, 32(%rsp)
.LEHB3:
	call	_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm@PLT
.LEHE3:
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movq	%rax, %rbp
.LEHB4:
	call	_ZNSt13runtime_errorC1ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE@PLT
.LEHE4:
	movq	_ZNSt13runtime_errorD1Ev@GOTPCREL(%rip), %rdx
	leaq	_ZTISt13runtime_error(%rip), %rsi
	movq	%rbp, %rdi
.LEHB5:
	call	__cxa_throw@PLT
.LEHE5:
.L509:
	movq	%rax, %rdi
.L487:
	subq	$1, %rdx
	jne	.L515
	call	__cxa_begin_catch@PLT
	movq	%rax, %rbp
	movq	(%rax), %rax
	movq	%rbp, %rdi
	call	*16(%rax)
	testq	%rax, %rax
	movq	%rax, %r12
	jne	.L490
	leaq	.LC10(%rip), %rcx
	leaq	_ZZNSt3__1eqIcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_E8__func__(%rip), %rdx
	leaq	.LC11(%rip), %rdi
	movl	$3851, %esi
	call	__assert@PLT
.L490:
	xorl	%eax, %eax
	orq	$-1, %rcx
	movq	%r12, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	movzbl	16(%rsp), %eax
	testb	$1, %al
	je	.L491
	movq	24(%rsp), %r8
.L492:
	cmpq	%rdx, %r8
	je	.L493
.L495:
	leaq	.LC12(%rip), %rcx
	leaq	_ZZ15ecall_exceptionE8__func__(%rip), %rdx
	leaq	.LC3(%rip), %rdi
	movl	$51, %esi
.LEHB6:
	call	__assert@PLT
.L494:
	leaq	.LC13(%rip), %rsi
	movq	%rsp, %rdi
	movq	%rsp, %r12
	call	_ZNSt13runtime_errorC1EPKc@PLT
.LEHE6:
	movq	%rbp, %rsi
	movq	%rsp, %rdi
	call	_ZNSt13runtime_erroraSERKS_@PLT
	movq	%rsp, %rdi
	call	_ZNKSt13runtime_error4whatEv@PLT
	testq	%rax, %rax
	movq	%rax, %rbp
	jne	.L496
	leaq	.LC10(%rip), %rcx
	leaq	_ZZNSt3__1eqIcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_E8__func__(%rip), %rdx
	leaq	.LC11(%rip), %rdi
	movl	$3851, %esi
	call	__assert@PLT
.L496:
	xorl	%eax, %eax
	orq	$-1, %rcx
	movq	%rbp, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	movzbl	16(%rsp), %eax
	testb	$1, %al
	je	.L497
	movq	24(%rsp), %r8
.L498:
	cmpq	%rdx, %r8
	je	.L499
.L501:
	leaq	.LC14(%rip), %rcx
	leaq	_ZZ15ecall_exceptionE8__func__(%rip), %rdx
	leaq	.LC3(%rip), %rdi
	movl	$54, %esi
.LEHB7:
	call	__assert@PLT
.LEHE7:
.L500:
	movq	%r12, %rdi
	call	_ZNSt13runtime_errorD1Ev@PLT
	call	__cxa_end_catch@PLT
.L502:
	movq	%rbx, %rdi
	call	_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev@PLT
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L518
	addq	$56, %rsp
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
.L511:
	.cfi_restore_state
	movq	%rax, %rbp
.L504:
	call	__cxa_end_catch@PLT
.L505:
	movq	%rbx, %rdi
	call	_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev@PLT
	movq	%rbp, %rdi
.LEHB8:
	call	_Unwind_Resume@PLT
.LEHE8:
.L518:
	call	__stack_chk_fail@PLT
.L512:
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	_ZNSt13runtime_errorD1Ev@PLT
	jmp	.L504
.L499:
	orq	$-1, %rdx
	xorl	%esi, %esi
	movq	%rbp, %rcx
	movq	%rbx, %rdi
	call	_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmPKcm@PLT
	testl	%eax, %eax
	jne	.L501
	jmp	.L500
.L497:
	shrq	%rax
	andl	$127, %eax
	movq	%rax, %r8
	jmp	.L498
.L493:
	orq	$-1, %rdx
	xorl	%esi, %esi
	movq	%r12, %rcx
	movq	%rbx, %rdi
	call	_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmPKcm@PLT
	testl	%eax, %eax
	jne	.L495
	jmp	.L494
.L491:
	shrq	%rax
	andl	$127, %eax
	movq	%rax, %r8
	jmp	.L492
.L515:
	call	__cxa_begin_catch@PLT
	leaq	.LC15(%rip), %rcx
	leaq	_ZZ15ecall_exceptionE8__func__(%rip), %rdx
	leaq	.LC3(%rip), %rdi
	movl	$57, %esi
.LEHB9:
	call	__assert@PLT
.LEHE9:
.LEHB10:
	call	__cxa_end_catch@PLT
.LEHE10:
	jmp	.L502
.L508:
	movq	%rax, %r12
	movq	%rdx, %r13
	movq	%rbp, %rdi
	call	__cxa_free_exception@PLT
	movq	%r12, %rdi
	movq	%r13, %rdx
	jmp	.L487
.L510:
	movq	%rax, %rbp
	jmp	.L505
.L513:
	movq	%rax, %rbp
	call	__cxa_end_catch@PLT
	jmp	.L505
	.cfi_endproc
.LFE1591:
	.section	.gcc_except_table.ecall_exception,"a",@progbits
	.align 4
.LLSDA1591:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT1591-.LLSDATTD1591
.LLSDATTD1591:
	.byte	0x1
	.uleb128 .LLSDACSE1591-.LLSDACSB1591
.LLSDACSB1591:
	.uleb128 .LEHB3-.LFB1591
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB4-.LFB1591
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L508-.LFB1591
	.uleb128 0x3
	.uleb128 .LEHB5-.LFB1591
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L509-.LFB1591
	.uleb128 0x3
	.uleb128 .LEHB6-.LFB1591
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L511-.LFB1591
	.uleb128 0
	.uleb128 .LEHB7-.LFB1591
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L512-.LFB1591
	.uleb128 0
	.uleb128 .LEHB8-.LFB1591
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB9-.LFB1591
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L513-.LFB1591
	.uleb128 0
	.uleb128 .LEHB10-.LFB1591
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L510-.LFB1591
	.uleb128 0
.LLSDACSE1591:
	.byte	0x2
	.byte	0
	.byte	0x1
	.byte	0x7d
	.align 4
	.long	0

	.long	DW.ref._ZTISt13runtime_error-.
.LLSDATT1591:
	.section	.text.ecall_exception
	.size	ecall_exception, .-ecall_exception
	.section	.text.unlikely.ecall_exception
.LCOLDE16:
	.section	.text.ecall_exception
.LHOTE16:
	.section	.rodata._ZZ9ecall_mapE8__func__,"a",@progbits
	.align 8
	.type	_ZZ9ecall_mapE8__func__, @object
	.size	_ZZ9ecall_mapE8__func__, 10
_ZZ9ecall_mapE8__func__:
	.string	"ecall_map"
	.section	.rodata._ZZNSt3__1eqIcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_E8__func__,"a",@progbits
	.align 8
	.type	_ZZNSt3__1eqIcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_E8__func__, @object
	.size	_ZZNSt3__1eqIcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_E8__func__, 11
_ZZNSt3__1eqIcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_E8__func__:
	.string	"operator=="
	.section	.rodata._ZZ15ecall_exceptionE8__func__,"a",@progbits
	.align 16
	.type	_ZZ15ecall_exceptionE8__func__, @object
	.size	_ZZ15ecall_exceptionE8__func__, 16
_ZZ15ecall_exceptionE8__func__:
	.string	"ecall_exception"
	.hidden	DW.ref._ZTISt13runtime_error
	.weak	DW.ref._ZTISt13runtime_error
	.section	.data.DW.ref._ZTISt13runtime_error,"awG",@progbits,DW.ref._ZTISt13runtime_error,comdat
	.align 8
	.type	DW.ref._ZTISt13runtime_error, @object
	.size	DW.ref._ZTISt13runtime_error, 8
DW.ref._ZTISt13runtime_error:
	.quad	_ZTISt13runtime_error
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
