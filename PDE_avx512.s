	.file	"PDE.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4,,15
	.globl	_Z8zeroFunciidd
	.type	_Z8zeroFunciidd, @function
_Z8zeroFunciidd:
.LFB8375:
	.cfi_startproc
	vxorpd	xmm2, xmm2, xmm2
	vfmadd132sd	xmm0, xmm2, xmm2
	vfmadd231sd	xmm0, xmm1, xmm2
	ret
	.cfi_endproc
.LFE8375:
	.size	_Z8zeroFunciidd, .-_Z8zeroFunciidd
	.section	.text._ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_,"axG",@progbits,_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_,comdat
	.p2align 4,,15
	.weak	_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_
	.type	_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_, @function
_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_:
.LFB8846:
	.cfi_startproc
	mov	rax, QWORD PTR [rdi]
	mov	r8, rsi
	vmovsd	xmm0, QWORD PTR [rax+16]
	mov	rcx, QWORD PTR [rax]
	vmovsd	xmm1, QWORD PTR [rax+8]
	mov	esi, DWORD PTR [rdx]
	mov	edi, DWORD PTR [r8]
	jmp	rcx
	.cfi_endproc
.LFE8846:
	.size	_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_, .-_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_
	.text
	.p2align 4,,15
	.type	_ZN3PDE12applyStencilEP4GridS1_._omp_fn.0, @function
_ZN3PDE12applyStencilEP4GridS1_._omp_fn.0:
.LFB9375:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	rbx, rdi
	and	rsp, -64
	add	rsp, -128
	call	omp_get_num_threads
	mov	r12d, eax
	call	omp_get_thread_num
	mov	ecx, eax
	mov	eax, DWORD PTR [rbx+236]
	sub	eax, 2
	cdq
	idiv	r12d
	cmp	ecx, edx
	jl	.L5
.L17:
	imul	ecx, eax
	add	ecx, edx
	lea	edx, [rax+rcx]
	cmp	ecx, edx
	jge	.L31
	mov	esi, DWORD PTR [rbx+232]
	vmovsd	xmm7, QWORD PTR [rbx+224]
	lea	edi, [rsi-1]
	mov	DWORD PTR [rsp+120], edi
	lea	edi, [rdx+1]
	lea	edx, [rsi-10]
	and	edx, -8
	mov	DWORD PTR [rsp+28], edi
	lea	edi, [rdx+9]
	mov	DWORD PTR [rsp+24], edi
	lea	edi, [rsi-2]
	vmovsd	xmm6, QWORD PTR [rbx+216]
	vmovsd	xmm5, QWORD PTR [rbx+208]
	mov	DWORD PTR [rsp+20], edi
	vmovapd	zmm4, ZMMWORD PTR [rbx+128]
	vmovapd	zmm3, ZMMWORD PTR [rbx+64]
	vmovapd	zmm2, ZMMWORD PTR [rbx]
	mov	r12, QWORD PTR [rbx+200]
	mov	rbx, QWORD PTR [rbx+192]
	lea	eax, [rcx+1]
	lea	r15d, [rsi-8]
	vbroadcastsd	ymm10, xmm7
	vbroadcastsd	ymm9, xmm6
	vbroadcastsd	ymm8, xmm5
	.p2align 4,,10
	.p2align 3
.L9:
	lea	edi, [rax+1]
	mov	DWORD PTR [rsp+52], edi
	lea	r10d, [rax-1]
	mov	ecx, 1
	cmp	r15d, 1
	jle	.L33
	.p2align 4,,10
	.p2align 3
.L16:
	mov	edx, DWORD PTR [r12]
	mov	esi, eax
	imul	esi, edx
	mov	rdi, QWORD PTR [r12+8]
	lea	r9d, [rcx+1+rsi]
	movsx	r9, r9d
	lea	r8d, [rcx-1+rsi]
	vmovupd	zmm0, ZMMWORD PTR [rdi+r9*8]
	movsx	r8, r8d
	vaddpd	zmm0, zmm0, ZMMWORD PTR [rdi+r8*8]
	mov	r8d, edx
	imul	r8d, r10d
	add	edx, esi
	add	edx, ecx
	movsx	rdx, edx
	vmulpd	zmm1, zmm0, zmm2
	add	r8d, ecx
	vmovupd	zmm0, ZMMWORD PTR [rdi+rdx*8]
	movsx	r8, r8d
	vaddpd	zmm0, zmm0, ZMMWORD PTR [rdi+r8*8]
	add	esi, ecx
	mov	edx, DWORD PTR [rbx]
	vfmadd132pd	zmm0, zmm1, zmm3
	movsx	rsi, esi
	imul	edx, eax
	vfmsub231pd	zmm0, zmm4, ZMMWORD PTR [rdi+rsi*8]
	add	edx, ecx
	mov	rsi, QWORD PTR [rbx+8]
	movsx	rdx, edx
	add	ecx, 8
	vmovupd	ZMMWORD PTR [rsi+rdx*8], zmm0
	cmp	ecx, r15d
	jl	.L16
	mov	r10d, DWORD PTR [rsp+24]
.L15:
	cmp	r10d, DWORD PTR [rsp+120]
	jge	.L12
	mov	ecx, DWORD PTR [r12]
	mov	r14d, eax
	imul	r14d, ecx
	lea	esi, [rax-1]
	imul	eax, DWORD PTR [rbx]
	imul	esi, ecx
	mov	rdx, QWORD PTR [r12+8]
	movsx	r8, r14d
	lea	edi, [rcx+r14]
	movsx	rcx, eax
	movsx	rax, r10d
	lea	r9, [r8+1+rax]
	mov	r13d, esi
	mov	DWORD PTR [rsp+124], edi
	lea	r9, [rdx+r9*8]
	mov	rdi, QWORD PTR [rbx+8]
	mov	QWORD PTR [rsp+56], r9
	mov	DWORD PTR [rsp+116], esi
	movsx	r9, r13d
	lea	rsi, [rcx+rax]
	mov	DWORD PTR [rsp+112], ecx
	lea	rcx, [rcx+4+rax]
	lea	rsi, [rdi+rsi*8]
	mov	QWORD PTR [rsp+40], r9
	mov	QWORD PTR [rsp+104], rdi
	add	r9, rax
	lea	rdi, [rdi+rcx*8]
	lea	rcx, [r8+rax]
	sal	rcx, 3
	lea	r13, [rdx+r9*8]
	lea	r11, [rdx-8+rcx]
	mov	QWORD PTR [rsp+64], r13
	add	rcx, rdx
	movsx	r13, DWORD PTR [rsp+124]
	mov	QWORD PTR [rsp+32], rcx
	lea	rcx, [r8+5+rax]
	lea	r9, [r13+0+rax]
	lea	rcx, [rdx+rcx*8]
	cmp	rsi, rcx
	lea	r9, [rdx+r9*8]
	mov	QWORD PTR [rsp+96], r9
	setnb	r9b
	cmp	QWORD PTR [rsp+56], rdi
	setnb	cl
	or	r9d, ecx
	lea	rcx, [r8+3+rax]
	lea	rcx, [rdx+rcx*8]
	cmp	rsi, rcx
	setnb	cl
	cmp	r11, rdi
	setnb	BYTE PTR [rsp+51]
	or	cl, BYTE PTR [rsp+51]
	and	r9d, ecx
	mov	ecx, DWORD PTR [rsp+20]
	sub	ecx, r10d
	cmp	ecx, 2
	seta	cl
	and	r9d, ecx
	mov	rcx, QWORD PTR [rsp+40]
	lea	rcx, [rcx+4+rax]
	lea	rcx, [rdx+rcx*8]
	cmp	rsi, rcx
	setnb	cl
	cmp	QWORD PTR [rsp+64], rdi
	setnb	BYTE PTR [rsp+40]
	or	cl, BYTE PTR [rsp+40]
	and	r9d, ecx
	lea	rcx, [r13+4+rax]
	lea	rcx, [rdx+rcx*8]
	cmp	rsi, rcx
	setnb	cl
	cmp	QWORD PTR [rsp+96], rdi
	setnb	r13b
	or	ecx, r13d
	test	r9b, cl
	je	.L10
	lea	rax, [r8+4+rax]
	lea	rax, [rdx+rax*8]
	mov	r13, QWORD PTR [rsp+32]
	cmp	rsi, rax
	setnb	al
	cmp	r13, rdi
	setnb	cl
	or	al, cl
	je	.L10
	mov	r9, QWORD PTR [rsp+64]
	mov	r8, QWORD PTR [rsp+96]
	vmovupd	ymm16, YMMWORD PTR [r9]
	mov	rdi, QWORD PTR [rsp+56]
	vaddpd	ymm0, ymm16, YMMWORD PTR [r8]
	vmovupd	ymm18, YMMWORD PTR [rdi]
	mov	eax, DWORD PTR [rsp+120]
	vmulpd	ymm0, ymm0, ymm9
	vaddpd	ymm1, ymm18, YMMWORD PTR [r11]
	sub	eax, r10d
	mov	ecx, eax
	shr	ecx, 2
	vfmsub231pd	ymm0, ymm10, YMMWORD PTR [r13+0]
	vmovapd	YMMWORD PTR [rsp+64], ymm16
	vfnmadd231pd	ymm0, ymm8, ymm1
	vmovupd	YMMWORD PTR [rsi], ymm0
	cmp	ecx, 1
	je	.L11
	vmovupd	ymm0, YMMWORD PTR [r11+32]
	vaddpd	ymm1, ymm0, YMMWORD PTR [rdi+32]
	vmovupd	ymm0, YMMWORD PTR [r9+32]
	vaddpd	ymm0, ymm0, YMMWORD PTR [r8+32]
	vmulpd	ymm0, ymm0, ymm9
	vfmsub231pd	ymm0, ymm10, YMMWORD PTR [r13+32]
	vfnmadd231pd	ymm0, ymm1, ymm8
	vmovupd	YMMWORD PTR [rsi+32], ymm0
.L11:
	mov	esi, eax
	and	esi, -4
	lea	ecx, [rsi+r10]
	cmp	eax, esi
	je	.L12
	mov	edi, DWORD PTR [rsp+124]
	lea	eax, [rcx+1]
	lea	r9d, [rdi+rcx]
	mov	edi, DWORD PTR [rsp+116]
	movsx	r9, r9d
	vmovsd	xmm0, QWORD PTR [rdx+r9*8]
	add	edi, ecx
	movsx	rdi, edi
	vaddsd	xmm0, xmm0, QWORD PTR [rdx+rdi*8]
	lea	r9d, [r14-1+rcx]
	lea	edi, [r14+rcx]
	vmulsd	xmm0, xmm0, xmm6
	movsx	r9, r9d
	lea	r8d, [r14+rax]
	movsx	rdi, edi
	vmovsd	xmm1, QWORD PTR [rdx+r9*8]
	vfmsub231sd	xmm0, xmm7, QWORD PTR [rdx+rdi*8]
	movsx	r8, r8d
	lea	r11, [rdx+r8*8]
	vaddsd	xmm1, xmm1, QWORD PTR [r11]
	mov	r10d, DWORD PTR [rsp+112]
	mov	r9, QWORD PTR [rsp+104]
	vfnmadd231sd	xmm0, xmm5, xmm1
	lea	esi, [r10+rcx]
	movsx	rsi, esi
	vmovsd	QWORD PTR [r9+rsi*8], xmm0
	cmp	DWORD PTR [rsp+120], eax
	jle	.L12
	lea	esi, [rcx+2]
	lea	r9d, [r14+rsi]
	movsx	r9, r9d
	lea	r13, [rdx+r9*8]
	lea	r9d, [r10+rax]
	mov	r10d, DWORD PTR [rsp+124]
	vmovsd	xmm1, QWORD PTR [rdx+rdi*8]
	add	r10d, eax
	movsx	r10, r10d
	vmovsd	xmm0, QWORD PTR [rdx+r10*8]
	add	eax, DWORD PTR [rsp+116]
	cdqe
	vaddsd	xmm0, xmm0, QWORD PTR [rdx+rax*8]
	vaddsd	xmm1, xmm1, QWORD PTR [r13+0]
	movsx	r9, r9d
	vmulsd	xmm0, xmm0, xmm6
	vfmsub231sd	xmm0, xmm7, QWORD PTR [r11]
	mov	r11, QWORD PTR [rsp+104]
	vfnmadd231sd	xmm0, xmm5, xmm1
	vmovsd	QWORD PTR [r11+r9*8], xmm0
	cmp	DWORD PTR [rsp+120], esi
	jle	.L12
	mov	edi, DWORD PTR [rsp+116]
	mov	eax, DWORD PTR [rsp+112]
	add	edi, esi
	movsx	rdi, edi
	add	eax, esi
	vmovsd	xmm0, QWORD PTR [rdx+rdi*8]
	add	esi, DWORD PTR [rsp+124]
	movsx	rsi, esi
	vaddsd	xmm0, xmm0, QWORD PTR [rdx+rsi*8]
	vmovsd	xmm1, QWORD PTR [rdx+r8*8]
	lea	ecx, [r14+3+rcx]
	vmulsd	xmm0, xmm0, xmm6
	movsx	rcx, ecx
	vaddsd	xmm1, xmm1, QWORD PTR [rdx+rcx*8]
	cdqe
	vfmsub231sd	xmm0, xmm7, QWORD PTR [r13+0]
	vfnmadd231sd	xmm0, xmm5, xmm1
	vmovsd	QWORD PTR [r11+rax*8], xmm0
.L12:
	mov	eax, DWORD PTR [rsp+52]
	cmp	eax, DWORD PTR [rsp+28]
	jne	.L9
	vzeroupper
.L31:
	lea	rsp, [rbp-40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_restore_state
	mov	edi, DWORD PTR [rsp+124]
	mov	esi, DWORD PTR [rsp+116]
	add	edi, r10d
	movsx	rdi, edi
	vmovsd	xmm0, QWORD PTR [rdx+rdi*8]
	add	esi, r10d
	movsx	rsi, esi
	vaddsd	xmm0, xmm0, QWORD PTR [rdx+rsi*8]
	lea	eax, [r10+1]
	lea	esi, [r14+r10]
	vmulsd	xmm0, xmm0, xmm6
	lea	edi, [r14-1+r10]
	lea	r11d, [rax+r14]
	movsx	rsi, esi
	movsx	rdi, edi
	vfmsub231sd	xmm0, xmm7, QWORD PTR [rdx+rsi*8]
	vmovsd	xmm1, QWORD PTR [rdx+rdi*8]
	movsx	r11, r11d
	lea	r9, [rdx+r11*8]
	vaddsd	xmm1, xmm1, QWORD PTR [r9]
	mov	r8d, DWORD PTR [rsp+112]
	mov	r13, QWORD PTR [rsp+104]
	vfnmadd231sd	xmm0, xmm5, xmm1
	lea	ecx, [r8+r10]
	movsx	rcx, ecx
	vmovsd	QWORD PTR [r13+0+rcx*8], xmm0
	cmp	eax, DWORD PTR [rsp+120]
	jge	.L12
	lea	ecx, [r10+2]
	lea	edi, [r14+rcx]
	movsx	r13, edi
	lea	edi, [rax+r8]
	mov	r8d, DWORD PTR [rsp+124]
	vmovsd	xmm1, QWORD PTR [rdx+rsi*8]
	add	r8d, eax
	movsx	r8, r8d
	vmovsd	xmm0, QWORD PTR [rdx+r8*8]
	add	eax, DWORD PTR [rsp+116]
	cdqe
	vaddsd	xmm0, xmm0, QWORD PTR [rdx+rax*8]
	mov	QWORD PTR [rsp+96], r13
	lea	r13, [rdx+r13*8]
	vmulsd	xmm0, xmm0, xmm6
	vaddsd	xmm1, xmm1, QWORD PTR [r13+0]
	movsx	rdi, edi
	vfmsub231sd	xmm0, xmm7, QWORD PTR [r9]
	mov	r9, QWORD PTR [rsp+104]
	vfnmadd231sd	xmm0, xmm5, xmm1
	vmovsd	QWORD PTR [r9+rdi*8], xmm0
	cmp	DWORD PTR [rsp+120], ecx
	jle	.L12
	mov	edi, DWORD PTR [rsp+112]
	lea	eax, [r10+3]
	lea	esi, [r14+rax]
	movsx	r9, esi
	lea	esi, [rdi+rcx]
	mov	edi, DWORD PTR [rsp+124]
	vmovsd	xmm1, QWORD PTR [rdx+r11*8]
	add	edi, ecx
	movsx	rdi, edi
	vmovsd	xmm0, QWORD PTR [rdx+rdi*8]
	add	ecx, DWORD PTR [rsp+116]
	movsx	rcx, ecx
	vaddsd	xmm0, xmm0, QWORD PTR [rdx+rcx*8]
	lea	r8, [rdx+r9*8]
	vaddsd	xmm1, xmm1, QWORD PTR [r8]
	vmulsd	xmm0, xmm0, xmm6
	mov	rcx, QWORD PTR [rsp+104]
	movsx	rsi, esi
	vfmsub231sd	xmm0, xmm7, QWORD PTR [r13+0]
	vfnmadd231sd	xmm0, xmm5, xmm1
	vmovsd	QWORD PTR [rcx+rsi*8], xmm0
	cmp	DWORD PTR [rsp+120], eax
	jle	.L12
	mov	edi, DWORD PTR [rsp+124]
	lea	ecx, [r10+4]
	add	edi, eax
	lea	esi, [r14+rcx]
	mov	r13d, DWORD PTR [rsp+112]
	movsx	rsi, esi
	movsx	rdi, edi
	lea	r11, [rdx+rsi*8]
	vmovsd	xmm0, QWORD PTR [rdx+rdi*8]
	mov	QWORD PTR [rsp+64], rsi
	lea	esi, [r13+0+rax]
	add	eax, DWORD PTR [rsp+116]
	cdqe
	vaddsd	xmm0, xmm0, QWORD PTR [rdx+rax*8]
	mov	rax, QWORD PTR [rsp+104]
	movsx	rsi, esi
	vmulsd	xmm0, xmm0, xmm6
	vfmsub231sd	xmm0, xmm7, QWORD PTR [r8]
	mov	r8, QWORD PTR [rsp+96]
	vmovsd	xmm1, QWORD PTR [rdx+r8*8]
	vaddsd	xmm1, xmm1, QWORD PTR [r11]
	vfnmadd231sd	xmm0, xmm5, xmm1
	vmovsd	QWORD PTR [rax+rsi*8], xmm0
	cmp	DWORD PTR [rsp+120], ecx
	jle	.L12
	mov	edi, DWORD PTR [rsp+124]
	lea	eax, [r10+5]
	add	edi, ecx
	lea	esi, [r14+rax]
	movsx	rdi, edi
	movsx	r8, esi
	vmovsd	xmm0, QWORD PTR [rdx+rdi*8]
	lea	esi, [r13+0+rcx]
	add	ecx, DWORD PTR [rsp+116]
	movsx	rcx, ecx
	vaddsd	xmm0, xmm0, QWORD PTR [rdx+rcx*8]
	vmovsd	xmm1, QWORD PTR [rdx+r9*8]
	mov	QWORD PTR [rsp+96], r8
	vmulsd	xmm0, xmm0, xmm6
	lea	r8, [rdx+r8*8]
	vaddsd	xmm1, xmm1, QWORD PTR [r8]
	mov	r9, QWORD PTR [rsp+104]
	movsx	rsi, esi
	vfmsub231sd	xmm0, xmm7, QWORD PTR [r11]
	vfnmadd231sd	xmm0, xmm5, xmm1
	vmovsd	QWORD PTR [r9+rsi*8], xmm0
	cmp	DWORD PTR [rsp+120], eax
	jle	.L12
	mov	edi, DWORD PTR [rsp+124]
	lea	ecx, [r10+6]
	add	edi, eax
	mov	r11d, r13d
	lea	esi, [r14+rcx]
	movsx	rdi, edi
	movsx	r13, esi
	vmovsd	xmm0, QWORD PTR [rdx+rdi*8]
	lea	esi, [r11+rax]
	add	eax, DWORD PTR [rsp+116]
	cdqe
	vaddsd	xmm0, xmm0, QWORD PTR [rdx+rax*8]
	lea	r9, [rdx+r13*8]
	mov	rax, QWORD PTR [rsp+104]
	vmulsd	xmm0, xmm0, xmm6
	movsx	rsi, esi
	vfmsub231sd	xmm0, xmm7, QWORD PTR [r8]
	mov	r8, QWORD PTR [rsp+64]
	vmovsd	xmm1, QWORD PTR [rdx+r8*8]
	vaddsd	xmm1, xmm1, QWORD PTR [r9]
	vfnmadd231sd	xmm0, xmm5, xmm1
	vmovsd	QWORD PTR [rax+rsi*8], xmm0
	cmp	DWORD PTR [rsp+120], ecx
	jle	.L12
	mov	edi, DWORD PTR [rsp+124]
	lea	eax, [r10+7]
	add	edi, ecx
	lea	esi, [r14+rax]
	movsx	rsi, esi
	movsx	rdi, edi
	lea	r8, [rdx+rsi*8]
	vmovsd	xmm0, QWORD PTR [rdx+rdi*8]
	lea	esi, [r11+rcx]
	add	ecx, DWORD PTR [rsp+116]
	movsx	rcx, ecx
	vaddsd	xmm0, xmm0, QWORD PTR [rdx+rcx*8]
	mov	rcx, QWORD PTR [rsp+96]
	movsx	rsi, esi
	vmulsd	xmm0, xmm0, xmm6
	vmovsd	xmm1, QWORD PTR [rdx+rcx*8]
	vaddsd	xmm1, xmm1, QWORD PTR [r8]
	vfmsub231sd	xmm0, xmm7, QWORD PTR [r9]
	mov	r9, QWORD PTR [rsp+104]
	vfnmadd231sd	xmm0, xmm5, xmm1
	vmovsd	QWORD PTR [r9+rsi*8], xmm0
	cmp	DWORD PTR [rsp+120], eax
	jle	.L12
	mov	esi, DWORD PTR [rsp+116]
	add	r11d, eax
	add	esi, eax
	movsx	rsi, esi
	vmovsd	xmm0, QWORD PTR [rdx+rsi*8]
	add	eax, DWORD PTR [rsp+124]
	cdqe
	vaddsd	xmm0, xmm0, QWORD PTR [rdx+rax*8]
	vmovsd	xmm1, QWORD PTR [rdx+r13*8]
	lea	eax, [r14+8+r10]
	vmulsd	xmm0, xmm0, xmm6
	cdqe
	vaddsd	xmm1, xmm1, QWORD PTR [rdx+rax*8]
	movsx	rcx, r11d
	vfmsub231sd	xmm0, xmm7, QWORD PTR [r8]
	vfnmadd231sd	xmm0, xmm5, xmm1
	vmovsd	QWORD PTR [r9+rcx*8], xmm0
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L33:
	mov	r10d, 1
	jmp	.L15
.L5:
	inc	eax
	xor	edx, edx
	jmp	.L17
	.cfi_endproc
.LFE9375:
	.size	_ZN3PDE12applyStencilEP4GridS1_._omp_fn.0, .-_ZN3PDE12applyStencilEP4GridS1_._omp_fn.0
	.p2align 4,,15
	.type	_ZN3PDE8GSPreConEP4GridS1_._omp_fn.1, @function
_ZN3PDE8GSPreConEP4GridS1_._omp_fn.1:
.LFB9376:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	rbx, rdi
	and	rsp, -64
	add	rsp, -128
	call	omp_get_num_threads
	mov	r12d, eax
	call	omp_get_thread_num
	mov	r9d, eax
	mov	eax, DWORD PTR [rbx+236]
	sub	eax, 2
	cdq
	idiv	r12d
	cmp	r9d, edx
	jl	.L35
.L48:
	imul	r9d, eax
	add	r9d, edx
	add	eax, r9d
	cmp	r9d, eax
	jge	.L57
	mov	edx, DWORD PTR [rbx+232]
	mov	esi, DWORD PTR [rbx+240]
	vmovsd	xmm10, QWORD PTR [rbx+224]
	vmovsd	xmm12, QWORD PTR [rbx+216]
	vmovsd	xmm11, QWORD PTR [rbx+208]
	vmovapd	zmm6, ZMMWORD PTR [rbx+128]
	vmovapd	zmm5, ZMMWORD PTR [rbx+64]
	vmovapd	zmm4, ZMMWORD PTR [rbx]
	mov	r14, QWORD PTR [rbx+200]
	mov	rbx, QWORD PTR [rbx+192]
	inc	eax
	mov	QWORD PTR [rsp+64], rbx
	mov	DWORD PTR [rsp+32], eax
	lea	ebx, [rdx-16]
	lea	eax, [rdx-18]
	mov	DWORD PTR [rsp+28], ebx
	mov	DWORD PTR [rsp+24], eax
	lea	ebx, [rdx-1]
	lea	eax, [rdx-2]
	mov	DWORD PTR [rsp+36], esi
	mov	DWORD PTR [rsp+60], ebx
	mov	DWORD PTR [rsp+20], eax
	vmovdqa64	ymm3, YMMWORD PTR .LC1[rip]
	inc	r9d
	vbroadcastsd	ymm9, xmm12
	vbroadcastsd	ymm8, xmm11
	vbroadcastsd	ymm7, xmm10
	.p2align 4,,10
	.p2align 3
.L39:
	mov	eax, DWORD PTR [rsp+36]
	add	eax, r9d
	mov	edx, eax
	shr	edx, 31
	lea	r8d, [rax+rdx]
	and	r8d, 1
	sub	r8d, edx
	lea	eax, [r9+1]
	lea	esi, [r8+1]
	mov	DWORD PTR [rsp+124], eax
	cmp	esi, DWORD PTR [rsp+28]
	jge	.L47
	mov	rbx, QWORD PTR [rsp+64]
	movsx	rsi, esi
	mov	edx, DWORD PTR [rbx]
	mov	rcx, QWORD PTR [rbx+8]
	imul	edx, r9d
	mov	eax, DWORD PTR [r14]
	lea	r10d, [r9+1]
	movsx	rdx, edx
	add	rdx, rsi
	lea	rdi, [rcx+rdx*8]
	lea	edx, [r9-1]
	imul	edx, eax
	imul	r10d, eax
	mov	r11, QWORD PTR [r14+8]
	movsx	rdx, edx
	add	rdx, rsi
	mov	r12d, DWORD PTR [rsp+24]
	lea	rcx, [r11+rdx*8]
	movsx	rdx, r10d
	sub	r10d, eax
	movsx	r10, r10d
	sub	r12d, r8d
	add	rdx, rsi
	shr	r12d, 4
	add	rsi, r10
	lea	rax, [r11+rsi*8]
	movsx	rbx, r8d
	mov	esi, r12d
	sal	rsi, 4
	add	r10, rbx
	add	r10, rsi
	lea	rdx, [r11+rdx*8]
	lea	rsi, [r11+136+r10*8]
	.p2align 4,,10
	.p2align 3
.L46:
	vmovsd	xmm0, QWORD PTR [rcx+32]
	vmovsd	xmm14, QWORD PTR [rcx+96]
	vmovhpd	xmm0, xmm0, QWORD PTR [rcx+48]
	vmovsd	xmm1, QWORD PTR [rcx+64]
	vmovapd	xmm17, xmm0
	vmovsd	xmm0, QWORD PTR [rcx]
	vmovhpd	xmm14, xmm14, QWORD PTR [rcx+112]
	vmovhpd	xmm1, xmm1, QWORD PTR [rcx+80]
	vmovhpd	xmm0, xmm0, QWORD PTR [rcx+16]
	vinsertf128	ymm1, ymm1, xmm14, 0x1
	vmovsd	xmm14, QWORD PTR [rdx+96]
	vinsertf64x2	ymm0, ymm0, xmm17, 0x1
	vinsertf64x4	zmm0, zmm0, ymm1, 0x1
	vmovhpd	xmm1, xmm14, QWORD PTR [rdx+112]
	vmovapd	xmm17, xmm1
	vmovsd	xmm1, QWORD PTR [rdx+32]
	vmovsd	xmm14, QWORD PTR [rdx+64]
	vmovhpd	xmm1, xmm1, QWORD PTR [rdx+48]
	vmovapd	xmm18, xmm1
	vmovsd	xmm1, QWORD PTR [rdx]
	vmovhpd	xmm14, xmm14, QWORD PTR [rdx+80]
	vmovhpd	xmm1, xmm1, QWORD PTR [rdx+16]
	vinsertf64x2	ymm14, ymm14, xmm17, 0x1
	vinsertf64x2	ymm1, ymm1, xmm18, 0x1
	vinsertf64x4	zmm1, zmm1, ymm14, 0x1
	vmovsd	xmm14, QWORD PTR [rdi+96]
	vaddpd	zmm0, zmm0, zmm1
	vmovhpd	xmm1, xmm14, QWORD PTR [rdi+112]
	vmovapd	xmm17, xmm1
	vmovsd	xmm1, QWORD PTR [rdi+32]
	vmovsd	xmm14, QWORD PTR [rdi+64]
	vmovhpd	xmm1, xmm1, QWORD PTR [rdi+48]
	vmovapd	xmm18, xmm1
	vmovsd	xmm1, QWORD PTR [rdi]
	vmovhpd	xmm14, xmm14, QWORD PTR [rdi+80]
	vmovhpd	xmm1, xmm1, QWORD PTR [rdi+16]
	vmovsd	xmm16, QWORD PTR [rax+56]
	vinsertf64x2	ymm14, ymm14, xmm17, 0x1
	vinsertf64x2	ymm1, ymm1, xmm18, 0x1
	vmovsd	xmm2, QWORD PTR [rax+24]
	vinsertf64x4	zmm1, zmm1, ymm14, 0x1
	vfmadd231pd	zmm1, zmm5, zmm0
	vmovapd	xmm0, xmm16
	vmovhpd	xmm14, xmm0, QWORD PTR [rax+72]
	vmovhpd	xmm0, xmm2, QWORD PTR [rax+40]
	vmovsd	xmm13, QWORD PTR [rax+88]
	vmovsd	xmm15, QWORD PTR [rax+104]
	vmovapd	xmm18, xmm0
	vmovsd	xmm0, QWORD PTR [rax-8]
	vunpcklpd	xmm17, xmm13, xmm15
	vmovhpd	xmm0, xmm0, QWORD PTR [rax+8]
	vinsertf64x2	ymm14, ymm14, xmm17, 0x1
	vinsertf64x2	ymm0, ymm0, xmm18, 0x1
	vmovhpd	xmm15, xmm15, QWORD PTR [rax+120]
	vinsertf64x4	zmm0, zmm0, ymm14, 0x1
	vmovsd	xmm14, QWORD PTR [rax+72]
	vmovsd	xmm19, QWORD PTR [rax+40]
	vunpcklpd	xmm13, xmm14, xmm13
	vmovsd	xmm14, QWORD PTR [rax+8]
	vunpcklpd	xmm16, xmm19, xmm16
	vunpcklpd	xmm2, xmm14, xmm2
	vinsertf64x2	ymm2, ymm2, xmm16, 0x1
	vinsertf128	ymm13, ymm13, xmm15, 0x1
	vinsertf64x4	zmm2, zmm2, ymm13, 0x1
	vaddpd	zmm0, zmm0, zmm2
	sub	rax, -128
	sub	rdi, -128
	vfmadd132pd	zmm0, zmm1, zmm4
	sub	rcx, -128
	sub	rdx, -128
	vmulpd	zmm0, zmm6, zmm0
	vextractf64x2	xmm1, ymm0, 0x1
	vmovlpd	QWORD PTR [rax-128], xmm0
	vmovhpd	QWORD PTR [rax-112], xmm0
	vextractf64x4	ymm0, zmm0, 0x1
	vmovlpd	QWORD PTR [rax-64], xmm0
	vmovhpd	QWORD PTR [rax-48], xmm0
	vextractf64x2	xmm0, ymm0, 0x1
	vmovlpd	QWORD PTR [rax-96], xmm1
	vmovhpd	QWORD PTR [rax-80], xmm1
	vmovlpd	QWORD PTR [rax-32], xmm0
	vmovhpd	QWORD PTR [rax-16], xmm0
	cmp	rsi, rax
	jne	.L46
	sal	r12d, 4
	lea	esi, [r8+17+r12]
.L47:
	cmp	esi, DWORD PTR [rsp+60]
	jge	.L43
	mov	rax, QWORD PTR [rsp+64]
	mov	r15d, DWORD PTR [rsp+124]
	mov	r12, QWORD PTR [rax+8]
	mov	edi, DWORD PTR [rax]
	mov	eax, DWORD PTR [r14]
	imul	edi, r9d
	imul	r15d, eax
	dec	r9d
	mov	r10d, r9d
	mov	r13d, r15d
	imul	r10d, eax
	sub	r13d, eax
	mov	eax, DWORD PTR [rsp+20]
	movsx	rbx, r13d
	sub	eax, esi
	mov	DWORD PTR [rsp+120], eax
	movsx	rax, esi
	lea	r8, [rbx+rax]
	sal	r8, 3
	movsx	r9, r10d
	lea	rdx, [r8-8]
	mov	QWORD PTR [rsp+80], r9
	mov	DWORD PTR [rsp+40], r15d
	add	r9, rax
	movsx	r15, r15d
	mov	QWORD PTR [rsp+96], rdx
	mov	DWORD PTR [rsp+44], r10d
	lea	rdx, [rax+1+rbx]
	lea	r10, [0+r9*8]
	lea	r9, [r15+rax]
	sal	rdx, 3
	sal	r9, 3
	mov	QWORD PTR [rsp+104], rdx
	mov	QWORD PTR [rsp+88], r9
	lea	r9, [rax+8+rbx]
	sal	r9, 3
	mov	DWORD PTR [rsp+56], edi
	lea	r11, [rax+7+rbx]
	movsx	rdi, edi
	sal	r11, 3
	mov	QWORD PTR [rsp+72], rdi
	add	rdi, rax
	cmp	r9, r8
	mov	QWORD PTR [rsp+48], r15
	setle	r15b
	cmp	QWORD PTR [rsp+104], r11
	setge	r9b
	or	r15d, r9d
	lea	r9, [rax+6+rbx]
	sal	r9, 3
	cmp	r8, r9
	mov	QWORD PTR [rsp+112], r10
	setge	r10b
	cmp	QWORD PTR [rsp+96], r11
	setge	r9b
	or	r9d, r10d
	and	r9d, r15d
	cmp	DWORD PTR [rsp+120], 7
	seta	r10b
	and	r9d, r10d
	mov	r10, QWORD PTR [rsp+72]
	mov	rcx, QWORD PTR [r14+8]
	lea	r10, [rax+7+r10]
	lea	r10, [r12+r10*8]
	lea	rdx, [rcx+r8]
	cmp	rdx, r10
	lea	r15, [rcx+r11]
	lea	rdi, [r12+rdi*8]
	setnb	r10b
	cmp	rdi, r15
	setnb	r15b
	or	r10d, r15d
	and	r9d, r10d
	mov	r10, QWORD PTR [rsp+80]
	lea	r10, [rax+7+r10]
	sal	r10, 3
	cmp	r10, r8
	setle	r10b
	cmp	QWORD PTR [rsp+112], r11
	setge	r15b
	or	r10d, r15d
	test	r9b, r10b
	je	.L40
	mov	r10, QWORD PTR [rsp+48]
	lea	r9, [rax+7+r10]
	sal	r9, 3
	cmp	r9, r8
	setle	r8b
	cmp	QWORD PTR [rsp+88], r11
	setge	r9b
	or	r8b, r9b
	je	.L40
	mov	r15d, DWORD PTR [rsp+120]
	mov	rax, QWORD PTR [rsp+112]
	shr	r15d, 3
	mov	r11, QWORD PTR [rsp+88]
	mov	r9, QWORD PTR [rsp+96]
	mov	r8, QWORD PTR [rsp+104]
	add	rax, rcx
	mov	ebx, r15d
	mov	r10, rax
	add	r11, rcx
	add	r9, rcx
	add	r8, rcx
	sal	rbx, 6
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L42:
	vmovupd	ymm0, YMMWORD PTR [r11+rax]
	vmovupd	ymm2, YMMWORD PTR [r10+rax]
	vpermt2pd	ymm0, ymm3, YMMWORD PTR [r11+32+rax]
	vpermt2pd	ymm2, ymm3, YMMWORD PTR [r10+32+rax]
	vmovupd	ymm1, YMMWORD PTR [rdi+rax]
	vaddpd	ymm0, ymm0, ymm2
	vpermt2pd	ymm1, ymm3, YMMWORD PTR [rdi+32+rax]
	vmovupd	ymm2, YMMWORD PTR [r9+rax]
	vfmadd231pd	ymm1, ymm9, ymm0
	vmovupd	ymm0, YMMWORD PTR [r8+rax]
	vpermt2pd	ymm2, ymm3, YMMWORD PTR [r9+32+rax]
	vpermt2pd	ymm0, ymm3, YMMWORD PTR [r8+32+rax]
	vaddpd	ymm0, ymm0, ymm2
	vfmadd132pd	ymm0, ymm1, ymm8
	vmulpd	ymm0, ymm0, ymm7
	vmovlpd	QWORD PTR [rdx+rax], xmm0
	vmovhpd	QWORD PTR [rdx+16+rax], xmm0
	vextractf64x2	xmm0, ymm0, 0x1
	vmovlpd	QWORD PTR [rdx+32+rax], xmm0
	vmovhpd	QWORD PTR [rdx+48+rax], xmm0
	add	rax, 64
	cmp	rbx, rax
	jne	.L42
	lea	eax, [rsi+r15*8]
	mov	r15d, DWORD PTR [rsp+44]
	mov	r11d, DWORD PTR [rsp+40]
	lea	r8d, [r15+rax]
	movsx	r8, r8d
	vmovsd	xmm0, QWORD PTR [rcx+r8*8]
	lea	edi, [r11+rax]
	movsx	rdi, edi
	vaddsd	xmm0, xmm0, QWORD PTR [rcx+rdi*8]
	mov	ebx, DWORD PTR [rsp+56]
	lea	edi, [r13-1+rax]
	lea	esi, [rbx+rax]
	movsx	rsi, esi
	vmovapd	xmm1, xmm0
	vfmadd213sd	xmm1, xmm12, QWORD PTR [r12+rsi*8]
	lea	esi, [r13+1+rax]
	movsx	rsi, esi
	vmovsd	xmm0, QWORD PTR [rcx+rsi*8]
	movsx	rdi, edi
	vaddsd	xmm0, xmm0, QWORD PTR [rcx+rdi*8]
	lea	edx, [r13+0+rax]
	movsx	rdx, edx
	vfmadd132sd	xmm0, xmm1, xmm11
	mov	r10d, DWORD PTR [rsp+60]
	vmulsd	xmm0, xmm0, xmm10
	vmovsd	QWORD PTR [rcx+rdx*8], xmm0
	lea	edx, [rax+2]
	cmp	edx, r10d
	jge	.L43
	lea	r9d, [r11+rdx]
	movsx	r9, r9d
	lea	edi, [r13+0+rdx]
	lea	r8d, [rbx+rdx]
	vmovsd	xmm0, QWORD PTR [rcx+r9*8]
	add	edx, r15d
	movsx	rdx, edx
	vaddsd	xmm0, xmm0, QWORD PTR [rcx+rdx*8]
	movsx	r8, r8d
	movsx	rdi, edi
	vmovapd	xmm1, xmm0
	vfmadd213sd	xmm1, xmm12, QWORD PTR [r12+r8*8]
	lea	r8d, [r13+3+rax]
	movsx	r8, r8d
	vmovsd	xmm0, QWORD PTR [rcx+r8*8]
	lea	edx, [rax+4]
	vaddsd	xmm0, xmm0, QWORD PTR [rcx+rsi*8]
	vfmadd132sd	xmm0, xmm1, xmm11
	vmulsd	xmm0, xmm0, xmm10
	vmovsd	QWORD PTR [rcx+rdi*8], xmm0
	cmp	r10d, edx
	jle	.L43
	lea	r9d, [r11+rdx]
	movsx	r9, r9d
	lea	esi, [r13+0+rdx]
	lea	edi, [rbx+rdx]
	vmovsd	xmm0, QWORD PTR [rcx+r9*8]
	add	edx, r15d
	movsx	rdx, edx
	vaddsd	xmm0, xmm0, QWORD PTR [rcx+rdx*8]
	lea	edx, [r13+5+rax]
	movsx	rdi, edi
	vmovapd	xmm1, xmm0
	movsx	rdx, edx
	vfmadd213sd	xmm1, xmm12, QWORD PTR [r12+rdi*8]
	vmovsd	xmm0, QWORD PTR [rcx+rdx*8]
	movsx	rsi, esi
	vaddsd	xmm0, xmm0, QWORD PTR [rcx+r8*8]
	vfmadd132sd	xmm0, xmm1, xmm11
	vmulsd	xmm0, xmm0, xmm10
	vmovsd	QWORD PTR [rcx+rsi*8], xmm0
	lea	esi, [rax+6]
	cmp	esi, r10d
	jge	.L43
	add	r11d, esi
	movsx	r9, r11d
	lea	edi, [r13+0+rsi]
	add	ebx, esi
	vmovsd	xmm0, QWORD PTR [rcx+r9*8]
	add	esi, r15d
	movsx	rsi, esi
	vaddsd	xmm0, xmm0, QWORD PTR [rcx+rsi*8]
	lea	eax, [r13+7+rax]
	movsx	r8, ebx
	vmovapd	xmm1, xmm0
	cdqe
	vfmadd213sd	xmm1, xmm12, QWORD PTR [r12+r8*8]
	vmovsd	xmm0, QWORD PTR [rcx+rax*8]
	movsx	rdi, edi
	vaddsd	xmm0, xmm0, QWORD PTR [rcx+rdx*8]
	vfmadd132sd	xmm0, xmm1, xmm11
	vmulsd	xmm0, xmm0, xmm10
	vmovsd	QWORD PTR [rcx+rdi*8], xmm0
.L43:
	mov	r9d, DWORD PTR [rsp+124]
	cmp	DWORD PTR [rsp+32], r9d
	jne	.L39
	vzeroupper
.L57:
	lea	rsp, [rbp-40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L40:
	.cfi_restore_state
	mov	rsi, QWORD PTR [rsp+72]
	mov	rdi, QWORD PTR [rsp+48]
	lea	rdx, [r12+rsi*8]
	mov	rsi, QWORD PTR [rsp+80]
	mov	r8d, DWORD PTR [rsp+60]
	lea	rsi, [rcx+rsi*8]
	lea	rdi, [rcx+rdi*8]
	lea	rcx, [rcx+rbx*8]
	.p2align 4,,10
	.p2align 3
.L45:
	vmovsd	xmm0, QWORD PTR [rdi+rax*8]
	vaddsd	xmm0, xmm0, QWORD PTR [rsi+rax*8]
	vmovapd	xmm1, xmm0
	vfmadd213sd	xmm1, xmm12, QWORD PTR [rdx+rax*8]
	vmovsd	xmm0, QWORD PTR [rcx+8+rax*8]
	vaddsd	xmm0, xmm0, QWORD PTR [rcx-8+rax*8]
	vfmadd132sd	xmm0, xmm1, xmm11
	vmulsd	xmm0, xmm0, xmm10
	vmovsd	QWORD PTR [rcx+rax*8], xmm0
	add	rax, 2
	cmp	r8d, eax
	jg	.L45
	jmp	.L43
.L35:
	inc	eax
	xor	edx, edx
	jmp	.L48
	.cfi_endproc
.LFE9376:
	.size	_ZN3PDE8GSPreConEP4GridS1_._omp_fn.1, .-_ZN3PDE8GSPreConEP4GridS1_._omp_fn.1
	.section	.text._ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation,"axG",@progbits,_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation,comdat
	.p2align 4,,15
	.weak	_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation
	.type	_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation, @function
_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation:
.LFB8848:
	.cfi_startproc
	cmp	edx, 1
	je	.L60
	test	edx, edx
	je	.L61
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	cmp	edx, 2
	je	.L62
	cmp	edx, 3
	jne	.L65
	mov	rdi, QWORD PTR [rdi]
	mov	esi, 24
	call	_ZdlPvm
.L65:
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	xor	eax, eax
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L60:
	.cfi_restore 3
	.cfi_restore 6
	mov	rax, QWORD PTR [rsi]
	mov	QWORD PTR [rdi], rax
	xor	eax, eax
	ret
	.p2align 4,,10
	.p2align 3
.L62:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	mov	rbp, QWORD PTR [rsi]
	mov	edi, 24
	call	_Znwm
	vmovdqu64	xmm0, XMMWORD PTR [rbp+0]
	vmovups	XMMWORD PTR [rax], xmm0
	mov	rdx, QWORD PTR [rbp+16]
	mov	QWORD PTR [rbx], rax
	mov	QWORD PTR [rax+16], rdx
	add	rsp, 8
	.cfi_def_cfa_offset 24
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L61:
	.cfi_restore 3
	.cfi_restore 6
	mov	QWORD PTR [rdi], OFFSET FLAT:_ZTISt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE
	xor	eax, eax
	ret
	.cfi_endproc
.LFE8848:
	.size	_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation, .-_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation
	.text
	.p2align 4,,15
	.globl	_Z15defaultBoundaryiidd
	.type	_Z15defaultBoundaryiidd, @function
_Z15defaultBoundaryiidd:
.LFB8374:
	.cfi_startproc
	vxorpd	xmm2, xmm2, xmm2
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	vcvtsi2sd	xmm2, xmm2, edi
	mov	ebx, esi
	sub	rsp, 16
	.cfi_def_cfa_offset 32
	vmovsd	QWORD PTR [rsp+8], xmm1
	vmulsd	xmm2, xmm2, QWORD PTR .LC2[rip]
	vmulsd	xmm0, xmm2, xmm0
	call	sin
	vmovsd	QWORD PTR [rsp], xmm0
	vxorpd	xmm0, xmm0, xmm0
	vcvtsi2sd	xmm0, xmm0, ebx
	vmovsd	xmm1, QWORD PTR [rsp+8]
	vmulsd	xmm0, xmm0, QWORD PTR .LC2[rip]
	vmulsd	xmm0, xmm0, xmm1
	call	sinh
	vmulsd	xmm0, xmm0, QWORD PTR [rsp]
	add	rsp, 16
	.cfi_def_cfa_offset 16
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8374:
	.size	_Z15defaultBoundaryiidd, .-_Z15defaultBoundaryiidd
	.align 2
	.p2align 4,,15
	.globl	_ZN3PDEC2Eiiii
	.type	_ZN3PDEC2Eiiii, @function
_ZN3PDEC2Eiiii:
.LFB8377:
	.cfi_startproc
	add	ecx, 2
	vxorpd	xmm0, xmm0, xmm0
	vcvtsi2sd	xmm0, xmm0, ecx
	vmovsd	xmm3, QWORD PTR .LC3[rip]
	vxorpd	xmm2, xmm2, xmm2
	vcvtsi2sd	xmm2, xmm2, esi
	vsubsd	xmm0, xmm0, xmm3
	add	r8d, 2
	vxorpd	xmm1, xmm1, xmm1
	vdivsd	xmm0, xmm2, xmm0
	vcvtsi2sd	xmm1, xmm1, r8d
	mov	DWORD PTR [rdi+56], esi
	mov	DWORD PTR [rdi+60], edx
	mov	DWORD PTR [rdi+64], ecx
	vsubsd	xmm1, xmm1, xmm3
	mov	DWORD PTR [rdi+68], r8d
	mov	QWORD PTR [rdi], OFFSET FLAT:_Z8zeroFunciidd
	mov	QWORD PTR [rdi+8], 0
	mov	QWORD PTR [rdi+16], 0
	mov	QWORD PTR [rdi+24], OFFSET FLAT:_Z8zeroFunciidd
	mov	QWORD PTR [rdi+32], OFFSET FLAT:_Z8zeroFunciidd
	mov	QWORD PTR [rdi+40], OFFSET FLAT:_Z8zeroFunciidd
	mov	QWORD PTR [rdi+48], OFFSET FLAT:_Z8zeroFunciidd
	vmovsd	QWORD PTR [rdi+72], xmm0
	vxorpd	xmm0, xmm0, xmm0
	vcvtsi2sd	xmm0, xmm0, edx
	vdivsd	xmm0, xmm0, xmm1
	vmovsd	QWORD PTR [rdi+80], xmm0
	ret
	.cfi_endproc
.LFE8377:
	.size	_ZN3PDEC2Eiiii, .-_ZN3PDEC2Eiiii
	.globl	_ZN3PDEC1Eiiii
	.set	_ZN3PDEC1Eiiii,_ZN3PDEC2Eiiii
	.align 2
	.p2align 4,,15
	.globl	_ZN3PDE10numGrids_xEb
	.type	_ZN3PDE10numGrids_xEb, @function
_ZN3PDE10numGrids_xEb:
.LFB8379:
	.cfi_startproc
	xor	edx, edx
	test	sil, sil
	sete	dl
	mov	eax, DWORD PTR [rdi+64]
	add	edx, edx
	sub	eax, edx
	ret
	.cfi_endproc
.LFE8379:
	.size	_ZN3PDE10numGrids_xEb, .-_ZN3PDE10numGrids_xEb
	.align 2
	.p2align 4,,15
	.globl	_ZN3PDE10numGrids_yEb
	.type	_ZN3PDE10numGrids_yEb, @function
_ZN3PDE10numGrids_yEb:
.LFB8380:
	.cfi_startproc
	xor	edx, edx
	test	sil, sil
	sete	dl
	mov	eax, DWORD PTR [rdi+68]
	add	edx, edx
	sub	eax, edx
	ret
	.cfi_endproc
.LFE8380:
	.size	_ZN3PDE10numGrids_yEb, .-_ZN3PDE10numGrids_yEb
	.section	.text.unlikely,"ax",@progbits
	.align 2
.LCOLDB4:
	.text
.LHOTB4:
	.align 2
	.p2align 4,,15
	.globl	_ZN3PDE4initEP4Grid
	.type	_ZN3PDE4initEP4Grid, @function
_ZN3PDE4initEP4Grid:
.LFB8381:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA8381
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rsi
	sub	rsp, 56
	.cfi_def_cfa_offset 80
	vmovsd	xmm0, QWORD PTR [rdi+80]
	vmovsd	xmm1, QWORD PTR [rdi+72]
	mov	rbp, QWORD PTR [rdi]
	mov	edi, 24
	vmovsd	QWORD PTR [rsp], xmm0
	vmovsd	QWORD PTR [rsp+8], xmm1
	mov	QWORD PTR [rsp+32], 0
.LEHB0:
	call	_Znwm
.LEHE0:
	vmovsd	xmm0, QWORD PTR [rsp]
	vmovsd	xmm1, QWORD PTR [rsp+8]
	mov	QWORD PTR [rax], rbp
	vmovsd	QWORD PTR [rax+8], xmm0
	vmovsd	QWORD PTR [rax+16], xmm1
	xor	edx, edx
	lea	rsi, [rsp+16]
	mov	rdi, rbx
	mov	QWORD PTR [rsp+16], rax
	mov	QWORD PTR [rsp+40], OFFSET FLAT:_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_
	mov	QWORD PTR [rsp+32], OFFSET FLAT:_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation
.LEHB1:
	call	_ZN4Grid4fillESt8functionIFdiiEEb
.LEHE1:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L100
	lea	rsi, [rsp+16]
	mov	edx, 3
	mov	rdi, rsi
	call	rax
.L100:
	add	rsp, 56
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.L87:
	.cfi_restore_state
	mov	rbx, rax
	jmp	.L81
.L86:
	mov	rbx, rax
	jmp	.L84
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA8381:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8381-.LLSDACSB8381
.LLSDACSB8381:
	.uleb128 .LEHB0-.LFB8381
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L87-.LFB8381
	.uleb128 0
	.uleb128 .LEHB1-.LFB8381
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L86-.LFB8381
	.uleb128 0
.LLSDACSE8381:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDAC8381
	.type	_ZN3PDE4initEP4Grid.cold.127, @function
_ZN3PDE4initEP4Grid.cold.127:
.LFSB8381:
.L81:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L98
	lea	rsi, [rsp+16]
	mov	edx, 3
	mov	rdi, rsi
	vzeroupper
	call	rax
.L82:
	mov	rdi, rbx
.LEHB2:
	call	_Unwind_Resume
.LEHE2:
.L84:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L99
	lea	rsi, [rsp+16]
	mov	edx, 3
	mov	rdi, rsi
	vzeroupper
	call	rax
.L85:
	mov	rdi, rbx
.LEHB3:
	call	_Unwind_Resume
.LEHE3:
.L98:
	vzeroupper
	jmp	.L82
.L99:
	vzeroupper
	jmp	.L85
	.cfi_endproc
.LFE8381:
	.section	.gcc_except_table
.LLSDAC8381:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC8381-.LLSDACSBC8381
.LLSDACSBC8381:
	.uleb128 .LEHB2-.LCOLDB4
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LCOLDB4
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSEC8381:
	.section	.text.unlikely
	.text
	.size	_ZN3PDE4initEP4Grid, .-_ZN3PDE4initEP4Grid
	.section	.text.unlikely
	.size	_ZN3PDE4initEP4Grid.cold.127, .-_ZN3PDE4initEP4Grid.cold.127
.LCOLDE4:
	.text
.LHOTE4:
	.section	.text.unlikely
	.align 2
.LCOLDB5:
	.text
.LHOTB5:
	.align 2
	.p2align 4,,15
	.globl	_ZN3PDE13applyBoundaryEP4Grid
	.type	_ZN3PDE13applyBoundaryEP4Grid, @function
_ZN3PDE13applyBoundaryEP4Grid:
.LFB8391:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA8391
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	sub	rsp, 48
	.cfi_def_cfa_offset 80
	mov	esi, DWORD PTR [rdi+8]
	test	esi, esi
	je	.L189
.L103:
	mov	ecx, DWORD PTR [rbx+12]
	test	ecx, ecx
	je	.L190
.L108:
	mov	edx, DWORD PTR [rbx+16]
	test	edx, edx
	je	.L191
.L113:
	mov	eax, DWORD PTR [rbx+20]
	test	eax, eax
	je	.L192
.L187:
	add	rsp, 48
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L189:
	.cfi_restore_state
	vmovsd	xmm0, QWORD PTR [rdi+80]
	vmovsd	xmm1, QWORD PTR [rdi+72]
	mov	rbp, QWORD PTR [rdi+24]
	mov	edi, 24
	vmovsd	QWORD PTR [rsp], xmm0
	vmovsd	QWORD PTR [rsp+8], xmm1
	mov	QWORD PTR [rsp+32], 0
.LEHB4:
	call	_Znwm
.LEHE4:
	mov	QWORD PTR [rax], rbp
	vmovsd	xmm0, QWORD PTR [rsp]
	vmovsd	xmm1, QWORD PTR [rsp+8]
	lea	rbp, [rsp+16]
	vmovsd	QWORD PTR [rax+8], xmm0
	vmovsd	QWORD PTR [rax+16], xmm1
	xor	edx, edx
	mov	rsi, rbp
	mov	rdi, r12
	mov	QWORD PTR [rsp+16], rax
	mov	QWORD PTR [rsp+40], OFFSET FLAT:_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_
	mov	QWORD PTR [rsp+32], OFFSET FLAT:_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation
.LEHB5:
	call	_ZN4Grid12fillBoundaryESt8functionIFdiiEE9Direction
.LEHE5:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L103
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	call	rax
	mov	ecx, DWORD PTR [rbx+12]
	test	ecx, ecx
	jne	.L108
.L190:
	vmovsd	xmm2, QWORD PTR [rbx+80]
	vmovsd	xmm3, QWORD PTR [rbx+72]
	mov	edi, 24
	mov	rbp, QWORD PTR [rbx+32]
	vmovsd	QWORD PTR [rsp], xmm2
	vmovsd	QWORD PTR [rsp+8], xmm3
	mov	QWORD PTR [rsp+32], 0
.LEHB6:
	call	_Znwm
.LEHE6:
	mov	QWORD PTR [rax], rbp
	vmovsd	xmm2, QWORD PTR [rsp]
	vmovsd	xmm3, QWORD PTR [rsp+8]
	lea	rbp, [rsp+16]
	vmovsd	QWORD PTR [rax+8], xmm2
	vmovsd	QWORD PTR [rax+16], xmm3
	mov	edx, 1
	mov	rsi, rbp
	mov	rdi, r12
	mov	QWORD PTR [rsp+16], rax
	mov	QWORD PTR [rsp+40], OFFSET FLAT:_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_
	mov	QWORD PTR [rsp+32], OFFSET FLAT:_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation
.LEHB7:
	call	_ZN4Grid12fillBoundaryESt8functionIFdiiEE9Direction
.LEHE7:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L108
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	call	rax
	mov	edx, DWORD PTR [rbx+16]
	test	edx, edx
	jne	.L113
.L191:
	vmovsd	xmm4, QWORD PTR [rbx+80]
	vmovsd	xmm5, QWORD PTR [rbx+72]
	mov	edi, 24
	mov	rbp, QWORD PTR [rbx+40]
	vmovsd	QWORD PTR [rsp], xmm4
	vmovsd	QWORD PTR [rsp+8], xmm5
	mov	QWORD PTR [rsp+32], 0
.LEHB8:
	call	_Znwm
.LEHE8:
	mov	QWORD PTR [rax], rbp
	vmovsd	xmm4, QWORD PTR [rsp]
	vmovsd	xmm5, QWORD PTR [rsp+8]
	lea	rbp, [rsp+16]
	vmovsd	QWORD PTR [rax+8], xmm4
	vmovsd	QWORD PTR [rax+16], xmm5
	mov	edx, 2
	mov	rsi, rbp
	mov	rdi, r12
	mov	QWORD PTR [rsp+16], rax
	mov	QWORD PTR [rsp+40], OFFSET FLAT:_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_
	mov	QWORD PTR [rsp+32], OFFSET FLAT:_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation
.LEHB9:
	call	_ZN4Grid12fillBoundaryESt8functionIFdiiEE9Direction
.LEHE9:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L113
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	call	rax
	mov	eax, DWORD PTR [rbx+20]
	test	eax, eax
	jne	.L187
.L192:
	vmovsd	xmm6, QWORD PTR [rbx+80]
	vmovsd	xmm7, QWORD PTR [rbx+72]
	mov	edi, 24
	mov	rbp, QWORD PTR [rbx+48]
	vmovsd	QWORD PTR [rsp], xmm6
	vmovsd	QWORD PTR [rsp+8], xmm7
	mov	QWORD PTR [rsp+32], 0
.LEHB10:
	call	_Znwm
.LEHE10:
	mov	QWORD PTR [rax], rbp
	vmovsd	xmm6, QWORD PTR [rsp]
	vmovsd	xmm7, QWORD PTR [rsp+8]
	lea	rbp, [rsp+16]
	vmovsd	QWORD PTR [rax+8], xmm6
	vmovsd	QWORD PTR [rax+16], xmm7
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, r12
	mov	QWORD PTR [rsp+16], rax
	mov	QWORD PTR [rsp+40], OFFSET FLAT:_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_
	mov	QWORD PTR [rsp+32], OFFSET FLAT:_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation
.LEHB11:
	call	_ZN4Grid12fillBoundaryESt8functionIFdiiEE9Direction
.LEHE11:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L187
	mov	rsi, rbp
	mov	rdi, rbp
	mov	edx, 3
	call	rax
	add	rsp, 48
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
.L135:
	.cfi_restore_state
	mov	rbx, rax
	jmp	.L105
.L131:
	mov	rbx, rax
	jmp	.L123
.L137:
	mov	rbx, rax
	jmp	.L115
.L133:
	mov	rbx, rax
	jmp	.L127
.L138:
	mov	rbx, rax
	jmp	.L120
.L134:
	mov	rbx, rax
	jmp	.L129
.L136:
	mov	rbx, rax
	jmp	.L110
.L132:
	mov	rbx, rax
	jmp	.L125
	.section	.gcc_except_table
.LLSDA8391:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8391-.LLSDACSB8391
.LLSDACSB8391:
	.uleb128 .LEHB4-.LFB8391
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L135-.LFB8391
	.uleb128 0
	.uleb128 .LEHB5-.LFB8391
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L131-.LFB8391
	.uleb128 0
	.uleb128 .LEHB6-.LFB8391
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L136-.LFB8391
	.uleb128 0
	.uleb128 .LEHB7-.LFB8391
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L132-.LFB8391
	.uleb128 0
	.uleb128 .LEHB8-.LFB8391
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L137-.LFB8391
	.uleb128 0
	.uleb128 .LEHB9-.LFB8391
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L133-.LFB8391
	.uleb128 0
	.uleb128 .LEHB10-.LFB8391
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L138-.LFB8391
	.uleb128 0
	.uleb128 .LEHB11-.LFB8391
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L134-.LFB8391
	.uleb128 0
.LLSDACSE8391:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDAC8391
	.type	_ZN3PDE13applyBoundaryEP4Grid.cold.128, @function
_ZN3PDE13applyBoundaryEP4Grid.cold.128:
.LFSB8391:
.L105:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L179
	lea	rsi, [rsp+16]
	mov	edx, 3
	mov	rdi, rsi
	vzeroupper
	call	rax
.L106:
	mov	rdi, rbx
.LEHB12:
	call	_Unwind_Resume
.LEHE12:
.L123:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L183
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	vzeroupper
	call	rax
.L124:
	mov	rdi, rbx
.LEHB13:
	call	_Unwind_Resume
.LEHE13:
.L179:
	vzeroupper
	jmp	.L106
.L115:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L181
	lea	rsi, [rsp+16]
	mov	edx, 3
	mov	rdi, rsi
	vzeroupper
	call	rax
.L116:
	mov	rdi, rbx
.LEHB14:
	call	_Unwind_Resume
.LEHE14:
.L127:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L185
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	vzeroupper
	call	rax
.L128:
	mov	rdi, rbx
.LEHB15:
	call	_Unwind_Resume
.LEHE15:
.L181:
	vzeroupper
	jmp	.L116
.L120:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L182
	lea	rsi, [rsp+16]
	mov	edx, 3
	mov	rdi, rsi
	vzeroupper
	call	rax
.L121:
	mov	rdi, rbx
.LEHB16:
	call	_Unwind_Resume
.LEHE16:
.L129:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L186
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	vzeroupper
	call	rax
.L130:
	mov	rdi, rbx
.LEHB17:
	call	_Unwind_Resume
.LEHE17:
.L182:
	vzeroupper
	jmp	.L121
.L110:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L180
	lea	rsi, [rsp+16]
	mov	edx, 3
	mov	rdi, rsi
	vzeroupper
	call	rax
.L111:
	mov	rdi, rbx
.LEHB18:
	call	_Unwind_Resume
.LEHE18:
.L125:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L184
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	vzeroupper
	call	rax
.L126:
	mov	rdi, rbx
.LEHB19:
	call	_Unwind_Resume
.LEHE19:
.L180:
	vzeroupper
	jmp	.L111
.L183:
	vzeroupper
	jmp	.L124
.L186:
	vzeroupper
	jmp	.L130
.L185:
	vzeroupper
	jmp	.L128
.L184:
	vzeroupper
	jmp	.L126
	.cfi_endproc
.LFE8391:
	.section	.gcc_except_table
.LLSDAC8391:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC8391-.LLSDACSBC8391
.LLSDACSBC8391:
	.uleb128 .LEHB12-.LCOLDB5
	.uleb128 .LEHE12-.LEHB12
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB13-.LCOLDB5
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB14-.LCOLDB5
	.uleb128 .LEHE14-.LEHB14
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB15-.LCOLDB5
	.uleb128 .LEHE15-.LEHB15
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB16-.LCOLDB5
	.uleb128 .LEHE16-.LEHB16
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB17-.LCOLDB5
	.uleb128 .LEHE17-.LEHB17
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB18-.LCOLDB5
	.uleb128 .LEHE18-.LEHB18
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB19-.LCOLDB5
	.uleb128 .LEHE19-.LEHB19
	.uleb128 0
	.uleb128 0
.LLSDACSEC8391:
	.section	.text.unlikely
	.text
	.size	_ZN3PDE13applyBoundaryEP4Grid, .-_ZN3PDE13applyBoundaryEP4Grid
	.section	.text.unlikely
	.size	_ZN3PDE13applyBoundaryEP4Grid.cold.128, .-_ZN3PDE13applyBoundaryEP4Grid.cold.128
.LCOLDE5:
	.text
.LHOTE5:
	.section	.text.unlikely
	.align 2
.LCOLDB6:
	.text
.LHOTB6:
	.align 2
	.p2align 4,,15
	.globl	_ZN3PDE15refreshBoundaryEP4Grid
	.type	_ZN3PDE15refreshBoundaryEP4Grid, @function
_ZN3PDE15refreshBoundaryEP4Grid:
.LFB8392:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA8392
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	sub	rsp, 48
	.cfi_def_cfa_offset 80
	cmp	DWORD PTR [rdi+8], 1
	je	.L280
.L194:
	cmp	DWORD PTR [rbx+12], 1
	je	.L281
.L199:
	cmp	DWORD PTR [rbx+16], 1
	je	.L282
.L204:
	cmp	DWORD PTR [rbx+20], 1
	je	.L283
.L278:
	add	rsp, 48
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L280:
	.cfi_restore_state
	vmovsd	xmm0, QWORD PTR [rdi+80]
	vmovsd	xmm1, QWORD PTR [rdi+72]
	mov	rbp, QWORD PTR [rdi+24]
	mov	edi, 24
	vmovsd	QWORD PTR [rsp], xmm0
	vmovsd	QWORD PTR [rsp+8], xmm1
	mov	QWORD PTR [rsp+32], 0
.LEHB20:
	call	_Znwm
.LEHE20:
	mov	QWORD PTR [rax], rbp
	vmovsd	xmm0, QWORD PTR [rsp]
	vmovsd	xmm1, QWORD PTR [rsp+8]
	lea	rbp, [rsp+16]
	vmovsd	QWORD PTR [rax+8], xmm0
	vmovsd	QWORD PTR [rax+16], xmm1
	xor	edx, edx
	mov	rsi, rbp
	mov	rdi, r12
	mov	QWORD PTR [rsp+16], rax
	mov	QWORD PTR [rsp+40], OFFSET FLAT:_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_
	mov	QWORD PTR [rsp+32], OFFSET FLAT:_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation
.LEHB21:
	call	_ZN4Grid10copyToHaloESt8functionIFdiiEE9Direction
.LEHE21:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L194
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	call	rax
	cmp	DWORD PTR [rbx+12], 1
	jne	.L199
	.p2align 4,,10
	.p2align 3
.L281:
	vmovsd	xmm2, QWORD PTR [rbx+80]
	vmovsd	xmm3, QWORD PTR [rbx+72]
	mov	edi, 24
	mov	rbp, QWORD PTR [rbx+32]
	vmovsd	QWORD PTR [rsp], xmm2
	vmovsd	QWORD PTR [rsp+8], xmm3
	mov	QWORD PTR [rsp+32], 0
.LEHB22:
	call	_Znwm
.LEHE22:
	mov	QWORD PTR [rax], rbp
	vmovsd	xmm2, QWORD PTR [rsp]
	vmovsd	xmm3, QWORD PTR [rsp+8]
	lea	rbp, [rsp+16]
	vmovsd	QWORD PTR [rax+8], xmm2
	vmovsd	QWORD PTR [rax+16], xmm3
	mov	edx, 1
	mov	rsi, rbp
	mov	rdi, r12
	mov	QWORD PTR [rsp+16], rax
	mov	QWORD PTR [rsp+40], OFFSET FLAT:_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_
	mov	QWORD PTR [rsp+32], OFFSET FLAT:_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation
.LEHB23:
	call	_ZN4Grid10copyToHaloESt8functionIFdiiEE9Direction
.LEHE23:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L199
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	call	rax
	cmp	DWORD PTR [rbx+16], 1
	jne	.L204
	.p2align 4,,10
	.p2align 3
.L282:
	vmovsd	xmm4, QWORD PTR [rbx+80]
	vmovsd	xmm5, QWORD PTR [rbx+72]
	mov	edi, 24
	mov	rbp, QWORD PTR [rbx+40]
	vmovsd	QWORD PTR [rsp], xmm4
	vmovsd	QWORD PTR [rsp+8], xmm5
	mov	QWORD PTR [rsp+32], 0
.LEHB24:
	call	_Znwm
.LEHE24:
	mov	QWORD PTR [rax], rbp
	vmovsd	xmm4, QWORD PTR [rsp]
	vmovsd	xmm5, QWORD PTR [rsp+8]
	lea	rbp, [rsp+16]
	vmovsd	QWORD PTR [rax+8], xmm4
	vmovsd	QWORD PTR [rax+16], xmm5
	mov	edx, 2
	mov	rsi, rbp
	mov	rdi, r12
	mov	QWORD PTR [rsp+16], rax
	mov	QWORD PTR [rsp+40], OFFSET FLAT:_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_
	mov	QWORD PTR [rsp+32], OFFSET FLAT:_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation
.LEHB25:
	call	_ZN4Grid10copyToHaloESt8functionIFdiiEE9Direction
.LEHE25:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L204
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	call	rax
	cmp	DWORD PTR [rbx+20], 1
	jne	.L278
	.p2align 4,,10
	.p2align 3
.L283:
	vmovsd	xmm6, QWORD PTR [rbx+80]
	vmovsd	xmm7, QWORD PTR [rbx+72]
	mov	edi, 24
	mov	rbp, QWORD PTR [rbx+48]
	vmovsd	QWORD PTR [rsp], xmm6
	vmovsd	QWORD PTR [rsp+8], xmm7
	mov	QWORD PTR [rsp+32], 0
.LEHB26:
	call	_Znwm
.LEHE26:
	mov	QWORD PTR [rax], rbp
	vmovsd	xmm6, QWORD PTR [rsp]
	vmovsd	xmm7, QWORD PTR [rsp+8]
	lea	rbp, [rsp+16]
	vmovsd	QWORD PTR [rax+8], xmm6
	vmovsd	QWORD PTR [rax+16], xmm7
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, r12
	mov	QWORD PTR [rsp+16], rax
	mov	QWORD PTR [rsp+40], OFFSET FLAT:_ZNSt17_Function_handlerIFdiiESt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE9_M_invokeERKSt9_Any_dataOiSD_
	mov	QWORD PTR [rsp+32], OFFSET FLAT:_ZNSt14_Function_base13_Base_managerISt5_BindIFPFdiiddESt12_PlaceholderILi1EES4_ILi2EEddEEE10_M_managerERSt9_Any_dataRKSA_St18_Manager_operation
.LEHB27:
	call	_ZN4Grid10copyToHaloESt8functionIFdiiEE9Direction
.LEHE27:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L278
	mov	rsi, rbp
	mov	rdi, rbp
	mov	edx, 3
	call	rax
	add	rsp, 48
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
.L225:
	.cfi_restore_state
	mov	rbx, rax
	jmp	.L220
.L228:
	mov	rbx, rax
	jmp	.L206
.L223:
	mov	rbx, rax
	jmp	.L216
.L226:
	mov	rbx, rax
	jmp	.L196
.L224:
	mov	rbx, rax
	jmp	.L218
.L227:
	mov	rbx, rax
	jmp	.L201
.L222:
	mov	rbx, rax
	jmp	.L214
.L229:
	mov	rbx, rax
	jmp	.L211
	.section	.gcc_except_table
.LLSDA8392:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8392-.LLSDACSB8392
.LLSDACSB8392:
	.uleb128 .LEHB20-.LFB8392
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L226-.LFB8392
	.uleb128 0
	.uleb128 .LEHB21-.LFB8392
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L222-.LFB8392
	.uleb128 0
	.uleb128 .LEHB22-.LFB8392
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L227-.LFB8392
	.uleb128 0
	.uleb128 .LEHB23-.LFB8392
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L223-.LFB8392
	.uleb128 0
	.uleb128 .LEHB24-.LFB8392
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L228-.LFB8392
	.uleb128 0
	.uleb128 .LEHB25-.LFB8392
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L224-.LFB8392
	.uleb128 0
	.uleb128 .LEHB26-.LFB8392
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L229-.LFB8392
	.uleb128 0
	.uleb128 .LEHB27-.LFB8392
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L225-.LFB8392
	.uleb128 0
.LLSDACSE8392:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDAC8392
	.type	_ZN3PDE15refreshBoundaryEP4Grid.cold.129, @function
_ZN3PDE15refreshBoundaryEP4Grid.cold.129:
.LFSB8392:
.L220:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L277
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	vzeroupper
	call	rax
.L221:
	mov	rdi, rbx
.LEHB28:
	call	_Unwind_Resume
.LEHE28:
.L206:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L272
	lea	rsi, [rsp+16]
	mov	edx, 3
	mov	rdi, rsi
	vzeroupper
	call	rax
.L207:
	mov	rdi, rbx
.LEHB29:
	call	_Unwind_Resume
.LEHE29:
.L277:
	vzeroupper
	jmp	.L221
.L216:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L275
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	vzeroupper
	call	rax
.L217:
	mov	rdi, rbx
.LEHB30:
	call	_Unwind_Resume
.LEHE30:
.L196:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L270
	lea	rsi, [rsp+16]
	mov	edx, 3
	mov	rdi, rsi
	vzeroupper
	call	rax
.L197:
	mov	rdi, rbx
.LEHB31:
	call	_Unwind_Resume
.LEHE31:
.L275:
	vzeroupper
	jmp	.L217
.L218:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L276
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	vzeroupper
	call	rax
.L219:
	mov	rdi, rbx
.LEHB32:
	call	_Unwind_Resume
.LEHE32:
.L201:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L271
	lea	rsi, [rsp+16]
	mov	edx, 3
	mov	rdi, rsi
	vzeroupper
	call	rax
.L202:
	mov	rdi, rbx
.LEHB33:
	call	_Unwind_Resume
.LEHE33:
.L276:
	vzeroupper
	jmp	.L219
.L214:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L274
	mov	edx, 3
	mov	rsi, rbp
	mov	rdi, rbp
	vzeroupper
	call	rax
.L215:
	mov	rdi, rbx
.LEHB34:
	call	_Unwind_Resume
.LEHE34:
.L211:
	mov	rax, QWORD PTR [rsp+32]
	test	rax, rax
	je	.L273
	lea	rsi, [rsp+16]
	mov	edx, 3
	mov	rdi, rsi
	vzeroupper
	call	rax
.L212:
	mov	rdi, rbx
.LEHB35:
	call	_Unwind_Resume
.LEHE35:
.L274:
	vzeroupper
	jmp	.L215
.L272:
	vzeroupper
	jmp	.L207
.L271:
	vzeroupper
	jmp	.L202
.L270:
	vzeroupper
	jmp	.L197
.L273:
	vzeroupper
	jmp	.L212
	.cfi_endproc
.LFE8392:
	.section	.gcc_except_table
.LLSDAC8392:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC8392-.LLSDACSBC8392
.LLSDACSBC8392:
	.uleb128 .LEHB28-.LCOLDB6
	.uleb128 .LEHE28-.LEHB28
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB29-.LCOLDB6
	.uleb128 .LEHE29-.LEHB29
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB30-.LCOLDB6
	.uleb128 .LEHE30-.LEHB30
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB31-.LCOLDB6
	.uleb128 .LEHE31-.LEHB31
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB32-.LCOLDB6
	.uleb128 .LEHE32-.LEHB32
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB33-.LCOLDB6
	.uleb128 .LEHE33-.LEHB33
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB34-.LCOLDB6
	.uleb128 .LEHE34-.LEHB34
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB35-.LCOLDB6
	.uleb128 .LEHE35-.LEHB35
	.uleb128 0
	.uleb128 0
.LLSDACSEC8392:
	.section	.text.unlikely
	.text
	.size	_ZN3PDE15refreshBoundaryEP4Grid, .-_ZN3PDE15refreshBoundaryEP4Grid
	.section	.text.unlikely
	.size	_ZN3PDE15refreshBoundaryEP4Grid.cold.129, .-_ZN3PDE15refreshBoundaryEP4Grid.cold.129
.LCOLDE6:
	.text
.LHOTE6:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC7:
	.string	"Solver not existing"
	.text
	.align 2
	.p2align 4,,15
	.globl	_ZN3PDE5solveEP4GridS1_6Solverid
	.type	_ZN3PDE5solveEP4GridS1_6Solverid, @function
_ZN3PDE5solveEP4GridS1_6Solverid:
.LFB8395:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	ebp, r8d
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	ebx, ecx
	mov	rcx, rdx
	sub	rsp, 56
	.cfi_def_cfa_offset 80
	mov	rdx, rsi
	mov	rsi, rdi
	lea	rdi, [rsp+16]
	vmovsd	QWORD PTR [rsp+8], xmm0
	call	_ZN11SolverClassC1EP3PDEP4GridS3_
	test	ebx, ebx
	vmovsd	xmm0, QWORD PTR [rsp+8]
	je	.L290
	cmp	ebx, 1
	jne	.L287
	mov	esi, ebp
	lea	rdi, [rsp+16]
	call	_ZN11SolverClass3PCGEid
.L288:
	add	rsp, 56
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L290:
	.cfi_restore_state
	mov	esi, ebp
	lea	rdi, [rsp+16]
	call	_ZN11SolverClass2CGEid
	add	rsp, 56
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L287:
	.cfi_restore_state
	mov	edi, OFFSET FLAT:.LC7
	call	puts
	mov	eax, -1
	jmp	.L288
	.cfi_endproc
.LFE8395:
	.size	_ZN3PDE5solveEP4GridS1_6Solverid, .-_ZN3PDE5solveEP4GridS1_6Solverid
	.section	.text._ZNSt6vectorIdSaIdEE17_M_realloc_insertIJdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_,"axG",@progbits,_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	.type	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_, @function
_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_:
.LFB8973:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	mov	r15, rdx
	mov	rdx, rsi
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	mov	rbx, rdi
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	mov	rcx, QWORD PTR [rdi+8]
	mov	rbp, QWORD PTR [rdi]
	mov	rax, rcx
	sub	rax, rbp
	sub	rdx, rbp
	sar	rax, 3
	je	.L300
	lea	rdi, [rax+rax]
	mov	r14, -8
	cmp	rax, rdi
	jbe	.L306
.L293:
	mov	rdi, r14
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	call	_Znwm
	mov	rdx, QWORD PTR [rsp+16]
	mov	rcx, QWORD PTR [rsp+8]
	mov	r13, rax
	add	r14, rax
.L294:
	vmovsd	xmm0, QWORD PTR [r15]
	mov	r8, rcx
	lea	r9, [r13+8+rdx]
	sub	r8, r12
	vmovsd	QWORD PTR [r13+0+rdx], xmm0
	lea	r15, [r9+r8]
	cmp	r12, rbp
	je	.L295
	mov	rsi, rbp
	mov	rdi, r13
	mov	QWORD PTR [rsp+24], r9
	mov	QWORD PTR [rsp+16], r8
	mov	QWORD PTR [rsp+8], rcx
	call	memmove
	mov	rcx, QWORD PTR [rsp+8]
	mov	r8, QWORD PTR [rsp+16]
	cmp	r12, rcx
	mov	r9, QWORD PTR [rsp+24]
	je	.L299
.L296:
	mov	rdx, r8
	mov	rsi, r12
	mov	rdi, r9
	call	memcpy
.L298:
	test	rbp, rbp
	jne	.L299
.L297:
	mov	QWORD PTR [rbx], r13
	mov	QWORD PTR [rbx+8], r15
	mov	QWORD PTR [rbx+16], r14
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L299:
	.cfi_restore_state
	mov	rdi, rbp
	call	_ZdlPv
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L306:
	movabs	rax, 2305843009213693951
	cmp	rdi, rax
	ja	.L293
	xor	r14d, r14d
	xor	r13d, r13d
	test	rdi, rdi
	je	.L294
	jmp	.L292
	.p2align 4,,10
	.p2align 3
.L295:
	cmp	r12, rcx
	jne	.L296
	jmp	.L298
	.p2align 4,,10
	.p2align 3
.L300:
	mov	edi, 1
.L292:
	lea	r14, [0+rdi*8]
	jmp	.L293
	.cfi_endproc
.LFE8973:
	.size	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_, .-_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	.section	.text._ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_,"axG",@progbits,_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	.type	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_, @function
_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_:
.LFB8976:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	mov	r15, rdx
	mov	rdx, rsi
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	mov	rbx, rdi
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	mov	rcx, QWORD PTR [rdi+8]
	mov	rbp, QWORD PTR [rdi]
	mov	rax, rcx
	sub	rax, rbp
	sub	rdx, rbp
	sar	rax, 2
	je	.L316
	lea	rdi, [rax+rax]
	mov	r14, -4
	cmp	rax, rdi
	jbe	.L322
.L309:
	mov	rdi, r14
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	call	_Znwm
	mov	rdx, QWORD PTR [rsp+16]
	mov	rcx, QWORD PTR [rsp+8]
	mov	r13, rax
	add	r14, rax
.L310:
	mov	eax, DWORD PTR [r15]
	mov	r8, rcx
	lea	r9, [r13+4+rdx]
	sub	r8, r12
	mov	DWORD PTR [r13+0+rdx], eax
	lea	r15, [r9+r8]
	cmp	r12, rbp
	je	.L311
	mov	rsi, rbp
	mov	rdi, r13
	mov	QWORD PTR [rsp+24], r9
	mov	QWORD PTR [rsp+16], r8
	mov	QWORD PTR [rsp+8], rcx
	call	memmove
	mov	rcx, QWORD PTR [rsp+8]
	mov	r8, QWORD PTR [rsp+16]
	cmp	r12, rcx
	mov	r9, QWORD PTR [rsp+24]
	je	.L315
.L312:
	mov	rdx, r8
	mov	rsi, r12
	mov	rdi, r9
	call	memcpy
.L314:
	test	rbp, rbp
	jne	.L315
.L313:
	mov	QWORD PTR [rbx], r13
	mov	QWORD PTR [rbx+8], r15
	mov	QWORD PTR [rbx+16], r14
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L315:
	.cfi_restore_state
	mov	rdi, rbp
	call	_ZdlPv
	jmp	.L313
	.p2align 4,,10
	.p2align 3
.L322:
	movabs	rax, 4611686018427387903
	cmp	rdi, rax
	ja	.L309
	xor	r14d, r14d
	xor	r13d, r13d
	test	rdi, rdi
	je	.L310
	jmp	.L308
	.p2align 4,,10
	.p2align 3
.L311:
	cmp	r12, rcx
	jne	.L312
	jmp	.L314
	.p2align 4,,10
	.p2align 3
.L316:
	mov	edi, 1
.L308:
	lea	r14, [0+rdi*4]
	jmp	.L309
	.cfi_endproc
.LFE8976:
	.size	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_, .-_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	.section	.text._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_M_realloc_insertIJS5_EEEvN9__gnu_cxx17__normal_iteratorIPS5_S7_EEDpOT_,"axG",@progbits,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_M_realloc_insertIJS5_EEEvN9__gnu_cxx17__normal_iteratorIPS5_S7_EEDpOT_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_M_realloc_insertIJS5_EEEvN9__gnu_cxx17__normal_iteratorIPS5_S7_EEDpOT_
	.type	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_M_realloc_insertIJS5_EEEvN9__gnu_cxx17__normal_iteratorIPS5_S7_EEDpOT_, @function
_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_M_realloc_insertIJS5_EEEvN9__gnu_cxx17__normal_iteratorIPS5_S7_EEDpOT_:
.LFB8979:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	mov	rcx, rsi
	mov	r15, rsi
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	mov	r12, rdi
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	mov	r13, QWORD PTR [rdi+8]
	mov	rbx, QWORD PTR [rdi]
	mov	rax, r13
	sub	rax, rbx
	sub	rcx, rbx
	sar	rax, 5
	je	.L346
	lea	rsi, [rax+rax]
	mov	r14, -32
	cmp	rax, rsi
	jbe	.L353
.L325:
	mov	rdi, r14
	mov	QWORD PTR [rsp+24], rdx
	mov	QWORD PTR [rsp+16], rcx
	call	_Znwm
	mov	rbp, rax
	lea	rax, [rax+r14]
	mov	QWORD PTR [rsp+8], rax
	mov	rcx, QWORD PTR [rsp+16]
	mov	rdx, QWORD PTR [rsp+24]
	lea	r14, [rbp+32]
.L326:
	lea	rax, [rbp+0+rcx]
	lea	rcx, [rax+16]
	mov	rsi, QWORD PTR [rdx]
	mov	QWORD PTR [rax], rcx
	lea	rcx, [rdx+16]
	cmp	rsi, rcx
	je	.L354
	mov	QWORD PTR [rax], rsi
	mov	rsi, QWORD PTR [rdx+16]
	mov	QWORD PTR [rax+16], rsi
.L328:
	mov	rsi, QWORD PTR [rdx+8]
	mov	QWORD PTR [rdx], rcx
	mov	QWORD PTR [rax+8], rsi
	mov	QWORD PTR [rdx+8], 0
	mov	BYTE PTR [rdx+16], 0
	cmp	r15, rbx
	je	.L329
	lea	r14, [r15-32]
	sub	r14, rbx
	shr	r14, 5
	lea	rsi, [r14+1]
	sal	rsi, 5
	lea	rax, [rbx+16]
	add	rsi, rbp
	mov	rdx, rbp
	.p2align 4,,10
	.p2align 3
.L333:
	lea	rcx, [rdx+16]
	mov	QWORD PTR [rdx], rcx
	mov	rcx, QWORD PTR [rax-16]
	cmp	rax, rcx
	je	.L355
	mov	QWORD PTR [rdx], rcx
	add	rdx, 32
	mov	rcx, QWORD PTR [rax]
	mov	QWORD PTR [rdx-16], rcx
	mov	rcx, QWORD PTR [rax-8]
	mov	QWORD PTR [rdx-24], rcx
	mov	QWORD PTR [rax-16], rax
	mov	QWORD PTR [rax-8], 0
	mov	BYTE PTR [rax], 0
	add	rax, 32
	cmp	rsi, rdx
	jne	.L333
.L332:
	add	r14, 2
	sal	r14, 5
	add	r14, rbp
.L329:
	cmp	r15, r13
	je	.L339
	mov	rdx, r13
	sub	rdx, r15
	lea	rdi, [rdx-32]
	shr	rdi, 5
	inc	rdi
	mov	rsi, rdi
	sal	rsi, 5
	lea	rax, [r15+16]
	add	rsi, r14
	mov	rdx, r14
	.p2align 4,,10
	.p2align 3
.L338:
	lea	rcx, [rdx+16]
	mov	QWORD PTR [rdx], rcx
	mov	rcx, QWORD PTR [rax-16]
	cmp	rax, rcx
	je	.L356
	mov	QWORD PTR [rdx], rcx
	mov	rcx, QWORD PTR [rax]
	add	rdx, 32
	mov	QWORD PTR [rdx-16], rcx
	mov	rcx, QWORD PTR [rax-8]
	mov	QWORD PTR [rax-16], rax
	mov	QWORD PTR [rdx-24], rcx
	mov	QWORD PTR [rax-8], 0
	mov	BYTE PTR [rax], 0
	add	rax, 32
	cmp	rdx, rsi
	jne	.L338
.L342:
	sal	rdi, 5
	add	r14, rdi
.L339:
	mov	r15, rbx
	cmp	rbx, r13
	je	.L344
	.p2align 4,,10
	.p2align 3
.L335:
	mov	rdi, QWORD PTR [r15]
	lea	rax, [r15+16]
	cmp	rdi, rax
	je	.L343
	add	r15, 32
	call	_ZdlPv
	cmp	r13, r15
	jne	.L335
.L344:
	test	rbx, rbx
	je	.L337
	mov	rdi, rbx
	call	_ZdlPv
.L337:
	mov	rax, QWORD PTR [rsp+8]
	mov	QWORD PTR [r12], rbp
	mov	QWORD PTR [r12+8], r14
	mov	QWORD PTR [r12+16], rax
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L343:
	.cfi_restore_state
	add	r15, 32
	cmp	r15, r13
	jne	.L335
	jmp	.L344
	.p2align 4,,10
	.p2align 3
.L355:
	vmovdqu64	xmm0, XMMWORD PTR [rax]
	add	rdx, 32
	vmovups	XMMWORD PTR [rdx-16], xmm0
	mov	rcx, QWORD PTR [rax-8]
	mov	QWORD PTR [rdx-24], rcx
	mov	QWORD PTR [rax-16], rax
	mov	QWORD PTR [rax-8], 0
	mov	BYTE PTR [rax], 0
	add	rax, 32
	cmp	rdx, rsi
	jne	.L333
	jmp	.L332
	.p2align 4,,10
	.p2align 3
.L356:
	vmovdqu64	xmm1, XMMWORD PTR [rax]
	add	rdx, 32
	vmovups	XMMWORD PTR [rdx-16], xmm1
	mov	rcx, QWORD PTR [rax-8]
	add	rax, 32
	mov	QWORD PTR [rdx-24], rcx
	mov	QWORD PTR [rax-40], 0
	mov	BYTE PTR [rax-32], 0
	cmp	rsi, rdx
	jne	.L338
	jmp	.L342
	.p2align 4,,10
	.p2align 3
.L353:
	movabs	rax, 576460752303423487
	cmp	rsi, rax
	ja	.L325
	test	rsi, rsi
	jne	.L324
	mov	r14d, 32
	mov	QWORD PTR [rsp+8], 0
	xor	ebp, ebp
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L346:
	mov	esi, 1
.L324:
	sal	rsi, 5
	mov	r14, rsi
	jmp	.L325
	.p2align 4,,10
	.p2align 3
.L354:
	vmovdqu64	xmm2, XMMWORD PTR [rdx+16]
	vmovups	XMMWORD PTR [rax+16], xmm2
	jmp	.L328
	.cfi_endproc
.LFE8979:
	.size	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_M_realloc_insertIJS5_EEEvN9__gnu_cxx17__normal_iteratorIPS5_S7_EEDpOT_, .-_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_M_realloc_insertIJS5_EEEvN9__gnu_cxx17__normal_iteratorIPS5_S7_EEDpOT_
	.section	.text._ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE24_M_get_insert_unique_posERS7_,"axG",@progbits,_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE24_M_get_insert_unique_posERS7_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE24_M_get_insert_unique_posERS7_
	.type	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE24_M_get_insert_unique_posERS7_, @function
_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE24_M_get_insert_unique_posERS7_:
.LFB9146:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	mov	rbx, QWORD PTR [rdi+16]
	mov	QWORD PTR [rsp+8], rdi
	mov	QWORD PTR [rsp], rsi
	test	rbx, rbx
	je	.L384
	mov	r15, QWORD PTR [rsi+8]
	mov	rbp, QWORD PTR [rsi]
	jmp	.L360
	.p2align 4,,10
	.p2align 3
.L365:
	mov	rax, QWORD PTR [rbx+16]
	mov	esi, 1
	test	rax, rax
	je	.L361
.L385:
	mov	rbx, rax
.L360:
	mov	r14, QWORD PTR [rbx+40]
	mov	r13, QWORD PTR [rbx+32]
	cmp	r15, r14
	mov	r12, r14
	cmovbe	r12, r15
	test	r12, r12
	je	.L362
	mov	rdx, r12
	mov	rsi, r13
	mov	rdi, rbp
	call	memcmp
	test	eax, eax
	jne	.L363
.L362:
	mov	rax, r15
	sub	rax, r14
	cmp	rax, 2147483647
	jg	.L364
	cmp	rax, -2147483648
	jl	.L365
.L363:
	test	eax, eax
	js	.L365
.L364:
	mov	rax, QWORD PTR [rbx+24]
	xor	esi, esi
	test	rax, rax
	jne	.L385
.L361:
	mov	r9, rbx
	test	sil, sil
	jne	.L359
.L367:
	test	r12, r12
	je	.L370
	mov	rdx, r12
	mov	rsi, rbp
	mov	rdi, r13
	mov	QWORD PTR [rsp], r9
	call	memcmp
	test	eax, eax
	mov	r9, QWORD PTR [rsp]
	jne	.L371
.L370:
	sub	r14, r15
	cmp	r14, 2147483647
	jg	.L372
	cmp	r14, -2147483648
	jl	.L373
	mov	eax, r14d
.L371:
	test	eax, eax
	js	.L373
.L372:
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	mov	rax, rbx
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	xor	edx, edx
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L373:
	.cfi_restore_state
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	xor	eax, eax
	mov	rdx, r9
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L384:
	.cfi_restore_state
	lea	rbx, [rdi+8]
.L359:
	mov	rax, QWORD PTR [rsp+8]
	cmp	rbx, QWORD PTR [rax+24]
	je	.L386
	mov	rdi, rbx
	call	_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base
	mov	rcx, QWORD PTR [rsp]
	mov	r14, QWORD PTR [rax+40]
	mov	r15, QWORD PTR [rcx+8]
	mov	r12, r14
	cmp	r15, r14
	mov	r9, rbx
	mov	rbp, QWORD PTR [rcx]
	mov	r13, QWORD PTR [rax+32]
	cmovbe	r12, r15
	mov	rbx, rax
	jmp	.L367
	.p2align 4,,10
	.p2align 3
.L386:
	add	rsp, 24
	.cfi_def_cfa_offset 56
	mov	rdx, rbx
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	xor	eax, eax
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9146:
	.size	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE24_M_get_insert_unique_posERS7_, .-_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE24_M_get_insert_unique_posERS7_
	.section	.text._ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE29_M_get_insert_hint_unique_posESt23_Rb_tree_const_iteratorIS8_ERS7_,"axG",@progbits,_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE29_M_get_insert_hint_unique_posESt23_Rb_tree_const_iteratorIS8_ERS7_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE29_M_get_insert_hint_unique_posESt23_Rb_tree_const_iteratorIS8_ERS7_
	.type	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE29_M_get_insert_hint_unique_posESt23_Rb_tree_const_iteratorIS8_ERS7_, @function
_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE29_M_get_insert_hint_unique_posESt23_Rb_tree_const_iteratorIS8_ERS7_:
.LFB8992:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	lea	rax, [rdi+8]
	mov	r15, rdx
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	mov	r13, rdi
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	cmp	rsi, rax
	je	.L431
	mov	r12, QWORD PTR [rdx+8]
	mov	rbp, QWORD PTR [rsi+40]
	mov	rbx, rsi
	cmp	r12, rbp
	mov	rcx, rbp
	cmovbe	rcx, r12
	mov	r8, QWORD PTR [rsi+32]
	mov	r14, QWORD PTR [rdx]
	test	rcx, rcx
	je	.L394
	mov	rdx, rcx
	mov	rsi, r8
	mov	rdi, r14
	mov	QWORD PTR [rsp+8], rcx
	mov	QWORD PTR [rsp], r8
	call	memcmp
	test	eax, eax
	mov	r8, QWORD PTR [rsp]
	mov	rcx, QWORD PTR [rsp+8]
	jne	.L432
	mov	rax, r12
	sub	rax, rbp
	cmp	rax, 2147483647
	jg	.L413
.L414:
	cmp	rax, -2147483648
	jl	.L397
	test	eax, eax
	js	.L397
	test	rcx, rcx
	je	.L404
.L413:
	mov	rdx, rcx
	mov	rsi, r14
	mov	rdi, r8
	call	memcmp
	test	eax, eax
	jne	.L405
.L404:
	sub	rbp, r12
	cmp	rbp, 2147483647
	jg	.L406
	cmp	rbp, -2147483648
	jl	.L407
	mov	eax, ebp
.L405:
	test	eax, eax
	js	.L407
.L406:
	mov	rax, rbx
	xor	edx, edx
.L423:
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L394:
	.cfi_restore_state
	mov	rax, r12
	sub	rax, rbp
	cmp	rax, 2147483647
	jle	.L414
	jmp	.L404
	.p2align 4,,10
	.p2align 3
.L432:
	jns	.L413
.L397:
	mov	rax, rbx
	mov	rdx, rbx
	cmp	QWORD PTR [r13+24], rbx
	je	.L423
	mov	rdi, rbx
	call	_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base
	mov	rbp, QWORD PTR [rax+40]
	mov	rcx, rax
	cmp	r12, rbp
	mov	rdx, rbp
	cmovbe	rdx, r12
	test	rdx, rdx
	je	.L400
	mov	rdi, QWORD PTR [rax+32]
	mov	rsi, r14
	mov	QWORD PTR [rsp], rax
	call	memcmp
	test	eax, eax
	mov	rcx, QWORD PTR [rsp]
	jne	.L401
.L400:
	sub	rbp, r12
	cmp	rbp, 2147483647
	jg	.L389
	cmp	rbp, -2147483648
	jl	.L402
	mov	eax, ebp
.L401:
	test	eax, eax
	jns	.L389
.L402:
	cmp	QWORD PTR [rcx+24], 0
	mov	eax, 0
	cmovne	rax, rbx
	cmove	rbx, rcx
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	mov	rdx, rbx
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L431:
	.cfi_restore_state
	cmp	QWORD PTR [rdi+40], 0
	je	.L389
	mov	rbx, QWORD PTR [rdi+32]
	mov	r12, QWORD PTR [rdx+8]
	mov	rbp, QWORD PTR [rbx+40]
	mov	rdx, r12
	cmp	rbp, r12
	cmovbe	rdx, rbp
	test	rdx, rdx
	je	.L390
	mov	rdi, QWORD PTR [rbx+32]
	mov	rsi, QWORD PTR [r15]
	call	memcmp
	test	eax, eax
	jne	.L391
.L390:
	sub	rbp, r12
	cmp	rbp, 2147483647
	jg	.L389
	cmp	rbp, -2147483648
	jl	.L430
	mov	eax, ebp
.L391:
	test	eax, eax
	jns	.L389
.L430:
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	mov	rdx, rbx
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	xor	eax, eax
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L389:
	.cfi_restore_state
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	mov	rdi, r13
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	mov	rsi, r15
	pop	r15
	.cfi_def_cfa_offset 8
	jmp	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE24_M_get_insert_unique_posERS7_
	.p2align 4,,10
	.p2align 3
.L407:
	.cfi_restore_state
	cmp	QWORD PTR [r13+32], rbx
	je	.L430
	mov	rdi, rbx
	call	_ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base
	mov	rcx, QWORD PTR [rax+40]
	mov	rbp, rax
	cmp	r12, rcx
	mov	rdx, rcx
	cmovbe	rdx, r12
	test	rdx, rdx
	je	.L409
	mov	rsi, QWORD PTR [rax+32]
	mov	rdi, r14
	mov	QWORD PTR [rsp], rcx
	call	memcmp
	test	eax, eax
	mov	rcx, QWORD PTR [rsp]
	jne	.L410
.L409:
	sub	r12, rcx
	cmp	r12, 2147483647
	jg	.L389
	cmp	r12, -2147483648
	jl	.L411
	mov	eax, r12d
.L410:
	test	eax, eax
	jns	.L389
.L411:
	cmp	QWORD PTR [rbx+24], 0
	cmovne	rbx, rbp
	mov	eax, 0
	cmovne	rax, rbp
	mov	rdx, rbx
	jmp	.L423
	.cfi_endproc
.LFE8992:
	.size	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE29_M_get_insert_hint_unique_posESt23_Rb_tree_const_iteratorIS8_ERS7_, .-_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE29_M_get_insert_hint_unique_posESt23_Rb_tree_const_iteratorIS8_ERS7_
	.text
	.align 2
	.p2align 4,,15
	.type	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJOS5_EESJ_IJEEEEESt17_Rb_tree_iteratorIS8_ESt23_Rb_tree_const_iteratorIS8_EDpOT_.isra.116, @function
_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJOS5_EESJ_IJEEEEESt17_Rb_tree_iteratorIS8_ESt23_Rb_tree_const_iteratorIS8_EDpOT_.isra.116:
.LFB9491:
	.cfi_startproc
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	mov	r13, rdx
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	mov	rbp, rdi
	mov	edi, 72
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	sub	rsp, 16
	.cfi_def_cfa_offset 64
	call	_Znwm
	mov	rbx, rax
	mov	rax, QWORD PTR [r13+0]
	lea	r13, [rbx+48]
	mov	QWORD PTR [rbx+32], r13
	lea	rdx, [rax+16]
	mov	rcx, QWORD PTR [rax]
	cmp	rcx, rdx
	je	.L451
	mov	QWORD PTR [rbx+32], rcx
	mov	rcx, QWORD PTR [rax+16]
	mov	QWORD PTR [rbx+48], rcx
.L435:
	mov	rcx, QWORD PTR [rax+8]
	mov	rsi, r12
	mov	QWORD PTR [rbx+40], rcx
	mov	QWORD PTR [rax], rdx
	mov	QWORD PTR [rax+8], 0
	mov	BYTE PTR [rax+16], 0
	lea	rdx, [rbx+32]
	mov	rdi, rbp
	mov	DWORD PTR [rbx+64], 0
	call	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE29_M_get_insert_hint_unique_posESt23_Rb_tree_const_iteratorIS8_ERS7_
	mov	r12, rdx
	test	rdx, rdx
	je	.L436
	lea	rcx, [rbp+8]
	mov	edi, 1
	test	rax, rax
	je	.L452
.L437:
	mov	rdx, r12
	mov	rsi, rbx
	call	_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_
	inc	QWORD PTR [rbp+40]
	add	rsp, 16
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	mov	rax, rbx
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L452:
	.cfi_restore_state
	cmp	rdx, rcx
	je	.L437
	mov	r13, QWORD PTR [rbx+40]
	mov	r14, QWORD PTR [rdx+40]
	cmp	r13, r14
	mov	rdx, r14
	cmovbe	rdx, r13
	test	rdx, rdx
	je	.L438
	mov	rsi, QWORD PTR [r12+32]
	mov	rdi, QWORD PTR [rbx+32]
	mov	QWORD PTR [rsp+8], rcx
	call	memcmp
	test	eax, eax
	mov	rcx, QWORD PTR [rsp+8]
	jne	.L439
.L438:
	mov	rax, r13
	sub	rax, r14
	xor	edi, edi
	cmp	rax, 2147483647
	jg	.L437
	cmp	rax, -2147483648
	jl	.L445
.L439:
	shr	eax, 31
	mov	edi, eax
	jmp	.L437
	.p2align 4,,10
	.p2align 3
.L436:
	mov	rdi, QWORD PTR [rbx+32]
	cmp	r13, rdi
	je	.L441
	mov	QWORD PTR [rsp+8], rax
	call	_ZdlPv
	mov	rax, QWORD PTR [rsp+8]
.L441:
	mov	rdi, rbx
	mov	QWORD PTR [rsp+8], rax
	call	_ZdlPv
	mov	rax, QWORD PTR [rsp+8]
	add	rsp, 16
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L451:
	.cfi_restore_state
	vmovdqu64	xmm0, XMMWORD PTR [rax+16]
	vmovups	XMMWORD PTR [rbx+48], xmm0
	jmp	.L435
.L445:
	mov	edi, 1
	jmp	.L437
	.cfi_endproc
.LFE9491:
	.size	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJOS5_EESJ_IJEEEEESt17_Rb_tree_iteratorIS8_ESt23_Rb_tree_const_iteratorIS8_EDpOT_.isra.116, .-_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJOS5_EESJ_IJEEEEESt17_Rb_tree_iteratorIS8_ESt23_Rb_tree_const_iteratorIS8_EDpOT_.isra.116
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"basic_string::_M_construct null not valid"
	.section	.rodata.str1.1
.LC11:
	.string	"GS_PRE_CON"
.LC12:
	.string	"%s"
	.section	.text.unlikely
	.align 2
.LCOLDB13:
	.text
.LHOTB13:
	.align 2
	.p2align 4,,15
	.globl	_ZN3PDE8GSPreConEP4GridS1_
	.type	_ZN3PDE8GSPreConEP4GridS1_, @function
_ZN3PDE8GSPreConEP4GridS1_:
.LFB8394:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA8394
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	mov	r14, rdi
	push	r13
	push	r12
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	mov	r12, rdx
	push	rbx
	and	rsp, -64
	sub	rsp, 576
	.cfi_offset 3, -56
	mov	eax, DWORD PTR _ZZN3PDE8GSPreConEP4GridS1_E8timer_id[rip]
	mov	QWORD PTR [rsp+56], rsi
	test	eax, eax
	js	.L510
	lea	rax, [rsp+304]
	mov	QWORD PTR [rsp+192], rax
	lea	rbx, [rsp+320]
.L454:
	mov	rdi, QWORD PTR [rsp+192]
	xor	esi, esi
	call	gettimeofday
	vxorpd	xmm1, xmm1, xmm1
	vxorpd	xmm0, xmm0, xmm0
	vcvtsi2sdq	xmm0, xmm0, QWORD PTR [rsp+304]
	vcvtsi2sdq	xmm1, xmm1, QWORD PTR [rsp+312]
	mov	esi, 1
	mov	rdi, r12
	vfmadd132sd	xmm1, xmm0, QWORD PTR .LC9[rip]
	vmovsd	QWORD PTR [rsp+48], xmm1
.LEHB36:
	call	_ZNK4Grid10numGrids_xEb
	mov	esi, 1
	mov	rdi, r12
	mov	r13d, eax
	call	_ZNK4Grid10numGrids_yEb
	vmovsd	xmm0, QWORD PTR [r14+80]
	vmovsd	xmm1, QWORD PTR [r14+72]
	vmulsd	xmm0, xmm0, xmm0
	vmovsd	xmm3, QWORD PTR .LC3[rip]
	vmulsd	xmm1, xmm1, xmm1
	xor	r14d, r14d
	vdivsd	xmm0, xmm3, xmm0
	vdivsd	xmm1, xmm3, xmm1
	vaddsd	xmm2, xmm0, xmm0
	vbroadcastsd	zmm18, xmm0
	vmovapd	ZMMWORD PTR [rsp+128], zmm18
	vfmadd231sd	xmm2, xmm1, QWORD PTR .LC10[rip]
	vbroadcastsd	zmm17, xmm1
	vmovapd	ZMMWORD PTR [rsp+64], zmm17
	vdivsd	xmm16, xmm3, xmm2
	vbroadcastsd	zmm19, xmm16
	vmovsd	QWORD PTR [rsp+256], xmm16
	vmovapd	ZMMWORD PTR [rsp+192], zmm19
.L481:
	vmovapd	zmm4, ZMMWORD PTR [rsp+192]
	vmovapd	zmm5, ZMMWORD PTR [rsp+128]
	vmovapd	zmm6, ZMMWORD PTR [rsp+64]
	vmovsd	xmm7, QWORD PTR [rsp+256]
	mov	DWORD PTR [rsp+556], eax
	mov	DWORD PTR [rsp+280], eax
	mov	rax, QWORD PTR [rsp+56]
	xor	ecx, ecx
	mov	edx, 8
	mov	rsi, rbx
	mov	edi, OFFSET FLAT:_ZN3PDE8GSPreConEP4GridS1_._omp_fn.1
	mov	DWORD PTR [rsp+560], r14d
	vmovapd	ZMMWORD PTR [rsp+448], zmm4
	vmovapd	ZMMWORD PTR [rsp+384], zmm5
	vmovapd	ZMMWORD PTR [rsp+320], zmm6
	vmovsd	QWORD PTR [rsp+544], xmm7
	vmovsd	QWORD PTR [rsp+536], xmm0
	vmovsd	QWORD PTR [rsp+264], xmm0
	vmovsd	QWORD PTR [rsp+528], xmm1
	vmovsd	QWORD PTR [rsp+272], xmm1
	mov	DWORD PTR [rsp+552], r13d
	mov	QWORD PTR [rsp+520], r12
	mov	QWORD PTR [rsp+512], rax
	vzeroupper
	call	GOMP_parallel
	cmp	r14d, 1
	mov	eax, DWORD PTR [rsp+280]
	vmovsd	xmm1, QWORD PTR [rsp+272]
	vmovsd	xmm0, QWORD PTR [rsp+264]
	jne	.L497
	mov	rdi, rbx
	xor	esi, esi
	call	gettimeofday
	vxorpd	xmm0, xmm0, xmm0
	vxorpd	xmm1, xmm1, xmm1
	vcvtsi2sdq	xmm0, xmm0, QWORD PTR [rsp+328]
	vcvtsi2sdq	xmm1, xmm1, QWORD PTR [rsp+320]
	mov	rdx, QWORD PTR fn_timer[rip]
	movsx	rax, DWORD PTR _ZZN3PDE8GSPreConEP4GridS1_E8timer_id[rip]
	vfmadd132sd	xmm0, xmm1, QWORD PTR .LC9[rip]
	lea	rdx, [rdx+rax*8]
	vsubsd	xmm0, xmm0, QWORD PTR [rsp+48]
	vaddsd	xmm0, xmm0, QWORD PTR [rdx]
	vmovsd	QWORD PTR [rdx], xmm0
	mov	rdx, QWORD PTR fn_counts[rip]
	inc	DWORD PTR [rdx+rax*4]
	lea	rsp, [rbp-40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L497:
	.cfi_restore_state
	mov	r14d, 1
	jmp	.L481
	.p2align 4,,10
	.p2align 3
.L510:
	mov	rsi, QWORD PTR fn_timer[rip+8]
	mov	QWORD PTR [rsp+320], 0x000000000
	mov	rax, rsi
	sub	rax, QWORD PTR fn_timer[rip]
	sar	rax, 3
	cmp	rsi, QWORD PTR fn_timer[rip+16]
	mov	DWORD PTR _ZZN3PDE8GSPreConEP4GridS1_E8timer_id[rip], eax
	je	.L455
	mov	QWORD PTR [rsi], 0x000000000
	add	rsi, 8
	mov	QWORD PTR fn_timer[rip+8], rsi
	lea	rbx, [rsp+320]
.L456:
	mov	rsi, QWORD PTR fn_counts[rip+8]
	mov	DWORD PTR [rsp+320], 0
	cmp	rsi, QWORD PTR fn_counts[rip+16]
	je	.L457
	mov	DWORD PTR [rsi], 0
	add	rsi, 4
	mov	QWORD PTR fn_counts[rip+8], rsi
.L458:
	mov	edx, OFFSET FLAT:.LC11
	mov	esi, OFFSET FLAT:.LC12
	lea	rdi, [rsp+296]
	xor	eax, eax
	call	asprintf
	mov	rcx, QWORD PTR [rsp+296]
	lea	r13, [rbx+16]
	mov	QWORD PTR [rsp+320], r13
	test	rcx, rcx
	jne	.L522
.L513:
	mov	edi, OFFSET FLAT:.LC8
	call	_ZSt19__throw_logic_errorPKc
.LEHE36:
	.p2align 4,,10
	.p2align 3
.L522:
	mov	rdi, rcx
	mov	QWORD PTR [rsp+280], rcx
	call	strlen
	cmp	rax, 15
	mov	r8, rax
	mov	QWORD PTR [rsp+304], rax
	mov	rcx, QWORD PTR [rsp+280]
	ja	.L523
	cmp	rax, 1
	jne	.L460
	movzx	edx, BYTE PTR [rcx]
	mov	BYTE PTR [rsp+336], dl
.L461:
	mov	QWORD PTR [rsp+328], rax
	mov	BYTE PTR [r13+0+rax], 0
	mov	rsi, QWORD PTR _Z7fn_nameB5cxx11[rip+8]
	cmp	rsi, QWORD PTR _Z7fn_nameB5cxx11[rip+16]
	je	.L462
	lea	rax, [rsi+16]
	mov	QWORD PTR [rsi], rax
	lea	rdx, [rbx+16]
	mov	rax, QWORD PTR [rsp+320]
	cmp	rax, rdx
	je	.L524
	mov	QWORD PTR [rsi], rax
	mov	rax, QWORD PTR [rsp+336]
	mov	QWORD PTR [rsi+16], rax
.L464:
	mov	rax, QWORD PTR [rsp+328]
	add	rsi, 32
	mov	QWORD PTR [rsi-24], rax
	mov	QWORD PTR _Z7fn_nameB5cxx11[rip+8], rsi
.L465:
	mov	rcx, QWORD PTR [rsp+296]
	lea	r13, [rbx+16]
	mov	QWORD PTR [rsp+320], r13
	test	rcx, rcx
	je	.L513
	mov	rdi, rcx
	mov	QWORD PTR [rsp+280], rcx
	call	strlen
	cmp	rax, 15
	mov	r8, rax
	mov	QWORD PTR [rsp+304], rax
	mov	rcx, QWORD PTR [rsp+280]
	ja	.L525
	cmp	rax, 1
	jne	.L467
	movzx	edx, BYTE PTR [rcx]
	lea	rsi, [rsp+304]
	mov	BYTE PTR [rsp+336], dl
	mov	QWORD PTR [rsp+192], rsi
.L468:
	mov	QWORD PTR [rsp+328], rax
	mov	BYTE PTR [r13+0+rax], 0
	mov	r13, QWORD PTR _Z6fn_mapB5cxx11[rip+16]
	test	r13, r13
	je	.L496
	mov	rax, QWORD PTR [rsp+320]
	mov	r15, QWORD PTR [rsp+328]
	mov	QWORD PTR [rsp+264], rax
	mov	QWORD PTR [rsp+272], OFFSET FLAT:_Z6fn_mapB5cxx11+8
	jmp	.L470
	.p2align 4,,10
	.p2align 3
.L475:
	mov	r13, QWORD PTR [r13+24]
	test	r13, r13
	je	.L471
.L470:
	mov	rcx, QWORD PTR [r13+40]
	mov	rdx, r15
	cmp	rcx, r15
	cmovbe	rdx, rcx
	test	rdx, rdx
	je	.L472
	mov	rdi, QWORD PTR [r13+32]
	mov	rsi, QWORD PTR [rsp+264]
	mov	QWORD PTR [rsp+280], rcx
	call	memcmp
	test	eax, eax
	mov	rcx, QWORD PTR [rsp+280]
	jne	.L473
.L472:
	sub	rcx, r15
	cmp	rcx, 2147483647
	jg	.L474
	cmp	rcx, -2147483648
	jl	.L475
	mov	eax, ecx
.L473:
	test	eax, eax
	js	.L475
.L474:
	mov	QWORD PTR [rsp+272], r13
	mov	r13, QWORD PTR [r13+16]
	test	r13, r13
	jne	.L470
.L471:
	mov	rax, QWORD PTR [rsp+272]
	cmp	rax, OFFSET FLAT:_Z6fn_mapB5cxx11+8
	je	.L469
	mov	rcx, QWORD PTR [rax+40]
	cmp	r15, rcx
	mov	rdx, rcx
	cmovbe	rdx, r15
	test	rdx, rdx
	je	.L477
	mov	rsi, QWORD PTR [rax+32]
	mov	rdi, QWORD PTR [rsp+264]
	mov	QWORD PTR [rsp+280], rcx
	call	memcmp
	test	eax, eax
	mov	rcx, QWORD PTR [rsp+280]
	jne	.L478
.L477:
	mov	r9, r15
	sub	r9, rcx
	cmp	r9, 2147483647
	jg	.L479
	cmp	r9, -2147483648
	jl	.L469
	mov	eax, r9d
.L478:
	test	eax, eax
	jns	.L479
.L469:
	mov	rdx, QWORD PTR [rsp+192]
	mov	rsi, QWORD PTR [rsp+272]
	mov	edi, OFFSET FLAT:_Z6fn_mapB5cxx11
	mov	QWORD PTR [rsp+304], rbx
.LEHB37:
	call	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJOS5_EESJ_IJEEEEESt17_Rb_tree_iteratorIS8_ESt23_Rb_tree_const_iteratorIS8_EDpOT_.isra.116
.LEHE37:
	mov	QWORD PTR [rsp+272], rax
	mov	rax, QWORD PTR [rsp+320]
	mov	QWORD PTR [rsp+264], rax
.L479:
	mov	eax, DWORD PTR _ZZN3PDE8GSPreConEP4GridS1_E8timer_id[rip]
	mov	rdi, QWORD PTR [rsp+272]
	mov	DWORD PTR [rdi+64], eax
	mov	rdi, QWORD PTR [rsp+264]
	lea	rax, [rbx+16]
	cmp	rdi, rax
	je	.L454
	call	_ZdlPv
	jmp	.L454
	.p2align 4,,10
	.p2align 3
.L460:
	test	r8, r8
	je	.L461
	mov	rax, r13
	jmp	.L459
	.p2align 4,,10
	.p2align 3
.L467:
	test	r8, r8
	jne	.L526
	lea	rsi, [rsp+304]
	mov	QWORD PTR [rsp+192], rsi
	jmp	.L468
	.p2align 4,,10
	.p2align 3
.L523:
	lea	rax, [rsp+304]
	xor	edx, edx
	mov	rsi, rax
	mov	rdi, rbx
	mov	QWORD PTR [rsp+272], r8
	mov	QWORD PTR [rsp+280], rcx
.LEHB38:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	mov	rdx, QWORD PTR [rsp+304]
	mov	QWORD PTR [rsp+320], rax
	mov	QWORD PTR [rsp+336], rdx
	mov	rcx, QWORD PTR [rsp+280]
	mov	r8, QWORD PTR [rsp+272]
.L459:
	mov	rdx, r8
	mov	rsi, rcx
	mov	rdi, rax
	call	memcpy
	mov	rax, QWORD PTR [rsp+304]
	mov	r13, QWORD PTR [rsp+320]
	jmp	.L461
	.p2align 4,,10
	.p2align 3
.L525:
	lea	rax, [rsp+304]
	xor	edx, edx
	mov	rsi, rax
	mov	rdi, rbx
	mov	QWORD PTR [rsp+272], r8
	mov	QWORD PTR [rsp+280], rcx
	mov	QWORD PTR [rsp+192], rax
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	mov	rdx, QWORD PTR [rsp+304]
	mov	QWORD PTR [rsp+320], rax
	mov	QWORD PTR [rsp+336], rdx
	mov	rcx, QWORD PTR [rsp+280]
	mov	r8, QWORD PTR [rsp+272]
.L466:
	mov	rdx, r8
	mov	rsi, rcx
	mov	rdi, rax
	call	memcpy
	mov	rax, QWORD PTR [rsp+304]
	mov	r13, QWORD PTR [rsp+320]
	jmp	.L468
	.p2align 4,,10
	.p2align 3
.L524:
	vmovdqa64	xmm21, XMMWORD PTR [rsp+336]
	vmovups	XMMWORD PTR [rsi+16], xmm21
	jmp	.L464
	.p2align 4,,10
	.p2align 3
.L457:
	mov	rdx, rbx
	mov	edi, OFFSET FLAT:fn_counts
	call	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	jmp	.L458
	.p2align 4,,10
	.p2align 3
.L455:
	lea	rbx, [rsp+320]
	mov	rdx, rbx
	mov	edi, OFFSET FLAT:fn_timer
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
.LEHE38:
	jmp	.L456
	.p2align 4,,10
	.p2align 3
.L462:
	mov	rdx, rbx
	mov	edi, OFFSET FLAT:_Z7fn_nameB5cxx11
.LEHB39:
	call	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_M_realloc_insertIJS5_EEEvN9__gnu_cxx17__normal_iteratorIPS5_S7_EEDpOT_
.LEHE39:
	mov	rdi, QWORD PTR [rsp+320]
	lea	rax, [rbx+16]
	cmp	rdi, rax
	je	.L465
	call	_ZdlPv
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L496:
	mov	QWORD PTR [rsp+272], OFFSET FLAT:_Z6fn_mapB5cxx11+8
	jmp	.L469
.L526:
	lea	rsi, [rsp+304]
	mov	rax, r13
	mov	QWORD PTR [rsp+192], rsi
	jmp	.L466
.L498:
	mov	r12, rax
	jmp	.L484
.L499:
	mov	r12, rax
	jmp	.L484
	.section	.gcc_except_table
.LLSDA8394:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8394-.LLSDACSB8394
.LLSDACSB8394:
	.uleb128 .LEHB36-.LFB8394
	.uleb128 .LEHE36-.LEHB36
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB37-.LFB8394
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L499-.LFB8394
	.uleb128 0
	.uleb128 .LEHB38-.LFB8394
	.uleb128 .LEHE38-.LEHB38
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB39-.LFB8394
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L498-.LFB8394
	.uleb128 0
.LLSDACSE8394:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDAC8394
	.type	_ZN3PDE8GSPreConEP4GridS1_.cold.130, @function
_ZN3PDE8GSPreConEP4GridS1_.cold.130:
.LFSB8394:
.L484:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -56
	.cfi_offset 6, -16
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
	mov	rdi, QWORD PTR [rsp+320]
	add	rbx, 16
	cmp	rdi, rbx
	je	.L517
	vzeroupper
	call	_ZdlPv
.L485:
	mov	rdi, r12
.LEHB40:
	call	_Unwind_Resume
.LEHE40:
.L517:
	vzeroupper
	jmp	.L485
	.cfi_endproc
.LFE8394:
	.section	.gcc_except_table
.LLSDAC8394:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC8394-.LLSDACSBC8394
.LLSDACSBC8394:
	.uleb128 .LEHB40-.LCOLDB13
	.uleb128 .LEHE40-.LEHB40
	.uleb128 0
	.uleb128 0
.LLSDACSEC8394:
	.section	.text.unlikely
	.text
	.size	_ZN3PDE8GSPreConEP4GridS1_, .-_ZN3PDE8GSPreConEP4GridS1_
	.section	.text.unlikely
	.size	_ZN3PDE8GSPreConEP4GridS1_.cold.130, .-_ZN3PDE8GSPreConEP4GridS1_.cold.130
.LCOLDE13:
	.text
.LHOTE13:
	.section	.rodata.str1.1
.LC14:
	.string	"APPLY_STENCIL"
	.section	.text.unlikely
	.align 2
.LCOLDB15:
	.text
.LHOTB15:
	.align 2
	.p2align 4,,15
	.globl	_ZN3PDE12applyStencilEP4GridS1_
	.type	_ZN3PDE12applyStencilEP4GridS1_, @function
_ZN3PDE12applyStencilEP4GridS1_:
.LFB8393:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA8393
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	mov	r12, rdi
	push	rbx
	and	rsp, -64
	sub	rsp, 384
	.cfi_offset 3, -56
	mov	eax, DWORD PTR _ZZN3PDE12applyStencilEP4GridS1_E8timer_id[rip]
	mov	QWORD PTR [rsp+64], rsi
	mov	QWORD PTR [rsp+56], rdx
	test	eax, eax
	js	.L582
	lea	rbx, [rsp+128]
	lea	r13, [rsp+112]
.L528:
	xor	esi, esi
	mov	rdi, r13
	call	gettimeofday
	vxorpd	xmm1, xmm1, xmm1
	vxorpd	xmm0, xmm0, xmm0
	vcvtsi2sdq	xmm0, xmm0, QWORD PTR [rsp+112]
	vcvtsi2sdq	xmm1, xmm1, QWORD PTR [rsp+120]
	vmovsd	xmm2, QWORD PTR [r12+80]
	mov	rax, QWORD PTR [r12+64]
	vmulsd	xmm2, xmm2, xmm2
	vfmadd132sd	xmm1, xmm0, QWORD PTR .LC9[rip]
	vmovsd	xmm0, QWORD PTR [r12+72]
	mov	QWORD PTR [rsp+360], rax
	vmulsd	xmm0, xmm0, xmm0
	mov	rax, QWORD PTR [rsp+56]
	vmovsd	QWORD PTR [rsp+88], xmm1
	vmovsd	xmm1, QWORD PTR .LC3[rip]
	mov	QWORD PTR [rsp+328], rax
	vdivsd	xmm0, xmm1, xmm0
	mov	rax, QWORD PTR [rsp+64]
	xor	ecx, ecx
	mov	edx, 8
	mov	rsi, rbx
	mov	edi, OFFSET FLAT:_ZN3PDE12applyStencilEP4GridS1_._omp_fn.0
	mov	QWORD PTR [rsp+320], rax
	vdivsd	xmm1, xmm1, xmm2
	vbroadcastsd	zmm3, xmm0
	vmovapd	ZMMWORD PTR [rsp+128], zmm3
	vmovsd	QWORD PTR [rsp+336], xmm0
	vaddsd	xmm2, xmm1, xmm1
	vbroadcastsd	zmm4, xmm1
	vmovapd	ZMMWORD PTR [rsp+192], zmm4
	vfmadd231sd	xmm2, xmm0, QWORD PTR .LC10[rip]
	vmovsd	QWORD PTR [rsp+344], xmm1
	vbroadcastsd	zmm5, xmm2
	vmovapd	ZMMWORD PTR [rsp+256], zmm5
	vmovsd	QWORD PTR [rsp+352], xmm2
	vzeroupper
	call	GOMP_parallel
	mov	rdi, rbx
	xor	esi, esi
	call	gettimeofday
	vxorpd	xmm0, xmm0, xmm0
	vxorpd	xmm1, xmm1, xmm1
	vcvtsi2sdq	xmm0, xmm0, QWORD PTR [rsp+136]
	vcvtsi2sdq	xmm1, xmm1, QWORD PTR [rsp+128]
	mov	rdx, QWORD PTR fn_timer[rip]
	movsx	rax, DWORD PTR _ZZN3PDE12applyStencilEP4GridS1_E8timer_id[rip]
	vfmadd132sd	xmm0, xmm1, QWORD PTR .LC9[rip]
	lea	rdx, [rdx+rax*8]
	vsubsd	xmm0, xmm0, QWORD PTR [rsp+88]
	vaddsd	xmm0, xmm0, QWORD PTR [rdx]
	vmovsd	QWORD PTR [rdx], xmm0
	mov	rdx, QWORD PTR fn_counts[rip]
	inc	DWORD PTR [rdx+rax*4]
	lea	rsp, [rbp-40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L582:
	.cfi_restore_state
	mov	rsi, QWORD PTR fn_timer[rip+8]
	mov	QWORD PTR [rsp+128], 0x000000000
	mov	rax, rsi
	sub	rax, QWORD PTR fn_timer[rip]
	sar	rax, 3
	cmp	rsi, QWORD PTR fn_timer[rip+16]
	mov	DWORD PTR _ZZN3PDE12applyStencilEP4GridS1_E8timer_id[rip], eax
	je	.L529
	mov	QWORD PTR [rsi], 0x000000000
	add	rsi, 8
	mov	QWORD PTR fn_timer[rip+8], rsi
	lea	rbx, [rsp+128]
.L530:
	mov	rsi, QWORD PTR fn_counts[rip+8]
	mov	DWORD PTR [rsp+128], 0
	cmp	rsi, QWORD PTR fn_counts[rip+16]
	je	.L531
	mov	DWORD PTR [rsi], 0
	add	rsi, 4
	mov	QWORD PTR fn_counts[rip+8], rsi
.L532:
	mov	edx, OFFSET FLAT:.LC14
	mov	esi, OFFSET FLAT:.LC12
	lea	rdi, [rsp+104]
	xor	eax, eax
	call	asprintf
	mov	r14, QWORD PTR [rsp+104]
	lea	r13, [rbx+16]
	mov	QWORD PTR [rsp+128], r13
	test	r14, r14
	jne	.L594
.L585:
	mov	edi, OFFSET FLAT:.LC8
.LEHB41:
	call	_ZSt19__throw_logic_errorPKc
.LEHE41:
	.p2align 4,,10
	.p2align 3
.L594:
	mov	rdi, r14
	call	strlen
	mov	rcx, rax
	mov	QWORD PTR [rsp+112], rax
	cmp	rax, 15
	ja	.L595
	cmp	rax, 1
	jne	.L534
	movzx	edx, BYTE PTR [r14]
	mov	BYTE PTR [rsp+144], dl
.L535:
	mov	QWORD PTR [rsp+136], rax
	mov	BYTE PTR [r13+0+rax], 0
	mov	rsi, QWORD PTR _Z7fn_nameB5cxx11[rip+8]
	cmp	rsi, QWORD PTR _Z7fn_nameB5cxx11[rip+16]
	je	.L536
	lea	rax, [rsi+16]
	mov	QWORD PTR [rsi], rax
	lea	rdx, [rbx+16]
	mov	rax, QWORD PTR [rsp+128]
	cmp	rax, rdx
	je	.L596
	mov	QWORD PTR [rsi], rax
	mov	rax, QWORD PTR [rsp+144]
	mov	QWORD PTR [rsi+16], rax
.L538:
	mov	rax, QWORD PTR [rsp+136]
	add	rsi, 32
	mov	QWORD PTR [rsi-24], rax
	mov	QWORD PTR _Z7fn_nameB5cxx11[rip+8], rsi
.L539:
	mov	r14, QWORD PTR [rsp+104]
	lea	r13, [rbx+16]
	mov	QWORD PTR [rsp+128], r13
	test	r14, r14
	je	.L585
	mov	rdi, r14
	call	strlen
	mov	rcx, rax
	mov	QWORD PTR [rsp+112], rax
	cmp	rax, 15
	ja	.L597
	cmp	rax, 1
	jne	.L541
	movzx	edx, BYTE PTR [r14]
	mov	BYTE PTR [rsp+144], dl
	mov	rdx, r13
	lea	r13, [rsp+112]
.L542:
	mov	QWORD PTR [rsp+136], rax
	mov	BYTE PTR [rdx+rax], 0
	mov	rcx, QWORD PTR _Z6fn_mapB5cxx11[rip+16]
	test	rcx, rcx
	je	.L569
	mov	rax, QWORD PTR [rsp+128]
	mov	r14, QWORD PTR [rsp+136]
	mov	QWORD PTR [rsp+88], rax
	mov	r15d, OFFSET FLAT:_Z6fn_mapB5cxx11+8
	jmp	.L544
	.p2align 4,,10
	.p2align 3
.L549:
	mov	rcx, QWORD PTR [rcx+24]
	test	rcx, rcx
	je	.L545
.L544:
	mov	r10, QWORD PTR [rcx+40]
	mov	rdx, r14
	cmp	r10, r14
	cmovbe	rdx, r10
	test	rdx, rdx
	je	.L546
	mov	rdi, QWORD PTR [rcx+32]
	mov	rsi, QWORD PTR [rsp+88]
	mov	QWORD PTR [rsp+72], r10
	mov	QWORD PTR [rsp+80], rcx
	call	memcmp
	test	eax, eax
	mov	rcx, QWORD PTR [rsp+80]
	mov	r10, QWORD PTR [rsp+72]
	jne	.L547
.L546:
	mov	rax, r10
	sub	rax, r14
	cmp	rax, 2147483647
	jg	.L548
	cmp	rax, -2147483648
	jl	.L549
.L547:
	test	eax, eax
	js	.L549
.L548:
	mov	r15, rcx
	mov	rcx, QWORD PTR [rcx+16]
	test	rcx, rcx
	jne	.L544
.L545:
	cmp	r15, OFFSET FLAT:_Z6fn_mapB5cxx11+8
	je	.L543
	mov	rcx, QWORD PTR [r15+40]
	cmp	r14, rcx
	mov	rdx, rcx
	cmovbe	rdx, r14
	test	rdx, rdx
	je	.L551
	mov	rsi, QWORD PTR [r15+32]
	mov	rdi, QWORD PTR [rsp+88]
	mov	QWORD PTR [rsp+80], rcx
	call	memcmp
	test	eax, eax
	mov	rcx, QWORD PTR [rsp+80]
	jne	.L552
.L551:
	mov	r8, r14
	sub	r8, rcx
	cmp	r8, 2147483647
	jg	.L553
	cmp	r8, -2147483648
	jl	.L543
	mov	eax, r8d
.L552:
	test	eax, eax
	jns	.L553
.L543:
	mov	rdx, r13
	mov	rsi, r15
	mov	edi, OFFSET FLAT:_Z6fn_mapB5cxx11
	mov	QWORD PTR [rsp+112], rbx
.LEHB42:
	call	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJOS5_EESJ_IJEEEEESt17_Rb_tree_iteratorIS8_ESt23_Rb_tree_const_iteratorIS8_EDpOT_.isra.116
.LEHE42:
	mov	r15, rax
	mov	rax, QWORD PTR [rsp+128]
	mov	QWORD PTR [rsp+88], rax
.L553:
	mov	eax, DWORD PTR _ZZN3PDE12applyStencilEP4GridS1_E8timer_id[rip]
	mov	rdi, QWORD PTR [rsp+88]
	mov	DWORD PTR [r15+64], eax
	lea	rax, [rbx+16]
	cmp	rdi, rax
	je	.L528
	call	_ZdlPv
	jmp	.L528
	.p2align 4,,10
	.p2align 3
.L534:
	test	rcx, rcx
	je	.L535
	mov	rax, r13
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L541:
	test	rcx, rcx
	jne	.L598
	mov	rdx, r13
	lea	r13, [rsp+112]
	jmp	.L542
	.p2align 4,,10
	.p2align 3
.L595:
	lea	r13, [rsp+112]
	xor	edx, edx
	mov	rsi, r13
	mov	rdi, rbx
	mov	QWORD PTR [rsp+88], rcx
.LEHB43:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	mov	rdx, QWORD PTR [rsp+112]
	mov	QWORD PTR [rsp+128], rax
	mov	QWORD PTR [rsp+144], rdx
	mov	rcx, QWORD PTR [rsp+88]
.L533:
	mov	rdx, rcx
	mov	rsi, r14
	mov	rdi, rax
	call	memcpy
	mov	rax, QWORD PTR [rsp+112]
	mov	r13, QWORD PTR [rsp+128]
	jmp	.L535
	.p2align 4,,10
	.p2align 3
.L597:
	lea	r13, [rsp+112]
	xor	edx, edx
	mov	rsi, r13
	mov	rdi, rbx
	mov	QWORD PTR [rsp+88], rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	mov	rdx, QWORD PTR [rsp+112]
	mov	QWORD PTR [rsp+128], rax
	mov	QWORD PTR [rsp+144], rdx
	mov	rcx, QWORD PTR [rsp+88]
.L540:
	mov	rdx, rcx
	mov	rsi, r14
	mov	rdi, rax
	call	memcpy
	mov	rax, QWORD PTR [rsp+112]
	mov	rdx, QWORD PTR [rsp+128]
	jmp	.L542
	.p2align 4,,10
	.p2align 3
.L596:
	vmovdqa64	xmm6, XMMWORD PTR [rsp+144]
	vmovups	XMMWORD PTR [rsi+16], xmm6
	jmp	.L538
	.p2align 4,,10
	.p2align 3
.L531:
	mov	rdx, rbx
	mov	edi, OFFSET FLAT:fn_counts
	call	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	jmp	.L532
	.p2align 4,,10
	.p2align 3
.L529:
	lea	rbx, [rsp+128]
	mov	rdx, rbx
	mov	edi, OFFSET FLAT:fn_timer
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
.LEHE43:
	jmp	.L530
	.p2align 4,,10
	.p2align 3
.L536:
	mov	rdx, rbx
	mov	edi, OFFSET FLAT:_Z7fn_nameB5cxx11
.LEHB44:
	call	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_M_realloc_insertIJS5_EEEvN9__gnu_cxx17__normal_iteratorIPS5_S7_EEDpOT_
.LEHE44:
	mov	rdi, QWORD PTR [rsp+128]
	lea	rax, [rbx+16]
	cmp	rdi, rax
	je	.L539
	call	_ZdlPv
	jmp	.L539
	.p2align 4,,10
	.p2align 3
.L569:
	mov	r15d, OFFSET FLAT:_Z6fn_mapB5cxx11+8
	jmp	.L543
.L598:
	mov	rax, r13
	lea	r13, [rsp+112]
	jmp	.L540
.L570:
	mov	r12, rax
	jmp	.L557
.L571:
	mov	r12, rax
	jmp	.L557
	.section	.gcc_except_table
.LLSDA8393:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8393-.LLSDACSB8393
.LLSDACSB8393:
	.uleb128 .LEHB41-.LFB8393
	.uleb128 .LEHE41-.LEHB41
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB42-.LFB8393
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L571-.LFB8393
	.uleb128 0
	.uleb128 .LEHB43-.LFB8393
	.uleb128 .LEHE43-.LEHB43
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB44-.LFB8393
	.uleb128 .LEHE44-.LEHB44
	.uleb128 .L570-.LFB8393
	.uleb128 0
.LLSDACSE8393:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDAC8393
	.type	_ZN3PDE12applyStencilEP4GridS1_.cold.131, @function
_ZN3PDE12applyStencilEP4GridS1_.cold.131:
.LFSB8393:
.L557:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -56
	.cfi_offset 6, -16
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
	mov	rdi, QWORD PTR [rsp+128]
	add	rbx, 16
	cmp	rdi, rbx
	je	.L589
	vzeroupper
	call	_ZdlPv
.L558:
	mov	rdi, r12
.LEHB45:
	call	_Unwind_Resume
.LEHE45:
.L589:
	vzeroupper
	jmp	.L558
	.cfi_endproc
.LFE8393:
	.section	.gcc_except_table
.LLSDAC8393:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC8393-.LLSDACSBC8393
.LLSDACSBC8393:
	.uleb128 .LEHB45-.LCOLDB15
	.uleb128 .LEHE45-.LEHB45
	.uleb128 0
	.uleb128 0
.LLSDACSEC8393:
	.section	.text.unlikely
	.text
	.size	_ZN3PDE12applyStencilEP4GridS1_, .-_ZN3PDE12applyStencilEP4GridS1_
	.section	.text.unlikely
	.size	_ZN3PDE12applyStencilEP4GridS1_.cold.131, .-_ZN3PDE12applyStencilEP4GridS1_.cold.131
.LCOLDE15:
	.text
.LHOTE15:
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.type	_GLOBAL__sub_I__Z15defaultBoundaryiidd, @function
_GLOBAL__sub_I__Z15defaultBoundaryiidd:
.LFB9374:
	.cfi_startproc
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	mov	edi, OFFSET FLAT:_ZStL8__ioinit
	call	_ZNSt8ios_base4InitC1Ev
	mov	edx, OFFSET FLAT:__dso_handle
	mov	esi, OFFSET FLAT:_ZStL8__ioinit
	mov	edi, OFFSET FLAT:_ZNSt8ios_base4InitD1Ev
	add	rsp, 8
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit
	.cfi_endproc
.LFE9374:
	.size	_GLOBAL__sub_I__Z15defaultBoundaryiidd, .-_GLOBAL__sub_I__Z15defaultBoundaryiidd
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z15defaultBoundaryiidd
	.weak	_ZTSSt22_Weak_result_type_implIPFdiiddEE
	.section	.rodata._ZTSSt22_Weak_result_type_implIPFdiiddEE,"aG",@progbits,_ZTSSt22_Weak_result_type_implIPFdiiddEE,comdat
	.align 32
	.type	_ZTSSt22_Weak_result_type_implIPFdiiddEE, @object
	.size	_ZTSSt22_Weak_result_type_implIPFdiiddEE, 37
_ZTSSt22_Weak_result_type_implIPFdiiddEE:
	.string	"St22_Weak_result_type_implIPFdiiddEE"
	.weak	_ZTISt22_Weak_result_type_implIPFdiiddEE
	.section	.rodata._ZTISt22_Weak_result_type_implIPFdiiddEE,"aG",@progbits,_ZTISt22_Weak_result_type_implIPFdiiddEE,comdat
	.align 8
	.type	_ZTISt22_Weak_result_type_implIPFdiiddEE, @object
	.size	_ZTISt22_Weak_result_type_implIPFdiiddEE, 16
_ZTISt22_Weak_result_type_implIPFdiiddEE:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSSt22_Weak_result_type_implIPFdiiddEE
	.weak	_ZTSSt24_Weak_result_type_memfunIPFdiiddELb0EE
	.section	.rodata._ZTSSt24_Weak_result_type_memfunIPFdiiddELb0EE,"aG",@progbits,_ZTSSt24_Weak_result_type_memfunIPFdiiddELb0EE,comdat
	.align 32
	.type	_ZTSSt24_Weak_result_type_memfunIPFdiiddELb0EE, @object
	.size	_ZTSSt24_Weak_result_type_memfunIPFdiiddELb0EE, 43
_ZTSSt24_Weak_result_type_memfunIPFdiiddELb0EE:
	.string	"St24_Weak_result_type_memfunIPFdiiddELb0EE"
	.weak	_ZTISt24_Weak_result_type_memfunIPFdiiddELb0EE
	.section	.rodata._ZTISt24_Weak_result_type_memfunIPFdiiddELb0EE,"aG",@progbits,_ZTISt24_Weak_result_type_memfunIPFdiiddELb0EE,comdat
	.align 8
	.type	_ZTISt24_Weak_result_type_memfunIPFdiiddELb0EE, @object
	.size	_ZTISt24_Weak_result_type_memfunIPFdiiddELb0EE, 24
_ZTISt24_Weak_result_type_memfunIPFdiiddELb0EE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt24_Weak_result_type_memfunIPFdiiddELb0EE
	.quad	_ZTISt22_Weak_result_type_implIPFdiiddEE
	.weak	_ZTSSt17_Weak_result_typeIPFdiiddEE
	.section	.rodata._ZTSSt17_Weak_result_typeIPFdiiddEE,"aG",@progbits,_ZTSSt17_Weak_result_typeIPFdiiddEE,comdat
	.align 32
	.type	_ZTSSt17_Weak_result_typeIPFdiiddEE, @object
	.size	_ZTSSt17_Weak_result_typeIPFdiiddEE, 32
_ZTSSt17_Weak_result_typeIPFdiiddEE:
	.string	"St17_Weak_result_typeIPFdiiddEE"
	.weak	_ZTISt17_Weak_result_typeIPFdiiddEE
	.section	.rodata._ZTISt17_Weak_result_typeIPFdiiddEE,"aG",@progbits,_ZTISt17_Weak_result_typeIPFdiiddEE,comdat
	.align 8
	.type	_ZTISt17_Weak_result_typeIPFdiiddEE, @object
	.size	_ZTISt17_Weak_result_typeIPFdiiddEE, 24
_ZTISt17_Weak_result_typeIPFdiiddEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt17_Weak_result_typeIPFdiiddEE
	.quad	_ZTISt24_Weak_result_type_memfunIPFdiiddELb0EE
	.weak	_ZTSSt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE
	.section	.rodata._ZTSSt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE,"aG",@progbits,_ZTSSt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE,comdat
	.align 32
	.type	_ZTSSt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE, @object
	.size	_ZTSSt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE, 54
_ZTSSt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE:
	.string	"St5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE"
	.weak	_ZTISt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE
	.section	.rodata._ZTISt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE,"aG",@progbits,_ZTISt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE,comdat
	.align 8
	.type	_ZTISt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE, @object
	.size	_ZTISt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE, 24
_ZTISt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt5_BindIFPFdiiddESt12_PlaceholderILi1EES2_ILi2EEddEE
	.quad	_ZTISt17_Weak_result_typeIPFdiiddEE
	.data
	.align 4
	.type	_ZZN3PDE8GSPreConEP4GridS1_E8timer_id, @object
	.size	_ZZN3PDE8GSPreConEP4GridS1_E8timer_id, 4
_ZZN3PDE8GSPreConEP4GridS1_E8timer_id:
	.long	-1
	.align 4
	.type	_ZZN3PDE12applyStencilEP4GridS1_E8timer_id, @object
	.size	_ZZN3PDE12applyStencilEP4GridS1_E8timer_id, 4
_ZZN3PDE12applyStencilEP4GridS1_E8timer_id:
	.long	-1
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC1:
	.quad	0
	.quad	2
	.quad	4
	.quad	6
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	1413754136
	.long	1074340347
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC9:
	.long	2696277389
	.long	1051772663
	.align 8
.LC10:
	.long	0
	.long	1073741824
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 8.5.0 20210514 (Red Hat 8.5.0-26)"
	.section	.note.GNU-stack,"",@progbits
