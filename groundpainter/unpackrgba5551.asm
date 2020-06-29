//------------------------------------------------------------//
// Unpack a RGBA5551 to RGB values                            //
//------------------------------------------------------------//
.func painterUnpackRgba5551
	srl	    t7, a0, 0xB
	srl	    t8, a0, 0x6
	srl	    t9, a0, 0x1
	andi	t7, t7, 0x1F
	andi	t8, t8, 0x1F
	jr	    ra
	andi	t9, t9, 0x1F
.endfunc