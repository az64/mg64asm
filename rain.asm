//------------------------------------------------------------//
// Recalculate rain                                           //
//------------------------------------------------------------//
.func recalculateRainForHole
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    lw      v0, currentHoleNumber
    beq     v0, r0, @@setNoRain
    li      t0, 3
    beq     v1, t0, @@setNoRain
    li      a0, recalculateRainForHoleFlag
    jal     getHackEnabledFlag
    nop
    beq     v0, r0, @@recalculateRainForHoleEnd
    nop
@@recalculate:
	jal	    getRandomShort
	nop
	mtc1	v0, f0
	lui	    at, 0x42C8
	cvt.s.w	f6, f0
	nop
	lui	    a0, 0x4700
	addiu	a0, a0, 0xFE00
	mtc1	at, f2
	mtc1	a0, f4
	nop
	lw	    v0, currentCourseNumber
	sll	    v0, v0, 0x2
	lui	    a1, hi(modTable + 1)
	addu	a1, a1, v0
	div.s	f8, f2, f4
	mul.s	f0, f8, f6
	cvt.w.s	f0, f0
	lb	    a2, lo(modTable + 1)(a1)
	mfc1	v0, f0
	nop
	slt	    v1, v0, a2
	sw      v1, weatherRainFlag
    b       @@recalculateRainForHoleEnd
    li      v0, 1
@@setNoRain:
    sw      r0, weatherRainFlag
    li      v0, 1
@@recalculateRainForHoleEnd:
    lw      ra, 0x001C(sp)
    addiu   sp, sp, 0x0020
    jr      ra
    nop
.endfunc