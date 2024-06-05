local t = Def.ActorFrame{
	InitCommand=function(self) self:draworder(1) end
}

for player in ivalues({PLAYER_1, PLAYER_2, PLAYER_3, PLAYER_4}) do
	-- StepArtist Box
	t[#t+1] = LoadActor("./StepArtist.lua", PLAYER_1	)

	-- bouncing Cursor inside the Grid of difficulty blocks
	-- t[#t+1] = LoadActor("./Cursor.lua", player)

	-- Step Data (Number of steps, jumps, holds, etc.)
	--t[#t+1] = LoadActor("./PaneDisplay.lua", player)
end

return t
