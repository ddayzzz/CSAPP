	.file	"funct.c"
	.text
	.globl	funct
	.def	funct;	.scl	2;	.type	32;	.endef
	.seh_proc	funct
funct:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	vmovsd	%xmm0, 16(%rbp)
	vmovss	%xmm1, 24(%rbp)
	vmovsd	%xmm2, 32(%rbp)
	movl	%r9d, 40(%rbp)
	vcvtss2sd	24(%rbp), %xmm0, %xmm0
	vmulsd	16(%rbp), %xmm0, %xmm0
	vcvtsi2sd	40(%rbp), %xmm1, %xmm1
	vmovsd	32(%rbp), %xmm2
	vdivsd	%xmm1, %xmm2, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, %rax
	vmovq	%rax, %xmm0
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 7.1.0"
