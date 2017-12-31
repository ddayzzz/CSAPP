	.file	"cel2fahr.c"
	.text
	.globl	cel2fahr
	.def	cel2fahr;	.scl	2;	.type	32;	.endef
	.seh_proc	cel2fahr
cel2fahr:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	vmovsd	%xmm0, 16(%rbp)
	vmovsd	16(%rbp), %xmm1
	vmovsd	.LC0(%rip), %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	.LC1(%rip), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, %rax
	vmovq	%rax, %xmm0
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	-858993459
	.long	1073532108
	.align 8
.LC1:
	.long	0
	.long	1077936128
	.ident	"GCC: (GNU) 7.1.0"
