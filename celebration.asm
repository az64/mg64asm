//------------------------------------------------------------//
// Skip hole celebration animations                           //
//------------------------------------------------------------//
.func holeCelebrationAnimationSkip
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    sw      v0, 0x0018(sp)
    sw      v1, 0x0014(sp)
    jal     getHackEnabledFlag
    li      a0, holeCelebrationAnimationSkipFlag
    beqz    v0, @@holeCelebrationOriginal
    nop
    lhu     a0, activePlayerController
    andi    t0, a0, controllerButtonA
    beqz    t0, @@holeCelebrationOriginal
    li      v0, 0
    li      t1, -1
    sw      t1, holeResultGraphicCounter
    lui     t0, hi(birdieBadgesCounterDisplayFlag)
    sw      r0, lo(birdieBadgesCounterDisplayFlag)(t0)
    b       @@holeCelebrationAnimationSkipEnd
    sw      r0, lo(birdieBadgesCounterDisplayFrame)(t0)
@@holeCelebrationOriginal:
    lw      v1, 0x0014(sp)
    lw      v0, 0x0018(sp)
    slt     v0, v0, v1
@@holeCelebrationAnimationSkipEnd:
    lw      ra, 0x001C(sp)
    addiu   sp, sp, 0x0020
    jr      ra
    nop
.endfunc