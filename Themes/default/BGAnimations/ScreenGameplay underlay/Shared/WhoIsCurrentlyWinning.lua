return Def.Actor{
	JudgmentMessageCommand=cmd(queuecommand, "Winning"),
	WinningCommand=function(self)
		local dpP1 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetPercentDancePoints()
		local dpP2 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetPercentDancePoints()
		local dpP3 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_3):GetPercentDancePoints()
		local dpP4 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_4):GetPercentDancePoints()

		local p1_score = self:GetParent():GetChild("P1Score")
		local p2_score = self:GetParent():GetChild("P2Score")
		local p3_score = self:GetParent():GetChild("P3Score")
		local p4_score = self:GetParent():GetChild("P4Score")

		if dpP1 == dpP2 == dpP3 == dpP4 then --P1=P2=P3=P4 All 4/4
			p1_score:diffusealpha(1.00)
			p2_score:diffusealpha(1.00)
			p3_score:diffusealpha(1.00)
			p4_score:diffusealpha(1.00)
		elseif dpP2 == dpP3 == dpP4 > dpP1 then -- P2=P3=P4>P1 3/4
			p1_score:diffusealpha(0.50)
			p2_score:diffusealpha(1.00)
			p3_score:diffusealpha(1.00)
			p4_score:diffusealpha(1.00)
		elseif dpP1 == dpP3 == dpP4 > dpP2 then -- P1=P3=P4>P2 3/4
			p1_score:diffusealpha(1.00)
			p2_score:diffusealpha(0.50)
			p3_score:diffusealpha(1.00)
			p4_score:diffusealpha(1.00)
		elseif dpP1 == dpP2 == dpP4 > dpP3 then -- P1=P2=P4>P3 3/4
			p1_score:diffusealpha(1.00)
			p2_score:diffusealpha(1.00)
			p3_score:diffusealpha(0.50)
			p4_score:diffusealpha(1.00)
		elseif dpP1 == dpP2 == dpP3 > dpP4 then -- P1=P2=P3>P4 3/4
			p1_score:diffusealpha(1.00)
			p2_score:diffusealpha(1.00)
			p3_score:diffusealpha(1.00)
			p4_score:diffusealpha(0.50)
		elseif dpP1 == dpP2 > dpP3 and dpP4 then -- P1=P2>P3&P4 2/4
			p1_score:diffusealpha(1.00)
			p2_score:diffusealpha(1.00)
			p3_score:diffusealpha(0.50)
			p4_score:diffusealpha(0.50)
		elseif dpP2 == dpP3 > dpP1 and dpP4 then -- P2=P3>P1&P4 2/4
			p1_score:diffusealpha(0.50)
			p2_score:diffusealpha(1.00)
			p3_score:diffusealpha(1.00)
			p4_score:diffusealpha(0.50)
		elseif dpP3 == dpP4 > dpP1 and dpP2 then -- P3=P4>P1&P2 2/4
			p1_score:diffusealpha(0.50)
			p2_score:diffusealpha(0.50)
			p3_score:diffusealpha(1.00)
			p4_score:diffusealpha(1.00)
		elseif dpP4 == dpP1 > dpP2 and dpP3 then -- P4=P1>P2&P3 2/4
			p1_score:diffusealpha(1.00)
			p2_score:diffusealpha(0.50)
			p3_score:diffusealpha(0.50)
			p4_score:diffusealpha(1.00)
		elseif dpP1 == dpP3 > dpP2 and dpP4 then -- P1=P3>P2&P4 2/4
			p1_score:diffusealpha(1.00)
			p2_score:diffusealpha(0.50)
			p3_score:diffusealpha(1.00)
			p4_score:diffusealpha(0.50)
		elseif dpP2 == dpP4 > dpP1 and dpP3 then -- P2=P4>P1&P3 2/4
			p1_score:diffusealpha(0.50)
			p2_score:diffusealpha(1.00)
			p3_score:diffusealpha(0.50)
			p4_score:diffusealpha(1.00)
		elseif dpP1 > dpP2 and dpP3 and dpP4 then -- P1>P2&P3&P4 1/4
			p1_score:diffusealpha(1.00)
			p2_score:diffusealpha(0.50)
			p3_score:diffusealpha(0.50)
			p4_score:diffusealpha(0.50)
		elseif dpP2 > dpP1 and dpP3 and dpP4 then -- P2>P1&P3&P4 1/4
			p1_score:diffusealpha(0.50)
			p2_score:diffusealpha(1.00)
			p3_score:diffusealpha(0.50)
			p4_score:diffusealpha(0.50)
		elseif dpP3 > dpP1 and dpP2 and dpP4 then -- P3>P1&P2&P4 1/4
			p1_score:diffusealpha(0.50)
			p2_score:diffusealpha(0.50)
			p3_score:diffusealpha(1.00)
			p4_score:diffusealpha(0.50)
		elseif dpP4 > dpP1 and dpP2 and dpP3 then -- P4>P1&P2&P3 1/4
			p1_score:diffusealpha(0.50)
			p2_score:diffusealpha(0.50)
			p3_score:diffusealpha(0.50)
			p4_score:diffusealpha(1.00)
		end
	end
}
