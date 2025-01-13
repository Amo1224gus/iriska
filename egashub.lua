local player = game.Players.LocalPlayer
local localeId = player.LocaleId 

if localeId == "ru-ru" then
    print("русский язык выбран")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Amo1224gus/iriska/refs/heads/main/ru.lua"))();
elseif localeId == "uk-ua" then
    print("Украинский язык выбран.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Amo1224gus/iriska/refs/heads/main/uk.lua"))();
else
loadstring(game:HttpGet("https://raw.githubusercontent.com/Amo1224gus/iriska/refs/heads/main/english.lua"))();
end
