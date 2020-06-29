.n64
.relativeinclude on

//------------------------------------------------------------//
// This file will create binary files for each hook and hack, //
// to be used for patching a ROM via an external program.     //
//------------------------------------------------------------//

.macro createBinary, inFile, outFile
    .create outFile, 0
    .include inFile
    .close
.endmacro

// Include constants
.include "constants.asm"

// Create all base RAM hooks
createBinary "hooks/removefunc.asm", "bin/base0001F96C"
createBinary "hooks/tees.asm", "bin/base00044FEC"

// Create all expansion pak hooks
createBinary "hooks/cumulativescore.asm", "bin/exp000432BC"
createBinary "hooks/finalscore.asm", "bin/exp00043314"
createBinary "hooks/rain.asm", "bin/exp00044B18"
createBinary "hooks/wind.asm", "bin/exp00044BA8"
createBinary "hooks/fastcameraalways.asm", "bin/exp000C47F0"
createBinary "hooks/fastcameraminigolf.asm", "bin/exp000C4800"
createBinary "hooks/fastcamera.asm", "bin/exp000C481C"
createBinary "hooks/changecharacter.asm", "bin/exp000C4C20"
createBinary "hooks/celebration.asm", "bin/exp000C597C"
createBinary "groundpainter/getcoursenumber.asm", "bin/exp0012B380"
createBinary "hooks/groundPainter.asm", "bin/exp0012B570"
createBinary "hooks/boot.asm", "bin/exp0014FBC4"
createBinary "hooks/bootscreen.asm", "bin/exp0014FEF4"

// Create the main hacks
createBinary "basehacks.asm", "bin/base0001F064"
createBinary "expakhacks.asm", "bin/expakhacks"