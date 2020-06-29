//------------------------------------------------------------//
// Stripe patterns                                            //
//------------------------------------------------------------//
.func patternStripesVertical
	addiu	sp, sp, 0xFFC0
	sw	    ra, 0x003C(sp)
	jal	    painterGetVariables
	nop
	addu	a0, s4, r0
	addu	a1, s0, r0
	jal	    painterGetColourFromPosition
	addu	a3, s3, r0
	j	    painterCleanup
	nop
.endfunc

.func patternStripesHorizontal
	addiu	sp, sp, 0xFFC0
	sw	    ra, 0x003C(sp)
	jal	    painterGetVariables
	nop
	addu	a0, s5, r0
	addu	a1, s0, r0
	jal	    painterGetColourFromPosition
	addu	a3, s3, r0
	j	    painterCleanup
	nop
.endfunc