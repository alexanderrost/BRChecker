--Currently only features druid Rebirth
--Will add ability to scan class later so that the addon fits all classes with a battle revive option

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(f, event)
    if event == "PLAYER_LOGIN" then
      print("You're using BattleresChecker!")
    end
end)

local function myChatFilter(self, event, msg, author, ...)
    message = ""
    if msg == "br" or msg == "cr" or msg == "br?" or msg == "cr?" or msg == "br" then
        local start, duration = GetSpellCooldown("Barkskin");
            if start > 0 and duration > 0 then
            message = "Rebirth is cooling down, wait " .. math.floor((start + duration - GetTime())) .. " seconds for the next one."
            end
        return false, SendChatMessage(message , "RAID", nil, 1);
    end
  end
  
  ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", myChatFilter)
  ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", myChatFilter)
  ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", myChatFilter)
  ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", myChatFilter)
  ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", myChatFilter)
