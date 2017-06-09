WowRadio v0.4									2006/12/25
WowRadio v0.4a 									2015/08/30

Listen to Internet Radio while playing World of Warcraft.

 - addon based on Ace2
 - 9 radio stations included
 - easy way to change stations in Stations.lua:
   just change url and message which will be displayed.
 - Titan Panel for station navigation.

Note: to listen to Internet Radio, you need to enable ingame music.

Type /wowradio or /wr for options

list of commands:

/wrtune		switch to station by given number (e.g. /wrtune 10)
/wrplay		plays last set radio station
/wrstop		stops music
/wrnext		switch to next station
/wrprev		switch to previous station
/wrrnd		switch to random station
/wrlist		prints out a list of stations available
/wrinfo		displays which station is currently played
/wrauto		toggles autostart on/off
/wrcustom	plays given url (only works via commandline, not included in Titan Panel)

If you are updating a previous version and changed radio stations in Core.lua (version 0.3) 
copy your stations into Stations.lua (just the contents between {} for Urls and messages) 
before updating. /wrauto command gets overwritten by Titan Panel Plugin (if used).

Known Issues: none.

So have fun with this one, hope you like it.

Changelog:
-- 0.4a Backported to vanilla
-- 0.4 	/wrinfo now correctly shows url if playing custom url 
--     	Titan Panel Plugin included
-- 	moved stations to Stations.lua
