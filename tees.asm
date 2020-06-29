//------------------------------------------------------------//
// Recalculate the y co-ordinate of the tee - can't assume    //
// that these are always placed correctly by the user         //
//------------------------------------------------------------//
.func recalculateTeePosition
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    lui     at, hi(activeTeePositionX)
    lw      a0, lo(activeTeePositionX)(at)
    lw      a1, lo(activeTeePositionZ)(at)
    jal     getSurfaceHeight
    sw      v0, lo(activePinPositionY)(at)
    lui     at, hi(activeTeePositionY)
    lw      ra, 0x001C(sp)
    addiu   sp, sp, 0x0020
    jr      ra
    sw      v0, lo(activeTeePositionY)(at)
.endfunc