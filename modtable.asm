//------------------------------------------------------------//
// Mod table - Max wind speed                                 //
//             Rain frequency (%)                             //
//             Tournament CPU max score                       //
//             Ground paint set                               //
//------------------------------------------------------------//

    .macro modTableEntry, windMax, rainFrequency, scoreMax, unusedByte
        .byte   windMax
        .byte   rainFrequency
        .byte   scoreMax
        .byte   unusedByte
    .endmacro

modTable:
// Toad Highlands
    modtableEntry 21, 25, 0, 0
// Koopa Park
    modtableEntry 21, 25, -1, 1
// Shy Guy Desert
    modtableEntry 21, 12, -3, 2
// Yoshi's Island
    modtableEntry 21, 25, -5, 3
// Boo Valley
    modtableEntry 21, 25, -7, 4
// Mario's Star
    modtableEntry 21, 25, -9, 5
// Luigi's Garden
    modtableEntry 0, 0, 0, 6
// Luigi's Garden Slow
    modtableEntry 0, 0, 0, 7
// Luigi's Garden Fast
    modtableEntry 0, 0, 0, 8
// Peach's Castle
    modtableEntry 0, 0, 0, 9
// Peach's Castle Slow
    modtableEntry 0, 0, 0, 10
// Peach's Castle Fast
    modtableEntry 0, 0, 0, 11
// Driving Range
    modtableEntry 21, 25, 0, 12