	.file	"pa_3.20.c"
	.text
	.globl	arith
	.def	arith;	.scl	2;	.type	32;	.endef
	.seh_proc	arith
arith:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	leal	7(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 7.1.0"
