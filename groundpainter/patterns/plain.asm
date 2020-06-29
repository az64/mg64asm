//------------------------------------------------------------//
// Block colour                                               //
//------------------------------------------------------------//
.func patternPlain
	addiu	sp, sp, 0xFFC0
	sw	    ra, 0x003C(sp)
	andi	a1, a1, 0x0F
	addu	a0, a2, r0
	bne	    a1, r0, @@useColourRange
	nop
	jal	    painterGetColour
	nop
	j	    @@patternPlainEnd
	nop
@@useColourRange:
	jal	    painterGetColourRange
	nop
@@patternPlainEnd:
	lw	    ra, 0x003C(sp)
	addiu	sp, sp, 0x0040
	jr	    ra
	nop
.endfunc