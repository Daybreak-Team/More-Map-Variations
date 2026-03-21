// ==EMEVD==
// @docs    nr-common.emedf.json
// @compress    DCX_KRAK
// @game    Sekiro
// @string    "W:\\CL\\data\\Param\\event\\common_func.emevd\u0000W:\\CL\\data\\Param\\event\\common_macro.emevd\u0000\u0000\u0000\u0000\u0000\u0000"
// @linked    [0,82]
// @version    3.6.2
// ==/EMEVD==

$Event(0, Default, function() {
    $InitializeEvent(0, 40102500);
    $InitializeEvent(0, 40102503);
    $InitializeEvent(0, 40102505);
    $InitializeEvent(1, 40102580, 1, 40101601, 40101621, 40100581, 807390);
    $InitializeEvent(1, 40102590, 1, 40101601, 40100591);
    $InitializeCommonEvent(0, 90015500, 40102320);
});

$Event(40102500, Restart, function() {
    if (EventFlag(40100500)) {
        DisableAsset(40101597);
        DisableAsset(40101598);
        EndEvent();
    }
L0:
    //CreateAssetfollowingSFX(40101597, 101, 800748);
    //CreateAssetfollowingSFX(40101598, 101, 800746);
    WaitFor(EventFlag(40100500));
    DeleteAssetfollowingSFX(40101597, true);
    DisableAsset(40101597);
    DeleteAssetfollowingSFX(40101598, true);
    DisableAsset(40101598);
    DeleteMapSFX(40101598, 0);
    PlaySE(40101597, SoundType.SFX, 1500);
    WaitFixedTimeSeconds(0.5);
    RecordUserDispLog(11225, 40101599, LogObjectType.None, -1);
});


// Changes icon after unlock
$Event(40102503, Default, function() {
    WaitFor(EventFlag(40100500));
    SetWorldMapPointFlag(6, ON);
    SetWorldMapPointFlag(8, OFF);
});

$Event(40102504, Default, function() {
    DisableNetworkSync();
});

// For the rise mana relic
$Event(40102505, Default, function() {
    EndIf(EventFlag(40100500));
    WaitFor(EventFlag(40100500));
    IncrementNetworkconnectedEventValue(8140, 4, 7);
});


$Event(40102580, Restart, function(mapVariationId, assetEntityId, assetEntityId2, eventFlagId, sfxId) {
    EndIf(!IsMapVariation(mapVariationId));
    if (EventFlag(40100501)) {
        DisableAsset(assetEntityId2);
        if (!EventFlag(40100502)) {
            EnableAsset(assetEntityId);
        }
        if (EventFlag(40100502)) {
            DisableAsset(assetEntityId);
        }
        EndEvent();
    }
L0:
    DisableAsset(assetEntityId);
    WaitFor(AssetHP(assetEntityId2) != 9999);
    SetSpEffect(assetEntityId2, 0);
    SetNetworkconnectedEventFlagID(eventFlagId, ON);
    SetNetworkconnectedEventFlagID(40100501, ON);
    WaitFixedTimeSeconds(0.1);
    
    if (IsMapVariation(1)) {
        ForceAnimationPlayback(assetEntityId2, 1, false, false, false);
        SpawnOneshotSFX(TargetEntityType.Asset, assetEntityId2, 100, sfxId);
        WaitFixedTimeSeconds(2);
    }

    DisableAsset(assetEntityId2);
    WaitFixedTimeSeconds(0.1);
    EnableAsset(assetEntityId);
    ForceAnimationPlayback(assetEntityId, 1, false, true, false);
});

// Sets event flag for specific variation. Used to only affect one rise. 
// Also means all rise will need diff variations. Or just use one per map.
$Event(40102590, Restart, function(mapVariationId, assetEntityId, eventFlagId) {
    EndIf(!IsMapVariation(mapVariationId));
    if (EventFlag(40100502)) {
        DisableAsset(assetEntityId);
        EndEvent();
    }
L0:
    WaitFor(CharacterRatioDead(40105000));
    SetSpEffect(10002, 1605000);
    SetNetworkconnectedEventFlagID(eventFlagId, ON);
    SetNetworkconnectedEventFlagID(40100502, ON);
    SetNetworkconnectedEventFlagID(40100500, ON);
});
