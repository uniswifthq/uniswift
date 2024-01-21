	.text
	.intel_syntax noprefix
	.code16
	.file	"setup.c"
	.globl	copy_boot_params                # -- Begin function copy_boot_params
	.p2align	4, 0x90
	.type	copy_boot_params,@function
copy_boot_params:                       # @copy_boot_params
	.cfi_startproc
# %bb.0:
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset ebp, -8
	mov	ebp, esp
	.cfi_def_cfa_register ebp
	sub	esp, 12
	lea	ecx, [boot_params]
	add	ecx, 489
	lea	eax, [hdr]
	mov	dword ptr [esp], ecx
	mov	dword ptr [esp + 4], eax
	mov	dword ptr [esp + 8], 111
	call	memcpy
	add	esp, 12
	pop	ebp
	.cfi_def_cfa esp, 4
	ret
.Lfunc_end0:
	.size	copy_boot_params, .Lfunc_end0-copy_boot_params
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 # @memcpy
	.cfi_startproc
# %bb.0:
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset ebp, -8
	mov	ebp, esp
	.cfi_def_cfa_register ebp
	sub	esp, 8
	mov	eax, dword ptr [ebp + 16]
	mov	eax, dword ptr [ebp + 12]
	mov	eax, dword ptr [ebp + 8]
	mov	eax, dword ptr [ebp + 8]
	mov	dword ptr [ebp - 4], eax
	mov	eax, dword ptr [ebp + 12]
	mov	dword ptr [ebp - 8], eax
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [ebp + 16]
	mov	ecx, eax
	add	ecx, -1
	mov	dword ptr [ebp + 16], ecx
	cmp	eax, 0
	je	.LBB1_3
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	mov	eax, dword ptr [ebp - 8]
	mov	ecx, eax
	add	ecx, 1
	mov	dword ptr [ebp - 8], ecx
	mov	cl, byte ptr [eax]
	mov	eax, dword ptr [ebp - 4]
	mov	edx, eax
	add	edx, 1
	mov	dword ptr [ebp - 4], edx
	mov	byte ptr [eax], cl
	jmp	.LBB1_1
.LBB1_3:
	mov	eax, dword ptr [ebp + 8]
	add	esp, 8
	pop	ebp
	.cfi_def_cfa esp, 4
	ret
.Lfunc_end1:
	.size	memcpy, .Lfunc_end1-memcpy
	.cfi_endproc
                                        # -- End function
	.globl	setup                           # -- Begin function setup
	.p2align	4, 0x90
	.type	setup,@function
setup:                                  # @setup
	.cfi_startproc
# %bb.0:
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset ebp, -8
	mov	ebp, esp
	.cfi_def_cfa_register ebp
	push	eax
	call	copy_boot_params
	movzx	eax, word ptr [boot_params+502]
	and	eax, 65280
	sar	eax, 8
                                        # kill: def $al killed $al killed $eax
	movsx	eax, al
	sub	eax, 135
                                        # kill: def $al killed $al killed $eax
	mov	byte ptr [ebp - 1], al
	mov	al, byte ptr [ebp - 1]
	#APP

	mov	ah, 14
	mov	al, al
	int	16


	#NO_APP
	#APP

	mov	ah, 14
	mov	al, 72
	int	16


	#NO_APP
	#APP

	mov	ah, 14
	mov	al, 72
	int	16


	#NO_APP
	add	esp, 4
	pop	ebp
	.cfi_def_cfa esp, 4
	ret
.Lfunc_end2:
	.size	setup, .Lfunc_end2-setup
	.cfi_endproc
                                        # -- End function
	.ident	"Homebrew clang version 17.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym copy_boot_params
	.addrsig_sym memcpy
	.addrsig_sym boot_params
	.addrsig_sym hdr
