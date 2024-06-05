local t = Def.ActorFrame{}
local game = GAMESTATE:GetCurrentGame():GetName()
local Players = GAMESTATE:GetHumanPlayers()

local Highlights = {
	Start={		x=0, 	y=66, 	rotationz=0, 	zoom=0.5, graphic="highlightgreen.png", visible=false },
	Select={	x=0, 	y=95,	rotationz=180, 	zoom=0.5, graphic="highlightred.png" },
	MenuRight={	x=37, 	y=80, 	rotationz=0, 	zoom=0.5, graphic="highlightarrow.png" },
	MenuLeft={	x=-37, 	y=80, 	rotationz=180,	zoom=0.5, graphic="highlightarrow.png" },
	
	UpLeft={	x=-67,	y=-148, rotationz=0,	zoom=0.4, graphic="highlight.png" },	
	Up={		x=0, 	y=-184, rotationz=0,	zoom=0.3, graphic="highlight.png" },
	UpRight={	x=67, 	y=-148, rotationz=0,	zoom=0.4, graphic="highlight.png" },
	
	Left={		x=-34,	y=-150,	rotationz=0,	zoom=0.3, graphic="highlight.png" },
	Center={	x=0, 	y=-80,	rotationz=0,	zoom=0.4, graphic="highlight.png" },
	Right={		x=34, 	y=-150,	rotationz=0,	zoom=0.3, graphic="highlight.png" },

	DownLeft={	x=-67,	y=-12,	rotationz=0,	zoom=0.4, graphic="highlight.png" },	
	Down={		x=0,	y=-116,	rotationz=0,	zoom=0.3, graphic="highlight.png" },
	DownRight={	x=67, 	y=-12,	rotationz=0,	zoom=0.4, graphic="highlight.png" }
}

for pn in ivalues(Players) do
	
 	local PlayerPad = Def.ActorFrame{
		InitCommand=function(self)
			self:diffusealpha(0);
			if pn == PLAYER_1 then
				self:x(_screen.cx-320);
				self:y(_screen.cy+50);
			elseif pn == PLAYER_2 then
				self:x(_screen.cx-110);
				self:y(_screen.cy+50);
			elseif pn == PLAYER_3 then
				self:x(_screen.cx+110);
				self:y(_screen.cy+50);
			elseif pn == PLAYER_4 then
				self:x(_screen.cx+320);
				self:y(_screen.cy+50);
			elseif pn == PLAYER_5 then
				self:x(_screen.cx-320);
				self:y(_screen.cy+42069);
			elseif pn == PLAYER_6 then
				self:x(_screen.cx-110);
				self:y(_screen.cy+42069);
			elseif pn == PLAYER_7 then
				self:x(_screen.cx+110);
				self:y(_screen.cy+42069);
			elseif pn == PLAYER_8 then
				self:x(_screen.cx+320);
				self:y(_screen.cy+42069);
			end

		end;
		OnCommand=cmd(linear,0.3;diffusealpha,1);
		OffCommand=cmd(linear,0.2;diffusealpha,0);
	
		LoadFont("_wendy small")..{
			Text="PLAYER "..ToEnumShortString(pn):gsub("P","");
			InitCommand=cmd(y,-210;zoom,0.3)
		};
		LoadActor(game..".png")..{
			InitCommand=cmd(y,-150; zoom,0.4);
		};
		-- LoadActor("buttons.png")..{
			-- InitCommand=cmd(y,80; zoom,0.2);
		-- };
	}
	
	for panel,values in pairs(Highlights) do
		PlayerPad[#PlayerPad+1] = LoadActor( values.graphic )..{
			InitCommand=cmd(xy,values.x, values.y; rotationz,values.rotationz; zoom, values.zoom; diffusealpha,0);
			[ToEnumShortString(pn) .. panel .."OnMessageCommand"]=cmd(diffusealpha,1);
			[ToEnumShortString(pn) .. panel .."OffMessageCommand"]=cmd(diffusealpha,0);
		}
	end
	
	t[#t+1] = PlayerPad
	
end

return t;
