//------------------------------------------------------------//
// Gradient patterns                                          //
//------------------------------------------------------------//
.func gradientInterpolate
	mtc1	a0, f4
	mtc1	a1, f6
	cvt.s.w	f4, f4
	cvt.s.w	f6, f6
	sub.s	f16, f12, f14
	mul.s	f8, f4, f14
	mul.s	f10, f6, f16
	add.s	f4, f8, f10
	round.w.s	f6, f4
	jr	    ra
	mfc1	v0, f6
.endfunc

.func getGradientPattern
	addiu	sp, sp, 0xFFE0
	sw	    ra, 0x001C(sp)
	sw	    s0, 0x0014(sp)
	beq	    a0, r0, @@noColourRange
	addu	s0, a1, r0
	jal	    painterGetColourRange
	addu	a0, s0, r0
	sw	    v0, 0x0018(sp)
	jal	    painterGetColourRange
	addiu	a0, s0, 0x0004
	j	    @@makeGradient
	nop
@@noColourRange:
	jal	    painterGetColour
	addu	a0, s0, r0
	sw	    v0, 0x0018(sp)
	jal	    painterGetColour
	addiu	a0, s0, 0x0004
@@makeGradient:
	sw		v0, 0x0010(sp)
	div.s	f14, f14, f12
	lui	    at, 0x3F80
	mtc1	at, f12
	jal	    painterUnpackRgba5551
	addu	a0, v0, r0
	addu	t0, t7, r0
	addu	t1, t8, r0
	addu	t2, t9, r0
	jal	    painterUnpackRgba5551
	lw	    a0, 0x0018(sp)
	addu	a0, t0, r0
	jal	    gradientInterpolate
	addu	a1, t7, r0
	addu	t0, v0, r0
	addu	a0, t1, r0
	jal	    gradientInterpolate
	addu	a1, t8, r0
	addu	t1, v0, r0
	addu	a0, t2, r0
	jal	    gradientInterpolate
	addu	a1, t9, r0
	lw		t0, 0x0010(sp)
	lw		t1, 0x0018(sp)
	or		t2, t0, t1
	andi	a3, t2, 1	
	addu	a0, t0, r0
	addu	a1, t1, r0
	jal	    painterPackRgba5551
	addu	a2, v0, r0
	lw	    s0, 0x0014(sp)
	lw	    ra, 0x001C(sp)
	addiu	sp, sp, 0x0020
	jr	    ra
	nop
.endfunc

.func patternGradientHorizontal
	addiu	sp, sp, 0xFFC0
	sw	    ra, 0x003C(sp)
	jal	    painterGetVariables
	nop
	addu	a0, s3, r0
	addu	a1, a2, r0
	lui	    at, 0x437F
	mtc1	at, f12
	mtc1	s4, f14
	cvt.s.w	f14, f14
	jal	    getGradientPattern
	nop
	j	    painterCleanup
	nop
.endfunc

.func patternGradientVertical
	addiu	sp, sp, 0xFFC0
	sw	    ra, 0x003C(sp)
	jal	    painterGetVariables
	nop
	addu	a0, s3, r0
	addu	a1, a2, r0
	lui	    at, 0x43FF
	ori	    at, at, 0x8000
	mtc1	at, f12
	mtc1	s5, f14
	cvt.s.w	f14, f14
	jal	    getGradientPattern
	nop
	j	    painterCleanup
	nop
.endfunc