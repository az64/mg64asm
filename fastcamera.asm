//------------------------------------------------------------//
// Speed up shot playback                                     //
//------------------------------------------------------------//
.func fastCamera
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    bnel    v0, t1, @@checkedIfOnGreen
    li      v1, 1
    li      v1, 0
@@checkedIfOnGreen:
    sw      v1, 0x0014(sp)
    slt     v0, s0, s4
    li      a0, fastCameraOnGreenFlag
    jal     getHackEnabledFlag
    sw      v0, 0x0018(sp)
    lw      v1, 0x0018(sp)
    sltiu   v1, v1, 1
    lw      t0, 0x0014(sp)
    or      t1, v0, v1
    or      v0, t1, t0
    li      a0, fastCameraMiniGolfFlag
    jal     getHackEnabledFlag
    sw      v0, 0x0018(sp)
    lw      v1, 0x0018(sp)
    lb      t0, miniGolfFlag
    and     v0, t0, v0
    sltiu   t2, v0, 1
    and     t1, t0, t2
    bnezl   t1, @@checkedMiniGolf
    li      v1, 0
    or      v1, v1, v0
@@checkedMiniGolf:
    li      a0, fastCameraAlwaysFlag
    jal     getHackEnabledFlag
    sw      v1, 0x0018(sp)
    bnez    v0, @@fastCameraEnd
    lw      v1, ballState
    beql    v1, s8, @@checkedBallState
    li      t1, 1
    li      t1, 0
@@checkedBallState:
    or      v0, v0, t1
    lw      v1, 0x0018(sp)
    and     v0, v0, v1
@@fastCameraEnd:
    lw      ra, 0x001C(sp)
    addiu   sp, sp, 0x0020
    jr      ra
    nop
.endfunc