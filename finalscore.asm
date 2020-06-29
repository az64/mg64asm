//------------------------------------------------------------//
// Recalculate final tournament scores for CPUs               //
//------------------------------------------------------------//
.func recalculateFinalTournamentScore
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    jal     getHackEnabledFlag
    li      a0, recalculateTournamentScoreFlag
    bne     v0, r0, @@recalculate
    nop
    lw      v0, currentCourseNumber
    sll     v0, v0, 1
    subu    v0, r0, v0
    b       @@recalculateFinalTournamentScoreEnd
    li      t0, 0
@@recalculate:
    lw      t0, currentCourseNumber
    sll     t1, t0, 0x2
    lui     t2, hi(modTable + 2)
    addu    t2, t2, t1
    lb      v0, lo(modTable + 2)(t2)
    addu    v1, v0, r0
    slt     v0, v1, s1
    li      t0, 1
    beql    v0, r0, @@scoreTooLow
    addu    s1, v1, r0
@@scoreTooLow:
    slti    v0, s1, scoreLowerLimit
    beq     v0, r0, @@scoreInRange
    slti    v0, s1, scoreUpperLimit + 1
    j       @@recalculateFinalTournamentScoreEnd
    addiu   s1, r0, scoreLowerLimit
@@scoreInRange:
    beql    v0, r0, @@recalculateFinalTournamentScoreEnd
    li      s1, scoreUpperLimit
@@recalculateFinalTournamentScoreEnd:
    lw      ra, 0x001C(sp)
    addiu   sp, sp, 0x0020
    jr      ra
    nop
.endfunc

    .definelabel scoreLowerLimit, -21
    .definelabel scoreUpperLimit, 18