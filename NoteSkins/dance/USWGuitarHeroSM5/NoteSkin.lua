--Unlimited Stepman Works Noteskin.lua for SM 5.0.12

--I am the bone of my noteskin
--Arrows are my body, and explosions are my blood
--I have created over a thousand noteskins
--Unknown to death
--Nor known to life
--Have withstood pain to create many noteskins
--Yet these hands will never hold anything
--So as I pray, Unlimited Stepman Works

local USWN = {};

--Defining on which direction the other directions should be bassed on
--This will let us use less files which is quite handy to keep the noteskin directory nice
--Do remember this will Redirect all the files of that Direction to the Direction its pointed to
--If you only want some files to be redirected take a look at the "custom hold/roll per direction"
USWN.ButtonRedir =
{
	Up = "Down",
	Down = "Down",
	Left = "Down",
	Right = "Down",
};

-- Defined the parts to be rotated at which degree
USWN.Rotate =
{
	Up = 0,
	Down = 0,
	Left = 0,
	Right = 0,
};


--Define elements that need to be redirected
USWN.ElementRedir =
{
	["Tap Fake"] = "Tap Note",
	["Hold Head Inactive"] = "Tap Note",
	["Roll Head Inactive"] = "Tap Note",
	["Tap Explosion Bright"] = "Tap Explosion",
	["Tap Explosion Dim"] = "Tap Explosion",
	["Hold Explosion"] = "Tap Explosion",
	["Roll Explosion "] = "Tap Explosion",
	["Hold Body Active"] = "Hold Body",
	["Hold Body Inactive"] = "Hold Body",
	["Hold Bottomcap Active"] = "Hold Bottomcap",
	["Hold Bottomcap Inactive"] = "Hold Bottomcap",
};

-- Parts of noteskins which we want to rotate
USWN.PartsToRotate =
{
	["Receptor"] = true,
	["Tap Explosion Bright"] = true,
	["Tap Explosion Dim"] = true,
	["Tap Note"] = true,
	["Tap Fake"] = true,
	["Tap Addition"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true,
};

-- Parts that should be Redirected to _Blank.png
-- you can add/remove stuff if you want
USWN.Blank =
{
	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Roll Topcap Active"] = true,
	["Roll Topcap Inactive"] = true,
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true,
	["Hold Head Active"] = true,
	["Roll Head Active"] = true,
};

-- < 
--Between here we usally put all the commands the noteskin.lua needs to do, some are extern in other files
--If you need help with lua go to http://dguzek.github.io/Lua-For-SM5/API/Lua.xml there are a bunch of codes there
--Also check out common it has a load of lua codes in files there
--Just play a bit with lua its not that hard if you understand coding
--But SM can be an ass in some cases, and some codes jut wont work if you dont have the noteskin on FallbackNoteSkin=common in the metric.ini 
function USWN.Load()
	local sButton = Var "Button";
	local sElement = Var "Element";

	local Button = USWN.ButtonRedir[sButton] or sButton;	
	
	--Use diffrent Holds/Rolls for every direction
	if ( not string.find(sElement, "Head") and
	not string.find(sElement, "Explosion") ) and 
	( string.find(sElement, "Hold") or
	string.find(sElement, "Roll") ) then
		Button = sButton;
	end
	
	--Setting global element
	local Element = USWN.ElementRedir[sElement] or sElement;			
	--Returning first part of the code, The redirects, Second part is for commands
	local t = LoadActor(NOTESKIN:GetPath(Button,Element));
		
	--Set blank redirects
	if USWN.Blank[sElement] then
		t = Def.Actor {};
		--Check if element is sprite only
		if Var "SpriteOnly" then
			t = LoadActor(NOTESKIN:GetPath("","_blank"));
		end
	end
	
	if USWN.PartsToRotate[sElement] then
		t.BaseRotationZ = USWN.Rotate[sButton] or nil;
	end
	
	--Explosion should not be rotated, It calls other actors
	if sElement == "Explosion" then
		t.BaseRotationZ = nil;
	end
		
	return t;
end
-- >

-- dont forget to return cuz else it wont work ;>
return USWN;
