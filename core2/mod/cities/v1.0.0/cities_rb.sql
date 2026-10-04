-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.4:3306
-- Время создания: Окт 05 2026 г., 01:21
-- Версия сервера: 8.4.6
-- Версия PHP: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cities_rb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `core_available_modules`
--

CREATE TABLE `core_available_modules` (
  `id` int UNSIGNED NOT NULL,
  `module_id` varchar(60) NOT NULL,
  `module_group` varchar(60) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0.0',
  `descr` varchar(128) DEFAULT NULL,
  `data` longblob,
  `lastuser` int UNSIGNED DEFAULT NULL,
  `install_info` text,
  `readme` text,
  `files_hash` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `core_cities`
--

CREATE TABLE `core_cities` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `country` varchar(64) NOT NULL DEFAULT 'Беларусь',
  `population` int UNSIGNED NOT NULL DEFAULT '0',
  `is_active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `core_cities`
--

INSERT INTO `core_cities` (`id`, `name`, `country`, `population`, `is_active_sw`, `created_at`, `updated_at`) VALUES
(2, 'Брест', 'Беларусь', 340000, 'Y', '2026-10-02 14:30:30', '2026-10-02 14:30:30'),
(3, 'Витебск', 'Беларусь', 320000, 'Y', '2026-10-02 14:30:59', '2026-10-02 14:30:59'),
(4, 'Гомель', 'Беларусь', 500000, 'Y', '2026-10-02 14:30:59', '2026-10-02 14:30:59'),
(7, 'Гродно', 'Беларусь', 300000, 'Y', '2026-10-02 14:32:17', '2026-10-02 14:32:17'),
(8, 'Могилев', 'Беларусь', 380000, 'Y', '2026-10-02 14:32:17', '2026-10-02 14:32:17'),
(9, 'Бобруйск', 'Беларусь', 230000, 'Y', '2026-10-04 20:39:15', '2026-10-04 20:39:15'),
(12, 'Молодечно', 'Беларусь', 100000, 'Y', '2026-10-04 21:04:53', '2026-10-04 21:05:12'),
(13, 'Солигорск', 'Беларусь', 105000, 'Y', '2026-10-04 21:15:56', '2026-10-04 21:15:56'),
(14, 'Мозырь', 'Беларусь', 110000, 'Y', '2026-10-04 21:16:07', '2026-10-04 21:16:07'),
(15, 'Барановичи', 'Беларусь', 122000, 'Y', '2026-10-04 21:16:27', '2026-10-04 21:16:59'),
(16, 'Браслав', 'Беларусь', 30000, 'Y', '2026-10-04 21:16:44', '2026-10-04 21:16:44'),
(17, 'Пинск', 'Беларусь', 90000, 'Y', '2026-10-04 21:28:16', '2026-10-04 21:28:16');

-- --------------------------------------------------------

--
-- Структура таблицы `core_controls`
--

CREATE TABLE `core_controls` (
  `tbl` varchar(60) NOT NULL,
  `keyfield` varchar(20) NOT NULL,
  `val` varchar(20) NOT NULL,
  `lastupdate` varchar(30) NOT NULL,
  `lastuser` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `core_enum`
--

CREATE TABLE `core_enum` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `is_default_sw` enum('Y','N') NOT NULL DEFAULT 'N',
  `lastuser` int UNSIGNED DEFAULT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `seq` int NOT NULL DEFAULT '0',
  `global_id` varchar(255) DEFAULT NULL,
  `custom_field` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `core_log`
--

CREATE TABLE `core_log` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `sid` varchar(128) NOT NULL DEFAULT '',
  `action` longtext,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `query` text,
  `request_method` varchar(20) DEFAULT NULL,
  `remote_port` mediumint DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `core_log`
--

INSERT INTO `core_log` (`id`, `user_id`, `sid`, `action`, `lastupdate`, `query`, `request_method`, `remote_port`, `ip`) VALUES
(1, 1, 'a8614cf375b60f2a06f4cef6aaab699a', NULL, '2026-10-04 19:19:39', '', 'GET', NULL, '127.0.0.1'),
(2, 1, '', NULL, '2026-10-04 19:20:13', 'module=cities', 'GET', NULL, '127.0.0.1'),
(3, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:37:47', 'module=cities', 'GET', 64704, '127.0.0.1'),
(4, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:37:48', '', 'GET', 64704, '127.0.0.1'),
(5, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:44:59', 'module=cities', 'GET', 59394, '127.0.0.1'),
(6, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:44:59', '', 'GET', 59394, '127.0.0.1'),
(7, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:45:02', 'module=cities', 'GET', 59394, '127.0.0.1'),
(8, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:45:03', '', 'GET', 59394, '127.0.0.1'),
(9, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:45:08', '', 'GET', 59394, '127.0.0.1'),
(10, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:45:08', 'module=cities', 'GET', 59394, '127.0.0.1'),
(11, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:45:08', '', 'GET', 59394, '127.0.0.1'),
(12, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:45:14', '', 'GET', 59394, '127.0.0.1'),
(13, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:45:14', 'module=cities', 'GET', 59394, '127.0.0.1'),
(14, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:45:14', '', 'GET', 59394, '127.0.0.1'),
(15, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:45:31', 'module=cities', 'GET', 51587, '127.0.0.1'),
(16, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:45:31', '', 'GET', 51587, '127.0.0.1'),
(17, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:45:31', '', 'GET', 51587, '127.0.0.1'),
(18, 1, 'fa1023c812f45f96ddb1b19714e1b66b', NULL, '2026-10-04 19:45:48', 'module=cities', 'GET', 50461, '127.0.0.1'),
(19, 1, 'fa1023c812f45f96ddb1b19714e1b66b', NULL, '2026-10-04 19:45:48', '', 'GET', 50461, '127.0.0.1'),
(20, 1, 'fa1023c812f45f96ddb1b19714e1b66b', NULL, '2026-10-04 19:45:49', '', 'GET', 50461, '127.0.0.1'),
(21, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:56:58', 'module=cities', 'GET', 50360, '127.0.0.1'),
(22, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:56:59', 'module=cities', 'GET', 50360, '127.0.0.1'),
(23, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 19:57:37', 'module=cities', 'GET', 51053, '127.0.0.1'),
(24, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 19:57:37', '', 'GET', 51053, '127.0.0.1'),
(25, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:58:14', 'module=cities', 'GET', 54760, '127.0.0.1'),
(26, 1, '2930820ac22de7e6e365e12018e868d8', NULL, '2026-10-04 19:58:15', '', 'GET', 54760, '127.0.0.1'),
(27, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:22:51', 'module=cities', 'GET', 50884, '127.0.0.1'),
(28, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:22:52', 'module=cities&action=listData&_=1791145371989', 'GET', 50884, '127.0.0.1'),
(29, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:38:29', 'module=cities', 'GET', 61827, '127.0.0.1'),
(30, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:38:29', 'module=cities&action=listData&_=1791146309381', 'GET', 61827, '127.0.0.1'),
(31, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:38:37', 'module=cities&action=edit&id=1', 'GET', 61827, '127.0.0.1'),
(32, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:38:47', 'module=cities&action=edit&id=1', 'POST', 61827, '127.0.0.1'),
(33, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:38:54', 'module=cities&action=edit&id=1', 'GET', 61827, '127.0.0.1'),
(34, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:38:55', 'module=cities', 'GET', 61827, '127.0.0.1'),
(35, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:38:55', 'module=cities&action=listData&_=1791146335532', 'GET', 61827, '127.0.0.1'),
(36, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:39:00', 'module=cities&action=add', 'GET', 61827, '127.0.0.1'),
(37, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:39:15', 'module=cities&action=add', 'POST', 61827, '127.0.0.1'),
(38, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:39:20', 'module=cities', 'GET', 61827, '127.0.0.1'),
(39, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:39:20', 'module=cities&action=listData&_=1791146360127', 'GET', 61827, '127.0.0.1'),
(40, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:39:25', 'module=cities&action=add', 'GET', 61827, '127.0.0.1'),
(41, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:39:38', 'module=cities&action=add', 'POST', 61827, '127.0.0.1'),
(42, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:39:42', 'module=cities', 'GET', 61827, '127.0.0.1'),
(43, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:39:42', 'module=cities&action=listData&_=1791146382695', 'GET', 61827, '127.0.0.1'),
(44, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:39:48', 'module=cities&action=delete', 'POST', 61827, '127.0.0.1'),
(45, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:39:54', 'module=cities', 'GET', 61827, '127.0.0.1'),
(46, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:39:54', 'module=cities&action=listData&_=1791146394755', 'GET', 61827, '127.0.0.1'),
(47, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:43:51', 'module=cities&action=add', 'GET', 50361, '127.0.0.1'),
(48, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:45:12', 'module=cities', 'GET', 57187, '127.0.0.1'),
(49, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:45:12', 'module=cities&action=listData&_=1791146712448', 'GET', 57187, '127.0.0.1'),
(50, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:54:47', 'module=cities', 'GET', 60754, '127.0.0.1'),
(51, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:54:47', 'module=cities&action=listData&_=1791147287402', 'GET', 60754, '127.0.0.1'),
(52, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:54:57', 'module=cities&action=delete', 'POST', 60754, '127.0.0.1'),
(53, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:54:57', 'module=cities&action=listData&_=1791147287403', 'GET', 60754, '127.0.0.1'),
(54, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 20:54:59', 'module=cities&action=add', 'GET', 60754, '127.0.0.1'),
(55, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:00:32', 'module=cities&action=index', 'GET', 55151, '127.0.0.1'),
(56, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:00:32', 'module=cities&action=listData&_=1791147632622', 'GET', 55151, '127.0.0.1'),
(57, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:00:35', 'module=cities&action=index', 'GET', 55151, '127.0.0.1'),
(58, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:00:36', 'module=cities&action=listData&_=1791147635927', 'GET', 55151, '127.0.0.1'),
(59, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:00:40', 'module=cities&action=add', 'GET', 55151, '127.0.0.1'),
(60, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:01:01', 'module=cities&action=add', 'GET', 57938, '127.0.0.1'),
(61, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:04:28', 'module=cities&action=add', 'GET', 58984, '127.0.0.1'),
(62, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:04:53', 'module=cities&action=add', 'POST', 64560, '127.0.0.1'),
(63, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:04:53', 'module=cities&action=index', 'GET', 64560, '127.0.0.1'),
(64, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:04:53', 'module=cities&action=listData&_=1791147893615', 'GET', 64560, '127.0.0.1'),
(65, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:04:57', 'module=cities&action=edit&id=12', 'GET', 64560, '127.0.0.1'),
(66, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:05:12', 'module=cities&action=update', 'POST', 64560, '127.0.0.1'),
(67, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:05:12', 'module=cities&action=index', 'GET', 64560, '127.0.0.1'),
(68, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:05:13', 'module=cities&action=listData&_=1791147913039', 'GET', 64560, '127.0.0.1'),
(69, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:11:54', 'module=cities&action=index', 'GET', 55061, '127.0.0.1'),
(70, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:11:55', 'module=cities&action=listData&_=1791148315005', 'GET', 55061, '127.0.0.1'),
(71, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:14:51', 'module=cities&action=index', 'GET', 50997, '127.0.0.1'),
(72, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:14:51', 'module=cities&action=listData&_=1791148491737', 'GET', 50997, '127.0.0.1'),
(73, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:15:43', 'module=cities&action=add', 'GET', 52169, '127.0.0.1'),
(74, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:15:56', 'module=cities&action=add', 'POST', 52169, '127.0.0.1'),
(75, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:15:56', 'module=cities&action=index', 'GET', 52169, '127.0.0.1'),
(76, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:15:56', 'module=cities&action=listData&_=1791148556370', 'GET', 52169, '127.0.0.1'),
(77, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:15:57', 'module=cities&action=add', 'GET', 52169, '127.0.0.1'),
(78, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:07', 'module=cities&action=add', 'POST', 52169, '127.0.0.1'),
(79, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:07', 'module=cities&action=index', 'GET', 52169, '127.0.0.1'),
(80, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:07', 'module=cities&action=listData&_=1791148567626', 'GET', 52169, '127.0.0.1'),
(81, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:09', 'module=cities&action=add', 'GET', 52169, '127.0.0.1'),
(82, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:27', 'module=cities&action=add', 'POST', 62731, '127.0.0.1'),
(83, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:27', 'module=cities&action=index', 'GET', 62731, '127.0.0.1'),
(84, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:27', 'module=cities&action=listData&_=1791148587358', 'GET', 62731, '127.0.0.1'),
(85, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:32', 'module=cities&action=add', 'GET', 62731, '127.0.0.1'),
(86, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:44', 'module=cities&action=add', 'POST', 62731, '127.0.0.1'),
(87, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:44', 'module=cities&action=index', 'GET', 62731, '127.0.0.1'),
(88, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:44', 'module=cities&action=listData&_=1791148604807', 'GET', 62731, '127.0.0.1'),
(89, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:55', 'module=cities&action=edit&id=15', 'GET', 62731, '127.0.0.1'),
(90, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:59', 'module=cities&action=update', 'POST', 62731, '127.0.0.1'),
(91, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:59', 'module=cities&action=index', 'GET', 62731, '127.0.0.1'),
(92, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:16:59', 'module=cities&action=listData&_=1791148619761', 'GET', 62731, '127.0.0.1'),
(93, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:27:44', 'module=cities&action=index', 'GET', 63321, '127.0.0.1'),
(94, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:27:44', 'module=cities&action=listData&_=1791149264387', 'GET', 63321, '127.0.0.1'),
(95, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:27:58', 'module=cities&action=add', 'GET', 63321, '127.0.0.1'),
(96, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:28:16', 'module=cities&action=add', 'POST', 59540, '127.0.0.1'),
(97, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:28:16', 'module=cities&action=index', 'GET', 59540, '127.0.0.1'),
(98, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:28:16', 'module=cities&action=listData&_=1791149296723', 'GET', 59540, '127.0.0.1'),
(99, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:28:19', 'module=cities&action=logout', 'GET', 59540, '127.0.0.1'),
(100, 1, 'c6feb9ac4f79bb0339fabd1d172b8ef7', NULL, '2026-10-04 21:33:58', 'module=cities&action=logout', 'GET', 54970, '127.0.0.1'),
(101, 1, 'f5c229b240aa8de774d01ea0c695ef92', NULL, '2026-10-04 21:34:14', 'module=cities', 'GET', 61399, '127.0.0.1'),
(102, 1, 'f5c229b240aa8de774d01ea0c695ef92', NULL, '2026-10-04 21:34:14', 'module=cities&action=listData&_=1791149654343', 'GET', 61399, '127.0.0.1'),
(103, 1, 'f5c229b240aa8de774d01ea0c695ef92', NULL, '2026-10-04 21:34:18', 'module=cities&action=logout', 'GET', 61399, '127.0.0.1'),
(104, 1, '3d140ebc7d9fe961d665b677c0791b86', NULL, '2026-10-04 21:34:29', 'module=cities', 'GET', 61399, '127.0.0.1'),
(105, 1, '3d140ebc7d9fe961d665b677c0791b86', NULL, '2026-10-04 21:34:29', 'module=cities&action=listData&_=1791149669168', 'GET', 61399, '127.0.0.1'),
(106, 1, '3d140ebc7d9fe961d665b677c0791b86', NULL, '2026-10-04 21:42:43', 'module=cities', 'GET', 54646, '127.0.0.1'),
(107, 1, '3d140ebc7d9fe961d665b677c0791b86', NULL, '2026-10-04 21:42:43', 'module=cities&action=listData&_=1791150163702', 'GET', 54646, '127.0.0.1'),
(108, 1, '3d140ebc7d9fe961d665b677c0791b86', NULL, '2026-10-04 21:43:06', 'module=cities', 'GET', 60805, '127.0.0.1'),
(109, 1, '3d140ebc7d9fe961d665b677c0791b86', NULL, '2026-10-04 21:43:06', 'module=cities&action=listData&_=1791150186092', 'GET', 60805, '127.0.0.1'),
(110, 1, '3d140ebc7d9fe961d665b677c0791b86', NULL, '2026-10-04 21:44:01', 'module=cities', 'GET', 54418, '127.0.0.1'),
(111, 1, '3d140ebc7d9fe961d665b677c0791b86', NULL, '2026-10-04 21:44:01', 'module=cities&action=listData&_=1791150241807', 'GET', 54418, '127.0.0.1'),
(112, 1, '3d140ebc7d9fe961d665b677c0791b86', NULL, '2026-10-04 21:48:38', 'module=cities', 'GET', 52729, '127.0.0.1'),
(113, 1, '3d140ebc7d9fe961d665b677c0791b86', NULL, '2026-10-04 21:48:38', 'module=cities&action=listData&_=1791150518340', 'GET', 52729, '127.0.0.1'),
(114, 1, '3d140ebc7d9fe961d665b677c0791b86', NULL, '2026-10-04 21:49:52', 'module=cities&action=logout', 'GET', 52781, '127.0.0.1'),
(115, 1, '62dd05c0366fa13a4fa2786beabc8258', NULL, '2026-10-04 21:50:29', 'module=cities', 'GET', 54513, '127.0.0.1'),
(116, 1, '62dd05c0366fa13a4fa2786beabc8258', NULL, '2026-10-04 21:50:29', 'module=cities&action=listData&_=1791150629168', 'GET', 54513, '127.0.0.1'),
(117, 1, '62dd05c0366fa13a4fa2786beabc8258', NULL, '2026-10-04 21:53:50', 'module=cities', 'GET', 55810, '127.0.0.1'),
(118, 1, '62dd05c0366fa13a4fa2786beabc8258', NULL, '2026-10-04 21:53:50', 'module=cities&action=listData&_=1791150830111', 'GET', 55810, '127.0.0.1'),
(119, 1, '62dd05c0366fa13a4fa2786beabc8258', NULL, '2026-10-04 21:53:52', 'module=cities&action=logout', 'GET', 55810, '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `core_modules`
--

CREATE TABLE `core_modules` (
  `m_id` int UNSIGNED NOT NULL,
  `m_name` varchar(60) NOT NULL DEFAULT '',
  `module_id` varchar(60) NOT NULL DEFAULT '',
  `visible` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastuser` int UNSIGNED DEFAULT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_system` enum('Y','N') NOT NULL DEFAULT 'N',
  `is_public` enum('Y','N') NOT NULL DEFAULT 'N',
  `dependencies` text,
  `seq` int DEFAULT NULL,
  `access_default` text,
  `access_add` text,
  `version` varchar(10) NOT NULL DEFAULT '1.0.0',
  `isset_home_page` enum('Y','N') NOT NULL DEFAULT 'Y',
  `uninstall` text,
  `files_hash` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `core_modules`
--

INSERT INTO `core_modules` (`m_id`, `m_name`, `module_id`, `visible`, `lastuser`, `lastupdate`, `is_system`, `is_public`, `dependencies`, `seq`, `access_default`, `access_add`, `version`, `isset_home_page`, `uninstall`, `files_hash`) VALUES
(1, 'Cities', 'cities', 'Y', NULL, '2026-10-04 18:57:00', 'N', 'Y', NULL, 1, NULL, NULL, '1.0.0', 'Y', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `core_roles`
--

CREATE TABLE `core_roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  `lastuser` int UNSIGNED DEFAULT NULL,
  `access` text,
  `date_added` datetime NOT NULL,
  `position` int NOT NULL,
  `access_add` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `core_roles`
--

INSERT INTO `core_roles` (`id`, `name`, `is_active_sw`, `lastupdate`, `description`, `lastuser`, `access`, `date_added`, `position`, `access_add`) VALUES
(1, 'root', 'Y', '2026-10-04 18:57:00', 'Root role', NULL, '', '2026-10-04 21:57:00', 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `core_session`
--

CREATE TABLE `core_session` (
  `id` int UNSIGNED NOT NULL,
  `sid` varchar(128) NOT NULL DEFAULT '',
  `login_time` timestamp NULL DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `is_expired_sw` enum('N','Y') NOT NULL DEFAULT 'N',
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `crypto_sw` enum('N','Y') NOT NULL DEFAULT 'N',
  `is_kicked_sw` enum('N','Y') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `core_session`
--

INSERT INTO `core_session` (`id`, `sid`, `login_time`, `logout_time`, `user_id`, `ip`, `is_expired_sw`, `last_activity`, `crypto_sw`, `is_kicked_sw`) VALUES
(1, 'f8ada8589084a74d14b11d029375dafd', '2026-10-04 18:58:08', NULL, 1, '127.0.0.1', 'N', '2026-10-04 18:58:08', 'N', 'N'),
(2, '8c9cc9a1ecd7cb872d092a7358d3d323', '2026-10-04 18:58:49', NULL, 1, '127.0.0.1', 'N', '2026-10-04 18:58:49', 'N', 'N'),
(3, '30b370e9937fcb30a92bd1d8056c5aa4', '2026-10-04 19:19:18', NULL, 1, '127.0.0.1', 'N', '2026-10-04 19:19:18', 'N', 'N'),
(4, '27efedc286f356ebed682473320d1ae0', '2026-10-04 19:19:39', NULL, 1, '127.0.0.1', 'N', '2026-10-04 19:19:39', 'N', 'N'),
(5, '', '2026-10-04 19:20:13', NULL, 1, '127.0.0.1', 'N', '2026-10-04 19:20:13', 'N', 'N'),
(6, '13b610700cdeff9705c1db4547b65814', '2026-10-04 19:20:49', NULL, 1, '127.0.0.1', 'N', '2026-10-04 19:20:49', 'N', 'N'),
(7, '7e818f5b86d50f70c1f13db758ea949c', '2026-10-04 19:34:37', NULL, 1, '127.0.0.1', 'N', '2026-10-04 19:34:37', 'N', 'N'),
(8, 'ba867aca74798889d2aa74a8333744d3', '2026-10-04 19:35:43', NULL, 1, '127.0.0.1', 'N', '2026-10-04 19:35:43', 'N', 'N'),
(9, '9aa3f8164885367d502e232ae52136e1', '2026-10-04 19:37:47', '2026-10-04 23:54:40', 1, '127.0.0.1', 'Y', '2026-10-04 20:54:40', 'N', 'N'),
(10, 'b336b1e7b042fa797327679910a8f6d5', '2026-10-04 19:45:48', NULL, 1, '127.0.0.1', 'N', '2026-10-04 19:45:49', 'N', 'N'),
(11, 'f1bfab95f13ca7265751bbf78d888985', '2026-10-04 19:57:37', '2026-10-05 00:33:58', 1, '127.0.0.1', 'N', '2026-10-04 21:33:58', 'N', 'N'),
(12, '349383f3ff8a7f70f2999a7922d52254', '2026-10-04 21:34:14', '2026-10-05 00:34:18', 1, '127.0.0.1', 'N', '2026-10-04 21:34:18', 'N', 'N'),
(13, 'ef0e1e72f850e9e438d84ab76f19fe53', '2026-10-04 21:34:29', '2026-10-05 00:49:52', 1, '127.0.0.1', 'N', '2026-10-04 21:49:52', 'N', 'N'),
(14, '3ed0fb59ab31223e4f85e2253d3f4bae', '2026-10-04 21:50:29', '2026-10-05 00:53:52', 1, '127.0.0.1', 'N', '2026-10-04 21:53:52', 'N', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `core_settings`
--

CREATE TABLE `core_settings` (
  `id` int UNSIGNED NOT NULL,
  `lastuser` int UNSIGNED DEFAULT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `system_name` varchar(255) DEFAULT '',
  `value` text,
  `code` varchar(60) NOT NULL DEFAULT '',
  `visible` enum('Y','N') NOT NULL DEFAULT 'Y',
  `is_custom_sw` enum('N','Y') NOT NULL DEFAULT 'N',
  `is_personal_sw` enum('N','Y') NOT NULL DEFAULT 'N',
  `type` varchar(20) NOT NULL DEFAULT 'text',
  `seq` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `core_settings`
--

INSERT INTO `core_settings` (`id`, `lastuser`, `lastupdate`, `system_name`, `value`, `code`, `visible`, `is_custom_sw`, `is_personal_sw`, `type`, `seq`) VALUES
(1, NULL, '2026-10-04 19:18:56', '', '1800', 'session_lifetime', 'Y', 'N', 'N', 'text', NULL),
(2, NULL, '2026-10-04 20:12:26', 'Email для уведомлений от аудита системы', NULL, 'admin_email', 'Y', 'Y', 'N', 'text', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `core_submodules`
--

CREATE TABLE `core_submodules` (
  `sm_id` int UNSIGNED NOT NULL,
  `sm_name` varchar(128) NOT NULL DEFAULT '',
  `visible` enum('Y','N') NOT NULL DEFAULT 'Y',
  `m_id` int UNSIGNED NOT NULL,
  `sm_path` varchar(255) DEFAULT NULL,
  `lastuser` int UNSIGNED DEFAULT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sm_key` varchar(20) NOT NULL DEFAULT '',
  `seq` int NOT NULL,
  `access_default` text,
  `access_add` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `core_submodules`
--

INSERT INTO `core_submodules` (`sm_id`, `sm_name`, `visible`, `m_id`, `sm_path`, `lastuser`, `lastupdate`, `sm_key`, `seq`, `access_default`, `access_add`) VALUES
(1, 'Cities', 'Y', 1, NULL, NULL, '2026-10-04 18:57:00', 'index', 1, NULL, NULL),
(2, 'ListData', 'Y', 1, NULL, NULL, '2026-10-04 20:35:40', 'listdata', 2, NULL, NULL),
(3, 'Add', 'Y', 1, NULL, NULL, '2026-10-04 19:13:01', 'add', 3, NULL, NULL),
(4, 'Edit', 'Y', 1, NULL, NULL, '2026-10-04 19:13:01', 'edit', 4, NULL, NULL),
(5, 'Delete', 'Y', 1, NULL, NULL, '2026-10-04 19:13:01', 'delete', 5, NULL, NULL),
(6, 'Update', 'Y', 1, NULL, NULL, '2026-10-04 19:13:01', 'update', 6, NULL, NULL),
(7, 'Logout', 'Y', 1, NULL, NULL, '2026-10-04 21:24:26', 'logout', 99, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `core_users`
--

CREATE TABLE `core_users` (
  `u_id` int UNSIGNED NOT NULL,
  `u_login` varchar(120) NOT NULL DEFAULT '',
  `u_pass` varchar(255) DEFAULT '',
  `visible` enum('Y','N') NOT NULL DEFAULT 'N',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(60) DEFAULT '',
  `lastuser` int UNSIGNED DEFAULT NULL,
  `is_admin_sw` enum('Y','N') NOT NULL DEFAULT 'N',
  `certificate` text,
  `role_id` int UNSIGNED DEFAULT NULL,
  `reg_key` varchar(255) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_expired` datetime DEFAULT NULL,
  `is_email_wrong` enum('Y','N') NOT NULL DEFAULT 'N',
  `is_pass_changed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `core_users`
--

INSERT INTO `core_users` (`u_id`, `u_login`, `u_pass`, `visible`, `lastupdate`, `email`, `lastuser`, `is_admin_sw`, `certificate`, `role_id`, `reg_key`, `date_added`, `date_expired`, `is_email_wrong`, `is_pass_changed`) VALUES
(1, 'admin', '$argon2id$v=19$m=65536,t=4,p=1$bFJ6UGhRajJySzlyaDREUA$9YqZ0PYt0i6ZKiyvYSB3N+HAH51/07BouFIIsFydyfk', 'Y', '2026-10-04 18:57:07', 'admin@example.com', NULL, 'Y', NULL, 1, NULL, '2026-10-04 21:57:00', NULL, 'N', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `core_users_profile`
--

CREATE TABLE `core_users_profile` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `lastname` varchar(60) DEFAULT '',
  `firstname` varchar(60) NOT NULL DEFAULT '',
  `middlename` varchar(60) DEFAULT '',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastuser` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `core_users_profile`
--

INSERT INTO `core_users_profile` (`id`, `user_id`, `lastname`, `firstname`, `middlename`, `lastupdate`, `lastuser`) VALUES
(1, 1, 'Admin', 'Администратор', '', '2026-10-04 18:57:00', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `core_users_roles`
--

CREATE TABLE `core_users_roles` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `lastuser` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `core_users_roles`
--

INSERT INTO `core_users_roles` (`id`, `user_id`, `role_id`, `lastuser`) VALUES
(1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `core_worker_jobs`
--

CREATE TABLE `core_worker_jobs` (
  `id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `handler` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_finish` timestamp NULL DEFAULT NULL,
  `denominator` int DEFAULT '0',
  `numerator` decimal(5,0) DEFAULT '0',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `executor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `core_available_modules`
--
ALTER TABLE `core_available_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx1_core_available_modules` (`lastuser`);

--
-- Индексы таблицы `core_cities`
--
ALTER TABLE `core_cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx1_core_cities` (`name`);

--
-- Индексы таблицы `core_controls`
--
ALTER TABLE `core_controls`
  ADD KEY `keyfield` (`keyfield`),
  ADD KEY `tbl` (`tbl`);

--
-- Индексы таблицы `core_enum`
--
ALTER TABLE `core_enum`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx1_core_enum` (`parent_id`,`name`),
  ADD UNIQUE KEY `idx2_core_enum` (`global_id`);

--
-- Индексы таблицы `core_log`
--
ALTER TABLE `core_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx1_core_log` (`user_id`),
  ADD KEY `idx2_core_log` (`sid`),
  ADD KEY `idx3_core_log` (`sid`);

--
-- Индексы таблицы `core_modules`
--
ALTER TABLE `core_modules`
  ADD PRIMARY KEY (`m_id`),
  ADD UNIQUE KEY `idx1_core_modules` (`m_name`),
  ADD UNIQUE KEY `idx2_core_modules` (`module_id`);

--
-- Индексы таблицы `core_roles`
--
ALTER TABLE `core_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx1_core_roles` (`name`);

--
-- Индексы таблицы `core_session`
--
ALTER TABLE `core_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx1_core_session` (`user_id`),
  ADD KEY `idx2_core_session` (`sid`),
  ADD KEY `idx3_core_session` (`is_expired_sw`),
  ADD KEY `idx4_core_session` (`is_kicked_sw`);

--
-- Индексы таблицы `core_settings`
--
ALTER TABLE `core_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx1_core_settings` (`code`);

--
-- Индексы таблицы `core_submodules`
--
ALTER TABLE `core_submodules`
  ADD PRIMARY KEY (`sm_id`),
  ADD UNIQUE KEY `idx1_core_submodules` (`m_id`,`sm_key`),
  ADD KEY `idx2_core_submodules` (`m_id`);

--
-- Индексы таблицы `core_users`
--
ALTER TABLE `core_users`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `idx1_core_users` (`u_login`),
  ADD UNIQUE KEY `idx2_core_users` (`email`),
  ADD KEY `idx3_core_users` (`role_id`);

--
-- Индексы таблицы `core_users_profile`
--
ALTER TABLE `core_users_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx1_core_users_profile` (`user_id`);

--
-- Индексы таблицы `core_users_roles`
--
ALTER TABLE `core_users_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx1_core_users_roles` (`user_id`),
  ADD KEY `idx2_core_users_roles` (`role_id`);

--
-- Индексы таблицы `core_worker_jobs`
--
ALTER TABLE `core_worker_jobs`
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `handler` (`handler`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `core_available_modules`
--
ALTER TABLE `core_available_modules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `core_cities`
--
ALTER TABLE `core_cities`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `core_enum`
--
ALTER TABLE `core_enum`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `core_log`
--
ALTER TABLE `core_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT для таблицы `core_modules`
--
ALTER TABLE `core_modules`
  MODIFY `m_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `core_roles`
--
ALTER TABLE `core_roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `core_session`
--
ALTER TABLE `core_session`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `core_settings`
--
ALTER TABLE `core_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `core_submodules`
--
ALTER TABLE `core_submodules`
  MODIFY `sm_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `core_users`
--
ALTER TABLE `core_users`
  MODIFY `u_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `core_users_profile`
--
ALTER TABLE `core_users_profile`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `core_users_roles`
--
ALTER TABLE `core_users_roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `core_enum`
--
ALTER TABLE `core_enum`
  ADD CONSTRAINT `fk1_core_enum` FOREIGN KEY (`parent_id`) REFERENCES `core_enum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `core_submodules`
--
ALTER TABLE `core_submodules`
  ADD CONSTRAINT `fk1_core_submodules` FOREIGN KEY (`m_id`) REFERENCES `core_modules` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `core_users_profile`
--
ALTER TABLE `core_users_profile`
  ADD CONSTRAINT `fk1_core_users_profile` FOREIGN KEY (`user_id`) REFERENCES `core_users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `core_users_roles`
--
ALTER TABLE `core_users_roles`
  ADD CONSTRAINT `fk1_core_users_roles` FOREIGN KEY (`role_id`) REFERENCES `core_roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
