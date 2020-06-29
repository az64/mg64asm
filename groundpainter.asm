//------------------------------------------------------------//
// Decide which ground painter to use                         //
//------------------------------------------------------------//
.func groundPainter
    addiu   sp, sp, 0xFFE0
    sw      ra, 0x001C(sp)
    jal     getHackEnabledFlag
    li      a0, overrideGroundPainterFlag
    bnez    v0, @@groundPainterNew
    nop
    jal     paintGround
    nop
    b       @@groundPainterEnd
    nop
@@groundPainterNew:
    jal     paintGroundNew
    nop
@@groundPainterEnd:
    lw      ra, 0x001C(sp)
    addiu   sp, sp, 0x0020
    jr      ra
    nop
.endfunc

    .include    "groundpainter/paintgroundnew.asm"
    .include    "groundpainter/getgroundcolour.asm"
    .include    "groundpainter/getrandomint.asm"
    .include    "groundpainter/getrandomrange.asm"
    .include    "groundpainter/getpi.asm"
    .include    "groundpainter/packrgba5551.asm"
    .include    "groundpainter/unpackrgba5551.asm"
    .include    "groundpainter/getvariables.asm"
    .include    "groundpainter/cleanup.asm"
    .include    "groundpainter/getcolour.asm"
    .include    "groundpainter/patternjumptable.asm"
    .include    "groundpainter/patterns/plain.asm"
    .include    "groundpainter/patterns/gradients.asm"
    .include    "groundpainter/patterns/stripes.asm"
    .include    "groundpainter/patterns/checkers.asm"
    .include    "groundpainter/patterns/sine.asm"
    .include    "groundpainter/patterns/ellipse.asm"