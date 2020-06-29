//------------------------------------------------------------//
// Recalculate wind speed                                     //
//------------------------------------------------------------//
.func recalculateWindSpeed
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    la      s2, currentHoleNumber
    jal     getHackEnabledFlag
    li      a0, recalculateWindSpeedFlag
    bne     v0, r0, @@recalculate
    nop
    li      s0, baseLowerWindCutoff
    b       @@recalculateWindSpeedEnd
    nop
@@recalculate:
    li      s0, hackLowerWindCutoff
    jal     getRandomShort
    nop
    mtc1    v0, f0
    lui     at, 0x461C
    addiu   at, at, 0x4000
    cvt.s.w f6, f0
    nop
    lui     a0, 0x4700
    addiu   a0, a0, 0xFE00
    mtc1    at, f2
    mtc1    a0, f4
    nop
    lw      v0, 0xFFFC(s2)
    sll     v0, v0, 0x2
    lui     a1, hi(modTable)
    addu    a1, a1, v0
    lb      a0, lo(modTable)(a1)
    sll     a2, a0, 0x1
    addu    a2, a2, a0
    mtc1    a2, f12
    nop
    cvt.s.w f12, f12
    div.s   f8, f2, f4
    mul.s   f0, f8, f6
    mul.s   f10, f12, f0
    cvt.w.s f10, f10
    nop
    mfc1    v0, f10
    nop
    slt     v1, v0, s0
    beql    v1, r0, @@recalculateWindSpeedEnd
    sw      v0, 0x0000(s1)
    sw      r0, 0x0000(s1)
    li      v0, 1
@@recalculateWindSpeedEnd:
    lw      ra, 0x001C(sp)
    addiu   sp, sp, 0x0020
    jr      ra
    nop
.endfunc

    .definelabel baseLowerWindCutoff, 0x17FFF
    .definelabel hackLowerWindCutoff, 0x9C40