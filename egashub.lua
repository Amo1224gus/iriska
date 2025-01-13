local player = game.Players.LocalPlayer
local localeId = player.LocaleId

print("Текущий LocaleId:", localeId)

if localeId == "ru-ru" then
    print("Русский язык выбран. Запуск русского скрипта.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Amo1224gus/iriska/refs/heads/main/ru.lua"))();
elseif localeId == "uk-ua" then
    print("Украинский язык выбран. Запуск украинского скрипта.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Amo1224gus/iriska/refs/heads/main/egashub.lua"))();
else
loadstring(game:HttpGet("https://raw.githubusercontent.com/Amo1224gus/iriska/refs/heads/main/english.lua"))();
end
