let level = 0;
let coins = 0;
let autoclicksPerSecond = 0;
let multiplier = 1;
let autoclickerPrice = 10;
let multiplierPrice = 50;
let telegramUserId = '12345'; // ID пользователя Telegram (замените на реальный)
let lastUpgradeTime = 0;
const upgradeCooldown = 5000; // Кулдаун улучшений
const referralReward = 100; // Награда за приглашение друга

// Загрузка сохраненных данных
function loadProgress() {
    const savedData = localStorage.getItem(`gameData_${telegramUserId}`);
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

// Сохранение данных
function saveProgress() {
    localStorage.setItem(`gameData_${telegramUserId}`, JSON.stringify({
        level,
        coins,
        autoclicksPerSecond,
        multiplier,
        autoclickerPrice,
        multiplierPrice
    }));
}

// Обновление отображения уровня и монет
function updateCoinsDisplay() {
    document.getElementById("level-display").textContent = level;
    document.getElementById("coins-display").textContent = coins;
}

// Клик по кошке с анимацией
const cat = document.getElementById("cat");
cat.addEventListener("click", (event) => {
    level += multiplier;
    coins += multiplier;
    updateCoinsDisplay();
    saveProgress();

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

// Обработчик покупки улучшений с кулдауном
function buyUpgrade(price, upgradeFunc) {
    const currentTime = Date.now();
    if (coins >= price && currentTime - lastUpgradeTime >= upgradeCooldown) {
        coins -= price;
        upgradeFunc();
        lastUpgradeTime = currentTime;
        updateCoinsDisplay();
        saveProgress();
    } else {
        alert("Недостаточно средств или время кулдауна не истекло.");
    }
}

// Покупка автокликера
document.getElementById("buy-autoclicker").addEventListener("click", () => {
    buyUpgrade(autoclickerPrice, () => {
        autoclicksPerSecond += 1;
        autoclickerPrice = Math.floor(autoclickerPrice * 1.5);
        document.getElementById("autoclicker-price").textContent = autoclickerPrice;
    });
});

// Покупка множителя
document.getElementById("buy-multiplier").addEventListener("click", () => {
    buyUpgrade(multiplierPrice, () => {
        multiplier += 1;
        multiplierPrice = Math.floor(multiplierPrice * 2);
        document.getElementById("multiplier-price").textContent = multiplierPrice;
    });
});

// Автоклики каждые 1 секунду
setInterval(() => {
    if (autoclicksPerSecond > 0) {
        level += autoclicksPerSecond;
        coins += autoclicksPerSecond;
        updateCoinsDisplay();
        saveProgress();
    }
}, 1000);

// Переключение между экранами
document.querySelectorAll('.nav-btn').forEach(button => {
    button.addEventListener('click', () => {
        document.querySelectorAll('.screen').forEach(screen => screen.classList.remove('active'));
        document.getElementById(button.dataset.target).classList.add('active');
    });
});

// Система рефералов
function referFriend() {
    const referralLink = `https://example.com/game?ref=${telegramUserId}`;
    alert(`Пригласите друга по ссылке: ${referralLink} и получите ${referralReward} кликов!`);
}

// Получение награды за реферала
function claimReferralReward() {
    level += referralReward;
    updateCoinsDisplay();
    saveProgress();
}
