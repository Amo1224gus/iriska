/* Основные стили Fluent Design */
body {
    font-family: 'Lilita One', cursive;
    background-color: #000; /* Полностью черный фон */
    color: #ffffff;
    transition: background-color 0.3s, color 0.3s;
    user-select: none;
}

/* Прозрачные элементы и эффекты размытости */
.dark-theme {
    background-color: #000;
}

/* Центрирование текста */
.center-text {
    text-align: center;
    font-size: 2em;
}

/* Панель и кнопки с градиентом */
.fluent-btn, .cryptobutton {
    background: linear-gradient(to top, #000 70%, #0078d4 30%); /* Черный с синим градиент */
    border: none;
    border-radius: 12px;
    padding: 15px;
    cursor: pointer;
    transition: all 0.3s;
    font-size: 18px;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%; /* Подстраивается под ширину экрана */
    max-width: 100%;
}

.cryptobutton {
    margin: 10px 0;
}

.fluent-btn:hover, .cryptobutton:hover {
    background-color: rgba(255, 255, 255, 0.5);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* Запрет выделения и перетаскивания кошки */
img {
    -webkit-user-drag: none;
    user-select: none;
    width: 70%; /* Подстроим под размер экрана */
}

/* Анимация "+1" */
@keyframes float {
    0% {
        opacity: 1;
        transform: translateY(0px);
    }
    100% {
        opacity: 0;
        transform: translateY(-50px);
    }
}

.floating-text {
    position: absolute;
    color: #fff;
    font-size: 24px;
    text-shadow: 2px 2px 0 #000;
    animation: float 1s ease-out forwards;
    pointer-events: none;
}

/* Таймер кулдауна */
.cooldown-timer {
    font-size: 14px;
    color: #fff;
    margin-top: 5px;
}

/* Модальное окно */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    background-color: rgba(0, 0, 0, 0.8);
    padding: 20px;
    border-radius: 12px;
    width: 80%;
    max-width: 400px;
}

.modal-content {
    color: #fff;
}

.close-modal {
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
    font-size: 24px;
    color: #fff;
}

.close-modal:hover {
    color: red;
}

/* Информационная кнопка "i" */
.info-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    background: #0078d4;
    border: none;
    padding: 10px;
    border-radius: 50%;
    color: #fff;
    font-size: 18px;
    cursor: pointer;
}

/* Кнопка скинов "с" */
.skins-btn {
    position: absolute;
    top: 10px;
    left: 10px;
    background: #0078d4;
    border: none;
    padding: 10px;
    border-radius: 50%;
    color: #fff;
    font-size: 18px;
    cursor: pointer;
}

/* Нижняя панель */
.bottom-panel {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: #2c2b3e;
    display: flex;
    justify-content: space-around;
    padding: 10px;
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
}

.nav-btn {
    background: none;
    border: none;
    color: #fff;
    font-size: 18px;
    cursor: pointer;
}

.nav-btn:hover {
    color: #9f9fff;
}

/* Контейнер для скинов */
.skins-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin-top: 50px;
}

.skin-item {
    width: 150px;
    height: 200px;
    background-color: #333;
    border-radius: 12px;
    text-align: center;
    padding: 10px;
    color: #fff;
    cursor: pointer;
    transition: all 0.3s;
}

.skin-item img {
    max-width: 100%;
    height: auto;
}

.skin-item.selected {
    border: 2px solid green;
}

.skin-item:hover {
    transform: scale(1.05);
}
