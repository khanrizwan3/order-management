# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26)
# Database: order_management
# Generation Time: 2021-03-14 15:15:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table discounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `discounts`;

CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `quantity` smallint(6) NOT NULL,
  `discount_percent` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discounts_product_id_foreign` (`product_id`),
  CONSTRAINT `discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `discounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;

INSERT INTO `discounts` (`id`, `title`, `product_id`, `quantity`, `discount_percent`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'20% discount on 3 Pepsi purchase',1,3,20,1,'2021-03-12 21:22:13','2021-03-12 21:22:13');

/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(25,'2014_10_12_000000_create_users_table',1),
	(26,'2014_10_12_100000_create_password_resets_table',1),
	(27,'2019_08_19_000000_create_failed_jobs_table',1),
	(28,'2021_03_09_203552_create_products_table',1),
	(29,'2021_03_10_061215_create_orders_table',1),
	(31,'2021_03_12_200635_create_discounts_table',2);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `quantity` smallint(6) NOT NULL,
  `total_price` decimal(5,2) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_product_id_foreign` (`product_id`),
  CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `quantity`, `total_price`, `created_by`, `modified_by`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,2,4,5.00,NULL,NULL,1,'2021-03-10 23:32:08','2021-03-10 23:32:08'),
	(3,3,1,4,5.00,NULL,NULL,1,'2021-03-10 23:45:01','2021-03-10 23:45:01'),
	(4,4,2,4,5.00,NULL,NULL,1,'2021-03-10 23:45:28','2021-03-10 23:45:28'),
	(5,6,1,4,2.00,NULL,NULL,1,'2021-03-10 23:45:54','2021-03-10 23:45:54'),
	(6,2,2,2,2.00,NULL,NULL,1,'2021-03-10 23:46:17','2021-03-10 23:46:17'),
	(7,2,1,2,4.00,NULL,NULL,1,'2021-03-10 23:46:29','2021-03-10 23:46:29'),
	(8,2,2,5,5.00,NULL,NULL,1,'2021-03-10 23:46:37','2021-03-10 23:46:37'),
	(9,6,1,4,5.00,NULL,NULL,1,'2021-03-10 23:46:50','2021-03-10 23:46:50'),
	(10,5,2,6,7.00,NULL,NULL,1,'2021-03-10 23:46:59','2021-03-10 23:46:59'),
	(11,2,1,5,7.00,NULL,NULL,1,'2021-03-10 23:47:08','2021-03-10 23:47:08'),
	(12,5,2,7,6.00,NULL,NULL,1,'2021-03-10 23:47:25','2021-03-10 23:47:25'),
	(13,5,1,7,6.00,NULL,NULL,1,'2021-03-11 09:28:56','2021-03-11 09:28:56'),
	(14,5,1,7,14.00,NULL,NULL,1,'2021-03-11 09:29:07','2021-03-11 09:29:07'),
	(15,12,2,3,2.00,NULL,NULL,1,'2021-03-11 09:29:29','2021-03-11 09:29:29'),
	(16,1,2,5,5.00,NULL,NULL,1,'2021-03-11 09:35:23','2021-03-11 09:35:23'),
	(19,2,1,2,15.00,NULL,NULL,1,'2021-03-11 20:24:16','2021-03-12 15:22:19'),
	(22,6,2,7,18.00,NULL,NULL,1,'2021-03-12 06:03:40','2021-03-12 06:03:40'),
	(23,20,2,5,20.00,NULL,NULL,1,'2021-03-12 13:36:46','2021-03-12 13:36:46'),
	(24,1,1,6,25.00,NULL,NULL,1,'2021-03-12 15:41:11','2021-03-12 15:41:11'),
	(25,1,1,5,15.36,NULL,NULL,1,'2021-03-13 13:51:40','2021-03-13 13:51:40'),
	(26,3,1,3,9.22,NULL,NULL,1,'2021-03-13 14:33:28','2021-03-13 14:33:58'),
	(27,1,1,5,15.36,NULL,NULL,100,'2021-03-13 18:44:50','2021-03-13 18:44:50'),
	(28,1,1,7,21.50,NULL,NULL,100,'2021-03-13 19:03:53','2021-03-13 19:03:53'),
	(29,1,1,7,21.50,NULL,NULL,100,'2021-03-13 19:06:53','2021-03-13 19:06:53'),
	(30,1,1,6,18.43,NULL,NULL,100,'2021-03-13 19:27:11','2021-03-13 19:27:11'),
	(31,1,1,6,18.43,NULL,NULL,100,'2021-03-13 19:29:11','2021-03-13 19:29:11'),
	(32,1,1,6,18.43,NULL,NULL,100,'2021-03-13 19:30:20','2021-03-13 19:30:20'),
	(33,1,1,3,9.22,NULL,NULL,100,'2021-03-13 19:31:35','2021-03-13 19:31:35'),
	(34,1,1,5,15.36,NULL,NULL,100,'2021-03-13 19:38:50','2021-03-13 19:38:50'),
	(35,1,1,7,21.50,NULL,NULL,100,'2021-03-13 19:40:21','2021-03-13 19:40:21'),
	(36,1,1,6,18.43,NULL,NULL,100,'2021-03-13 19:48:02','2021-03-13 19:48:02'),
	(37,1,1,5,15.36,NULL,NULL,100,'2021-03-13 19:49:21','2021-03-13 19:49:21'),
	(38,1,1,6,18.43,NULL,NULL,100,'2021-03-13 19:50:40','2021-03-13 19:50:40'),
	(39,1,1,3,9.22,NULL,NULL,100,'2021-03-13 19:51:43','2021-03-13 19:51:43'),
	(40,1,1,7,21.50,NULL,NULL,100,'2021-03-13 19:52:53','2021-03-13 19:52:53'),
	(41,1,1,5,15.36,NULL,NULL,100,'2021-03-13 19:55:34','2021-03-13 19:55:34'),
	(42,1,1,6,18.43,NULL,NULL,100,'2021-03-13 19:56:05','2021-03-13 19:56:05'),
	(43,1,1,6,18.43,NULL,NULL,100,'2021-03-13 19:58:22','2021-03-13 19:58:22'),
	(44,1,1,3,9.22,NULL,NULL,100,'2021-03-13 19:58:52','2021-03-13 19:58:52'),
	(45,1,1,6,18.43,NULL,NULL,100,'2021-03-13 20:02:06','2021-03-13 20:02:06'),
	(46,1,1,6,18.43,NULL,NULL,100,'2021-03-13 20:05:03','2021-03-13 20:05:03'),
	(47,1,1,3,9.22,NULL,NULL,100,'2021-03-13 20:05:50','2021-03-13 20:05:50'),
	(48,1,1,7,21.50,NULL,NULL,100,'2021-03-13 20:07:44','2021-03-13 20:07:44'),
	(49,1,1,7,21.50,NULL,NULL,100,'2021-03-13 20:08:06','2021-03-13 20:08:06'),
	(50,1,1,7,21.50,NULL,NULL,100,'2021-03-13 20:10:32','2021-03-13 20:10:32'),
	(51,1,1,6,18.43,NULL,NULL,100,'2021-03-13 20:20:02','2021-03-13 20:20:02'),
	(52,1,1,7,21.50,NULL,NULL,100,'2021-03-13 20:22:23','2021-03-13 20:22:23'),
	(53,1,1,7,21.50,NULL,NULL,100,'2021-03-13 20:25:34','2021-03-13 20:25:34'),
	(54,1,1,7,21.50,NULL,NULL,100,'2021-03-13 20:26:02','2021-03-13 20:26:02'),
	(55,1,1,6,18.43,NULL,NULL,100,'2021-03-13 20:27:14','2021-03-13 20:27:14'),
	(56,1,1,7,21.50,NULL,NULL,100,'2021-03-13 20:28:06','2021-03-13 20:28:06'),
	(57,1,1,7,21.50,NULL,NULL,100,'2021-03-13 20:43:36','2021-03-13 20:43:36'),
	(58,1,1,7,21.50,NULL,NULL,100,'2021-03-13 20:44:46','2021-03-13 20:44:46'),
	(59,1,1,7,21.50,NULL,NULL,100,'2021-03-13 20:52:48','2021-03-13 20:52:48'),
	(60,1,1,7,21.50,NULL,NULL,100,'2021-03-14 10:46:36','2021-03-14 10:46:36'),
	(61,1,2,5,19.20,NULL,NULL,100,'2021-03-14 10:50:43','2021-03-14 10:50:43'),
	(62,1,2,21,80.64,NULL,NULL,100,'2021-03-14 10:55:04','2021-03-14 10:55:04'),
	(64,1,2,21,80.64,NULL,NULL,100,'2021-03-14 11:02:47','2021-03-14 11:02:47'),
	(65,1,2,21,80.64,NULL,NULL,100,'2021-03-14 11:03:07','2021-03-14 11:03:07'),
	(66,1,2,21,80.64,NULL,NULL,100,'2021-03-14 11:03:41','2021-03-14 11:03:41'),
	(67,1,2,21,80.64,NULL,NULL,100,'2021-03-14 11:12:49','2021-03-14 11:12:49'),
	(68,1,2,21,80.64,NULL,NULL,100,'2021-03-14 11:15:57','2021-03-14 11:15:57'),
	(69,1,2,21,80.64,NULL,NULL,100,'2021-03-14 11:18:58','2021-03-14 11:18:58'),
	(70,1,2,21,80.64,NULL,NULL,100,'2021-03-14 11:19:32','2021-03-14 11:19:32');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `name`, `description`, `price`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Pepsi','Pepsi beverage.',3.84,1,'2021-03-10 19:11:44','2021-03-10 19:11:44'),
	(2,'Coca Cola','Coca Cola beverage.',3.84,1,'2021-03-10 19:11:44','2021-03-10 19:11:44');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Princess Towne DDS','rbartoletti@example.org','2021-03-10 11:46:21','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qIQzbKCCWz','2021-03-10 11:46:21','2021-03-10 11:46:21'),
	(2,'Jonas Grady','mills.orie@example.net','2021-03-10 11:46:21','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','c88RfFKew9','2021-03-10 11:46:21','2021-03-10 11:46:21'),
	(3,'Jasper Zboncak','jsatterfield@example.com','2021-03-10 11:46:21','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mI0ToiaVgC','2021-03-10 11:46:21','2021-03-10 11:46:21'),
	(4,'Manuela Ward','ckuphal@example.net','2021-03-10 11:46:21','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','QaGzTdnE0H','2021-03-10 11:46:21','2021-03-10 11:46:21'),
	(5,'Hollis Morar Sr.','germaine45@example.com','2021-03-10 11:46:21','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','0m60bviNAd','2021-03-10 11:46:21','2021-03-10 11:46:21'),
	(6,'Ashlynn Zemlak','german39@example.com','2021-03-10 11:46:21','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9zDXCJHtwY','2021-03-10 11:46:21','2021-03-10 11:46:21'),
	(7,'Arianna Maggio','kiehn.wanda@example.net','2021-03-10 11:46:21','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','XS7QmTvOer','2021-03-10 11:46:21','2021-03-10 11:46:21'),
	(8,'Cyril Kerluke','ova76@example.com','2021-03-10 11:46:21','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','6nWO3WofL6','2021-03-10 11:46:21','2021-03-10 11:46:21'),
	(9,'Mrs. Alize Ondricka DDS','cjohnson@example.org','2021-03-10 11:46:21','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qaUdE9ZMdR','2021-03-10 11:46:21','2021-03-10 11:46:21'),
	(10,'Garnet Kihn PhD','sibyl49@example.com','2021-03-10 11:46:21','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','t059WBPlko','2021-03-10 11:46:21','2021-03-10 11:46:21'),
	(11,'Dr. Caleb Wehner','imani05@example.com','2021-03-10 18:17:40','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','pwaJZfXMLb','2021-03-10 18:17:40','2021-03-10 18:17:40'),
	(12,'Kathleen Frami','marguerite.heaney@example.com','2021-03-10 18:17:40','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','tbAxU62Koo','2021-03-10 18:17:40','2021-03-10 18:17:40'),
	(13,'Mr. Haleigh Balistreri','demarco05@example.net','2021-03-10 18:17:40','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','DhNGJ3ExaN','2021-03-10 18:17:40','2021-03-10 18:17:40'),
	(14,'Miss Kianna Osinski MD','harber.reba@example.com','2021-03-10 18:17:40','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','YVKAm1gVOs','2021-03-10 18:17:40','2021-03-10 18:17:40'),
	(15,'Katelynn Thiel','collier.mohammad@example.com','2021-03-10 18:17:40','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','R746FpZFoB','2021-03-10 18:17:40','2021-03-10 18:17:40'),
	(16,'Angela Ruecker','doug.roob@example.net','2021-03-10 18:17:40','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','onU0SoeQqt','2021-03-10 18:17:40','2021-03-10 18:17:40'),
	(17,'Prof. Wiley Dibbert','harber.joaquin@example.org','2021-03-10 18:17:40','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','gyMzvy1ScP','2021-03-10 18:17:40','2021-03-10 18:17:40'),
	(18,'Mandy Kuvalis','mae.kutch@example.com','2021-03-10 18:17:40','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','p2ZepDlw4q','2021-03-10 18:17:40','2021-03-10 18:17:40'),
	(19,'Prof. Hayley Auer DDS','ines18@example.com','2021-03-10 18:17:40','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','dgUhvkMdKC','2021-03-10 18:17:40','2021-03-10 18:17:40'),
	(20,'Meta Bogisich','pprice@example.net','2021-03-10 18:17:40','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','m2ppVo7tQg','2021-03-10 18:17:40','2021-03-10 18:17:40'),
	(21,'Muhammad Rizwan Khan','khanrizwan3@gmail.com',NULL,'$2y$10$ed52Haz2ZCWPIJ02e49UluZoja2GTSlqTglgrj5/yx5utNsH0tBci',NULL,'2021-03-12 18:11:16','2021-03-12 18:11:16');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
