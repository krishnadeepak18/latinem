-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for project_control
DROP DATABASE IF EXISTS `project_control`;
CREATE DATABASE IF NOT EXISTS `project_control` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `project_control`;

-- Dumping structure for table project_control.activities
DROP TABLE IF EXISTS `activities`;
CREATE TABLE IF NOT EXISTS `activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sub_division_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activities_sub_division_id_code_unique` (`sub_division_id`,`code`),
  CONSTRAINT `activities_sub_division_id_foreign` FOREIGN KEY (`sub_division_id`) REFERENCES `sub_divisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.activities: ~9 rows (approximately)
DELETE FROM `activities`;
INSERT INTO `activities` (`id`, `sub_division_id`, `name`, `code`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Floor Finish', 'FLOOR-FINISH', 'active', 0, '2026-10-07 10:37:28', '2026-10-07 10:37:28'),
	(2, 1, 'Internal Doors', 'INT-DOORS', 'active', 0, '2026-10-07 10:37:28', '2026-10-07 10:37:28'),
	(3, 1, 'Windows', 'WINDOWS', 'active', 0, '2026-10-07 10:37:28', '2026-10-07 10:37:28'),
	(4, 2, 'Internal Painting', 'INT-PAINT', 'active', 0, '2026-10-07 10:37:28', '2026-10-07 10:37:28'),
	(5, 2, 'External Painting', 'EXT-PAINT', 'active', 0, '2026-10-07 10:37:28', '2026-10-07 10:37:28'),
	(6, 3, 'Light Fixtures', 'LIGHT', 'active', 0, '2026-10-07 10:37:28', '2026-10-07 10:37:28'),
	(7, 3, 'Switches', 'SWITCH', 'active', 0, '2026-10-07 10:37:28', '2026-10-07 10:37:28'),
	(8, 4, 'Sanitary Fixtures', 'SANITARY', 'active', 0, '2026-10-07 10:37:28', '2026-10-07 10:37:28'),
	(9, 4, 'Kitchen Plumbing', 'KITCHEN-PLUMB', 'active', 0, '2026-10-07 10:37:28', '2026-10-07 10:37:28');

-- Dumping structure for table project_control.apartments
DROP TABLE IF EXISTS `apartments`;
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `tower_id` bigint(20) unsigned NOT NULL,
  `level_id` bigint(20) unsigned NOT NULL,
  `typology_id` bigint(20) unsigned DEFAULT NULL,
  `unit_number` varchar(255) NOT NULL,
  `apartment_number` varchar(255) NOT NULL,
  `area_sqm` decimal(10,2) NOT NULL,
  `status` enum('available','reserved','sold','blocked') NOT NULL DEFAULT 'available',
  `priority` enum('High','Medium','Low') NOT NULL DEFAULT 'Low',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apartments_project_id_apartment_number_unique` (`project_id`,`apartment_number`),
  KEY `apartments_tower_id_foreign` (`tower_id`),
  KEY `apartments_level_id_foreign` (`level_id`),
  KEY `apartments_typology_id_foreign` (`typology_id`),
  CONSTRAINT `apartments_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `apartments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `apartments_tower_id_foreign` FOREIGN KEY (`tower_id`) REFERENCES `towers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `apartments_typology_id_foreign` FOREIGN KEY (`typology_id`) REFERENCES `typologies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.apartments: ~96 rows (approximately)
DELETE FROM `apartments`;
INSERT INTO `apartments` (`id`, `project_id`, `tower_id`, `level_id`, `typology_id`, `unit_number`, `apartment_number`, `area_sqm`, `status`, `priority`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 1, '1', 'A011', 650.00, 'available', 'High', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(2, 1, 1, 1, 2, '2', 'A012', 950.00, 'available', 'Medium', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(3, 1, 1, 1, 3, '3', 'A013', 1050.00, 'available', 'Low', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(4, 1, 1, 2, 4, '1', 'A021', 1250.00, 'available', 'High', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(5, 1, 1, 2, 5, '2', 'A022', 1400.00, 'available', 'Medium', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(6, 1, 1, 2, 6, '3', 'A023', 1850.00, 'available', 'Low', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(7, 1, 1, 3, 1, '1', 'A031', 650.00, 'available', 'High', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(8, 1, 1, 3, 2, '2', 'A032', 950.00, 'available', 'Medium', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(9, 1, 1, 3, 3, '3', 'A033', 1050.00, 'available', 'Low', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(10, 1, 1, 4, 4, '1', 'A041', 1250.00, 'available', 'High', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(11, 1, 1, 4, 5, '2', 'A042', 1400.00, 'available', 'Medium', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(12, 1, 1, 4, 6, '3', 'A043', 1850.00, 'available', 'Low', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(13, 1, 1, 5, 1, '1', 'A051', 650.00, 'available', 'High', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(14, 1, 1, 5, 2, '2', 'A052', 950.00, 'available', 'Medium', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(15, 1, 1, 5, 3, '3', 'A053', 1050.00, 'available', 'Low', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(16, 1, 1, 6, 4, '1', 'A061', 1250.00, 'available', 'High', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(17, 1, 1, 6, 5, '2', 'A062', 1400.00, 'available', 'Medium', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(18, 1, 1, 6, 6, '3', 'A063', 1850.00, 'available', 'Low', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(19, 1, 1, 7, 1, '1', 'A071', 650.00, 'available', 'High', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(20, 1, 1, 7, 2, '2', 'A072', 950.00, 'available', 'Medium', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(21, 1, 1, 7, 3, '3', 'A073', 1050.00, 'available', 'Low', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(22, 1, 1, 8, 4, '1', 'A081', 1250.00, 'available', 'High', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(23, 1, 1, 8, 5, '2', 'A082', 1400.00, 'available', 'Medium', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(24, 1, 1, 8, 6, '3', 'A083', 1850.00, 'available', 'Low', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(25, 1, 2, 9, 1, '1', 'B011', 650.00, 'available', 'High', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(26, 1, 2, 9, 2, '2', 'B012', 950.00, 'available', 'Medium', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(27, 1, 2, 9, 3, '3', 'B013', 1050.00, 'available', 'Low', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(28, 1, 2, 10, 4, '1', 'B021', 1250.00, 'available', 'High', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(29, 1, 2, 10, 5, '2', 'B022', 1400.00, 'available', 'Medium', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(30, 1, 2, 10, 6, '3', 'B023', 1850.00, 'available', 'Low', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(31, 1, 2, 11, 1, '1', 'B031', 650.00, 'available', 'High', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(32, 1, 2, 11, 2, '2', 'B032', 950.00, 'available', 'Medium', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(33, 1, 2, 11, 3, '3', 'B033', 1050.00, 'available', 'Low', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(34, 1, 2, 12, 4, '1', 'B041', 1250.00, 'available', 'High', '2026-10-07 10:45:09', '2026-10-07 10:45:09'),
	(35, 1, 2, 12, 5, '2', 'B042', 1400.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(36, 1, 2, 12, 6, '3', 'B043', 1850.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(37, 1, 2, 13, 1, '1', 'B051', 650.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(38, 1, 2, 13, 2, '2', 'B052', 950.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(39, 1, 2, 13, 3, '3', 'B053', 1050.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(40, 1, 2, 14, 4, '1', 'B061', 1250.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(41, 1, 2, 14, 5, '2', 'B062', 1400.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(42, 1, 2, 14, 6, '3', 'B063', 1850.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(43, 1, 2, 15, 1, '1', 'B071', 650.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(44, 1, 2, 15, 2, '2', 'B072', 950.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(45, 1, 2, 15, 3, '3', 'B073', 1050.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(46, 1, 2, 16, 4, '1', 'B081', 1250.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(47, 1, 2, 16, 5, '2', 'B082', 1400.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(48, 1, 2, 16, 6, '3', 'B083', 1850.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(49, 1, 3, 17, 1, '1', 'C011', 650.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(50, 1, 3, 17, 2, '2', 'C012', 950.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(51, 1, 3, 17, 3, '3', 'C013', 1050.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(52, 1, 3, 18, 4, '1', 'C021', 1250.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(53, 1, 3, 18, 5, '2', 'C022', 1400.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(54, 1, 3, 18, 6, '3', 'C023', 1850.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(55, 1, 3, 19, 1, '1', 'C031', 650.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(56, 1, 3, 19, 2, '2', 'C032', 950.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(57, 1, 3, 19, 3, '3', 'C033', 1050.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(58, 1, 3, 20, 4, '1', 'C041', 1250.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(59, 1, 3, 20, 5, '2', 'C042', 1400.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(60, 1, 3, 20, 6, '3', 'C043', 1850.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(61, 1, 3, 21, 1, '1', 'C051', 650.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(62, 1, 3, 21, 2, '2', 'C052', 950.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(63, 1, 3, 21, 3, '3', 'C053', 1050.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(64, 1, 3, 22, 4, '1', 'C061', 1250.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(65, 1, 3, 22, 5, '2', 'C062', 1400.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(66, 1, 3, 22, 6, '3', 'C063', 1850.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(67, 1, 3, 23, 1, '1', 'C071', 650.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(68, 1, 3, 23, 2, '2', 'C072', 950.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(69, 1, 3, 23, 3, '3', 'C073', 1050.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(70, 1, 3, 24, 4, '1', 'C081', 1250.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(71, 1, 3, 24, 5, '2', 'C082', 1400.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(72, 1, 3, 24, 6, '3', 'C083', 1850.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(73, 1, 4, 25, 1, '1', 'D011', 650.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(74, 1, 4, 25, 2, '2', 'D012', 950.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(75, 1, 4, 25, 3, '3', 'D013', 1050.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(76, 1, 4, 26, 4, '1', 'D021', 1250.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(77, 1, 4, 26, 5, '2', 'D022', 1400.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(78, 1, 4, 26, 6, '3', 'D023', 1850.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(79, 1, 4, 27, 1, '1', 'D031', 650.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(80, 1, 4, 27, 2, '2', 'D032', 950.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(81, 1, 4, 27, 3, '3', 'D033', 1050.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(82, 1, 4, 28, 4, '1', 'D041', 1250.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(83, 1, 4, 28, 5, '2', 'D042', 1400.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(84, 1, 4, 28, 6, '3', 'D043', 1850.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(85, 1, 4, 29, 1, '1', 'D051', 650.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(86, 1, 4, 29, 2, '2', 'D052', 950.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(87, 1, 4, 29, 3, '3', 'D053', 1050.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(88, 1, 4, 30, 4, '1', 'D061', 1250.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(89, 1, 4, 30, 5, '2', 'D062', 1400.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(90, 1, 4, 30, 6, '3', 'D063', 1850.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(91, 1, 4, 31, 1, '1', 'D071', 650.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(92, 1, 4, 31, 2, '2', 'D072', 950.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(93, 1, 4, 31, 3, '3', 'D073', 1050.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(94, 1, 4, 32, 4, '1', 'D081', 1250.00, 'available', 'High', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(95, 1, 4, 32, 5, '2', 'D082', 1400.00, 'available', 'Medium', '2026-10-07 10:45:10', '2026-10-07 10:45:10'),
	(96, 1, 4, 32, 6, '3', 'D083', 1850.00, 'available', 'Low', '2026-10-07 10:45:10', '2026-10-07 10:45:10');

-- Dumping structure for table project_control.apartment_configurations
DROP TABLE IF EXISTS `apartment_configurations`;
CREATE TABLE IF NOT EXISTS `apartment_configurations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `apartment_id` bigint(20) unsigned NOT NULL,
  `sub_activity_id` bigint(20) unsigned NOT NULL,
  `activity_id` bigint(20) unsigned NOT NULL,
  `is_configured` tinyint(1) NOT NULL DEFAULT 0,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `notes` text DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'configured',
  `configured_by` bigint(20) NOT NULL DEFAULT 0,
  `configured_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apartment_configurations_apartment_id_sub_activity_id_unique` (`apartment_id`,`sub_activity_id`),
  KEY `apartment_configurations_sub_activity_id_foreign` (`sub_activity_id`),
  KEY `apartment_configurations_activity_id_foreign` (`activity_id`),
  CONSTRAINT `apartment_configurations_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `apartment_configurations_apartment_id_foreign` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `apartment_configurations_sub_activity_id_foreign` FOREIGN KEY (`sub_activity_id`) REFERENCES `sub_activities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.apartment_configurations: ~75 rows (approximately)
DELETE FROM `apartment_configurations`;
INSERT INTO `apartment_configurations` (`id`, `apartment_id`, `sub_activity_id`, `activity_id`, `is_configured`, `priority`, `notes`, `quantity`, `status`, `configured_by`, `configured_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-07 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(2, 2, 2, 2, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-06 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(3, 3, 3, 3, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-05 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(4, 4, 4, 4, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-04 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(5, 5, 5, 5, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-03 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(6, 6, 6, 6, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-02 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(7, 7, 7, 7, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-01 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(8, 8, 8, 8, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-30 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(9, 9, 9, 9, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-29 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(10, 10, 10, 1, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-28 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(11, 11, 11, 2, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-27 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(12, 12, 12, 3, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-26 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(13, 13, 13, 4, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-25 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(14, 14, 14, 5, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-24 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(15, 15, 15, 6, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-23 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(16, 16, 1, 7, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-07 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(17, 17, 2, 8, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-06 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(18, 18, 3, 9, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-05 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(19, 19, 4, 1, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-04 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(20, 20, 5, 2, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-03 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(21, 21, 6, 3, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-02 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(22, 22, 7, 4, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-01 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(23, 23, 8, 5, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-30 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(24, 24, 9, 6, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-29 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(25, 25, 10, 7, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-28 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(26, 26, 11, 8, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-27 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(27, 27, 12, 9, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-26 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(28, 28, 13, 1, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-25 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(29, 29, 14, 2, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-24 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(30, 30, 15, 3, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-23 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(31, 31, 1, 4, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-07 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(32, 32, 2, 5, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-06 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(33, 33, 3, 6, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-05 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(34, 34, 4, 7, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-04 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(35, 35, 5, 8, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-03 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(36, 36, 6, 9, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-02 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(37, 37, 7, 1, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-01 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(38, 38, 8, 2, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-30 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(39, 39, 9, 3, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-29 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(40, 40, 10, 4, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-28 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(41, 41, 11, 5, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-27 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(42, 42, 12, 6, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-26 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(43, 43, 13, 7, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-25 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(44, 44, 14, 8, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-24 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(45, 45, 15, 9, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-23 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(46, 46, 1, 1, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-07 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(47, 47, 2, 2, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-06 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(48, 48, 3, 3, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-05 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(49, 49, 4, 4, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-04 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(50, 50, 5, 5, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-03 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(51, 51, 6, 6, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-02 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(52, 52, 7, 7, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-01 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(53, 53, 8, 8, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-30 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(54, 54, 9, 9, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-29 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(55, 55, 10, 1, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-28 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(56, 56, 11, 2, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-27 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(57, 57, 12, 3, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-26 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(58, 58, 13, 4, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-25 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(59, 59, 14, 5, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-24 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(60, 60, 15, 6, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-23 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(61, 61, 1, 7, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-07 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(62, 62, 2, 8, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-06 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(63, 63, 3, 9, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-05 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(64, 64, 4, 1, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-04 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(65, 65, 5, 2, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-03 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(66, 66, 6, 3, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-02 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(67, 67, 7, 4, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-10-01 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(68, 68, 8, 5, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-30 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(69, 69, 9, 6, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-29 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(70, 70, 10, 7, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-28 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(71, 71, 11, 8, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-27 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(72, 72, 12, 9, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-26 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(73, 73, 13, 1, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-25 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(74, 74, 14, 2, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-24 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16'),
	(75, 75, 15, 3, 0, 'medium', 'Configuration completed successfully.', 1, 'configured', 3, '2026-09-23 10:53:16', '2026-10-07 10:53:16', '2026-10-07 10:53:16');

-- Dumping structure for table project_control.appointments
DROP TABLE IF EXISTS `appointments`;
CREATE TABLE IF NOT EXISTS `appointments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `apartment_id` bigint(20) unsigned DEFAULT NULL,
  `appointment_number` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `appointment_date` datetime NOT NULL,
  `appointment_time` varchar(50) DEFAULT NULL,
  `status` enum('scheduled','confirmed','completed','cancelled') NOT NULL DEFAULT 'scheduled',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appointments_appointment_number_unique` (`appointment_number`),
  KEY `appointments_project_id_foreign` (`project_id`),
  KEY `appointments_apartment_id_foreign` (`apartment_id`),
  CONSTRAINT `appointments_apartment_id_foreign` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `appointments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.appointments: ~0 rows (approximately)
DELETE FROM `appointments`;
INSERT INTO `appointments` (`id`, `project_id`, `apartment_id`, `appointment_number`, `customer_name`, `customer_email`, `customer_phone`, `appointment_date`, `appointment_time`, `status`, `notes`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '95864422', 'Sneha', NULL, NULL, '2026-10-08 00:00:00', '10:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(2, 1, 3, '49689434', 'John', NULL, NULL, '2026-10-10 00:00:00', '12:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(3, 1, 5, '51599799', 'Sneha', NULL, NULL, '2026-10-12 00:00:00', '14:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(4, 1, 7, '62120612', 'Michael', NULL, NULL, '2026-10-14 00:00:00', '16:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(5, 1, 9, '40480502', 'Anita', NULL, NULL, '2026-10-16 00:00:00', '11:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(6, 1, 11, '47943561', 'Priya', NULL, NULL, '2026-10-08 00:00:00', '13:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(7, 1, 13, '94931888', 'Anita', NULL, NULL, '2026-10-10 00:00:00', '15:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(8, 1, 15, '52125778', 'John', NULL, NULL, '2026-10-12 00:00:00', '10:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(9, 1, 17, '75303675', 'Anita', NULL, NULL, '2026-10-14 00:00:00', '12:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(10, 1, 19, '16684214', 'David', NULL, NULL, '2026-10-16 00:00:00', '14:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(11, 1, 21, '64400116', 'Anita', NULL, NULL, '2026-10-08 00:00:00', '16:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(12, 1, 23, '70823259', 'Sarah', NULL, NULL, '2026-10-10 00:00:00', '11:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(13, 1, 25, '13790431', 'Emily', NULL, NULL, '2026-10-12 00:00:00', '13:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(14, 1, 27, '41972600', 'Rahul', NULL, NULL, '2026-10-14 00:00:00', '15:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(15, 1, 29, '84257728', 'Emily', NULL, NULL, '2026-10-16 00:00:00', '10:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(16, 1, 31, '28990581', 'Rahul', NULL, NULL, '2026-10-08 00:00:00', '12:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(17, 1, 33, '19772998', 'Emily', NULL, NULL, '2026-10-10 00:00:00', '14:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(18, 1, 35, '85555597', 'Emily', NULL, NULL, '2026-10-12 00:00:00', '16:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(19, 1, 37, '52817869', 'David', NULL, NULL, '2026-10-14 00:00:00', '11:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(20, 1, 39, '91249907', 'David', NULL, NULL, '2026-10-16 00:00:00', '13:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(21, 1, 41, '87760217', 'Rahul', NULL, NULL, '2026-10-08 00:00:00', '15:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(22, 1, 43, '13847159', 'Rahul', NULL, NULL, '2026-10-10 00:00:00', '10:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(23, 1, 45, '10336895', 'Sneha', NULL, NULL, '2026-10-12 00:00:00', '12:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(24, 1, 47, '26835389', 'Rahul', NULL, NULL, '2026-10-14 00:00:00', '14:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(25, 1, 49, '34248725', 'Priya', NULL, NULL, '2026-10-16 00:00:00', '16:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(26, 1, 51, '15816596', 'Anita', NULL, NULL, '2026-10-08 00:00:00', '11:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(27, 1, 53, '40355365', 'Priya', NULL, NULL, '2026-10-10 00:00:00', '13:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(28, 1, 55, '70056404', 'Sneha', NULL, NULL, '2026-10-12 00:00:00', '15:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(29, 1, 57, '15894335', 'Rahul', NULL, NULL, '2026-10-14 00:00:00', '10:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(30, 1, 59, '48203520', 'Emily', NULL, NULL, '2026-10-16 00:00:00', '12:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(31, 1, 61, '85718726', 'Sarah', NULL, NULL, '2026-10-08 00:00:00', '14:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(32, 1, 63, '45445523', 'Rahul', NULL, NULL, '2026-10-10 00:00:00', '16:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(33, 1, 65, '59172299', 'David', NULL, NULL, '2026-10-12 00:00:00', '11:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:23', '2026-10-07 11:01:23'),
	(34, 1, 67, '92235340', 'John', NULL, NULL, '2026-10-14 00:00:00', '13:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(35, 1, 69, '85120249', 'Michael', NULL, NULL, '2026-10-16 00:00:00', '15:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(36, 1, 71, '33775859', 'Priya', NULL, NULL, '2026-10-08 00:00:00', '10:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(37, 1, 73, '36820732', 'Amit', NULL, NULL, '2026-10-10 00:00:00', '12:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(38, 1, 75, '28678755', 'Sneha', NULL, NULL, '2026-10-12 00:00:00', '14:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(39, 1, 77, '76352929', 'Priya', NULL, NULL, '2026-10-14 00:00:00', '16:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(40, 1, 79, '60305228', 'David', NULL, NULL, '2026-10-16 00:00:00', '11:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(41, 1, 81, '74083248', 'Rahul', NULL, NULL, '2026-10-08 00:00:00', '13:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(42, 1, 83, '32376870', 'Michael', NULL, NULL, '2026-10-10 00:00:00', '15:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(43, 1, 85, '32588999', 'John', NULL, NULL, '2026-10-12 00:00:00', '10:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(44, 1, 87, '14355615', 'Emily', NULL, NULL, '2026-10-14 00:00:00', '12:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(45, 1, 89, '77660673', 'David', NULL, NULL, '2026-10-16 00:00:00', '14:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(46, 1, 91, '29337464', 'Amit', NULL, NULL, '2026-10-08 00:00:00', '16:00:00', 'scheduled', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(47, 1, 93, '97843696', 'Michael', NULL, NULL, '2026-10-10 00:00:00', '11:00:00', 'cancelled', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24'),
	(48, 1, 95, '26014022', 'David', NULL, NULL, '2026-10-12 00:00:00', '13:00:00', 'completed', 'Apartment configuration appointment.', '2026-10-07 11:01:24', '2026-10-07 11:01:24');

-- Dumping structure for table project_control.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.cache: ~0 rows (approximately)
DELETE FROM `cache`;

-- Dumping structure for table project_control.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.cache_locks: ~0 rows (approximately)
DELETE FROM `cache_locks`;

-- Dumping structure for table project_control.divisions
DROP TABLE IF EXISTS `divisions`;
CREATE TABLE IF NOT EXISTS `divisions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `divisions_project_id_code_unique` (`project_id`,`code`),
  CONSTRAINT `divisions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.divisions: ~4 rows (approximately)
DELETE FROM `divisions`;
INSERT INTO `divisions` (`id`, `project_id`, `name`, `code`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Architecture', 'ARCH', 'Architectural activities', 0, 'active', '2026-10-07 10:20:36', '2026-10-07 10:20:36'),
	(2, 1, 'Civil', 'CIVIL', 'Civil and structural activities', 0, 'active', '2026-10-07 10:20:36', '2026-10-07 10:20:36'),
	(3, 1, 'Electrical', 'ELEC', 'Electrical activities', 0, 'active', '2026-10-07 10:20:36', '2026-10-07 10:20:36'),
	(4, 1, 'Plumbing', 'PLUMB', 'Plumbing activities', 0, 'active', '2026-10-07 10:20:36', '2026-10-07 10:20:36');

-- Dumping structure for table project_control.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table project_control.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.jobs: ~0 rows (approximately)
DELETE FROM `jobs`;

-- Dumping structure for table project_control.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.job_batches: ~0 rows (approximately)
DELETE FROM `job_batches`;

-- Dumping structure for table project_control.levels
DROP TABLE IF EXISTS `levels`;
CREATE TABLE IF NOT EXISTS `levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tower_id` bigint(20) unsigned NOT NULL,
  `level_number` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `levels_tower_id_level_number_unique` (`tower_id`,`level_number`),
  CONSTRAINT `levels_tower_id_foreign` FOREIGN KEY (`tower_id`) REFERENCES `towers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.levels: ~32 rows (approximately)
DELETE FROM `levels`;
INSERT INTO `levels` (`id`, `tower_id`, `level_number`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'Level 1', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(2, 1, 2, 'Level 2', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(3, 1, 3, 'Level 3', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(4, 1, 4, 'Level 4', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(5, 1, 5, 'Level 5', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(6, 1, 6, 'Level 6', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(7, 1, 7, 'Level 7', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(8, 1, 8, 'Level 8', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(9, 2, 1, 'Level 1', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(10, 2, 2, 'Level 2', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(11, 2, 3, 'Level 3', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(12, 2, 4, 'Level 4', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(13, 2, 5, 'Level 5', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(14, 2, 6, 'Level 6', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(15, 2, 7, 'Level 7', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(16, 2, 8, 'Level 8', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(17, 3, 1, 'Level 1', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(18, 3, 2, 'Level 2', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(19, 3, 3, 'Level 3', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(20, 3, 4, 'Level 4', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(21, 3, 5, 'Level 5', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(22, 3, 6, 'Level 6', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(23, 3, 7, 'Level 7', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(24, 3, 8, 'Level 8', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(25, 4, 1, 'Level 1', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(26, 4, 2, 'Level 2', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(27, 4, 3, 'Level 3', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(28, 4, 4, 'Level 4', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(29, 4, 5, 'Level 5', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(30, 4, 6, 'Level 6', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(31, 4, 7, 'Level 7', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47'),
	(32, 4, 8, 'Level 8', 'active', '2026-10-07 10:25:47', '2026-10-07 10:25:47');

-- Dumping structure for table project_control.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.migrations: ~15 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_10_07_125420_create_personal_access_tokens_table', 1),
	(5, '2026_10_07_133316_create_projects_table', 1),
	(6, '2026_10_07_133411_create_divisions_table', 1),
	(7, '2026_10_07_133417_create_sub_divisions_table', 1),
	(8, '2026_10_07_133424_create_activities_table', 1),
	(9, '2026_10_07_133429_create_sub_activities_table', 1),
	(10, '2026_10_07_133433_create_towers_table', 1),
	(11, '2026_10_07_133438_create_levels_table', 1),
	(12, '2026_10_07_133444_create_typologies_table', 1),
	(13, '2026_10_07_133449_create_apartments_table', 1),
	(14, '2026_10_07_133454_create_apartment_configurations_table', 1),
	(15, '2026_10_07_133459_create_appointments_table', 1);

-- Dumping structure for table project_control.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table project_control.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table project_control.projects
DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.projects: ~1 rows (approximately)
DELETE FROM `projects`;
INSERT INTO `projects` (`id`, `name`, `code`, `status`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Sample Residential Project', 'PROJECT-001', 'active', 'Sample project for apartment configuration', '2026-10-07 10:20:36', '2026-10-07 10:20:36');

-- Dumping structure for table project_control.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.sessions: ~0 rows (approximately)
DELETE FROM `sessions`;

-- Dumping structure for table project_control.sub_activities
DROP TABLE IF EXISTS `sub_activities`;
CREATE TABLE IF NOT EXISTS `sub_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_activities_activity_id_code_unique` (`activity_id`,`code`),
  CONSTRAINT `sub_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.sub_activities: ~15 rows (approximately)
DELETE FROM `sub_activities`;
INSERT INTO `sub_activities` (`id`, `activity_id`, `name`, `code`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Living Room Flooring', 'FLOOR-LIVING', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(2, 1, 'Bedroom Flooring', 'FLOOR-BEDROOM', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(3, 1, 'Kitchen Flooring', 'FLOOR-KITCHEN', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(4, 2, 'Main Entrance Door', 'DOOR-MAIN', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(5, 2, 'Bedroom Door', 'DOOR-BEDROOM', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(6, 3, 'Living Room Window', 'WINDOW-LIVING', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(7, 3, 'Bedroom Window', 'WINDOW-BEDROOM', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(8, 4, 'Living Room Walls', 'PAINT-LIVING', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(9, 4, 'Bedroom Walls', 'PAINT-BEDROOM', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(10, 6, 'Living Room Lights', 'LIGHT-LIVING', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(11, 6, 'Bedroom Lights', 'LIGHT-BEDROOM', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(12, 7, 'Modular Switches', 'SWITCH-MODULAR', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(13, 8, 'Wash Basin', 'SANITARY-BASIN', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(14, 8, 'WC', 'SANITARY-WC', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10'),
	(15, 9, 'Kitchen Sink', 'KITCHEN-SINK', 'active', 0, '2026-10-07 10:38:10', '2026-10-07 10:38:10');

-- Dumping structure for table project_control.sub_divisions
DROP TABLE IF EXISTS `sub_divisions`;
CREATE TABLE IF NOT EXISTS `sub_divisions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `division_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_divisions_division_id_code_unique` (`division_id`,`code`),
  CONSTRAINT `sub_divisions_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.sub_divisions: ~9 rows (approximately)
DELETE FROM `sub_divisions`;
INSERT INTO `sub_divisions` (`id`, `division_id`, `name`, `code`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Flooring', 'ARCH-FLOOR', 'active', 0, '2026-10-07 10:21:58', '2026-10-07 10:21:58'),
	(2, 1, 'Doors', 'ARCH-DOOR', 'active', 0, '2026-10-07 10:21:58', '2026-10-07 10:21:58'),
	(3, 1, 'Windows', 'ARCH-WINDOW', 'active', 0, '2026-10-07 10:21:58', '2026-10-07 10:21:58'),
	(4, 2, 'Painting', 'CIVIL-PAINT', 'active', 0, '2026-10-07 10:21:58', '2026-10-07 10:21:58'),
	(5, 2, 'Civil Works', 'CIVIL-WORK', 'active', 0, '2026-10-07 10:21:58', '2026-10-07 10:21:58'),
	(6, 3, 'Lighting', 'ELEC-LIGHT', 'active', 0, '2026-10-07 10:21:58', '2026-10-07 10:21:58'),
	(7, 3, 'Power', 'ELEC-POWER', 'active', 0, '2026-10-07 10:21:58', '2026-10-07 10:21:58'),
	(8, 4, 'Bathroom', 'PLUMB-BATH', 'active', 0, '2026-10-07 10:21:58', '2026-10-07 10:21:58'),
	(9, 4, 'Kitchen', 'PLUMB-KITCHEN', 'active', 0, '2026-10-07 10:21:58', '2026-10-07 10:21:58');

-- Dumping structure for table project_control.towers
DROP TABLE IF EXISTS `towers`;
CREATE TABLE IF NOT EXISTS `towers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `total_levels` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `towers_project_id_code_unique` (`project_id`,`code`),
  CONSTRAINT `towers_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.towers: ~4 rows (approximately)
DELETE FROM `towers`;
INSERT INTO `towers` (`id`, `project_id`, `name`, `code`, `status`, `total_levels`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Tower A', 'A', 'active', 0, '2026-10-07 10:24:36', '2026-10-07 10:24:36'),
	(2, 1, 'Tower B', 'B', 'active', 0, '2026-10-07 10:24:36', '2026-10-07 10:24:36'),
	(3, 1, 'Tower C', 'C', 'active', 0, '2026-10-07 10:24:36', '2026-10-07 10:24:36'),
	(4, 1, 'Tower D', 'D', 'active', 0, '2026-10-07 10:24:36', '2026-10-07 10:24:36');

-- Dumping structure for table project_control.typologies
DROP TABLE IF EXISTS `typologies`;
CREATE TABLE IF NOT EXISTS `typologies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `bedrooms` tinyint(3) unsigned DEFAULT NULL,
  `bathrooms` tinyint(3) unsigned DEFAULT NULL,
  `default_area_sqm` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `typologies_project_id_code_unique` (`project_id`,`code`),
  CONSTRAINT `typologies_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.typologies: ~6 rows (approximately)
DELETE FROM `typologies`;
INSERT INTO `typologies` (`id`, `project_id`, `name`, `code`, `bedrooms`, `bathrooms`, `default_area_sqm`, `description`, `area`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, '1 BHK Type A', '1BHK-A', 1, 1, NULL, NULL, '650', 'active', '2026-10-07 10:28:16', '2026-10-07 10:28:16'),
	(2, 1, '2 BHK Type A', '2BHK-A', 2, 2, NULL, NULL, '950', 'active', '2026-10-07 10:28:16', '2026-10-07 10:28:16'),
	(3, 1, '2 BHK Type B', '2BHK-B', 2, 2, NULL, NULL, '1050', 'active', '2026-10-07 10:28:16', '2026-10-07 10:28:16'),
	(4, 1, '3 BHK Type A', '3BHK-A', 3, 3, NULL, NULL, '1250', 'active', '2026-10-07 10:28:16', '2026-10-07 10:28:16'),
	(5, 1, '3 BHK Type B', '3BHK-B', 3, 3, NULL, NULL, '1400', 'active', '2026-10-07 10:28:16', '2026-10-07 10:28:16'),
	(6, 1, '4 BHK Premium', '4BHK-P', 4, 4, NULL, NULL, '1850', 'active', '2026-10-07 10:28:16', '2026-10-07 10:28:16');

-- Dumping structure for table project_control.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project_control.users: ~3 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'System Administrator', 'admin@example.com', NULL, '$2y$12$fv3QsevoSRYzr2xcM1KQA.3Ja8B1cDViwuXygO2PWWI.Bjocw0MOK', NULL, '2026-10-07 10:20:36', '2026-10-07 10:20:36'),
	(2, 'Project Manager', 'manager@example.com', NULL, '$2y$12$WzBNTApdeYzSgBMs7120uuup9uCXONFqC1mBhKhuTr4ALPhT4reKi', NULL, '2026-10-07 10:20:36', '2026-10-07 10:20:36'),
	(3, 'Configuration Manager', 'configurator@example.com', NULL, '$2y$12$bZOh44WLzwGxj1i9aoiQAOl41XWoCtayqroczQdL6miRO1pW2KZzi', NULL, '2026-10-07 10:20:36', '2026-10-07 10:20:36');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
