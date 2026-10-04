О проекте Cities

-> Обзор проекта
Проект для управления справочником городов, построенное на базе Core2 Framework. 
Приложение реализует функционал администрирования справочника городов с использованием DataTables, Bootstrap 5 и AJAX.

-> Структура проекта
```
├── index.php                     # Основная входная точка
├── mod/                          # Модули
│    └── cities/                   # Модуль "Города"
│        ├── conf.ini              # Конфигурация
│        └── v1.0.0/               # Версия
│            ├── ModCitiesController.php    # Контроллер
│            ├── Model/Cities.php           # Модель
│            ├── cities_rb.sql              # Дамп БД
│            ├── screenshot.png             # Скриншот интерфейса
│            ├── README.md                  # Текущая документация
│            └── assets/js/cities.index.js  # Скрипты
├── html/default/                 # Тема оформления
│   ├── login-index.php           # Шаблон страницы логина
│   ├── login.php                 # Шаблон логина
│   └── model.json                # Карта шаблонов
```

-> Методы ModCitiesController.php:
- action_index() — отображает список городов в таблице с действиями "Редактировать" и "Удалить"
- action_add() — форма добавления нового города
- action_edit() — форма редактирования города
- action_listData() — возвращает JSON для DataTable
- action_delete() — AJAX эндпоинт для удаления города по ID
- action_update() — AJAX эндпоинт для обновления города
- action_logout() — выход из системы, редирект на index.php

-> Методы Cities.php:
- getAll() — все города, отсортированные по имени
- findByName(string $name) — поиск по названию
- insertCity(array $data) — вставка новой записи
- updateCity(int $id, array $data) — обновление по ID
- deleteCity(int $id) — удаление по ID

-> Тема оформления
- html/default/model.json - Карта шаблонов
- html/default/login-index.php - Шаблон страницы входа
- html/default/login.php - Базовый шаблон логина (форма)

-> Требования
- PHP 8.2+
- MySQL 8.0+ (хост: 127.0.0.17, порт: 3306)
- Open Server (или любой другой локльный сервер)
- Composer (для зависимостей)

-> Установка и запуск

1. Настройка Open Server
.osp/project.ini:
type = php
name = cities-rb
domain = cities.local

2. Настройка базы данных
2.1.Создание базы данных
CREATE DATABASE cities_rb DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
2.2. Импорт схемы
mysql -h 127.0.0.17 -P 3306 -u root -p cities_rb < cities_rb.sql

3. Конфигурация conf.ini:
[database]
adapter = "Pdo_Mysql"
dbname = "cities_rb"
host = "localhost"
username = "root"
password = ""
[paths]
module_path = "mod/cities"

4. Установка зависимостей
composer install

5. Запуск
http://cities.local/

-> Авторизация
По умолчанию используются тестовые учетные данные:
- Логин: admin
- Пароль: admin

После авторизации доступен функционал:
- Просмотр списка городов в таблице DataTable
- Добавление нового города
- Редактирование существующего города
- Удаление города
- Выход из системы