//------------------------------------------------------------//
// Hack enable flags                                          //
//------------------------------------------------------------//
hackEnableTable:
    .fill   16, 0xFF

    .definelabel fastCameraOnGreenFlag, 0
    .definelabel holeCelebrationAnimationSkipFlag, 1
    .definelabel recalculateWindSpeedFlag, 2
    .definelabel recalculateRainForHoleFlag, 3
    .definelabel recalculateTournamentScoreFlag, 4
    .definelabel overrideGroundPainterFlag, 5
    .definelabel fastCameraMiniGolfFlag, 6
    .definelabel fastCameraAlwaysFlag, 7

    // Meme stuff
    .definelabel changeCharacterFlag, 127