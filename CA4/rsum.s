	.file	"rsum.c"
	.text
	.globl	rsum
	.def	rsum;	.scl	2;	.type	32;	.endef
	.seh_proc	rsum
rsum:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -64(%rbp)
	movl	%edx, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jg	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	-64(%rbp), %rax
	movl	(%rax), %ebx
	movl	-56(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-64(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rcx
	call	rsum
	addl	%ebx, %eax
.L3:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 7.2.0"
