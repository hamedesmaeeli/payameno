-- MySQL dump 10.13  Distrib 5.1.37, for Win32 (ia32)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	5.1.37-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `account_student_view`
--

DROP TABLE IF EXISTS `account_student_view`;
/*!50001 DROP VIEW IF EXISTS `account_student_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `account_student_view` (
  `st_id` bigint(20),
  `acc_id` bigint(20),
  `create_date` datetime,
  `name` varchar(200),
  `person_name` varchar(250),
  `person_mobile` varchar(20),
  `fax` varchar(20),
  `address` varchar(255),
  `fisrt_payable` bigint(20),
  `phone` varchar(20),
  `acc_create_date` datetime,
  `st_name` varchar(255),
  `st_famili` varchar(255),
  `national_code` int(11),
  `identifier_serial` varchar(255),
  `identifier_char` int(255),
  `student_code` bigint(20),
  `father_name` varchar(255),
  `date_of_birth` date,
  `description` varchar(255),
  `status_id` bigint(20),
  `org_unit_id` bigint(20),
  `created_date` datetime,
  `last_modified` datetime,
  `level_id_last` bigint(20),
  `field_id_last` bigint(20),
  `st_address` varchar(255),
  `st_mobile` varchar(255),
  `st_phone` varchar(255),
  `archive_code` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `bank_account_v`
--

DROP TABLE IF EXISTS `bank_account_v`;
/*!50001 DROP VIEW IF EXISTS `bank_account_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `bank_account_v` (
  `id` bigint(20),
  `name` varchar(255),
  `bank_id` bigint(20),
  `first_amount` bigint(20),
  `is_cash` bit(1),
  `bank_name` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `check_v`
--

DROP TABLE IF EXISTS `check_v`;
/*!50001 DROP VIEW IF EXISTS `check_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `check_v` (
  `id` bigint(20),
  `created_date` datetime,
  `number` varchar(20),
  `amount` bigint(20),
  `for_how` varchar(255),
  `check_date` date,
  `bank_id` bigint(20),
  `bank_branch` varchar(255),
  `description` varchar(255),
  `status_id` bigint(20),
  `account_id` bigint(20),
  `bank_account_id` bigint(20),
  `bank_name` varchar(255),
  `status_name` varchar(255),
  `account_name` varchar(200),
  `phone` varchar(20),
  `person_name` varchar(250),
  `person_mobile` varchar(20),
  `fax` varchar(20),
  `create_date` datetime,
  `address` varchar(255),
  `fisrt_payable` bigint(20),
  `bank_account_name` varchar(255),
  `bank_account_b_id` bigint(20),
  `first_amount` bigint(20),
  `is_cash` bit(1),
  `bank_account_b_name` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `finance_account`
--

DROP TABLE IF EXISTS `finance_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `person_name` varchar(250) DEFAULT NULL,
  `person_mobile` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `fisrt_payable` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_account`
--

LOCK TABLES `finance_account` WRITE;
/*!40000 ALTER TABLE `finance_account` DISABLE KEYS */;
INSERT INTO `finance_account` VALUES (1,'علی سمیعی','679898','علی سمیعی','0913219907','22222','2013-08-28 00:00:00','اصفهان خیابان امام',0),(2,'محمود سلیمی','33333','محمود سلیمی','0912322222','2222','2013-08-28 00:00:00','خانه اصفهان',0),(3,'hamed esmaili','3113331',NULL,'091321111',NULL,'2013-09-03 00:00:00',NULL,-1200000),(4,'hamed esmaili','3113331',NULL,'091321111',NULL,'2013-09-03 00:00:00',NULL,-1200000),(5,'hamed esmaili','3113331',NULL,'091321111',NULL,'2013-09-03 00:00:00',NULL,-1200000),(6,'hamed esmaili','3113331',NULL,'091321111',NULL,'2013-09-03 00:00:00',NULL,-1200000),(7,'hamed esmaili','3113331',NULL,'091321111',NULL,'2013-09-03 00:00:00',NULL,-1200000),(8,'hamed esmaili','3113331','hamed esmailie','091321111',NULL,'2013-09-03 00:00:00',NULL,-1200000),(9,'hamed esmaili','3113331','hamed esmailie','091321111','2312311','2013-09-03 00:00:00','new new address',-1200000),(10,'hamed esmaili','3113331','hamed esmailie','091321111','2312311','2013-09-03 00:00:00','new new address',-1200000),(11,'hamid esmai','4412345','hamid esmai','093798009',NULL,'2013-09-03 00:00:00','asghar aabad',0),(12,'hamid esmai','4412345','hamid esmai','093798009',NULL,'2013-09-03 00:00:00','asghar aabad',2000000),(13,'علی جودی','3312798','علی جودی',NULL,NULL,'2013-09-10 00:00:00','خمینی شهر',0),(14,'اصغر طالب زاده','12345','اصغر طالب زاده',NULL,NULL,'2013-09-10 00:00:00','تهران میدان آزادای',0),(15,'اصغر شجاعی','031133128099','اصغر شجاعی',NULL,NULL,'2013-09-15 00:00:00','تیییی',0),(16,'حسین کریمی','311','حسین کریمی',NULL,NULL,'2013-09-20 00:00:00','اسس',0),(17,'علی اکبر هاشمی','111','علی اکبر هاشمی',NULL,NULL,'2013-09-20 00:00:00','تهرلن',0),(18,'حسین محمدی','3113312798','حسین محمدی',NULL,NULL,'2013-12-20 00:00:00','تهران',0);
/*!40000 ALTER TABLE `finance_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_account_bank`
--

DROP TABLE IF EXISTS `finance_account_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance_account_bank` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `first_amount` bigint(20) DEFAULT NULL,
  `is_cash` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_id` (`bank_id`),
  CONSTRAINT `finance_account_bank_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `finance_bank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_account_bank`
--

LOCK TABLES `finance_account_bank` WRITE;
/*!40000 ALTER TABLE `finance_account_bank` DISABLE KEYS */;
INSERT INTO `finance_account_bank` VALUES (10,'حساب مرکزی ملی',1,120000,'\0'),(20,'صندوق',NULL,1000000,'');
/*!40000 ALTER TABLE `finance_account_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_bank`
--

DROP TABLE IF EXISTS `finance_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance_bank` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_bank`
--

LOCK TABLES `finance_bank` WRITE;
/*!40000 ALTER TABLE `finance_bank` DISABLE KEYS */;
INSERT INTO `finance_bank` VALUES (1,'ملی'),(2,'صادرات'),(3,'مسکن');
/*!40000 ALTER TABLE `finance_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_check`
--

DROP TABLE IF EXISTS `finance_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance_check` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `for_how` varchar(255) DEFAULT NULL,
  `check_date` date DEFAULT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `bank_branch` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `bank_account_id` bigint(20) DEFAULT NULL,
  `pay_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_id` (`bank_id`),
  KEY `status_id` (`status_id`),
  KEY `account_id` (`account_id`),
  KEY `bank_account_id` (`bank_account_id`),
  CONSTRAINT `finance_check_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `finance_bank` (`id`),
  CONSTRAINT `finance_check_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `finance_check_status` (`id`),
  CONSTRAINT `finance_check_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `finance_account` (`id`),
  CONSTRAINT `finance_check_ibfk_4` FOREIGN KEY (`bank_account_id`) REFERENCES `finance_account_bank` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_check`
--

LOCK TABLES `finance_check` WRITE;
/*!40000 ALTER TABLE `finance_check` DISABLE KEYS */;
INSERT INTO `finance_check` VALUES (1,'2013-09-25 21:08:40','123456',120000,'حامل','2013-09-12',1,'جمهوری',NULL,1,1,10,NULL),(2,'2013-09-13 00:00:00','12333',20000,'حامل','2013-09-18',1,'خانه اصفهان','desc',3,11,20,NULL),(3,'2013-09-13 00:00:00','1234',1234,'حامل','2013-09-16',1,'خانه اصفهان','desc',1,11,20,NULL),(4,'2013-09-13 00:00:00','234',123,'123','2013-09-16',1,'123','یثس',2,14,20,NULL),(5,'2013-09-13 00:00:00','1234',102,'حامد اسماعیلی','2013-09-18',2,'شعبه','desc',1,11,20,49),(6,'2013-09-14 00:00:00','1234',123,'حامل','2013-09-17',3,'23','desc',1,12,20,NULL),(7,'2013-09-14 00:00:00','12345',1234,'xsd','2013-09-15',2,'123','desc',2,13,20,47),(8,'2013-09-14 00:00:00','2111',123,'hamel','2013-09-23',1,'desc','desc',2,14,20,48),(9,'2013-09-14 00:00:00','111',100,'12','2013-09-25',3,'1234','desc',1,14,20,NULL),(10,'2013-09-15 00:00:00','1233',10000,'hamel','2013-09-15',3,'desc','desc',2,13,20,54),(11,'2013-09-15 00:00:00','123',100,'1234','2013-09-17',1,'123','1234',2,11,20,55),(12,'2013-09-15 00:00:00','123',100,'1234','2013-09-17',1,'123','1234',1,11,20,NULL),(13,'2013-09-15 00:00:00','123456',100,'desc','2013-09-18',1,'desc','desc',1,11,20,NULL),(14,'2013-09-15 00:00:00','12344',5000,'حامل','2013-09-29',2,'جمهوری','desc',2,15,20,57),(15,'2013-09-15 00:00:00','12344',5000,'حامل','2013-09-28',3,'جمهوری','desc',1,15,20,NULL),(16,'2013-09-17 00:00:00','2111',100,'حامل','2013-09-17',2,'1234','desc',2,13,20,59),(17,'2013-09-20 00:00:00','122',1000,'ss','2013-09-24',1,'ss','ss',1,11,20,NULL),(18,'2013-09-20 00:00:00','1200',50,'des','2013-09-21',1,'des','des',1,17,20,NULL),(19,'2013-09-20 00:00:00','12345',70000,'desc','2013-09-25',1,'des','des',3,13,20,NULL),(20,'2013-09-21 00:00:00','1223',40000,'حامل','2013-09-22',1,'ddd','dd',1,16,20,NULL),(21,'2013-09-22 00:00:00','111',24,'سسس','2013-10-22',2,'جمهموری','سسس',1,10,20,NULL),(22,'2013-09-22 00:00:00','111',10,'1','2013-10-08',2,'11','1',1,17,20,NULL),(23,'2013-09-23 00:00:00','111',30,'حامل','2013-12-18',2,'صصص','سسس',2,17,20,80),(24,'2013-09-28 00:00:00','1222',10,'desc','2013-10-20',1,'desx','desc',1,13,20,NULL);
/*!40000 ALTER TABLE `finance_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_check_status`
--

DROP TABLE IF EXISTS `finance_check_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance_check_status` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_check_status`
--

LOCK TABLES `finance_check_status` WRITE;
/*!40000 ALTER TABLE `finance_check_status` DISABLE KEYS */;
INSERT INTO `finance_check_status` VALUES (1,'برگشت خورده'),(2,'پاس شده'),(3,'اولیه');
/*!40000 ALTER TABLE `finance_check_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_factor`
--

DROP TABLE IF EXISTS `finance_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance_factor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_person_id` bigint(20) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_person_id` (`account_person_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `finance_factor_ibfk_1` FOREIGN KEY (`account_person_id`) REFERENCES `finance_account` (`id`),
  CONSTRAINT `finance_factor_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `finance_factor_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_factor`
--

LOCK TABLES `finance_factor` WRITE;
/*!40000 ALTER TABLE `finance_factor` DISABLE KEYS */;
INSERT INTO `finance_factor` VALUES (1,10,-10000,'2013-09-05 08:17:40',NULL,1),(2,1,-120,'2013-09-15 10:54:32',NULL,1),(3,1,-1200,'2013-09-18 10:54:37',NULL,1),(4,14,-70001,'2013-09-11 00:00:00',NULL,1),(5,13,-70122,'2013-09-11 00:00:00',NULL,1),(6,12,-12,'2013-09-11 00:00:00',NULL,1),(7,11,-30000,'2013-09-12 00:00:00',NULL,1),(8,13,-14,'2013-09-12 00:00:00',NULL,1),(9,11,-19,'2013-09-12 00:00:00',NULL,1),(10,12,-124,'2013-09-12 00:00:00',NULL,1),(11,14,-124,'2013-09-12 00:00:00',NULL,1),(12,15,-10200,'2013-09-15 00:00:00',NULL,1),(13,10,-124,'2013-09-19 00:00:00',NULL,1),(14,17,-102,'2013-09-20 00:00:00',NULL,1),(15,17,-120,'2013-09-20 00:00:00',NULL,1),(16,16,-50000,'2013-09-21 00:00:00',NULL,1),(17,16,-120,'2013-09-23 00:00:00',NULL,1),(18,17,-130,'2013-09-23 00:00:00',NULL,1),(19,16,-210,'2013-09-23 00:00:00',NULL,1),(20,13,-210,'2013-09-28 00:00:00',NULL,1),(21,12,-131,'2013-12-19 00:00:00',NULL,1),(22,18,-160,'2013-12-20 00:00:00',NULL,1),(23,10,-422,'2013-12-21 00:00:00',NULL,1),(24,14,-422,'2013-12-21 00:00:00',NULL,1),(25,11,-5335,'2013-12-21 00:00:00',NULL,1),(26,15,-13785,'2013-12-26 00:00:00',NULL,1);
/*!40000 ALTER TABLE `finance_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_factor_type`
--

DROP TABLE IF EXISTS `finance_factor_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance_factor_type` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_factor_type`
--

LOCK TABLES `finance_factor_type` WRITE;
/*!40000 ALTER TABLE `finance_factor_type` DISABLE KEYS */;
INSERT INTO `finance_factor_type` VALUES (1,'هزینه ثبت نام'),(2,'هزینه صدور کارت');
/*!40000 ALTER TABLE `finance_factor_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_receive_pay_type`
--

DROP TABLE IF EXISTS `finance_receive_pay_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance_receive_pay_type` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_receive_pay_type`
--

LOCK TABLES `finance_receive_pay_type` WRITE;
/*!40000 ALTER TABLE `finance_receive_pay_type` DISABLE KEYS */;
INSERT INTO `finance_receive_pay_type` VALUES (1,'نقدی'),(2,'pos'),(3,'فیش بانکی'),(4,'پاس شدن چک');
/*!40000 ALTER TABLE `finance_receive_pay_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_receive_payment`
--

DROP TABLE IF EXISTS `finance_receive_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance_receive_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_date` datetime DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `account_bank_id` bigint(20) DEFAULT NULL,
  `account_person_id` bigint(20) DEFAULT NULL,
  `receive_pay_type_id` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_bank_id` (`account_bank_id`),
  KEY `receive_pay_type_id` (`receive_pay_type_id`),
  KEY `account_person_id` (`account_person_id`),
  CONSTRAINT `finance_receive_payment_ibfk_1` FOREIGN KEY (`account_bank_id`) REFERENCES `finance_account_bank` (`id`),
  CONSTRAINT `finance_receive_payment_ibfk_3` FOREIGN KEY (`receive_pay_type_id`) REFERENCES `finance_receive_pay_type` (`id`),
  CONSTRAINT `finance_receive_payment_ibfk_4` FOREIGN KEY (`account_person_id`) REFERENCES `finance_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_receive_payment`
--

LOCK TABLES `finance_receive_payment` WRITE;
/*!40000 ALTER TABLE `finance_receive_payment` DISABLE KEYS */;
INSERT INTO `finance_receive_payment` VALUES (1,'2013-09-01 13:37:02',-123,20,1,1,'بابت بدهکاری',NULL),(20,'2013-09-25 15:50:47',124,10,2,2,NULL,NULL),(21,'2013-09-06 07:55:31',1000,20,1,1,'بابت ثبت نام',NULL),(22,'2013-09-12 00:00:00',120000,20,11,1,'1234','123'),(23,'2013-09-12 00:00:00',120000,20,11,1,'1234','123'),(24,'2013-09-12 00:00:00',120000,20,11,1,'1234','123'),(25,'2013-09-12 00:00:00',120000,20,11,1,'1234','123'),(26,'2013-09-12 00:00:00',1234,20,13,1,'desc','code1'),(27,'2013-09-12 00:00:00',1234,20,11,1,'12','code1'),(28,'2013-09-12 00:00:00',123000,20,12,1,'desc','code'),(29,'2013-09-12 00:00:00',12,20,14,1,'desc','code'),(30,'2013-09-12 00:00:00',123,10,11,2,'desc','1234'),(31,'2013-09-12 00:00:00',124,20,11,1,'desc','1234'),(32,'2013-09-12 00:00:00',1234,10,13,2,'1234','1234'),(33,'2013-09-12 00:00:00',1234,20,13,1,'1234','1234'),(34,'2013-09-12 00:00:00',1234,20,12,1,'1234','1234'),(35,'2013-09-12 00:00:00',1234,10,12,2,'1234','1234'),(36,'2013-09-12 00:00:00',123,10,12,2,'1234','1234'),(37,'2013-09-12 00:00:00',123,10,12,2,'1234','1234'),(38,'2013-09-12 00:00:00',45,10,12,2,'1234','1234'),(39,'2013-09-12 00:00:00',46,20,12,1,'1234','1234'),(40,'2013-09-12 00:00:00',231,20,12,1,'123','123'),(41,'2013-09-12 00:00:00',1234,20,14,1,'1','123'),(42,'2013-09-12 00:00:00',21,10,14,2,'1','123'),(43,'2013-09-12 00:00:00',123,10,NULL,2,'1112','1233'),(44,'2013-09-13 00:00:00',120000,10,11,2,'desc','123'),(45,'2013-09-13 00:00:00',2123,20,11,1,'desd','desc'),(46,'2013-09-13 00:00:00',2123,10,14,2,'desd','desc'),(47,'2013-09-14 00:00:00',NULL,20,NULL,4,'check passed',NULL),(48,'2013-09-14 00:00:00',123,20,NULL,4,'check passed',NULL),(49,'2013-09-14 00:00:00',102,20,NULL,4,'check passed',NULL),(50,'2013-09-14 00:00:00',1234,20,11,1,'111','1234'),(51,'2013-09-14 00:00:00',12444,20,12,1,'111','122'),(52,'2013-09-14 00:00:00',12444,20,12,1,'111','122'),(53,'2013-09-14 00:00:00',66735,20,14,1,'111','122'),(54,'2013-09-15 00:00:00',10000,20,NULL,4,'check passed',NULL),(55,'2013-09-15 00:00:00',100,20,NULL,4,'check passed',NULL),(56,'2013-09-15 00:00:00',200,10,15,2,'desc','desc'),(57,'2013-09-15 00:00:00',5000,20,NULL,4,'check passed',NULL),(58,'2013-09-15 00:00:00',5000,20,15,1,'desc','desc'),(59,'2013-09-17 00:00:00',100,20,NULL,4,'check passed',NULL),(60,'2013-09-17 00:00:00',200,20,13,1,'desc','desc'),(61,'2013-09-18 00:00:00',10000,20,15,1,'1234','12345'),(62,'2013-09-18 00:00:00',200,20,11,1,'DESC','1234'),(63,'2013-09-20 00:00:00',200,20,11,1,'1','2'),(64,'2013-09-20 00:00:00',100,20,11,1,NULL,NULL),(65,'2013-09-20 00:00:00',100,20,11,1,'11','11'),(66,'2013-09-20 00:00:00',100,20,11,1,'11','11'),(67,'2013-09-20 00:00:00',100,20,11,1,'11','11'),(68,'2013-09-20 00:00:00',100,20,11,1,'11','11'),(69,'2013-09-20 00:00:00',100,20,11,1,'11','11'),(70,'2013-09-20 00:00:00',100,20,11,1,NULL,NULL),(71,'2013-09-20 00:00:00',12,20,17,1,'123','123'),(72,'2013-09-20 00:00:00',10000,20,11,1,'desc','1234'),(73,'2013-09-20 00:00:00',10000,20,11,1,'desc','1234'),(74,'2013-09-20 00:00:00',10000,20,11,1,'desc','1234'),(75,'2013-09-21 00:00:00',10000,20,16,1,'descc','ded'),(76,'2013-09-22 00:00:00',100,20,10,1,'111','111'),(77,'2013-09-22 00:00:00',80,20,17,1,'111','11'),(78,'2013-09-23 00:00:00',120,20,16,1,'1','1'),(79,'2013-09-23 00:00:00',100,20,17,1,'11','111'),(80,'2013-09-23 00:00:00',30,20,NULL,4,'check passed',NULL),(81,'2013-09-23 00:00:00',210,10,16,2,'1','1'),(82,'2013-09-28 00:00:00',200,20,13,1,'de','de'),(83,'2013-12-10 00:00:00',24,20,10,1,NULL,NULL),(84,'2013-12-19 00:00:00',40000,10,16,2,NULL,NULL),(85,'2013-12-20 00:00:00',40000,20,16,1,'desc','code'),(86,'2013-12-20 00:00:00',40000,20,16,1,'desc','desx'),(87,'2013-12-20 00:00:00',122,20,13,1,NULL,NULL),(88,'2013-12-20 00:00:00',120,10,17,2,NULL,'555555'),(89,'2013-12-20 00:00:00',10,10,17,2,NULL,NULL),(90,'2013-12-20 00:00:00',10,20,13,1,NULL,NULL),(91,'2013-12-20 00:00:00',12,10,12,2,NULL,NULL),(92,'2013-12-20 00:00:00',131,10,12,2,NULL,NULL),(93,'2013-12-20 00:00:00',160,20,18,1,NULL,NULL),(94,'2013-12-21 00:00:00',422,20,10,1,NULL,NULL),(95,'2013-12-21 00:00:00',422,10,14,2,NULL,NULL),(96,'2013-12-21 00:00:00',5335,20,11,1,NULL,NULL),(97,'2013-12-26 00:00:00',13785,10,15,2,NULL,NULL);
/*!40000 ALTER TABLE `finance_receive_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `receive_pay_v`
--

DROP TABLE IF EXISTS `receive_pay_v`;
/*!50001 DROP VIEW IF EXISTS `receive_pay_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `receive_pay_v` (
  `id` bigint(20),
  `event_date` datetime,
  `amount` bigint(20),
  `account_bank_id` bigint(20),
  `account_person_id` bigint(20),
  `receive_pay_type_id` bigint(20),
  `description` varchar(255),
  `code` varchar(255),
  `b_a_name` varchar(255),
  `bank_id` bigint(20),
  `first_amount` bigint(20),
  `is_cash` bit(1),
  `bank_name` varchar(255),
  `account_name` varchar(200),
  `phone` varchar(20),
  `person_name` varchar(250),
  `person_mobile` varchar(20),
  `fax` varchar(20),
  `create_date` datetime,
  `address` varchar(255),
  `fisrt_payable` bigint(20),
  `rec_pay_type_name` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `reg_all_pays`
--

DROP TABLE IF EXISTS `reg_all_pays`;
/*!50001 DROP VIEW IF EXISTS `reg_all_pays`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `reg_all_pays` (
  `event_date` datetime,
  `amount` bigint(20),
  `id` bigint(20),
  `reg_pay_date` datetime,
  `check_id` bigint(20),
  `reg_id` bigint(20),
  `check_amount` bigint(20),
  `number` varchar(20)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `reg_check_v`
--

DROP TABLE IF EXISTS `reg_check_v`;
/*!50001 DROP VIEW IF EXISTS `reg_check_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `reg_check_v` (
  `id` bigint(20),
  `create_date` datetime,
  `reg_id` bigint(20),
  `finance_check_id` bigint(20),
  `created_date` datetime,
  `number` varchar(20),
  `amount` bigint(20),
  `for_how` varchar(255),
  `check_date` date,
  `bank_id` bigint(20),
  `bank_branch` varchar(255),
  `description` varchar(255),
  `status_id` bigint(20),
  `account_id` bigint(20),
  `bank_account_id` bigint(20),
  `bank_name` varchar(255),
  `status_name` varchar(255),
  `account_name` varchar(200),
  `phone` varchar(20),
  `person_name` varchar(250),
  `person_mobile` varchar(20),
  `fax` varchar(20),
  `b_acc_create_date` datetime,
  `address` varchar(255),
  `fisrt_payable` bigint(20),
  `bank_account_name` varchar(255),
  `bank_account_b_id` bigint(20),
  `first_amount` bigint(20),
  `is_cash` bit(1),
  `bank_account_b_name` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reg_field`
--

DROP TABLE IF EXISTS `reg_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_field` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_field`
--

LOCK TABLES `reg_field` WRITE;
/*!40000 ALTER TABLE `reg_field` DISABLE KEYS */;
INSERT INTO `reg_field` VALUES (1,'ریاضی'),(2,'تجربی'),(3,'انسانی'),(4,'گرافیک'),(5,'نقشه کشی');
/*!40000 ALTER TABLE `reg_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_identifier_code`
--

DROP TABLE IF EXISTS `reg_identifier_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_identifier_code` (
  `id` int(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_identifier_code`
--

LOCK TABLES `reg_identifier_code` WRITE;
/*!40000 ALTER TABLE `reg_identifier_code` DISABLE KEYS */;
INSERT INTO `reg_identifier_code` VALUES (0,NULL),(1,'الف'),(2,'ب'),(3,'پ'),(4,'ت'),(5,'ث'),(6,'ج'),(7,'چ'),(8,'ح'),(9,'خ'),(10,'د'),(11,'ذ'),(12,'ر'),(13,'ز'),(14,'ژ'),(15,'س'),(16,'ش'),(17,'ص'),(18,'ض'),(19,'ط'),(20,'ظ'),(21,'ع'),(22,'غ'),(23,'ف'),(24,'ق'),(25,'ک'),(26,'گ'),(27,'ل'),(28,'م'),(29,'ن'),(30,'و'),(31,'ه'),(32,'ی'),(33,'یک'),(34,'دو'),(35,'سه'),(36,'چهار'),(37,'پنج'),(38,'شش'),(39,'هفت'),(40,'هشت'),(41,'نه');
/*!40000 ALTER TABLE `reg_identifier_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_level`
--

DROP TABLE IF EXISTS `reg_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_level` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_level`
--

LOCK TABLES `reg_level` WRITE;
/*!40000 ALTER TABLE `reg_level` DISABLE KEYS */;
INSERT INTO `reg_level` VALUES (1,'متوسطه'),(2,'راهنمایی'),(3,'کارودانش'),(4,'پیش دانشگاهی');
/*!40000 ALTER TABLE `reg_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_organization`
--

DROP TABLE IF EXISTS `reg_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_organization` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_organization`
--

LOCK TABLES `reg_organization` WRITE;
/*!40000 ALTER TABLE `reg_organization` DISABLE KEYS */;
INSERT INTO `reg_organization` VALUES (1,'مرکزی'),(2,'دهنو');
/*!40000 ALTER TABLE `reg_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `reg_pay_rec_v`
--

DROP TABLE IF EXISTS `reg_pay_rec_v`;
/*!50001 DROP VIEW IF EXISTS `reg_pay_rec_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `reg_pay_rec_v` (
  `id` bigint(20),
  `reg_pay_date` datetime,
  `reg_id` bigint(20),
  `finance_id` bigint(20),
  `next_payment` date,
  `event_date` datetime,
  `amount` bigint(20),
  `account_bank_id` bigint(20),
  `account_person_id` bigint(20),
  `receive_pay_type_id` bigint(20),
  `description` varchar(255),
  `code` varchar(255),
  `b_a_name` varchar(255),
  `bank_id` bigint(20),
  `first_amount` bigint(20),
  `is_cash` bit(1),
  `bank_name` varchar(255),
  `account_name` varchar(200),
  `phone` varchar(20),
  `person_name` varchar(250),
  `person_mobile` varchar(20),
  `fax` varchar(20),
  `create_date` datetime,
  `address` varchar(255),
  `fisrt_payable` bigint(20),
  `rec_pay_type_name` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reg_receivable`
--

DROP TABLE IF EXISTS `reg_receivable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_receivable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `finance_factor_id` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `reg_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_factor_id` (`finance_factor_id`),
  KEY `reg_id` (`reg_id`),
  CONSTRAINT `reg_receivable_ibfk_1` FOREIGN KEY (`finance_factor_id`) REFERENCES `finance_factor` (`id`),
  CONSTRAINT `reg_receivable_ibfk_2` FOREIGN KEY (`reg_id`) REFERENCES `reg_registration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_receivable`
--

LOCK TABLES `reg_receivable` WRITE;
/*!40000 ALTER TABLE `reg_receivable` DISABLE KEYS */;
INSERT INTO `reg_receivable` VALUES (1,4,'2013-09-11 00:00:00',2),(2,5,'2013-09-11 00:00:00',3),(3,6,'2013-09-11 00:00:00',4),(4,7,'2013-09-12 00:00:00',5),(5,8,'2013-09-12 00:00:00',6),(6,9,'2013-09-12 00:00:00',7),(7,10,'2013-09-12 00:00:00',8),(8,11,'2013-09-12 00:00:00',9),(9,12,'2013-09-15 00:00:00',10),(10,13,'2013-09-19 00:00:00',11),(11,14,'2013-09-20 00:00:00',12),(12,15,'2013-09-20 00:00:00',13),(13,16,'2013-09-21 00:00:00',14),(14,17,'2013-09-23 00:00:00',15),(15,18,'2013-09-23 00:00:00',16),(16,19,'2013-09-23 00:00:00',17),(17,20,'2013-09-28 00:00:00',18),(18,21,'2013-12-19 00:00:00',19),(19,22,'2013-12-20 00:00:00',20),(20,23,'2013-12-21 00:00:00',21),(21,24,'2013-12-21 00:00:00',22),(22,25,'2013-12-21 00:00:00',23),(23,26,'2013-12-26 00:00:00',24);
/*!40000 ALTER TABLE `reg_receivable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_reg_check`
--

DROP TABLE IF EXISTS `reg_reg_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_reg_check` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `reg_id` bigint(20) DEFAULT NULL,
  `finance_check_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reg_id` (`reg_id`),
  KEY `finance_check_id` (`finance_check_id`),
  CONSTRAINT `reg_reg_check_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `reg_registration` (`id`),
  CONSTRAINT `reg_reg_check_ibfk_2` FOREIGN KEY (`finance_check_id`) REFERENCES `finance_check` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_reg_check`
--

LOCK TABLES `reg_reg_check` WRITE;
/*!40000 ALTER TABLE `reg_reg_check` DISABLE KEYS */;
INSERT INTO `reg_reg_check` VALUES (1,'2013-09-10 20:48:54',1,1),(2,'2013-09-13 00:00:00',7,3),(3,'2013-09-13 00:00:00',9,4),(4,'2013-09-13 00:00:00',7,5),(5,'2013-09-14 00:00:00',8,6),(6,'2013-09-14 00:00:00',6,7),(7,'2013-09-14 00:00:00',9,8),(8,'2013-09-14 00:00:00',9,9),(9,'2013-09-15 00:00:00',6,10),(10,'2013-09-15 00:00:00',7,11),(11,'2013-09-15 00:00:00',7,12),(12,'2013-09-15 00:00:00',7,13),(13,'2013-09-15 00:00:00',10,14),(14,'2013-09-15 00:00:00',10,15),(15,'2013-09-17 00:00:00',6,16),(16,'2013-09-20 00:00:00',7,17),(17,'2013-09-20 00:00:00',12,18),(18,'2013-09-20 00:00:00',3,19),(19,'2013-09-21 00:00:00',14,20),(20,'2013-09-22 00:00:00',11,21),(21,'2013-09-22 00:00:00',12,22),(22,'2013-09-23 00:00:00',16,23),(23,'2013-09-28 00:00:00',18,24);
/*!40000 ALTER TABLE `reg_reg_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_reg_payment`
--

DROP TABLE IF EXISTS `reg_reg_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_reg_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `reg_id` bigint(20) DEFAULT NULL,
  `finance_id` bigint(20) DEFAULT NULL,
  `next_payment` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reg_id` (`reg_id`),
  KEY `finance_id` (`finance_id`),
  CONSTRAINT `reg_reg_payment_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `reg_registration` (`id`),
  CONSTRAINT `reg_reg_payment_ibfk_2` FOREIGN KEY (`finance_id`) REFERENCES `finance_receive_payment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_reg_payment`
--

LOCK TABLES `reg_reg_payment` WRITE;
/*!40000 ALTER TABLE `reg_reg_payment` DISABLE KEYS */;
INSERT INTO `reg_reg_payment` VALUES (1,'2013-09-27 09:59:51',1,20,'2013-09-27'),(2,'2013-09-12 00:00:00',9,29,'2013-09-10'),(3,'2013-09-12 00:00:00',7,30,'2013-09-11'),(4,'2013-09-12 00:00:00',7,31,'2013-09-11'),(5,'2013-09-12 00:00:00',6,32,'2013-09-12'),(6,'2013-09-12 00:00:00',6,33,'2013-09-12'),(7,'2013-09-12 00:00:00',8,34,'2013-09-12'),(8,'2013-09-12 00:00:00',8,35,'2013-09-12'),(9,'2013-09-12 00:00:00',8,36,'2013-09-12'),(10,'2013-09-12 00:00:00',8,37,'2013-09-24'),(11,'2013-09-12 00:00:00',8,38,'2013-09-24'),(12,'2013-09-12 00:00:00',8,39,'2013-09-24'),(13,'2013-09-12 00:00:00',8,40,'2013-09-10'),(14,'2013-09-12 00:00:00',9,41,'2013-09-04'),(15,'2013-09-12 00:00:00',9,42,'2013-09-04'),(16,'2013-09-12 00:00:00',NULL,43,'2013-09-11'),(17,'2013-09-13 00:00:00',7,44,'2013-09-19'),(18,'2013-09-13 00:00:00',7,45,'2013-09-25'),(19,'2013-09-13 00:00:00',9,46,'2013-09-25'),(20,'2013-09-14 00:00:00',7,50,'2013-10-01'),(21,'2013-09-14 00:00:00',8,51,'2013-09-18'),(22,'2013-09-14 00:00:00',8,52,'2013-09-18'),(23,'2013-09-14 00:00:00',9,53,'2013-09-18'),(24,'2013-09-15 00:00:00',10,56,'2013-09-14'),(25,'2013-09-15 00:00:00',10,58,'2013-09-14'),(26,'2013-09-17 00:00:00',6,60,'2013-09-17'),(27,'2013-09-18 00:00:00',10,61,'2013-09-24'),(28,'2013-09-18 00:00:00',7,62,'2013-09-23'),(29,'2013-09-20 00:00:00',7,63,'2013-09-17'),(30,'2013-09-20 00:00:00',7,64,'2013-09-17'),(31,'2013-09-20 00:00:00',7,65,'2013-09-17'),(32,'2013-09-20 00:00:00',7,66,'2013-09-17'),(33,'2013-09-20 00:00:00',7,67,'2013-09-17'),(34,'2013-09-20 00:00:00',7,68,'2013-09-17'),(35,'2013-09-20 00:00:00',7,69,'2013-09-17'),(36,'2013-09-20 00:00:00',12,71,'2013-09-17'),(37,'2013-09-20 00:00:00',5,72,'2013-09-18'),(38,'2013-09-20 00:00:00',5,73,'2013-09-18'),(39,'2013-09-20 00:00:00',5,74,'2013-09-18'),(40,'2013-09-21 00:00:00',14,75,'2013-09-21'),(41,'2013-09-22 00:00:00',11,76,'2013-10-20'),(42,'2013-09-22 00:00:00',12,77,'2013-10-01'),(43,'2013-09-23 00:00:00',15,78,'2013-09-29'),(44,'2013-09-23 00:00:00',16,79,'2013-10-07'),(45,'2013-09-23 00:00:00',17,81,'2013-10-06'),(46,'2013-09-28 00:00:00',18,82,'2013-10-07'),(47,'2013-12-10 00:00:00',11,83,'2013-12-16'),(48,'2013-12-20 00:00:00',14,86,NULL),(49,'2013-12-20 00:00:00',3,87,NULL),(50,'2013-12-20 00:00:00',13,88,NULL),(51,'2013-12-20 00:00:00',12,89,NULL),(52,'2013-12-20 00:00:00',18,90,NULL),(53,'2013-12-20 00:00:00',4,91,NULL),(54,'2013-12-20 00:00:00',19,92,NULL),(55,'2013-12-20 00:00:00',20,93,NULL),(56,'2013-12-21 00:00:00',21,94,NULL),(57,'2013-12-21 00:00:00',22,95,NULL),(58,'2013-12-21 00:00:00',23,96,NULL),(59,'2013-12-26 00:00:00',24,97,'2014-01-13');
/*!40000 ALTER TABLE `reg_reg_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_registration`
--

DROP TABLE IF EXISTS `reg_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reg_date` datetime DEFAULT NULL,
  `st_id` bigint(20) DEFAULT NULL,
  `field_id` bigint(20) DEFAULT NULL,
  `term_id` bigint(20) DEFAULT NULL,
  `level_id` bigint(20) DEFAULT NULL,
  `theory_units` int(11) DEFAULT NULL,
  `actional_units` int(11) DEFAULT NULL,
  `fix_salary` bigint(20) DEFAULT NULL,
  `theory_salary` bigint(20) DEFAULT NULL,
  `actional_salary` bigint(20) DEFAULT NULL,
  `other_salary_comment` varchar(255) DEFAULT NULL,
  `other_salary_amount` bigint(20) DEFAULT NULL,
  `total_salary` bigint(20) DEFAULT NULL,
  `off_amount` bigint(20) DEFAULT NULL,
  `off_comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `st_id` (`st_id`),
  KEY `field_id` (`field_id`),
  KEY `term_id` (`term_id`),
  KEY `level_id` (`level_id`),
  CONSTRAINT `reg_registration_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `reg_student` (`student_code`),
  CONSTRAINT `reg_registration_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `reg_field` (`id`),
  CONSTRAINT `reg_registration_ibfk_3` FOREIGN KEY (`term_id`) REFERENCES `reg_term` (`id`),
  CONSTRAINT `reg_registration_ibfk_4` FOREIGN KEY (`level_id`) REFERENCES `reg_level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_registration`
--

LOCK TABLES `reg_registration` WRITE;
/*!40000 ALTER TABLE `reg_registration` DISABLE KEYS */;
INSERT INTO `reg_registration` VALUES (1,'2013-09-04 16:52:11',123,1,9101,NULL,1,1,0,0,0,'1',0,0,NULL,NULL),(2,'2013-09-11 00:00:00',1234518,1,9101,1,1,2,10000,20000,20000,'desc',1,70001,0,'desc'),(3,'2013-09-11 00:00:00',222222,1,9101,1,2,1,10000,20000,20000,'1234',123,70122,1,'reson'),(4,'2013-09-11 00:00:00',1235,1,9101,1,1,1,10,1,1,'1',1,12,1,'1'),(5,'2013-09-12 00:00:00',1234,1,9101,1,1,0,10000,20000,20000,'12',12,30000,12,'111'),(6,'2013-09-12 00:00:00',222222,3,9102,3,2,1,12,1,12,'desc',0,14,12,'0'),(7,'2013-09-12 00:00:00',1234,3,9102,3,1,1,10,10,10,'1',1,19,12,'12'),(8,'2013-09-12 00:00:00',1235,1,9102,1,1,0,0,123,123,'1',1,124,0,'1'),(9,'2013-09-12 00:00:00',1234518,1,9102,1,1,1,0,1,123,'desc',0,124,0,'de'),(10,'2013-09-15 00:00:00',12349,4,9102,4,1,1,10000,100,100,'desc',0,10200,0,'desc'),(11,'2013-09-19 00:00:00',123,1,9102,1,1,1,100,12,12,'des',0,124,0,'des'),(12,'2013-09-20 00:00:00',567811,1,9102,1,1,1,100,1,1,'1',0,102,0,'1'),(13,'2013-09-20 00:00:00',567811,1,9101,1,1,1,100,10,10,'0',0,120,0,'0'),(14,'2013-09-21 00:00:00',1111119,1,9101,1,1,1,10000,20000,20000,'0',0,50000,0,'0'),(15,'2013-09-23 00:00:00',1111119,1,9102,1,0,0,120,13,13,'desc',0,120,0,'desc'),(16,'2013-09-23 00:00:00',567811,1,9150,1,1,2,100,10,10,'0',0,130,0,'11'),(17,'2013-09-23 00:00:00',1111119,2,9150,2,10,1,100,10,10,'0',0,210,0,'0'),(18,'2013-09-28 00:00:00',222222,1,9150,1,1,1,100,10,100,'des',0,210,0,'0'),(19,'2013-12-19 00:00:00',1235,1,9150,1,2,1,100,10,10,'11',1,131,0,'desc'),(20,'2013-12-20 00:00:00',1222223,2,9150,2,3,4,100,10,10,'desc',0,160,10,'1'),(21,'2013-12-21 00:00:00',123,1,9150,1,18,2,100,10,10,NULL,122,422,0,NULL),(22,'2013-12-21 00:00:00',1234518,1,9150,1,18,2,100,10,10,'desc',122,422,0,'11'),(23,'2013-12-21 00:00:00',1234,1,9150,1,1,67,100,10,10,'desc',4555,5335,0,NULL),(24,'2013-12-26 00:00:00',12349,1,9150,1,122,11,123,111,11,'1',0,13785,1,'1');
/*!40000 ALTER TABLE `reg_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_salary_param`
--

DROP TABLE IF EXISTS `reg_salary_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_salary_param` (
  `term_id` bigint(20) NOT NULL DEFAULT '0',
  `level_id` bigint(20) NOT NULL DEFAULT '0',
  `fix_salary` bigint(20) DEFAULT NULL,
  `action_salary` bigint(20) DEFAULT NULL,
  `theory_salary` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`term_id`,`level_id`),
  KEY `level_id` (`level_id`),
  CONSTRAINT `reg_salary_param_ibfk_1` FOREIGN KEY (`term_id`) REFERENCES `reg_term` (`id`),
  CONSTRAINT `reg_salary_param_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `reg_level` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_salary_param`
--

LOCK TABLES `reg_salary_param` WRITE;
/*!40000 ALTER TABLE `reg_salary_param` DISABLE KEYS */;
INSERT INTO `reg_salary_param` VALUES (9101,1,10000,20000,20000),(9101,2,5000,25000,180000),(9101,3,128000,120000,120000),(9101,4,100,20,30),(9102,1,90,8,7),(9102,2,110,11,111),(9102,3,120,13,13),(9102,4,120,10,10),(9150,1,100,10,10);
/*!40000 ALTER TABLE `reg_salary_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_student`
--

DROP TABLE IF EXISTS `reg_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_student` (
  `name` varchar(255) DEFAULT NULL,
  `famili` varchar(255) DEFAULT NULL,
  `national_code` int(11) DEFAULT NULL,
  `identifier_code` varchar(255) DEFAULT NULL,
  `identifier_serial` varchar(255) DEFAULT NULL,
  `identifier_char` int(255) DEFAULT NULL,
  `student_code` bigint(20) NOT NULL DEFAULT '0',
  `father_name` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `org_unit_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `level_id_last` bigint(20) DEFAULT NULL,
  `field_id_last` bigint(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `archive_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_code`),
  KEY `status_id` (`status_id`),
  KEY `org_unit_id` (`org_unit_id`),
  KEY `level_id_last` (`level_id_last`),
  KEY `field_id_last` (`field_id_last`),
  CONSTRAINT `reg_student_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `reg_student_status` (`id`),
  CONSTRAINT `reg_student_ibfk_3` FOREIGN KEY (`org_unit_id`) REFERENCES `reg_organization` (`id`),
  CONSTRAINT `reg_student_ibfk_4` FOREIGN KEY (`level_id_last`) REFERENCES `reg_level` (`id`),
  CONSTRAINT `reg_student_ibfk_5` FOREIGN KEY (`field_id_last`) REFERENCES `reg_field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_student`
--

LOCK TABLES `reg_student` WRITE;
/*!40000 ALTER TABLE `reg_student` DISABLE KEYS */;
INSERT INTO `reg_student` VALUES ('حامد','اسماعیلی',1285177886,'9898','232344',9898,123,'حسن','2013-09-24','desc',2,2,'2013-09-03 00:00:00','2013-09-21 00:00:00',1,1,'اصفهان خیابان امام خمینی ','0937278777','441234','راکد الف 123'),('حمید','سمیعی',1234555,'9898','232344',9898,1234,'رضا','2013-09-03','desc',1,2,'2013-09-03 00:00:00','2013-09-24 00:00:00',3,2,'اصفهان میدان آزادی','093798009','4412345',NULL),('علی اکبر','هاشمی',1234555,'9898','232344',9898,1235,'fater','2013-09-04','desc2',2,2,'2013-09-03 00:00:00','2013-09-22 00:00:00',NULL,NULL,'اصفهان میدان استقلال','093798009','4412345','alef jim 123'),('اصغر','شجاعی',12345,'212121222','1234',9,12349,'خرمشاه','2013-09-24','desc',1,2,'2013-09-15 00:00:00','2013-09-15 00:00:00',NULL,NULL,'تیییی',NULL,'031133128099','1233'),('علی','جودی',1234,'12345678','22222',2,222222,'جمال','2013-09-18','123',2,2,'2013-09-10 00:00:00','2013-09-14 00:00:00',NULL,NULL,'خمینی شهر 2','091212222','3312798','1222'),('علی اکبر','هاشمی',87878,'1234','5678',11,567811,'اسدالله','2013-09-23','desc',1,1,'2013-09-20 00:00:00','2013-09-20 00:00:00',NULL,NULL,'تهرلن',NULL,'111','111'),('حسین','کریمی',4638,'123455','111111',9,1111119,'اصغر','2013-09-25','desc',1,1,'2013-09-20 00:00:00','2013-09-20 00:00:00',NULL,NULL,'اسس',NULL,'311','11'),('حسین','محمدی',12,'1234567890','122222',3,1222223,'حسنعلی','1989-12-06','desc',1,1,'2013-12-20 00:00:00','2013-12-20 00:00:00',NULL,NULL,'تهران',NULL,'3113312798','123_12'),('اصغر','طالب زاده',212123,'12345678','12345',18,1234518,'غلامعلی','2013-09-23','211',2,2,'2013-09-10 00:00:00','2013-09-14 00:00:00',NULL,NULL,'تهران میدان آزادای','09143222','12345','12123');
/*!40000 ALTER TABLE `reg_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_student_account`
--

DROP TABLE IF EXISTS `reg_student_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_student_account` (
  `st_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acc_id` bigint(20) NOT NULL DEFAULT '0',
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`st_id`,`acc_id`),
  KEY `acc_id` (`acc_id`),
  CONSTRAINT `reg_student_account_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `reg_student` (`student_code`),
  CONSTRAINT `reg_student_account_ibfk_2` FOREIGN KEY (`acc_id`) REFERENCES `finance_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1234519 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_student_account`
--

LOCK TABLES `reg_student_account` WRITE;
/*!40000 ALTER TABLE `reg_student_account` DISABLE KEYS */;
INSERT INTO `reg_student_account` VALUES (123,10,'2013-09-15 10:52:47'),(1234,11,'2013-09-03 00:00:00'),(1235,12,'2013-09-03 00:00:00'),(12349,15,'2013-09-15 00:00:00'),(222222,13,'2013-09-10 00:00:00'),(567811,17,'2013-09-20 00:00:00'),(1111119,16,'2013-09-20 00:00:00'),(1222223,18,'2013-12-20 00:00:00'),(1234518,14,'2013-09-10 00:00:00');
/*!40000 ALTER TABLE `reg_student_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_student_status`
--

DROP TABLE IF EXISTS `reg_student_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_student_status` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_student_status`
--

LOCK TABLES `reg_student_status` WRITE;
/*!40000 ALTER TABLE `reg_student_status` DISABLE KEYS */;
INSERT INTO `reg_student_status` VALUES (1,'فعال'),(2,'راکد');
/*!40000 ALTER TABLE `reg_student_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_term`
--

DROP TABLE IF EXISTS `reg_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_term` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `is_current` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9151 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_term`
--

LOCK TABLES `reg_term` WRITE;
/*!40000 ALTER TABLE `reg_term` DISABLE KEYS */;
INSERT INTO `reg_term` VALUES (9101,'مهر 91','2013-09-18','2013-09-18','\0'),(9102,'تابستان 91','2013-09-18','2013-09-18','\0'),(9150,'بهار 97','2013-09-22','2013-09-22','');
/*!40000 ALTER TABLE `reg_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `registration_view`
--

DROP TABLE IF EXISTS `registration_view`;
/*!50001 DROP VIEW IF EXISTS `registration_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `registration_view` (
  `reg_date` datetime,
  `theory_units` int(11),
  `actional_units` int(11),
  `fix_salary` bigint(20),
  `theory_salary` bigint(20),
  `actional_salary` bigint(20),
  `other_salary_comment` varchar(255),
  `other_salary_amount` bigint(20),
  `total_salary` bigint(20),
  `off_amount` bigint(20),
  `off_comment` varchar(255),
  `term_name` varchar(255),
  `field_name` varchar(255),
  `name` varchar(255),
  `famili` varchar(255),
  `national_code` int(11),
  `identifier_code` varchar(255),
  `identifier_serial` varchar(255),
  `identifier_char` int(255),
  `student_code` bigint(20),
  `father_name` varchar(255),
  `date_of_birth` date,
  `description` varchar(255),
  `address` varchar(255),
  `mobile` varchar(255),
  `phone` varchar(255),
  `archive_code` varchar(255),
  `org_name` varchar(255),
  `id` bigint(20)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `st_current_term_v`
--

DROP TABLE IF EXISTS `st_current_term_v`;
/*!50001 DROP VIEW IF EXISTS `st_current_term_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `st_current_term_v` (
  `name` varchar(255),
  `famili` varchar(255),
  `student_code` bigint(20),
  `status_id` bigint(20),
  `org_unit_id` bigint(20),
  `level_id_last` bigint(20),
  `field_id_last` bigint(20),
  `field_name` varchar(255),
  `level_name` varchar(255),
  `org_name` varchar(255),
  `status_name` varchar(255),
  `national_code` int(11),
  `identifier_code` varchar(255),
  `identifier_serial` varchar(255),
  `identifier_char` int(255),
  `father_name` varchar(255),
  `date_of_birth` date,
  `description` varchar(255),
  `created_date` datetime,
  `last_modified` datetime,
  `address` varchar(255),
  `mobile` varchar(255),
  `phone` varchar(255),
  `archive_code` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `student_view`
--

DROP TABLE IF EXISTS `student_view`;
/*!50001 DROP VIEW IF EXISTS `student_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_view` (
  `name` varchar(255),
  `famili` varchar(255),
  `student_code` bigint(20),
  `status_id` bigint(20),
  `org_unit_id` bigint(20),
  `level_id_last` bigint(20),
  `field_id_last` bigint(20),
  `field_name` varchar(255),
  `level_name` varchar(255),
  `org_name` varchar(255),
  `status_name` varchar(255),
  `national_code` int(11),
  `identifier_code` varchar(255),
  `identifier_serial` varchar(255),
  `identifier_char` int(255),
  `father_name` varchar(255),
  `date_of_birth` date,
  `description` varchar(255),
  `created_date` datetime,
  `last_modified` datetime,
  `address` varchar(255),
  `mobile` varchar(255),
  `phone` varchar(255),
  `archive_code` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `test_table`
--

DROP TABLE IF EXISTS `test_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_table` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_table`
--

LOCK TABLES `test_table` WRITE;
/*!40000 ALTER TABLE `test_table` DISABLE KEYS */;
INSERT INTO `test_table` VALUES (1,100),(2,200);
/*!40000 ALTER TABLE `test_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `account_student_view`
--

/*!50001 DROP TABLE `account_student_view`*/;
/*!50001 DROP VIEW IF EXISTS `account_student_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `account_student_view` AS select `reg_student_account`.`st_id` AS `st_id`,`reg_student_account`.`acc_id` AS `acc_id`,`reg_student_account`.`create_date` AS `create_date`,`finance_account`.`name` AS `name`,`finance_account`.`person_name` AS `person_name`,`finance_account`.`person_mobile` AS `person_mobile`,`finance_account`.`fax` AS `fax`,`finance_account`.`address` AS `address`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`finance_account`.`phone` AS `phone`,`finance_account`.`create_date` AS `acc_create_date`,`reg_student`.`name` AS `st_name`,`reg_student`.`famili` AS `st_famili`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`identifier_serial` AS `identifier_serial`,`reg_student`.`identifier_char` AS `identifier_char`,`reg_student`.`student_code` AS `student_code`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `description`,`reg_student`.`status_id` AS `status_id`,`reg_student`.`org_unit_id` AS `org_unit_id`,`reg_student`.`created_date` AS `created_date`,`reg_student`.`last_modified` AS `last_modified`,`reg_student`.`level_id_last` AS `level_id_last`,`reg_student`.`field_id_last` AS `field_id_last`,`reg_student`.`address` AS `st_address`,`reg_student`.`mobile` AS `st_mobile`,`reg_student`.`phone` AS `st_phone`,`reg_student`.`archive_code` AS `archive_code` from ((`reg_student_account` join `finance_account` on((`reg_student_account`.`acc_id` = `finance_account`.`id`))) join `reg_student` on((`reg_student_account`.`st_id` = `reg_student`.`student_code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bank_account_v`
--

/*!50001 DROP TABLE `bank_account_v`*/;
/*!50001 DROP VIEW IF EXISTS `bank_account_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bank_account_v` AS select `finance_account_bank`.`id` AS `id`,`finance_account_bank`.`name` AS `name`,`finance_account_bank`.`bank_id` AS `bank_id`,`finance_account_bank`.`first_amount` AS `first_amount`,`finance_account_bank`.`is_cash` AS `is_cash`,`finance_bank`.`name` AS `bank_name` from (`finance_account_bank` left join `finance_bank` on((`finance_account_bank`.`bank_id` = `finance_bank`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `check_v`
--

/*!50001 DROP TABLE `check_v`*/;
/*!50001 DROP VIEW IF EXISTS `check_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `check_v` AS select `finance_check`.`id` AS `id`,`finance_check`.`created_date` AS `created_date`,`finance_check`.`number` AS `number`,`finance_check`.`amount` AS `amount`,`finance_check`.`for_how` AS `for_how`,`finance_check`.`check_date` AS `check_date`,`finance_check`.`bank_id` AS `bank_id`,`finance_check`.`bank_branch` AS `bank_branch`,`finance_check`.`description` AS `description`,`finance_check`.`status_id` AS `status_id`,`finance_check`.`account_id` AS `account_id`,`finance_check`.`bank_account_id` AS `bank_account_id`,`finance_bank`.`name` AS `bank_name`,`finance_check_status`.`name` AS `status_name`,`finance_account`.`name` AS `account_name`,`finance_account`.`phone` AS `phone`,`finance_account`.`person_name` AS `person_name`,`finance_account`.`person_mobile` AS `person_mobile`,`finance_account`.`fax` AS `fax`,`finance_account`.`create_date` AS `create_date`,`finance_account`.`address` AS `address`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`bank_account_v`.`name` AS `bank_account_name`,`bank_account_v`.`bank_id` AS `bank_account_b_id`,`bank_account_v`.`first_amount` AS `first_amount`,`bank_account_v`.`is_cash` AS `is_cash`,`bank_account_v`.`bank_name` AS `bank_account_b_name` from ((((`finance_check` left join `finance_bank` on((`finance_check`.`bank_id` = `finance_bank`.`id`))) left join `finance_check_status` on((`finance_check`.`status_id` = `finance_check_status`.`id`))) left join `finance_account` on((`finance_check`.`account_id` = `finance_account`.`id`))) left join `bank_account_v` on((`finance_check`.`bank_account_id` = `bank_account_v`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `receive_pay_v`
--

/*!50001 DROP TABLE `receive_pay_v`*/;
/*!50001 DROP VIEW IF EXISTS `receive_pay_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `receive_pay_v` AS select `finance_receive_payment`.`id` AS `id`,`finance_receive_payment`.`event_date` AS `event_date`,`finance_receive_payment`.`amount` AS `amount`,`finance_receive_payment`.`account_bank_id` AS `account_bank_id`,`finance_receive_payment`.`account_person_id` AS `account_person_id`,`finance_receive_payment`.`receive_pay_type_id` AS `receive_pay_type_id`,`finance_receive_payment`.`description` AS `description`,`finance_receive_payment`.`code` AS `code`,`bank_account_v`.`name` AS `b_a_name`,`bank_account_v`.`bank_id` AS `bank_id`,`bank_account_v`.`first_amount` AS `first_amount`,`bank_account_v`.`is_cash` AS `is_cash`,`bank_account_v`.`bank_name` AS `bank_name`,`finance_account`.`name` AS `account_name`,`finance_account`.`phone` AS `phone`,`finance_account`.`person_name` AS `person_name`,`finance_account`.`person_mobile` AS `person_mobile`,`finance_account`.`fax` AS `fax`,`finance_account`.`create_date` AS `create_date`,`finance_account`.`address` AS `address`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`finance_receive_pay_type`.`name` AS `rec_pay_type_name` from (((`finance_receive_payment` join `bank_account_v` on((`finance_receive_payment`.`account_bank_id` = `bank_account_v`.`id`))) left join `finance_account` on((`finance_receive_payment`.`account_person_id` = `finance_account`.`id`))) join `finance_receive_pay_type` on((`finance_receive_payment`.`receive_pay_type_id` = `finance_receive_pay_type`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reg_all_pays`
--

/*!50001 DROP TABLE `reg_all_pays`*/;
/*!50001 DROP VIEW IF EXISTS `reg_all_pays`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reg_all_pays` AS select `reg_pay_rec_v`.`event_date` AS `event_date`,`reg_pay_rec_v`.`amount` AS `amount`,`reg_pay_rec_v`.`id` AS `id`,`reg_pay_rec_v`.`reg_pay_date` AS `reg_pay_date`,`reg_check_v`.`id` AS `check_id`,`reg_check_v`.`reg_id` AS `reg_id`,`reg_check_v`.`amount` AS `check_amount`,`reg_check_v`.`number` AS `number` from (`reg_check_v` join `reg_pay_rec_v` on((`reg_check_v`.`reg_id` = `reg_pay_rec_v`.`reg_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reg_check_v`
--

/*!50001 DROP TABLE `reg_check_v`*/;
/*!50001 DROP VIEW IF EXISTS `reg_check_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reg_check_v` AS select `reg_reg_check`.`id` AS `id`,`reg_reg_check`.`create_date` AS `create_date`,`reg_reg_check`.`reg_id` AS `reg_id`,`reg_reg_check`.`finance_check_id` AS `finance_check_id`,`check_v`.`created_date` AS `created_date`,`check_v`.`number` AS `number`,`check_v`.`amount` AS `amount`,`check_v`.`for_how` AS `for_how`,`check_v`.`check_date` AS `check_date`,`check_v`.`bank_id` AS `bank_id`,`check_v`.`bank_branch` AS `bank_branch`,`check_v`.`description` AS `description`,`check_v`.`status_id` AS `status_id`,`check_v`.`account_id` AS `account_id`,`check_v`.`bank_account_id` AS `bank_account_id`,`check_v`.`bank_name` AS `bank_name`,`check_v`.`status_name` AS `status_name`,`check_v`.`account_name` AS `account_name`,`check_v`.`phone` AS `phone`,`check_v`.`person_name` AS `person_name`,`check_v`.`person_mobile` AS `person_mobile`,`check_v`.`fax` AS `fax`,`check_v`.`create_date` AS `b_acc_create_date`,`check_v`.`address` AS `address`,`check_v`.`fisrt_payable` AS `fisrt_payable`,`check_v`.`bank_account_name` AS `bank_account_name`,`check_v`.`bank_account_b_id` AS `bank_account_b_id`,`check_v`.`first_amount` AS `first_amount`,`check_v`.`is_cash` AS `is_cash`,`check_v`.`bank_account_b_name` AS `bank_account_b_name` from (`reg_reg_check` join `check_v` on((`reg_reg_check`.`finance_check_id` = `check_v`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reg_pay_rec_v`
--

/*!50001 DROP TABLE `reg_pay_rec_v`*/;
/*!50001 DROP VIEW IF EXISTS `reg_pay_rec_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reg_pay_rec_v` AS select `reg_reg_payment`.`id` AS `id`,`reg_reg_payment`.`create_date` AS `reg_pay_date`,`reg_reg_payment`.`reg_id` AS `reg_id`,`reg_reg_payment`.`finance_id` AS `finance_id`,`reg_reg_payment`.`next_payment` AS `next_payment`,`receive_pay_v`.`event_date` AS `event_date`,`receive_pay_v`.`amount` AS `amount`,`receive_pay_v`.`account_bank_id` AS `account_bank_id`,`receive_pay_v`.`account_person_id` AS `account_person_id`,`receive_pay_v`.`receive_pay_type_id` AS `receive_pay_type_id`,`receive_pay_v`.`description` AS `description`,`receive_pay_v`.`code` AS `code`,`receive_pay_v`.`b_a_name` AS `b_a_name`,`receive_pay_v`.`bank_id` AS `bank_id`,`receive_pay_v`.`first_amount` AS `first_amount`,`receive_pay_v`.`is_cash` AS `is_cash`,`receive_pay_v`.`bank_name` AS `bank_name`,`receive_pay_v`.`account_name` AS `account_name`,`receive_pay_v`.`phone` AS `phone`,`receive_pay_v`.`person_name` AS `person_name`,`receive_pay_v`.`person_mobile` AS `person_mobile`,`receive_pay_v`.`fax` AS `fax`,`receive_pay_v`.`create_date` AS `create_date`,`receive_pay_v`.`address` AS `address`,`receive_pay_v`.`fisrt_payable` AS `fisrt_payable`,`receive_pay_v`.`rec_pay_type_name` AS `rec_pay_type_name` from (`reg_reg_payment` join `receive_pay_v` on((`reg_reg_payment`.`finance_id` = `receive_pay_v`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `registration_view`
--

/*!50001 DROP TABLE `registration_view`*/;
/*!50001 DROP VIEW IF EXISTS `registration_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `registration_view` AS select `reg_registration`.`reg_date` AS `reg_date`,`reg_registration`.`theory_units` AS `theory_units`,`reg_registration`.`actional_units` AS `actional_units`,`reg_registration`.`fix_salary` AS `fix_salary`,`reg_registration`.`theory_salary` AS `theory_salary`,`reg_registration`.`actional_salary` AS `actional_salary`,`reg_registration`.`other_salary_comment` AS `other_salary_comment`,`reg_registration`.`other_salary_amount` AS `other_salary_amount`,`reg_registration`.`total_salary` AS `total_salary`,`reg_registration`.`off_amount` AS `off_amount`,`reg_registration`.`off_comment` AS `off_comment`,`reg_term`.`name` AS `term_name`,`reg_field`.`name` AS `field_name`,`reg_student`.`name` AS `name`,`reg_student`.`famili` AS `famili`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`identifier_code` AS `identifier_code`,`reg_student`.`identifier_serial` AS `identifier_serial`,`reg_student`.`identifier_char` AS `identifier_char`,`reg_student`.`student_code` AS `student_code`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `description`,`reg_student`.`address` AS `address`,`reg_student`.`mobile` AS `mobile`,`reg_student`.`phone` AS `phone`,`reg_student`.`archive_code` AS `archive_code`,`reg_organization`.`name` AS `org_name`,`reg_registration`.`id` AS `id` from ((((`reg_registration` join `reg_term` on((`reg_registration`.`term_id` = `reg_term`.`id`))) join `reg_field` on((`reg_registration`.`field_id` = `reg_field`.`id`))) join `reg_student` on((`reg_registration`.`st_id` = `reg_student`.`student_code`))) join `reg_organization` on((`reg_student`.`org_unit_id` = `reg_organization`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `st_current_term_v`
--

/*!50001 DROP TABLE `st_current_term_v`*/;
/*!50001 DROP VIEW IF EXISTS `st_current_term_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `st_current_term_v` AS select `student_view`.`name` AS `name`,`student_view`.`famili` AS `famili`,`student_view`.`student_code` AS `student_code`,`student_view`.`status_id` AS `status_id`,`student_view`.`org_unit_id` AS `org_unit_id`,`student_view`.`level_id_last` AS `level_id_last`,`student_view`.`field_id_last` AS `field_id_last`,`student_view`.`field_name` AS `field_name`,`student_view`.`level_name` AS `level_name`,`student_view`.`org_name` AS `org_name`,`student_view`.`status_name` AS `status_name`,`student_view`.`national_code` AS `national_code`,`student_view`.`identifier_code` AS `identifier_code`,`student_view`.`identifier_serial` AS `identifier_serial`,`student_view`.`identifier_char` AS `identifier_char`,`student_view`.`father_name` AS `father_name`,`student_view`.`date_of_birth` AS `date_of_birth`,`student_view`.`description` AS `description`,`student_view`.`created_date` AS `created_date`,`student_view`.`last_modified` AS `last_modified`,`student_view`.`address` AS `address`,`student_view`.`mobile` AS `mobile`,`student_view`.`phone` AS `phone`,`student_view`.`archive_code` AS `archive_code` from `student_view` where `student_view`.`student_code` in (select `reg_registration`.`st_id` AS `st_id` from `reg_registration` where `reg_registration`.`term_id` in (select `reg_term`.`id` AS `id` from `reg_term` where (`reg_term`.`is_current` = 1))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_view`
--

/*!50001 DROP TABLE `student_view`*/;
/*!50001 DROP VIEW IF EXISTS `student_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_view` AS select `reg_student`.`name` AS `name`,`reg_student`.`famili` AS `famili`,`reg_student`.`student_code` AS `student_code`,`reg_student`.`status_id` AS `status_id`,`reg_student`.`org_unit_id` AS `org_unit_id`,`reg_student`.`level_id_last` AS `level_id_last`,`reg_student`.`field_id_last` AS `field_id_last`,`reg_field`.`name` AS `field_name`,`reg_level`.`name` AS `level_name`,`reg_organization`.`name` AS `org_name`,`reg_student_status`.`name` AS `status_name`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`identifier_code` AS `identifier_code`,`reg_student`.`identifier_serial` AS `identifier_serial`,`reg_student`.`identifier_char` AS `identifier_char`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `description`,`reg_student`.`created_date` AS `created_date`,`reg_student`.`last_modified` AS `last_modified`,`reg_student`.`address` AS `address`,`reg_student`.`mobile` AS `mobile`,`reg_student`.`phone` AS `phone`,`reg_student`.`archive_code` AS `archive_code` from ((((`reg_student` left join `reg_field` on((`reg_student`.`field_id_last` = `reg_field`.`id`))) left join `reg_level` on((`reg_student`.`level_id_last` = `reg_level`.`id`))) join `reg_organization` on((`reg_student`.`org_unit_id` = `reg_organization`.`id`))) join `reg_student_status` on((`reg_student`.`status_id` = `reg_student_status`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-28  8:51:58
