local sButton = Var "Button";

Colour = {
	Up = "Yellow",
	Down = "Red",
	Left = "Green",
	Right = "Blue",
};

local t = Def.ActorFrame {
	Def.Model {
		Meshes=NOTESKIN:GetPath("","Tex/_Tap Note "..Colour[sButton]);
		Materials=NOTESKIN:GetPath("","Tex/_Tap Note "..Colour[sButton]);
		Bones=NOTESKIN:GetPath("","Tex/_Tap Note "..Colour[sButton]);
	};
};

return t;
