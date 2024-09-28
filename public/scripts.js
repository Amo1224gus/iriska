let level = 0;
let coins = 0;
let autoclicksPerSecond = 0;
let multiplier = 1;
let autoclickerPrice = 10;
let multiplierPrice = 50;
let offlineClickerPrice = 500;
let offlineAutoclicks = false;
let telegramUserId = 12345; // Реальный ID пользователя Telegram
let lastUpgradeTime = 0;
const upgradeCooldown = 5000; // Время кулдауна в миллисекундах

// Обновление отображения уровня и монет
function updateCoinsDisplay() {
    document.getElementById("level-display").textContent = level;
}

// Клик по кошке с анимацией
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

// Переключение между экранами
document.querySelectorAll('.nav-btn').forEach(button => {
    button.addEventListener('click', () => {
        document.querySelectorAll('.screen').forEach(screen => screen.classList.remove('active'));
        document.getElementById(button.dataset.target).classList.add('active');
    });
});

// Обработка покупки улучшений с кулдауном
function buyUpgrade(price, upgradeFunc) {
    const currentTime = Date.now();
    if (coins >= price && currentTime - lastUpgradeTime >= upgradeCooldown) {
        coins -= price;
        upgradeFunc();
        lastUpgradeTime = currentTime;
        updateCoinsDisplay();
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

// Покупка сонного автокликера
document.getElementById("buy-offline-clicks").addEventListener("click", () => {
    buyUpgrade(offlineClickerPrice, () => {
        offlineAutoclicks = true;
    });
});

// Автоклики
setInterval(() => {
    if (autoclicksPerSecond > 0) {
        level += autoclicksPerSecond;
        coins += autoclicksPerSecond;
        updateCoinsDisplay();
    }
}, 1000);

// Включение сонного автокликера при неактивности
window.addEventListener('mouseout', () => {
    if (offlineAutoclicks) {
        document.getElementById("level-display").textContent = "💤💤💤";
    }
});

window.addEventListener('mouseover', () => {
    if (offlineAutoclicks) {
        document.getElementById("level-display").textContent = level;
        alert(`Ночная муха заработала вам ${coins} кликов!`);
    }
});

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
