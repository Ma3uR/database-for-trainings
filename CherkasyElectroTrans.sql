-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: mysql57
-- Час створення: Жов 12 2020 р., 08:30
-- Версія сервера: 5.7.31
-- Версія PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `CherkasyElectroTrans`
--

-- --------------------------------------------------------

--
-- Структура таблиці `employe`
--

CREATE TABLE `employe` (
  `employe_id` int(10) UNSIGNED NOT NULL COMMENT 'Employes ID',
  `first_name` varchar(127) NOT NULL COMMENT 'Employe first name',
  `last_name` varchar(127) NOT NULL COMMENT 'Employe last name',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `position_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Position ID',
  `current_salary` int(11) DEFAULT NULL COMMENT 'Current salary'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Employes';

--
-- Дамп даних таблиці `employe`
--

INSERT INTO `employe` (`employe_id`, `first_name`, `last_name`, `dob`, `position_id`, `current_salary`) VALUES
(1, 'Ivan', 'Petrov', '1970-03-05', 4, 5000),
(2, 'Jeffery', 'Schaefer', '1995-10-23', 1, 1500),
(3, 'Saxon', 'Bautista', '1989-03-25', 1, 1500),
(4, 'Charis', 'Cox', '1991-05-10', 1, 1500),
(5, 'Forrest', 'Fletcher', '1969-02-11', 1, 1500),
(6, 'Aariz', 'Irvine', '2000-12-13', 1, 1500),
(7, 'Jamie', 'Rodgers', '1989-11-01', 3, 2500),
(8, 'Ana', 'Lucero', '1990-10-12', 5, 1000),
(9, 'Stefanie', 'Pittman', '1999-01-15', 5, 1000),
(10, 'Vanesa', 'Oneill', '1970-08-29', 2, 2500),
(11, 'Olaf', 'Bennett', '1999-04-06', 1, 900),
(12, 'Manuel', 'Mcgill', '1995-02-25', 1, 900);

-- --------------------------------------------------------

--
-- Структура таблиці `income`
--

CREATE TABLE `income` (
  `income_id` int(10) UNSIGNED NOT NULL COMMENT 'Income id',
  `date` date DEFAULT NULL COMMENT 'Date of work day',
  `employe_id` int(10) UNSIGNED NOT NULL COMMENT 'Who was working on this day',
  `transport_id` int(10) UNSIGNED NOT NULL COMMENT 'ID of the transport the employee worked on',
  `profit_per_day` float UNSIGNED NOT NULL COMMENT 'employee profit per day(in dollars)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transports';

--
-- Дамп даних таблиці `income`
--

INSERT INTO `income` (`income_id`, `date`, `employe_id`, `transport_id`, `profit_per_day`) VALUES
(9, '2020-01-06', 2, 1, 500),
(10, '2020-01-06', 3, 2, 450),
(11, '2020-01-06', 4, 3, 300),
(12, '2020-01-06', 5, 4, 600),
(13, '2020-01-06', 6, 5, 500),
(14, '2020-01-06', 7, 6, 500),
(15, '2020-01-06', 11, 7, 200),
(16, '2020-01-06', 12, 8, 250),
(17, '2020-01-07', 2, 1, 600),
(18, '2020-01-07', 3, 2, 550),
(19, '2020-01-07', 4, 3, 350),
(20, '2020-01-07', 5, 4, 650),
(21, '2020-01-07', 6, 5, 600),
(22, '2020-01-07', 7, 6, 500),
(23, '2020-01-07', 11, 7, 250),
(24, '2020-01-07', 12, 8, 300),
(25, '2020-01-09', 2, 1, 700),
(26, '2020-01-09', 3, 2, 700),
(27, '2020-01-09', 4, 3, 400),
(28, '2020-01-09', 5, 4, 650),
(29, '2020-01-09', 6, 5, 600),
(30, '2020-01-09', 7, 6, 500),
(31, '2020-01-09', 11, 7, 200),
(32, '2020-01-09', 12, 8, 50),
(33, '2020-01-10', 2, 1, 500),
(34, '2020-01-10', 3, 2, 500),
(35, '2020-01-10', 4, 3, 445),
(36, '2020-01-10', 5, 4, 300),
(37, '2020-01-10', 6, 5, 550),
(38, '2020-01-10', 7, 6, 450),
(39, '2020-01-10', 11, 7, 250),
(40, '2020-01-10', 12, 8, 150);

-- --------------------------------------------------------

--
-- Структура таблиці `position`
--

CREATE TABLE `position` (
  `position_id` int(10) UNSIGNED NOT NULL COMMENT 'Position ID',
  `position` varchar(127) NOT NULL COMMENT 'Employees positions in Cherkasy Electro Trans'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Employees positions in Cherkasy Electro Trans';

--
-- Дамп даних таблиці `position`
--

INSERT INTO `position` (`position_id`, `position`) VALUES
(1, 'driver'),
(2, 'traffic controller'),
(3, 'booker'),
(4, 'director'),
(5, 'conductor');

-- --------------------------------------------------------

--
-- Структура таблиці `salary`
--

CREATE TABLE `salary` (
  `salary_id` int(10) UNSIGNED NOT NULL COMMENT 'Salary id',
  `employe_id` int(10) UNSIGNED NOT NULL COMMENT 'Who received this payment',
  `date` date DEFAULT NULL COMMENT 'Date of salary',
  `salary_sum` varchar(127) NOT NULL COMMENT 'Sum of salary'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sum of salary';

--
-- Дамп даних таблиці `salary`
--

INSERT INTO `salary` (`salary_id`, `employe_id`, `date`, `salary_sum`) VALUES
(1, 1, '2020-01-05', '5000'),
(2, 2, '2020-01-05', '1500'),
(3, 3, '2020-01-05', '1500'),
(4, 4, '2020-01-05', '1500'),
(5, 5, '2020-01-05', '1500'),
(6, 6, '2020-01-05', '1500'),
(7, 7, '2020-01-05', '2500'),
(8, 8, '2020-01-05', '1000'),
(9, 9, '2020-01-05', '1000'),
(10, 10, '2020-01-05', '2500'),
(11, 11, '2020-01-05', '900'),
(12, 12, '2020-01-05', '900'),
(13, 1, '2019-12-05', '4000'),
(14, 2, '2019-12-05', '1000'),
(15, 3, '2019-12-05', '1000'),
(16, 4, '2019-12-05', '1000'),
(17, 5, '2019-12-05', '1000'),
(18, 6, '2019-12-05', '1000'),
(19, 7, '2019-12-05', '2000'),
(20, 8, '2019-12-05', '800'),
(21, 9, '2019-12-05', '800'),
(22, 10, '2019-12-05', '2000'),
(23, 1, '2019-11-05', '4000'),
(24, 2, '2019-11-05', '1200'),
(25, 3, '2019-11-05', '1200'),
(26, 4, '2019-11-05', '1200'),
(27, 5, '2019-11-05', '1300'),
(28, 6, '2019-11-05', '1200'),
(29, 7, '2019-11-05', '2200'),
(30, 8, '2019-11-05', '1000'),
(31, 9, '2019-11-05', '900'),
(32, 10, '2019-11-05', '2200');

-- --------------------------------------------------------

--
-- Структура таблиці `transport`
--

CREATE TABLE `transport` (
  `transport_id` int(10) UNSIGNED NOT NULL COMMENT 'Transport id',
  `transport_kind_id` int(10) UNSIGNED NOT NULL COMMENT 'kind of transport',
  `license_plate` varchar(8) NOT NULL COMMENT 'kind of transport'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transports';

--
-- Дамп даних таблиці `transport`
--

INSERT INTO `transport` (`transport_id`, `transport_kind_id`, `license_plate`) VALUES
(1, 1, 'CA1133CI'),
(2, 1, 'CA9990CI'),
(3, 1, 'CA0322CI'),
(4, 1, 'CA2332CI'),
(5, 2, 'CA2303AA'),
(6, 3, 'CA2132AA'),
(7, 4, 'CA0001AI'),
(8, 5, 'CA2303AA');

-- --------------------------------------------------------

--
-- Структура таблиці `transport_kind`
--

CREATE TABLE `transport_kind` (
  `transport_kind_id` int(10) UNSIGNED NOT NULL COMMENT 'Transport kind id',
  `kind` varchar(127) NOT NULL COMMENT 'kind of transport'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transports kinds';

--
-- Дамп даних таблиці `transport_kind`
--

INSERT INTO `transport_kind` (`transport_kind_id`, `kind`) VALUES
(1, 'Bus'),
(2, 'trolleybus'),
(3, 'automobile'),
(4, 'tram'),
(5, 'minibus');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`employe_id`),
  ADD KEY `EMPLOYE_EMPLOYE_ID_POSITION_POSITION_ID` (`position_id`);

--
-- Індекси таблиці `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`income_id`),
  ADD KEY `INCOME_INCOME_ID_EMPLOYE_EMPLOYE_ID` (`employe_id`),
  ADD KEY `INCOME_INCOME_ID_TRANSPORT_TRANSPORT_ID` (`transport_id`);

--
-- Індекси таблиці `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Індекси таблиці `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`salary_id`),
  ADD KEY `SALARY_SALARY_ID_EMPLOYE_EMPLOYE_ID` (`employe_id`);

--
-- Індекси таблиці `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`transport_id`),
  ADD KEY `TRANSPORT_TRANSPORT_ID` (`transport_kind_id`);

--
-- Індекси таблиці `transport_kind`
--
ALTER TABLE `transport_kind`
  ADD PRIMARY KEY (`transport_kind_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `employe`
--
ALTER TABLE `employe`
  MODIFY `employe_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Employes ID', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `income`
--
ALTER TABLE `income`
  MODIFY `income_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Income id', AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблиці `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Position ID', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `salary`
--
ALTER TABLE `salary`
  MODIFY `salary_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Salary id', AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблиці `transport`
--
ALTER TABLE `transport`
  MODIFY `transport_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Transport id', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `transport_kind`
--
ALTER TABLE `transport_kind`
  MODIFY `transport_kind_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Transport kind id', AUTO_INCREMENT=6;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `EMPLOYE_EMPLOYE_ID_POSITION_POSITION_ID` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE SET NULL;

--
-- Обмеження зовнішнього ключа таблиці `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `INCOME_INCOME_ID_EMPLOYE_EMPLOYE_ID` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`employe_id`),
  ADD CONSTRAINT `INCOME_INCOME_ID_TRANSPORT_TRANSPORT_ID` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`);

--
-- Обмеження зовнішнього ключа таблиці `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `SALARY_SALARY_ID_EMPLOYE_EMPLOYE_ID` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`employe_id`);

--
-- Обмеження зовнішнього ключа таблиці `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `TRANSPORT_TRANSPORT_ID` FOREIGN KEY (`transport_kind_id`) REFERENCES `transport_kind` (`transport_kind_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
