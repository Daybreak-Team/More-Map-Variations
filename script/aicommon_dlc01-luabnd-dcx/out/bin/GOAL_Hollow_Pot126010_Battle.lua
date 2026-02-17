RegisterTableGoal(GOAL_Hollow_Pot126010_Battle, "GOAL_Hollow_Pot126010_Battle")

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
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local f2_local5 = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkattr_doAdmirer)
    local f2_local6 = ai:GetNpcThinkParamID()
    if ai:HasSpecialEffectId(TARGET_SELF, 3126000) then
        probabilities[4] = 30
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 120) and distance < 2.5 then
        probabilities[3] = 80
        probabilities[20] = 20
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 120) and distance < 2.5 then
        probabilities[2] = 80
        probabilities[20] = 20
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 240) then
        probabilities[20] = 100
    elseif f2_local6 == 12600010 then
        if distance >= 7 then
            probabilities[1] = 60
            probabilities[5] = 25
            probabilities[6] = 15
        elseif distance >= 2 then
            probabilities[1] = 60
            probabilities[5] = 20
            probabilities[6] = 25
        else
            probabilities[1] = 55
            probabilities[5] = 10
            probabilities[6] = 35
        end
    elseif ai:GetHpRate(TARGET_SELF) <= 0.5 then
        probabilities[4] = 100
    elseif distance >= 7 then
        probabilities[1] = 60
        probabilities[5] = 25
        probabilities[6] = 15
    elseif distance >= 2 then
        probabilities[1] = 60
        probabilities[5] = 20
        probabilities[6] = 20
    else
        probabilities[1] = 55
        probabilities[5] = 10
        probabilities[6] = 35
    end
    acts[1] = REGIST_FUNC(ai, goal, Hollow_Pot126010_Act01)
    acts[2] = REGIST_FUNC(ai, goal, Hollow_Pot126010_Act02)
    acts[3] = REGIST_FUNC(ai, goal, Hollow_Pot126010_Act03)
    acts[4] = REGIST_FUNC(ai, goal, Hollow_Pot126010_Act04)
    acts[5] = REGIST_FUNC(ai, goal, Hollow_Pot126010_Act05)
    acts[6] = REGIST_FUNC(ai, goal, Hollow_Pot126010_Act06)
    acts[7] = REGIST_FUNC(ai, goal, Hollow_Pot126010_Act07)
    acts[20] = REGIST_FUNC(ai, goal, Hollow_Pot126010_Act20)
    local actAfter = REGIST_FUNC(ai, goal, Hollow_Pot126010_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
    
end

function Hollow_Pot126010_Act01(ai, goal, paramTbl)
    local stopDist = 1.8 - ai:GetMapHitRadius(TARGET_SELF) + 1.5
    local canRunDist = 1.8 - ai:GetMapHitRadius(TARGET_SELF) + 998
    local forceRunMinDist = 1.8 - ai:GetMapHitRadius(TARGET_SELF) + 999
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 8
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3000
    local animationId2 = 3003
    local successDistance2 = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local successDistance = 999
    local turnTime = -1
    local turnFaceAngle = 45
    local random = ai:GetRandam_Int(1, 100)
    if random <= 10 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    elseif random <= 25 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
    elseif random <= 45 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
    elseif random <= 70 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Pot126010_Act02(ai, goal, paramTbl)
    local f4_local0 = 2.3 - ai:GetMapHitRadius(TARGET_SELF) + 1.5
    local f4_local1 = 2.3 - ai:GetMapHitRadius(TARGET_SELF) + 998
    local f4_local2 = 2.3 - ai:GetMapHitRadius(TARGET_SELF) + 999
    local f4_local3 = 0
    local f4_local4 = 0
    local f4_local5 = 3
    local f4_local6 = 8
    local animationId = 3007
    local animationId2 = 3003
    local successDistance2 = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local successDistance = 999
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 10 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    elseif random <= 25 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
    elseif random <= 45 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
    elseif random <= 70 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Pot126010_Act03(ai, goal, paramTbl)
    local f5_local0 = 2.3 - ai:GetMapHitRadius(TARGET_SELF) + 1.5
    local f5_local1 = 2.3 - ai:GetMapHitRadius(TARGET_SELF) + 998
    local f5_local2 = 2.3 - ai:GetMapHitRadius(TARGET_SELF) + 999
    local f5_local3 = 0
    local f5_local4 = 0
    local f5_local5 = 3
    local f5_local6 = 8
    local animationId = 3008
    local animationId2 = 3003
    local successDistance2 = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local successDistance = 999
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 10 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    elseif random <= 25 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
    elseif random <= 45 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
    elseif random <= 70 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId2, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Pot126010_Act04(ai, goal, paramTbl)
    local stopDist = 14.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 14.8 - ai:GetMapHitRadius(TARGET_SELF) + 998
    local forceRunMinDist = 14.8 - ai:GetMapHitRadius(TARGET_SELF) + 999
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 4
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3010
    local successDistance = 999
    local turnTime = -1
    local turnFaceAngle = 60
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Pot126010_Act05(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Float(3, 6.5)
    if random + 2 <= distance then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 8, TARGET_ENE_0, random, TARGET_SELF, false, 9920)
    elseif random <= distance then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 8, TARGET_ENE_0, random, TARGET_SELF, true, 9920)
    else
        local animationId = 3001
        local turnTime = -1
        local turnFaceAngle = 90
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, 999, turnTime, turnFaceAngle, 0, 0)
    end
    local distance = ai:GetDist(TARGET_ENE_0)
    local f15_local1 = ai:GetNpcThinkParamID()
    if ai:GetHpRate(TARGET_SELF) <= 0.5 and not f15_local1 == 12600010 then
        local animationId = 3016
        local successDistance = 999
        local turnTime = -1
        local turnFaceAngle = 45
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    elseif distance <= 5 then
        local animationId = 3014
        local animationId3 = 3002
        local animationId2 = 3017
        local successDistance3 = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance2 = 4.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance = 999
        local turnTime = 0
        local turnFaceAngle = 0
        local random = ai:GetRandam_Int(1, 100)
        if random <= 0 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        elseif random <= 25 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 60 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 100 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        end
    elseif distance <= 10 then
        local animationId = 3004
        local animationId3 = 3002
        local animationId2 = 3017
        local successDistance3 = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance2 = 4.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance = 999
        local turnTime = 0
        local turnFaceAngle = 0
        local random = ai:GetRandam_Int(1, 100)
        if random <= 0 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        elseif random <= 30 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 70 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 100 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        end
    else
        local animationId = 3004
        local animationId3 = 3002
        local animationId2 = 3017
        local successDistance3 = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance2 = 4.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance = 999
        local turnTime = 0
        local turnFaceAngle = 0
        local random = ai:GetRandam_Int(1, 100)
        if random <= 0 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        elseif random <= 30 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 70 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 100 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        end
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Pot126010_Act06(ai, goal, paramTbl)
    local stopDist = 2.9 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 998
    local forceRunMinDist = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 999
    local runProb = 0
    local guardProb = 0
    local walkLife = 3
    local runLife = 6
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, walkLife, runLife)
    local animationId = 3018
    local successDistance = 999
    local turnTime = -1
    local turnFaceAngle = 60
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Pot126010_Act07(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Float(3, 6)
    if random + 1 <= distance then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 8, TARGET_ENE_0, random, TARGET_SELF, false, 9920)
    else
        local animationId = 3001
        local turnTime = -1
        local turnFaceAngle = 90
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, 999, turnTime, turnFaceAngle, 0, 0)
    end
    local distance = ai:GetDist(TARGET_ENE_0)
    local f15_local1 = ai:GetNpcThinkParamID()
    if ai:GetHpRate(TARGET_SELF) <= 0.5 and not f15_local1 == 12600010 then
        local animationId = 3016
        local successDistance = 999
        local turnTime = -1
        local turnFaceAngle = 45
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    elseif distance <= 5 then
        local animationId = 3014
        local animationId3 = 3002
        local animationId2 = 3017
        local successDistance3 = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance2 = 4.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance = 999
        local turnTime = 0
        local turnFaceAngle = 0
        local random = ai:GetRandam_Int(1, 100)
        if random <= 0 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        elseif random <= 25 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 60 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 100 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        end
    elseif distance <= 10 then
        local animationId = 3004
        local animationId3 = 3002
        local animationId2 = 3017
        local successDistance3 = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance2 = 4.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance = 999
        local turnTime = 0
        local turnFaceAngle = 0
        local random = ai:GetRandam_Int(1, 100)
        if random <= 0 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        elseif random <= 30 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 70 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 100 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        end
    else
        local animationId = 3004
        local animationId3 = 3002
        local animationId2 = 3017
        local successDistance3 = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance2 = 4.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance = 999
        local turnTime = 0
        local turnFaceAngle = 0
        local random = ai:GetRandam_Int(1, 100)
        if random <= 0 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        elseif random <= 30 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 70 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 100 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        end
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Pot126010_Act20(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 45, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Hollow_Pot126010_ActAfter_AdjustSpace(ai, goal, paramTbl)
    
end

Goal.Update = function (self, ai, goal)
    return Update_Default_NoSubGoal(self, ai, goal)
    
end

Goal.Terminate = function (self, ai, goal)
    
end

Goal.Interrupt = function (self, ai, goal)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    if ai:GetSpecialEffectActivateInterruptType(0) == 5025 and random <= 50 then
        goal:ClearSubGoal()
        Hollow_Pot126010_Act07(ai, goal, paramTbl)
        return true
    end
    return false
    
end

RegisterTableGoal(GOAL_Hollow_Pot126010_SelectAttack, "Hollow_Pot126010_kamaeAttack")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Hollow_Pot126010_SelectAttack, true)

Goal.Activate = function (self, ai, goal)
    local distance = ai:GetDist(TARGET_ENE_0)
    local f15_local1 = ai:GetNpcThinkParamID()
    if ai:GetHpRate(TARGET_SELF) <= 0.5 and not f15_local1 == 12600010 then
        local animationId = 3016
        local successDistance = 999
        local turnTime = -1
        local turnFaceAngle = 45
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
    elseif distance <= 5 then
        local animationId = 3014
        local animationId3 = 3002
        local animationId2 = 3017
        local successDistance3 = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance2 = 4.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance = 999
        local turnTime = 0
        local turnFaceAngle = 0
        local random = ai:GetRandam_Int(1, 100)
        if random <= 0 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        elseif random <= 25 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 60 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 100 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        end
    elseif distance <= 10 then
        local animationId = 3004
        local animationId3 = 3002
        local animationId2 = 3017
        local successDistance3 = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance2 = 4.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance = 999
        local turnTime = 0
        local turnFaceAngle = 0
        local random = ai:GetRandam_Int(1, 100)
        if random <= 0 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        elseif random <= 30 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 70 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 100 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        end
    else
        local animationId = 3004
        local animationId3 = 3002
        local animationId2 = 3017
        local successDistance3 = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance2 = 4.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
        local successDistance = 999
        local turnTime = 0
        local turnFaceAngle = 0
        local random = ai:GetRandam_Int(1, 100)
        if random <= 0 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance, turnTime, turnFaceAngle, 0, 0)
        elseif random <= 30 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance2, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 70 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        elseif random <= 100 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDistance3, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance3, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId3, TARGET_ENE_0, successDistance2, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId2, TARGET_ENE_0, successDistance, 0, 0)
        end
    end
    
end

Goal.Update = function (self, ai, goal)
    return Update_Default_NoSubGoal(self, ai, goal)
    
end


