	.file	"kernel.c"
	.text
	.p2align 4,,15
	.globl	kernel
	.def	kernel;	.scl	2;	.type	32;	.endef
	.seh_proc	kernel
kernel:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$136, %rsp
	.seh_stackalloc	136
	.seh_endprologue
	movq	%rdx, 216(%rsp)
	cmpl	$2, %r9d
	jle	.L19
	movl	240(%rsp), %eax
	subl	$1, %eax
	movl	%eax, 40(%rsp)
	cmpl	$1, %eax
	jle	.L19
	movslq	240(%rsp), %rbx
	leaq	8(%rcx), %r10
	movl	$1, 4(%rsp)
	movq	$0, 16(%rsp)
	movl	240(%rsp), %esi
	movl	240(%rsp), %r14d
	leaq	0(,%rbx,8), %rdi
	movq	%rbx, %r11
	leaq	40(%rdi), %rax
	negq	%r11
	leaq	0(,%r11,8), %r15
	movq	%rax, %r12
	movq	%rax, 88(%rsp)
	leal	(%rsi,%rsi), %r11d
	addq	%rdx, %r12
	movq	%r15, 56(%rsp)
	movq	216(%rsp), %rdx
	leaq	8(%rdi), %rax
	movslq	%r11d, %rsi
	movq	%r15, 8(%rsp)
	salq	$3, %rsi
	movq	%rax, 80(%rsp)
	movq	%rsi, 24(%rsp)
	movl	240(%rsp), %esi
	addq	%rax, %rdx
	movl	%r11d, 68(%rsp)
	leaq	(%rcx,%rdi), %rax
	subl	$3, %esi
	leaq	1(%rbx,%rsi), %rbx
	movl	%esi, 44(%rsp)
	leaq	0(,%rbx,8), %rsi
	movq	%rsi, 32(%rsp)
	leal	-1(%r9), %esi
	movl	%esi, 64(%rsp)
	movl	240(%rsp), %esi
	leal	-2(%rsi), %r9d
	leaq	0(,%r9,8), %rbx
	movq	%r9, %rsi
	movl	%r9d, 108(%rsp)
	shrl	$2, %r9d
	andl	$-4, %esi
	movq	%rbx, 48(%rsp)
	salq	$5, %r9
	leal	1(%rsi), %ebx
	movl	%esi, 104(%rsp)
	movl	%ebx, 116(%rsp)
	leal	2(%rsi), %ebx
	movl	%ebx, 112(%rsp)
	leal	3(%rsi), %ebx
	addl	$4, %esi
	movl	%esi, 124(%rsp)
	leaq	8(%r8), %rsi
	movq	%r9, 96(%rsp)
	movl	%ebx, 120(%rsp)
	movq	%rsi, 72(%rsp)
	.p2align 4,,10
.L4:
	movl	68(%rsp), %esi
	leaq	48(%rax), %rbx
	movl	%r14d, %r13d
	movl	%r14d, %ebp
	subl	240(%rsp), %r13d
	leaq	16(%rax), %r9
	addl	$1, 4(%rsp)
	cmpq	%rbx, %rdx
	setnb	%r15b
	cmpq	%r9, %r12
	setbe	%bl
	leal	(%rsi,%r13), %r14d
	movq	80(%rsp), %rsi
	orl	%ebx, %r15d
	leaq	32(%r10), %rbx
	cmpq	%rbx, %rdx
	leaq	(%rsi,%rax), %r11
	setnb	%sil
	cmpq	%r12, %r10
	setnb	%bl
	orl	%esi, %ebx
	andl	%r15d, %ebx
	cmpl	$2, 44(%rsp)
	seta	%sil
	andl	%esi, %ebx
	leaq	32(%rax), %rsi
	cmpq	%rsi, %rdx
	setnb	%sil
	cmpq	%rax, %r12
	setbe	%r15b
	orl	%r15d, %esi
	andl	%esi, %ebx
	movq	48(%rsp), %rsi
	addq	%rdx, %rsi
	cmpq	%rsi, %r8
	setnb	%sil
	cmpq	72(%rsp), %rdx
	setnb	%r15b
	orl	%r15d, %esi
	testb	%sil, %bl
	je	.L11
	movq	88(%rsp), %rsi
	leaq	(%rsi,%rax), %rbx
	cmpq	%rbx, %rdx
	setnb	%sil
	cmpq	%r11, %r12
	setbe	%bl
	orb	%bl, %sil
	je	.L11
	movq	96(%rsp), %rsi
	xorl	%ebx, %ebx
	vbroadcastsd	(%r8), %ymm2
	.p2align 4,,10
.L5:
	vmovupd	(%rax,%rbx), %xmm3
	vinsertf128	$0x1, 16(%rax,%rbx), %ymm3, %ymm0
	vmovupd	(%r9,%rbx), %xmm4
	vinsertf128	$0x1, 16(%r9,%rbx), %ymm4, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	vmovupd	(%r10,%rbx), %xmm5
	vinsertf128	$0x1, 16(%r10,%rbx), %ymm5, %ymm1
	vmovupd	(%r11,%rbx), %xmm3
	vaddpd	%ymm1, %ymm0, %ymm0
	vinsertf128	$0x1, 16(%r11,%rbx), %ymm3, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm0
	vmovups	%xmm0, (%rdx,%rbx)
	vextractf128	$0x1, %ymm0, 16(%rdx,%rbx)
	addq	$32, %rbx
	cmpq	%rsi, %rbx
	jne	.L5
	movl	104(%rsp), %ebx
	movl	108(%rsp), %esi
	cmpl	%esi, %ebx
	je	.L8
	movl	116(%rsp), %r15d
	addl	%ebp, %ebx
	movl	112(%rsp), %esi
	movslq	%ebx, %rbx
	vmovsd	(%rcx,%rbx,8), %xmm0
	leal	(%r15,%r13), %ebx
	leal	0(%rbp,%rsi), %r9d
	movslq	%ebx, %rbx
	leal	0(%rbp,%r15), %r11d
	movslq	%r9d, %r9
	vaddsd	(%rcx,%r9,8), %xmm0, %xmm0
	movslq	%r11d, %r11
	vaddsd	(%rcx,%rbx,8), %xmm0, %xmm0
	leal	(%r15,%r14), %ebx
	movslq	%ebx, %rbx
	vaddsd	(%rcx,%rbx,8), %xmm0, %xmm0
	vmulsd	(%r8), %xmm0, %xmm0
	movq	216(%rsp), %rbx
	vmovsd	%xmm0, (%rbx,%r11,8)
	cmpl	40(%rsp), %esi
	jge	.L8
	movl	120(%rsp), %r15d
	vmovsd	(%rcx,%r11,8), %xmm0
	leal	(%rsi,%r13), %r11d
	movslq	%r11d, %r11
	leal	0(%rbp,%r15), %ebx
	movslq	%ebx, %rbx
	vaddsd	(%rcx,%rbx,8), %xmm0, %xmm0
	vaddsd	(%rcx,%r11,8), %xmm0, %xmm0
	leal	(%rsi,%r14), %r11d
	movslq	%r11d, %r11
	vaddsd	(%rcx,%r11,8), %xmm0, %xmm0
	vmulsd	(%r8), %xmm0, %xmm0
	movq	216(%rsp), %r11
	vmovsd	%xmm0, (%r11,%r9,8)
	cmpl	%r15d, 40(%rsp)
	jle	.L8
	addl	124(%rsp), %ebp
	addl	%r15d, %r13d
	vmovsd	(%rcx,%r9,8), %xmm0
	movslq	%r13d, %r13
	leal	(%r15,%r14), %r9d
	movslq	%r9d, %r9
	movslq	%ebp, %rbp
	vaddsd	(%rcx,%rbp,8), %xmm0, %xmm0
	vaddsd	(%rcx,%r13,8), %xmm0, %xmm0
	vaddsd	(%rcx,%r9,8), %xmm0, %xmm0
	vmulsd	(%r8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r11,%rbx,8)
.L8:
	movq	56(%rsp), %rbx
	addq	%rdi, %r10
	addq	%rdi, %r12
	addq	%rdi, %rdx
	addq	%rbx, 8(%rsp)
	addq	%rdi, %rax
	addq	%rdi, 16(%rsp)
	addq	%rdi, 24(%rsp)
	addq	%rdi, 32(%rsp)
	movl	64(%rsp), %ebx
	cmpl	%ebx, 4(%rsp)
	jne	.L4
	vzeroupper
.L19:
	addq	$136, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
.L11:
	movq	8(%rsp), %rsi
	movq	%rax, %r9
	movq	16(%rsp), %rbx
	subq	%rcx, %r9
	movq	24(%rsp), %r11
	movq	216(%rsp), %rbp
	addq	%rsi, %rbx
	addq	%rsi, %r11
	movq	32(%rsp), %rsi
	addq	%rcx, %rbx
	addq	%rcx, %r11
	.p2align 4,,10
.L7:
	vmovsd	(%rcx,%r9), %xmm0
	vaddsd	16(%rcx,%r9), %xmm0, %xmm0
	vaddsd	8(%rbx,%r9), %xmm0, %xmm0
	vaddsd	8(%r11,%r9), %xmm0, %xmm0
	vmulsd	(%r8), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rbp,%r9)
	addq	$8, %r9
	cmpq	%rsi, %r9
	jne	.L7
	jmp	.L8
	.seh_endproc
	.ident	"GCC: (x86_64-win32-seh-rev0, Built by MinGW-W64 project) 8.1.0"
