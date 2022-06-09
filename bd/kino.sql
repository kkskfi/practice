-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 31 2022 г., 09:18
-- Версия сервера: 8.0.11
-- Версия PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kino`
--

-- --------------------------------------------------------

--
-- Структура таблицы `films`
--

CREATE TABLE `films` (
  `ID` int(10) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `films`
--

INSERT INTO `films` (`ID`, `name`) VALUES
(1, 'Падение Луны'),
(2, 'Проект \"Адам\"'),
(3, 'Не смотрите наверх'),
(4, 'Многоэтажка'),
(5, 'Красное уведомление'),
(6, 'Из моего окна'),
(7, 'Лулу и Бриггс');

-- --------------------------------------------------------

--
-- Структура таблицы `theatres`
--

CREATE TABLE `theatres` (
  `ID` int(10) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `theatres`
--

INSERT INTO `theatres` (`ID`, `name`, `address`) VALUES
(1, 'Киноатлас', 'Гребенщикова 2'),
(2, 'Голден Синема', 'Курчатова 1'),
(3, 'Победа', 'Ленина 7'),
(4, 'Каро 10 Галерея', 'Гоголя 13'),
(5, 'КиноСити', 'Фрунзе 238'),
(6, 'Горизонт', 'Бориса Богаткова 266'),
(7, 'Cinema Public', 'Проспект Дзержинского 2/2');

-- --------------------------------------------------------

--
-- Структура таблицы `theatres_films`
--

CREATE TABLE `theatres_films` (
  `theatreID` int(11) NOT NULL,
  `filmID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `theatres_films`
--

INSERT INTO `theatres_films` (`theatreID`, `filmID`) VALUES
(1, 6),
(2, 5),
(3, 4),
(4, 3),
(5, 2),
(6, 1),
(7, 7),
(1, 1),
(2, 5),
(3, 2),
(4, 6),
(7, 2),
(7, 7),
(6, 4),
(5, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `theatres`
--
ALTER TABLE `theatres`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `theatres_films`
--
ALTER TABLE `theatres_films`
  ADD KEY `filmID` (`filmID`),
  ADD KEY `theatreID` (`theatreID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `films`
--
ALTER TABLE `films`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `theatres`
--
ALTER TABLE `theatres`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `theatres_films`
--
ALTER TABLE `theatres_films`
  ADD CONSTRAINT `theatres_films_ibfk_1` FOREIGN KEY (`filmID`) REFERENCES `films` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `theatres_films_ibfk_2` FOREIGN KEY (`theatreID`) REFERENCES `theatres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
