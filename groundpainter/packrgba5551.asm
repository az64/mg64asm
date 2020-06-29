//------------------------------------------------------------//
// Get RGBA5551 from RGB values                               //
//------------------------------------------------------------//
.func painterPackRgba5551
	andi	a0, a0, 0x1F
	andi	a1, a1, 0x1F
	andi	a2, a2, 0x1F
	sll	    v0, a0, 0xB
	sll	    v1, a1, 0x6
	or	    v0, v0, v1
	sll	    v1, a2, 0x1
	or	    v0, v0, v1
	jr	    ra
	or	    v0, v0, a3
.endfunc