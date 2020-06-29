//------------------------------------------------------------//
// Get the colour at the current position                     //
//------------------------------------------------------------//
.func painterGetGroundColour
    beq     a0, r0, @@isFairway
    li      t0, typeGreen
    bne     a0, t0, @@isNotGreen
    nop
    li      v1, 0x0001
    xor     v0, a0, a1
    sltu    v0, r0, v0
    and     v1, v1, v0
    beq     v1, r0, @@isNotGreen
    slti    v0, a2, 0x0002
    beq     v0, r0, @@isNotGreen
    nop
    j       @@isNotGreen
    li      a0, typeGreenEdge
@@isFairway:
    slti    v1, a2, 0x0002
    xori    v1, v1, 0x0001
    xori    v0, a1, 0x0006
    sltiu   v0, v0, 0x0001
    or      v1, v1, v0
    bne     v1, r0, @@isNotGreen
    nop
    bnel    a1, r0, @@isNotGreen
    addiu   a0, r0, typeSemiRough
@@isNotGreen:
    addiu   sp, sp, 0xFFD0
    sw      ra, 0x002C(sp)
    sw      s0, 0x001C(sp)
    sw      s1, 0x0020(sp)
    sw      s2, 0x0024(sp)
    sw      s3, 0x0028(sp)
    addu    s0, a0, r0
    addu    s1, a3, r0
    lw      s2, 0x0040(sp)
    lw      v1, painterCourseNumber
    lui     at, hi(groundPaintSetIndexTable)
    addu    at, at, v1
    lb      v0, lo(groundPaintSetIndexTable)(at)
    la      s3, painterSetTable
    sll     v1, v0, 1
    addu    v1, v1, v0
    sll     v1, v1, 1
    addu    v1, v1, v0
    sll     v1, v1, 1
    addu    v1, v1, v0
    sll     v0, v1, 4
    sll     v1, s0, 2
    addu    v1, v1, s0
    sll     v1, v1, 2
    addu    v0, v0, v1
    addu    s3, s3, v0
    lb      v1, 0x0000(s3)
    slt     v0, v1, r0
    beql    v0, r0, @@typeSwapped
    addu    s0, v1, r0
@@typeSwapped:
    lbu     a0, 0x0002(s3)
    lbu     a1, 0x0003(s3)
    addiu   a2, s3, 0x0004
    sll     a3, s1, 16
    or      a3, a3, s2
    lbu     v0, 0x0001(s3)
    andi    v1, v0, 0xF0
    andi    v0, v0, 0x0F
    srl     v1, v1, 4
    sll     v0, v0, 2
    lui     t0, hi(painterPatternJumpTable)
    addu    t0, t0, v0
    lw      t1, lo(painterPatternJumpTable)(t0)
    jalr    t1, ra
    nop
    sll     v1, v0, 16
    or      v0, v1, s0
    lw      ra, 0x002C(sp)
    lw      s0, 0x001C(sp)
    lw      s1, 0x0020(sp)
    lw      s2, 0x0024(sp)
    lw      s3, 0x0028(sp)
    addiu   sp, sp, 0x0030
    jr      ra
    nop
.endfunc