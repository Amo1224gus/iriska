let level = 0;
let coins = 0;
let autoclicksPerSecond = 0;
let multiplier = 1;
let autoclickerPrice = 10;
let multiplierPrice = 50;
let offlineClickerPrice = 500;
let offlineAutoclicks = false;
let telegramUserId = 12345; // Для теста, замени на реальный ID пользователя Telegram

// Обновление отображения уровня
function updateCoinsDisplay() {
    document.getElementById("level-display").textContent = level;
}

// Переключение экранов
document.querySelectorAll('.nav-btn').forEach(button => {
    button.addEventListener('click', () => {
        document.querySelectorAll('.screen').forEach(screen => screen.classList.remove('active'));
        document.getElementById(button.dataset.target).classList.add('active');
    });
});

// Обработчик кликов по кошке
const cat = document.getElementById("cat");
cat.addEventListener("click", (event) => {
    level += multiplier;
    coins += multiplier;
    updateCoinsDisplay();

    // Анимация "+1" рядом с местом клика
    const floatingText = document.createElement("div");
    floatingText.textContent = `+${multiplier}`;
    floatingText.classList.add("floating-text");
    floatingText.style.left = `${event.clientX}px`;
    floatingText.style.top = `${event.clientY}px`;
    document.body.appendChild(floatingText);

    setTimeout(() => {
        document.body.removeChild(floatingText);
    }, 1000);
});

// Обработчики покупок улучшений
document.getElementById("buy-autoclicker").addEventListener("click", () => {
    if (coins >= autoclickerPrice) {
        coins -= autoclickerPrice;
        autoclicksPerSecond += 1;
        autoclickerPrice = Math.floor(autoclickerPrice * 1.5);
        updateCoinsDisplay();
    }
});

document.getElementById("buy-multiplier").addEventListener("click", () => {
    if (coins >= multiplierPrice) {
        coins -= multiplierPrice;
        multiplier += 1;
        multiplierPrice = Math.floor(multiplierPrice * 2);
        updateCoinsDisplay();
    }
});

// Новое улучшение - автокликер за отсутствие
document.getElementById("buy-offline-clicks").addEventListener("click", () => {
    if (coins >= offlineClickerPrice) {
        coins -= offlineClickerPrice;
        offlineAutoclicks = true;
        updateCoinsDisplay();
    }
});

// Система автокликов
setInterval(() => {
    if (autoclicksPerSecond > 0) {
        level += autoclicksPerSecond;
        coins += autoclicksPerSecond;
        updateCoinsDisplay();
    }
}, 1000);

// Сохранение прогресса по ID пользователя
function saveProgress(userId) {
    const gameData = { level, coins, autoclicksPerSecond, multiplier, autoclickerPrice, multiplierPrice };
    localStorage.setItem(`gameData_${userId}`, JSON.stringify(gameData));
}

// Загрузка прогресса
function loadProgress(userId) {
    const savedData = localStorage.getItem(`gameData_${userId}`);
    if (savedData) {
        const gameData = JSON.parse(savedData);
        level = gameData.level;
        coins = gameData.coins;
        autoclicksPerSecond = gameData.autoclicksPerSecond;
        multiplier = gameData.multiplier;
        autoclickerPrice = gameData.autoclickerPrice;
        multiplierPrice = gameData.multiplierPrice;
        updateCoinsDisplay();
    }
}

// Загружаем прогресс при старте
loadProgress(telegramUserId);

// Таймер сохранения прогресса каждые 10 секунд
setInterval(() => saveProgress(telegramUserId), 10000);

// Система рефералов
function referFriend() {
    const referralLink = `https://example.com/game?ref=${telegramUserId}`;
    alert(`Пригласите друга по ссылке: ${referralLink} и получите 100 кликов!`);
}

// Получить награду за приглашение друга
function claimReferralReward() {
    level += 100;
    updateCoinsDisplay();
}
