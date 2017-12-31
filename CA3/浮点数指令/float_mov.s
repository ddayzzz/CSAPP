	.file	"float_mov.c"
	.text
	.globl	float_mov
	.def	float_mov;	.scl	2;	.type	32;	.endef
	.seh_proc	float_mov
float_mov:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	vmovss	%xmm0, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	24(%rbp), %rax
	vmovss	(%rax), %xmm0
	vmovss	%xmm0, -4(%rbp)
	movq	32(%rbp), %rax
	vmovss	16(%rbp), %xmm0
	vmovss	%xmm0, (%rax)
	vmovss	-4(%rbp), %xmm0
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 7.1.0"
