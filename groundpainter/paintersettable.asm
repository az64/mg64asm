//------------------------------------------------------------//
// Painter set table - Type to swap                           //
//                     Number of colours                      //
//                     patternType                            //
//                     Size 1                                 //
//                     Size 2                                 //
//                     Size 3                                 //
//                     Colour range enabled                   //
//                     Colour list (RGBA5551)                 //
//------------------------------------------------------------//

    .macro painterSetSettings, typeToSwap, colours, patternType, size1, size2, size3, range
        .byte       typeToSwap
        .byte       (colours << 4) | patternType
        .byte       (size1 << 4) | size2
        .byte       (size3 << 4) | range
    .endmacro

    .macro painterSetColours, colour1, colour2, colour3, colour4, colour5, colour6, colour7, colour8
        .halfword   colour1
        .halfword   colour2
        .halfword   colour3
        .halfword   colour4
        .halfword   colour5
        .halfword   colour6
        .halfword   colour7
        .halfword   colour8
    .endmacro

    .definelabel patternTypeNone, 0
    .definelabel patternTypeGradientHorizontal, 1
    .definelabel patternTypeGradientVertical, 2
    .definelabel patternTypeStripesVertical, 3
    .definelabel patternTypeStripesHorizontal, 4
    .definelabel patternTypeCheckers, 5
    .definelabel patternTypeSineVertical, 6
    .definelabel patternTypeSineHorizontal, 7
    .definelabel patternTypeEllipse, 8

painterSetTable:

//------------------------------------------------------------//
// Toad Highlands                                             //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeNone, 2, patternTypeStripesVertical, 3, 0, 0, 1
    painterSetColours 0x4CC4, 0x64C4, 0x3D84, 0x5584, 1, 1, 1, 1

// Rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x0341, 0x3C01, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xE739, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x1041, 0x3101, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7BDF, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4481, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeNone, 4, patternTypeCheckers, 1, 1, 0, 0
    painterSetColours 0x3E42, 1, 0x2F84, 1, 0x3704, 1, 0x4580, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2A41, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2688, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4983, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2587, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4605, 1, 1, 1, 1, 1, 1, 1

//------------------------------------------------------------//
// Koopa Park                                                 //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeNone, 2, patternTypeStripesVertical, 3, 0, 0, 1
    painterSetColours 0x4CC4, 0x64C4, 0x3D84, 0x5584, 1, 1, 1, 1

// Rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x0341, 0x3C01, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xE739, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x1041, 0x3101, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7BDF, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4481, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeNone, 4, patternTypeCheckers, 1, 1, 0, 0
    painterSetColours 0x3E42, 1, 0x2F84, 1, 0x3704, 1, 0x4580, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2A41, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2688, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4983, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2587, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4605, 1, 1, 1, 1, 1, 1, 1

//------------------------------------------------------------//
// Shy Guy Desert                                             //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeNone, 2, patternTypeStripesVertical, 3, 0, 0, 1
    painterSetColours 0x9E88, 0xB688, 0x75C6, 0x8DC6, 1, 1, 1, 1

// Rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x5345, 0x6C05, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xE721, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x1041, 0x3101, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7BDF, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeWasteArea, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xE5D2, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeNone, 4, patternTypeCheckers, 1, 1, 0, 0
    painterSetColours 0x7746, 1, 0x8606, 1, 0x7E4A, 1, 0x8E88, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xD6A6, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7E4A, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4983, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7E4B, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x9E89, 1, 1, 1, 1, 1, 1, 1

//------------------------------------------------------------//
// Yoshi's Island                                             //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeNone, 2, patternTypeStripesVertical, 3, 0, 0, 1
    painterSetColours 0x3CD4, 0x54D4, 0x3D90, 0x5590, 1, 1, 1, 1

// Rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x034D, 0x3C0D, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xEF37, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x1041, 0x3101, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7BDF, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x448F, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeNone, 4, patternTypeCheckers, 1, 1, 0, 0
    painterSetColours 0x3CC2, 1, 0x2E04, 1, 0x3584, 1, 0x4480, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2A49, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x269C, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4983, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x3C05, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4591, 1, 1, 1, 1, 1, 1, 1

//------------------------------------------------------------//
// Boo Valley                                                 //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeNone, 2, patternTypeStripesVertical, 3, 0, 0, 1
    painterSetColours 0x4CC4, 0x64C4, 0x3D84, 0x5584, 1, 1, 1, 1

// Rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x0341, 0x3C01, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xE721, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x1041, 0x3101, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7BDF, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4481, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeNone, 4, patternTypeCheckers, 1, 1, 0, 0
    painterSetColours 0x3E42, 1, 0x2F84, 1, 0x3704, 1, 0x4580, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2A40, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2688, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4983, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2587, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4605, 1, 1, 1, 1, 1, 1, 1

//------------------------------------------------------------//
// Mario's Star                                               //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeNone, 2, patternTypeStripesVertical, 3, 0, 0, 1
    painterSetColours 0x4CC4, 0x64C4, 0x3D84, 0x5584, 1, 1, 1, 1

// Rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x0341, 0x3C01, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xE739, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x1041, 0x3101, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7BDF, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4481, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeNone, 4, patternTypeCheckers, 1, 1, 0, 0
    painterSetColours 0x3E42, 1, 0x2F84, 1, 0x3704, 1, 0x4580, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2A41, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2688, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4983, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2587, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4605, 1, 1, 1, 1, 1, 1, 1

//------------------------------------------------------------//
// Luigi's Garden                                             //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2689, 1, 1, 1, 1, 1, 1, 1

// Rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x2041, 0x5901, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeNone, 2, patternTypeCheckers, 3, 7, 0, 0
    painterSetColours 0x650B, 1, 0xCE72, 1, 1, 1, 1, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeGreen, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x650B, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

//------------------------------------------------------------//
// Luigi's Garden (Slow)                                      //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2689, 1, 1, 1, 1, 1, 1, 1

// Rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x1041, 0x3101, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeFairway, 2, patternTypeCheckers, 3, 7, 0, 0
    painterSetColours 0x4C72, 1, 0xBEB4, 1, 1, 1, 1, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeGreen, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4C73, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

//------------------------------------------------------------//
// Luigi's Garden (Fast)                                      //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xF801, 1, 1, 1, 1, 1, 1, 1

// Rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x1041, 0x3101, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeNone, 2, patternTypeCheckers, 3, 7, 0, 0
    painterSetColours 0xDC60, 1, 0xCE72, 1, 1, 1, 1, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeGreen, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xDC61, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

//------------------------------------------------------------//
// Peach's Castle                                             //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2689, 1, 1, 1, 1, 1, 1, 1

// Rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x2041, 0x5901, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeNone, 2, patternTypeCheckers, 3, 7, 0, 0
    painterSetColours 0x650B, 1, 0xCE72, 1, 1, 1, 1, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeGreen, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x650B, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x03CD, 1, 1, 1, 1, 1, 1, 1

//------------------------------------------------------------//
// Peach's Castle (Slow)                                      //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2689, 1, 1, 1, 1, 1, 1, 1

// Rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x1041, 0x3101, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeFairway, 2, patternTypeCheckers, 3, 7, 0, 0
    painterSetColours 0x4C72, 1, 0xBEB4, 1, 1, 1, 1, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeGreen, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4C73, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x055F, 1, 1, 1, 1, 1, 1, 1

//------------------------------------------------------------//
// Peach's Castle (Fast)                                      //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xF801, 1, 1, 1, 1, 1, 1, 1

// Rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x1041, 0x3101, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeNone, 2, patternTypeCheckers, 3, 7, 0, 0
    painterSetColours 0xDC60, 1, 0xCE72, 1, 1, 1, 1, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeGreen, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xDC61, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeOb, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7B81, 1, 1, 1, 1, 1, 1, 1

//------------------------------------------------------------//
// Driving Range                                              //
//------------------------------------------------------------//

// Fairway
    painterSetSettings typeNone, 2, patternTypeStripesVertical, 3, 0, 0, 1
    painterSetColours 0x4CC4, 0x64C4, 0x3D84, 0x5584, 1, 1, 1, 1

// Rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x0341, 0x3C01, 1, 1, 1, 1, 1, 1

// Bunker
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0xE739, 1, 1, 1, 1, 1, 1, 1

// Bare ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 1
    painterSetColours 0x1041, 0x3101, 1, 1, 1, 1, 1, 1

// Cartway
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x7BDF, 1, 1, 1, 1, 1, 1, 1

// Deep rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4481, 1, 1, 1, 1, 1, 1, 1

// Green
    painterSetSettings typeNone, 4, patternTypeCheckers, 1, 1, 0, 0
    painterSetColours 0x3E42, 1, 0x2F84, 1, 0x3704, 1, 0x4580, 1

// OB
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2A41, 1, 1, 1, 1, 1, 1, 1

// Tee ground
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2688, 1, 1, 1, 1, 1, 1, 1

// Rock
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4983, 1, 1, 1, 1, 1, 1, 1

// Green edge
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x2587, 1, 1, 1, 1, 1, 1, 1

// Semi-rough
    painterSetSettings typeNone, 1, patternTypeNone, 0, 0, 0, 0
    painterSetColours 0x4605, 1, 1, 1, 1, 1, 1, 1