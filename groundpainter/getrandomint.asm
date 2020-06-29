//------------------------------------------------------------//
// Generate a random int using the painter seed               //
//------------------------------------------------------------//
.func painterGetRandomInt
    lui     at, hi(painterRandomSeed)
    lw      v1, lo(painterRandomSeed)(at)
    li      v0, randomMultiplier
    multu   v1, v0
    mflo    v1
    addiu   v0, v1, 1
    jr      ra 
    sw      v0, lo(painterRandomSeed)(at)
.endfunc

    .definelabel randomMultiplier, 0x5D588B65