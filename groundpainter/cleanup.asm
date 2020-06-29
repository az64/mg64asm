//------------------------------------------------------------//
// Reset registers and return                                 //
//------------------------------------------------------------//
.func painterCleanup
    lw      s6, 0x0020(sp)
    lw      s5, 0x0024(sp)
    lw      s4, 0x0028(sp)
    lw      s0, 0x0038(sp)
    lw      s1, 0x0034(sp)
    lw      s2, 0x0030(sp)
    lw      s3, 0x002C(sp)
    lw      ra, 0x003C(sp)
    addiu   sp, sp, 0x0040
    jr      ra
    nop
.endfunc