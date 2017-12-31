	.file	"fcvt.c"
	.text
	.globl	fcvt
	.def	fcvt;	.scl	2;	.type	32;	.endef
	.seh_proc	fcvt
fcvt:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	24(%rbp), %rax
	vmovss	(%rax), %xmm0
	vmovss	%xmm0, -4(%rbp)
	movq	32(%rbp), %rax
	vmovsd	(%rax), %xmm0
	vmovsd	%xmm0, -16(%rbp)
	movq	40(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -20(%rbp)
	vmovsd	-16(%rbp), %xmm0
	vcvttsd2si	%xmm0, %edx
	movq	40(%rbp), %rax
	movl	%edx, (%rax)
	vcvtsi2ss	16(%rbp), %xmm0, %xmm0
	movq	24(%rbp), %rax
	vmovss	%xmm0, (%rax)
	vcvtsi2sd	-20(%rbp), %xmm0, %xmm0
	movq	32(%rbp), %rax
	vmovsd	%xmm0, (%rax)
	vcvtss2sd	-4(%rbp), %xmm0, %xmm0
	vmovq	%xmm0, %rax
	vmovq	%rax, %xmm0
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 7.1.0"
