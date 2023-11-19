-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table first_project.marki
CREATE TABLE IF NOT EXISTS `marki` (
  `marki_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `marka_name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `salon_id` tinyint(2) unsigned NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`marki_id`),
  UNIQUE KEY `unique_brand` (`marka_name`,`country`,`salon_id`),
  KEY `FK_marki_salon` (`salon_id`),
  CONSTRAINT `FK_marki_salon` FOREIGN KEY (`salon_id`) REFERENCES `salon` (`salon_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table first_project.marki: ~10 rows (approximately)
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
	(65, 'Peugeot', 'FR', 1, 'peugeot.png');

-- Dumping structure for table first_project.modeli
CREATE TABLE IF NOT EXISTS `modeli` (
  `model_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `model_name` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `fuel` enum('benzin','disel','hibrid') NOT NULL DEFAULT 'benzin',
  `price` decimal(20,6) unsigned NOT NULL DEFAULT 50000.000000,
  `marki_id` tinyint(3) unsigned NOT NULL,
  `img_model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  KEY `FK_modeli_marki` (`marki_id`),
  CONSTRAINT `FK_modeli_marki` FOREIGN KEY (`marki_id`) REFERENCES `marki` (`marki_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table first_project.modeli: ~5 rows (approximately)
INSERT INTO `modeli` (`model_id`, `model_name`, `color`, `fuel`, `price`, `marki_id`, `img_model`) VALUES
	(28, '530', 'Red', 'disel', 50000.000000, 13, NULL),
	(32, 'Corolla', 'red', 'hibrid', 10000.000000, 9, 'corola.jpg'),
	(34, 'a8', '', 'disel', 23000.000000, 20, 'a6.jpg'),
	(35, 'a8', 'Blue', 'disel', 23000.000000, 20, 'a6.jpg'),
	(37, 'X1', 'Blue', 'disel', 22000.000000, 62, 'x1.jpeg');

-- Dumping structure for table first_project.salon
CREATE TABLE IF NOT EXISTS `salon` (
  `salon_id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `tel` int(15) unsigned NOT NULL,
  PRIMARY KEY (`salon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table first_project.salon: ~6 rows (approximately)
INSERT INTO `salon` (`salon_id`, `city`, `address`, `tel`) VALUES
	(1, 'Skopje', 'ul. Parizanska br. 4', 72333444),
	(2, 'Kavadarci', 'Ul. maksim Goriki', 78532154),
	(5, 'Bitola', 'Dagor', 75333999),
	(6, 'Ohrid', 'Plostad', 73555666),
	(7, 'Gevgelija', 'Vardar', 76888999),
	(15, 'Kunmanovo', 'Kumanovo adress', 71222333);

-- Dumping structure for table first_project.service
CREATE TABLE IF NOT EXISTS `service` (
  `service_id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `service_city` varchar(50) NOT NULL,
  `work_time` time(2) NOT NULL,
  `salon_id` tinyint(2) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`service_id`),
  KEY `FK_service_salon` (`salon_id`),
  CONSTRAINT `FK_service_salon` FOREIGN KEY (`salon_id`) REFERENCES `salon` (`salon_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table first_project.service: ~0 rows (approximately)

-- Dumping structure for table first_project.service_vozila
CREATE TABLE IF NOT EXISTS `service_vozila` (
  `servicevozila_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_service` datetime NOT NULL,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `description` text NOT NULL,
  `service_id` tinyint(2) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`servicevozila_id`),
  KEY `FK_service_vozila_service` (`service_id`),
  KEY `FK_service_vozila_users` (`user_id`),
  CONSTRAINT `FK_service_vozila_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_service_vozila_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table first_project.service_vozila: ~0 rows (approximately)

-- Dumping structure for table first_project.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobilen` bigint(13) unsigned zerofill NOT NULL DEFAULT 0000000000389,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `unique_user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table first_project.users: ~0 rows (approximately)

-- Dumping structure for table first_project.vraboteni
CREATE TABLE IF NOT EXISTS `vraboteni` (
  `vraboteni_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `vraboten_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobilen` bigint(13) unsigned zerofill NOT NULL DEFAULT 0000000000389,
  `salon_id` tinyint(2) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`vraboteni_id`),
  KEY `FK_vraboteni_salon` (`salon_id`),
  CONSTRAINT `FK_vraboteni_salon` FOREIGN KEY (`salon_id`) REFERENCES `salon` (`salon_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table first_project.vraboteni: ~1 rows (approximately)
INSERT INTO `vraboteni` (`vraboteni_id`, `vraboten_name`, `email`, `mobilen`, `salon_id`) VALUES
	(1, 'Sasko Petrov', 'sasko@gmail.com', 0000074888333, 1);

-- Dumping structure for procedure first_project._insert_marki
DELIMITER //
CREATE PROCEDURE `_insert_marki`(
	IN `param1` VARCHAR(50),
	IN `param2` VARCHAR(50),
	IN `param3` DECIMAL(20,6)
)
BEGIN
INSERT INTO marki(marki.marka_name, marki.country, marki.price)
VALUE (param1, param2, param3);
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
