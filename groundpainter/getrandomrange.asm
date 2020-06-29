//------------------------------------------------------------//
// Get a random int in the given range                        //
//------------------------------------------------------------//
.func painterGetRandomRange
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    sw      s0, 0x0018(sp)
    sw      s1, 0x0014(sp)
    slt     t2, a0, a1
    bne     t2, r0, @@correctArgumentOrder
    addu    t3, a0, r0
    addu    a0, a1, r0
    addu    a1, t3, r0
@@correctArgumentOrder:
    addu    s0, a0, r0
    jal     painterGetRandomInt
    addiu   s1, a1, 0x0001
    srl     v1, v0, 0x10
    subu    s1, s1, s0
    divu    v1, s1
    mfhi    v0
    lw      ra, 0x001C(sp)
    addu    v0, v0, s0
    lw      s0, 0x0018(sp)
    lw      s1, 0x0014(sp)
    addiu   sp, sp, 0x0020
    jr      ra
    nop
.endfunc