-- MySQL dump 10.13  Distrib 8.4.11, for Linux (aarch64)
--
-- Host: localhost    Database: okten_drfHw_db
-- ------------------------------------------------------
-- Server version	8.4.11

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',3,'add_permission'),(2,'Can change permission',3,'change_permission'),(3,'Can delete permission',3,'delete_permission'),(4,'Can view permission',3,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add content type',1,'add_contenttype'),(10,'Can change content type',1,'change_contenttype'),(11,'Can delete content type',1,'delete_contenttype'),(12,'Can view content type',1,'view_contenttype'),(13,'Can add computer model',5,'add_computermodel'),(14,'Can change computer model',5,'change_computermodel'),(15,'Can delete computer model',5,'delete_computermodel'),(16,'Can view computer model',5,'view_computermodel'),(17,'Can add computer shop model',4,'add_computershopmodel'),(18,'Can change computer shop model',4,'change_computershopmodel'),(19,'Can delete computer shop model',4,'delete_computershopmodel'),(20,'Can view computer shop model',4,'view_computershopmodel'),(21,'Can add user model',7,'add_usermodel'),(22,'Can change user model',7,'change_usermodel'),(23,'Can delete user model',7,'delete_usermodel'),(24,'Can view user model',7,'view_usermodel'),(25,'Can add profile model',6,'add_profilemodel'),(26,'Can change profile model',6,'change_profilemodel'),(27,'Can delete profile model',6,'delete_profilemodel'),(28,'Can view profile model',6,'view_profilemodel'),(29,'Can add Blacklisted Token',8,'add_blacklistedtoken'),(30,'Can change Blacklisted Token',8,'change_blacklistedtoken'),(31,'Can delete Blacklisted Token',8,'delete_blacklistedtoken'),(32,'Can view Blacklisted Token',8,'view_blacklistedtoken'),(33,'Can add Outstanding Token',9,'add_outstandingtoken'),(34,'Can change Outstanding Token',9,'change_outstandingtoken'),(35,'Can delete Outstanding Token',9,'delete_outstandingtoken'),(36,'Can view Outstanding Token',9,'view_outstandingtoken'),(37,'Can add crontab',11,'add_crontabschedule'),(38,'Can change crontab',11,'change_crontabschedule'),(39,'Can delete crontab',11,'delete_crontabschedule'),(40,'Can view crontab',11,'view_crontabschedule'),(41,'Can add interval',12,'add_intervalschedule'),(42,'Can change interval',12,'change_intervalschedule'),(43,'Can delete interval',12,'delete_intervalschedule'),(44,'Can view interval',12,'view_intervalschedule'),(45,'Can add periodic task',13,'add_periodictask'),(46,'Can change periodic task',13,'change_periodictask'),(47,'Can delete periodic task',13,'delete_periodictask'),(48,'Can view periodic task',13,'view_periodictask'),(49,'Can add periodic task track',14,'add_periodictasks'),(50,'Can change periodic task track',14,'change_periodictasks'),(51,'Can delete periodic task track',14,'delete_periodictasks'),(52,'Can view periodic task track',14,'view_periodictasks'),(53,'Can add solar event',15,'add_solarschedule'),(54,'Can change solar event',15,'change_solarschedule'),(55,'Can delete solar event',15,'delete_solarschedule'),(56,'Can view solar event',15,'view_solarschedule'),(57,'Can add clocked',10,'add_clockedschedule'),(58,'Can change clocked',10,'change_clockedschedule'),(59,'Can delete clocked',10,'delete_clockedschedule'),(60,'Can view clocked',10,'view_clockedschedule'),(61,'Can add task result',18,'add_taskresult'),(62,'Can change task result',18,'change_taskresult'),(63,'Can delete task result',18,'delete_taskresult'),(64,'Can view task result',18,'view_taskresult'),(65,'Can add chord counter',16,'add_chordcounter'),(66,'Can change chord counter',16,'change_chordcounter'),(67,'Can delete chord counter',16,'delete_chordcounter'),(68,'Can view chord counter',16,'view_chordcounter'),(69,'Can add group result',17,'add_groupresult'),(70,'Can change group result',17,'change_groupresult'),(71,'Can delete group result',17,'delete_groupresult'),(72,'Can view group result',17,'view_groupresult');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'andriy.tokovyy@gmail.com','pbkdf2_sha256$1500000$QHudJUKKaXDs0WKrz0i0sz$WKVvOe3cIm+PoxoYh6FRjwQlfSbH/VMaSioh6Eut0bg=',1,1,1,'2026-10-17 01:20:18.449904','2026-09-29 23:09:17.498304','2026-09-29 23:09:17.498315'),(2,'andriy.hart@gmail.com','pbkdf2_sha256$1500000$5JdAvdz9H4ky6IxSt9Fg5t$8uMmk+rLYWd0WYEMlle/Hw88olexZek9JCt/cohJSoE=',1,0,0,'2026-09-29 23:16:14.188840','2026-09-29 23:09:37.975620','2026-09-29 23:16:40.345402'),(9,'atokoveshka@gmail.com','pbkdf2_sha256$1500000$AwVbCufHJfAbBk08mPB09R$BV/J++Gwc7+6tmw+aKSetAKn1CbaPqlrld2RVXfTt0c=',1,0,0,NULL,'2026-10-16 22:50:36.095027','2026-10-17 01:11:59.713011');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usermodel_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_usermodel_id_group_id_7ca6416c_uniq` (`usermodel_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_usermodel_id_eaf3a875_fk_auth_user_id` FOREIGN KEY (`usermodel_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usermodel_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissio_usermodel_id_permission__7325a6f6_uniq` (`usermodel_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_usermodel_id_c47d54cf_fk_auth_user_id` FOREIGN KEY (`usermodel_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer_shops`
--

DROP TABLE IF EXISTS `computer_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computer_shops` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer_shops`
--

LOCK TABLES `computer_shops` WRITE;
/*!40000 ALTER TABLE `computer_shops` DISABLE KEYS */;
INSERT INTO `computer_shops` VALUES (1,'2026-09-14 13:05:46.778365','2026-09-14 13:05:46.778492','Allo'),(2,'2026-09-14 13:22:46.649770','2026-09-14 13:22:46.649851','Komputernyi Vsesvit'),(3,'2026-09-14 13:23:06.463066','2026-09-14 13:23:06.463083','Rozetka');
/*!40000 ALTER TABLE `computer_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computers`
--

DROP TABLE IF EXISTS `computers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand` varchar(20) NOT NULL,
  `model` varchar(20) NOT NULL,
  `PRICE` int DEFAULT NULL,
  `year` int NOT NULL,
  `avail_status` tinyint(1) NOT NULL,
  `cpu` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `computer_shop_id` bigint NOT NULL,
  `ram_type` varchar(4) NOT NULL,
  `ram` int NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_computer_shop_id_7d19cf9d_fk_computer_shops_id` (`computer_shop_id`),
  CONSTRAINT `computers_computer_shop_id_7d19cf9d_fk_computer_shops_id` FOREIGN KEY (`computer_shop_id`) REFERENCES `computer_shops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computers`
--

LOCK TABLES `computers` WRITE;
/*!40000 ALTER TABLE `computers` DISABLE KEYS */;
INSERT INTO `computers` VALUES (1,'Apple','MacBook Pro',80000,2022,1,'Apple Silicon M5 Pro','2026-09-10 20:32:07.756139','2026-10-16 14:36:23.644314',1,'DDR5',24,'Allo/f6075a2c-c96e-11f1-9c22-eedfc4c8b57f.png'),(2,'Acer','Predator Helios',65000,2021,0,'Intel Core I5','2026-09-10 20:32:07.756139','2026-09-10 20:32:07.776412',1,'DDR5',32,''),(3,'Asus','TUF Gaming',35000,2025,1,'AMD Ryzen 5 5600','2026-09-10 20:32:07.756139','2026-09-10 20:32:07.776412',1,'DDR5',16,''),(5,'LG','Gram',50000,2022,0,'Intel Core I7','2026-09-10 21:09:51.832709','2026-09-10 21:09:51.832862',1,'DDR5',12,''),(6,'Asus','Rog Zephyrus',60000,2023,1,'Amd Ryzen 7','2026-09-14 14:38:35.600323','2026-09-14 14:38:35.600404',3,'DDR5',32,''),(7,'Apple','MacBook Air',40000,2022,0,'Apple Silicon M2','2026-09-14 14:39:02.688880','2026-09-14 14:39:02.688901',2,'DDR5',8,''),(8,'Apple','MacBook Pro',90000,2026,1,'Apple Silicon M6 Pro','2026-09-19 21:40:25.968512','2026-09-19 21:40:25.968586',2,'DDR5',16,'');
/*!40000 ALTER TABLE `computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_clockedschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_clockedschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_clockedschedule`
--

LOCK TABLES `django_celery_beat_clockedschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_crontabschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_crontabschedule`
--

LOCK TABLES `django_celery_beat_crontabschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` DISABLE KEYS */;
INSERT INTO `django_celery_beat_crontabschedule` VALUES (1,'0','4','*','*','*','UTC'),(2,'*','*','*','*','*','UTC'),(3,'0','*','*','*','*','UTC');
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_intervalschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `every` int NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_intervalschedule`
--

LOCK TABLES `django_celery_beat_intervalschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictask`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int DEFAULT NULL,
  `interval_id` int DEFAULT NULL,
  `solar_id` int DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int unsigned DEFAULT NULL,
  `headers` longtext NOT NULL DEFAULT (_utf8mb4'{}'),
  `clocked_id` int DEFAULT NULL,
  `expire_seconds` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`),
  CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`),
  CONSTRAINT `django_celery_beat_periodictask_chk_1` CHECK ((`total_run_count` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_2` CHECK ((`priority` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_3` CHECK ((`expire_seconds` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictask`
--

LOCK TABLES `django_celery_beat_periodictask` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictask` DISABLE KEYS */;
INSERT INTO `django_celery_beat_periodictask` VALUES (3,'collect_statistics','core.tasks.statistics.collect_statistics','[]','{}',NULL,NULL,NULL,NULL,1,'2026-10-22 22:27:03.695027',12,'2026-10-22 22:27:09.518242','',3,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL);
/*!40000 ALTER TABLE `django_celery_beat_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictasks`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictasks`
--

LOCK TABLES `django_celery_beat_periodictasks` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` DISABLE KEYS */;
INSERT INTO `django_celery_beat_periodictasks` VALUES (1,'2026-10-22 22:27:09.519760');
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_solarschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_solarschedule`
--

LOCK TABLES `django_celery_beat_solarschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_chordcounter`
--

DROP TABLE IF EXISTS `django_celery_results_chordcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_results_chordcounter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `sub_tasks` longtext NOT NULL,
  `count` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  CONSTRAINT `django_celery_results_chordcounter_chk_1` CHECK ((`count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_chordcounter`
--

LOCK TABLES `django_celery_results_chordcounter` WRITE;
/*!40000 ALTER TABLE `django_celery_results_chordcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_chordcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_groupresult`
--

DROP TABLE IF EXISTS `django_celery_results_groupresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_results_groupresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  KEY `django_cele_date_cr_bd6c1d_idx` (`date_created`),
  KEY `django_cele_date_do_caae0e_idx` (`date_done`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_groupresult`
--

LOCK TABLES `django_celery_results_groupresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_groupresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_groupresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_taskresult`
--

DROP TABLE IF EXISTS `django_celery_results_taskresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_results_taskresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `meta` longtext,
  `task_args` longtext,
  `task_kwargs` longtext,
  `task_name` varchar(255) DEFAULT NULL,
  `worker` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `periodic_task_name` varchar(255) DEFAULT NULL,
  `date_started` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_cele_task_na_08aec9_idx` (`task_name`),
  KEY `django_cele_status_9b6201_idx` (`status`),
  KEY `django_cele_worker_d54dd8_idx` (`worker`),
  KEY `django_cele_date_cr_f04a50_idx` (`date_created`),
  KEY `django_cele_date_do_f59aad_idx` (`date_done`),
  KEY `django_cele_periodi_1993cf_idx` (`periodic_task_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_taskresult`
--

LOCK TABLES `django_celery_results_taskresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_taskresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_taskresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'auth','group'),(3,'auth','permission'),(4,'computer_shops','computershopmodel'),(5,'computers','computermodel'),(1,'contenttypes','contenttype'),(10,'django_celery_beat','clockedschedule'),(11,'django_celery_beat','crontabschedule'),(12,'django_celery_beat','intervalschedule'),(13,'django_celery_beat','periodictask'),(14,'django_celery_beat','periodictasks'),(15,'django_celery_beat','solarschedule'),(16,'django_celery_results','chordcounter'),(17,'django_celery_results','groupresult'),(18,'django_celery_results','taskresult'),(8,'token_blacklist','blacklistedtoken'),(9,'token_blacklist','outstandingtoken'),(6,'user','profilemodel'),(7,'user','usermodel');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-09-29 21:36:29.345333'),(2,'contenttypes','0002_remove_content_type_name','2026-09-29 21:36:29.358221'),(27,'computer_shops','0001_initial','2026-09-29 21:40:46.371189'),(28,'computers','0001_initial','2026-09-29 21:41:51.423318'),(29,'computers','0002_computermodel_ram','2026-09-29 21:41:51.437508'),(30,'computers','0003_computermodel_created_at_computermodel_updated_at','2026-09-29 21:41:51.458102'),(31,'computers','0004_computermodel_price','2026-09-29 21:41:51.467257'),(32,'computers','0005_alter_computermodel_avail_status_and_more','2026-09-29 21:41:51.469208'),(33,'computers','0006_computermodel_computer_shop','2026-09-29 21:41:51.483867'),(34,'computers','0007_alter_computermodel_computer_shop','2026-09-29 21:41:51.485742'),(35,'computers','0008_remove_computermodel_ram_computermodel_ram_type','2026-09-29 21:41:51.504934'),(36,'computers','0009_alter_computermodel_cpu','2026-09-29 21:41:51.507998'),(37,'computers','0010_computermodel_ram','2026-09-29 21:41:51.519329'),(38,'computers','0011_alter_computermodel_options','2026-09-29 21:41:51.520433'),(39,'computers','0012_alter_computermodel_brand_alter_computermodel_model','2026-09-29 21:41:51.522000'),(40,'computers','0013_alter_computermodel_brand_alter_computermodel_price_and_more','2026-09-29 21:41:51.539023'),(53,'auth','0001_initial','2026-09-29 21:42:56.596452'),(65,'auth','0002_alter_permission_name_max_length','2026-09-29 21:45:11.302150'),(66,'auth','0003_alter_user_email_max_length','2026-09-29 21:45:11.304402'),(67,'auth','0004_alter_user_username_opts','2026-09-29 21:45:11.305977'),(68,'auth','0005_alter_user_last_login_null','2026-09-29 21:45:11.307311'),(69,'auth','0006_require_contenttypes_0002','2026-09-29 21:45:11.308011'),(70,'auth','0007_alter_validators_add_error_messages','2026-09-29 21:45:11.309458'),(71,'auth','0008_alter_user_username_max_length','2026-09-29 21:45:11.311141'),(72,'auth','0009_alter_user_last_name_max_length','2026-09-29 21:45:11.312530'),(73,'auth','0010_alter_group_name_max_length','2026-09-29 21:45:11.316344'),(74,'auth','0011_update_proxy_permissions','2026-09-29 21:45:11.318346'),(75,'auth','0012_alter_user_first_name_max_length','2026-09-29 21:45:11.319694'),(79,'user','0001_initial','2026-09-29 23:08:29.420639'),(80,'user','0002_alter_profilemodel_managers','2026-09-29 23:08:29.423006'),(81,'user','0003_alter_profilemodel_managers_alter_usermodel_managers','2026-09-29 23:08:29.425998'),(82,'token_blacklist','0001_initial','2026-10-16 14:23:38.963795'),(83,'token_blacklist','0002_outstandingtoken_jti_hex','2026-10-16 14:23:38.974268'),(84,'token_blacklist','0003_auto_20171017_2007','2026-10-16 14:23:38.978614'),(85,'token_blacklist','0004_auto_20171017_2013','2026-10-16 14:23:38.992874'),(86,'token_blacklist','0005_remove_outstandingtoken_jti','2026-10-16 14:23:39.002191'),(87,'token_blacklist','0006_auto_20171017_2113','2026-10-16 14:23:39.010289'),(88,'token_blacklist','0007_auto_20171017_2214','2026-10-16 14:23:39.046339'),(89,'token_blacklist','0008_migrate_to_bigautofield','2026-10-16 14:23:39.080050'),(90,'token_blacklist','0010_fix_migrate_to_bigautofield','2026-10-16 14:23:39.083653'),(91,'token_blacklist','0011_linearizes_history','2026-10-16 14:23:39.083972'),(92,'token_blacklist','0012_alter_outstandingtoken_user','2026-10-16 14:23:39.086165'),(93,'token_blacklist','0013_alter_blacklistedtoken_options_and_more','2026-10-16 14:23:39.089281'),(94,'computers','0014_computermodel_photo','2026-10-16 14:23:59.473418'),(95,'user','0004_alter_usermodel_is_active','2026-10-16 14:23:59.476351'),(96,'django_celery_beat','0001_initial','2026-10-21 21:41:26.628306'),(97,'django_celery_beat','0002_auto_20161118_0346','2026-10-21 21:41:26.649086'),(98,'django_celery_beat','0003_auto_20161209_0049','2026-10-21 21:41:26.654908'),(99,'django_celery_beat','0004_auto_20170221_0000','2026-10-21 21:41:26.656562'),(100,'django_celery_beat','0005_add_solarschedule_events_choices','2026-10-21 21:41:26.657785'),(101,'django_celery_beat','0006_auto_20180322_0932','2026-10-21 21:41:26.683682'),(102,'django_celery_beat','0007_auto_20180521_0826','2026-10-21 21:41:26.708354'),(103,'django_celery_beat','0008_auto_20180914_1922','2026-10-21 21:41:26.717794'),(104,'django_celery_beat','0006_auto_20180210_1226','2026-10-21 21:41:26.725751'),(105,'django_celery_beat','0006_periodictask_priority','2026-10-21 21:41:26.742490'),(106,'django_celery_beat','0009_periodictask_headers','2026-10-21 21:41:26.759951'),(107,'django_celery_beat','0010_auto_20190429_0326','2026-10-21 21:41:26.820135'),(108,'django_celery_beat','0011_auto_20190508_0153','2026-10-21 21:41:26.841497'),(109,'django_celery_beat','0012_periodictask_expire_seconds','2026-10-21 21:41:26.859902'),(110,'django_celery_beat','0013_auto_20200609_0727','2026-10-21 21:41:26.863236'),(111,'django_celery_beat','0014_remove_clockedschedule_enabled','2026-10-21 21:41:26.869842'),(112,'django_celery_beat','0015_edit_solarschedule_events_choices','2026-10-21 21:41:26.871681'),(113,'django_celery_beat','0016_alter_crontabschedule_timezone','2026-10-21 21:41:26.874898'),(114,'django_celery_beat','0017_alter_crontabschedule_month_of_year','2026-10-21 21:41:26.880186'),(115,'django_celery_beat','0018_improve_crontab_helptext','2026-10-21 21:41:26.882550'),(116,'django_celery_beat','0019_alter_periodictasks_options','2026-10-21 21:41:26.883165'),(117,'django_celery_results','0001_initial','2026-10-21 21:41:26.891228'),(118,'django_celery_results','0002_add_task_name_args_kwargs','2026-10-21 21:41:26.923563'),(119,'django_celery_results','0003_auto_20181106_1101','2026-10-21 21:41:26.924627'),(120,'django_celery_results','0004_auto_20190516_0412','2026-10-21 21:41:26.940745'),(121,'django_celery_results','0005_taskresult_worker','2026-10-21 21:41:26.954282'),(122,'django_celery_results','0006_taskresult_date_created','2026-10-21 21:41:26.976428'),(123,'django_celery_results','0007_remove_taskresult_hidden','2026-10-21 21:41:26.985127'),(124,'django_celery_results','0008_chordcounter','2026-10-21 21:41:26.988638'),(125,'django_celery_results','0009_groupresult','2026-10-21 21:41:27.044521'),(126,'django_celery_results','0010_remove_duplicate_indices','2026-10-21 21:41:27.046988'),(127,'django_celery_results','0011_taskresult_periodic_task_name','2026-10-21 21:41:27.055338'),(128,'django_celery_results','0012_taskresult_date_started','2026-10-21 21:41:27.065265'),(129,'django_celery_results','0013_taskresult_django_cele_periodi_1993cf_idx','2026-10-21 21:41:27.069267'),(130,'django_celery_results','0014_alter_taskresult_status','2026-10-21 21:41:27.070336');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `profile_user_id_2aeb6f6b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Andriy','Tokovyy',21,1,'2026-09-29 23:09:17.506876','2026-09-29 23:09:17.506884'),(2,'Andriy','Hart',21,2,'2026-09-29 23:09:37.981028','2026-09-29 23:09:37.981033'),(9,'Test','User',30,9,'2026-10-16 22:50:36.112651','2026-10-16 22:50:36.112693');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_auth_user` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MjE2MjEyMSwiaWF0IjoxNzkyMTYwOTIxLCJqdGkiOiJmYmVmYjIzMzM3MDg0NDJiYmNmNWI5YThkZDdjYzAwOSIsInVzZXJfaWQiOiIxIn0.tyrsK8f8x4qm_Nclo9nna7ZfV86YzF1o0QH0gb8ZEwk','2026-10-16 14:28:41.890034','2026-10-16 14:48:41.000000',1,'fbefb2333708442bbcf5b9a8dd7cc009'),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MjE5MTc4NywiaWF0IjoxNzkyMTkwNTg3LCJqdGkiOiIwMWYzYjZmZGYyZjU0YTVhODBkNzRlNTdiNmE5MjEyZCIsInVzZXJfaWQiOiIxIn0.OaPUsKPWfOQvZQBeN8GzPt_81UXChAzUpJbzwfJBcMg','2026-10-16 22:43:07.781338','2026-10-16 23:03:07.000000',1,'01f3b6fdf2f54a5a80d74e57b6a9212d'),(5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MjIwMTIxOCwiaWF0IjoxNzkyMjAwMDE4LCJqdGkiOiI4NWQwNzg0NTlkZmU0MjY5YmNjNGQxNDhjZWE2NWMzNyIsInVzZXJfaWQiOiIxIn0.JZfXrAxhTwexvzcJtDLWkhyX_xHEgd5cQx2jVBgJK_U','2026-10-17 01:20:18.444911','2026-10-17 01:40:18.000000',1,'85d078459dfe4269bcc4d148cea65c37');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-22 22:27:29
