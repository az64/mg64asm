.n64
.relativeinclude on

.open "mg64.z64", "output.z64", 0

//------------------------------------------------------------//
// This file will patch all hacks directly to a ROM.          //
//------------------------------------------------------------//

    // Include constants
    .include "constants.asm"

    // Main file - always loaded
    .headersize mainCodeRamAddress - mainCodeRomAddress
    .include "basehacks.asm"
    .include "hooks/removefunc.asm"
    .include "hooks/cumulativescore.asm"
    .include "hooks/finalscore.asm"
    .include "hooks/rain.asm"
    .include "hooks/wind.asm"
    .include "hooks/tees.asm"

    // Gameplay file
    .headersize gameplayRamAddress - gameplayRomAddress
    .include "hooks/fastcameraalways.asm"
    .include "hooks/fastcameraminigolf.asm"
    .include "hooks/fastcamera.asm"
    .include "hooks/changecharacter.asm"
    .include "hooks/celebration.asm"

    // Hole loader file
    .headersize holeLoaderRamAddress - holeLoaderRomAddress
    .include "hooks/groundpainter.asm"
    .include "groundpainter/getcoursenumber.asm"

    // Boot screen file
    .headersize bootScreenRamAddress - bootScreenRomAddress
    .include "hooks/boot.asm"
    .include "hooks/bootscreen.asm"

    // Expansion pak data - end of ROM
    .headersize exPakHackRamEnd - romSize
    .include "expakhacks.asm"

.close