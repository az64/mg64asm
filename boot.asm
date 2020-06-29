//------------------------------------------------------------//
// If expansion pak is not detected, show a warning           //
//------------------------------------------------------------//
.func loadRamHacks
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    lw      t0, availableRam
    li      t1, defaultRamSize
    beq     t0, t1, @@loadRamHacksEnd
    nop
    la      a0, romSize - (exPakHackRamEnd - exPakHackRamAddress)
    la      a1, exPakHackRamAddress
    li      a2, exPakHackRamEnd - exPakHackRamAddress
    jal     transferRomToRam
    nop
@@loadRamHacksEnd:
    lw      ra, 0x001C(sp)
    addiu   sp, sp, 0x0020
    lui     at, 0xC2C8
    mtc1    at, f0
    jr      ra
    nop
.endfunc

//------------------------------------------------------------//
// If no expansion pak, don't advance the logo screen         //
//------------------------------------------------------------//
.func handleBootScreen
    addiu   sp, sp, 0xFF80
    sw      ra, 0x001C(sp)
    lw      t0, availableRam
    li      t1, defaultRamSize
    lw      v0, introScreenTransitionCounter
    bne     t0, t1, @@expansionPakDetected
    nop
    sltiu   v1, v0, stopAdvancingFrameNumber
    addu    v0, v0, v1
    sw      v0, introScreenTransitionCounter
    li      t0, setBgmFrameNumber
    bne     v0, t0, @@notBgmFrame
    li      a0, noExpansionPakBgm
    jal     setBgm
    li      a1, 128
@@notBgmFrame:
    la      a1, noExpansionPakString
    jal     setTextString
    addiu   a0, sp, 0x0020
    jal     setTextMode
    li      a0, 1
    li      a1, warningTextX
    li      a2, warningTextY
    jal     printTextString
    addiu   a0, sp, 0x0020
    b       @@handleBootScreenEnd
    li      v0, 0
@@expansionPakDetected:
    li      v1, 0x28
    addiu   v0, v0, 1
@@handleBootScreenEnd:
    lw      ra, 0x001C(sp)
    addiu   sp, sp, 0x0080
    jr      ra
    nop
.endfunc

noExpansionPakString:
    .asciiz "Warning - N64 Expansion Pak required"

    .align  4

    .definelabel warningTextX, 2
    .definelabel warningTextY, 24

    .definelabel setBgmFrameNumber, 5
    .definelabel stopAdvancingFrameNumber, 12
    .definelabel noExpansionPakBgm, 10