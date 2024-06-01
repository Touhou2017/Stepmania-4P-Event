local sButton = Var "Button";

local Position = {
	Up = {2.5,0},
	Down = {-2.5,0},
	Left = {-7.5,-5.5},
	Right = {7.5,-5.5},
};

local Colour2 = {
	Up = "#FFFF00",
	Down = "#FF0000",
	Left = "#00FF00",
	Right = "#449ce4",
};

local Colour = {
	Up = "Yellow",
	Down = "Red",
	Left = "Green",
	Right = "Blue",
};

local t = Def.ActorFrame {
	Def.Quad {
		OnCommand=cmd(diffuse,color("0,0,0,0.8");scaletoclipped,64,9001);
	};
	Def.Quad {
		OnCommand=cmd(valign,1;diffuse,color("0.5,0.5,0.5,1");scaletoclipped,2,9001);
	};
	Def.Quad {
		OnCommand=cmd(y,-22;rotationz,45;diffuse,color("0.5,0.5,0.5,1");scaletoclipped,32,32);
	};
	Def.Quad {
		OnCommand=cmd(y,-20;rotationz,45;diffuse,color("0,0,0,1");scaletoclipped,32,32);
	};
	LoadActor(NOTESKIN:GetPath( "_Receptor", "Bottom" ))..{
		OnCommand=cmd(diffuse,color(Colour2[sButton]));
	};
	Def.ActorFrame {
		W1Command=cmd(stoptweening;bounceend,0.05;z,24;bounceend,0.05;z,0);
		W2Command=cmd(stoptweening;bounceend,0.05;z,24;bounceend,0.05;z,0);
		W3Command=cmd(stoptweening;bounceend,0.05;z,24;bounceend,0.05;z,0);
		Def.Quad {
			OnCommand=cmd(valign,0;rotationx,90;diffuse,color("0.5,0.5,0.5,1");scaletoclipped,30,1);
			W1Command=cmd(stoptweening;bounceend,0.05;zoomy,45;bounceend,0.05;zoomy,0);
			W2Command=cmd(stoptweening;bounceend,0.05;zoomy,45;bounceend,0.05;zoomy,0);
			W3Command=cmd(stoptweening;bounceend,0.05;zoomy,45;bounceend,0.05;zoomy,0);
		};
		LoadActor(NOTESKIN:GetPath( "_Receptor", "Middle" ))..{
		};
		LoadActor(NOTESKIN:GetPath( "_Receptor", "Top1" ))..{
			OnCommand=cmd(diffuse,color(Colour2[sButton]));
		};
		LoadActor(NOTESKIN:GetPath( "_Receptor", "Top2" ))..{
			OnCommand=cmd(diffuse,color(Colour2[sButton]);diffusealpha,0);
			PressCommand=cmd(diffusealpha,1);
			LiftCommand=cmd(diffusealpha,0);	
		};
	};
};

return t;
