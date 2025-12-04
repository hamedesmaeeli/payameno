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
INSERT INTO `reg_course` VALUES (111,'24512',NULL,3,NULL,'اجتماعی1',NULL,NULL,NULL),(113,'24612',NULL,3,NULL,'اجتماعی2',NULL,NULL,NULL),(115,'24712',NULL,3,NULL,'اجتماعی3',NULL,NULL,NULL),(120,'24504',NULL,1,NULL,'املاء1',NULL,NULL,NULL),(122,'24604',NULL,1,NULL,'املاء2',NULL,NULL,NULL),(123,'24704',NULL,1,NULL,'املاء3',NULL,NULL,NULL),(131,'24717',NULL,2,NULL,'آمادگی دفاعی3',NULL,NULL,NULL),(140,'24515',NULL,2,NULL,'تفکر و سبک زندگی1',NULL,NULL,NULL),(141,'24615',NULL,2,NULL,'تفکر و سبک زندگی2',NULL,NULL,NULL),(155,'24502',NULL,2,NULL,'معارف اسلامی1',NULL,NULL,NULL),(157,'24602',NULL,2,NULL,'معارف اسلامی2',NULL,NULL,NULL),(158,'24702',NULL,2,NULL,'معارف اسلامی3',NULL,NULL,NULL),(163,'24510',NULL,4,NULL,'ریاضی1',NULL,NULL,NULL),(166,'24610',NULL,4,NULL,'ریاضی2',NULL,NULL,NULL),(167,'24710',NULL,4,NULL,'ریاضی3',NULL,NULL,NULL),(172,'24508',NULL,2,NULL,'زبان خارجه1',NULL,NULL,NULL),(175,'24608',NULL,2,NULL,'زبان خارجه2',NULL,NULL,NULL),(177,'24708',NULL,2,NULL,'زبان خارجه3',NULL,NULL,NULL),(189,'24507',NULL,2,NULL,'عربی1',NULL,NULL,NULL),(191,'24607',NULL,2,NULL,'عربی2',NULL,NULL,NULL),(194,'24707',NULL,2,NULL,'عربی3',NULL,NULL,NULL),(196,'24509',NULL,3,NULL,'علوم تجربی1',NULL,NULL,NULL),(198,'24609',NULL,3,NULL,'علوم تجربی2',NULL,NULL,NULL),(200,'24709',NULL,3,NULL,'علوم تجربی3',NULL,NULL,NULL),(207,'24501',NULL,2,NULL,'قرآن1',NULL,NULL,NULL),(209,'24601',NULL,2,NULL,'قرآن2',NULL,NULL,NULL),(211,'24701',NULL,2,NULL,'قرآن3',NULL,NULL,NULL),(218,'10011',NULL,2,NULL,'دینی و اخلاق1',NULL,NULL,NULL),(219,'10021',NULL,1,NULL,'عربی و زبان قرآن1',NULL,NULL,NULL),(220,'10051',NULL,4,NULL,'ریاضی1',NULL,NULL,NULL),(221,'10061',NULL,2,NULL,'هندسه1',NULL,NULL,NULL),(222,'10071',NULL,2,NULL,'آمادگی دفاعی',NULL,NULL,NULL),(223,'10081',NULL,3,NULL,'زبان خارجی1-نظری',NULL,NULL,NULL),(224,'10101',NULL,4,NULL,'فیزیک1 رشته ریاضی',NULL,NULL,NULL),(225,'10111',NULL,3,NULL,'شیمی1',NULL,NULL,NULL),(226,'11121',NULL,1,NULL,'آزمایشگاه علوم2',NULL,NULL,NULL),(227,'10131',NULL,2,NULL,'جغرافیا عمومی',NULL,NULL,NULL),(228,'10141',NULL,3,NULL,'زیست شناسی1',NULL,NULL,NULL),(229,'10161',NULL,2,NULL,'عربی 1 انسانی',NULL,NULL,NULL),(230,'10171',NULL,2,NULL,'علوم و فنون ادبی1',NULL,NULL,NULL),(231,'10181',NULL,3,NULL,'ریاضی و آمار1',NULL,NULL,NULL),(232,'10191',NULL,3,NULL,'تاریخ1',NULL,NULL,NULL),(233,'10201',NULL,2,NULL,'جامعه شناسی1',NULL,NULL,NULL),(234,'10211',NULL,2,NULL,'اقتصاد',NULL,NULL,NULL),(235,'10221',NULL,2,NULL,'منطق',NULL,NULL,NULL),(236,'10291',NULL,3,NULL,'فیزیک1 تجربی',NULL,NULL,NULL),(238,'10031',NULL,2,NULL,'فارسی1',NULL,NULL,NULL),(239,'10041',NULL,2,NULL,'نگارش 1',NULL,NULL,NULL),(241,'10082',NULL,2,NULL,'زبان خارجه1-کاردانش',NULL,NULL,NULL),(242,'88110',NULL,2,NULL,'الزامات محیط کار',NULL,NULL,NULL),(243,'88510',NULL,2,NULL,'ریاضی1 کاردانش',NULL,NULL,NULL),(244,'11031',NULL,2,NULL,'فارسی 2 - کاردانش',NULL,NULL,NULL),(245,'11241',NULL,3,NULL,'جامعه شناسی 2',NULL,NULL,NULL),(246,'11181',NULL,4,NULL,'دینی و اخلاق 2 انسانی',NULL,NULL,NULL),(248,'11131',NULL,2,NULL,'انسان و محیط زیست',NULL,NULL,NULL),(249,'11081',NULL,3,NULL,'زبان خارجه (2)',NULL,NULL,NULL),(250,'11211',NULL,2,NULL,'ریاضی و آمار2',NULL,NULL,NULL),(252,'11191',NULL,2,NULL,'عربی 2 انسانی',NULL,NULL,NULL),(253,'11021',NULL,2,NULL,'عربی 2 ریاضی وتجربی',NULL,NULL,NULL),(254,'11231',NULL,3,NULL,'تاریخ 2',NULL,NULL,NULL),(255,'11141',NULL,2,NULL,'تاریخ معاصر',NULL,NULL,NULL),(256,'11041',NULL,1,NULL,'نگارش2',NULL,NULL,NULL),(257,'11201',NULL,2,NULL,'علوم و فنون ادبی 2',NULL,NULL,NULL),(258,'11261',NULL,2,NULL,'فلسفه',NULL,NULL,NULL),(259,'11151',NULL,2,NULL,'زمین شناسی',NULL,NULL,NULL),(260,'11251',NULL,2,NULL,'روان شناسی',NULL,NULL,NULL),(261,'10151',NULL,3,NULL,'دینی 1 انسانی',NULL,NULL,NULL),(262,'11082',NULL,2,NULL,'زبان خارجه(2) کاردانش',NULL,NULL,NULL),(263,'11022',NULL,1,NULL,'عربی (2) کاردانش',NULL,NULL,NULL),(264,'11221',NULL,3,NULL,'جغرافیا2',NULL,NULL,NULL),(265,'11051',NULL,2,NULL,'هندسه 2',NULL,NULL,NULL),(266,'14031',NULL,2,NULL,'تفکر و سواد رسانه ای',NULL,NULL,NULL),(267,'11011',NULL,2,NULL,'دینی و اخلاق 2',NULL,NULL,NULL),(268,'11111',NULL,3,NULL,'شیمی 2',NULL,NULL,NULL),(269,'11101',NULL,4,NULL,'فیزیک 2 رشته ریاضی',NULL,NULL,NULL),(270,'11061',NULL,3,NULL,'حسابان1',NULL,NULL,NULL),(271,'11071',NULL,2,NULL,'آمار و احتمال',NULL,NULL,NULL),(274,'11171',NULL,4,NULL,'زیست شناسی2',NULL,NULL,NULL),(275,'12131',NULL,2,NULL,'مدیریت خانواده و سبک زندگی',NULL,NULL,NULL),(276,'12121',NULL,2,NULL,'سلامت و بهداشت ',NULL,NULL,NULL),(277,'12022',NULL,1,NULL,'عربی زبان قرآن3 کاردانش',NULL,NULL,NULL),(278,'12031',NULL,2,NULL,'فارسی 3',NULL,NULL,NULL),(279,'12011',NULL,2,NULL,'دینی و اخلاق3  ',NULL,NULL,NULL),(280,'88150',NULL,2,NULL,'اخلاق حرفه ای',NULL,NULL,NULL),(281,'12141',NULL,2,NULL,'علوم اجتماعی ',NULL,NULL,NULL),(282,'88130',NULL,2,NULL,'مدیریت تولید',NULL,NULL,NULL),(283,'88120',NULL,2,NULL,'کاربرد فناوری های نوین',NULL,NULL,NULL),(286,'12041',NULL,2,NULL,'نگارش3',NULL,NULL,NULL),(287,'11161',NULL,4,NULL,'ریاضی2',NULL,NULL,NULL),(288,'10022',NULL,1,NULL,'عربی و زبان قرآن1-کاردانش',NULL,NULL,NULL),(289,'10121',NULL,2,NULL,'آزمایشگاه علوم 1',NULL,NULL,NULL),(290,'11331',NULL,3,NULL,'فیزیک 2 تجربی',NULL,NULL,NULL),(291,'12241',NULL,2,NULL,'مطالعات فرهنگی',NULL,NULL,NULL),(292,'88901',NULL,2,NULL,'فیزیک1 کاردانش',NULL,NULL,NULL),(293,'10092',NULL,2,NULL,'تربیت بدنی1',NULL,NULL,NULL),(294,'11092',NULL,2,NULL,'تربیت بدنی2',NULL,NULL,NULL),(295,'12091',NULL,2,NULL,'تربیت بدنی3',NULL,NULL,NULL),(297,'88140',NULL,3,NULL,'کارگاه نوآوری و کارآفرینی',NULL,NULL,NULL),(299,'24511',NULL,2,NULL,'تربیت بدنی1',NULL,NULL,NULL),(300,'24513',NULL,2,NULL,'فرهنگ و هنر1',NULL,NULL,NULL),(301,'24514',NULL,2,NULL,'کار و فناوری1',NULL,NULL,NULL),(303,'24711',NULL,2,NULL,'تربیت بدنی3',NULL,NULL,NULL),(304,'24713',NULL,2,NULL,'فرهنگ و هنر3',NULL,NULL,NULL),(305,'24714',NULL,2,NULL,'کار و فناوری3',NULL,NULL,NULL),(315,'24611',NULL,2,NULL,'تربیت بدنی2',NULL,NULL,NULL),(316,'24613',NULL,2,NULL,'فرهنگ و هنر2',NULL,NULL,NULL),(317,'24614',NULL,2,NULL,'کاروفناوری2',NULL,NULL,NULL),(321,'12021',NULL,2,NULL,'عربی،زبان قرآن3',NULL,NULL,NULL),(323,'12051',NULL,2,NULL,'هندسه3',NULL,NULL,NULL),(324,'12061',NULL,3,NULL,'حسابان2',NULL,NULL,NULL),(325,'12071',NULL,2,NULL,'ریاضیات گسسته',NULL,NULL,NULL),(326,'12081',NULL,4,NULL,'زبان خارجی3',NULL,NULL,NULL),(328,'12101',NULL,4,NULL,'فیزیک 3 ',NULL,NULL,NULL),(329,'12111',NULL,4,NULL,'شیمی3',NULL,NULL,NULL),(333,'12151',NULL,4,NULL,'زیست شناسی3',NULL,NULL,NULL),(334,'12161',NULL,4,NULL,'ریاضی3',NULL,NULL,NULL),(335,'12331',NULL,3,NULL,'فیزیک3 تجربی',NULL,NULL,NULL),(336,'12171',NULL,4,NULL,'دینی 3 انسانی',NULL,NULL,NULL),(337,'12181',NULL,2,NULL,'عربی3 انسانی',NULL,NULL,NULL),(338,'12191',NULL,2,NULL,'علوم و فنون ادبی3',NULL,NULL,NULL),(339,'12201',NULL,2,NULL,'ریاضی و آمار3',NULL,NULL,NULL),(340,'12211',NULL,2,NULL,'جغرافیا3',NULL,NULL,NULL),(341,'12221',NULL,2,NULL,'تاریخ3',NULL,NULL,NULL),(342,'12231',NULL,3,NULL,'جامعه شناسی3',NULL,NULL,NULL),(344,'12251',NULL,2,NULL,'فلسفه2',NULL,NULL,NULL),(345,'24520',NULL,2,NULL,'فارسی1',NULL,NULL,NULL),(346,'24521',NULL,1,NULL,'نگارش 1',NULL,NULL,NULL),(347,'24620',NULL,2,NULL,'فارسی2',NULL,NULL,NULL),(348,'24621',NULL,1,NULL,'نگارش2',NULL,NULL,NULL),(349,'24720',NULL,2,NULL,'فارسی3',NULL,NULL,NULL),(350,'24721',NULL,1,NULL,'نگارش3',NULL,NULL,NULL),(351,'88701',NULL,2,NULL,'زیست شناسی کاردانش',NULL,NULL,NULL),(352,'1111',NULL,4,NULL,'مهارت',NULL,NULL,NULL),(371,'14021',NULL,2,NULL,'کارگاه فناوری',NULL,NULL,NULL);
/*!40000 ALTER TABLE `reg_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_course_field`
--

LOCK TABLES `reg_course_field` WRITE;
/*!40000 ALTER TABLE `reg_course_field` DISABLE KEYS */;
INSERT INTO `reg_course_field` VALUES (139,32,218,_binary '\0',2),(141,1,218,_binary '\0',2),(143,3,218,_binary '\0',2),(150,1,219,_binary '\0',1),(151,3,219,_binary '\0',1),(158,32,288,_binary '\0',1),(171,32,238,_binary '\0',2),(173,1,238,_binary '\0',2),(174,3,238,_binary '\0',2),(175,2,238,_binary '\0',2),(177,1,239,_binary '\0',2),(178,3,239,_binary '\0',2),(182,3,220,_binary '\0',4),(183,1,220,_binary '\0',4),(184,1,221,_binary '\0',2),(187,32,222,_binary '\0',2),(188,2,222,_binary '\0',2),(189,3,222,_binary '\0',2),(193,1,222,_binary '\0',2),(196,3,223,_binary '\0',3),(197,1,223,_binary '\0',3),(198,2,223,_binary '\0',3),(205,32,241,_binary '\0',2),(211,1,293,_binary '\0',2),(214,32,293,_binary '\0',2),(215,2,293,_binary '\0',2),(216,3,293,_binary '\0',2),(218,1,224,_binary '\0',4),(219,3,225,_binary '\0',3),(220,1,225,_binary '\0',3),(221,1,289,_binary '\0',2),(222,3,289,_binary '\0',2),(225,2,227,_binary '\0',2),(226,32,227,_binary '\0',2),(228,3,227,_binary '\0',2),(233,1,227,_binary '\0',2),(234,3,228,_binary '\0',3),(235,2,261,_binary '\0',3),(236,2,229,_binary '\0',2),(237,2,230,_binary '\0',2),(238,2,231,_binary '\0',3),(239,2,232,_binary '\0',3),(245,32,233,_binary '\0',2),(246,2,233,_binary '\0',2),(254,32,234,_binary '\0',2),(256,2,234,_binary '\0',2),(258,2,235,_binary '\0',2),(259,3,236,_binary '\0',3),(266,32,267,_binary '\0',2),(267,1,267,_binary '\0',2),(269,3,267,_binary '\0',2),(270,1,253,_binary '\0',2),(271,3,253,_binary '\0',2),(275,32,263,_binary '\0',1),(281,32,244,_binary '\0',2),(283,1,244,_binary '\0',2),(284,3,244,_binary '\0',2),(285,2,244,_binary '\0',2),(291,1,256,_binary '\0',1),(292,3,256,_binary '\0',1),(293,1,265,_binary '\0',2),(294,1,270,_binary '\0',3),(295,1,271,_binary '\0',2),(296,1,249,_binary '\0',3),(297,2,249,_binary '\0',3),(298,3,249,_binary '\0',3),(300,32,262,_binary '\0',2),(310,32,294,_binary '\0',2),(314,2,294,_binary '\0',2),(315,3,294,_binary '\0',2),(316,1,294,_binary '\0',2),(318,1,269,_binary '\0',4),(319,1,268,_binary '\0',3),(320,3,268,_binary '\0',3),(321,3,226,_binary '\0',1),(322,1,226,_binary '\0',1),(324,1,248,_binary '\0',2),(326,2,248,_binary '\0',2),(327,3,248,_binary '\0',2),(328,32,248,_binary '\0',2),(335,3,255,_binary '\0',2),(337,32,255,_binary '\0',2),(340,1,255,_binary '\0',2),(344,3,259,_binary '\0',2),(345,1,259,_binary '\0',2),(346,3,287,_binary '\0',4),(347,3,274,_binary '\0',4),(349,2,252,_binary '\0',2),(350,2,257,_binary '\0',2),(351,2,250,_binary '\0',2),(352,2,264,_binary '\0',3),(353,2,254,_binary '\0',3),(354,2,245,_binary '\0',3),(355,2,260,_binary '\0',2),(356,2,258,_binary '\0',2),(357,3,290,_binary '\0',3),(358,1,279,_binary '',2),(359,3,279,_binary '',2),(366,32,279,_binary '\0',2),(368,1,321,_binary '',2),(369,3,321,_binary '',2),(370,32,277,_binary '\0',1),(378,1,278,_binary '',2),(379,3,278,_binary '',2),(380,2,278,_binary '',2),(383,32,278,_binary '\0',2),(389,2,286,_binary '\0',2),(390,3,286,_binary '\0',2),(391,1,286,_binary '\0',2),(392,1,323,_binary '',2),(393,1,324,_binary '',3),(394,1,325,_binary '',2),(395,2,326,_binary '',4),(396,3,326,_binary '',4),(397,1,326,_binary '',4),(399,2,295,_binary '\0',2),(404,32,295,_binary '\0',2),(406,3,295,_binary '\0',2),(407,1,295,_binary '\0',2),(409,1,328,_binary '',4),(410,3,329,_binary '',4),(411,1,329,_binary '',4),(412,2,276,_binary '',2),(413,3,276,_binary '',2),(414,1,276,_binary '',2),(421,32,276,_binary '\0',2),(427,32,275,_binary '\0',2),(431,1,275,_binary '\0',2),(432,3,275,_binary '\0',2),(433,2,275,_binary '\0',2),(434,3,281,_binary '',2),(435,1,281,_binary '',2),(443,32,281,_binary '\0',2),(444,3,333,_binary '',4),(445,3,334,_binary '',4),(446,2,336,_binary '',4),(447,2,337,_binary '',2),(448,2,338,_binary '',2),(449,2,339,_binary '',2),(450,2,340,_binary '',2),(451,2,341,_binary '',2),(452,2,342,_binary '',3),(453,2,291,_binary '\0',2),(454,2,344,_binary '',2),(455,3,335,_binary '',3),(462,1,266,_binary '\0',2),(463,3,266,_binary '\0',2),(464,2,266,_binary '\0',2),(466,32,266,_binary '\0',2),(467,32,292,_binary '\0',2),(476,32,243,_binary '\0',2),(487,32,280,_binary '\0',2),(492,32,297,_binary '\0',3),(502,32,282,_binary '\0',2),(510,32,283,_binary '\0',2),(521,32,242,_binary '\0',2),(523,4,207,_binary '\0',2),(524,4,155,_binary '\0',2),(526,4,120,_binary '\0',1),(528,4,189,_binary '\0',2),(529,4,172,_binary '\0',2),(530,4,196,_binary '\0',3),(531,4,163,_binary '\0',4),(532,4,299,_binary '\0',2),(533,4,111,_binary '\0',3),(534,4,300,_binary '\0',2),(535,4,301,_binary '\0',2),(536,4,140,_binary '\0',2),(537,4,209,_binary '\0',2),(538,4,157,_binary '\0',2),(540,4,122,_binary '\0',1),(542,4,191,_binary '\0',2),(543,4,175,_binary '\0',2),(544,4,198,_binary '\0',3),(545,4,166,_binary '\0',4),(546,4,315,_binary '\0',2),(548,4,113,_binary '\0',3),(549,4,316,_binary '\0',2),(550,4,317,_binary '\0',2),(551,4,141,_binary '\0',2),(552,4,211,_binary '\0',2),(553,4,158,_binary '\0',2),(555,4,123,_binary '\0',1),(557,4,194,_binary '\0',2),(558,4,177,_binary '\0',2),(559,4,200,_binary '\0',3),(560,4,167,_binary '\0',4),(561,4,303,_binary '\0',2),(562,4,115,_binary '\0',3),(563,4,304,_binary '\0',2),(564,4,305,_binary '\0',2),(565,4,131,_binary '\0',2),(566,2,246,_binary '\0',4),(567,2,239,_binary '\0',2),(568,2,256,_binary '\0',2),(724,4,345,_binary '\0',2),(725,4,346,_binary '\0',1),(726,4,347,_binary '\0',2),(727,4,348,_binary '\0',1),(728,4,349,_binary '\0',2),(729,4,350,_binary '\0',1),(902,32,352,_binary '\0',4),(967,3,371,_binary '\0',2);
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
INSERT INTO `reg_field` VALUES (1,'ریاضی و فیزیک',_binary '',NULL),(2,'ادبیات و علوم انسانی',_binary '',NULL),(3,'علوم تجربی',_binary '',NULL),(4,'متوسطه اول',_binary '',''),(5,'مدیریت و برنامه ریزی خانواده',_binary '','94101'),(6,'چاپ دستی',_binary '','99201'),(7,'تصویربرداری',_binary '',NULL),(8,'عیب‌یابی و مونتاژ سیم‌های رایانه‌ای',_binary '','61381'),(9,'تعمیر تلفن‌های رومیزی و همراه',_binary '','91112'),(10,'تعمیر دستگاه اداری',_binary '','91113'),(11,'تولید و توسعه‌دهنده پایگاه‌های اینترنتی',_binary '','91125'),(12,'تولید محتوای آموزشی الکترونیکی',_binary '','91123'),(13,'نقشه‌کشی صنعتی با رایانه',_binary '','61011'),(14,'نقشه‌کشی ساختمان',_binary '','61841'),(15,'امور باغی گیاهان زینتی و فضای سبز',_binary '','81211'),(16,'امور زراعی گیاهان دارویی',_binary '','81121'),(17,'دامپروری طیور و دام',_binary '','81112'),(18,'دامپروری طیور و حشرات مفید',_binary '','81111'),(19,'شیلات',_binary '','83110'),(20,'نان، شیرینی و شکلات',_binary '','92173'),(21,'دوخت لباس‌های محلی',_binary '\0','61501'),(22,'دوخت لباس‌های سنتی',_binary '\0','93155'),(23,'سراجی کیف',_binary '','93151'),(24,'سراجی دوزنده کفش',_binary '','93152'),(25,'تصویرسازی و جلوه‌های ویژه رایانه‌ای',_binary '','62321'),(26,'طراحی طلا و جواهر',_binary '','62261'),(27,'طلا و جواهرسازی',_binary '','93141'),(28,'تراش و تزئین شیشه و کریستال',_binary '','99441'),(29,'قلم‌زنی روی فلز',_binary '','97371'),(30,'تراش سنگ‌های قیمتی',_binary '','98471'),(31,'هنر آیینه‌کاری',_binary '','99221'),(32,'گرافیک رایانه‌ای',_binary '','99011'),(33,'عکاسی دیجیتال',_binary '','99211'),(34,'سازسازی (سنتور و سه‌تار)',_binary '','99171'),(35,'سازسازی سنتور (سه‌تار و ساز ضربی)',_binary '','99181'),(36,'سازسازی (سنتور و ساز ضربی)',_binary '','99261'),(37,'نوازندگی ساز ایرانی',_binary '','99411'),(38,'نوازندگی ساز جهانی',_binary '','99421'),(39,'آواز ایرانی',_binary '','99431'),(40,'آواز جهانی',_binary '','99361'),(41,'نگارگری',_binary '','99061'),(42,'تذهیب و تشعیر',_binary '','99071'),(43,'چهره‌سازی',_binary '','99161'),(44,'نقاشی ایرانی',_binary '','98411'),(45,'چهره‌پردازی',_binary '','93111'),(46,'چاپ باتیک و سیلک اسکرین',_binary '','98491'),(47,'صحافی و جلدسازی',_binary '','98501'),(48,'امور اداری',_binary '','94201'),(49,'مدیریت آشپزی و قنادی',_binary '','62241'),(50,'هتلداری',_binary '','61741'),(51,'راهنمای گردشگری',_binary '','62201'),(52,'تولید و پرورش گیاهان زینتی',_binary '','92152');
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

-- Dump completed on 2025-11-30 13:27:09
