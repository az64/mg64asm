//------------------------------------------------------------//
// Recalculate cumulative tournament scores for CPUs          //
//------------------------------------------------------------//
.func recalculateCumulativeTournamentScore
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    jal     getHackEnabledFlag
    li      a0, recalculateTournamentScoreFlag
    bne     v0, r0, @@recalculate
    nop
    lw      v0, currentCourseNumber
    lui     v1, hi(tournamentCpuScoreModifier)
    addu    v1, v1, s7
    b       @@recalculateCumulativeTournamentScoreEnd
    li      t0, 0
@@recalculate:
    lw      t0, currentCourseNumber
    sll     t1, t0, 0x2
    lui     t2, hi(modTable + 2)
    addu    t2, t2, t1
    lb      v0, lo(modTable + 2)(t2)
    lui     v1, hi(tournamentCpuScoreModifier)
    addu    v1, v1, s7
    lb      v1, lo(tournamentCpuScoreModifier)(v1)
    addiu   v0, v0, 0xFFFF
    jal     getRandomInt
    addu    s1, v1, v0
    li      t0, 1
@@recalculateCumulativeTournamentScoreEnd:
    lw      ra, 0x001C(sp)
    addiu   sp, sp, 0x0020
    jr      ra
    nop
.endfunc