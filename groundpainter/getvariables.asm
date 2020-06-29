//------------------------------------------------------------//
// Get variables used by painters                             //
//------------------------------------------------------------//
.func painterGetVariables
	sw	    s0, 0x0038(sp)
	sw	    s1, 0x0034(sp)
	sw	    s2, 0x0030(sp)
	sw	    s3, 0x002C(sp)
	sw	    s4, 0x0028(sp)
	sw	    s5, 0x0024(sp)
	sw	    s6, 0x0020(sp)
	andi	s0, a0, 0xF0
	andi	s1, a0, 0x0F
	andi	s2, a1, 0xF0
	andi	s3, a1, 0x0F
	srl	    s0, s0, 0x4
	srl	    s2, s2, 0x4
	srl	    s4, a3, 0x10
	addiu	s0, s0, 0x0001
	addiu	s1, s1, 0x0001
	addiu	s2, s2, 0x0001
	addu	s6, v1, r0
	andi	s4, s4, 0xFFFF
	jr	    ra
	andi	s5, a3, 0xFFFF
.endfunc