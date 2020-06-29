.org exPakHackRamAddress

//------------------------------------------------------------//
// Read a flag from the enabled hacks table                   //
//------------------------------------------------------------//
.func getHackEnabledFlag
    srl     t0, a0, 3
    andi    t1, a0, 7
    lui     at, hi(hackEnableTable)
    addu    at, at, t0
    lbu     t2, lo(hackEnableTable)(at)
    srlv    t0, t2, t1
    jr      ra
    andi    v0, t0, 1
.endfunc

//------------------------------------------------------------//
// Include all the other hacks to be applied                  //
//------------------------------------------------------------//

    .include    "cumulativescore.asm"
    .include    "finalscore.asm"
    .include    "rain.asm"
    .include    "wind.asm"
    .include    "fastcamera.asm"
    .include    "celebration.asm"
    .include    "groundpainter.asm"
    .include    "changecharacter.asm"

//------------------------------------------------------------//
// Include tables                                             //
//------------------------------------------------------------//

    .include    "hackenabletable.asm" 
    .include    "modtable.asm"
    .include    "groundpainter/paintsetindextable.asm"
    .include    "groundpainter/paintersettable.asm"

//------------------------------------------------------------//
// Write a version number in case this is ever needed...      //
//------------------------------------------------------------//

versionString:
    .asciiz     "MG64EASM0000001"

//------------------------------------------------------------//
// Output ROM pointers to each of the tables (for external    //
// reading, i.e. editors)                                     //
//------------------------------------------------------------//

tablePointersTable:
    .definelabel tableCount, 4

    // Align this file to 16 bytes and the end of this block
    // to the end of the ROM
    .fill       (16 - ((tablePointersTable + (tableCount + 2) * 4) % 16)) % 16

    .word       romSize - (exPakHackRamEnd - versionString)
    .word       romSize - (exPakHackRamEnd - hackEnableTable)
    .word       romSize - (exPakHackRamEnd - modTable)
    .word       romSize - (exPakHackRamEnd - groundPaintSetIndexTable)
    .word       romSize - (exPakHackRamEnd - painterSetTable)
    .word       tableCount + 1

//------------------------------------------------------------//
// Get the end address of this file                           //
//------------------------------------------------------------//

exPakHackRamEnd: