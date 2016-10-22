local frame = CreateFrame("FRAME");
frame:RegisterEvent("CALENDAR_UPDATE_EVENT_LIST");
frame:RegisterEvent("PLAYER_ENTERING_WORLD");
local function getData(self,event,...)
	if event == "CALENDAR_UPDATE_EVENT_LIST" then
		GuildEvents = "";
		numberEvents = CalendarGetNumGuildEvents();
		for i=1, numberEvents do
			month, day, weekday, hour, minute, eventType, title, calendarType, textureName = CalendarGetGuildEventInfo(i)
			GuildEvents = GuildEvents .. month .. "," .. day .. "," .. weekday .. "," .. hour .. "," .. minute .. "," .. eventType .. "," .. title .. "," .. calendarType .. "," .. textureName .. ";";
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		OpenCalendar();
	end
end

frame:SetScript("OnEvent", getData);