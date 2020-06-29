.org baseHackRamAddress

//------------------------------------------------------------//
// Include any hacks that need to be enabled by default       //
//------------------------------------------------------------//

.area 0x1F8

    .include    "tees.asm"
    .include    "boot.asm"

.endarea