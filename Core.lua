local L = AceLibrary("AceLocale-2.2"):new("WowRadio") 
local version = "0.4a"
local customUrl = nil
local stopped = false
WowRadio = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0", "AceDB-2.0")
WowRadio:RegisterChatCommand({ "/wowradio", "/wr" }, {
	type = 'execute',
	name = "usage",
	desc = "",
	func = "usage",
}, "WOWRADIO00")
WowRadio:RegisterChatCommand({"/wrtune"}, {
	type = 'text',
	name = "tune",
	desc = "",
	usage = "",
	get = false,
	set = "setStation",
}, "WOWRADIO01")
WowRadio:RegisterChatCommand({"/wrplay"}, {
	type = 'execute',
	name = "play",
	desc = "",
	func = "play",
}, "WOWRADIO02")
WowRadio:RegisterChatCommand({"/wrstop"}, {
	type = 'execute',
	name = "stop",
	desc = "",
	func = "stop",
}, "WOWRADIO03")
WowRadio:RegisterChatCommand({"/wrnext"}, {
	type = 'execute',
	name = "next",
	desc = "",
	func = "next",
}, "WOWRADIO04")
WowRadio:RegisterChatCommand({"/wrprev"}, {
	type = 'execute',
	name = "prev",
	desc = "",
	func = "prev",
}, "WOWRADIO05")
WowRadio:RegisterChatCommand({"/wrrnd"}, {
	type = 'execute',
	name = "rnd",
	desc = "",
	func = "rnd",
}, "WOWRADIO06")
WowRadio:RegisterChatCommand({"/wrlist"}, {
	type = 'execute',
	name = "list",
	desc = "",
	func = "list",
}, "WOWRADIO07")
WowRadio:RegisterChatCommand({"/wrinfo"}, {
	type = 'execute',
	name = "info",
	desc = "",
	func = "info",
}, "WOWRADIO08")
WowRadio:RegisterChatCommand({"/wrauto"}, {
	type = 'execute',
	name = "autostart",
	desc = "",
	func = "toggleAutostart",            
}, "WOWRADIO09")
WowRadio:RegisterChatCommand({"/wrcustom"}, {
	type = 'text',
	name = "custom",
	desc = "",
	usage = "",
	get = false,
	set = "url",
}, "WOWRADIO10")
WowRadio:RegisterDB("WowRadioDB","WowRadioDBPC")
WowRadio:RegisterDefaults("account", { 
		autostart = false,
		station = 1,
	} 
)

function WowRadio:OnEnable()
	if(WowRadio:isAutostart() == true) then
		WowRadio:play()
	end
	self:Print(L["msg_enabled"])
end

function WowRadio:setStation(arg)
	if not type(arg) == 'number' then 
		wr_msg("invalid argument");
		return 
	end
	station = tonumber(arg)
    WowRadio:play(station)
    self.db.account.station = station
end

function WowRadio:getStation()
    return tonumber(self.db.account.station)
end

function WowRadio:toggleAutostart()
    self.db.account.autostart = not self.db.account.autostart
    if(self.db.account.autostart == true) then
		wr_msg("|cff7FFF7FWowRadio: "..L["wrauto_enabled"]..":|r")    
    else
		wr_msg("|cff7FFF7FWowRadio: "..L["wrauto_disabled"]..":|r")        
    end
end

function WowRadio:isAutostart()
    return self.db.account.autostart
end

function WowRadio:info()
	if customUrl == nil then
    	wr_alert("["..WowRadio:getStation().."] "..stationMsg[WowRadio:getStation()])
   	else
   		wr_alert("[custom] "..customUrl)
   	end
end

function WowRadio:play(station)
	if station == nil then
		station = WowRadio:getStation()
	elseif(station > table.getn(stationUrl)) then
		station = 1
	elseif (station<1) then
		station = table.getn(stationUrl)
	end
	wr_alert("["..station.."] "..stationMsg[station])
	PlayMusic(stationUrl[station])
	self.db.account.station = station
	stopped = false
	customUrl = nil
end

function WowRadio:stop()
	StopMusic()
	stopped = true
	wr_alert("Music stopped.")
end

function WowRadio:next()
	station = WowRadio:getStation()+1
	WowRadio:play(station)
end

function WowRadio:prev()
	station = WowRadio:getStation()-1
	WowRadio:play(station)
end

function WowRadio:rnd()
	WowRadio:play(math.random(table.getn(stationUrl)))
end

function WowRadio:url(url)
	wr_alert(url)
	customUrl = url
	PlayMusic(url)
	stopped = false
end

function WowRadio:usage()
	wr_msg("|cff7FFF7FWowRadio "..version.." "..L["usage"]..":|r")
	wr_msg("|cffFFFF00/wrtune - |r|cffFFFFFF"..L["wrtune"].."|r")
	wr_msg("|cffFFFF00/wrplay - |r|cffFFFFFF"..L["wrplay"].."|r")
	wr_msg("|cffFFFF00/wrstop - |r|cffFFFFFF"..L["wrstop"].."|r")
	wr_msg("|cffFFFF00/wrnext - |r|cffFFFFFF"..L["wrnext"].."|r")
	wr_msg("|cffFFFF00/wrprev - |r|cffFFFFFF"..L["wrprev"].."|r")
	wr_msg("|cffFFFF00/wrrnd - |r|cffFFFFFF"..L["wrrnd"].."|r")
	wr_msg("|cffFFFF00/wrlist - |r|cffFFFFFF"..L["wrlist"].."|r")
	wr_msg("|cffFFFF00/wrinfo - |r|cffFFFFFF"..L["wrinfo"].."|r")
	wr_msg("|cffFFFF00/wrauto - |r|cffFFFFFF"..L["wrauto"].."|r")
	wr_msg("|cffFFFF00/wrcustom - |r|cffFFFFFF"..L["wrcustom"].."|r")
end

function WowRadio:list()
	for index,value in ipairs(stationMsg) do 
		wr_msg("["..index.."] ".. value) 
	end
end

function wr_alert(txt)
	if (IsAddOnLoaded("SCT")) then
    	SCT:DisplayMessage(txt,{r=1,g=1,b=1})
	    wr_msg(txt)
    else
    	UIErrorsFrame:AddMessage(txt,1, 1, 1, 1,4)
    	wr_msg(txt);
    end
end

function wr_msg(txt)
	DEFAULT_CHAT_FRAME:AddMessage(txt)
end

function WowRadio:getStationSize()
	return table.getn(stationUrl)
end

function WowRadio:getStationNames()
	return stationMsg
end

function WowRadio:getCustomUrl()
	return customUrl
end

function WowRadio:isStopped()
	return stopped
end

-----------------------------------------------------------------
-- WowRadio 
-- Author: Tormentor @Mannoroth
--
-- 0.3 initial beta release
--     
-- 0.4 info now correctly shows url if playing custom url 
--     Titan Panel Plugin included
--     moved stations to Stations.lua
--   
-----------------------------------------------------------------
