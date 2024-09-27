let level = 0;
let coins = 0;
let autoclicksPerSecond = 0;
let multiplier = 1;
let autoclickerPrice = 10;
let multiplierPrice = 50;
let offlineClickerPrice = 500;
let offlineAutoclicks = false;

// Обновление отображения монет
function updateCoinsDisplay() {
    document.getElementById("level").textContent = level;
}

// Переключение между экранами
document.querySelectorAll('.nav-btn').forEach(button => {
    button.addEventListener('click', () => {
        document.querySelectorAll('.screen').forEach(screen => screen.classList.remove('active'));
        document.getElementById(button.dataset.target).classList.add('active');
    });
});

// Обратный отсчет до 1 ноября 2024
const countdown = document.getElementById('countdown');
const targetDate = new Date('November 1, 2024 00:00:00').getTime();

setInterval(() => {
    const now = new Date().getTime();
    const distance = targetDate - now;

    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    countdown.innerHTML = `${days}д ${hours}ч ${minutes}м ${seconds}с`;

    if (distance < 0) {
        countdown.innerHTML = "Листинг завершён!";
    }
}, 1000);

// Обработчик покупки улучшений
document.getElementById("buy-autoclicker").addEventListener("click", () => {
    if (coins >= autoclickerPrice) {
        coins -= autoclickerPrice;
        autoclicksPerSecond += 1;
        autoclickerPrice = Math.floor(autoclickerPrice * 1.5);
        document.getElementById("autoclicker-price").textContent = autoclickerPrice;
        updateCoinsDisplay();
    }
});

document.getElementById("buy-multiplier").addEventListener("click", () => {
    if (coins >= multiplierPrice) {
        coins -= multiplierPrice;
        multiplier += 1;
        multiplierPrice = Math.floor(multiplierPrice * 2);
        document.getElementById("multiplier-price").textContent = multiplierPrice;
        updateCoinsDisplay();
    }
});

document.getElementById("buy-offline-clicks").addEventListener("click", () => {
    if (coins >= offlineClickerPrice) {
        coins -= offlineClickerPrice;
        offlineAutoclicks = true;
        updateCoinsDisplay();
    }
});

// Автоклики и оффлайн автоклики
setInterval(() => {
    if (autoclicksPerSecond > 0) {
        level += autoclicksPerSecond;
        coins += autoclicksPerSecond;
        updateCoinsDisplay();
    }
}, 1000);

