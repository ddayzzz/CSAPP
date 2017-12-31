	.file	"3.5.8.c"
	.text
	.globl	var_ele
	.type	var_ele, @function
var_ele:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movq	%rax, %rdx
	movq	%rdx, %r8
	movl	$0, %r9d
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-48(%rbp), %rax
	movl	(%rdx,%rax,4), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	var_ele, .-var_ele
	.section	.rodata
.LC0:
	.string	"%d\n"
.LC1:
	.string	"pause"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1640, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	-1632(%rbp), %rax
	movq	%rax, -1640(%rbp)
	movl	$160, %edi
	call	malloc
	movq	%rax, -1640(%rbp)
	movl	$0, -1644(%rbp)
	jmp	.L4
.L5:
	movl	-1644(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-1640(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	$160, %edi
	call	malloc
	movq	%rax, (%rbx)
	addl	$1, -1644(%rbp)
.L4:
	cmpl	$19, -1644(%rbp)
	jle	.L5
	movl	$555, -1152(%rbp)
	leaq	-1632(%rbp), %rax
	movl	$20, %ecx
	movl	$5, %edx
	movq	%rax, %rsi
	movl	$20, %edi
	call	var_ele
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$.LC1, %edi
	call	system
	nop
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L6
	call	__stack_chk_fail
.L6:
	addq	$1640, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
