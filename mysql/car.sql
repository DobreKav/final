-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2023 at 11:43 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `_insert_marki` (IN `param1` VARCHAR(50), IN `param2` VARCHAR(50), IN `param3` DECIMAL(20,6))   BEGIN
INSERT INTO marki(marki.marka_name, marki.country, marki.price)
VALUE (param1, param2, param3);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `marki`
--

CREATE TABLE `marki` (
  `marki_id` tinyint(3) UNSIGNED NOT NULL,
  `marka_name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `salon_id` tinyint(2) UNSIGNED NOT NULL,
  `img_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marki`
--

INSERT INTO `marki` (`marki_id`, `marka_name`, `country`, `salon_id`, `img_path`) VALUES
(6, 'Land Rover', 'UK', 1, 'rover.png'),
(8, 'Dacija', 'RO', 1, 'dacia.png'),
(9, 'Toyota', 'JAP', 1, 'toyota.png'),
(10, 'Kia', 'KOR', 1, 'kia.png'),
(11, 'Ford', 'USA', 1, 'ford.png'),
(13, 'Alfa', 'I', 1, 'alfa.png'),
(20, 'Audi', 'DE', 7, 'audi.png'),
(62, 'BMW', 'de', 1, 'bmw.png'),
(64, 'Mercedes', 'D', 1, 'mercedes.png'),
(65, 'Peugeot', 'FR', 1, 'peugeot.png'),
(68, 'test', 'mk', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `modeli`
--

CREATE TABLE `modeli` (
  `model_id` tinyint(3) UNSIGNED NOT NULL,
  `model_name` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `fuel` enum('benzin','disel','hibrid') NOT NULL DEFAULT 'benzin',
  `price` decimal(20,6) UNSIGNED NOT NULL DEFAULT 50000.000000,
  `marki_id` tinyint(3) UNSIGNED NOT NULL,
  `img_model` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modeli`
--

INSERT INTO `modeli` (`model_id`, `model_name`, `color`, `fuel`, `price`, `marki_id`, `img_model`) VALUES
(28, '530', 'Red', 'disel', '50000.000000', 13, NULL),
(32, 'Corolla', 'red', 'hibrid', '10000.000000', 9, 'corola.jpg'),
(34, 'a8', '', 'disel', '23000.000000', 20, 'a6.jpg'),
(35, 'a8', 'Blue', 'disel', '23000.000000', 20, 'a6.jpg'),
(37, 'X1', 'Blue', 'disel', '22000.000000', 62, 'x1.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `salon`
--

CREATE TABLE `salon` (
  `salon_id` tinyint(2) UNSIGNED NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `tel` int(15) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salon`
--

INSERT INTO `salon` (`salon_id`, `city`, `address`, `tel`) VALUES
(1, 'Skopje', 'ul. Parizanska br. 4', 72333444),
(2, 'Kavadarci', 'Ul. maksim Goriki', 78532154),
(5, 'Bitola', 'Dagor', 75333999),
(6, 'Ohrid', 'Plostad', 73555666),
(7, 'Gevgelija', 'Vardar', 76888999),
(15, 'Kunmanovo', 'Kumanovo adress', 71222333);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` tinyint(2) UNSIGNED NOT NULL,
  `service_city` varchar(50) NOT NULL,
  `work_time` time(2) NOT NULL,
  `salon_id` tinyint(2) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_vozila`
--

CREATE TABLE `service_vozila` (
  `servicevozila_id` int(10) UNSIGNED NOT NULL,
  `data_service` datetime NOT NULL,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `description` text NOT NULL,
  `service_id` tinyint(2) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uploading`
--

CREATE TABLE `uploading` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `file_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobilen` bigint(13) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000000000389
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vraboteni`
--

CREATE TABLE `vraboteni` (
  `vraboteni_id` tinyint(3) UNSIGNED NOT NULL,
  `vraboten_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobilen` bigint(13) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000000000389,
  `salon_id` tinyint(2) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vraboteni`
--

INSERT INTO `vraboteni` (`vraboteni_id`, `vraboten_name`, `email`, `mobilen`, `salon_id`) VALUES
(1, 'Sasko Petrov', 'sasko@gmail.com', 0000074888333, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `marki`
--
ALTER TABLE `marki`
  ADD PRIMARY KEY (`marki_id`),
  ADD UNIQUE KEY `unique_brand` (`marka_name`,`country`,`salon_id`),
  ADD KEY `FK_marki_salon` (`salon_id`);

--
-- Indexes for table `modeli`
--
ALTER TABLE `modeli`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `FK_modeli_marki` (`marki_id`);

--
-- Indexes for table `salon`
--
ALTER TABLE `salon`
  ADD PRIMARY KEY (`salon_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `FK_service_salon` (`salon_id`);

--
-- Indexes for table `service_vozila`
--
ALTER TABLE `service_vozila`
  ADD PRIMARY KEY (`servicevozila_id`),
  ADD KEY `FK_service_vozila_service` (`service_id`),
  ADD KEY `FK_service_vozila_users` (`user_id`);

--
-- Indexes for table `uploading`
--
ALTER TABLE `uploading`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `unique_user` (`email`);

--
-- Indexes for table `vraboteni`
--
ALTER TABLE `vraboteni`
  ADD PRIMARY KEY (`vraboteni_id`),
  ADD KEY `FK_vraboteni_salon` (`salon_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `marki`
--
ALTER TABLE `marki`
  MODIFY `marki_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `modeli`
--
ALTER TABLE `modeli`
  MODIFY `model_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `salon`
--
ALTER TABLE `salon`
  MODIFY `salon_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_vozila`
--
ALTER TABLE `service_vozila`
  MODIFY `servicevozila_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploading`
--
ALTER TABLE `uploading`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vraboteni`
--
ALTER TABLE `vraboteni`
  MODIFY `vraboteni_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `marki`
--
ALTER TABLE `marki`
  ADD CONSTRAINT `FK_marki_salon` FOREIGN KEY (`salon_id`) REFERENCES `salon` (`salon_id`) ON UPDATE CASCADE;

--
-- Constraints for table `modeli`
--
ALTER TABLE `modeli`
  ADD CONSTRAINT `FK_modeli_marki` FOREIGN KEY (`marki_id`) REFERENCES `marki` (`marki_id`) ON UPDATE CASCADE;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FK_service_salon` FOREIGN KEY (`salon_id`) REFERENCES `salon` (`salon_id`) ON UPDATE CASCADE;

--
-- Constraints for table `service_vozila`
--
ALTER TABLE `service_vozila`
  ADD CONSTRAINT `FK_service_vozila_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_service_vozila_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `vraboteni`
--
ALTER TABLE `vraboteni`
  ADD CONSTRAINT `FK_vraboteni_salon` FOREIGN KEY (`salon_id`) REFERENCES `salon` (`salon_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
