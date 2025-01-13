local player = game.Players.LocalPlayer
local localeId = player.LocaleId

print("Текущий LocaleId:", localeId)

if localeId == "ru-ru" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Amo1224gus/iriska/refs/heads/main/ru.lua"))();
elseif localeId == "pl-pl" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Amo1224gus/iriska/refs/heads/main/egashub.lua"))();
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Amo1224gus/iriska/refs/heads/main/english.lua"))();
end
