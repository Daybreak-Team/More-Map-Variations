RegisterTableGoal(GOAL_Hollow_Saw126020_Battle, "GOAL_Hollow_Saw126020_Battle")

Goal.Initialize = function (self, ai, goal, battleActivatedCount)
    
end

Goal.Activate = function (self, ai, goal)
    Init_Pseudo_Global(ai, goal)
    ai:SetStringIndexedNumber("Dist_SideStep", 5)
    ai:SetStringIndexedNumber("Dist_BackStep", 5)
    local probabilities = {}
    local acts = {}
    local paramTbls = {}
    Common_Clear_Param(probabilities, acts, paramTbls)
    ai:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local f2_local5 = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkattr_doAdmirer)
    local f2_local6 = ai:GetEventRequest()
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 140) and distance <= 4 then
        probabilities[8] = 90
        probabilities[20] = 10
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 110) and distance <= 2 then
        probabilities[10] = 80
        probabilities[20] = 20
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 110) and distance <= 2 then
        probabilities[11] = 80
        probabilities[20] = 20
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) and distance >= 1 then
        probabilities[20] = 100
    elseif distance >= 12 then
        probabilities[1] = 0
        probabilities[2] = 0
        probabilities[3] = 0
        probabilities[4] = 0
        probabilities[5] = 0
        probabilities[6] = 0
        probabilities[7] = 0
        probabilities[8] = 0
        probabilities[9] = 80
        probabilities[10] = 0
        probabilities[11] = 0
        probabilities[12] = 10
        probabilities[13] = 0
        probabilities[14] = 10
        probabilities[20] = 0
    elseif distance >= 7.5 then
        probabilities[1] = 0
        probabilities[2] = 0
        probabilities[3] = 0
        probabilities[4] = 0
        probabilities[5] = 20
        probabilities[6] = 0
        probabilities[7] = 0
        probabilities[8] = 0
        probabilities[9] = 45
        probabilities[10] = 0
        probabilities[11] = 0
        probabilities[12] = 5
        probabilities[13] = 0
        probabilities[14] = 30
        probabilities[20] = 0
    elseif distance >= 5 then
        probabilities[1] = 10
        probabilities[2] = 5
        probabilities[3] = 10
        probabilities[4] = 5
        probabilities[5] = 15
        probabilities[6] = 5
        probabilities[7] = 0
        probabilities[8] = 0
        probabilities[9] = 20
        probabilities[10] = 0
        probabilities[11] = 0
        probabilities[12] = 0
        probabilities[13] = 0
        probabilities[14] = 30
        probabilities[20] = 0
    elseif distance >= 2.5 then
        probabilities[1] = 25
        probabilities[2] = 10
        probabilities[3] = 25
        probabilities[4] = 30
        probabilities[5] = 10
        probabilities[6] = 10
        probabilities[7] = 20
        probabilities[8] = 0
        probabilities[9] = 0
        probabilities[10] = 0
        probabilities[11] = 0
        probabilities[12] = 0
        probabilities[13] = 0
        probabilities[14] = 0
        probabilities[20] = 0
    else
        probabilities[1] = 30
        probabilities[2] = 5
        probabilities[3] = 30
        probabilities[4] = 5
        probabilities[5] = 0
        probabilities[6] = 5
        probabilities[7] = 25
        probabilities[8] = 0
        probabilities[9] = 0
        probabilities[10] = 0
        probabilities[11] = 0
        probabilities[12] = 0
        probabilities[13] = 0
        probabilities[14] = 0
        probabilities[20] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3000, 3, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3009, 10, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3001, 3, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3010, 10, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3004, 10, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3003, 10, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3002, 10, probabilities[7], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3015, 10, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3005, 5, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3008, 15, probabilities[9], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3020, 20, probabilities[12], 1)
    probabilities[14] = SetCoolTime(ai, goal, 3015, 10, probabilities[14], 1)
    probabilities[14] = SetCoolTime(ai, goal, 3002, 10, probabilities[14], 1)
    acts[1] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act01)
    acts[2] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act02)
    acts[3] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act03)
    acts[4] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act04)
    acts[5] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act05)
    acts[6] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act06)
    acts[7] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act07)
    acts[8] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act08)
    acts[9] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act09)
    acts[10] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act10)
    acts[11] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act11)
    acts[12] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act12)
    acts[13] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act13)
    acts[14] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act14)
    acts[15] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act15)
    acts[20] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act20)
    acts[21] = REGIST_FUNC(ai, goal, Hollow_Saw126020_Act21)
    local actAfter = REGIST_FUNC(ai, goal, Hollow_Saw126020_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
    
end

function Hollow_Saw126020_Act01(ai, goal, paramTbl)
    local stopDist = 2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 2 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local forceRunMinDist = 2 - ai:GetMapHitRadius(TARGET_SELF) + 3
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 6
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3000
    local animationId2 = 3006
    local animationId3 = 3012
    local animationId4 = 3011
    local animationId5 = 3013
    local animationId6 = 3004
    local animationId8 = 3016
    local animationId7 = 3017
    local successDistance = 2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance2 = 3.2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance3 = 3.8 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance4 = 2.5 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance5 = 6.7 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance7 = 1.4 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance6 = 1.4 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local f3_local22 = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 5 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, 6, 0)
    elseif random <= 10 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId4, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId3, TARGET_ENE_0, 6, 0)
    elseif random <= 15 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance4, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId5, TARGET_ENE_0, successDistance5, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId6, TARGET_ENE_0, 6, 0)
    elseif random <= 45 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance6, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId7, TARGET_ENE_0, successDistance7, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId8, TARGET_ENE_0, 6, 0)
    elseif random <= 70 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance6, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId7, TARGET_ENE_0, successDistance7, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId8, TARGET_ENE_0, successDistance6, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId7, TARGET_ENE_0, 6, 0)
    elseif random <= 85 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance6, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId7, TARGET_ENE_0, successDistance7, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId8, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId3, TARGET_ENE_0, 6, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance6, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId7, TARGET_ENE_0, successDistance7, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId8, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId4, TARGET_ENE_0, 6, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act02(ai, goal, paramTbl)
    local stopDist = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local forceRunMinDist = 4 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 6
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3009
    local animationId2 = 3006
    local animationId4 = 3011
    local animationId3 = 3012
    local successDistance = 2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance3 = 3.8 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance2 = 3.2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance4 = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, 6, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId4, TARGET_ENE_0, successDistance4, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act03(ai, goal, paramTbl)
    local stopDist = 0.7 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 0.7 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local forceRunMinDist = 0.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 6
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3001
    local animationId2 = 3011
    local animationId3 = 3013
    local animationId4 = 3012
    local animationId5 = 3016
    local animationId6 = 3017
    local successDistance = 3.8 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance2 = 2.5 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance3 = 3.2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance4 = 1.4 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance5 = 1.4 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local f5_local18 = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 5 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, 6, 0)
    elseif random <= 15 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId4, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId3, TARGET_ENE_0, 6, 0)
    elseif random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance4, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId5, TARGET_ENE_0, successDistance5, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId6, TARGET_ENE_0, successDistance4, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId5, TARGET_ENE_0, successDistance5, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId6, TARGET_ENE_0, 6, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance4, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId5, TARGET_ENE_0, successDistance5, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId6, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId3, TARGET_ENE_0, 6, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act04(ai, goal, paramTbl)
    local stopDist = 3.1 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3.1 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local forceRunMinDist = 3.1 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 6
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3010
    local animationId2 = 3011
    local animationId3 = 3012
    local animationId4 = 3013
    local successDistance = 3.8 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance2 = 3.2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance4 = 2.5 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance3 = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 60 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId2, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId2, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance4, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId4, TARGET_ENE_0, 6, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act05(ai, goal, paramTbl)
    local stopDist = 6.7 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6.7 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local forceRunMinDist = 6.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 6
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3004
    local animationId2 = 3011
    local animationId4 = 3013
    local animationId3 = 3012
    local successDistance = 3.8 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance4 = 2.5 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance2 = 3.2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance3 = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId2, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId2, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance4, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId4, TARGET_ENE_0, 6, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act06(ai, goal, paramTbl)
    local stopDist = 3 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local forceRunMinDist = 3 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 6
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3003
    local animationId2 = 3004
    local animationId3 = 3011
    local animationId4 = 3012
    local successDistance = 6.7 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance2 = 3.8 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local f8_local13 = 3.2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance3 = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId4, TARGET_ENE_0, successDistance3, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act07(ai, goal, paramTbl)
    local stopDist = 2.1 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 2.1 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local forceRunMinDist = 2.1 - ai:GetMapHitRadius(TARGET_SELF) + 3
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 6
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3002
    local animationId2 = 3018
    local successDistance2 = 2.5 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 10 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    elseif random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, 6, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId2, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, 6, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act08(ai, goal, paramTbl)
    local animationId = 3005
    local animationId3 = 3011
    local animationId4 = 3012
    local animationId2 = 3013
    local successDistance3 = 2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance4 = 3.2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance2 = 3.8 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 10 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    elseif random <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, 6, 0)
    elseif random <= 60 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance4, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId4, TARGET_ENE_0, 6, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance4, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId4, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, 6, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act09(ai, goal, paramTbl)
    local stopDist = 8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 8 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local forceRunMinDist = 8 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 6
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3008
    local successDistance = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act10(ai, goal, paramTbl)
    local stopDist = 0.7 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 0.7 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local forceRunMinDist = 0.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 6
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3001
    local animationId2 = 3011
    local animationId3 = 3013
    local animationId4 = 3012
    local animationId5 = 3016
    local animationId6 = 3017
    local successDistance = 3.8 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance2 = 2.5 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance3 = 3.2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance4 = 1.4 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance5 = 1.4 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local f12_local18 = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 5 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, 6, 0)
    elseif random <= 15 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId4, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId3, TARGET_ENE_0, 6, 0)
    elseif random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance4, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId5, TARGET_ENE_0, successDistance5, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId6, TARGET_ENE_0, successDistance4, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId5, TARGET_ENE_0, successDistance5, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId6, TARGET_ENE_0, 6, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance4, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId5, TARGET_ENE_0, successDistance5, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId6, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId3, TARGET_ENE_0, 6, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act11(ai, goal, paramTbl)
    local stopDist = 2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 2 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local forceRunMinDist = 2 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 6
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3000
    local animationId2 = 3006
    local animationId3 = 3012
    local animationId4 = 3011
    local animationId5 = 3013
    local animationId6 = 3004
    local animationId8 = 3016
    local animationId7 = 3017
    local successDistance = 2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance2 = 3.2 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance3 = 3.8 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance4 = 2.5 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance5 = 6.7 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance7 = 1.4 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance6 = 1.4 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local f13_local22 = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 5 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, 6, 0)
    elseif random <= 10 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId4, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId3, TARGET_ENE_0, 6, 0)
    elseif random <= 15 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance4, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId5, TARGET_ENE_0, successDistance5, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId6, TARGET_ENE_0, 6, 0)
    elseif random <= 45 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance6, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId7, TARGET_ENE_0, successDistance7, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId8, TARGET_ENE_0, 6, 0)
    elseif random <= 70 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance6, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId7, TARGET_ENE_0, successDistance7, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId8, TARGET_ENE_0, successDistance6, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId7, TARGET_ENE_0, 6, 0)
    elseif random <= 85 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance6, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId7, TARGET_ENE_0, successDistance7, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId8, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId3, TARGET_ENE_0, 6, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance6, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId7, TARGET_ENE_0, successDistance7, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId8, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId3, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId4, TARGET_ENE_0, 6, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act12(ai, goal, paramTbl)
    local animationId = 3020
    local successDistance = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act13(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, 2, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act14(ai, goal, paramTbl)
    local stopDist = 5.6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 5.6 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local forceRunMinDist = 5.6 - ai:GetMapHitRadius(TARGET_SELF) + 3
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 6
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3015
    local animationId2 = 3018
    local successDistance2 = 2.5 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local successDistance = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 10 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    elseif random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, 6, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId2, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, 6, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act15(ai, goal, paramTbl)
    local animationId = 3014
    local successDistance = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local f17_local2 = 0
    local f17_local3 = 0
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId, TARGET_ENE_0, successDistance, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_Act20(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 30)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Saw126020_ActAfter_AdjustSpace(ai, goal, paramTbl)
    
end

Goal.Update = function (self, ai, goal)
    return Update_Default_NoSubGoal(self, ai, goal)
    
end

Goal.Terminate = function (self, ai, goal)
    
end

Goal.Interrupt = function (self, ai, goal)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    if ai:GetSpecialEffectActivateInterruptType(0) == 5025 and random <= 35 then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) and distance <= 4 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 999, 0)
        elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) and distance <= 2 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, 999, 0)
        elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 90) and distance <= 2 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3000, TARGET_ENE_0, 999, 0)
        end
        return true
    end
    if ai:GetSpecialEffectActivateInterruptType(0) == 5026 and distance <= 3 then
        goal:ClearSubGoal()
        Hollow_Saw126020_Act15(ai, goal, paramTbl)
        return true
    end
    return false
    
end

Goal.Update = function (self, ai, goal)
    return Update_Default_NoSubGoal(self, ai, goal)
    
end

Goal.Terminate = function (self, ai, goal)
    
end


