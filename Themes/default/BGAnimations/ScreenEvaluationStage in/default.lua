local statsP1 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1);
local statsP2 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2);
local statsP3 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_3);
local statsP4 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_4);

local gradeP1 = statsP1:GetGrade();
local gradeP2 = statsP2:GetGrade();
local gradeP3 = statsP3:GetGrade();
local gradeP4 = statsP4:GetGrade();

local function failed(g)
	if g == "Grade_Failed" then
		return true;
	else
		return false;
	end
end


local img = "cleared text.png"

-- if (only P1) and (P1 failed)
if (GAMESTATE:IsHumanPlayer(PLAYER_1) and failed(gradeP1) and not GAMESTATE:IsHumanPlayer(PLAYER_2) and not GAMESTATE:IsHumanPlayer(PLAYER_3) and not GAMESTATE:IsHumanPlayer(PLAYER_4)) then
	img = "failed text.png"
	
-- if (only P2) and (P2 failed)	
elseif (GAMESTATE:IsHumanPlayer(PLAYER_2) and failed(gradeP2) and not GAMESTATE:IsHumanPlayer(PLAYER_1) and not GAMESTATE:IsHumanPlayer(PLAYER_3) and not GAMESTATE:IsHumanPlayer(PLAYER_4)) then
	img = "failed text.png"

-- if (all Players) and (all players failed)	
elseif (GAMESTATE:IsHumanPlayer(PLAYER_1) and GAMESTATE:IsHumanPlayer(PLAYER_2) and GAMESTATE:IsHumanPlayer(PLAYER_3) and GAMESTATE:IsHumanPlayer(PLAYER_4) and failed(gradeP1) and failed(gradeP2) and failed(gradeP3) and failed(gradeP4) ) then
	img = "failed text.png"
	
end


local t = Def.ActorFrame {
	InitCommand=cmd(xy,_screen.cx, _screen.cy);
	
	Def.Quad{
		InitCommand=cmd(zoomto,_screen.w,_screen.h; diffuse,color("0,0,0,1"););
		OnCommand=cmd(sleep,0.2; linear,0.5;  diffusealpha,0);
	};
	
	LoadActor(img)..{
		InitCommand=cmd(zoom,0.8; diffusealpha,0;);
		OnCommand=cmd(accelerate,0.4;diffusealpha,1; sleep,1.3; decelerate,0.4;diffusealpha,0);
	}
	
};

return t;
