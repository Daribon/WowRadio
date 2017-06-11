local L = AceLibrary("AceLocale-2.2"):new("WowRadio")

L:RegisterTranslations("deDE", function() return {
	["usage"] 			= "Benutzung",
	["wrtune"] 			= "Radiostation w\195\164hlen",
	["wrcustom"] 		= "Spielt die angegebene Url ab.",
	["wrlist"] 			= "Zeigt Liste aller Radiostationen.",	
	["wrinfo"] 			= "Zeigt an welche Station gerade gespielt wird.",		
	["wrplay"] 			= "Startet die Musikwiedergabe.",		
	["wrstop"] 			= "Stoppt die Musikwiedergabe.",		
	["wrnext"] 			= "Springt zur n\195\164chsten Station.",
	["wrprev"] 			= "Springt zur vorherigen Station.",	
	["wrrnd"] 			= "Spielt zuf\195\164llige Radiostation ab.",	
	["wrauto"]  		= "Schaltet Autostart ein / aus",
	["wrauto_enabled"]	= "Autostart ist jetzt aktiviert",
	["wrauto_disabled"]	= "Autostart ist jetzt deaktiviert",
	["msg_enabled"] 	= "WowRadio geladen. /wr für Optionen.",	
} end);
