-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: school_new
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `finance_account`
--

LOCK TABLES `finance_account` WRITE;
/*!40000 ALTER TABLE `finance_account` DISABLE KEYS */;
INSERT INTO `finance_account` VALUES (14208,'فاطمه ابراهیم خمیسی',NULL,'فاطمه ابراهیم خمیسی','09023164468',NULL,'2025-11-18 00:00:00',NULL,0),(14209,'زهرا اسحقی',NULL,'زهرا اسحقی','09140401548',NULL,'2025-11-18 00:00:00',NULL,0),(14210,'زهره باقری',NULL,'زهره باقری','09130152534',NULL,'2025-11-18 00:00:00',NULL,0);
/*!40000 ALTER TABLE `finance_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `finance_account_bank`
--

LOCK TABLES `finance_account_bank` WRITE;
/*!40000 ALTER TABLE `finance_account_bank` DISABLE KEYS */;
INSERT INTO `finance_account_bank` VALUES (1,'حساب مرکزی',1,0,_binary '\0'),(2,'صندوق',NULL,0,_binary '');
/*!40000 ALTER TABLE `finance_account_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `finance_bank`
--

LOCK TABLES `finance_bank` WRITE;
/*!40000 ALTER TABLE `finance_bank` DISABLE KEYS */;
INSERT INTO `finance_bank` VALUES (1,'ملی'),(2,'صادرات'),(3,'مسکن'),(4,'سپه');
/*!40000 ALTER TABLE `finance_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `finance_check`
--

LOCK TABLES `finance_check` WRITE;
/*!40000 ALTER TABLE `finance_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `finance_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `finance_check_status`
--

LOCK TABLES `finance_check_status` WRITE;
/*!40000 ALTER TABLE `finance_check_status` DISABLE KEYS */;
INSERT INTO `finance_check_status` VALUES (1,'برگشت خورده'),(2,'پاس شده'),(3,'اولیه');
/*!40000 ALTER TABLE `finance_check_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `finance_factor`
--

LOCK TABLES `finance_factor` WRITE;
/*!40000 ALTER TABLE `finance_factor` DISABLE KEYS */;
INSERT INTO `finance_factor` VALUES (34027,14208,-30500000,'2025-11-18 00:00:00',NULL,1),(34028,14209,-25250000,'2025-11-18 00:00:00',NULL,1),(34029,14210,-30500000,'2025-11-18 00:00:00',NULL,1);
/*!40000 ALTER TABLE `finance_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `finance_factor_type`
--

LOCK TABLES `finance_factor_type` WRITE;
/*!40000 ALTER TABLE `finance_factor_type` DISABLE KEYS */;
INSERT INTO `finance_factor_type` VALUES (1,'هزینه ثبت نام'),(2,'هزینه صدور کارت');
/*!40000 ALTER TABLE `finance_factor_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `finance_receive_pay_type`
--

LOCK TABLES `finance_receive_pay_type` WRITE;
/*!40000 ALTER TABLE `finance_receive_pay_type` DISABLE KEYS */;
INSERT INTO `finance_receive_pay_type` VALUES (1,'نقدی'),(2,'pos'),(3,'فیش بانکی'),(4,'پاس شدن چک');
/*!40000 ALTER TABLE `finance_receive_pay_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `finance_receive_payment`
--

LOCK TABLES `finance_receive_payment` WRITE;
/*!40000 ALTER TABLE `finance_receive_payment` DISABLE KEYS */;
INSERT INTO `finance_receive_payment` VALUES (44249,'2025-10-20 00:00:00',25250000,1,14209,2,NULL,NULL),(44250,'2025-11-18 00:00:00',10000000,1,14210,2,NULL,NULL);
/*!40000 ALTER TABLE `finance_receive_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_base`
--

LOCK TABLES `reg_base` WRITE;
/*!40000 ALTER TABLE `reg_base` DISABLE KEYS */;
INSERT INTO `reg_base` VALUES (1,'پايه هفتم'),(2,'پايه هشتم'),(3,'پايه نهم'),(4,'پايه دهم'),(5,'پايه يازدهم'),(6,'پايه دوازدهم');
/*!40000 ALTER TABLE `reg_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_base_level`
--

LOCK TABLES `reg_base_level` WRITE;
/*!40000 ALTER TABLE `reg_base_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `reg_base_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_course`
--

LOCK TABLES `reg_course` WRITE;
/*!40000 ALTER TABLE `reg_course` DISABLE KEYS */;
INSERT INTO `reg_course` VALUES (141,'10011',NULL,NULL,_binary '\0','دینی و اخلاق1',NULL,NULL,NULL),(150,'10021',NULL,NULL,_binary '\0','عربی و زبان قرآن1',NULL,NULL,NULL),(158,'10022',NULL,NULL,_binary '\0','عربی و زبان قرآن1-کاردانش',NULL,NULL,NULL),(173,'10031',NULL,NULL,_binary '\0','فارسی1',NULL,NULL,NULL),(177,'10041',NULL,NULL,_binary '\0','نگارش 1',NULL,NULL,NULL),(183,'10051',NULL,NULL,_binary '\0','ریاضی1',NULL,NULL,NULL),(184,'10061',NULL,NULL,_binary '\0','هندسه1',NULL,NULL,NULL),(193,'10071',NULL,NULL,_binary '\0','آمادگی دفاعی',NULL,NULL,NULL),(197,'10081',NULL,NULL,_binary '\0','زبان خارجی1-نظری',NULL,NULL,NULL),(205,'10082',NULL,NULL,_binary '\0','زبان خارجه1-کاردانش',NULL,NULL,NULL),(211,'10092',NULL,NULL,_binary '\0','تربیت بدنی1',NULL,NULL,NULL),(218,'10101',NULL,NULL,_binary '\0','فیزیک1 رشته ریاضی',NULL,NULL,NULL),(220,'10111',NULL,NULL,_binary '\0','شیمی1',NULL,NULL,NULL),(221,'10121',NULL,NULL,_binary '\0','آزمایشگاه علوم 1',NULL,NULL,NULL),(233,'10131',NULL,NULL,_binary '\0','جغرافیا عمومی',NULL,NULL,NULL),(234,'10141',NULL,NULL,_binary '\0','زیست شناسی1',NULL,NULL,NULL),(235,'10151',NULL,NULL,_binary '\0','دینی 1 انسانی',NULL,NULL,NULL),(236,'10161',NULL,NULL,_binary '\0','عربی 1 انسانی',NULL,NULL,NULL),(237,'10171',NULL,NULL,_binary '\0','علوم و فنون ادبی1',NULL,NULL,NULL),(238,'10181',NULL,NULL,_binary '\0','ریاضی و آمار1',NULL,NULL,NULL),(239,'10191',NULL,NULL,_binary '\0','تاریخ1',NULL,NULL,NULL),(246,'10201',NULL,NULL,_binary '\0','جامعه شناسی1',NULL,NULL,NULL),(256,'10211',NULL,NULL,_binary '\0','اقتصاد',NULL,NULL,NULL),(258,'10221',NULL,NULL,_binary '\0','منطق',NULL,NULL,NULL),(259,'10291',NULL,NULL,_binary '\0','فیزیک1 تجربی',NULL,NULL,NULL),(267,'11011',NULL,NULL,_binary '\0','دینی و اخلاق 2',NULL,NULL,NULL),(270,'11021',NULL,NULL,_binary '\0','عربی 2 ریاضی وتجربی',NULL,NULL,NULL),(275,'11022',NULL,NULL,_binary '\0','عربی (2) کاردانش',NULL,NULL,NULL),(283,'11031',NULL,NULL,_binary '\0','فارسی 2 - کاردانش',NULL,NULL,NULL),(291,'11041',NULL,NULL,_binary '\0','نگارش2',NULL,NULL,NULL),(293,'11051',NULL,NULL,_binary '\0','هندسه 2',NULL,NULL,NULL),(294,'11061',NULL,NULL,_binary '\0','حسابان1',NULL,NULL,NULL),(295,'11071',NULL,NULL,_binary '\0','آمار و احتمال',NULL,NULL,NULL),(296,'11081',NULL,NULL,_binary '\0','زبان خارجه (2)',NULL,NULL,NULL),(300,'11082',NULL,NULL,_binary '\0','زبان خارجه(2) کاردانش',NULL,NULL,NULL),(316,'11092',NULL,NULL,_binary '\0','تربیت بدنی2',NULL,NULL,NULL),(318,'11101',NULL,NULL,_binary '\0','فیزیک 2 رشته ریاضی',NULL,NULL,NULL),(319,'11111',NULL,NULL,_binary '\0','شیمی 2',NULL,NULL,NULL),(322,'11121',NULL,NULL,_binary '\0','آزمایشگاه علوم2',NULL,NULL,NULL),(324,'11131',NULL,NULL,_binary '\0','انسان و محیط زیست',NULL,NULL,NULL),(340,'11141',NULL,NULL,_binary '\0','تاریخ معاصر',NULL,NULL,NULL),(345,'11151',NULL,NULL,_binary '\0','زمین شناسی',NULL,NULL,NULL),(346,'11161',NULL,NULL,_binary '\0','ریاضی2',NULL,NULL,NULL),(347,'11171',NULL,NULL,_binary '\0','زیست شناسی2',NULL,NULL,NULL),(349,'11191',NULL,NULL,_binary '\0','عربی 2 انسانی',NULL,NULL,NULL),(350,'11201',NULL,NULL,_binary '\0','علوم و فنون ادبی 2',NULL,NULL,NULL),(351,'11211',NULL,NULL,_binary '\0','ریاضی و آمار2',NULL,NULL,NULL),(352,'11221',NULL,NULL,_binary '\0','جغرافیا2',NULL,NULL,NULL),(353,'11231',NULL,NULL,_binary '\0','تاریخ 2',NULL,NULL,NULL),(354,'11241',NULL,NULL,_binary '\0','جامعه شناسی 2',NULL,NULL,NULL),(355,'11251',NULL,NULL,_binary '\0','روان شناسی',NULL,NULL,NULL),(356,'11261',NULL,NULL,_binary '\0','فلسفه',NULL,NULL,NULL),(357,'11331',NULL,NULL,_binary '\0','فیزیک 2 تجربی',NULL,NULL,NULL),(358,'12011',NULL,NULL,_binary '','دینی و اخلاق3  ',NULL,NULL,NULL),(368,'12021',NULL,NULL,_binary '','عربی،زبان قرآن3',NULL,NULL,NULL),(370,'12022',NULL,NULL,_binary '\0','عربی زبان قرآن3 کاردانش',NULL,NULL,NULL),(378,'12031',NULL,NULL,_binary '','فارسی 3',NULL,NULL,NULL),(391,'12041',NULL,NULL,_binary '\0','نگارش3',NULL,NULL,NULL),(392,'12051',NULL,NULL,_binary '','هندسه3',NULL,NULL,NULL),(393,'12061',NULL,NULL,_binary '','حسابان2',NULL,NULL,NULL),(394,'12071',NULL,NULL,_binary '','ریاضیات گسسته',NULL,NULL,NULL),(397,'12081',NULL,NULL,_binary '','زبان خارجی3',NULL,NULL,NULL),(407,'12091',NULL,NULL,_binary '\0','تربیت بدنی3',NULL,NULL,NULL),(409,'12101',NULL,NULL,_binary '','فیزیک 3 ',NULL,NULL,NULL),(411,'12111',NULL,NULL,_binary '','شیمی3',NULL,NULL,NULL),(414,'12121',NULL,NULL,_binary '','سلامت و بهداشت ',NULL,NULL,NULL),(431,'12131',NULL,NULL,_binary '\0','مدیریت خانواده و سبک زندگی',NULL,NULL,NULL),(435,'12141',NULL,NULL,_binary '','علوم اجتماعی ',NULL,NULL,NULL),(444,'12151',NULL,NULL,_binary '','زیست شناسی3',NULL,NULL,NULL),(445,'12161',NULL,NULL,_binary '','ریاضی3',NULL,NULL,NULL),(446,'12171',NULL,NULL,_binary '','دینی 3 انسانی',NULL,NULL,NULL),(447,'12181',NULL,NULL,_binary '','عربی3 انسانی',NULL,NULL,NULL),(448,'12191',NULL,NULL,_binary '','علوم و فنون ادبی3',NULL,NULL,NULL),(449,'12201',NULL,NULL,_binary '','ریاضی و آمار3',NULL,NULL,NULL),(450,'12211',NULL,NULL,_binary '','جغرافیا3',NULL,NULL,NULL),(451,'12221',NULL,NULL,_binary '','تاریخ3',NULL,NULL,NULL),(452,'12231',NULL,NULL,_binary '','جامعه شناسی3',NULL,NULL,NULL),(453,'12241',NULL,NULL,_binary '\0','مطالعات فرهنگی',NULL,NULL,NULL),(454,'12251',NULL,NULL,_binary '','فلسفه2',NULL,NULL,NULL),(455,'12331',NULL,NULL,_binary '','فیزیک3 تجربی',NULL,NULL,NULL),(462,'14031',NULL,NULL,_binary '\0','تفکر و سواد رسانه ای',NULL,NULL,NULL),(467,'88901',NULL,NULL,_binary '\0','فیزیک1 کاردانش',NULL,NULL,NULL),(476,'88510',NULL,NULL,_binary '\0','ریاضی1 کاردانش',NULL,NULL,NULL),(487,'88150',NULL,NULL,_binary '\0','اخلاق حرفه ای',NULL,NULL,NULL),(492,'88140',NULL,NULL,_binary '\0','کارگاه نوآوری و کارآفرینی',NULL,NULL,NULL),(502,'88130',NULL,NULL,_binary '\0','مدیریت تولید',NULL,NULL,NULL),(510,'88120',NULL,NULL,_binary '\0','کاربرد فناوری های نوین',NULL,NULL,NULL),(521,'88110',NULL,NULL,_binary '\0','الزامات محیط کار',NULL,NULL,NULL),(523,'24501',NULL,NULL,_binary '\0','قرآن1',NULL,NULL,NULL),(524,'24502',NULL,NULL,_binary '\0','معارف اسلامی1',NULL,NULL,NULL),(526,'24504',NULL,NULL,_binary '\0','املاء1',NULL,NULL,NULL),(528,'24507',NULL,NULL,_binary '\0','عربی1',NULL,NULL,NULL),(529,'24508',NULL,NULL,_binary '\0','زبان خارجه1',NULL,NULL,NULL),(530,'24509',NULL,NULL,_binary '\0','علوم تجربی1',NULL,NULL,NULL),(531,'24510',NULL,NULL,_binary '\0','ریاضی1',NULL,NULL,NULL),(532,'24511',NULL,NULL,_binary '\0','تربیت بدنی1',NULL,NULL,NULL),(533,'24512',NULL,NULL,_binary '\0','اجتماعی1',NULL,NULL,NULL),(534,'24513',NULL,NULL,_binary '\0','فرهنگ و هنر1',NULL,NULL,NULL),(535,'24514',NULL,NULL,_binary '\0','کار و فناوری1',NULL,NULL,NULL),(536,'24515',NULL,NULL,_binary '\0','تفکر و سبک زندگی1',NULL,NULL,NULL),(537,'24601',NULL,NULL,_binary '\0','قرآن2',NULL,NULL,NULL),(538,'24602',NULL,NULL,_binary '\0','معارف اسلامی2',NULL,NULL,NULL),(540,'24604',NULL,NULL,_binary '\0','املاء2',NULL,NULL,NULL),(542,'24607',NULL,NULL,_binary '\0','عربی2',NULL,NULL,NULL),(543,'24608',NULL,NULL,_binary '\0','زبان خارجه2',NULL,NULL,NULL),(544,'24609',NULL,NULL,_binary '\0','علوم تجربی2',NULL,NULL,NULL),(545,'24610',NULL,NULL,_binary '\0','ریاضی2',NULL,NULL,NULL),(546,'24611',NULL,NULL,_binary '\0','تربیت بدنی2',NULL,NULL,NULL),(548,'24612',NULL,NULL,_binary '\0','اجتماعی2',NULL,NULL,NULL),(549,'24613',NULL,NULL,_binary '\0','فرهنگ و هنر2',NULL,NULL,NULL),(550,'24614',NULL,NULL,_binary '\0','کاروفناوری2',NULL,NULL,NULL),(551,'24615',NULL,NULL,_binary '\0','تفکر و سبک زندگی2',NULL,NULL,NULL),(552,'24701',NULL,NULL,_binary '\0','قرآن3',NULL,NULL,NULL),(553,'24702',NULL,NULL,_binary '\0','معارف اسلامی3',NULL,NULL,NULL),(555,'24704',NULL,NULL,_binary '\0','املاء3',NULL,NULL,NULL),(557,'24707',NULL,NULL,_binary '\0','عربی3',NULL,NULL,NULL),(558,'24708',NULL,NULL,_binary '\0','زبان خارجه3',NULL,NULL,NULL),(559,'24709',NULL,NULL,_binary '\0','علوم تجربی3',NULL,NULL,NULL),(560,'24710',NULL,NULL,_binary '\0','ریاضی3',NULL,NULL,NULL),(561,'24711',NULL,NULL,_binary '\0','تربیت بدنی3',NULL,NULL,NULL),(562,'24712',NULL,NULL,_binary '\0','اجتماعی3',NULL,NULL,NULL),(563,'24713',NULL,NULL,_binary '\0','فرهنگ و هنر3',NULL,NULL,NULL),(564,'24714',NULL,NULL,_binary '\0','کار و فناوری3',NULL,NULL,NULL),(565,'24717',NULL,NULL,_binary '\0','آمادگی دفاعی3',NULL,NULL,NULL),(566,'11181',NULL,NULL,_binary '\0','دینی و اخلاق 2 انسانی',NULL,NULL,NULL),(724,'24520',NULL,NULL,_binary '\0','فارسی1',NULL,NULL,NULL),(725,'24521',NULL,NULL,_binary '\0','نگارش 1',NULL,NULL,NULL),(726,'24620',NULL,NULL,_binary '\0','فارسی2',NULL,NULL,NULL),(727,'24621',NULL,NULL,_binary '\0','نگارش2',NULL,NULL,NULL),(728,'24720',NULL,NULL,_binary '\0','فارسی3',NULL,NULL,NULL),(729,'24721',NULL,NULL,_binary '\0','نگارش3',NULL,NULL,NULL),(902,'1111',NULL,NULL,_binary '\0','مهارت',NULL,NULL,NULL),(914,'88701',NULL,NULL,_binary '\0','زیست شناسی کاردانش',NULL,NULL,NULL);
/*!40000 ALTER TABLE `reg_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_course_field`
--

LOCK TABLES `reg_course_field` WRITE;
/*!40000 ALTER TABLE `reg_course_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `reg_course_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_exam_course`
--

LOCK TABLES `reg_exam_course` WRITE;
/*!40000 ALTER TABLE `reg_exam_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `reg_exam_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_exam_hour_config`
--

LOCK TABLES `reg_exam_hour_config` WRITE;
/*!40000 ALTER TABLE `reg_exam_hour_config` DISABLE KEYS */;
INSERT INTO `reg_exam_hour_config` VALUES ('10 صبح'),('10:30 صبح'),('14 عصر'),('15:30 عصر'),('16 عصر'),('17 عصر'),('17:30 عصر'),('7 صبح'),('8 صبح'),('9:30 صبح');
/*!40000 ALTER TABLE `reg_exam_hour_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_exam_kart_config`
--

LOCK TABLES `reg_exam_kart_config` WRITE;
/*!40000 ALTER TABLE `reg_exam_kart_config` DISABLE KEYS */;
INSERT INTO `reg_exam_kart_config` VALUES (1,'شیرین حاجی زاده','مدرسه آوید','مدرسه آوید');
/*!40000 ALTER TABLE `reg_exam_kart_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_exam_time`
--

LOCK TABLES `reg_exam_time` WRITE;
/*!40000 ALTER TABLE `reg_exam_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `reg_exam_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_field`
--

LOCK TABLES `reg_field` WRITE;
/*!40000 ALTER TABLE `reg_field` DISABLE KEYS */;
INSERT INTO `reg_field` VALUES (1,'ریاضی و فیزیک',_binary '',NULL),(2,'ادبیات و علوم انسانی',_binary '',NULL),(3,'علوم تجربی',_binary '',NULL),(4,'تولید و پرورش گیاهان زینتی',_binary '','92152'),(5,'مدیریت و برنامه ریزی خانواده',_binary '','94101'),(6,'چاپ دستی',_binary '','99201'),(7,'تصویربرداری',_binary '',NULL),(8,'عیب‌یابی و مونتاژ سیم‌های رایانه‌ای',_binary '','61381'),(9,'تعمیر تلفن‌های رومیزی و همراه',_binary '','91112'),(10,'تعمیر دستگاه اداری',_binary '','91113'),(11,'تولید و توسعه‌دهنده پایگاه‌های اینترنتی',_binary '','91125'),(12,'تولید محتوای آموزشی الکترونیکی',_binary '','91123'),(13,'نقشه‌کشی صنعتی با رایانه',_binary '','61011'),(14,'نقشه‌کشی ساختمان',_binary '','61841'),(15,'امور باغی گیاهان زینتی و فضای سبز',_binary '','81211'),(16,'امور زراعی گیاهان دارویی',_binary '','81121'),(17,'دامپروری طیور و دام',_binary '','81112'),(18,'دامپروری طیور و حشرات مفید',_binary '','81111'),(19,'شیلات',_binary '','83110'),(20,'نان، شیرینی و شکلات',_binary '','92173'),(21,'دوخت لباس‌های محلی',_binary '\0','61501'),(22,'دوخت لباس‌های سنتی',_binary '\0','93155'),(23,'سراجی کیف',_binary '','93151'),(24,'سراجی دوزنده کفش',_binary '','93152'),(25,'تصویرسازی و جلوه‌های ویژه رایانه‌ای',_binary '','62321'),(26,'طراحی طلا و جواهر',_binary '','62261'),(27,'طلا و جواهرسازی',_binary '','93141'),(28,'تراش و تزئین شیشه و کریستال',_binary '','99441'),(29,'قلم‌زنی روی فلز',_binary '','97371'),(30,'تراش سنگ‌های قیمتی',_binary '','98471'),(31,'هنر آیینه‌کاری',_binary '','99221'),(32,'گرافیک رایانه‌ای',_binary '','99011'),(33,'عکاسی دیجیتال',_binary '','99211'),(34,'سازسازی (سنتور و سه‌تار)',_binary '','99171'),(35,'سازسازی سنتور (سه‌تار و ساز ضربی)',_binary '','99181'),(36,'سازسازی (سنتور و ساز ضربی)',_binary '','99261'),(37,'نوازندگی ساز ایرانی',_binary '','99411'),(38,'نوازندگی ساز جهانی',_binary '','99421'),(39,'آواز ایرانی',_binary '','99431'),(40,'آواز جهانی',_binary '','99361'),(41,'نگارگری',_binary '','99061'),(42,'تذهیب و تشعیر',_binary '','99071'),(43,'چهره‌سازی',_binary '','99161'),(44,'نقاشی ایرانی',_binary '','98411'),(45,'چهره‌پردازی',_binary '','93111'),(46,'چاپ باتیک و سیلک اسکرین',_binary '','98491'),(47,'صحافی و جلدسازی',_binary '','98501'),(48,'امور اداری',_binary '','94201'),(49,'مدیریت آشپزی و قنادی',_binary '','62241'),(50,'هتلداری',_binary '','61741'),(51,'راهنمای گردشگری',_binary '','62201');
/*!40000 ALTER TABLE `reg_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_identifier_code`
--

LOCK TABLES `reg_identifier_code` WRITE;
/*!40000 ALTER TABLE `reg_identifier_code` DISABLE KEYS */;
INSERT INTO `reg_identifier_code` VALUES (1,'الف'),(2,'ب'),(3,'پ'),(4,'ت'),(5,'ث'),(6,'ج'),(7,'چ'),(8,'ح'),(9,'خ'),(10,'د'),(11,'ذ'),(12,'ر'),(13,'ز'),(14,'ژ'),(15,'س'),(16,'ش'),(17,'ص'),(18,'ض'),(19,'ط'),(20,'ظ'),(21,'ع'),(22,'غ'),(23,'ف'),(24,'ق'),(25,'ک'),(26,'گ'),(27,'ل'),(28,'م'),(29,'ن'),(30,'و'),(31,'ه'),(32,'ی'),(42,'یک المثني'),(43,' دو المثني'),(44,'سه المثني'),(45,'چهار المثني'),(46,'پنج المثني'),(47,'شش المثني'),(48,'هفت المثني'),(49,'هشت المثني'),(50,'نه المثني'),(51,'ده المثني'),(52,'يازده المثني'),(53,'دوازده المثني');
/*!40000 ALTER TABLE `reg_identifier_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_level`
--

LOCK TABLES `reg_level` WRITE;
/*!40000 ALTER TABLE `reg_level` DISABLE KEYS */;
INSERT INTO `reg_level` VALUES (1,'دوره اول متوسطه'),(2,'دوره دوم  متوسطه  نظری'),(3,'دوره دوم متوسطه کاردانش');
/*!40000 ALTER TABLE `reg_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_organization`
--

LOCK TABLES `reg_organization` WRITE;
/*!40000 ALTER TABLE `reg_organization` DISABLE KEYS */;
INSERT INTO `reg_organization` VALUES (1,'مرکزی');
/*!40000 ALTER TABLE `reg_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_persian_day`
--

LOCK TABLES `reg_persian_day` WRITE;
/*!40000 ALTER TABLE `reg_persian_day` DISABLE KEYS */;
INSERT INTO `reg_persian_day` VALUES (0,'دوشنبه'),(1,'سه شنبه'),(2,'چهارشنبه'),(3,'پنجشنبه'),(4,'جمعه'),(5,'شنبه'),(6,'یکشنبه');
/*!40000 ALTER TABLE `reg_persian_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_receivable`
--

LOCK TABLES `reg_receivable` WRITE;
/*!40000 ALTER TABLE `reg_receivable` DISABLE KEYS */;
INSERT INTO `reg_receivable` VALUES (34028,34027,'2025-01-21 00:00:00',34029),(34029,34027,'2025-11-18 00:00:00',34029),(34030,34028,'2025-11-18 00:00:00',34030),(34031,34029,'2025-11-18 00:00:00',34031);
/*!40000 ALTER TABLE `reg_receivable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_reg_check`
--

LOCK TABLES `reg_reg_check` WRITE;
/*!40000 ALTER TABLE `reg_reg_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `reg_reg_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_reg_course`
--

LOCK TABLES `reg_reg_course` WRITE;
/*!40000 ALTER TABLE `reg_reg_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `reg_reg_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_reg_payment`
--

LOCK TABLES `reg_reg_payment` WRITE;
/*!40000 ALTER TABLE `reg_reg_payment` DISABLE KEYS */;
INSERT INTO `reg_reg_payment` VALUES (44158,'2025-10-20 00:00:00',34030,44249,NULL),(44159,'2025-11-18 00:00:00',34031,44250,NULL);
/*!40000 ALTER TABLE `reg_reg_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_registration`
--

LOCK TABLES `reg_registration` WRITE;
/*!40000 ALTER TABLE `reg_registration` DISABLE KEYS */;
INSERT INTO `reg_registration` VALUES (34029,'2025-11-18 00:00:00',372208991,32,9332,3,18.00,108,4400000,0,1450000,NULL,0,30500000,0,NULL,NULL),(34030,'2025-11-18 00:00:00',1282728301,32,9332,3,11.00,66,4400000,0,1450000,'ثبت مهارت +مدرک',4900000,25250000,0,NULL,NULL),(34031,'2025-11-18 00:00:00',5659277004,32,9332,3,18.00,108,4400000,0,1450000,NULL,0,30500000,0,NULL,NULL);
/*!40000 ALTER TABLE `reg_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_salary_param`
--

LOCK TABLES `reg_salary_param` WRITE;
/*!40000 ALTER TABLE `reg_salary_param` DISABLE KEYS */;
INSERT INTO `reg_salary_param` VALUES (9332,1,4400000,0,1350000,NULL),(9332,2,4400000,0,1450000,NULL),(9332,3,4400000,0,1450000,NULL);
/*!40000 ALTER TABLE `reg_salary_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_school`
--

LOCK TABLES `reg_school` WRITE;
/*!40000 ALTER TABLE `reg_school` DISABLE KEYS */;
/*!40000 ALTER TABLE `reg_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_student`
--

LOCK TABLES `reg_student` WRITE;
/*!40000 ALTER TABLE `reg_student` DISABLE KEYS */;
INSERT INTO `reg_student` VALUES ('فاطمه','ابراهیم خمیسی','0372208991',NULL,NULL,1,372208991,'حسین','1998-11-11',NULL,1,1,'2025-11-18 00:00:00','2025-11-18 00:00:00',NULL,NULL,NULL,'09023164468',NULL,NULL,NULL,NULL),('زهرا','اسحقی','1282728301',NULL,NULL,1,1282728301,'محمود','1980-12-23',NULL,1,1,'2025-11-18 00:00:00','2025-11-18 00:00:00',NULL,NULL,NULL,'09140401548',NULL,NULL,NULL,NULL),('زهره','باقری','5659277004',NULL,NULL,1,5659277004,'حیدر','1978-09-23',NULL,1,1,'2025-11-18 00:00:00','2025-11-18 00:00:00',NULL,NULL,NULL,'09130152534',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `reg_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_student_account`
--

LOCK TABLES `reg_student_account` WRITE;
/*!40000 ALTER TABLE `reg_student_account` DISABLE KEYS */;
INSERT INTO `reg_student_account` VALUES (372208991,14208,'2025-11-18 00:00:00'),(1282728301,14209,'2025-11-18 00:00:00'),(5659277004,14210,'2025-11-18 00:00:00');
/*!40000 ALTER TABLE `reg_student_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_student_image`
--

LOCK TABLES `reg_student_image` WRITE;
/*!40000 ALTER TABLE `reg_student_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `reg_student_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_student_status`
--

LOCK TABLES `reg_student_status` WRITE;
/*!40000 ALTER TABLE `reg_student_status` DISABLE KEYS */;
INSERT INTO `reg_student_status` VALUES (1,'فعال'),(2,'انتقال رفته'),(3,'بلاتکلیف'),(4,'ترک تحصیل'),(5,'فارغ التحصیل');
/*!40000 ALTER TABLE `reg_student_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_term`
--

LOCK TABLES `reg_term` WRITE;
/*!40000 ALTER TABLE `reg_term` DISABLE KEYS */;
INSERT INTO `reg_term` VALUES (9332,'نیم سال اول 404- 405','2025-09-23','2026-02-19',_binary '',4,4);
/*!40000 ALTER TABLE `reg_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `st_govahi_vaziat`
--

LOCK TABLES `st_govahi_vaziat` WRITE;
/*!40000 ALTER TABLE `st_govahi_vaziat` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_govahi_vaziat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `temp_test2`
--

LOCK TABLES `temp_test2` WRITE;
/*!40000 ALTER TABLE `temp_test2` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_test2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `test_table`
--

LOCK TABLES `test_table` WRITE;
/*!40000 ALTER TABLE `test_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tmp_st`
--

LOCK TABLES `tmp_st` WRITE;
/*!40000 ALTER TABLE `tmp_st` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_st` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-18 19:01:01
