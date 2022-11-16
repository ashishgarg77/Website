-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: mylist
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_payment_gateways`
--

DROP TABLE IF EXISTS `account_payment_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_payment_gateways` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL,
  `payment_gateway_id` int unsigned NOT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_payment_gateways_payment_gateway_id_foreign` (`payment_gateway_id`),
  KEY `account_payment_gateways_account_id_foreign` (`account_id`),
  CONSTRAINT `account_payment_gateways_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_payment_gateways_payment_gateway_id_foreign` FOREIGN KEY (`payment_gateway_id`) REFERENCES `payment_gateways` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_payment_gateways`
--

LOCK TABLES `account_payment_gateways` WRITE;
/*!40000 ALTER TABLE `account_payment_gateways` DISABLE KEYS */;
INSERT INTO `account_payment_gateways` VALUES (1,1,2,'[]',NULL,'2022-04-22 18:26:02','2022-04-22 18:26:02'),(2,1,4,'[]',NULL,'2022-05-03 08:37:10','2022-05-03 08:37:10');
/*!40000 ALTER TABLE `account_payment_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone_id` int unsigned DEFAULT NULL,
  `date_format_id` int unsigned DEFAULT NULL,
  `datetime_format_id` int unsigned DEFAULT NULL,
  `currency_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_date` timestamp NULL DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `email_footer` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `is_beta` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_access_token` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_refresh_token` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_publishable_key` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_data_raw` text COLLATE utf8mb4_unicode_ci,
  `payment_gateway_id` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `accounts_timezone_id_foreign` (`timezone_id`),
  KEY `accounts_date_format_id_foreign` (`date_format_id`),
  KEY `accounts_datetime_format_id_foreign` (`datetime_format_id`),
  KEY `accounts_currency_id_foreign` (`currency_id`),
  KEY `accounts_payment_gateway_id_foreign` (`payment_gateway_id`),
  CONSTRAINT `accounts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `accounts_date_format_id_foreign` FOREIGN KEY (`date_format_id`) REFERENCES `date_formats` (`id`),
  CONSTRAINT `accounts_datetime_format_id_foreign` FOREIGN KEY (`datetime_format_id`) REFERENCES `date_formats` (`id`),
  CONSTRAINT `accounts_payment_gateway_id_foreign` FOREIGN KEY (`payment_gateway_id`) REFERENCES `payment_gateways` (`id`),
  CONSTRAINT `accounts_timezone_id_foreign` FOREIGN KEY (`timezone_id`) REFERENCES `timezones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'ravi','kathait','ravikathait01@gmail.com',30,NULL,NULL,2,'2022-04-20 23:14:51','2022-05-03 08:37:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,4),(2,'Ravi','Kathait','ravikathait04@gmail.com',30,NULL,NULL,2,'2022-04-20 23:33:34','2022-04-20 23:33:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,1),(3,'Ravi','kathait','ravikathait05@gmail.com',30,NULL,NULL,2,'2022-04-20 23:51:20','2022-04-20 23:51:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliates`
--

DROP TABLE IF EXISTS `affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visits` int NOT NULL,
  `tickets_sold` int NOT NULL,
  `sales_volume` decimal(10,2) NOT NULL DEFAULT '0.00',
  `last_visit` timestamp NOT NULL,
  `account_id` int unsigned NOT NULL,
  `event_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `affiliates_event_id_foreign` (`event_id`),
  KEY `affiliates_account_id_index` (`account_id`),
  CONSTRAINT `affiliates_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `affiliates_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliates`
--

LOCK TABLES `affiliates` WRITE;
/*!40000 ALTER TABLE `affiliates` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendees`
--

DROP TABLE IF EXISTS `attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `event_id` int unsigned NOT NULL,
  `ticket_id` int unsigned NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `private_reference_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `has_arrived` tinyint(1) NOT NULL DEFAULT '0',
  `arrival_time` datetime DEFAULT NULL,
  `account_id` int unsigned NOT NULL,
  `reference_index` int NOT NULL DEFAULT '0',
  `is_refunded` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `attendees_order_id_index` (`order_id`),
  KEY `attendees_event_id_index` (`event_id`),
  KEY `attendees_ticket_id_index` (`ticket_id`),
  KEY `attendees_private_reference_number_index` (`private_reference_number`),
  KEY `attendees_account_id_index` (`account_id`),
  CONSTRAINT `attendees_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendees_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendees_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendees_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendees`
--

LOCK TABLES `attendees` WRITE;
/*!40000 ALTER TABLE `attendees` DISABLE KEYS */;
INSERT INTO `attendees` VALUES (1,1,1,1,'sa','sa','samreshitanexpert@gmail.com','AWQEh8xW57TAHUN','2022-04-23 05:52:44','2022-04-23 05:52:44',NULL,0,0,NULL,1,1,0),(2,1,1,1,'sa','sa','samreshitanexpert@gmail.com','sOxYMgVdEPbnjMf','2022-04-23 05:52:44','2022-04-23 05:52:44',NULL,0,0,NULL,1,2,0),(3,1,1,1,'sa','sa','samreshitanexpert@gmail.com','aLLDVqZyz9smH60','2022-04-23 05:52:44','2022-04-23 05:52:44',NULL,0,0,NULL,1,3,0),(4,1,1,1,'sa','sa','samreshitanexpert@gmail.com','FBhSk9Fvrs44OhF','2022-04-23 05:52:44','2022-04-23 05:52:44',NULL,0,0,NULL,1,4,0),(5,2,1,1,'test','kathait','ravikathait04@gmail.com','cARqFwOxPDEkIFH','2022-05-01 13:05:06','2022-05-01 13:05:06',NULL,0,0,NULL,1,1,0),(6,2,1,1,'test','kathait','ravikathait04@gmail.com','PjNiOki220WMcWH','2022-05-01 13:05:06','2022-05-01 13:05:06',NULL,0,0,NULL,1,2,0),(7,2,1,1,'test','kathait','ravikathait04@gmail.com','LGbeBjnBKGDTHP2','2022-05-01 13:05:06','2022-05-01 13:05:06',NULL,0,0,NULL,1,3,0),(8,2,1,2,'test','kathait','ravikathait04@gmail.com','bVeA0cX4DwYdcuj','2022-05-01 13:05:06','2022-05-01 13:05:06',NULL,0,0,NULL,1,4,0),(9,2,1,2,'test','kathait','ravikathait04@gmail.com','wQgSn0sUsVGhqDK','2022-05-01 13:05:06','2022-05-01 13:05:06',NULL,0,0,NULL,1,5,0),(10,3,1,1,'test','kathait','ravikathait04@gmail.com','7WXn2I0CfR8jogz','2022-05-02 15:42:42','2022-05-02 15:42:42',NULL,0,0,NULL,1,1,0),(11,3,1,1,'test','kathait','ravikathait04@gmail.com','mdZwXl4f62bGtes','2022-05-02 15:42:42','2022-05-02 15:42:42',NULL,0,0,NULL,1,2,0),(12,3,1,1,'test','kathait','ravikathait04@gmail.com','0RYtkScsBk5Qx6t','2022-05-02 15:42:42','2022-05-02 15:42:42',NULL,0,0,NULL,1,3,0),(13,3,1,1,'test','kathait','ravikathait04@gmail.com','ikyzoV2gF0gVWjt','2022-05-02 15:42:42','2022-05-02 15:42:42',NULL,0,0,NULL,1,4,0),(14,3,1,2,'test','kathait','ravikathait04@gmail.com','Viu1WBQx8mv7tZs','2022-05-02 15:42:42','2022-05-02 15:42:42',NULL,0,0,NULL,1,5,0),(15,3,1,2,'test','kathait','ravikathait04@gmail.com','ywvyIIeO2u52ESW','2022-05-02 15:42:42','2022-05-02 15:42:42',NULL,0,0,NULL,1,6,0),(16,3,1,2,'test','kathait','ravikathait04@gmail.com','FQVrbpchiXssW0C','2022-05-02 15:42:42','2022-05-02 15:42:42',NULL,0,0,NULL,1,7,0),(17,4,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','HwHjzWGzIlu8bOA','2022-05-03 10:42:37','2022-05-03 10:42:37',NULL,0,0,NULL,1,1,0),(18,5,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','kBTzBvGNnfjywKK','2022-05-03 10:48:02','2022-05-03 10:48:02',NULL,0,0,NULL,1,1,0),(19,5,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','wehLvpL08nyE3Mu','2022-05-03 10:48:02','2022-05-03 10:48:02',NULL,0,0,NULL,1,2,0),(20,6,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','PfjVmF63w7T6tKF','2022-05-03 10:55:06','2022-05-03 10:55:06',NULL,0,0,NULL,1,1,0),(21,7,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','FPzIZjPAjwM7CPT','2022-05-03 11:14:01','2022-05-03 11:14:01',NULL,0,0,NULL,1,1,0),(22,8,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','ZxN3wzaEnRbJ1RS','2022-05-05 08:21:44','2022-05-05 08:21:44',NULL,0,0,NULL,1,1,0),(23,9,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','ycPMJ2a0Ci5WiZr','2022-05-05 09:00:56','2022-05-05 09:00:56',NULL,0,0,NULL,1,1,0),(24,10,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','bqrgnLVRAZuYNbc','2022-05-05 09:37:46','2022-05-05 09:37:46',NULL,0,0,NULL,1,1,0),(25,11,1,1,'test','kathait','ravikathait04@gmail.com','isX53Nu5zVw24fo','2022-05-05 11:26:41','2022-05-05 11:26:41',NULL,0,0,NULL,1,1,0),(26,11,1,1,'test','kathait','ravikathait04@gmail.com','xRLmIFG2DEialpj','2022-05-05 11:26:41','2022-05-05 11:26:41',NULL,0,0,NULL,1,2,0),(27,12,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','ydFVqB2au89zT4V','2022-05-05 12:56:13','2022-05-05 12:56:13',NULL,0,0,NULL,1,1,0),(28,13,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','5pfX70t8GSqg50R','2022-05-05 13:47:20','2022-05-05 13:47:20',NULL,0,0,NULL,1,1,0),(29,13,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','FQf7YvzcIBiYcf2','2022-05-05 13:47:20','2022-05-05 13:47:20',NULL,0,0,NULL,1,2,0),(30,14,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','KcV6E2BV1gflpwg','2022-05-05 13:53:53','2022-05-05 13:53:53',NULL,0,0,NULL,1,1,0),(31,15,1,1,'test','kathait','ravikathait04@gmail.com','3XMBZGNC4qT07u6','2022-05-05 13:54:29','2022-05-05 13:54:29',NULL,0,0,NULL,1,1,0),(32,15,1,1,'test','kathait','ravikathait04@gmail.com','kcXODir5dt1Cu7U','2022-05-05 13:54:29','2022-05-05 13:54:29',NULL,0,0,NULL,1,2,0),(33,15,1,1,'test','kathait','ravikathait04@gmail.com','rAaXhrofsvhx9DA','2022-05-05 13:54:29','2022-05-05 13:54:29',NULL,0,0,NULL,1,3,0),(34,15,1,1,'test','kathait','ravikathait04@gmail.com','4MtN4lts7szR3rK','2022-05-05 13:54:29','2022-05-05 13:54:29',NULL,0,0,NULL,1,4,0),(35,16,1,1,'Ravi','kathait','ravikathait04@gmail.com','fw1HOasurONw0z3','2022-05-09 16:06:25','2022-05-09 16:06:25',NULL,0,0,NULL,1,1,0),(36,16,1,1,'Ravi','kathait','ravikathait04@gmail.com','r8W0oY9TWnWFh6N','2022-05-09 16:06:25','2022-05-09 16:06:25',NULL,0,0,NULL,1,2,0),(37,17,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','3a9BciJpgUvcqRf','2022-05-10 12:45:47','2022-05-10 12:45:47',NULL,0,0,NULL,1,1,0),(38,18,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','WwFLxMoMQyNmwPy','2022-05-10 12:48:04','2022-05-10 12:48:04',NULL,0,0,NULL,1,1,0),(39,19,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','h0iajDctZsvG8fC','2022-05-10 12:49:19','2022-05-10 12:49:19',NULL,0,0,NULL,1,1,0),(40,20,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','Z070TKmHPU4FsZj','2022-05-10 12:49:21','2022-05-10 12:49:21',NULL,0,0,NULL,1,1,0),(41,21,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','NCt6Em7u9lJiN2m','2022-05-10 12:50:00','2022-05-10 12:50:00',NULL,0,0,NULL,1,1,0),(42,22,1,1,'Amandeep','Singh','er.amandeep04@gmail.com','7olvXkxvjrJ7mUS','2022-05-10 12:50:31','2022-05-10 12:50:31',NULL,0,0,NULL,1,1,0),(43,23,1,1,'test','kathait','ravikathait04@gmail.com','mzs6cO3DJfKbyeq','2022-05-25 16:30:16','2022-05-25 16:30:16',NULL,0,0,NULL,1,1,0),(44,23,1,1,'test','kathait','ravikathait04@gmail.com','DeWA1wOoRmNEm2u','2022-05-25 16:30:16','2022-05-25 16:30:16',NULL,0,0,NULL,1,2,0),(45,24,3,3,'sam','kim','samreshitanexpert@gmail.com','Nj5A1dolrNKpAd1','2022-05-28 19:21:03','2022-05-28 19:21:03',NULL,0,0,NULL,1,1,0),(46,24,3,3,'sam','kim','samreshitanexpert@gmail.com','nRQ4aqY990TTxP5','2022-05-28 19:21:03','2022-05-28 19:21:03',NULL,0,0,NULL,1,2,0),(47,24,3,3,'sam','kim','samreshitanexpert@gmail.com','MiTlhRHdP8hvUWa','2022-05-28 19:21:03','2022-05-28 19:21:03',NULL,0,0,NULL,1,3,0),(48,24,3,3,'sam','kim','samreshitanexpert@gmail.com','eBzhsiBiOFoQX1m','2022-05-28 19:21:03','2022-05-28 19:21:03',NULL,0,0,NULL,1,4,0),(49,24,3,3,'sam','kim','samreshitanexpert@gmail.com','46ntfbTrPfWP38l','2022-05-28 19:21:03','2022-05-28 19:21:03',NULL,0,0,NULL,1,5,0),(50,24,3,3,'sam','kim','samreshitanexpert@gmail.com','wai4NfSbSo5xxpo','2022-05-28 19:21:03','2022-05-28 19:21:03',NULL,0,0,NULL,1,6,0),(51,24,3,3,'sam','kim','samreshitanexpert@gmail.com','5OTeaWS80fNTSen','2022-05-28 19:21:03','2022-05-28 19:21:03',NULL,0,0,NULL,1,7,0),(52,24,3,3,'sam','kim','samreshitanexpert@gmail.com','AZh3WtVGhLsh6ga','2022-05-28 19:21:03','2022-05-28 19:21:03',NULL,0,0,NULL,1,8,0),(53,24,3,3,'sam','kim','samreshitanexpert@gmail.com','AdLYrTFLZ0iT0Dc','2022-05-28 19:21:03','2022-05-28 19:21:03',NULL,0,0,NULL,1,9,0),(54,24,3,3,'sam','kim','samreshitanexpert@gmail.com','J49DljSBMUYjJmh','2022-05-28 19:21:03','2022-05-28 19:21:03',NULL,0,0,NULL,1,10,0),(55,25,4,5,'ravi','kathait','ravikathait04@gmail.com','AHRRCUu5QlEC2Nv','2022-05-29 18:44:06','2022-05-29 18:44:06',NULL,0,0,NULL,1,1,0),(56,25,4,5,'ravi','kathait','ravikathait04@gmail.com','yqQociuLyA88rzR','2022-05-29 18:44:06','2022-05-29 18:44:06',NULL,0,0,NULL,1,2,0),(57,26,4,5,'Ravi','kathait','ravikathait01@gmail.com','3ZFcaSpqFZWEABJ','2022-05-30 13:00:51','2022-05-30 13:00:51',NULL,0,0,NULL,1,1,0),(58,27,4,5,'local','team','ravikathait01@gmail.com','w2x6ZrsxvSAQmuz','2022-05-30 13:01:20','2022-05-30 13:01:20',NULL,0,0,NULL,1,1,0),(59,28,3,3,'Ravi','kathait','ravikathait01@gmail.com','cSucB0kNxLkMIne','2022-05-30 13:17:00','2022-05-30 13:17:00',NULL,0,0,NULL,1,1,0);
/*!40000 ALTER TABLE `attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL,
  `capital` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `citizenship` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_sub_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_3166_2` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `iso_3166_3` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `region_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sub_region_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `eea` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `countries_id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (4,'Kabul','Afghan','004','afghani','AFN','pul','Islamic Republic of Afghanistan','AF','AFG','Afghanistan','142','034',0),(8,'Tirana','Albanian','008','lek','ALL','(qindar (pl. qindarka))','Republic of Albania','AL','ALB','Albania','150','039',0),(10,'Antartica','of Antartica','010','','','','Antarctica','AQ','ATA','Antarctica','','',0),(12,'Algiers','Algerian','012','Algerian dinar','DZD','centime','People’s Democratic Republic of Algeria','DZ','DZA','Algeria','002','015',0),(16,'Pago Pago','American Samoan','016','US dollar','USD','cent','Territory of American','AS','ASM','American Samoa','009','061',0),(20,'Andorra la Vella','Andorran','020','euro','EUR','cent','Principality of Andorra','AD','AND','Andorra','150','039',0),(24,'Luanda','Angolan','024','kwanza','AOA','cêntimo','Republic of Angola','AO','AGO','Angola','002','017',0),(28,'St John’s','of Antigua and Barbuda','028','East Caribbean dollar','XCD','cent','Antigua and Barbuda','AG','ATG','Antigua and Barbuda','019','029',0),(31,'Baku','Azerbaijani','031','Azerbaijani manat','AZN','kepik (inv.)','Republic of Azerbaijan','AZ','AZE','Azerbaijan','142','145',0),(32,'Buenos Aires','Argentinian','032','Argentine peso','ARS','centavo','Argentine Republic','AR','ARG','Argentina','019','005',0),(36,'Canberra','Australian','036','Australian dollar','AUD','cent','Commonwealth of Australia','AU','AUS','Australia','009','053',0),(40,'Vienna','Austrian','040','euro','EUR','cent','Republic of Austria','AT','AUT','Austria','150','155',1),(44,'Nassau','Bahamian','044','Bahamian dollar','BSD','cent','Commonwealth of the Bahamas','BS','BHS','Bahamas','019','029',0),(48,'Manama','Bahraini','048','Bahraini dinar','BHD','fils (inv.)','Kingdom of Bahrain','BH','BHR','Bahrain','142','145',0),(50,'Dhaka','Bangladeshi','050','taka (inv.)','BDT','poisha (inv.)','People’s Republic of Bangladesh','BD','BGD','Bangladesh','142','034',0),(51,'Yerevan','Armenian','051','dram (inv.)','AMD','luma','Republic of Armenia','AM','ARM','Armenia','142','145',0),(52,'Bridgetown','Barbadian','052','Barbados dollar','BBD','cent','Barbados','BB','BRB','Barbados','019','029',0),(56,'Brussels','Belgian','056','euro','EUR','cent','Kingdom of Belgium','BE','BEL','Belgium','150','155',1),(60,'Hamilton','Bermudian','060','Bermuda dollar','BMD','cent','Bermuda','BM','BMU','Bermuda','019','021',0),(64,'Thimphu','Bhutanese','064','ngultrum (inv.)','BTN','chhetrum (inv.)','Kingdom of Bhutan','BT','BTN','Bhutan','142','034',0),(68,'Sucre (BO1)','Bolivian','068','boliviano','BOB','centavo','Plurinational State of Bolivia','BO','BOL','Bolivia, Plurinational State of','019','005',0),(70,'Sarajevo','of Bosnia and Herzegovina','070','convertible mark','BAM','fening','Bosnia and Herzegovina','BA','BIH','Bosnia and Herzegovina','150','039',0),(72,'Gaborone','Botswanan','072','pula (inv.)','BWP','thebe (inv.)','Republic of Botswana','BW','BWA','Botswana','002','018',0),(74,'Bouvet island','of Bouvet island','074','','','','Bouvet Island','BV','BVT','Bouvet Island','','',0),(76,'Brasilia','Brazilian','076','real (pl. reais)','BRL','centavo','Federative Republic of Brazil','BR','BRA','Brazil','019','005',0),(84,'Belmopan','Belizean','084','Belize dollar','BZD','cent','Belize','BZ','BLZ','Belize','019','013',0),(86,'Diego Garcia','Changosian','086','US dollar','USD','cent','British Indian Ocean Territory','IO','IOT','British Indian Ocean Territory','','',0),(90,'Honiara','Solomon Islander','090','Solomon Islands dollar','SBD','cent','Solomon Islands','SB','SLB','Solomon Islands','009','054',0),(92,'Road Town','British Virgin Islander;','092','US dollar','USD','cent','British Virgin Islands','VG','VGB','Virgin Islands, British','019','029',0),(96,'Bandar Seri Begawan','Bruneian','096','Brunei dollar','BND','sen (inv.)','Brunei Darussalam','BN','BRN','Brunei Darussalam','142','035',0),(100,'Sofia','Bulgarian','100','lev (pl. leva)','BGN','stotinka','Republic of Bulgaria','BG','BGR','Bulgaria','150','151',1),(104,'Yangon','Burmese','104','kyat','MMK','pya','Union of Myanmar/','MM','MMR','Myanmar','142','035',0),(108,'Bujumbura','Burundian','108','Burundi franc','BIF','centime','Republic of Burundi','BI','BDI','Burundi','002','014',0),(112,'Minsk','Belarusian','112','Belarusian rouble','BYR','kopek','Republic of Belarus','BY','BLR','Belarus','150','151',0),(116,'Phnom Penh','Cambodian','116','riel','KHR','sen (inv.)','Kingdom of Cambodia','KH','KHM','Cambodia','142','035',0),(120,'Yaoundé','Cameroonian','120','CFA franc (BEAC)','XAF','centime','Republic of Cameroon','CM','CMR','Cameroon','002','017',0),(124,'Ottawa','Canadian','124','Canadian dollar','CAD','cent','Canada','CA','CAN','Canada','019','021',0),(132,'Praia','Cape Verdean','132','Cape Verde escudo','CVE','centavo','Republic of Cape Verde','CV','CPV','Cape Verde','002','011',0),(136,'George Town','Caymanian','136','Cayman Islands dollar','KYD','cent','Cayman Islands','KY','CYM','Cayman Islands','019','029',0),(140,'Bangui','Central African','140','CFA franc (BEAC)','XAF','centime','Central African Republic','CF','CAF','Central African Republic','002','017',0),(144,'Colombo','Sri Lankan','144','Sri Lankan rupee','LKR','cent','Democratic Socialist Republic of Sri Lanka','LK','LKA','Sri Lanka','142','034',0),(148,'N’Djamena','Chadian','148','CFA franc (BEAC)','XAF','centime','Republic of Chad','TD','TCD','Chad','002','017',0),(152,'Santiago','Chilean','152','Chilean peso','CLP','centavo','Republic of Chile','CL','CHL','Chile','019','005',0),(156,'Beijing','Chinese','156','renminbi-yuan (inv.)','CNY','jiao (10)','People’s Republic of China','CN','CHN','China','142','030',0),(158,'Taipei','Taiwanese','158','new Taiwan dollar','TWD','fen (inv.)','Republic of China, Taiwan (TW1)','TW','TWN','Taiwan, Province of China','142','030',0),(162,'Flying Fish Cove','Christmas Islander','162','Australian dollar','AUD','cent','Christmas Island Territory','CX','CXR','Christmas Island','','',0),(166,'Bantam','Cocos Islander','166','Australian dollar','AUD','cent','Territory of Cocos (Keeling) Islands','CC','CCK','Cocos (Keeling) Islands','','',0),(170,'Santa Fe de Bogotá','Colombian','170','Colombian peso','COP','centavo','Republic of Colombia','CO','COL','Colombia','019','005',0),(174,'Moroni','Comorian','174','Comorian franc','KMF','','Union of the Comoros','KM','COM','Comoros','002','014',0),(175,'Mamoudzou','Mahorais','175','euro','EUR','cent','Departmental Collectivity of Mayotte','YT','MYT','Mayotte','002','014',0),(178,'Brazzaville','Congolese','178','CFA franc (BEAC)','XAF','centime','Republic of the Congo','CG','COG','Congo','002','017',0),(180,'Kinshasa','Congolese','180','Congolese franc','CDF','centime','Democratic Republic of the Congo','CD','COD','Congo, the Democratic Republic of the','002','017',0),(184,'Avarua','Cook Islander','184','New Zealand dollar','NZD','cent','Cook Islands','CK','COK','Cook Islands','009','061',0),(188,'San José','Costa Rican','188','Costa Rican colón (pl. colones)','CRC','céntimo','Republic of Costa Rica','CR','CRI','Costa Rica','019','013',0),(191,'Zagreb','Croatian','191','kuna (inv.)','HRK','lipa (inv.)','Republic of Croatia','HR','HRV','Croatia','150','039',1),(192,'Havana','Cuban','192','Cuban peso','CUP','centavo','Republic of Cuba','CU','CUB','Cuba','019','029',0),(196,'Nicosia','Cypriot','196','euro','EUR','cent','Republic of Cyprus','CY','CYP','Cyprus','142','145',1),(203,'Prague','Czech','203','Czech koruna (pl. koruny)','CZK','halér','Czech Republic','CZ','CZE','Czech Republic','150','151',1),(204,'Porto Novo (BJ1)','Beninese','204','CFA franc (BCEAO)','XOF','centime','Republic of Benin','BJ','BEN','Benin','002','011',0),(208,'Copenhagen','Danish','208','Danish krone','DKK','øre (inv.)','Kingdom of Denmark','DK','DNK','Denmark','150','154',1),(212,'Roseau','Dominican','212','East Caribbean dollar','XCD','cent','Commonwealth of Dominica','DM','DMA','Dominica','019','029',0),(214,'Santo Domingo','Dominican','214','Dominican peso','DOP','centavo','Dominican Republic','DO','DOM','Dominican Republic','019','029',0),(218,'Quito','Ecuadorian','218','US dollar','USD','cent','Republic of Ecuador','EC','ECU','Ecuador','019','005',0),(222,'San Salvador','Salvadoran','222','Salvadorian colón (pl. colones)','SVC','centavo','Republic of El Salvador','SV','SLV','El Salvador','019','013',0),(226,'Malabo','Equatorial Guinean','226','CFA franc (BEAC)','XAF','centime','Republic of Equatorial Guinea','GQ','GNQ','Equatorial Guinea','002','017',0),(231,'Addis Ababa','Ethiopian','231','birr (inv.)','ETB','cent','Federal Democratic Republic of Ethiopia','ET','ETH','Ethiopia','002','014',0),(232,'Asmara','Eritrean','232','nakfa','ERN','cent','State of Eritrea','ER','ERI','Eritrea','002','014',0),(233,'Tallinn','Estonian','233','euro','EUR','cent','Republic of Estonia','EE','EST','Estonia','150','154',1),(234,'Tórshavn','Faeroese','234','Danish krone','DKK','øre (inv.)','Faeroe Islands','FO','FRO','Faroe Islands','150','154',0),(238,'Stanley','Falkland Islander','238','Falkland Islands pound','FKP','new penny','Falkland Islands','FK','FLK','Falkland Islands (Malvinas)','019','005',0),(239,'King Edward Point (Grytviken)','of South Georgia and the South Sandwich Islands','239','','','','South Georgia and the South Sandwich Islands','GS','SGS','South Georgia and the South Sandwich Islands','','',0),(242,'Suva','Fijian','242','Fiji dollar','FJD','cent','Republic of Fiji','FJ','FJI','Fiji','009','054',0),(246,'Helsinki','Finnish','246','euro','EUR','cent','Republic of Finland','FI','FIN','Finland','150','154',1),(248,'Mariehamn','Åland Islander','248','euro','EUR','cent','Åland Islands','AX','ALA','Åland Islands','150','154',0),(250,'Paris','French','250','euro','EUR','cent','French Republic','FR','FRA','France','150','155',1),(254,'Cayenne','Guianese','254','euro','EUR','cent','French Guiana','GF','GUF','French Guiana','019','005',0),(258,'Papeete','Polynesian','258','CFP franc','XPF','centime','French Polynesia','PF','PYF','French Polynesia','009','061',0),(260,'Port-aux-Francais','of French Southern and Antarctic Lands','260','euro','EUR','cent','French Southern and Antarctic Lands','TF','ATF','French Southern Territories','','',0),(262,'Djibouti','Djiboutian','262','Djibouti franc','DJF','','Republic of Djibouti','DJ','DJI','Djibouti','002','014',0),(266,'Libreville','Gabonese','266','CFA franc (BEAC)','XAF','centime','Gabonese Republic','GA','GAB','Gabon','002','017',0),(268,'Tbilisi','Georgian','268','lari','GEL','tetri (inv.)','Georgia','GE','GEO','Georgia','142','145',0),(270,'Banjul','Gambian','270','dalasi (inv.)','GMD','butut','Republic of the Gambia','GM','GMB','Gambia','002','011',0),(275,NULL,'Palestinian','275',NULL,NULL,NULL,NULL,'PS','PSE','Palestinian Territory, Occupied','142','145',0),(276,'Berlin','German','276','euro','EUR','cent','Federal Republic of Germany','DE','DEU','Germany','150','155',1),(288,'Accra','Ghanaian','288','Ghana cedi','GHS','pesewa','Republic of Ghana','GH','GHA','Ghana','002','011',0),(292,'Gibraltar','Gibraltarian','292','Gibraltar pound','GIP','penny','Gibraltar','GI','GIB','Gibraltar','150','039',0),(296,'Tarawa','Kiribatian','296','Australian dollar','AUD','cent','Republic of Kiribati','KI','KIR','Kiribati','009','057',0),(300,'Athens','Greek','300','euro','EUR','cent','Hellenic Republic','GR','GRC','Greece','150','039',1),(304,'Nuuk','Greenlander','304','Danish krone','DKK','øre (inv.)','Greenland','GL','GRL','Greenland','019','021',0),(308,'St George’s','Grenadian','308','East Caribbean dollar','XCD','cent','Grenada','GD','GRD','Grenada','019','029',0),(312,'Basse Terre','Guadeloupean','312','euro','EUR ','cent','Guadeloupe','GP','GLP','Guadeloupe','019','029',0),(316,'Agaña (Hagåtña)','Guamanian','316','US dollar','USD','cent','Territory of Guam','GU','GUM','Guam','009','057',0),(320,'Guatemala City','Guatemalan','320','quetzal (pl. quetzales)','GTQ','centavo','Republic of Guatemala','GT','GTM','Guatemala','019','013',0),(324,'Conakry','Guinean','324','Guinean franc','GNF','','Republic of Guinea','GN','GIN','Guinea','002','011',0),(328,'Georgetown','Guyanese','328','Guyana dollar','GYD','cent','Cooperative Republic of Guyana','GY','GUY','Guyana','019','005',0),(332,'Port-au-Prince','Haitian','332','gourde','HTG','centime','Republic of Haiti','HT','HTI','Haiti','019','029',0),(334,'Territory of Heard Island and McDonald Islands','of Territory of Heard Island and McDonald Islands','334','','','','Territory of Heard Island and McDonald Islands','HM','HMD','Heard Island and McDonald Islands','','',0),(336,'Vatican City','of the Holy See/of the Vatican','336','euro','EUR','cent','the Holy See/ Vatican City State','VA','VAT','Holy See (Vatican City State)','150','039',0),(340,'Tegucigalpa','Honduran','340','lempira','HNL','centavo','Republic of Honduras','HN','HND','Honduras','019','013',0),(344,'(HK3)','Hong Kong Chinese','344','Hong Kong dollar','HKD','cent','Hong Kong Special Administrative Region of the People’s Republic of China (HK2)','HK','HKG','Hong Kong','142','030',0),(348,'Budapest','Hungarian','348','forint (inv.)','HUF','(fillér (inv.))','Republic of Hungary','HU','HUN','Hungary','150','151',1),(352,'Reykjavik','Icelander','352','króna (pl. krónur)','ISK','','Republic of Iceland','IS','ISL','Iceland','150','154',1),(356,'New Delhi','Indian','356','Indian rupee','INR','paisa','Republic of India','IN','IND','India','142','034',0),(360,'Jakarta','Indonesian','360','Indonesian rupiah (inv.)','IDR','sen (inv.)','Republic of Indonesia','ID','IDN','Indonesia','142','035',0),(364,'Tehran','Iranian','364','Iranian rial','IRR','(dinar) (IR1)','Islamic Republic of Iran','IR','IRN','Iran, Islamic Republic of','142','034',0),(368,'Baghdad','Iraqi','368','Iraqi dinar','IQD','fils (inv.)','Republic of Iraq','IQ','IRQ','Iraq','142','145',0),(372,'Dublin','Irish','372','euro','EUR','cent','Ireland (IE1)','IE','IRL','Ireland','150','154',1),(376,'(IL1)','Israeli','376','shekel','ILS','agora','State of Israel','IL','ISR','Israel','142','145',0),(380,'Rome','Italian','380','euro','EUR','cent','Italian Republic','IT','ITA','Italy','150','039',1),(384,'Yamoussoukro (CI1)','Ivorian','384','CFA franc (BCEAO)','XOF','centime','Republic of Côte d’Ivoire','CI','CIV','Côte d\'Ivoire','002','011',0),(388,'Kingston','Jamaican','388','Jamaica dollar','JMD','cent','Jamaica','JM','JAM','Jamaica','019','029',0),(392,'Tokyo','Japanese','392','yen (inv.)','JPY','(sen (inv.)) (JP1)','Japan','JP','JPN','Japan','142','030',0),(398,'Astana','Kazakh','398','tenge (inv.)','KZT','tiyn','Republic of Kazakhstan','KZ','KAZ','Kazakhstan','142','143',0),(400,'Amman','Jordanian','400','Jordanian dinar','JOD','100 qirsh','Hashemite Kingdom of Jordan','JO','JOR','Jordan','142','145',0),(404,'Nairobi','Kenyan','404','Kenyan shilling','KES','cent','Republic of Kenya','KE','KEN','Kenya','002','014',0),(408,'Pyongyang','North Korean','408','North Korean won (inv.)','KPW','chun (inv.)','Democratic People’s Republic of Korea','KP','PRK','Korea, Democratic People\'s Republic of','142','030',0),(410,'Seoul','South Korean','410','South Korean won (inv.)','KRW','(chun (inv.))','Republic of Korea','KR','KOR','Korea, Republic of','142','030',0),(414,'Kuwait City','Kuwaiti','414','Kuwaiti dinar','KWD','fils (inv.)','State of Kuwait','KW','KWT','Kuwait','142','145',0),(417,'Bishkek','Kyrgyz','417','som','KGS','tyiyn','Kyrgyz Republic','KG','KGZ','Kyrgyzstan','142','143',0),(418,'Vientiane','Lao','418','kip (inv.)','LAK','(at (inv.))','Lao People’s Democratic Republic','LA','LAO','Lao People\'s Democratic Republic','142','035',0),(422,'Beirut','Lebanese','422','Lebanese pound','LBP','(piastre)','Lebanese Republic','LB','LBN','Lebanon','142','145',0),(426,'Maseru','Basotho','426','loti (pl. maloti)','LSL','sente','Kingdom of Lesotho','LS','LSO','Lesotho','002','018',0),(428,'Riga','Latvian','428','euro','EUR','cent','Republic of Latvia','LV','LVA','Latvia','150','154',1),(430,'Monrovia','Liberian','430','Liberian dollar','LRD','cent','Republic of Liberia','LR','LBR','Liberia','002','011',0),(434,'Tripoli','Libyan','434','Libyan dinar','LYD','dirham','Socialist People’s Libyan Arab Jamahiriya','LY','LBY','Libya','002','015',0),(438,'Vaduz','Liechtensteiner','438','Swiss franc','CHF','centime','Principality of Liechtenstein','LI','LIE','Liechtenstein','150','155',1),(440,'Vilnius','Lithuanian','440','euro','EUR','cent','Republic of Lithuania','LT','LTU','Lithuania','150','154',1),(442,'Luxembourg','Luxembourger','442','euro','EUR','cent','Grand Duchy of Luxembourg','LU','LUX','Luxembourg','150','155',1),(446,'Macao (MO3)','Macanese','446','pataca','MOP','avo','Macao Special Administrative Region of the People’s Republic of China (MO2)','MO','MAC','Macao','142','030',0),(450,'Antananarivo','Malagasy','450','ariary','MGA','iraimbilanja (inv.)','Republic of Madagascar','MG','MDG','Madagascar','002','014',0),(454,'Lilongwe','Malawian','454','Malawian kwacha (inv.)','MWK','tambala (inv.)','Republic of Malawi','MW','MWI','Malawi','002','014',0),(458,'Kuala Lumpur (MY1)','Malaysian','458','ringgit (inv.)','MYR','sen (inv.)','Malaysia','MY','MYS','Malaysia','142','035',0),(462,'Malé','Maldivian','462','rufiyaa','MVR','laari (inv.)','Republic of Maldives','MV','MDV','Maldives','142','034',0),(466,'Bamako','Malian','466','CFA franc (BCEAO)','XOF','centime','Republic of Mali','ML','MLI','Mali','002','011',0),(470,'Valletta','Maltese','470','euro','EUR','cent','Republic of Malta','MT','MLT','Malta','150','039',1),(474,'Fort-de-France','Martinican','474','euro','EUR','cent','Martinique','MQ','MTQ','Martinique','019','029',0),(478,'Nouakchott','Mauritanian','478','ouguiya','MRO','khoum','Islamic Republic of Mauritania','MR','MRT','Mauritania','002','011',0),(480,'Port Louis','Mauritian','480','Mauritian rupee','MUR','cent','Republic of Mauritius','MU','MUS','Mauritius','002','014',0),(484,'Mexico City','Mexican','484','Mexican peso','MXN','centavo','United Mexican States','MX','MEX','Mexico','019','013',0),(492,'Monaco','Monegasque','492','euro','EUR','cent','Principality of Monaco','MC','MCO','Monaco','150','155',0),(496,'Ulan Bator','Mongolian','496','tugrik','MNT','möngö (inv.)','Mongolia','MN','MNG','Mongolia','142','030',0),(498,'Chisinau','Moldovan','498','Moldovan leu (pl. lei)','MDL','ban','Republic of Moldova','MD','MDA','Moldova, Republic of','150','151',0),(499,'Podgorica','Montenegrin','499','euro','EUR','cent','Montenegro','ME','MNE','Montenegro','150','039',0),(500,'Plymouth (MS2)','Montserratian','500','East Caribbean dollar','XCD','cent','Montserrat','MS','MSR','Montserrat','019','029',0),(504,'Rabat','Moroccan','504','Moroccan dirham','MAD','centime','Kingdom of Morocco','MA','MAR','Morocco','002','015',0),(508,'Maputo','Mozambican','508','metical','MZN','centavo','Republic of Mozambique','MZ','MOZ','Mozambique','002','014',0),(512,'Muscat','Omani','512','Omani rial','OMR','baiza','Sultanate of Oman','OM','OMN','Oman','142','145',0),(516,'Windhoek','Namibian','516','Namibian dollar','NAD','cent','Republic of Namibia','NA','NAM','Namibia','002','018',0),(520,'Yaren','Nauruan','520','Australian dollar','AUD','cent','Republic of Nauru','NR','NRU','Nauru','009','057',0),(524,'Kathmandu','Nepalese','524','Nepalese rupee','NPR','paisa (inv.)','Nepal','NP','NPL','Nepal','142','034',0),(528,'Amsterdam (NL2)','Dutch','528','euro','EUR','cent','Kingdom of the Netherlands','NL','NLD','Netherlands','150','155',1),(531,'Willemstad','Curaçaoan','531','Netherlands Antillean guilder (CW1)','ANG','cent','Curaçao','CW','CUW','Curaçao','019','029',0),(533,'Oranjestad','Aruban','533','Aruban guilder','AWG','cent','Aruba','AW','ABW','Aruba','019','029',0),(534,'Philipsburg','Sint Maartener','534','Netherlands Antillean guilder (SX1)','ANG','cent','Sint Maarten','SX','SXM','Sint Maarten (Dutch part)','019','029',0),(535,NULL,'of Bonaire, Sint Eustatius and Saba','535','US dollar','USD','cent',NULL,'BQ','BES','Bonaire, Sint Eustatius and Saba','019','029',0),(540,'Nouméa','New Caledonian','540','CFP franc','XPF','centime','New Caledonia','NC','NCL','New Caledonia','009','054',0),(548,'Port Vila','Vanuatuan','548','vatu (inv.)','VUV','','Republic of Vanuatu','VU','VUT','Vanuatu','009','054',0),(554,'Wellington','New Zealander','554','New Zealand dollar','NZD','cent','New Zealand','NZ','NZL','New Zealand','009','053',0),(558,'Managua','Nicaraguan','558','córdoba oro','NIO','centavo','Republic of Nicaragua','NI','NIC','Nicaragua','019','013',0),(562,'Niamey','Nigerien','562','CFA franc (BCEAO)','XOF','centime','Republic of Niger','NE','NER','Niger','002','011',0),(566,'Abuja','Nigerian','566','naira (inv.)','NGN','kobo (inv.)','Federal Republic of Nigeria','NG','NGA','Nigeria','002','011',0),(570,'Alofi','Niuean','570','New Zealand dollar','NZD','cent','Niue','NU','NIU','Niue','009','061',0),(574,'Kingston','Norfolk Islander','574','Australian dollar','AUD','cent','Territory of Norfolk Island','NF','NFK','Norfolk Island','009','053',0),(578,'Oslo','Norwegian','578','Norwegian krone (pl. kroner)','NOK','øre (inv.)','Kingdom of Norway','NO','NOR','Norway','150','154',1),(580,'Saipan','Northern Mariana Islander','580','US dollar','USD','cent','Commonwealth of the Northern Mariana Islands','MP','MNP','Northern Mariana Islands','009','057',0),(581,'United States Minor Outlying Islands','of United States Minor Outlying Islands','581','US dollar','USD','cent','United States Minor Outlying Islands','UM','UMI','United States Minor Outlying Islands','','',0),(583,'Palikir','Micronesian','583','US dollar','USD','cent','Federated States of Micronesia','FM','FSM','Micronesia, Federated States of','009','057',0),(584,'Majuro','Marshallese','584','US dollar','USD','cent','Republic of the Marshall Islands','MH','MHL','Marshall Islands','009','057',0),(585,'Melekeok','Palauan','585','US dollar','USD','cent','Republic of Palau','PW','PLW','Palau','009','057',0),(586,'Islamabad','Pakistani','586','Pakistani rupee','PKR','paisa','Islamic Republic of Pakistan','PK','PAK','Pakistan','142','034',0),(591,'Panama City','Panamanian','591','balboa','PAB','centésimo','Republic of Panama','PA','PAN','Panama','019','013',0),(598,'Port Moresby','Papua New Guinean','598','kina (inv.)','PGK','toea (inv.)','Independent State of Papua New Guinea','PG','PNG','Papua New Guinea','009','054',0),(600,'Asunción','Paraguayan','600','guaraní','PYG','céntimo','Republic of Paraguay','PY','PRY','Paraguay','019','005',0),(604,'Lima','Peruvian','604','new sol','PEN','céntimo','Republic of Peru','PE','PER','Peru','019','005',0),(608,'Manila','Filipino','608','Philippine peso','PHP','centavo','Republic of the Philippines','PH','PHL','Philippines','142','035',0),(612,'Adamstown','Pitcairner','612','New Zealand dollar','NZD','cent','Pitcairn Islands','PN','PCN','Pitcairn','009','061',0),(616,'Warsaw','Polish','616','zloty','PLN','grosz (pl. groszy)','Republic of Poland','PL','POL','Poland','150','151',1),(620,'Lisbon','Portuguese','620','euro','EUR','cent','Portuguese Republic','PT','PRT','Portugal','150','039',1),(624,'Bissau','Guinea-Bissau national','624','CFA franc (BCEAO)','XOF','centime','Republic of Guinea-Bissau','GW','GNB','Guinea-Bissau','002','011',0),(626,'Dili','East Timorese','626','US dollar','USD','cent','Democratic Republic of East Timor','TL','TLS','Timor-Leste','142','035',0),(630,'San Juan','Puerto Rican','630','US dollar','USD','cent','Commonwealth of Puerto Rico','PR','PRI','Puerto Rico','019','029',0),(634,'Doha','Qatari','634','Qatari riyal','QAR','dirham','State of Qatar','QA','QAT','Qatar','142','145',0),(638,'Saint-Denis','Reunionese','638','euro','EUR','cent','Réunion','RE','REU','Réunion','002','014',0),(642,'Bucharest','Romanian','642','Romanian leu (pl. lei)','RON','ban (pl. bani)','Romania','RO','ROU','Romania','150','151',1),(643,'Moscow','Russian','643','Russian rouble','RUB','kopek','Russian Federation','RU','RUS','Russian Federation','150','151',0),(646,'Kigali','Rwandan; Rwandese','646','Rwandese franc','RWF','centime','Republic of Rwanda','RW','RWA','Rwanda','002','014',0),(652,'Gustavia','of Saint Barthélemy','652','euro','EUR','cent','Collectivity of Saint Barthélemy','BL','BLM','Saint Barthélemy','019','029',0),(654,'Jamestown','Saint Helenian','654','Saint Helena pound','SHP','penny','Saint Helena, Ascension and Tristan da Cunha','SH','SHN','Saint Helena, Ascension and Tristan da Cunha','002','011',0),(659,'Basseterre','Kittsian; Nevisian','659','East Caribbean dollar','XCD','cent','Federation of Saint Kitts and Nevis','KN','KNA','Saint Kitts and Nevis','019','029',0),(660,'The Valley','Anguillan','660','East Caribbean dollar','XCD','cent','Anguilla','AI','AIA','Anguilla','019','029',0),(662,'Castries','Saint Lucian','662','East Caribbean dollar','XCD','cent','Saint Lucia','LC','LCA','Saint Lucia','019','029',0),(663,'Marigot','of Saint Martin','663','euro','EUR','cent','Collectivity of Saint Martin','MF','MAF','Saint Martin (French part)','019','029',0),(666,'Saint-Pierre','St-Pierrais; Miquelonnais','666','euro','EUR','cent','Territorial Collectivity of Saint Pierre and Miquelon','PM','SPM','Saint Pierre and Miquelon','019','021',0),(670,'Kingstown','Vincentian','670','East Caribbean dollar','XCD','cent','Saint Vincent and the Grenadines','VC','VCT','Saint Vincent and the Grenadines','019','029',0),(674,'San Marino','San Marinese','674','euro','EUR ','cent','Republic of San Marino','SM','SMR','San Marino','150','039',0),(678,'São Tomé','São Toméan','678','dobra','STD','centavo','Democratic Republic of São Tomé and Príncipe','ST','STP','Sao Tome and Principe','002','017',0),(682,'Riyadh','Saudi Arabian','682','riyal','SAR','halala','Kingdom of Saudi Arabia','SA','SAU','Saudi Arabia','142','145',0),(686,'Dakar','Senegalese','686','CFA franc (BCEAO)','XOF','centime','Republic of Senegal','SN','SEN','Senegal','002','011',0),(688,'Belgrade','Serb','688','Serbian dinar','RSD','para (inv.)','Republic of Serbia','RS','SRB','Serbia','150','039',0),(690,'Victoria','Seychellois','690','Seychelles rupee','SCR','cent','Republic of Seychelles','SC','SYC','Seychelles','002','014',0),(694,'Freetown','Sierra Leonean','694','leone','SLL','cent','Republic of Sierra Leone','SL','SLE','Sierra Leone','002','011',0),(702,'Singapore','Singaporean','702','Singapore dollar','SGD','cent','Republic of Singapore','SG','SGP','Singapore','142','035',0),(703,'Bratislava','Slovak','703','euro','EUR','cent','Slovak Republic','SK','SVK','Slovakia','150','151',1),(704,'Hanoi','Vietnamese','704','dong','VND','(10 hào','Socialist Republic of Vietnam','VN','VNM','Viet Nam','142','035',0),(705,'Ljubljana','Slovene','705','euro','EUR','cent','Republic of Slovenia','SI','SVN','Slovenia','150','039',1),(706,'Mogadishu','Somali','706','Somali shilling','SOS','cent','Somali Republic','SO','SOM','Somalia','002','014',0),(710,'Pretoria (ZA1)','South African','710','rand','ZAR','cent','Republic of South Africa','ZA','ZAF','South Africa','002','018',0),(716,'Harare','Zimbabwean','716','Zimbabwe dollar (ZW1)','ZWL','cent','Republic of Zimbabwe','ZW','ZWE','Zimbabwe','002','014',0),(724,'Madrid','Spaniard','724','euro','EUR','cent','Kingdom of Spain','ES','ESP','Spain','150','039',1),(728,'Juba','South Sudanese','728','South Sudanese pound','SSP','piaster','Republic of South Sudan','SS','SSD','South Sudan','002','015',0),(729,'Khartoum','Sudanese','729','Sudanese pound','SDG','piastre','Republic of the Sudan','SD','SDN','Sudan','002','015',0),(732,'Al aaiun','Sahrawi','732','Moroccan dirham','MAD','centime','Western Sahara','EH','ESH','Western Sahara','002','015',0),(740,'Paramaribo','Surinamese','740','Surinamese dollar','SRD','cent','Republic of Suriname','SR','SUR','Suriname','019','005',0),(744,'Longyearbyen','of Svalbard','744','Norwegian krone (pl. kroner)','NOK','øre (inv.)','Svalbard and Jan Mayen','SJ','SJM','Svalbard and Jan Mayen','150','154',0),(748,'Mbabane','Swazi','748','lilangeni','SZL','cent','Kingdom of Swaziland','SZ','SWZ','Swaziland','002','018',0),(752,'Stockholm','Swedish','752','krona (pl. kronor)','SEK','öre (inv.)','Kingdom of Sweden','SE','SWE','Sweden','150','154',1),(756,'Berne','Swiss','756','Swiss franc','CHF','centime','Swiss Confederation','CH','CHE','Switzerland','150','155',1),(760,'Damascus','Syrian','760','Syrian pound','SYP','piastre','Syrian Arab Republic','SY','SYR','Syrian Arab Republic','142','145',0),(762,'Dushanbe','Tajik','762','somoni','TJS','diram','Republic of Tajikistan','TJ','TJK','Tajikistan','142','143',0),(764,'Bangkok','Thai','764','baht (inv.)','THB','satang (inv.)','Kingdom of Thailand','TH','THA','Thailand','142','035',0),(768,'Lomé','Togolese','768','CFA franc (BCEAO)','XOF','centime','Togolese Republic','TG','TGO','Togo','002','011',0),(772,'(TK2)','Tokelauan','772','New Zealand dollar','NZD','cent','Tokelau','TK','TKL','Tokelau','009','061',0),(776,'Nuku’alofa','Tongan','776','pa’anga (inv.)','TOP','seniti (inv.)','Kingdom of Tonga','TO','TON','Tonga','009','061',0),(780,'Port of Spain','Trinidadian; Tobagonian','780','Trinidad and Tobago dollar','TTD','cent','Republic of Trinidad and Tobago','TT','TTO','Trinidad and Tobago','019','029',0),(784,'Abu Dhabi','Emirian','784','UAE dirham','AED','fils (inv.)','United Arab Emirates','AE','ARE','United Arab Emirates','142','145',0),(788,'Tunis','Tunisian','788','Tunisian dinar','TND','millime','Republic of Tunisia','TN','TUN','Tunisia','002','015',0),(792,'Ankara','Turk','792','Turkish lira (inv.)','TRY','kurus (inv.)','Republic of Turkey','TR','TUR','Turkey','142','145',0),(795,'Ashgabat','Turkmen','795','Turkmen manat (inv.)','TMT','tenge (inv.)','Turkmenistan','TM','TKM','Turkmenistan','142','143',0),(796,'Cockburn Town','Turks and Caicos Islander','796','US dollar','USD','cent','Turks and Caicos Islands','TC','TCA','Turks and Caicos Islands','019','029',0),(798,'Funafuti','Tuvaluan','798','Australian dollar','AUD','cent','Tuvalu','TV','TUV','Tuvalu','009','061',0),(800,'Kampala','Ugandan','800','Uganda shilling','UGX','cent','Republic of Uganda','UG','UGA','Uganda','002','014',0),(804,'Kiev','Ukrainian','804','hryvnia','UAH','kopiyka','Ukraine','UA','UKR','Ukraine','150','151',0),(807,'Skopje','of the former Yugoslav Republic of Macedonia','807','denar (pl. denars)','MKD','deni (inv.)','the former Yugoslav Republic of Macedonia','MK','MKD','Macedonia, the former Yugoslav Republic of','150','039',0),(818,'Cairo','Egyptian','818','Egyptian pound','EGP','piastre','Arab Republic of Egypt','EG','EGY','Egypt','002','015',0),(826,'London','British','826','pound sterling','GBP','penny (pl. pence)','United Kingdom of Great Britain and Northern Ireland','GB','GBR','United Kingdom','150','154',1),(831,'St Peter Port','of Guernsey','831','Guernsey pound (GG2)','GGP (GG2)','penny (pl. pence)','Bailiwick of Guernsey','GG','GGY','Guernsey','150','154',0),(832,'St Helier','of Jersey','832','Jersey pound (JE2)','JEP (JE2)','penny (pl. pence)','Bailiwick of Jersey','JE','JEY','Jersey','150','154',0),(833,'Douglas','Manxman; Manxwoman','833','Manx pound (IM2)','IMP (IM2)','penny (pl. pence)','Isle of Man','IM','IMN','Isle of Man','150','154',0),(834,'Dodoma (TZ1)','Tanzanian','834','Tanzanian shilling','TZS','cent','United Republic of Tanzania','TZ','TZA','Tanzania, United Republic of','002','014',0),(840,'Washington DC','American','840','US dollar','USD','cent','United States of America','US','USA','United States','019','021',0),(850,'Charlotte Amalie','US Virgin Islander','850','US dollar','USD','cent','United States Virgin Islands','VI','VIR','Virgin Islands, U.S.','019','029',0),(854,'Ouagadougou','Burkinabe','854','CFA franc (BCEAO)','XOF','centime','Burkina Faso','BF','BFA','Burkina Faso','002','011',0),(858,'Montevideo','Uruguayan','858','Uruguayan peso','UYU','centésimo','Eastern Republic of Uruguay','UY','URY','Uruguay','019','005',0),(860,'Tashkent','Uzbek','860','sum (inv.)','UZS','tiyin (inv.)','Republic of Uzbekistan','UZ','UZB','Uzbekistan','142','143',0),(862,'Caracas','Venezuelan','862','bolívar fuerte (pl. bolívares fuertes)','VEF','céntimo','Bolivarian Republic of Venezuela','VE','VEN','Venezuela, Bolivarian Republic of','019','005',0),(876,'Mata-Utu','Wallisian; Futunan; Wallis and Futuna Islander','876','CFP franc','XPF','centime','Wallis and Futuna','WF','WLF','Wallis and Futuna','009','061',0),(882,'Apia','Samoan','882','tala (inv.)','WST','sene (inv.)','Independent State of Samoa','WS','WSM','Samoa','009','061',0),(887,'San’a','Yemenite','887','Yemeni rial','YER','fils (inv.)','Republic of Yemen','YE','YEM','Yemen','142','145',0),(894,'Lusaka','Zambian','894','Zambian kwacha (inv.)','ZMW','ngwee (inv.)','Republic of Zambia','ZM','ZMB','Zambia','002','014',0);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol_left` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol_right` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_place` int NOT NULL,
  `value` double(15,8) NOT NULL,
  `decimal_point` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_point` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'U.S. Dollar','$','','USD',2,1.00000000,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(2,'Euro','€','','EUR',2,0.74970001,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(3,'Pound Sterling','£','','GBP',2,0.62220001,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(4,'Australian Dollar','$','','AUD',2,0.94790000,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(5,'Canadian Dollar','$','','CAD',2,0.98500001,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(6,'Czech Koruna','','Kč ','CZK',2,19.16900063,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(7,'Danish Krone','kr ','','DKK',2,5.59420013,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(8,'Hong Kong Dollar','$','','HKD',2,7.75290012,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(9,'Hungarian Forint','Ft ','','HUF',2,221.27000427,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(10,'Israeli New Sheqel','?','','ILS',2,3.73559999,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(11,'Japanese Yen','¥','','JPY',2,88.76499939,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(12,'Mexican Peso','$','','MXN',2,12.63899994,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(13,'Norwegian Krone','kr ','','NOK',2,5.52229977,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(14,'New Zealand Dollar','$','','NZD',2,1.18970001,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(15,'Philippine Peso','Php ','','PHP',2,40.58000183,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(16,'Polish Zloty','','zł','PLN',2,3.08590007,',','.',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(17,'Singapore Dollar','$','','SGD',2,1.22560000,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(18,'Swedish Krona','kr ','','SEK',2,6.45870018,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(19,'Swiss Franc','CHF ','','CHF',2,0.92259997,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(20,'Taiwan New Dollar','NT$','','TWD',2,28.95199966,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(21,'Thai Baht','฿','','THB',2,30.09499931,'.',',',1,'2013-11-29 19:51:38','2013-11-29 19:51:38'),(22,'Ukrainian hryvnia','₴','','UAH',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(23,'Icelandic króna','kr ','','ISK',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(24,'Croatian kuna','kn ','','HRK',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(25,'Romanian leu','lei ','','RON',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(26,'Bulgarian lev','лв.','','BGN',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(27,'Turkish lira','₺','','TRY',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(28,'Chilean peso','$','','CLP',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(29,'South African rand','R','','ZAR',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(30,'Brazilian real','R$','','BRL',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(31,'Malaysian ringgit','RM ','','MYR',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(32,'Russian ruble','₽','','RUB',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(33,'Indonesian rupiah','Rp ','','IDR',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(34,'Indian rupee','₹','','INR',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(35,'Korean won','₩','','KRW',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30'),(36,'Renminbi','¥','','CNY',2,0.00000000,'.',',',1,'2015-07-22 23:25:30','2015-07-22 23:25:30');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_formats`
--

DROP TABLE IF EXISTS `date_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date_formats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picker_format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_formats`
--

LOCK TABLES `date_formats` WRITE;
/*!40000 ALTER TABLE `date_formats` DISABLE KEYS */;
/*!40000 ALTER TABLE `date_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datetime_formats`
--

DROP TABLE IF EXISTS `datetime_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datetime_formats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picker_format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datetime_formats`
--

LOCK TABLES `datetime_formats` WRITE;
/*!40000 ALTER TABLE `datetime_formats` DISABLE KEYS */;
/*!40000 ALTER TABLE `datetime_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_access_codes`
--

DROP TABLE IF EXISTS `event_access_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_access_codes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `usage_count` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_access_codes_event_id_foreign` (`event_id`),
  CONSTRAINT `event_access_codes_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_access_codes`
--

LOCK TABLES `event_access_codes` WRITE;
/*!40000 ALTER TABLE `event_access_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_access_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_categories`
--

DROP TABLE IF EXISTS `event_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descrption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_categories`
--

LOCK TABLES `event_categories` WRITE;
/*!40000 ALTER TABLE `event_categories` DISABLE KEYS */;
INSERT INTO `event_categories` VALUES (1,'testing','Hello','2022-05-28 12:21:57','2022-05-28 12:21:57'),(2,'testing','Hello','2022-05-28 12:22:07','2022-05-28 12:22:07');
/*!40000 ALTER TABLE `event_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_images`
--

DROP TABLE IF EXISTS `event_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_id` int unsigned NOT NULL,
  `account_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_images_event_id_foreign` (`event_id`),
  KEY `event_images_account_id_foreign` (`account_id`),
  KEY `event_images_user_id_foreign` (`user_id`),
  CONSTRAINT `event_images_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_images_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_images`
--

LOCK TABLES `event_images` WRITE;
/*!40000 ALTER TABLE `event_images` DISABLE KEYS */;
INSERT INTO `event_images` VALUES (1,'user_content/event_images/event_image-72a453412e4c18de6e04c656f19f16e6.jpg','2022-04-21 06:43:21','2022-04-21 06:43:21',1,1,1),(2,'user_content/event_images/event_image-f3122c056baa7bd96b72fb61aaefcbd8.png','2022-05-25 16:06:40','2022-05-25 16:06:40',3,1,1),(3,'user_content/event_images/event_image-253c2d4633a13ad4a8d6a18eb8cc0d1d.png','2022-05-28 14:31:39','2022-05-28 14:31:39',4,1,1);
/*!40000 ALTER TABLE `event_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_question`
--

DROP TABLE IF EXISTS `event_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_question` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int unsigned NOT NULL,
  `question_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_question_event_id_index` (`event_id`),
  KEY `event_question_question_id_index` (`question_id`),
  CONSTRAINT `event_question_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_question_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_question`
--

LOCK TABLES `event_question` WRITE;
/*!40000 ALTER TABLE `event_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_stats`
--

DROP TABLE IF EXISTS `event_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_stats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `unique_views` int NOT NULL DEFAULT '0',
  `tickets_sold` int NOT NULL DEFAULT '0',
  `sales_volume` decimal(13,2) NOT NULL DEFAULT '0.00',
  `organiser_fees_volume` decimal(13,2) NOT NULL DEFAULT '0.00',
  `event_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_stats_id_index` (`id`),
  KEY `event_stats_event_id_index` (`event_id`),
  CONSTRAINT `event_stats_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_stats`
--

LOCK TABLES `event_stats` WRITE;
/*!40000 ALTER TABLE `event_stats` DISABLE KEYS */;
INSERT INTO `event_stats` VALUES (1,'2022-04-23',6,6,4,108.00,0.00,1),(2,'2022-04-23',1,1,0,0.00,0.00,1),(3,'2022-05-01',0,0,5,121.00,0.00,1),(4,'2022-05-02',1,1,7,168.00,0.00,1),(5,'2022-05-03',48,8,5,135.00,0.00,1),(6,'2022-05-05',2,1,13,351.00,0.00,1),(7,'2022-05-09',1,1,2,54.00,0.00,1),(8,'2022-05-10',0,0,6,162.00,0.00,1),(9,'2022-05-21',2,2,0,0.00,0.00,1),(10,'2022-05-24',2,2,0,0.00,0.00,1),(11,'2022-05-25',0,0,2,54.00,0.00,1),(12,'2022-05-28',2,1,0,0.00,0.00,1),(13,'2022-05-28',3,3,10,120.00,0.00,3),(14,'2022-05-29',1,1,0,0.00,0.00,3),(15,'2022-05-29',1,1,0,0.00,0.00,1),(16,'2022-05-29',0,0,2,50.00,0.00,4),(17,'2022-05-30',0,0,2,0.00,0.00,4),(18,'2022-05-30',0,0,1,0.00,0.00,3),(19,'2022-06-01',2,2,0,0.00,0.00,1),(20,'2022-06-28',1,1,0,0.00,0.00,1),(21,'2022-07-10',39,8,0,0.00,0.00,1),(22,'2022-07-12',13,4,0,0.00,0.00,1),(23,'2022-07-13',2,1,0,0.00,0.00,1),(24,'2022-07-14',4,2,0,0.00,0.00,1),(25,'2022-07-17',1,1,0,0.00,0.00,1);
/*!40000 ALTER TABLE `event_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'color',
  `bg_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#B23333',
  `bg_image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `on_sale_date` datetime DEFAULT NULL,
  `account_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `currency_id` int unsigned DEFAULT NULL,
  `organiser_fee_fixed` decimal(13,2) NOT NULL DEFAULT '0.00',
  `organiser_fee_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `organiser_id` int unsigned NOT NULL,
  `venue_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venue_name_full` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_address` varchar(355) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_address_line_1` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_address_line_2` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_state` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_post_code` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_street_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_long` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_google_place_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pre_order_display_message` text COLLATE utf8mb4_unicode_ci,
  `post_order_display_message` text COLLATE utf8mb4_unicode_ci,
  `social_share_text` text COLLATE utf8mb4_unicode_ci,
  `social_show_facebook` tinyint(1) NOT NULL DEFAULT '1',
  `social_show_linkedin` tinyint(1) NOT NULL DEFAULT '1',
  `social_show_twitter` tinyint(1) NOT NULL DEFAULT '1',
  `social_show_email` tinyint(1) NOT NULL DEFAULT '1',
  `location_is_manual` int unsigned NOT NULL DEFAULT '0',
  `is_live` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `barcode_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'QRCODE',
  `event_category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `my_organiser_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `my_organiser_about` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_border_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#000000',
  `ticket_bg_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `ticket_text_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#000000',
  `ticket_sub_text_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#999999',
  `google_tag_manager_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_show_whatsapp` tinyint(1) NOT NULL DEFAULT '1',
  `questions_collection_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'buyer',
  `checkout_timeout_after` int NOT NULL DEFAULT '8',
  `is_1d_barcode_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `enable_offline_payments` tinyint(1) NOT NULL DEFAULT '0',
  `offline_payment_instructions` text COLLATE utf8mb4_unicode_ci,
  `event_image_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_user_id_foreign` (`user_id`),
  KEY `events_currency_id_foreign` (`currency_id`),
  KEY `events_organiser_id_foreign` (`organiser_id`),
  KEY `events_account_id_index` (`account_id`),
  CONSTRAINT `events_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `events_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `events_organiser_id_foreign` FOREIGN KEY (`organiser_id`) REFERENCES `organisers` (`id`),
  CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Drive Bid',NULL,'image','#B23333','assets/images/public/EventPage/backgrounds/5.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum','2022-07-01 12:10:00','2022-08-05 12:11:00',NULL,1,1,34,0.00,0.00,1,'Delhi','','','Delhi','dfasdf','','','Dehra','122001','','','','',NULL,NULL,NULL,1,1,1,1,1,1,'2022-04-21 06:41:55','2022-07-10 05:42:02',NULL,'QRCODE',NULL,NULL,NULL,NULL,'#000000','#FFFFFF','#000000','#999999',NULL,1,'buyer',8,0,0,NULL,NULL,'1,2'),(2,'test',NULL,'image','#B23333','assets/images/public/EventPage/backgrounds/5.jpg','test','2022-05-04 14:06:00','2022-05-09 14:06:00',NULL,1,1,2,0.00,0.00,1,'testv',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,'2022-05-03 08:36:32','2022-05-03 08:36:32',NULL,'QRCODE',NULL,NULL,NULL,NULL,'#000000','#FFFFFF','#000000','#999999',NULL,1,'buyer',8,0,0,NULL,NULL,NULL),(3,'Yoga',NULL,'image','#B23333','assets/images/public/EventPage/backgrounds/5.jpg','yoga testing','2022-05-28 21:37:00','2022-05-29 11:37:00',NULL,1,1,2,0.00,0.00,1,'Vaishali Sector 9',NULL,NULL,'Ghaziabad',NULL,NULL,NULL,'Ghaziabadf','248001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,'2022-05-25 16:06:40','2022-05-25 16:20:39',NULL,'QRCODE',NULL,NULL,NULL,NULL,'#000000','#FFFFFF','#000000','#999999',NULL,1,'buyer',8,0,0,NULL,NULL,NULL),(4,'dream',NULL,'image','#B23333','assets/images/public/EventPage/backgrounds/5.jpg','testing','2022-05-29 20:00:00','2022-05-31 20:00:00',NULL,1,1,2,0.00,0.00,1,'Vaishali Sector 9','','','Ghaziabad',NULL,'','','Ghaziabad','248001','','','','',NULL,NULL,NULL,1,1,1,1,1,0,'2022-05-28 14:31:38','2022-05-29 11:56:00',NULL,'QRCODE','1,2','9 to 12','Testing','dfasdf','#000000','#FFFFFF','#000000','#999999',NULL,1,'buyer',8,0,0,NULL,NULL,'1,2');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipients` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `event_id` int unsigned NOT NULL,
  `is_sent` int unsigned NOT NULL DEFAULT '0',
  `sent_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_event_id_foreign` (`event_id`),
  KEY `messages_user_id_foreign` (`user_id`),
  KEY `messages_account_id_index` (`account_id`),
  CONSTRAINT `messages_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'dfasdfasdf','test','5',1,1,4,1,'2022-05-29 19:02:46','2022-05-29 19:02:41','2022-05-29 19:02:46'),(2,'dfadsfad','test','5',1,1,4,1,'2022-05-29 19:03:12','2022-05-29 19:03:07','2022-05-29 19:03:12');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_03_26_180116_create_users_table',1),(2,'2014_04_08_232044_setup_countries_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2014_11_07_132018_add_affiliates_table',1),(5,'2014_11_17_011806_create_failed_jobs_table',1),(6,'2016_03_09_221103_add_ticket_design_options',1),(7,'2016_03_16_193757_create_gateways_table',1),(8,'2016_03_16_213041_add_account_payment_id',1),(9,'2016_03_16_215709_add_gateway_id_accounts_table',1),(10,'2016_03_22_021114_add_whatsapp_share_option_events',1),(11,'2016_03_25_114646_organiser_page_design_update',1),(12,'2016_03_26_103318_create_attendees_questions',1),(13,'2016_03_27_223733_add_organiser_page_toggle',1),(14,'2016_04_03_172528_order_page_update',1),(15,'2016_04_03_221050_add_question_answers_table',1),(16,'2016_04_13_151256_add_api_key_users_table',1),(17,'2016_05_05_201200_remove_instructions_field_questions_table',1),(18,'2016_05_12_143324_fix_messages_table',1),(19,'2016_05_16_142730_update_questions_table',1),(20,'2016_05_22_041458_remove_ask_for_in_events',1),(21,'2016_05_25_145857_attendee_ref_fix',1),(22,'2016_05_28_084338_add_sort_order_tickets_table',1),(23,'2016_06_14_115337_add_is_refunded_column_to_attendees',1),(24,'2016_07_07_143106_add_1d_barcode_option_to_events_table',1),(25,'2016_07_08_133056_add_support_for_offline_payments',1),(26,'2016_09_16_221455_add_google_analytics_code_to_organiser',1),(27,'2016_10_22_150532_add_is_hidden_tickets_table',1),(28,'2018_02_26_172146_add_tax_to_organizers',1),(29,'2018_02_27_175149_add_taxamt_to_orders_table',1),(30,'2018_03_01_150711_add_taxid_to_organisers',1),(31,'2018_07_09_133243_additional_tax_field_rename_current_tax_fields',1),(32,'2018_08_16_131955_drop_coinbase_and_migs_as_defaults',1),(33,'2018_12_04_034523_add_event_image_position_to_events',1),(34,'2019_01_14_124052_create_event_access_codes_table',1),(35,'2019_01_14_185419_create_ticket_event_access_code_table',1),(36,'2019_02_13_130258_add_amounts_field_to_event_access_codes',1),(37,'2019_04_05_180853_change_private_reference_number_column_type',1),(38,'2019_04_17_171440_add_business_fields_to_order',1),(39,'2019_05_14_122245_add_gtm_field_to_organiser',1),(40,'2019_05_14_122256_add_gtm_field_to_event',1),(41,'2019_05_26_181318_fix_ticket_order_table_foreign_key_constraints',1),(42,'2019_05_27_134053_remove_event_revenue_volumes',1),(43,'2019_07_09_073928_retrofit_fix_script_for_stats',1),(44,'2019_08_19_000000_upgrade_failed_jobs_table',1),(45,'2019_09_04_075835_add_default_gateways',1),(46,'2019_09_18_082447_disable_refunds_on_stripe_sca',1),(47,'2019_09_18_175630_update_organisers_table_set_fields_nullable',1),(48,'2019_09_18_215710_update_events_table_set_nullable_fields',1),(49,'2019_11_07_085418_update_test_payment_gateway_refund',1),(50,'2019_11_12_060447_update_event_organiser_percentage_fees_allowable_length',1),(51,'2019_11_22_025242_update_tickets_table_set_default_value',1),(52,'2021_08_27_080923_remove_events_googleplus',1),(53,'2022_04_19_184937_create_subscriptions_table',2),(55,'2022_04_19_185025_create_event_categories_table',2),(56,'2022_04_19_185950_add_category_to_event_table',2),(57,'2022_05_05_091218_create_jobs_table',3),(58,'2022_05_10_121710_create_order_owners_table',4),(59,'2022_05_10_121920_create_order_owner_orders_table',5),(60,'2022_05_28_131039_modify_event_table',6),(61,'2022_05_28_145110_modify_ticket_table',7),(62,'2022_04_19_185001_create_news_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci,
  `descrption` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Stakeholders want yoga university for Mysuru','MYSURU: Keeping in mind the participation of Prime Minister Narendra Modi at the International Day of Yoga (IDY) celebrations in the city on June 21, the stakeholders have decided to seek a university exclusively to study yoga and its allied branches in the city.','https://timesofindia.indiatimes.com/','2022-05-30 11:50:36','2022-05-30 11:50:36'),(2,'Stakeholders want yoga university for Mysuru 2','MYSURU: Keeping in mind the participation of Prime Minister Narendra Modi at the International Day of Yoga (IDY) celebrations in the city on June 21, the stakeholders have decided to seek a university exclusively to study yoga and its allied branches in the city.','https://timesofindia.indiatimes.com/city/mysuru/stakeholders-want-yoga-university-for-mysuru/articleshow/91801562.cms','2022-05-30 11:50:52','2022-05-30 11:50:52'),(3,'Stakeholders want yoga university for Mysuru 3','MYSURU: Keeping in mind the participation of Prime Minister Narendra Modi at the International Day of Yoga (IDY) celebrations in the city on June 21, the stakeholders have decided to seek a university exclusively to study yoga and its allied branches in the city.','https://timesofindia.indiatimes.com/city/mysuru/stakeholders-want-yoga-university-for-mysuru/articleshow/91801562.cms','2022-05-30 11:50:59','2022-05-30 11:50:59');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(13,2) NOT NULL,
  `unit_booking_fee` decimal(13,2) DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,'Diamond',4,27.00,0.00,1,NULL),(2,'Diamond',3,27.00,0.00,2,NULL),(3,'Gold',2,20.00,0.00,2,NULL),(4,'Diamond',4,27.00,0.00,3,NULL),(5,'Gold',3,20.00,0.00,3,NULL),(6,'Diamond',1,27.00,0.00,4,NULL),(7,'Diamond',2,27.00,0.00,5,NULL),(8,'Diamond',1,27.00,0.00,6,NULL),(9,'Diamond',1,27.00,0.00,7,NULL),(10,'Diamond',1,27.00,0.00,8,NULL),(11,'Diamond',1,27.00,0.00,9,NULL),(12,'Diamond',1,27.00,0.00,10,NULL),(13,'Diamond',2,27.00,0.00,11,NULL),(14,'Diamond',1,27.00,0.00,12,NULL),(15,'Diamond',2,27.00,0.00,13,NULL),(16,'Diamond',1,27.00,0.00,14,NULL),(17,'Diamond',4,27.00,0.00,15,NULL),(18,'Diamond',2,27.00,0.00,16,NULL),(19,'Diamond',1,27.00,0.00,17,NULL),(20,'Diamond',1,27.00,0.00,18,NULL),(21,'Diamond',1,27.00,0.00,19,NULL),(22,'Diamond',1,27.00,0.00,20,NULL),(23,'Diamond',1,27.00,0.00,21,NULL),(24,'Diamond',1,27.00,0.00,22,NULL),(25,'Diamond',2,27.00,0.00,23,NULL),(26,'1 session',10,12.00,0.00,24,NULL),(27,'testing',2,25.00,0.00,25,NULL),(28,'testing',1,0.00,NULL,26,NULL),(29,'testing',1,0.00,NULL,27,NULL),(30,'1 session',1,0.00,NULL,28,NULL);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_owner_orders`
--

DROP TABLE IF EXISTS `order_owner_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_owner_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_owner_id` bigint unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_owner_orders_order_owner_id_foreign` (`order_owner_id`),
  KEY `order_owner_orders_order_id_foreign` (`order_id`),
  CONSTRAINT `order_owner_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_owner_orders_order_owner_id_foreign` FOREIGN KEY (`order_owner_id`) REFERENCES `order_owners` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_owner_orders`
--

LOCK TABLES `order_owner_orders` WRITE;
/*!40000 ALTER TABLE `order_owner_orders` DISABLE KEYS */;
INSERT INTO `order_owner_orders` VALUES (1,1,17,'2022-05-10 12:45:47','2022-05-10 12:45:47'),(2,1,18,'2022-05-10 12:48:04','2022-05-10 12:48:04'),(3,1,19,'2022-05-10 12:49:19','2022-05-10 12:49:19'),(4,1,20,'2022-05-10 12:49:21','2022-05-10 12:49:21'),(5,1,21,'2022-05-10 12:50:00','2022-05-10 12:50:00'),(6,1,22,'2022-05-10 12:50:31','2022-05-10 12:50:31'),(7,2,23,'2022-05-25 16:30:16','2022-05-25 16:30:16'),(8,5,24,'2022-05-28 19:21:03','2022-05-28 19:21:03'),(9,6,25,'2022-05-29 18:44:06','2022-05-29 18:44:06');
/*!40000 ALTER TABLE `order_owner_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_owners`
--

DROP TABLE IF EXISTS `order_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_owners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_owners`
--

LOCK TABLES `order_owners` WRITE;
/*!40000 ALTER TABLE `order_owners` DISABLE KEYS */;
INSERT INTO `order_owners` VALUES (1,'Amandeep','Singh','er.amandeep04@gmail.com','$2y$10$F6g9zIIVsCqrGNVPHqZ0Q.9oq4AYC8Bt7yJtSDT4xLGywdf8A289q','2022-05-10 12:45:47','2022-05-27 13:56:59'),(2,'test','kathait','ravikathait04@gmail.com','$2y$10$9BuYxqMgu1IfuUCLjU1il./t.QlfvvxZtk75L3Kxr5dMRyWL3/AYi','2022-05-25 16:30:16','2022-05-25 16:30:16'),(3,'Aman',NULL,'er.amandeep04@gmail.com','$2y$10$F6g9zIIVsCqrGNVPHqZ0Q.9oq4AYC8Bt7yJtSDT4xLGywdf8A289q','2022-05-27 12:17:00','2022-05-27 13:56:59'),(4,'Aman',NULL,'er.amandeep05@gmail.com','$2y$10$J51rNbWsOofnQkieULeBa.81lclX2hjK5/taeInNl0wC3eeoyfvFG','2022-05-27 12:33:39','2022-05-27 12:33:39'),(5,'sam','kim','samreshitanexpert@gmail.com','$2y$10$kGODUVLR2Ig61vLx.qCKA.rmDccmK5N3ll3yAhpXy/FR1474a1LGC','2022-05-28 19:21:03','2022-05-28 19:21:03'),(6,'ravi','kathait','ravikathait04@yopmail.com','$2y$10$UXLqkqLDA2d/voc/o9KaJOun/3wa6A2rsaTmZIv0OQQ1YZqRdLpPW','2022-05-29 18:44:06','2022-05-29 18:44:06');
/*!40000 ALTER TABLE `order_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` VALUES (1,'Completed'),(2,'Refunded'),(3,'Partially Refunded'),(4,'Cancelled'),(5,'Awaiting Payment');
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL,
  `order_status_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_address_line_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_address_line_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_address_state_province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_address_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_address_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_pdf_path` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_reference` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `booking_fee` decimal(8,2) DEFAULT NULL,
  `organiser_booking_fee` decimal(8,2) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `is_partially_refunded` tinyint(1) NOT NULL DEFAULT '0',
  `is_refunded` tinyint(1) NOT NULL DEFAULT '0',
  `amount` decimal(13,2) NOT NULL,
  `amount_refunded` decimal(13,2) DEFAULT NULL,
  `event_id` int unsigned NOT NULL,
  `payment_gateway_id` int unsigned DEFAULT NULL,
  `is_payment_received` tinyint(1) NOT NULL DEFAULT '0',
  `is_business` tinyint(1) NOT NULL DEFAULT '0',
  `taxamt` double(8,2) NOT NULL DEFAULT '0.00',
  `payment_intent` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `orders_order_status_id_foreign` (`order_status_id`),
  KEY `orders_account_id_index` (`account_id`),
  KEY `orders_event_id_index` (`event_id`),
  KEY `orders_payment_gateway_id_foreign` (`payment_gateway_id`),
  CONSTRAINT `orders_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`),
  CONSTRAINT `orders_payment_gateway_id_foreign` FOREIGN KEY (`payment_gateway_id`) REFERENCES `payment_gateways` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'2022-04-23 05:52:44','2022-04-23 05:52:44',NULL,'sa','sa','samreshitanexpert@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IaNPJ234','6263942c987cf',0.00,0.00,0.00,NULL,NULL,0,0,0,0,108.00,NULL,1,2,1,0,0.00,''),(2,1,1,'2022-05-01 13:05:06','2022-05-01 13:05:06',NULL,'test','kathait','ravikathait04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'l0d2Z15','626e858206df5',0.00,0.00,0.00,NULL,NULL,0,0,0,0,121.00,NULL,1,2,1,0,0.00,''),(3,1,1,'2022-05-02 15:42:42','2022-05-02 15:42:42',NULL,'test','kathait','ravikathait04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cO59J25','626ffbf22f162',0.00,0.00,0.00,NULL,NULL,0,0,0,0,168.00,NULL,1,2,1,0,0.00,''),(4,1,1,'2022-05-03 10:42:37','2022-05-03 10:42:37',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'z94sj35','pay_JQiCnF3n24PGil',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(5,1,1,'2022-05-03 10:48:02','2022-05-03 10:48:02',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cpfyl35','pay_JQj971ObIQIYkH',0.00,0.00,0.00,NULL,NULL,0,0,0,0,54.00,NULL,1,4,1,0,0.00,''),(6,1,1,'2022-05-03 10:55:06','2022-05-03 10:55:06',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'uFqI935','pay_JQjGZI8gAQdq4v',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(7,1,1,'2022-05-03 11:14:01','2022-05-03 11:14:01',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NelGJ35','pay_JQjaYHWQHJi28y',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(8,1,1,'2022-05-05 08:21:44','2022-05-05 08:21:44',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'qU0mE55','pay_JRTioAa3QeVS8N',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(9,1,1,'2022-05-05 09:00:56','2022-05-05 09:00:56',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'YT00N55','pay_JRUOC1q7cHjbyR',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(10,1,1,'2022-05-05 09:37:46','2022-05-05 09:37:46',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'yHjKh55','pay_JRV17LMA7cxadG',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(11,1,1,'2022-05-05 11:26:41','2022-05-05 11:26:41',NULL,'test','kathait','ravikathait04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'84Wiz55','pay_JRWsAXUgMFEUJQ',0.00,0.00,0.00,NULL,NULL,0,0,0,0,54.00,NULL,1,4,1,0,0.00,''),(12,1,1,'2022-05-05 12:56:13','2022-05-05 12:56:13',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XYZjj55','pay_JRYOjmLeyOX9YA',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(13,1,1,'2022-05-05 13:47:20','2022-05-05 13:47:20',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3pVz755','pay_JRZGkOMFCLSkN7',0.00,0.00,0.00,NULL,NULL,0,0,0,0,54.00,NULL,1,4,1,0,0.00,''),(14,1,1,'2022-05-05 13:53:53','2022-05-05 13:53:53',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hi3uJ55','pay_JRZNe1N4ajdbUr',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(15,1,1,'2022-05-05 13:54:29','2022-05-05 13:54:29',NULL,'test','kathait','ravikathait04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MiwW755','pay_JRZO9yrtPc5bL7',0.00,0.00,0.00,NULL,NULL,0,0,0,0,108.00,NULL,1,4,1,0,0.00,''),(16,1,1,'2022-05-09 16:06:25','2022-05-09 16:06:25',NULL,'Ravi','kathait','ravikathait04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A9kUl95','pay_JTBm8LSk7qbuOB',0.00,0.00,0.00,NULL,NULL,0,0,0,0,54.00,NULL,1,4,1,0,0.00,''),(17,1,1,'2022-05-10 12:45:47','2022-05-10 12:45:47',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2O8D3105','pay_JTWtKCRKH5IaAD',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(18,1,1,'2022-05-10 12:48:04','2022-05-10 12:48:04',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'683JY105','pay_JTWvjx2kYC0EOY',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(19,1,1,'2022-05-10 12:49:19','2022-05-10 12:49:19',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'wToPQ105','pay_JTWvjx2kYC0EOY',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(20,1,1,'2022-05-10 12:49:20','2022-05-10 12:49:20',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4IFyn105','pay_JTWvjx2kYC0EOY',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(21,1,1,'2022-05-10 12:50:00','2022-05-10 12:50:00',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pmL7b105','pay_JTWvjx2kYC0EOY',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(22,1,1,'2022-05-10 12:50:31','2022-05-10 12:50:31',NULL,'Amandeep','Singh','er.amandeep04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CxVhJ105','pay_JTWvjx2kYC0EOY',0.00,0.00,0.00,NULL,NULL,0,0,0,0,27.00,NULL,1,4,1,0,0.00,''),(23,1,1,'2022-05-25 16:30:16','2022-05-25 16:30:16',NULL,'test','kathait','ravikathait04@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'QRna3255','pay_JZWjGJoQAILIJU',0.00,0.00,0.00,NULL,NULL,0,0,0,0,54.00,NULL,1,4,1,0,0.00,''),(24,1,1,'2022-05-28 19:21:03','2022-05-28 19:21:03',NULL,'sam','kim','samreshitanexpert@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cpp1d285','pay_JalF0zYTWA8KKF',0.00,0.00,0.00,NULL,NULL,0,0,0,0,120.00,NULL,3,4,1,0,0.00,''),(25,1,1,'2022-05-29 18:44:06','2022-05-29 18:44:06',NULL,'ravi','kathait','ravikathait04@yopmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'D17iu295','pay_Jb98xqtBmS955o',0.00,0.00,0.00,NULL,NULL,0,0,0,0,50.00,NULL,4,4,1,0,0.00,''),(26,1,1,'2022-05-30 13:00:51','2022-05-30 13:00:51',NULL,'Ravi','kathait','ravikathait01@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'X3BwA305',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,4,NULL,1,0,0.00,''),(27,1,1,'2022-05-30 13:01:20','2022-05-30 13:01:20',NULL,'local','team','ravikathait01@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'54Flo305',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,4,NULL,1,0,0.00,''),(28,1,1,'2022-05-30 13:17:00','2022-05-30 13:17:00',NULL,'Ravi','kathait','ravikathait01@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Wer4Z305',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0.00,NULL,3,NULL,1,0,0.00,'');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisers`
--

DROP TABLE IF EXISTS `organisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organisers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `account_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmation_key` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `show_twitter_widget` tinyint(1) NOT NULL DEFAULT '0',
  `show_facebook_widget` tinyint(1) NOT NULL DEFAULT '0',
  `page_header_bg_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#76a867',
  `page_bg_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#EEEEEE',
  `page_text_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `enable_organiser_page` tinyint(1) NOT NULL DEFAULT '1',
  `google_analytics_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_tag_manager_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tax_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `tax_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `charge_tax` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `organisers_id_index` (`id`),
  KEY `organisers_account_id_index` (`account_id`),
  CONSTRAINT `organisers_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisers`
--

LOCK TABLES `organisers` WRITE;
/*!40000 ALTER TABLE `organisers` DISABLE KEYS */;
INSERT INTO `organisers` VALUES (1,'2022-04-20 23:15:17','2022-04-20 23:15:17',NULL,1,'Ekkon','test','Ekkon@gmail.com',NULL,'sdFy41kU0TiKcaB',NULL,NULL,NULL,0,0,0,'#76a867','#EEEEEE','#FFFFFF',1,NULL,NULL,NULL,'0',NULL,0),(2,'2022-05-28 12:54:41','2022-05-28 12:54:41',NULL,1,'Dream Wrok','dfdsafdasf','dream@work.com',NULL,'yt9DTxlNmKSjj6T',NULL,NULL,NULL,0,0,0,'#76a867','#EEEEEE','#FFFFFF',1,NULL,NULL,NULL,'0',NULL,0);
/*!40000 ALTER TABLE `organisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_gateways`
--

DROP TABLE IF EXISTS `payment_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_gateways` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_on_site` tinyint(1) NOT NULL,
  `can_refund` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `admin_blade_template` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checkout_blade_template` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_gateways`
--

LOCK TABLES `payment_gateways` WRITE;
/*!40000 ALTER TABLE `payment_gateways` DISABLE KEYS */;
INSERT INTO `payment_gateways` VALUES (1,'Stripe','https://www.stripe.com',1,1,'Stripe',0,'ManageAccount.Partials.Stripe','Public.ViewEvent.Partials.PaymentStripe'),(2,'Dummy/Test Gateway','none',1,1,'Dummy',0,'','Public.ViewEvent.Partials.Dummy'),(3,'Stripe SCA','https://www.stripe.com',0,1,'Stripe\\PaymentIntents',0,'ManageAccount.Partials.StripeSCA','Public.ViewEvent.Partials.PaymentStripeSCA'),(4,'Razzorpay','https://razorpay.com/',0,1,'Razzorpay',1,'','');
/*!40000 ALTER TABLE `payment_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_answers`
--

DROP TABLE IF EXISTS `question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_answers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attendee_id` int unsigned NOT NULL,
  `event_id` int unsigned NOT NULL,
  `question_id` int unsigned NOT NULL,
  `account_id` int unsigned NOT NULL,
  `answer_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_answers_attendee_id_index` (`attendee_id`),
  KEY `question_answers_event_id_index` (`event_id`),
  KEY `question_answers_question_id_index` (`question_id`),
  KEY `question_answers_account_id_index` (`account_id`),
  CONSTRAINT `question_answers_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `question_answers_attendee_id_foreign` FOREIGN KEY (`attendee_id`) REFERENCES `attendees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `question_answers_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `question_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_answers`
--

LOCK TABLES `question_answers` WRITE;
/*!40000 ALTER TABLE `question_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_options`
--

DROP TABLE IF EXISTS `question_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_options_question_id_index` (`question_id`),
  CONSTRAINT `question_options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_options`
--

LOCK TABLES `question_options` WRITE;
/*!40000 ALTER TABLE `question_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_ticket`
--

DROP TABLE IF EXISTS `question_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_ticket` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int unsigned NOT NULL,
  `ticket_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_ticket_question_id_index` (`question_id`),
  KEY `question_ticket_ticket_id_index` (`ticket_id`),
  CONSTRAINT `question_ticket_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `question_ticket_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_ticket`
--

LOCK TABLES `question_ticket` WRITE;
/*!40000 ALTER TABLE `question_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_types`
--

DROP TABLE IF EXISTS `question_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_options` tinyint(1) NOT NULL DEFAULT '0',
  `allow_multiple` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_types`
--

LOCK TABLES `question_types` WRITE;
/*!40000 ALTER TABLE `question_types` DISABLE KEYS */;
INSERT INTO `question_types` VALUES (1,'text','Single-line text box',0,0),(2,'textarea','Multi-line text box',0,0),(3,'dropdown','Dropdown (single selection)',1,0),(4,'dropdown_multiple','Dropdown (multiple selection)',1,1),(5,'checkbox','Checkbox',1,1),(6,'radio','Radio input',1,0);
/*!40000 ALTER TABLE `question_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_type_id` int unsigned NOT NULL,
  `account_id` int unsigned NOT NULL,
  `is_required` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  `is_enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `questions_question_type_id_foreign` (`question_type_id`),
  KEY `questions_account_id_index` (`account_id`),
  CONSTRAINT `questions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `questions_question_type_id_foreign` FOREIGN KEY (`question_type_id`) REFERENCES `question_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserved_tickets`
--

DROP TABLE IF EXISTS `reserved_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserved_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `event_id` int NOT NULL,
  `quantity_reserved` int NOT NULL,
  `expires` datetime NOT NULL,
  `session_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserved_tickets`
--

LOCK TABLES `reserved_tickets` WRITE;
/*!40000 ALTER TABLE `reserved_tickets` DISABLE KEYS */;
INSERT INTO `reserved_tickets` VALUES (21,1,1,2,'2022-04-22 18:56:25','HvNyeMjlYVktNP2rOoXWHVghvtgo8YeYsNQwMfhf','2022-04-22 18:26:25','2022-04-22 18:26:25'),(23,2,1,2,'2022-04-22 18:59:16','PxNxDiYcy61U5KRIvxqRJh9KmGFT9mEF3paYwQ1V','2022-04-22 18:29:16','2022-04-22 18:29:16'),(27,1,1,3,'2022-05-01 13:38:04','7pwUDWs64g38zCilgRV5LQt4M8oyfwtpabChqyXt','2022-05-01 13:08:04','2022-05-01 13:08:04'),(28,1,1,4,'2022-05-02 15:45:16','w6YWDvKpuPNvUFBZCAbqWRR2ZLBfVzsNVxX8avqm','2022-05-02 15:15:16','2022-05-02 15:15:16'),(29,2,1,4,'2022-05-02 15:45:16','w6YWDvKpuPNvUFBZCAbqWRR2ZLBfVzsNVxX8avqm','2022-05-02 15:15:16','2022-05-02 15:15:16'),(36,1,1,1,'2022-05-03 08:38:03','dMM2snj1OyOxobNrjPAe0SaSikNhXrroSqH055EV','2022-05-03 08:08:03','2022-05-03 08:08:03'),(37,1,1,1,'2022-05-03 08:48:36','JNMpxzG3eJeDqh5LpSIsmTOJjaKDhaDXvk91NA4l','2022-05-03 08:18:36','2022-05-03 08:18:36'),(38,1,1,1,'2022-05-03 08:54:21','J2VM4Y4FEHwiWkhErktMvLaKFNpm48TIpVmjCIWC','2022-05-03 08:24:21','2022-05-03 08:24:21'),(59,1,1,5,'2022-05-03 10:13:08','Ib335ZUGj0G8Q1okw0kiDefIjTu0b3kFpfs9uea1','2022-05-03 09:43:08','2022-05-03 09:43:08'),(60,1,1,7,'2022-05-03 10:27:39','dXqSUcsse3xaG52R9GIZ4cVpCepkeS31zFNl8oHC','2022-05-03 09:57:39','2022-05-03 09:57:39'),(61,2,1,3,'2022-05-03 10:27:39','dXqSUcsse3xaG52R9GIZ4cVpCepkeS31zFNl8oHC','2022-05-03 09:57:39','2022-05-03 09:57:39'),(66,1,1,2,'2022-05-03 12:17:50','HXJsn9E4ievf0MiNlB5OCAOY1y1n6qOk5x6VyeZt','2022-05-03 11:47:50','2022-05-03 11:47:50'),(67,1,1,6,'2022-05-03 18:42:47','BhrDpGoIgI5osRnPXyb7uv74zgRb3FCXrjYrTEau','2022-05-03 18:12:47','2022-05-03 18:12:47'),(79,1,1,1,'2022-05-05 18:20:50','DnHmv6nCnx40vsjNuEbpSmRgSjtEFh84jsEWYjDJ','2022-05-05 17:50:50','2022-05-05 17:50:50'),(81,1,1,10,'2022-05-07 22:48:16','G561qdZx8Mtue5HxQ7uS6JLagXNCiTTnBtcRL2vW','2022-05-07 22:18:16','2022-05-07 22:18:16'),(82,1,1,15,'2022-05-07 22:56:29','kTvpo1zVE9z9ErqGnW1woEgpzcRNNxOjSnbjonLl','2022-05-07 22:26:29','2022-05-07 22:26:29'),(85,1,1,5,'2022-05-09 17:18:05','BxRk5gaDor9nP0KHTO4bBp4mFsE2R40DlscfAK1P','2022-05-09 16:48:05','2022-05-09 16:48:05'),(86,1,1,3,'2022-05-09 18:19:19','K0A5C6o3N6DQFVMJta3eip23xzIhyKPJAJz4mnkQ','2022-05-09 17:49:19','2022-05-09 17:49:19'),(92,1,1,3,'2022-05-11 18:56:10','LHnoF6aOpwGBd60WIy0ByYnCM412lp1byZgETUsB','2022-05-11 18:26:10','2022-05-11 18:26:10'),(97,1,1,10,'2022-05-21 19:33:43','LD1yACPML10WwfyplptU0k99rCIUziKFYI0Lmtg5','2022-05-21 19:03:43','2022-05-21 19:03:43'),(98,1,1,3,'2022-05-22 09:17:17','EjTYejpSJT0dWxro5C4ypiGk0wDgoyR1PCa4W9hA','2022-05-22 08:47:17','2022-05-22 08:47:17'),(108,5,4,4,'2022-05-29 12:57:56','3EsK0AyUSJ8qbBv1n8ZDS1Mhixbis4ObNOT7SKj3','2022-05-29 12:27:56','2022-05-29 12:27:56'),(111,8,4,2,'2022-05-30 17:04:08','BGjjvBHlsQqxPinDVOSzjbOyVs8KC5RcHhNrzPTn','2022-05-30 16:34:08','2022-05-30 16:34:08'),(120,1,1,2,'2022-07-10 08:33:07','EbAkV4vb0jhp3UWMfu9OcnSlphzs1crHaEIC6Icx','2022-07-10 08:03:07','2022-07-10 08:03:07'),(121,2,1,3,'2022-07-10 08:33:07','EbAkV4vb0jhp3UWMfu9OcnSlphzs1crHaEIC6Icx','2022-07-10 08:03:07','2022-07-10 08:03:07'),(126,1,1,1,'2022-07-12 15:28:46','RmRVQbQSdb2dgmNWPxZKdJseLHT3IqXm8fApTsSW','2022-07-12 14:58:46','2022-07-12 14:58:46'),(128,1,1,1,'2022-07-12 15:35:10','yi9o2gucg1UL3VPoB1mlYfBEGAcUDzuvDouHqZ3r','2022-07-12 15:05:10','2022-07-12 15:05:10'),(129,1,1,3,'2022-07-12 15:54:02','FLyxVVpYLonDtFV84kj9mQN24OALxcJA5HMnyhZG','2022-07-12 15:24:02','2022-07-12 15:24:02'),(130,1,1,1,'2022-07-12 18:28:51','2ziIaSMWU1jY1p795jvusHZDjC6Puw2srV55uRSC','2022-07-12 17:58:51','2022-07-12 17:58:51'),(136,1,1,1,'2022-07-14 02:44:00','C6cTsVP85F4RfY5vE36vTw7mj9mXaggIfVcsFxWS','2022-07-14 02:14:00','2022-07-14 02:14:00');
/*!40000 ALTER TABLE `reserved_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,'hello@yahoo.com','2022-06-07 18:14:55','2022-06-07 18:14:55');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_event_access_code`
--

DROP TABLE IF EXISTS `ticket_event_access_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_event_access_code` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int unsigned NOT NULL,
  `event_access_code_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_event_access_code_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_event_access_code_event_access_code_id_foreign` (`event_access_code_id`),
  CONSTRAINT `ticket_event_access_code_event_access_code_id_foreign` FOREIGN KEY (`event_access_code_id`) REFERENCES `event_access_codes` (`id`),
  CONSTRAINT `ticket_event_access_code_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_event_access_code`
--

LOCK TABLES `ticket_event_access_code` WRITE;
/*!40000 ALTER TABLE `ticket_event_access_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_event_access_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_order`
--

DROP TABLE IF EXISTS `ticket_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `ticket_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_order_order_id_index` (`order_id`),
  KEY `ticket_order_ticket_id_index` (`ticket_id`),
  CONSTRAINT `ticket_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_order_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_order`
--

LOCK TABLES `ticket_order` WRITE;
/*!40000 ALTER TABLE `ticket_order` DISABLE KEYS */;
INSERT INTO `ticket_order` VALUES (1,1,1),(2,2,1),(3,2,2),(4,3,1),(5,3,2),(6,4,1),(7,5,1),(8,6,1),(9,7,1),(10,8,1),(11,9,1),(12,10,1),(13,11,1),(14,12,1),(15,13,1),(16,14,1),(17,15,1),(18,16,1),(19,17,1),(20,18,1),(21,19,1),(22,20,1),(23,21,1),(24,22,1),(25,23,1),(26,24,3),(27,25,5);
/*!40000 ALTER TABLE `ticket_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_statuses`
--

DROP TABLE IF EXISTS `ticket_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_statuses`
--

LOCK TABLES `ticket_statuses` WRITE;
/*!40000 ALTER TABLE `ticket_statuses` DISABLE KEYS */;
INSERT INTO `ticket_statuses` VALUES (1,'Sold Out'),(2,'Sales Have Ended'),(3,'Not On Sale Yet'),(4,'On Sale'),(5,'On Sale');
/*!40000 ALTER TABLE `ticket_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `edited_by_user_id` int unsigned DEFAULT NULL,
  `account_id` int unsigned NOT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `event_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `original_price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `max_per_person` int DEFAULT NULL,
  `min_per_person` int DEFAULT NULL,
  `quantity_available` int DEFAULT NULL,
  `quantity_sold` int NOT NULL DEFAULT '0',
  `start_sale_date` datetime DEFAULT NULL,
  `end_sale_date` datetime DEFAULT NULL,
  `sales_volume` decimal(13,2) NOT NULL DEFAULT '0.00',
  `organiser_fees_volume` decimal(13,2) NOT NULL DEFAULT '0.00',
  `is_paused` tinyint NOT NULL DEFAULT '0',
  `public_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tickets_order_id_foreign` (`order_id`),
  KEY `tickets_edited_by_user_id_foreign` (`edited_by_user_id`),
  KEY `tickets_user_id_foreign` (`user_id`),
  KEY `tickets_account_id_index` (`account_id`),
  KEY `tickets_event_id_index` (`event_id`),
  KEY `tickets_public_id_index` (`public_id`),
  CONSTRAINT `tickets_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_edited_by_user_id_foreign` FOREIGN KEY (`edited_by_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `tickets_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'2022-04-21 06:42:15','2022-07-10 06:24:24',NULL,NULL,1,NULL,1,'SINGLE PASS','',27.00,0.00,30,1,100,39,'2022-04-21 06:42:00',NULL,1053.00,0.00,0,NULL,1,0,0),(2,'2022-04-21 06:42:34','2022-07-10 06:24:40',NULL,NULL,1,NULL,1,'SESSION PASS','',20.00,0.00,30,1,500,5,'2022-04-21 06:42:00',NULL,100.00,0.00,0,NULL,1,0,0),(3,'2022-05-25 16:08:12','2022-05-30 13:17:00',NULL,NULL,1,NULL,3,'1 session','',12.00,0.00,30,1,100,11,'2022-05-25 16:08:12',NULL,120.00,0.00,0,NULL,1,0,0),(4,'2022-05-25 16:18:56','2022-05-25 16:18:56',NULL,NULL,1,NULL,3,'complete session','',50.00,0.00,30,1,100,0,'2022-05-25 16:18:56',NULL,0.00,0.00,0,NULL,1,0,0),(5,'2022-05-28 14:57:35','2022-05-30 16:32:03',NULL,NULL,1,NULL,4,'Single Pass','',25.00,30.00,30,1,200,4,'2022-05-28 14:57:00',NULL,50.00,0.00,0,NULL,1,0,0),(6,'2022-05-30 16:29:53','2022-05-30 16:29:53',NULL,NULL,1,NULL,2,'Singh Pass','',10.00,12.00,30,1,10,0,'2022-05-30 16:29:53',NULL,0.00,0.00,0,NULL,1,0,0),(7,'2022-05-30 16:30:44','2022-05-30 16:30:44',NULL,NULL,1,NULL,2,'6 Session Pass','',50.00,60.00,30,1,12,0,'2022-05-30 16:30:44',NULL,0.00,0.00,0,NULL,1,0,0),(8,'2022-05-30 16:32:33','2022-05-30 16:32:33',NULL,NULL,1,NULL,4,'6 Session Pass','',60.00,120.00,30,1,10,0,'2022-05-30 16:32:33',NULL,0.00,0.00,0,NULL,1,0,0),(9,'2022-05-30 16:32:54','2022-05-30 16:32:54',NULL,NULL,1,NULL,4,'12 Session Pass','',120.00,150.00,30,1,20,0,'2022-05-30 16:32:54',NULL,0.00,0.00,0,NULL,1,0,0);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezones`
--

DROP TABLE IF EXISTS `timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timezones` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezones`
--

LOCK TABLES `timezones` WRITE;
/*!40000 ALTER TABLE `timezones` DISABLE KEYS */;
INSERT INTO `timezones` VALUES (1,'Pacific/Midway','(GMT-11:00) Midway Island'),(2,'US/Samoa','(GMT-11:00) Samoa'),(3,'US/Hawaii','(GMT-10:00) Hawaii'),(4,'US/Alaska','(GMT-09:00) Alaska'),(5,'US/Pacific','(GMT-08:00) Pacific Time (US &amp; Canada)'),(6,'America/Tijuana','(GMT-08:00) Tijuana'),(7,'US/Arizona','(GMT-07:00) Arizona'),(8,'US/Mountain','(GMT-07:00) Mountain Time (US &amp; Canada)'),(9,'America/Chihuahua','(GMT-07:00) Chihuahua'),(10,'America/Mazatlan','(GMT-07:00) Mazatlan'),(11,'America/Mexico_City','(GMT-06:00) Mexico City'),(12,'America/Monterrey','(GMT-06:00) Monterrey'),(13,'Canada/Saskatchewan','(GMT-06:00) Saskatchewan'),(14,'US/Central','(GMT-06:00) Central Time (US &amp; Canada)'),(15,'US/Eastern','(GMT-05:00) Eastern Time (US &amp; Canada)'),(16,'US/East-Indiana','(GMT-05:00) Indiana (East)'),(17,'America/Bogota','(GMT-05:00) Bogota'),(18,'America/Lima','(GMT-05:00) Lima'),(19,'America/Caracas','(GMT-04:30) Caracas'),(20,'Canada/Atlantic','(GMT-04:00) Atlantic Time (Canada)'),(21,'America/La_Paz','(GMT-04:00) La Paz'),(22,'America/Santiago','(GMT-04:00) Santiago'),(23,'Canada/Newfoundland','(GMT-03:30) Newfoundland'),(24,'America/Buenos_Aires','(GMT-03:00) Buenos Aires'),(25,'Greenland','(GMT-03:00) Greenland'),(26,'Atlantic/Stanley','(GMT-02:00) Stanley'),(27,'Atlantic/Azores','(GMT-01:00) Azores'),(28,'Atlantic/Cape_Verde','(GMT-01:00) Cape Verde Is.'),(29,'Africa/Casablanca','(GMT) Casablanca'),(30,'Europe/Dublin','(GMT) Dublin'),(31,'Europe/Lisbon','(GMT) Lisbon'),(32,'Europe/London','(GMT) London'),(33,'Africa/Monrovia','(GMT) Monrovia'),(34,'Europe/Amsterdam','(GMT+01:00) Amsterdam'),(35,'Europe/Belgrade','(GMT+01:00) Belgrade'),(36,'Europe/Berlin','(GMT+01:00) Berlin'),(37,'Europe/Bratislava','(GMT+01:00) Bratislava'),(38,'Europe/Brussels','(GMT+01:00) Brussels'),(39,'Europe/Budapest','(GMT+01:00) Budapest'),(40,'Europe/Copenhagen','(GMT+01:00) Copenhagen'),(41,'Europe/Ljubljana','(GMT+01:00) Ljubljana'),(42,'Europe/Madrid','(GMT+01:00) Madrid'),(43,'Europe/Paris','(GMT+01:00) Paris'),(44,'Europe/Prague','(GMT+01:00) Prague'),(45,'Europe/Rome','(GMT+01:00) Rome'),(46,'Europe/Sarajevo','(GMT+01:00) Sarajevo'),(47,'Europe/Skopje','(GMT+01:00) Skopje'),(48,'Europe/Stockholm','(GMT+01:00) Stockholm'),(49,'Europe/Vienna','(GMT+01:00) Vienna'),(50,'Europe/Warsaw','(GMT+01:00) Warsaw'),(51,'Europe/Zagreb','(GMT+01:00) Zagreb'),(52,'Europe/Athens','(GMT+02:00) Athens'),(53,'Europe/Bucharest','(GMT+02:00) Bucharest'),(54,'Africa/Cairo','(GMT+02:00) Cairo'),(55,'Africa/Harare','(GMT+02:00) Harare'),(56,'Europe/Helsinki','(GMT+02:00) Helsinki'),(57,'Europe/Istanbul','(GMT+02:00) Istanbul'),(58,'Asia/Jerusalem','(GMT+02:00) Jerusalem'),(59,'Europe/Kiev','(GMT+02:00) Kyiv'),(60,'Europe/Minsk','(GMT+02:00) Minsk'),(61,'Europe/Riga','(GMT+02:00) Riga'),(62,'Europe/Sofia','(GMT+02:00) Sofia'),(63,'Europe/Tallinn','(GMT+02:00) Tallinn'),(64,'Europe/Vilnius','(GMT+02:00) Vilnius'),(65,'Asia/Baghdad','(GMT+03:00) Baghdad'),(66,'Asia/Kuwait','(GMT+03:00) Kuwait'),(67,'Africa/Nairobi','(GMT+03:00) Nairobi'),(68,'Asia/Riyadh','(GMT+03:00) Riyadh'),(69,'Asia/Tehran','(GMT+03:30) Tehran'),(70,'Europe/Moscow','(GMT+04:00) Moscow'),(71,'Asia/Baku','(GMT+04:00) Baku'),(72,'Europe/Volgograd','(GMT+04:00) Volgograd'),(73,'Asia/Muscat','(GMT+04:00) Muscat'),(74,'Asia/Tbilisi','(GMT+04:00) Tbilisi'),(75,'Asia/Yerevan','(GMT+04:00) Yerevan'),(76,'Asia/Kabul','(GMT+04:30) Kabul'),(77,'Asia/Karachi','(GMT+05:00) Karachi'),(78,'Asia/Tashkent','(GMT+05:00) Tashkent'),(79,'Asia/Kolkata','(GMT+05:30) Kolkata'),(80,'Asia/Kathmandu','(GMT+05:45) Kathmandu'),(81,'Asia/Yekaterinburg','(GMT+06:00) Ekaterinburg'),(82,'Asia/Almaty','(GMT+06:00) Almaty'),(83,'Asia/Dhaka','(GMT+06:00) Dhaka'),(84,'Asia/Novosibirsk','(GMT+07:00) Novosibirsk'),(85,'Asia/Bangkok','(GMT+07:00) Bangkok'),(86,'Asia/Jakarta','(GMT+07:00) Jakarta'),(87,'Asia/Krasnoyarsk','(GMT+08:00) Krasnoyarsk'),(88,'Asia/Chongqing','(GMT+08:00) Chongqing'),(89,'Asia/Hong_Kong','(GMT+08:00) Hong Kong'),(90,'Asia/Kuala_Lumpur','(GMT+08:00) Kuala Lumpur'),(91,'Australia/Perth','(GMT+08:00) Perth'),(92,'Asia/Singapore','(GMT+08:00) Singapore'),(93,'Asia/Taipei','(GMT+08:00) Taipei'),(94,'Asia/Ulaanbaatar','(GMT+08:00) Ulaan Bataar'),(95,'Asia/Urumqi','(GMT+08:00) Urumqi'),(96,'Asia/Irkutsk','(GMT+09:00) Irkutsk'),(97,'Asia/Seoul','(GMT+09:00) Seoul'),(98,'Asia/Tokyo','(GMT+09:00) Tokyo'),(99,'Australia/Adelaide','(GMT+09:30) Adelaide'),(100,'Australia/Darwin','(GMT+09:30) Darwin'),(101,'Asia/Yakutsk','(GMT+10:00) Yakutsk'),(102,'Australia/Brisbane','(GMT+10:00) Brisbane'),(103,'Australia/Canberra','(GMT+10:00) Canberra'),(104,'Pacific/Guam','(GMT+10:00) Guam'),(105,'Australia/Hobart','(GMT+10:00) Hobart'),(106,'Australia/Melbourne','(GMT+10:00) Melbourne'),(107,'Pacific/Port_Moresby','(GMT+10:00) Port Moresby'),(108,'Australia/Sydney','(GMT+10:00) Sydney'),(109,'Asia/Vladivostok','(GMT+11:00) Vladivostok'),(110,'Asia/Magadan','(GMT+12:00) Magadan'),(111,'Pacific/Auckland','(GMT+12:00) Auckland'),(112,'Pacific/Fiji','(GMT+12:00) Fiji');
/*!40000 ALTER TABLE `timezones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmation_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_registered` tinyint(1) NOT NULL DEFAULT '0',
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `is_parent` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_api_token_unique` (`api_token`),
  KEY `users_account_id_index` (`account_id`),
  CONSTRAINT `users_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'2022-04-20 23:14:51','2022-04-20 23:14:51',NULL,'ravi','kathait',NULL,'ravikathait01@gmail.com','$2y$10$Xfg9qnusqjHc3dzn2WU7buBvjBwa4KnxBw9qCL.w/ZCUgVMbK4eVi','yuwPb4wlfEkfrifL',1,0,1,'1GsRlGDYjVkLqZVlo6XeZ9u7Ck89murEBFwcCVtI98QDMNxrc2KTIZRj2fnf','Z8R0sLTI2JSjAidUhTA4dkdX2gOJqCpJYIe3DiHfV36hpjkrDyCvwfBedtwz'),(2,2,'2022-04-20 23:33:35','2022-04-20 23:33:35',NULL,'Ravi','Kathait',NULL,'ravikathait04@gmail.com','$2y$10$IApOugg4Zr35s7NsHsNSMOlliNm1gkCuVISREQeHg0oL57N2xUzkW','88myfa2RSdOEZy51',1,0,1,NULL,'aRozQeFHkUBs6in8dx9egcGt1Kes15sdT7BxWBvzslzNTnRJg9llYuDHfqvK'),(3,3,'2022-04-20 23:51:20','2022-04-20 23:51:20',NULL,'Ravi','kathait',NULL,'ravikathait05@gmail.com','$2y$10$mDjv87s0AWHMn3ot/bM6a.1XE4J8POJ5ob/k3XwfPLrlQXliZiiKu','bsuLPW5Tba1IoDKr',1,0,1,NULL,'1UfwXhnl8NtFdIkTAErw6OTVqNRzztrghFQLndcxzvYvzyzbHvCRPfR7gNTW');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-19 19:03:54
