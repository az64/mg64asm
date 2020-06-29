//------------------------------------------------------------//
// Functions                                                  //
//------------------------------------------------------------//

.definelabel transferRomToRam, 0x80025C50
.definelabel getSramFlag, 0x800299F4
.definelabel getSurfaceHeight, 0x80043A04
.definelabel setTextMode, 0x8004D99C
.definelabel printTextString, 0x8004D9C0
.definelabel setBgm, 0x80051C08
.definelabel getRandomInt, 0x80067D4C
.definelabel sinF, 0x800AA730
.definelabel setTextString, 0x800AADF0
.definelabel getRandomShort, 0x800B3220
.definelabel initialisePainterRandomSeed, 0x8024D800
.definelabel setGroundBorderTypes, 0x8024D80C
.definelabel initialiseGroundMap, 0x8024E288
.definelabel paintGround, 0x8024FAA0

//------------------------------------------------------------//
// Addresses                                                  //
//------------------------------------------------------------//

.definelabel availableRam, 0x80000318

.definelabel activePinPositionX, 0x800BA9D8
.definelabel activePinPositionY, 0x800BA9DC
.definelabel activePinPositionZ, 0x800BA9E0
.definelabel activeTeePositionX, 0x800BA9E4
.definelabel activeTeePositionY, 0x800BA9E8
.definelabel activeTeePositionZ, 0x800BA9EC
.definelabel weatherWindSpeed, 0x800BA9F0
.definelabel weatherWindDirection, 0x800BA9F4
.definelabel weatherRainFlag, 0x800BA9F8

.definelabel groundMapTemp, 0x800BAC0C
.definelabel groundMapCounter, 0x800BB00C

.definelabel tournamentCpuScoreModifier, 0x800C3604
.definelabel birdieBadgesCounterDisplayFlag, 0x800C545C
.definelabel birdieBadgesCounterDisplayFrame, 0x800C5460

.definelabel activePlayerController, 0x80104990
.definelabel ballPosition, 0x80104AE0
.definelabel ballState, 0x80104B54

.definelabel groundPaintMap, 0x80132D00
.definelabel groundTypeMap, 0x80191620

.definelabel currentCourseNumber, 0x801B6094
.definelabel currentHoleNumber, 0x801B6098
.definelabel miniGolfFlag, 0x801B60C2

.definelabel player1Character, 0x801B71ED
.definelabel player1ClubList, 0x801B7222
.definelabel player1CharacterColour, 0x801B724B

.definelabel introScreenTransitionCounter, 0x801F5770

.definelabel holeResultGraphicCounter, 0x80224110

.definelabel painterRandomSeed, 0x802542A0
.definelabel painterCourseProperties, 0x802542A4
.definelabel painterCourseNumber, 0x80255320
.definelabel groundMapFilePointer, 0x8025D350

//------------------------------------------------------------//
// Values                                                     //
//------------------------------------------------------------//

.definelabel romSize, 0x2000000

.definelabel defaultRamSize, 0x400000

.definelabel baseHackRamAddress, 0x80043C64
.definelabel exPakHackRamAddress, 0x80400000

.definelabel controllerButtonA, 0x8000

.definelabel typeNone, -1
.definelabel typeFairway, 0
.definelabel typeRough, 1
.definelabel typeBunker, 2
.definelabel typeBareGround, 3
.definelabel typeCartway, 4
.definelabel typeDeepRough, 5
.definelabel typeGreen, 6
.definelabel typeOb, 7
.definelabel typeTeeGround, 8
.definelabel typeRock, 9
.definelabel typeGreenEdge, 10
.definelabel typeSemiRough, 11
.definelabel typeBareGround2, 12
.definelabel typeOb2, 13
.definelabel typeWasteArea, 14
.definelabel typeOb3, 15

//------------------------------------------------------------//
// File addresses                                             //
//------------------------------------------------------------//

.definelabel mainCodeRomAddress, 0x00001000
.definelabel mainCodeRamAddress, 0x80025C00

.definelabel gameplayRomAddress, 0x000ADD30
.definelabel gameplayRamAddress, 0x801F4A30

.definelabel holeLoaderRomAddress, 0x00128580
.definelabel holeLoaderRamAddress, 0x8024D800

.definelabel bootScreenRomAddress, 0x0014FB50
.definelabel bootScreenRamAddress, 0x801F4A30