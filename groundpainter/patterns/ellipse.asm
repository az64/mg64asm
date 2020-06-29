//------------------------------------------------------------//
// Elliptical pattern                                         //
//------------------------------------------------------------//
.func patternEllipse
	addiu	sp, sp, 0xFFC0
	sw	    ra, 0x003C(sp)
	jal	    painterGetVariables
	nop
	addiu	t0, s4, 0xFF81
	addiu	t1, s5, 0xFF01
	mtc1	t0, f4
	mtc1	t1, f6
	cvt.s.w	f4, f4
	cvt.s.w	f6, f6
	mtc1	s1, f12
	mtc1	s2, f14
	cvt.s.w	f12, f12
	cvt.s.w	f14, f14
	mul.s	f8, f4, f4
	mul.s	f10, f6, f6
	div.s	f4, f8, f12
	div.s	f6, f10, f14
	add.s	f8, f4, f6
	sqrt.s	f10, f8
	round.w.s	f4, f10
	mfc1	a0, f4
	addu	a1, s0, r0
	jal	    painterGetColourFromPosition
	addu	a3, s3, r0
	j	    painterCleanup
	nop
.endfunc