let level = 0;
let coins = 0;
let autoclicksPerSecond = 0;
let multiplier = 1;
let autoclickerPrice = 10;
let multiplierPrice = 50;
let totalClicks = 0;
let totalUpgradesSpent = 0;
let telegramUserId = '12345'; // ID пользователя Telegram
let lastUpgradeTime = 0;
const upgradeCooldown = 5000; // Кулдаун
let cooldowns = { autoclicker: 0, multiplier: 0 }; // Таймеры кулдауна
let selectedSkin = "cat.png"; // Стандартный скин

// Загрузка прогресса
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
        selectedSkin = gameData.selectedSkin || "cat.png";
        document.getElementById("cat").src = selectedSkin;
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
        totalUpgradesSpent,
        selectedSkin
    }));
}

// Обновление монет и уровня
function updateCoinsDisplay() {
    document.getElementById("coins-display").textContent = `${coins}`;
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
        autoclickerPrice = Math.floor(autoclickerPrice * 4); // Увеличение цены в 4 раза
        document.getElementById("autoclicker-price").textContent = autoclickerPrice;
    }, 'autoclicker');
});

// Покупка множителя
document.getElementById("buy-multiplier").addEventListener("click", () => {
    buyUpgrade(multiplierPrice, () => {
        multiplier += 1;
        multiplierPrice = Math.floor(multiplierPrice * 4); // Увеличение цены в 4 раза
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

// Загрузка скинов и добавление их в меню
function loadSkins() {
    const skinsContainer = document.querySelector('.skins-container');
    skinsContainer.innerHTML = ''; // Очищаем контейнер перед добавлением скинов

    const skinFiles = ["cat.png"]; // Стандартный скин

    // Загружаем скины с префиксом "CSkin"
    const availableSkins = ["CSkinTiger.png", "CSkinLeopard.png"]; // Пример списка доступных скинов (замените на реальные файлы)
    
    availableSkins.forEach(file => {
        if (file.startsWith("CSkin")) {
            const skinName = file.replace("CSkin", "").replace(".png", "");
            skinFiles.push(file);
        }
    });

    // Отображаем скины в интерфейсе
    skinFiles.forEach(skin => {
        const skinItem = document.createElement('div');
        skinItem.classList.add('skin-item');
        skinItem.innerHTML = `
            <p class="${selectedSkin === skin ? 'selected' : ''}">${skin.replace("CSkin", "").replace(".png", "")}</p>
            <img src="/${skin}" alt="${skin}">
            <p>${selectedSkin === skin ? 'Выбран!' : 'Выбрать'}</p>
        `;
        
        skinItem.addEventListener('click', () => {
            selectedSkin = skin;
            document.getElementById("cat").src = skin; // Обновляем скин кошки
            loadSkins(); // Обновляем интерфейс
            saveProgress();
        });
        
        skinsContainer.appendChild(skinItem);
    });
}

// При загрузке скинов
document.getElementById("skins-button").addEventListener("click", () => {
    loadSkins();
    document.querySelectorAll('.screen').forEach(screen => screen.classList.remove('active'));
    document.getElementById("skins-screen").classList.add('active');
});
