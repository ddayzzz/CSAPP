	.file	"3.5.5.c"
	.text
	.globl	stroe_uprod
	.def	stroe_uprod;	.scl	2;	.type	32;	.endef
	.seh_proc	stroe_uprod
stroe_uprod:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r12
	.seh_pushreg	%r12
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 24(%rbp)
	movq	%rdx, 32(%rbp)
	movq	%r8, 40(%rbp)
	movq	32(%rbp), %rax
	movq	%rax, %r11
	movl	$0, %r12d
	movq	40(%rbp), %rax
	movq	%rax, %r9
	movl	$0, %r10d
	movq	%r12, %rdx
	imulq	%r9, %rdx
	movq	%r10, %rax
	imulq	%r11, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r11, %rax
	mulq	%r9
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movq	24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	nop
	popq	%r12
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 7.1.0"
