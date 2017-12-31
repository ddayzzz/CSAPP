	.file	"find_range.c"
	.text
	.globl	find_range
	.def	find_range;	.scl	2;	.type	32;	.endef
	.seh_proc	find_range
find_range:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	vmovss	%xmm0, 16(%rbp)
	vxorps	%xmm0, %xmm0, %xmm0
	vucomiss	16(%rbp), %xmm0
	jbe	.L13
	movl	$0, -4(%rbp)
	jmp	.L4
.L13:
	vxorps	%xmm0, %xmm0, %xmm0
	vucomiss	16(%rbp), %xmm0
	jp	.L5
	vxorps	%xmm0, %xmm0, %xmm0
	vucomiss	16(%rbp), %xmm0
	jne	.L5
	movl	$1, -4(%rbp)
	jmp	.L4
.L5:
	vmovss	16(%rbp), %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vucomiss	%xmm1, %xmm0
	jbe	.L14
	movl	$2, -4(%rbp)
	jmp	.L4
.L14:
	movl	$3, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 7.1.0"
