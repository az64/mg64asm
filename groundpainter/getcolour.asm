//------------------------------------------------------------//
// Get the current colour                                     //
//------------------------------------------------------------//
.func painterGetColour
    jr      ra
    lhu     v0, 0x0000(a0)
.endfunc

//------------------------------------------------------------//
// Get a random colour between two colours                    //
//------------------------------------------------------------//
.func painterGetColourRange
    addiu   sp, sp, 0xFFD0
    sw      ra, 0x002C(sp)
    sw      s0, 0x0028(sp)
    sw      s1, 0x0024(sp)
    sw      s2, 0x0020(sp)
    sw      s3, 0x001C(sp)
    jal     painterGetColour
    addu    s0, a0, r0
    sw      v0, 0x0018(sp)
    jal     painterUnpackRgba5551
    addu    a0, v0, r0
    addu    s1, t7, r0
    addu    s2, t8, r0
    addu    s3, t9, r0
    jal     painterGetColour
    addiu   a0, s0, 0x0002
    sw      v0, 0x0014(sp)
    jal     painterUnpackRgba5551
    addu    a0, v0, r0
    addu    a0, s1, r0
    jal     painterGetRandomRange
    addu    a1, t7, r0
    addu    s1, v0, r0
    addu    a0, s2, r0
    jal     painterGetRandomRange
    addu    a1, t8, r0
    addu    s2, v0, r0
    addu    a0, s3, r0
    jal     painterGetRandomRange
    addu    a1, t9, r0
    lw      t0, 0x0014(sp)
    lw      t1, 0x0018(sp)
    or      t2, t0, t1
    andi    a3, t2, 1
    addu    a2, v0, r0
    addu    a1, s2, r0
    jal     painterPackRgba5551
    addu    a0, s1, r0
    lw      s3, 0x001C(sp)
    lw      s0, 0x0028(sp)
    lw      s1, 0x0024(sp)
    lw      s2, 0x0020(sp)
    lw      ra, 0x002C(sp)
    addiu   sp, sp, 0x0030
    jr      ra
    nop
.endfunc

//------------------------------------------------------------//
// Get colour from current position                           //
//------------------------------------------------------------//
.func painterGetColourFromPosition
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    sw      a2, 0x0018(sp)
    sw      a3, 0x0014(sp)
    jal     painterGetColourIndex
    nop
    lw      t0, 0x0014(sp)
    lw      a0, 0x0018(sp)
    sll     v0, v0, 0x1
    bnel    t0, r0, @@useColourRange
    sll     v0, v0, 0x1
    jal     painterGetColour
    addu    a0, a0, v0
    j       @@painterGetColourFromPositionEnd
    nop
@@useColourRange:
    jal     painterGetColourRange
    addu    a0, a0, v0
@@painterGetColourFromPositionEnd:
    lw      ra, 0x001C(sp)
    jr      ra
    addiu   sp, sp, 0x0020
.endfunc

//------------------------------------------------------------//
// Get the colour index to use                                //
//------------------------------------------------------------//
.func painterGetColourIndex
    multu   s6, a1
    mflo    t0
    addu    t2, r0, r0
    div     a0, t0
    mfhi    v0
    addu    t4, r0, r0
    slt     t1, v0, r0
    bnel    t1, r0, @@checkPositionLoop
    addu    v0, v0, t0
@@checkPositionLoop:
    addiu   t2, t2, 0x0001
    multu   t2, a1
    mflo    t3
    slt     v1, v0, t3
    beql    v1, r0, @@checkPositionLoop
    addiu   t4, t4, 0x0001
    jr      ra
    addu    v0, t4, r0
.endfunc