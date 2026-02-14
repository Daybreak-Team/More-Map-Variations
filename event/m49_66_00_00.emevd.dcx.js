// ==EMEVD==
// @docs    nr-common.emedf.json
// @compress    DCX_KRAK
// @game    Sekiro
// @string    "W:\\CL\\data\\Param\\event\\common_func.emevd\u0000W:\\CL\\data\\Param\\event\\common_macro.emevd\u0000\u0000\u0000\u0000\u0000\u0000"
// @linked    [0,82]
// @version    3.6.2
// ==/EMEVD==

$Event(0, Default, function() {
    if (IsMapVariation(0)) {
        if (EventFlag(49660000)) {
            $InitializeCommonEvent(0, 90055000, 49665200, 1, 49662200, 49660201);
            $InitializeCommonEvent(0, 90055001, 49665200, 1, 49660201, 49660200);
        }
        if (EventFlag(49660001)) {
            $InitializeCommonEvent(0, 90055000, 49665200, 2, 49662200, 49660201);
            $InitializeCommonEvent(0, 90055001, 49665200, 2, 49660201, 49660200);
        }
    }
    if (IsMapVariation(1)) {
        $InitializeCommonEvent(0, 90035000, 49660200);
    }
    if (IsMapVariation(2)) {
        $InitializeCommonEvent(0, 90015442, 49662200, 49660200);
    }
    $InitializeCommonEvent(0, 90065910, 49660200, 49662205, 49660800, 950000, 690047, 49660800, 49660800, 904970000, 0, 0, 0, 0);
    $InitializeCommonEvent(0, 90065911, 49660200, 49660800, 950000, 49660800, 49660800, 904970000, 0, 0, 0, 0, 0);
    if (!IsMapVariation(2)) {
        $InitializeCommonEvent(0, 90065900, 49660800, 2, 0, 0, 1050, 950000, 904970000, 49660800);
    }
    $InitializeCommonEvent(0, 90015012, 49660800, 49660200);
    $InitializeCommonEvent(0, 90015020, 49660200, 49660800);
    $InitializeCommonEvent(0, 90015008, 49662205, 49660800, 950000, 49660800, 16230, 0);
    $InitializeCommonEvent(0, 90065920, 49660800, 7315);
    if (IsMapVariation(2)) {
        $InitializeCommonEvent(0, 90015443, 49662200, 49660800);
        $InitializeCommonEvent(0, 90015023, 49660200, 40, 0, 49660800, 49660800, 904970000, 0, 0, 0, 0);
        $InitializeCommonEvent(0, 90015030, 49660200, 49660800, 40, 950000, 0);
        $InitializeCommonEvent(0, 90015002, 0, 49660200, 49660800, 49660800, 1020, 950000, 110320, 904970000, 49660800);
        $InitializeCommonEvent(0, 90015470, 49662200, 49660200, 49660800, 49660800, 0, 0, 0);
        $InitializeCommonEvent(0, 90015476, 10002, 49662200);
        $InitializeCommonEvent(0, 90015476, 10003, 49662200);
        $InitializeCommonEvent(0, 90015476, 10004, 49662200);
        $InitializeCommonEvent(0, 90065140, 49660800);
    }
    if (IsMapVariation(2)) {
        $InitializeCommonEvent(0, 90015446, 49660800, 49660200, 49660800, 49662200);
    }
    if (IsMapVariation(2)) {
        $InitializeCommonEvent(0, 90015460, 49662200, 49660800);
    }
    if (IsMapVariation(2)) {
        $InitializeCommonEvent(0, 90015475, 49662200, 49660800);
    }
    $InitializeCommonEvent(0, 90035001, 49660800);
    if (2 == 1) {
        $InitializeCommonEvent(0, 90015070, 1056402601, 49660000, 49660300);
        $InitializeCommonEvent(0, 90015070, 1028402600, 49660000, 49660300);
    }
    if (2 == 2) {
        $InitializeCommonEvent(0, 90015070, 1056402602, 49660000, 49660300);
        $InitializeCommonEvent(0, 90015070, 1028402601, 49660000, 49660300);
    }
    if (2 == 3) {
        $InitializeCommonEvent(0, 90015070, 1056402603, 49660000, 49660300);
        $InitializeCommonEvent(0, 90015070, 1028402602, 49660000, 49660300);
    }
    if (3 == 1) {
        $InitializeCommonEvent(0, 90015070, 1056402601, 49660000, 49660301);
        $InitializeCommonEvent(0, 90015070, 1028402600, 49660000, 49660301);
    }
    if (3 == 2) {
        $InitializeCommonEvent(0, 90015070, 1056402602, 49660000, 49660301);
        $InitializeCommonEvent(0, 90015070, 1028402601, 49660000, 49660301);
    }
    if (3 == 3) {
        $InitializeCommonEvent(0, 90015070, 1056402603, 49660000, 49660301);
        $InitializeCommonEvent(0, 90015070, 1028402602, 49660000, 49660301);
    }
});

$Event(49662800, Default, function(chrEntityId, assetEntityId, chrEntityId2, eventFlagId, eventFlagId2, eventFlagId3) {
    EndIf(EventFlag(eventFlagId));
    EndIf(EventFlag(eventFlagId2));
    WaitFor(HPRatio(chrEntityId) <= 0);
    WaitFixedTimeSeconds(4);
    WaitFor(CharacterDead(chrEntityId));
    DisplayBossHealthBar(Disabled, chrEntityId, 0, 0);
    if (assetEntityId != 0) {
        EnableAsset(assetEntityId);
    }
    if (chrEntityId2 != 0) {
        EnableCharacter(chrEntityId2);
    }
    if (!EventFlag(eventFlagId3)) {
        SetEventFlagID(eventFlagId, ON);
        EndEvent();
    }
    SetEventFlagID(eventFlagId2, ON);
    WaitFor(ElapsedSeconds(3));
    DisableCharacter(chrEntityId);
});

$Event(49662810, Restart, function(chrEntityId, eventFlagId, eventFlagId2, eventFlagId3, nameId, eventFlagId4, eventFlagId5) {
    if (EventFlag(eventFlagId4) || EventFlag(eventFlagId5)) {
        DisableCharacter(chrEntityId);
        DisableCharacterCollision(chrEntityId);
        ForceCharacterDeath(chrEntityId, false);
        EndEvent();
    }
L0:
    DisableCharacter(chrEntityId);
    DisableCharacterCollision(chrEntityId);
    DisableCharacterAI(chrEntityId);
    flag = EventFlag(7515) && (EventFlag(eventFlagId) || EventFlag(eventFlagId2));
    WaitFor(EventFlag(eventFlagId3));
    WaitFixedTimeSeconds(1);
    EnableCharacter(chrEntityId);
    EnableCharacterCollision(chrEntityId);
    EnableCharacterAI(chrEntityId);
    ForceAnimationPlayback(49660800, 20005, false, false, false);
    DisableCharacterHPBarDisplay(chrEntityId);
    DisableCharacterHPBarDisplay(49660801);
    CreateReferredDamagePair(49660801, chrEntityId);
    CreateReferredDamagePair(49660802, chrEntityId);
    EnableCharacterAI(chrEntityId);
    SetNetworkUpdateRate(49660800, true, CharacterUpdateFrequency.AlwaysUpdate);
    DisplayBossHealthBar(Enabled, chrEntityId, 0, nameId);
});


