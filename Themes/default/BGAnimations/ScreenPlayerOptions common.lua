return Def.ActorFrame{
	-- this is broadcast from [OptionRow] TitleGainFocusCommand in metrics.ini
	-- we use it to color the active OptionRow's title appropriately by PlayerColor()
	OptionRowChangedMessageCommand=function(self, params)
		local CurrentRowIndex = {P1, P2, P3, P4}

		-- There is always the possibility that a diffuseshift is still active;
		-- cancel it now (and re-apply below, if applicable).
		params.Title:stopeffect()

		-- get the index of PLAYER_1's current row
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
			CurrentRowIndex.P1 = SCREENMAN:GetTopScreen():GetCurrentRowIndex(PLAYER_1)
		end

		-- get the index of PLAYER_2's current row
		if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
			CurrentRowIndex.P2 = SCREENMAN:GetTopScreen():GetCurrentRowIndex(PLAYER_2)
		end
		
		-- get the index of PLAYER_3's current row
		if GAMESTATE:IsPlayerEnabled(PLAYER_3) then
			CurrentRowIndex.P3 = SCREENMAN:GetTopScreen():GetCurrentRowIndex(PLAYER_3)
		end
		
		-- get the index of PLAYER_4's current row
		if GAMESTATE:IsPlayerEnabled(PLAYER_4) then
			CurrentRowIndex.P4 = SCREENMAN:GetTopScreen():GetCurrentRowIndex(PLAYER_4)
		end

		local optionRow = params.Title:GetParent():GetParent();

		-- color the active optionrow's title appropriately
		if optionRow:HasFocus(PLAYER_1) then
			params.Title:diffuse(PlayerColor(PLAYER_1))
		end

		if optionRow:HasFocus(PLAYER_2) then
			params.Title:diffuse(PlayerColor(PLAYER_2))
		end
		
		if optionRow:HasFocus(PLAYER_3) then
			params.Title:diffuse(PlayerColor(PLAYER_3))
		end
		
		if optionRow:HasFocus(PLAYER_4) then
			params.Title:diffuse(PlayerColor(PLAYER_4))
		end

		if CurrentRowIndex.P1 and CurrentRowIndex.P2 and CurrentRowIndex.P2 and CurrentRowIndex.P4 then
			if CurrentRowIndex.P1 == CurrentRowIndex.P2 == CurrentRowIndex.P3 == CurrentRowIndex.P4 then
				params.Title:diffuseshift()
				params.Title:effectcolor1(PlayerColor(PLAYER_1))
				params.Title:effectcolor2(PlayerColor(PLAYER_2))
				params.Title:effectcolor3(PlayerColor(PLAYER_3))
				params.Title:effectcolor4(PlayerColor(PLAYER_4))
			end
		end

	end
}
