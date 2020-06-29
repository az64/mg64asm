//------------------------------------------------------------//
// Change character (P1) every shot                           //
//------------------------------------------------------------//
.func changeCharacter
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    jal     getHackEnabledFlag
    li      a0, changeCharacterFlag
    beqz    v0, @@changeCharacterEnd
    nop
    jal     getRandomShort
    nop
    li      t0, 14
    divu    v0, t0
    lui     t2, hi(player1Character)
    mfhi    t1
    jal     getRandomShort
    sb      t1, lo(player1Character)(t2)
    andi    v0, v0, 3
    sb      v0, player1CharacterColour
    lb      t3, player1Character
    la      t0, player1ClubList
    li      t1, 0
    li      t2, 14
@@setClubsLoop:
    sll     t4, t3, 3
    subu    t4, t4, t3
    sll     t4, t4, 1
    addu    t4, t4, t1
    sll     t5, t1, 1
    addu    t6, t5, t0
    sh      t4, 0x0000(t6)
    addiu   t1, t1, 0x0001
    bne     t1, t2, @@setClubsLoop
    nop
@@changeCharacterEnd:
    lw      v0, 0x0000(s1)
    xori    v1, v0, 0x000D
    lw      ra, 0x001C(sp)
    addiu   sp, sp, 0x0020
    jr      ra
    nop
.endfunc