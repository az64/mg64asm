//------------------------------------------------------------//
// Checkers pattern                                           //
//------------------------------------------------------------//
.func patternCheckers
	addiu	sp, sp, 0xFFC0
	sw	    ra, 0x003C(sp)
	jal	    painterGetVariables
	nop
	sw	    s6, 0x001C(sp)
	addiu	s6, r0, 0x0002
	addu	a0, s4, r0
	jal	    painterGetColourIndex
	addu	a1, s0, r0
	addu	s0, v0, r0
	addu	a0, s5, r0
	jal	    painterGetColourIndex
	addu	a1, s1, r0
	lw	    s6, 0x001C(sp)
	sltiu	v1, s6, 0x0003
	bnel	v1, r0, @@simple
	xor	    v0, v0, s0
	sll	    v1, v0, 0x1
	addu	v0, v1, s0
	divu	v0, s6
	mfhi	v0
	nop
@@simple:
	sll	    v0, v0, 0x2
	bne	    s3, r0, @@useColourRange
	nop
	jal	    painterGetColour
	addu	a0, a2, v0
	j	    @@patternCheckersEnd
	nop
@@useColourRange:
	jal	    painterGetColourRange
	addu	a0, a2, v0
@@patternCheckersEnd:
	j	    painterCleanup
	nop
.endfunc