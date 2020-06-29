//------------------------------------------------------------//
// Sine patterns                                              //
//------------------------------------------------------------//
.func getSinePattern
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    jal     painterGetPi
    nop
    mtc1    v0, f4
    mtc1    s5, f6
    cvt.s.w f6, f6
    mtc1    s1, f10
    cvt.s.w f10, f10
    mtc1    at, f8
    div.s   f6, f6, f8
    mul.s   f4, f4, f10
    mul.s   f12, f4, f6
    jal     sinF
    nop
    mtc1    s2, f4
    cvt.s.w f4, f4
    mul.s   f6, f4, f0
    round.w.s   f8, f6
    mfc1    a0, f8
    addu    a0, a0, s4
    addu    a1, s0, r0
    jal     painterGetColourFromPosition
    addu    a3, s3, r0
    lw      ra, 0x001C(sp)
    addiu   sp, sp, 0x0020
    jr      ra
    nop
.endfunc

.func patternSineVertical
    addiu   sp, sp, 0xFFC0
    sw      ra, 0x003C(sp)
    jal     painterGetVariables
    nop
    lui     at, 0x43FF
    ori     at, at, 0x8000
    jal     getSinePattern
    nop
    j       painterCleanup
    nop
.endfunc

.func patternSineHorizontal
    addiu   sp, sp, 0xFFC0
    sw      ra, 0x003C(sp)
    jal     painterGetVariables
    nop
    lui     at, 0x437F
    addu    t0, s4, r0
    addu    s4, s5, r0
    jal     getSinePattern
    addu    s5, t0, r0
    j       painterCleanup
    nop
.endfunc