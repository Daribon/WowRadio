local L = AceLibrary("AceLocale-2.2"):new("WowRadio")

L:RegisterTranslations("enUS", function() return {
	["usage"] 			= "Usage",
	["wrtune"] 			= "select radio station",
	["wrcustom"] 		= "Plays given url.",
	["wrlist"] 			= "Overview of radio stations.",
	["wrinfo"] 			= "Displays station which is played.",
	["wrplay"] 			= "Starts music.",
	["wrstop"] 			= "Stops music.",
	["wrnext"] 			= "Switch to next station.",
	["wrprev"] 			= "Switch to previous station.",
	["wrrnd"] 			= "Switch to random radio station.",
	["wrauto"]  		= "Toggles autostart on / off.",
	["wrauto_enabled"]	= "Autostart is now enabled",
	["wrauto_disabled"]	= "Autostart is now disabled",
	["msg_enabled"] 	= "WowRadio loaded. /wr for options.",
} end);