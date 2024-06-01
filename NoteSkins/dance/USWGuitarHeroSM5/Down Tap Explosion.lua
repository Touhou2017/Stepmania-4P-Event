local sButton = Var "Button";

local Colour = {
	Up = "#FFFF00",
	Down = "#FF0000",
	Left = "#00FF00",
	Right = "#449ce4",
};

local t = Def.ActorFrame {
	Def.Sprite {
		Texture="_Tap Explosion(doubleres).png";
		W1Command=cmd(z,16;valign,0.75;rotationx,90;zoom,1;diffuse,1,0.5,0,1;linear,0.1;zoom,1.5;diffusealpha,0);
		W2Command=cmd(z,16;valign,0.75;rotationx,90;zoom,1;diffuse,1,0.5,0,1;linear,0.1;zoom,1.5;diffusealpha,0);
		W3Command=cmd(z,16;valign,0.75;rotationx,90;zoom,1;diffuse,1,0.5,0,1;linear,0.1;zoom,1.5;diffusealpha,0);
		W4Command=cmd(diffusealpha,0);
		W5Command=cmd(diffusealpha,0);
		MissCommand=cmd(diffusealpha,0);
	};
	LoadActor(NOTESKIN:GetPath( "_Receptor", "Bottom" ))..{
		W1Command=cmd(diffusealpha,0);
		W2Command=cmd(diffusealpha,0);
		W3Command=cmd(diffusealpha,0);
		W4Command=cmd(diffusealpha,0);
		W5Command=cmd(diffusealpha,0);
		HoldingOnCommand=cmd(diffuse,color(Colour[sButton]));	
		HoldingOffCommand=cmd(diffusealpha,0);
	};
	Def.ActorFrame {
		W1Command=cmd(diffusealpha,0);
		W2Command=cmd(diffusealpha,0);
		W3Command=cmd(diffusealpha,0);
		W4Command=cmd(diffusealpha,0);
		W5Command=cmd(diffusealpha,0);
		HoldingOnCommand=cmd(stoptweening;diffusealpha,1;sleep,0.001;bounceend,0.05;z,24);
		Def.Quad {
			HoldingOnCommand=cmd(valign,0;rotationx,90;diffuse,color("0.5,0.5,0.5,1");scaletoclipped,30,1;bounceend,0.05;zoomy,45);
			HoldingOffCommand=cmd(bounceend,0.05;zoomy,0)
		};
		LoadActor(NOTESKIN:GetPath( "_Receptor", "Middle" ))..{
		};
		LoadActor(NOTESKIN:GetPath( "_Receptor", "Top2" ))..{
			HoldingOnCommand=cmd(diffuse,color(Colour[sButton]));	
		};
		HoldingOffCommand=cmd(stoptweening;bounceend,0.05;z,0;sleep,0.001;diffusealpha,0);
	};
	LoadActor(NOTESKIN:GetPath( "_Receptor", "Back" ))..{
		W1Command=cmd(diffuse,color(Colour[sButton]));	
		W2Command=cmd(diffuse,color(Colour[sButton]));	
		W3Command=cmd(diffuse,color(Colour[sButton]));	
		W4Command=cmd(diffuse,color(Colour[sButton]));	
		W5Command=cmd(diffuse,color(Colour[sButton]));	
		MissCommand=cmd(diffuse,color(Colour[sButton]));	
	};
	
	Def.Sprite {
		Texture="_Hold Explosion(doubleres).png";
		W1Command=cmd(diffusealpha,0);
		W2Command=cmd(diffusealpha,0);
		W3Command=cmd(diffusealpha,0);
		W4Command=cmd(diffusealpha,0);
		W5Command=cmd(diffusealpha,0);
		HoldingOnCommand=cmd(z,20;zoomy,1.5;valign,0.75;rotationx,90;diffuse,1,0.5,0,1;queuecommand,"Move");
		MoveCommand=cmd(rotationy,0;sleep,0.1;rotationy,180;sleep,0.1;queuecommand,"Move");
		HoldingOffCommand=cmd(linear,0.1;diffusealpha,0);
	};
};

for i=1,10 do
	t[#t+1] = Def.ActorFrame {
		Def.ActorFrame {
			HoldingOnCommand=cmd(queuecommand,"Move");
			MoveCommand=function(self)
				self:zoom(0.1*math.random(1,6));
				self:diffusealpha(1)
				self:x(0);
				self:z(24);
				self:linear(0.02*math.random(1,10));
				self:x(10*math.random(-4,4));
				self:z(24+(10*math.random(1,6)));
				self:linear(0.05);
				self:diffusealpha(0)
				self:linear(0.1);
				self:queuecommand("Move");
			end;
			LoadActor(NOTESKIN:GetPath( "_Hold", "Explosion Part" ))..{
				W1Command=cmd(diffusealpha,0);
				W2Command=cmd(diffusealpha,0);
				W3Command=cmd(diffusealpha,0);
				W4Command=cmd(diffusealpha,0);
				W5Command=cmd(diffusealpha,0);
				HoldingOnCommand=cmd(diffuse,1,0.5,0,1);
				HoldingOffCommand=cmd(diffusealpha,0);
			};
		};
	};
end;

return t;

