let level = 0;
let coins = 0;
let autoclicksPerSecond = 0;
let multiplier = 1;
let autoclickerPrice = 10;
let multiplierPrice = 50;
let totalClicks = 0; // Все клики
let totalUpgradesSpent = 0; // Все монеты потраченные на улучшения
let telegramUserId = '12345'; // ID пользователя Telegram
let lastUpgradeTime = 0;
const upgradeCooldown = 5000; // Кулдаун
let cooldowns = { autoclicker: 0, multiplier: 0 }; // Таймеры кулдауна

// Загрузка сохранений
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
        totalClicks = gameData.totalClicks;
        totalUpgradesSpent = gameData.totalUpgradesSpent;
        updateCoinsDisplay();
    }
}

// Сохранение прогресса
function saveProgress() {
    localStorage.setItem(`gameData_${telegramUserId}`, JSON.stringify({
        level,
        coins,
        autoclicksPerSecond,
        multiplier,
        autoclickerPrice,
        multiplierPrice,
        totalClicks,
        totalUpgradesSpent
    }));
}

// Обновление монет и уровня
function updateCoinsDisplay() {
    document.getElementById("coins-display").textContent = `Монеты: ${coins}`;
    document.getElementById("total-clicks-display").textContent = totalClicks;
    document.getElementById("total-upgrades-display").textContent = totalUpgradesSpent;
}

// Клик по кошке
const cat = document.getElementById("cat");
cat.addEventListener("click", (event) => {
    level += multiplier;
    coins += multiplier;
    totalClicks += multiplier;
    updateCoinsDisplay();
    saveProgress();

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

// Покупка улучшений с кулдауном
function buyUpgrade(price, upgradeFunc, type) {
    const currentTime = Date.now();
    if (coins >= price && currentTime >= cooldowns[type]) {
        coins -= price;
        totalUpgradesSpent += price;
        upgradeFunc();
        cooldowns[type] = currentTime + upgradeCooldown;
        updateCooldownTimer(type);
        updateCoinsDisplay();
        saveProgress();
    } else {
        alert("Недостаточно средств или кулдаун не завершён.");
    }
}

// Покупка автокликера
document.getElementById("buy-autoclicker").addEventListener("click", () => {
    buyUpgrade(autoclickerPrice, () => {
        autoclicksPerSecond += 1;
        autoclickerPrice = Math.floor(autoclickerPrice * 1.5);
        document.getElementById("autoclicker-price").textContent = autoclickerPrice;
    }, 'autoclicker');
});

// Покупка множителя
document.getElementById("buy-multiplier").addEventListener("click", () => {
    buyUpgrade(multiplierPrice, () => {
        multiplier += 1;
        multiplierPrice = Math.floor(multiplierPrice * 2);
        document.getElementById("multiplier-price").textContent = multiplierPrice;
    }, 'multiplier');
});

// Автоклики
setInterval(() => {
    if (autoclicksPerSecond > 0) {
        level += autoclicksPerSecond;
        coins += autoclicksPerSecond;
        totalClicks += autoclicksPerSecond;
        updateCoinsDisplay();
        saveProgress();
    }
}, 1000);

// Обновление таймеров кулдауна
function updateCooldownTimer(type) {
    const cooldownElement = document.getElementById(`${type}-timer`);
    const interval = setInterval(() => {
        const remainingTime = cooldowns[type] - Date.now();
        if (remainingTime > 0) {
            cooldownElement.textContent = `Осталось: ${Math.ceil(remainingTime / 1000)} сек`;
        } else {
            clearInterval(interval);
            cooldownElement.textContent = '';
        }
    }, 1000);
}

// Открытие/закрытие модального окна с информацией
document.getElementById("info-button").addEventListener("click", () => {
    document.getElementById("info-modal").style.display = "block";
});

document.querySelector(".close-modal").addEventListener("click", () => {
    document.getElementById("info-modal").style.display = "none";
});

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
    alert(`Пригласите друга по ссылке: ${referralLink} и получите 100 кликов!`);
}

// Получение награды за реферала
function claimReferralReward() {
    level += 100;
    updateCoinsDisplay();
    saveProgress();
}
