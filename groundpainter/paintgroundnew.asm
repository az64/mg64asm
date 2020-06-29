//------------------------------------------------------------//
// Custom ground painting function                            //
//------------------------------------------------------------//
.func paintGroundNew
    addiu   sp, sp, 0xFDD0
    sw      ra, 0x022C(sp)
    sw      s8, 0x0228(sp)
    sw      s7, 0x0224(sp)
    sw      s6, 0x0220(sp)
    sw      s5, 0x021C(sp)
    sw      s4, 0x0218(sp)
    sw      s3, 0x0214(sp)
    sw      s2, 0x0210(sp)
    sw      s1, 0x020C(sp)
    sw      s0, 0x0208(sp)
    jal     initialisePainterRandomSeed
    li      a0, 0
    jal     initialiseGroundMap
    nop
    li      a0, 5
    addiu   a1, sp, 0x0018
    jal     setGroundBorderTypes
    li      a2, 100
    addu    s8, v0, r0
    lw      v1, painterCourseNumber
    sll     v0, v1, 2
    addu    v0, v0, v1
    sll     v0, v0, 2
    la      v1, painterCourseProperties
    addu    v0, v0, v1
    sw      v0, 0x01F4(sp)
    li      s1, 0
    li      s0, 0
    addiu   s5, sp, 0x0018
    lw      s6, groundMapFilePointer
    sw      s6, 0x01EC(sp)
@@painterLoopY:
    andi    v0, s1, 0x001F
    sll     v0, v0, 6
    la      t4, groundPaintMap
    addu    t3, v0, t4
    srl     v0, s1, 4
    sll     s7, v0, 5
    andi    v0, s1, 0x000F
    sll     s2, v0, 3
@@painterLoopX:
    bgez    s0, @@painterNonNegativeX
    addu    v1, s0, r0
    addiu   v1, s0, 0x001F
@@painterNonNegativeX:
    addu    v0, s1, r0
    bgez    s1, @@painterNonNegativeY
    sra     a0, v1, 5
    addiu   v0, s1, 0x001F
@@painterNonNegativeY:
    sra     v1, v0, 5
    sll     v1, v1, 3
    addu    v1, a0, v1
    sll     v0, v1, 2
    addu    v0, v0, v1
    sll     v0, v0, 9
    addu    s4, v0, t3
    addu    s3, r0, r0
@@painterLoopInner:
    lbu     a1, 0x0000(s6)
    lw      t4, 0x01F4(sp)
    addu    v0, t4, a1
    lb      a2, 0x0000(v0)
    addiu   s6, s6, 0x0001
    beqz    a2, @@thisGroundPropertyZero
    addu    a0, a1, r0
    b       @@thisGroundPropertyNonZero
    li      t2, 1
@@thisGroundPropertyNonZero:
    slt     v0, t2, s8
    beqz    v0, @@noSearch
    sll     a2, a2, 8
    addiu   t1, s5, 0x0004
@@borderLoopStart:
    lhu     v0, 0x0002(t1)
    slt     v0, v0, a2
    beqz    v0, @@stopSearch
    sll     v0, t2, 2
    lb      v0, 0x0000(t1)
    lb      v1, 0x0001(t1)
    addu    t0, s0, v0
    addu    a3, s1, v1
    sltiu   v1, t0, groundMapWidth
    sltiu   v0, a3, groundMapHeight
    and     v1, v1, v0
    beqzl   v1, @@invalidPoint
    addiu   t2, t2, 0x0001
    lw      t4, 0x01EC(sp)
    sll     v0, a3, 8
    addu    v0, v0, t0
    addu    v0, t4, v0
    lbu     a1, 0x0000(v0)
    bne     a1, a0, @@stopSearch
    sll     v0, t2, 2
    addiu   t2, t2, 0x0001
@@invalidPoint:
    slt     v0, t2, s8
    bnez    v0, @@borderLoopStart
    addiu   t1, t1, 0x0004
@@noSearch:
    sll     v0, t2, 2
@@stopSearch:
    addu    v0, s5, v0
    lhu     v0, 0x0002(v0)
    srl     a2, v0, 8
@@thisGroundPropertyZero:
    addu    a3, s0, r0
    sw      s1, 0x0010(sp)
    jal     painterGetGroundColour
    sw      t3, 0x0200(sp)
    addu    v1, v0, r0
    lw      t3, 0x0200(sp)
    srl     v0, v1, 16
    sh      v0, 0x0000(s4)
    addiu   s4, s4, 0x0002
    srl     v0, s0, 4
    sll     v0, v0, 1
    addu    a2, v0, s7
    lui     a1, hi(groundMapTemp)
    addu    a1, a1, a2
    lh      a1, lo(groundMapTemp)(a1)
    andi    a3, v1, 0x000F
    beq     a1, a3, @@painterLoopInnerEnd1
    addu    a0, a3, r0
    addiu   v0, r0, 0xFFFF
    bne     a1, v0, @@typeAlreadySet
    nop
    lui     at, hi(groundMapTemp)
    addu    at, at, a2
    sh      a3, lo(groundMapTemp)(at)
    b       @@painterLoopInnerEnd2
    addiu   s3, s3, 0x0001
@@typeAlreadySet:
    bltz    a1, @@setTypeByte
    andi    v0, s0, 0x0001
    lw      v1, groundMapCounter
    slti    v0, v1, 0x0180
    beql    v0, r0, @@painterLoopInnerEnd2
    addiu   s3, s3, 0x0001
    sll     v0, a1, 4
    or      a1, v0, a1
    addiu   v0, v1, 0x0001
    sw      v0, groundMapCounter
    sll     v0, a1, 8
    or      a1, a1, v0
    sll     v0, a1, 16
    or      a1, a1, v0
    addu    a2, v1, r0
    sll     v1, a2, 7
    la      v0, groundTypeMap
    addu    v1, v1, v0
    li      v0, 0x001F
@@storeGroundTypeLoop:
    sw      a1, 0x0000(v1)
    addiu   v0, v0, 0xFFFF
    bgez    v0, @@storeGroundTypeLoop
    addiu   v1, v1, 0x0004
    srl     v0, s0, 4
    sll     v0, v0, 1
    addu    v0, v0, s7
    ori     v1, a2, 0x8000
    lui     at, hi(groundMapTemp)
    addu    at, at, v0
    sh      v1, lo(groundMapTemp)(at)
    andi    v0, s0, 0x0001
    beqz    v0, @@evenIndex
    andi    v0, s0, 0x000F
    srl     v0, v0, 1
    addu    v0, v0, s2
    sll     v1, a2, 7
    addu    v0, v0, v1
    lui     v1, hi(groundTypeMap)
    addu    v1, v1, v0
    lbu     v1, lo(groundTypeMap)(v1)
    andi    v1, v1, 0x00F0
    or      v1, v1, a0
    lui     at, hi(groundTypeMap)
    addu    at, at, v0
    sb      v1, lo(groundTypeMap)(at)
    b       @@painterLoopInnerEnd2
    addiu   s3, s3, 0x0001
@@evenIndex:
    andi    v1, s0, 0x000F
    srl     v1, v1, 1
    addu    v1, v1, s2
    b       @@setTypeUpper2
    sll     v0, a2, 7
@@setTypeByte:
    beqz    v0, @@setTypeUpper1
    andi    v0, s0, 0x000F
    srl     v0, v0, 1
    addu    v0, v0, s2
    andi    v1, a1, 0x7FFF
    sll     v1, v1, 7
    addu    v0, v0, v1
    lui     v1, hi(groundTypeMap)
    addu    v1, v1, v0
    lbu     v1, lo(groundTypeMap)(v1)
    andi    v1, v1, 0x00F0
    or      v1, v1, a3
    lui     at, hi(groundTypeMap)
    addu    at, at, v0
    sb      v1, lo(groundTypeMap)(at)
    b       @@painterLoopInnerEnd2
    addiu   s3, s3, 0x0001
@@setTypeUpper1:
    andi    v1, s0, 0x000F
    srl     v1, v1, 1
    addu    v1, v1, s2
    andi    v0, a1, 0x7FFF
    sll     v0, v0, 7
@@setTypeUpper2:
    addu    v1, v1, v0
    lui     v0, hi(groundTypeMap)
    addu    v0, v0, v1
    lbu     v0, lo(groundTypeMap)(v0)
    sll     a0, a0, 4
    andi    v0, v0, 0x000F
    or      v0, v0, a0
    lui     at, hi(groundTypeMap)
    addu    at, at, v1
    sb      v0, lo(groundTypeMap)(at)
@@painterLoopInnerEnd1:
    addiu   s3, s3, 0x0001
@@painterLoopInnerEnd2:
    slti    v0, s3, 0x0020
    bnez    v0, @@painterLoopInner
    addiu   s0, s0, 0x0001
    slti    v0, s0, groundMapWidth
    bnez    v0, @@painterLoopX
    nop
    addiu   s1, s1, 0x0001
    slti    v0, s1, groundMapHeight
    bnezl   v0, @@painterLoopY
    li      s0, 0
    lw      ra, 0x022C(sp)
    lw      s8, 0x0228(sp)
    lw      s7, 0x0224(sp)
    lw      s6, 0x0220(sp)
    lw      s5, 0x021C(sp)
    lw      s4, 0x0218(sp)
    lw      s3, 0x0214(sp)
    lw      s2, 0x0210(sp)
    lw      s1, 0x020C(sp)
    lw      s0, 0x0208(sp)
    jr      ra
    addiu   sp, sp, 0x0230
.endfunc

    .definelabel groundMapWidth, 256
    .definelabel groundMapHeight, 512