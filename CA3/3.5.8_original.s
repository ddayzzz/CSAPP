	.file	"3.5.8.c"
	.text
	.globl	var_ele
	.def	var_ele;	.scl	2;	.type	32;	.endef
	.seh_proc	var_ele
var_ele:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	16(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -8(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r10
	movl	$0, %r11d
	movl	32(%rbp), %edx
	movslq	%edx, %rdx
	cltq
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rax, %rdx
	movl	40(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 7.1.0"
