/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : school_new

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 18/01/2025 17:40:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for finance_account
-- ----------------------------
DROP TABLE IF EXISTS `finance_account`;
CREATE TABLE `finance_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `person_name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `person_mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fisrt_payable` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14207 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_account
-- ----------------------------
INSERT INTO `finance_account` VALUES (14049, 'حامد  اسماعیلی', NULL, 'حامد  اسماعیلی', '09132199706', NULL, '2025-01-18 00:00:00', 'تست', 0);
INSERT INTO `finance_account` VALUES (14050, 'شیدا ححیدری سلطانیی', NULL, 'شیدا ححیدری سلطانیی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14051, 'شادي ترك زاده اشني', NULL, 'شادي ترك زاده اشني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14052, 'زينب شكراللهي يانچشمه', NULL, 'زينب شكراللهي يانچشمه', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14053, 'ریحانه کاظمی', NULL, 'ریحانه کاظمی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14054, 'سمیه جلالی جلال آبادی', NULL, 'سمیه جلالی جلال آبادی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14055, 'سید مرضیه طهماسبی', NULL, 'سید مرضیه طهماسبی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14056, 'الينا قلاني', NULL, 'الينا قلاني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14057, 'فاطمه گلبي قلعهء', NULL, 'فاطمه گلبي قلعهء', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14058, 'شادي كرمي', NULL, 'شادي كرمي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14059, 'زهرا  مرادی', NULL, 'زهرا  مرادی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14060, 'زهرا مرادي', NULL, 'زهرا مرادي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14061, 'زهرا محمدی', NULL, 'زهرا محمدی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14062, 'كيميا كاظمي', NULL, 'كيميا كاظمي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14063, 'زهرا مهدي چهل خانه', NULL, 'زهرا مهدي چهل خانه', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14064, 'مریم گرامی', NULL, 'مریم گرامی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14065, 'مهسا مهربان گهروئي', NULL, 'مهسا مهربان گهروئي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14066, 'زهرا حدادي بيستگاني', NULL, 'زهرا حدادي بيستگاني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14067, 'آتنا عباسي كله مسلماني', NULL, 'آتنا عباسي كله مسلماني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14068, 'نرگس صدري', NULL, 'نرگس صدري', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14069, 'مريم آقائي سميرمي', NULL, 'مريم آقائي سميرمي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14070, 'مرجان زارعي شمس آبادي', NULL, 'مرجان زارعي شمس آبادي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14071, 'منصوره وكيلي', NULL, 'منصوره وكيلي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14072, 'زهرا  سعیدی', NULL, 'زهرا  سعیدی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14073, 'عاطفه موسوی نهرخلجی', NULL, 'عاطفه موسوی نهرخلجی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14074, 'شيوا پرويزي', NULL, 'شيوا پرويزي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14075, 'فاطمه صحرائي', NULL, 'فاطمه صحرائي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14076, 'زهرا صادقي', NULL, 'زهرا صادقي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14077, 'مينا احمدي جو', NULL, 'مينا احمدي جو', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14078, 'زهرا مختاري مقدم', NULL, 'زهرا مختاري مقدم', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14079, 'فاطمه باقرزاده', NULL, 'فاطمه باقرزاده', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14080, 'ملیکا ژیلانسب', NULL, 'ملیکا ژیلانسب', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14081, 'زهرا كارآور', NULL, 'زهرا كارآور', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14082, 'الهه رئیسی وستگانی', NULL, 'الهه رئیسی وستگانی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14083, 'مبینا سادات شاه زیدی', NULL, 'مبینا سادات شاه زیدی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14084, 'نرجس طالبی', NULL, 'نرجس طالبی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14085, 'سارا مسعودي', NULL, 'سارا مسعودي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14086, 'پریناز اینالویی', NULL, 'پریناز اینالویی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14087, 'سارا صابری زفرقندی', NULL, 'سارا صابری زفرقندی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14088, 'آتنا قاسمي تبار', NULL, 'آتنا قاسمي تبار', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14089, 'محدیث غلامی سمسوری', NULL, 'محدیث غلامی سمسوری', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14090, 'فاطمه خالقی', NULL, 'فاطمه خالقی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14091, 'سارا دهاقانی', NULL, 'سارا دهاقانی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14092, 'ريحانه سادات سلطاني اورگاني', NULL, 'ريحانه سادات سلطاني اورگاني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14093, 'فاطمه رشیدی', NULL, 'فاطمه رشیدی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14094, 'بهار جعفري', NULL, 'بهار جعفري', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14095, 'نازنين حياتي دهلقي', NULL, 'نازنين حياتي دهلقي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14096, 'فاطمه نوري', NULL, 'فاطمه نوري', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14097, 'پرنيا جهانگيري نسب', NULL, 'پرنيا جهانگيري نسب', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14098, 'عصمت زارعان آدرمنابادي', NULL, 'عصمت زارعان آدرمنابادي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14099, 'مائده حيدري', NULL, 'مائده حيدري', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14100, 'مایده شجاعی جشوقانی', NULL, 'مایده شجاعی جشوقانی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14101, 'مهسا رسولي', NULL, 'مهسا رسولي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14102, 'زینب حقیقی زاده', NULL, 'زینب حقیقی زاده', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14103, 'نيلوفر هژيراطهر', NULL, 'نيلوفر هژيراطهر', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14104, 'صبا اميرحاجلو', NULL, 'صبا اميرحاجلو', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14105, 'فاطمه غلامي فشاركي', NULL, 'فاطمه غلامي فشاركي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14106, 'دینا محمودی', NULL, 'دینا محمودی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14107, 'كوثر مطلبي فشاركي', NULL, 'كوثر مطلبي فشاركي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14108, 'زكيه نصرآزاداني', NULL, 'زكيه نصرآزاداني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14109, 'نگار پورياي ولي', NULL, 'نگار پورياي ولي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14110, 'الناز بیات', NULL, 'الناز بیات', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14111, 'الناز بيات', NULL, 'الناز بيات', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14112, 'زهرا قجاوندبلتيجه', NULL, 'زهرا قجاوندبلتيجه', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14113, 'حديث كريم زاده باردئي', NULL, 'حديث كريم زاده باردئي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14114, 'ملينا معيني كربكندي', NULL, 'ملينا معيني كربكندي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14115, 'روژينا شمسي', NULL, 'روژينا شمسي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14116, 'مليكا اكبري مورناني', NULL, 'مليكا اكبري مورناني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14117, 'مائده سرلك چيوا', NULL, 'مائده سرلك چيوا', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14118, 'زهراسادات موسوي خرزوقي', NULL, 'زهراسادات موسوي خرزوقي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14119, 'آتنا كريمي', NULL, 'آتنا كريمي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14120, 'دنيا رمضاني دستجردي', NULL, 'دنيا رمضاني دستجردي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14121, 'رونيكا عباس پور', NULL, 'رونيكا عباس پور', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14122, 'مونا رئيسي فرد', NULL, 'مونا رئيسي فرد', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14123, 'ياسمن كياني ابري', NULL, 'ياسمن كياني ابري', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14124, 'نگار الماسي', NULL, 'نگار الماسي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14125, 'شيدا حيدري', NULL, 'شيدا حيدري', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14126, 'روژان مهدي راكي', NULL, 'روژان مهدي راكي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14127, 'مانيا مرتضائي دمآبي', NULL, 'مانيا مرتضائي دمآبي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14128, 'تبسم بيات', NULL, 'تبسم بيات', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14129, 'مهسا مطیعی جشوقانی', NULL, 'مهسا مطیعی جشوقانی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14130, 'فائزه صفدريان', NULL, 'فائزه صفدريان', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14131, 'ريحانه سادات اسدي', NULL, 'ريحانه سادات اسدي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14132, 'يگانه عابدي جوني', NULL, 'يگانه عابدي جوني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14133, 'مبينا احمدي', NULL, 'مبينا احمدي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14134, 'مهشيد بخشي', NULL, 'مهشيد بخشي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14135, 'پارميس مصباح', NULL, 'پارميس مصباح', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14136, 'مليكا طالبي اسمعيلان', NULL, 'مليكا طالبي اسمعيلان', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14137, 'مارال خرمي', NULL, 'مارال خرمي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14138, 'محدثه اوليائي', NULL, 'محدثه اوليائي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14139, 'مهسا فتوح', NULL, 'مهسا فتوح', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14140, 'مائده موسوي زاده', NULL, 'مائده موسوي زاده', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14141, 'ستايش سلطاني', NULL, 'ستايش سلطاني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14142, 'پرنيا شعباني افاراني', NULL, 'پرنيا شعباني افاراني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14143, 'نكيسا آتشگران خوزاني', NULL, 'نكيسا آتشگران خوزاني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14144, 'نرگس قره داغي رزوه', NULL, 'نرگس قره داغي رزوه', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14145, 'مهديه اصلاني كرچي', NULL, 'مهديه اصلاني كرچي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14146, 'هستي پورسردار', NULL, 'هستي پورسردار', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14147, 'زهرا بهرامي', NULL, 'زهرا بهرامي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14148, 'حديث خليليان پوربيدآبادي', NULL, 'حديث خليليان پوربيدآبادي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14149, 'زهرا بهارلوئي', NULL, 'زهرا بهارلوئي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14150, 'راضیه رضایی قلعه تکی', NULL, 'راضیه رضایی قلعه تکی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14151, 'راضيه رضائي قلعه تكي', NULL, 'راضيه رضائي قلعه تكي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14152, 'شكيلا كلانتري دهقي', NULL, 'شكيلا كلانتري دهقي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14153, 'آرزو طراحان', NULL, 'آرزو طراحان', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14154, 'نازنين زهرا داوري دولت آبادي', NULL, 'نازنين زهرا داوري دولت آبادي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14155, 'هستي محمدي آشياني', NULL, 'هستي محمدي آشياني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14156, 'پرنيا جرياني', NULL, 'پرنيا جرياني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14157, 'مهديس مرادي كلبي بيگي', NULL, 'مهديس مرادي كلبي بيگي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14158, 'هستي روحاني قهساره', NULL, 'هستي روحاني قهساره', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14159, 'فاطمه بزرگي علي آبادي', NULL, 'فاطمه بزرگي علي آبادي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14160, 'نگين رضائي مزرعه', NULL, 'نگين رضائي مزرعه', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14161, 'النا كورنگي', NULL, 'النا كورنگي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14162, 'پریناز یزدانی', NULL, 'پریناز یزدانی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14163, 'شيماء جادري', NULL, 'شيماء جادري', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14164, 'سمیه رنجکش ادرمنابادی', NULL, 'سمیه رنجکش ادرمنابادی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14165, 'زينب عابدپوردهاقاني', NULL, 'زينب عابدپوردهاقاني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14166, 'فاطمه اعرابي', NULL, 'فاطمه اعرابي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14167, 'مريم سنجري مورچگاني', NULL, 'مريم سنجري مورچگاني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14168, 'فرزانه محمدخاني', NULL, 'فرزانه محمدخاني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14169, 'طاهره سنجري مورچگاني', NULL, 'طاهره سنجري مورچگاني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14170, 'ساره ملک محمدی', NULL, 'ساره ملک محمدی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14171, 'عسل خدابخش', NULL, 'عسل خدابخش', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14172, 'تارا طهماسبي زاده', NULL, 'تارا طهماسبي زاده', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14173, 'سارا طاهری مفرد', NULL, 'سارا طاهری مفرد', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14174, 'افسانه سلطاني منصورنژاد', NULL, 'افسانه سلطاني منصورنژاد', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14175, 'سوگند شريفي قاسمي', NULL, 'سوگند شريفي قاسمي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14176, 'شقایق همایون پور', NULL, 'شقایق همایون پور', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14177, 'سكينه كرمي', NULL, 'سكينه كرمي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14178, 'هستي فتحي هرسيني', NULL, 'هستي فتحي هرسيني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14179, 'مژگان رضایی', NULL, 'مژگان رضایی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14180, 'گلزاده والانیک', NULL, 'گلزاده والانیک', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14181, 'زينب رمضاني گهروئي', NULL, 'زينب رمضاني گهروئي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14182, 'پريسا رسولي هاروني', NULL, 'پريسا رسولي هاروني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14183, 'رضوان اصغرزاده', NULL, 'رضوان اصغرزاده', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14184, 'مرضيه شهراني كراني', NULL, 'مرضيه شهراني كراني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14185, 'سولماز درشوري', NULL, 'سولماز درشوري', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14186, 'فاطمه حاتمي پور', NULL, 'فاطمه حاتمي پور', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14187, 'عفت صادقي', NULL, 'عفت صادقي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14188, 'شهناز احمدی دستجردی', NULL, 'شهناز احمدی دستجردی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14189, 'بيتا نوري امامزاده', NULL, 'بيتا نوري امامزاده', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14190, 'زهرا کاظم زاده', NULL, 'زهرا کاظم زاده', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14191, 'مريم امامي گشنيزجاني', NULL, 'مريم امامي گشنيزجاني', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14192, 'پریسا رفیعی', NULL, 'پریسا رفیعی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14193, 'سحر محرابي', NULL, 'سحر محرابي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14194, 'پريسا رفيعي مياندشتي', NULL, 'پريسا رفيعي مياندشتي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14195, 'سمیه سرایی', NULL, 'سمیه سرایی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14196, 'زهرا شكيبا', NULL, 'زهرا شكيبا', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14197, 'ساناز ميرزائي', NULL, 'ساناز ميرزائي', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14198, 'سودابه رحیمی', NULL, 'سودابه رحیمی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14199, 'ثریا محمدی', NULL, 'ثریا محمدی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14200, 'زینب قلی زاده', NULL, 'زینب قلی زاده', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14201, 'مبینا رسولی', NULL, 'مبینا رسولی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14202, 'ثریا نوروزی', NULL, 'ثریا نوروزی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14203, 'حمیرا مرادی', NULL, 'حمیرا مرادی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14204, 'فاطمه نیک زاد', NULL, 'فاطمه نیک زاد', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14205, 'نرگس رضایی', NULL, 'نرگس رضایی', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14206, 'ذاکره حسن زاده', NULL, 'ذاکره حسن زاده', NULL, NULL, '2025-01-18 00:00:00', NULL, 0);

-- ----------------------------
-- Table structure for finance_account_bank
-- ----------------------------
DROP TABLE IF EXISTS `finance_account_bank`;
CREATE TABLE `finance_account_bank`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `bank_id` bigint NULL DEFAULT NULL,
  `first_amount` bigint NULL DEFAULT NULL,
  `is_cash` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bank_id`(`bank_id` ASC) USING BTREE,
  CONSTRAINT `finance_account_bank_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `finance_bank` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_account_bank
-- ----------------------------
INSERT INTO `finance_account_bank` VALUES (10, 'حساب مرکزی ملی', 1, 0, b'0');
INSERT INTO `finance_account_bank` VALUES (20, 'صندوق', NULL, 0, b'1');

-- ----------------------------
-- Table structure for finance_bank
-- ----------------------------
DROP TABLE IF EXISTS `finance_bank`;
CREATE TABLE `finance_bank`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_bank
-- ----------------------------
INSERT INTO `finance_bank` VALUES (1, 'ملی');
INSERT INTO `finance_bank` VALUES (2, 'صادرات');
INSERT INTO `finance_bank` VALUES (3, 'مسکن');
INSERT INTO `finance_bank` VALUES (4, 'سپه');

-- ----------------------------
-- Table structure for finance_check
-- ----------------------------
DROP TABLE IF EXISTS `finance_check`;
CREATE TABLE `finance_check`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime NULL DEFAULT NULL,
  `number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `amount` bigint NULL DEFAULT NULL,
  `for_how` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `check_date` date NULL DEFAULT NULL,
  `bank_id` bigint NULL DEFAULT NULL,
  `bank_branch` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status_id` bigint NULL DEFAULT NULL,
  `account_id` bigint NULL DEFAULT NULL,
  `bank_account_id` bigint NULL DEFAULT NULL,
  `pay_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bank_id`(`bank_id` ASC) USING BTREE,
  INDEX `status_id`(`status_id` ASC) USING BTREE,
  INDEX `account_id`(`account_id` ASC) USING BTREE,
  INDEX `bank_account_id`(`bank_account_id` ASC) USING BTREE,
  CONSTRAINT `finance_check_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `finance_bank` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finance_check_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `finance_check_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finance_check_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `finance_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finance_check_ibfk_4` FOREIGN KEY (`bank_account_id`) REFERENCES `finance_account_bank` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_check
-- ----------------------------

-- ----------------------------
-- Table structure for finance_check_status
-- ----------------------------
DROP TABLE IF EXISTS `finance_check_status`;
CREATE TABLE `finance_check_status`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_check_status
-- ----------------------------
INSERT INTO `finance_check_status` VALUES (1, 'برگشت خورده');
INSERT INTO `finance_check_status` VALUES (2, 'پاس شده');
INSERT INTO `finance_check_status` VALUES (3, 'اولیه');

-- ----------------------------
-- Table structure for finance_factor
-- ----------------------------
DROP TABLE IF EXISTS `finance_factor`;
CREATE TABLE `finance_factor`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_person_id` bigint NULL DEFAULT NULL,
  `amount` bigint NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `type_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_person_id`(`account_person_id` ASC) USING BTREE,
  INDEX `type_id`(`type_id` ASC) USING BTREE,
  CONSTRAINT `finance_factor_ibfk_1` FOREIGN KEY (`account_person_id`) REFERENCES `finance_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finance_factor_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `finance_factor_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33418 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_factor
-- ----------------------------
INSERT INTO `finance_factor` VALUES (33417, 14049, -14640000, '2025-01-18 00:00:00', NULL, 1);

-- ----------------------------
-- Table structure for finance_factor_type
-- ----------------------------
DROP TABLE IF EXISTS `finance_factor_type`;
CREATE TABLE `finance_factor_type`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_factor_type
-- ----------------------------
INSERT INTO `finance_factor_type` VALUES (1, 'هزینه ثبت نام');
INSERT INTO `finance_factor_type` VALUES (2, 'هزینه صدور کارت');

-- ----------------------------
-- Table structure for finance_receive_pay_type
-- ----------------------------
DROP TABLE IF EXISTS `finance_receive_pay_type`;
CREATE TABLE `finance_receive_pay_type`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_receive_pay_type
-- ----------------------------
INSERT INTO `finance_receive_pay_type` VALUES (1, 'نقدی');
INSERT INTO `finance_receive_pay_type` VALUES (2, 'pos');
INSERT INTO `finance_receive_pay_type` VALUES (3, 'فیش بانکی');
INSERT INTO `finance_receive_pay_type` VALUES (4, 'پاس شدن چک');

-- ----------------------------
-- Table structure for finance_receive_payment
-- ----------------------------
DROP TABLE IF EXISTS `finance_receive_payment`;
CREATE TABLE `finance_receive_payment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `event_date` datetime NULL DEFAULT NULL,
  `amount` bigint NULL DEFAULT NULL,
  `account_bank_id` bigint NULL DEFAULT NULL,
  `account_person_id` bigint NULL DEFAULT NULL,
  `receive_pay_type_id` bigint NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_bank_id`(`account_bank_id` ASC) USING BTREE,
  INDEX `receive_pay_type_id`(`receive_pay_type_id` ASC) USING BTREE,
  INDEX `account_person_id`(`account_person_id` ASC) USING BTREE,
  CONSTRAINT `finance_receive_payment_ibfk_1` FOREIGN KEY (`account_bank_id`) REFERENCES `finance_account_bank` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finance_receive_payment_ibfk_3` FOREIGN KEY (`receive_pay_type_id`) REFERENCES `finance_receive_pay_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finance_receive_payment_ibfk_4` FOREIGN KEY (`account_person_id`) REFERENCES `finance_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43298 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_receive_payment
-- ----------------------------
INSERT INTO `finance_receive_payment` VALUES (43297, '2025-01-18 00:00:00', 14640000, 10, 14049, 2, '', '');

-- ----------------------------
-- Table structure for reg_base
-- ----------------------------
DROP TABLE IF EXISTS `reg_base`;
CREATE TABLE `reg_base`  (
  `base_id` bigint NOT NULL DEFAULT 0,
  `base_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`base_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_base
-- ----------------------------
INSERT INTO `reg_base` VALUES (1, 'پايه هفتم');
INSERT INTO `reg_base` VALUES (2, 'پايه هشتم');
INSERT INTO `reg_base` VALUES (3, 'پايه نهم');
INSERT INTO `reg_base` VALUES (4, 'پايه دهم');
INSERT INTO `reg_base` VALUES (5, 'پايه يازدهم');
INSERT INTO `reg_base` VALUES (6, 'پايه دوازدهم');

-- ----------------------------
-- Table structure for reg_base_level
-- ----------------------------
DROP TABLE IF EXISTS `reg_base_level`;
CREATE TABLE `reg_base_level`  (
  `base_id` bigint NOT NULL,
  `base_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`base_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_base_level
-- ----------------------------
INSERT INTO `reg_base_level` VALUES (1, 'پايه هفتم');
INSERT INTO `reg_base_level` VALUES (2, 'پايه هشتم');
INSERT INTO `reg_base_level` VALUES (3, 'پايه نهم');
INSERT INTO `reg_base_level` VALUES (4, 'پايه دهم');
INSERT INTO `reg_base_level` VALUES (5, 'پايه يازدهم');
INSERT INTO `reg_base_level` VALUES (6, 'پايه دوازدهم');

-- ----------------------------
-- Table structure for reg_course
-- ----------------------------
DROP TABLE IF EXISTS `reg_course`;
CREATE TABLE `reg_course`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `unit` int NULL DEFAULT NULL,
  `is_final` bit(1) NULL DEFAULT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `has_online` bit(1) NULL DEFAULT NULL,
  `present_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 371 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_course
-- ----------------------------
INSERT INTO `reg_course` VALUES (111, '24512', NULL, NULL, NULL, 'اجتماعی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (113, '24612', NULL, NULL, NULL, 'اجتماعی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (115, '24712', NULL, NULL, NULL, 'اجتماعی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (116, '5403', NULL, NULL, NULL, 'ادبیات فارسی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (117, '5437', NULL, NULL, NULL, 'ادبیات فارسی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (118, '5449', NULL, NULL, NULL, 'اقتصاد', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (120, '24504', NULL, NULL, NULL, 'املاء1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (122, '24604', NULL, NULL, NULL, 'املاء2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (123, '24704', NULL, NULL, NULL, 'املاء3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (124, '24705', NULL, NULL, NULL, 'انشاء3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (125, '24505', NULL, NULL, NULL, 'انشاء1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (127, '24605', NULL, NULL, NULL, 'انشاء2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (129, '5722', NULL, NULL, NULL, 'ایمنی و بهداشت کار', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (131, '24717', NULL, NULL, NULL, 'آمادگی دفاعی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (132, '5447', NULL, NULL, NULL, 'آمار و مدل سازی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (133, '1450', NULL, NULL, NULL, 'تاریخ', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (135, '5522', NULL, NULL, NULL, 'تاریخ ادبیات ایران و جهان2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (136, '5451', NULL, NULL, NULL, 'تاریخ ادبیات ایران وجهان1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (137, '5450', NULL, NULL, NULL, 'تاریخ ایران و جهان1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (138, '5518', NULL, NULL, NULL, 'تاریخ معاصر', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (140, '24515', NULL, NULL, NULL, 'تفکر و سبک زندگی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (141, '24615', NULL, NULL, NULL, 'تفکر و سبک زندگی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (142, '5448', NULL, NULL, NULL, 'جامعه شناسی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (143, '5452', NULL, NULL, NULL, 'جغرافیا1 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (145, '5446', NULL, NULL, NULL, 'جغرافیای عمومی استان', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (146, '1455', NULL, NULL, NULL, 'جفرافیا', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (150, '5461', NULL, NULL, NULL, 'آمادگی دفاعی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (151, '5434', NULL, NULL, NULL, 'دین و زندگی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (152, '5491', NULL, NULL, NULL, 'دین و زندگی3 کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (154, '5401', NULL, NULL, NULL, 'دینی و زندگی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (155, '24502', NULL, NULL, NULL, 'معارف اسلامی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (157, '24602', NULL, NULL, NULL, 'معارف اسلامی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (158, '24702', NULL, NULL, NULL, 'معارف اسلامی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (159, '5520', NULL, NULL, NULL, 'روان شناسی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (160, '1486', NULL, NULL, NULL, 'ریاضی پایه', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (161, '1478', NULL, NULL, NULL, 'ریاضی عمومی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (162, '5408', NULL, NULL, NULL, 'ریاضی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (163, '24510', NULL, NULL, NULL, 'ریاضی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (164, '5443', NULL, NULL, NULL, 'ریاضی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (166, '24610', NULL, NULL, NULL, 'ریاضی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (167, '24710', NULL, NULL, NULL, 'ریاضی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (168, '1460', NULL, NULL, NULL, 'ریاضیات گسسته', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (170, '1475', NULL, NULL, NULL, 'زبان خارجه', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (171, '5405', NULL, NULL, NULL, 'زبان خارجه1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (172, '24508', NULL, NULL, NULL, 'زبان خارجه1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (173, '5440', NULL, NULL, NULL, 'زبان خارجه2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (175, '24608', NULL, NULL, NULL, 'زبان خارجه2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (177, '24708', NULL, NULL, NULL, 'زبان خارجه3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (178, '5436', NULL, NULL, NULL, 'زبان فارسی 2 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (179, '5402', NULL, NULL, NULL, 'زبان فارسی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (180, '5435', NULL, NULL, NULL, 'زبان فارسی2 سایررشته ها', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (181, '5445', NULL, NULL, NULL, 'زیست شناسی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (182, '1480', NULL, NULL, NULL, 'شیمی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (183, '5414', NULL, NULL, NULL, 'شیمی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (184, '5442', NULL, NULL, NULL, 'شیمی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (185, '5438', NULL, NULL, NULL, 'عربی 2  سایر رشته ها', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (186, '5463', NULL, NULL, NULL, 'عربی 2/1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (187, '5464', NULL, NULL, NULL, 'عربی 2/2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (188, '5404', NULL, NULL, NULL, 'عربی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (189, '24507', NULL, NULL, NULL, 'عربی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (191, '24607', NULL, NULL, NULL, 'عربی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (192, '5439', NULL, NULL, NULL, 'عربی2 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (194, '24707', NULL, NULL, NULL, 'عربی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (195, '1451', NULL, NULL, NULL, 'علوم اجتماعی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (196, '24509', NULL, NULL, NULL, 'علوم تجربی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (198, '24609', NULL, NULL, NULL, 'علوم تجربی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (200, '24709', NULL, NULL, NULL, 'علوم تجربی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (201, '1481', NULL, NULL, NULL, 'علوم زمین', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (202, '5410', NULL, NULL, NULL, 'علوم زیستی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (203, '1456', NULL, NULL, NULL, 'فلسفه', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (204, '5413', NULL, NULL, NULL, 'فیزیک1 و آز', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (205, '5441', NULL, NULL, NULL, 'فیزیک2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (206, '5723', NULL, NULL, NULL, 'قانون کار', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (207, '24501', NULL, NULL, NULL, 'قرآن1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (209, '24601', NULL, NULL, NULL, 'قرآن2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (211, '24701', NULL, NULL, NULL, 'قرآن3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (212, '5721', NULL, NULL, NULL, 'کارآفرینی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (213, '5517', NULL, NULL, NULL, 'مبانی کامپیوتر وانفورماتیک', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (214, '5409', NULL, NULL, NULL, 'مطالعات اجتماعی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (215, '5444', NULL, NULL, NULL, 'هندسه 1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (216, '1458', NULL, NULL, NULL, 'هندسه تحلیلی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (218, '10011', NULL, NULL, NULL, 'دینی و اخلاق1', NULL, b'1', '25');
INSERT INTO `reg_course` VALUES (219, '10021', NULL, NULL, NULL, 'عربی و زبان قرآن1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (220, '10051', NULL, NULL, NULL, 'ریاضی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (221, '10061', NULL, NULL, NULL, 'هندسه1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (222, '10071', NULL, NULL, NULL, 'آمادگی دفاعی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (223, '10081', NULL, NULL, NULL, 'زبان خارجی1-نظری', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (224, '10101', NULL, NULL, NULL, 'فیزیک1 رشته ریاضی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (225, '10111', NULL, NULL, NULL, 'شیمی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (226, '11121', NULL, NULL, NULL, 'آزمایشگاه علوم2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (227, '10131', NULL, NULL, NULL, 'جغرافیا عمومی', NULL, b'1', '22');
INSERT INTO `reg_course` VALUES (228, '10141', NULL, NULL, NULL, 'زیست شناسی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (229, '10161', NULL, NULL, NULL, 'عربی 1 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (230, '10171', NULL, NULL, NULL, 'علوم و فنون ادبی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (231, '10181', NULL, NULL, NULL, 'ریاضی و آمار1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (232, '10191', NULL, NULL, NULL, 'تاریخ1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (233, '10201', NULL, NULL, NULL, 'جامعه شناسی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (234, '10211', NULL, NULL, NULL, 'اقتصاد', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (235, '10221', NULL, NULL, NULL, 'منطق', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (236, '10291', NULL, NULL, NULL, 'فیزیک1 تجربی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (238, '10031', NULL, NULL, NULL, 'فارسی1', NULL, b'1', '21');
INSERT INTO `reg_course` VALUES (239, '10041', NULL, NULL, NULL, 'نگارش 1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (241, '10082', NULL, NULL, NULL, 'زبان خارجه1-کاردانش', NULL, b'1', '24');
INSERT INTO `reg_course` VALUES (242, '88110', NULL, NULL, NULL, 'الزامات محیط کار', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (243, '88610', NULL, NULL, NULL, 'ریاضی1 کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (244, '11031', NULL, NULL, NULL, 'فارسی 2 - کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (245, '11241', NULL, NULL, NULL, 'جامعه شناسی 2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (246, '11181', NULL, NULL, NULL, 'دینی و اخلاق 2 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (248, '11131', NULL, NULL, NULL, 'انسان و محیط زیست', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (249, '11081', NULL, NULL, NULL, 'زبان خارجه (2)', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (250, '11211', NULL, NULL, NULL, 'ریاضی و آمار2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (252, '11191', NULL, NULL, NULL, 'عربی 2 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (253, '11021', NULL, NULL, NULL, 'عربی 2 ریاضی وتجربی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (254, '11231', NULL, NULL, NULL, 'تاریخ 2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (255, '11141', NULL, NULL, NULL, 'تاریخ معاصر', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (256, '11041', NULL, NULL, NULL, 'نگارش2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (257, '11201', NULL, NULL, NULL, 'علوم و فنون ادبی 2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (258, '11261', NULL, NULL, NULL, 'فلسفه', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (259, '11151', NULL, NULL, NULL, 'زمین شناسی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (260, '11251', NULL, NULL, NULL, 'روان شناسی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (261, '10151', NULL, NULL, NULL, 'دینی 1 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (262, '11082', NULL, NULL, NULL, 'زبان خارجه(2) کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (263, '11022', NULL, NULL, NULL, 'عربی (2) کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (264, '11221', NULL, NULL, NULL, 'جغرافیا2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (265, '11051', NULL, NULL, NULL, 'هندسه 2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (266, '14031', NULL, NULL, NULL, 'تفکر و سواد رسانه ای', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (267, '11011', NULL, NULL, NULL, 'دینی و اخلاق 2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (268, '11111', NULL, NULL, NULL, 'شیمی 2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (269, '11101', NULL, NULL, NULL, 'فیزیک 2 رشته ریاضی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (270, '11061', NULL, NULL, NULL, 'حسابان1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (271, '11071', NULL, NULL, NULL, 'آمار و احتمال', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (274, '11171', NULL, NULL, NULL, 'زیست شناسی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (275, '12131', NULL, NULL, NULL, 'مدیریت خانواده و سبک زندگی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (276, '12121', NULL, NULL, NULL, 'سلامت و بهداشت ', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (277, '12022', NULL, NULL, NULL, 'عربی زبان قرآن3 کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (278, '12031', NULL, NULL, NULL, 'فارسی 3', NULL, b'1', '5');
INSERT INTO `reg_course` VALUES (279, '12011', NULL, NULL, NULL, 'دینی و اخلاق3  ', 'به جز انسانی - همه رشته ها', NULL, NULL);
INSERT INTO `reg_course` VALUES (280, '88150', NULL, NULL, NULL, 'اخلاق حرفه ای', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (281, '12141', NULL, NULL, NULL, 'علوم اجتماعی ', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (282, '88130', NULL, NULL, NULL, 'مدیریت تولید', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (283, '88120', NULL, NULL, NULL, 'کاربرد فناوری های نوین', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (286, '12041', NULL, NULL, NULL, 'نگارش3', NULL, b'1', NULL);
INSERT INTO `reg_course` VALUES (287, '11161', NULL, NULL, NULL, 'ریاضی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (288, '10022', NULL, NULL, NULL, 'عربی و زبان قرآن1-کاردانش', NULL, b'1', '23');
INSERT INTO `reg_course` VALUES (289, '10121', NULL, NULL, NULL, 'آزمایشگاه علوم 1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (290, '11331', NULL, NULL, NULL, 'فیزیک 2 تجربی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (291, '12241', NULL, NULL, NULL, 'مطالعات فرهنگی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (292, '88901', NULL, NULL, NULL, 'فیزیک1 کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (293, '10092', NULL, NULL, NULL, 'تربیت بدنی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (294, '11092', NULL, NULL, NULL, 'تربیت بدنی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (295, '12091', NULL, NULL, NULL, 'تربیت بدنی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (297, '88140', NULL, NULL, NULL, 'کارگاه نوآوری و کارآفرینی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (298, '24503', NULL, NULL, NULL, 'قرائت فارسی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (299, '24511', NULL, NULL, NULL, 'تربیت بدنی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (300, '24513', NULL, NULL, NULL, 'فرهنگ و هنر1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (301, '24514', NULL, NULL, NULL, 'کار و فناوری1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (302, '24703', NULL, NULL, NULL, 'قرائت فارسی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (303, '24711', NULL, NULL, NULL, 'تربیت بدنی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (304, '24713', NULL, NULL, NULL, 'فرهنگ و هنر3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (305, '24714', NULL, NULL, NULL, 'کار و فناوری3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (308, '24603', NULL, NULL, NULL, 'قرائت فارسی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (315, '24611', NULL, NULL, NULL, 'تربیت بدنی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (316, '24613', NULL, NULL, NULL, 'فرهنگ و هنر2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (317, '24614', NULL, NULL, NULL, 'کاروفناوری2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (321, '12021', NULL, NULL, NULL, 'عربی،زبان قرآن3', 'تجربی و ریاضی', b'1', '8');
INSERT INTO `reg_course` VALUES (323, '12051', NULL, NULL, NULL, 'هندسه3', NULL, b'1', '20');
INSERT INTO `reg_course` VALUES (324, '12061', NULL, NULL, NULL, 'حسابان2', NULL, b'1', '10');
INSERT INTO `reg_course` VALUES (325, '12071', NULL, NULL, NULL, 'ریاضیات گسسته', NULL, b'1', '19');
INSERT INTO `reg_course` VALUES (326, '12081', NULL, NULL, NULL, 'زبان خارجی3', NULL, b'1', '18');
INSERT INTO `reg_course` VALUES (328, '12101', NULL, NULL, NULL, 'فیزیک 3 ', 'ریاضی', b'1', '7');
INSERT INTO `reg_course` VALUES (329, '12111', NULL, NULL, NULL, 'شیمی3', NULL, b'1', '15');
INSERT INTO `reg_course` VALUES (333, '12151', NULL, NULL, NULL, 'زیست شناسی3', NULL, b'1', '2');
INSERT INTO `reg_course` VALUES (334, '12161', NULL, NULL, NULL, 'ریاضی3', NULL, b'1', '11');
INSERT INTO `reg_course` VALUES (335, '12331', NULL, NULL, NULL, 'فیزیک3 تجربی', NULL, b'1', '7');
INSERT INTO `reg_course` VALUES (336, '12171', NULL, NULL, NULL, 'دینی 3 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (337, '12181', NULL, NULL, NULL, 'عربی3 انسانی', NULL, b'1', '17');
INSERT INTO `reg_course` VALUES (338, '12191', NULL, NULL, NULL, 'علوم و فنون ادبی3', NULL, b'1', '9');
INSERT INTO `reg_course` VALUES (339, '12201', NULL, NULL, NULL, 'ریاضی و آمار3', NULL, b'1', '14');
INSERT INTO `reg_course` VALUES (340, '12211', NULL, NULL, NULL, 'جغرافیا3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (341, '12221', NULL, NULL, NULL, 'تاریخ3', NULL, b'1', '13');
INSERT INTO `reg_course` VALUES (342, '12231', NULL, NULL, NULL, 'جامعه شناسی3', NULL, b'1', '12');
INSERT INTO `reg_course` VALUES (344, '12251', NULL, NULL, NULL, 'فلسفه2', NULL, b'1', '16');
INSERT INTO `reg_course` VALUES (345, '24520', NULL, NULL, NULL, 'فارسی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (346, '24521', NULL, NULL, NULL, 'نگارش 1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (347, '24620', NULL, NULL, NULL, 'فارسی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (348, '24621', NULL, NULL, NULL, 'نگارش2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (349, '24720', NULL, NULL, NULL, 'فارسی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (350, '24721', NULL, NULL, NULL, 'نگارش3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (351, '88701', NULL, NULL, NULL, 'زیست شناسی کاردانش', 'کاردانش', NULL, NULL);
INSERT INTO `reg_course` VALUES (352, '1111', NULL, NULL, NULL, 'مهارت', 'کاردانش', NULL, NULL);
INSERT INTO `reg_course` VALUES (353, '121411', NULL, NULL, NULL, 'علوم اجتماعی نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (354, '121211', NULL, NULL, NULL, 'سلامت و بهداشت نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (355, '120111', NULL, NULL, NULL, 'دینی 3 نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (356, '120311', NULL, NULL, NULL, 'فارسی 3 نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (357, '100111', NULL, NULL, b'1', '   دینی و اخلاق 1 نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (358, '100211', NULL, NULL, b'1', 'عربی و زبان قرآن1 نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (359, '102111', NULL, NULL, b'1', 'اقتصاد نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (360, '100811', NULL, NULL, NULL, 'زبان خارجی1-نظری نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (361, '100311', NULL, NULL, NULL, 'فارسی1 نهایی', NULL, b'1', '21');
INSERT INTO `reg_course` VALUES (362, '101311', NULL, NULL, NULL, 'جغرافیا عمومی نهایی', NULL, b'1', '22');
INSERT INTO `reg_course` VALUES (363, '102011', NULL, NULL, NULL, 'جامعه شناسی1 نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (364, '110111', NULL, NULL, NULL, ' دینی و اخلاق 2 نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (365, '110211', NULL, NULL, NULL, 'عربی 2 ریاضی وتجربی نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (367, '110811', NULL, NULL, NULL, 'زبان خارجه (2) نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (368, '110311', NULL, NULL, NULL, 'فارسی 2 - کاردانش نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (369, '111311', NULL, NULL, NULL, 'انسان و محیط زیست نهایی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (370, '111411', NULL, NULL, NULL, 'تاریخ معاصر نهایی', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for reg_course_field
-- ----------------------------
DROP TABLE IF EXISTS `reg_course_field`;
CREATE TABLE `reg_course_field`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `field_id` bigint NOT NULL,
  `course_id` bigint NOT NULL,
  `is_final` bit(1) NULL DEFAULT NULL,
  `unitCount` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `field_id`(`field_id` ASC, `course_id` ASC) USING BTREE,
  INDEX `course_id`(`course_id` ASC) USING BTREE,
  CONSTRAINT `reg_course_field_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `reg_field` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_course_field_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `reg_course` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1171 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_course_field
-- ----------------------------
INSERT INTO `reg_course_field` VALUES (138, 10, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (139, 4, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (140, 15, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (141, 1, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (142, 11, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (143, 2, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (144, 7, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (145, 14, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (146, 9, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (147, 8, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (150, 1, 219, b'0', 1);
INSERT INTO `reg_course_field` VALUES (151, 2, 219, b'0', 1);
INSERT INTO `reg_course_field` VALUES (158, 4, 288, b'0', 1);
INSERT INTO `reg_course_field` VALUES (159, 10, 288, b'0', 1);
INSERT INTO `reg_course_field` VALUES (160, 15, 288, b'0', 1);
INSERT INTO `reg_course_field` VALUES (161, 11, 288, b'0', 1);
INSERT INTO `reg_course_field` VALUES (162, 9, 288, b'0', 1);
INSERT INTO `reg_course_field` VALUES (163, 8, 288, b'0', 1);
INSERT INTO `reg_course_field` VALUES (164, 7, 288, b'0', 1);
INSERT INTO `reg_course_field` VALUES (165, 14, 288, b'0', 1);
INSERT INTO `reg_course_field` VALUES (166, 9, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (167, 10, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (168, 11, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (169, 14, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (170, 15, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (171, 4, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (172, 8, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (173, 1, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (174, 2, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (175, 3, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (176, 7, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (177, 1, 239, b'0', 2);
INSERT INTO `reg_course_field` VALUES (178, 2, 239, b'0', 2);
INSERT INTO `reg_course_field` VALUES (182, 2, 220, b'0', 4);
INSERT INTO `reg_course_field` VALUES (183, 1, 220, b'0', 4);
INSERT INTO `reg_course_field` VALUES (184, 1, 221, b'0', 2);
INSERT INTO `reg_course_field` VALUES (185, 15, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (186, 14, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (187, 4, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (188, 3, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (189, 2, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (190, 9, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (191, 8, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (192, 7, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (193, 1, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (194, 11, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (195, 10, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (196, 2, 223, b'0', 3);
INSERT INTO `reg_course_field` VALUES (197, 1, 223, b'0', 3);
INSERT INTO `reg_course_field` VALUES (198, 3, 223, b'0', 3);
INSERT INTO `reg_course_field` VALUES (199, 8, 241, b'0', 2);
INSERT INTO `reg_course_field` VALUES (200, 15, 241, b'0', 2);
INSERT INTO `reg_course_field` VALUES (201, 10, 241, b'0', 2);
INSERT INTO `reg_course_field` VALUES (202, 9, 241, b'0', 2);
INSERT INTO `reg_course_field` VALUES (203, 14, 241, b'0', 2);
INSERT INTO `reg_course_field` VALUES (204, 7, 241, b'0', 2);
INSERT INTO `reg_course_field` VALUES (205, 4, 241, b'0', 2);
INSERT INTO `reg_course_field` VALUES (206, 11, 241, b'0', 2);
INSERT INTO `reg_course_field` VALUES (207, 15, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (208, 14, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (209, 11, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (210, 10, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (211, 1, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (212, 8, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (213, 7, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (214, 4, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (215, 3, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (216, 2, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (217, 9, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (218, 1, 224, b'0', 4);
INSERT INTO `reg_course_field` VALUES (219, 2, 225, b'0', 3);
INSERT INTO `reg_course_field` VALUES (220, 1, 225, b'0', 3);
INSERT INTO `reg_course_field` VALUES (221, 1, 289, b'0', 2);
INSERT INTO `reg_course_field` VALUES (222, 2, 289, b'0', 2);
INSERT INTO `reg_course_field` VALUES (223, 7, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (224, 8, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (225, 3, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (226, 4, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (227, 9, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (228, 2, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (229, 15, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (230, 14, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (231, 11, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (232, 10, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (233, 1, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (234, 2, 228, b'0', 3);
INSERT INTO `reg_course_field` VALUES (235, 3, 261, b'0', 3);
INSERT INTO `reg_course_field` VALUES (236, 3, 229, b'0', 2);
INSERT INTO `reg_course_field` VALUES (237, 3, 230, b'0', 2);
INSERT INTO `reg_course_field` VALUES (238, 3, 231, b'0', 3);
INSERT INTO `reg_course_field` VALUES (239, 3, 232, b'0', 3);
INSERT INTO `reg_course_field` VALUES (240, 11, 233, b'0', 2);
INSERT INTO `reg_course_field` VALUES (241, 10, 233, b'0', 2);
INSERT INTO `reg_course_field` VALUES (242, 9, 233, b'0', 2);
INSERT INTO `reg_course_field` VALUES (243, 15, 233, b'0', 2);
INSERT INTO `reg_course_field` VALUES (244, 14, 233, b'0', 2);
INSERT INTO `reg_course_field` VALUES (245, 4, 233, b'0', 2);
INSERT INTO `reg_course_field` VALUES (246, 3, 233, b'0', 2);
INSERT INTO `reg_course_field` VALUES (247, 8, 233, b'0', 2);
INSERT INTO `reg_course_field` VALUES (248, 7, 233, b'0', 2);
INSERT INTO `reg_course_field` VALUES (249, 15, 234, b'0', 2);
INSERT INTO `reg_course_field` VALUES (250, 8, 234, b'0', 2);
INSERT INTO `reg_course_field` VALUES (251, 9, 234, b'0', 2);
INSERT INTO `reg_course_field` VALUES (252, 10, 234, b'0', 2);
INSERT INTO `reg_course_field` VALUES (253, 11, 234, b'0', 2);
INSERT INTO `reg_course_field` VALUES (254, 4, 234, b'0', 2);
INSERT INTO `reg_course_field` VALUES (255, 7, 234, b'0', 2);
INSERT INTO `reg_course_field` VALUES (256, 3, 234, b'0', 2);
INSERT INTO `reg_course_field` VALUES (257, 14, 234, b'0', 2);
INSERT INTO `reg_course_field` VALUES (258, 3, 235, b'0', 2);
INSERT INTO `reg_course_field` VALUES (259, 2, 236, b'0', 3);
INSERT INTO `reg_course_field` VALUES (260, 15, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (261, 7, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (262, 14, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (263, 9, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (264, 11, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (265, 10, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (266, 4, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (267, 1, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (268, 8, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (269, 2, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (270, 1, 253, b'0', 2);
INSERT INTO `reg_course_field` VALUES (271, 2, 253, b'0', 2);
INSERT INTO `reg_course_field` VALUES (272, 8, 263, b'0', 1);
INSERT INTO `reg_course_field` VALUES (273, 14, 263, b'0', 1);
INSERT INTO `reg_course_field` VALUES (274, 15, 263, b'0', 1);
INSERT INTO `reg_course_field` VALUES (275, 4, 263, b'0', 1);
INSERT INTO `reg_course_field` VALUES (276, 11, 263, b'0', 1);
INSERT INTO `reg_course_field` VALUES (277, 10, 263, b'0', 1);
INSERT INTO `reg_course_field` VALUES (278, 9, 263, b'0', 1);
INSERT INTO `reg_course_field` VALUES (279, 7, 263, b'0', 1);
INSERT INTO `reg_course_field` VALUES (280, 11, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (281, 4, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (282, 7, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (283, 1, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (284, 2, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (285, 3, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (286, 14, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (287, 8, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (288, 15, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (289, 10, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (290, 9, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (291, 1, 256, b'0', 1);
INSERT INTO `reg_course_field` VALUES (292, 2, 256, b'0', 1);
INSERT INTO `reg_course_field` VALUES (293, 1, 265, b'0', 2);
INSERT INTO `reg_course_field` VALUES (294, 1, 270, b'0', 3);
INSERT INTO `reg_course_field` VALUES (295, 1, 271, b'0', 2);
INSERT INTO `reg_course_field` VALUES (296, 1, 249, b'0', 3);
INSERT INTO `reg_course_field` VALUES (297, 3, 249, b'0', 3);
INSERT INTO `reg_course_field` VALUES (298, 2, 249, b'0', 3);
INSERT INTO `reg_course_field` VALUES (299, 15, 262, b'0', 2);
INSERT INTO `reg_course_field` VALUES (300, 4, 262, b'0', 2);
INSERT INTO `reg_course_field` VALUES (301, 10, 262, b'0', 2);
INSERT INTO `reg_course_field` VALUES (302, 9, 262, b'0', 2);
INSERT INTO `reg_course_field` VALUES (303, 8, 262, b'0', 2);
INSERT INTO `reg_course_field` VALUES (304, 7, 262, b'0', 2);
INSERT INTO `reg_course_field` VALUES (305, 14, 262, b'0', 2);
INSERT INTO `reg_course_field` VALUES (306, 11, 262, b'0', 2);
INSERT INTO `reg_course_field` VALUES (307, 15, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (308, 14, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (309, 11, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (310, 4, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (311, 10, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (312, 9, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (313, 7, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (314, 3, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (315, 2, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (316, 1, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (317, 8, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (318, 1, 269, b'0', 4);
INSERT INTO `reg_course_field` VALUES (319, 1, 268, b'0', 3);
INSERT INTO `reg_course_field` VALUES (320, 2, 268, b'0', 3);
INSERT INTO `reg_course_field` VALUES (321, 2, 226, b'0', 1);
INSERT INTO `reg_course_field` VALUES (322, 1, 226, b'0', 1);
INSERT INTO `reg_course_field` VALUES (323, 7, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (324, 1, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (325, 8, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (326, 3, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (327, 2, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (328, 4, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (329, 14, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (330, 15, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (331, 9, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (332, 10, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (333, 11, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (334, 11, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (335, 2, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (336, 10, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (337, 4, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (338, 7, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (339, 8, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (340, 1, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (341, 15, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (342, 9, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (343, 14, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (344, 2, 259, b'0', 2);
INSERT INTO `reg_course_field` VALUES (345, 1, 259, b'0', 2);
INSERT INTO `reg_course_field` VALUES (346, 2, 287, b'0', 4);
INSERT INTO `reg_course_field` VALUES (347, 2, 274, b'0', 4);
INSERT INTO `reg_course_field` VALUES (349, 3, 252, b'0', 2);
INSERT INTO `reg_course_field` VALUES (350, 3, 257, b'0', 2);
INSERT INTO `reg_course_field` VALUES (351, 3, 250, b'0', 2);
INSERT INTO `reg_course_field` VALUES (352, 3, 264, b'0', 3);
INSERT INTO `reg_course_field` VALUES (353, 3, 254, b'0', 3);
INSERT INTO `reg_course_field` VALUES (354, 3, 245, b'0', 3);
INSERT INTO `reg_course_field` VALUES (355, 3, 260, b'0', 2);
INSERT INTO `reg_course_field` VALUES (356, 3, 258, b'0', 2);
INSERT INTO `reg_course_field` VALUES (357, 2, 290, b'0', 3);
INSERT INTO `reg_course_field` VALUES (358, 1, 279, b'1', 2);
INSERT INTO `reg_course_field` VALUES (359, 2, 279, b'1', 2);
INSERT INTO `reg_course_field` VALUES (360, 11, 279, b'0', 2);
INSERT INTO `reg_course_field` VALUES (361, 7, 279, b'0', 2);
INSERT INTO `reg_course_field` VALUES (362, 14, 279, b'0', 2);
INSERT INTO `reg_course_field` VALUES (363, 9, 279, b'0', 2);
INSERT INTO `reg_course_field` VALUES (364, 8, 279, b'0', 2);
INSERT INTO `reg_course_field` VALUES (365, 10, 279, b'0', 2);
INSERT INTO `reg_course_field` VALUES (366, 4, 279, b'0', 2);
INSERT INTO `reg_course_field` VALUES (367, 15, 279, b'0', 2);
INSERT INTO `reg_course_field` VALUES (368, 1, 321, b'1', 2);
INSERT INTO `reg_course_field` VALUES (369, 2, 321, b'1', 2);
INSERT INTO `reg_course_field` VALUES (370, 4, 277, b'0', 1);
INSERT INTO `reg_course_field` VALUES (371, 10, 277, b'0', 1);
INSERT INTO `reg_course_field` VALUES (372, 15, 277, b'0', 1);
INSERT INTO `reg_course_field` VALUES (373, 11, 277, b'0', 1);
INSERT INTO `reg_course_field` VALUES (374, 9, 277, b'0', 1);
INSERT INTO `reg_course_field` VALUES (375, 8, 277, b'0', 1);
INSERT INTO `reg_course_field` VALUES (376, 7, 277, b'0', 1);
INSERT INTO `reg_course_field` VALUES (377, 14, 277, b'0', 1);
INSERT INTO `reg_course_field` VALUES (378, 1, 278, b'1', 2);
INSERT INTO `reg_course_field` VALUES (379, 2, 278, b'1', 2);
INSERT INTO `reg_course_field` VALUES (380, 3, 278, b'1', 2);
INSERT INTO `reg_course_field` VALUES (381, 7, 278, b'0', 2);
INSERT INTO `reg_course_field` VALUES (382, 11, 278, b'0', 2);
INSERT INTO `reg_course_field` VALUES (383, 4, 278, b'0', 2);
INSERT INTO `reg_course_field` VALUES (384, 9, 278, b'0', 2);
INSERT INTO `reg_course_field` VALUES (385, 10, 278, b'0', 2);
INSERT INTO `reg_course_field` VALUES (386, 15, 278, b'0', 2);
INSERT INTO `reg_course_field` VALUES (387, 8, 278, b'0', 2);
INSERT INTO `reg_course_field` VALUES (388, 14, 278, b'0', 2);
INSERT INTO `reg_course_field` VALUES (389, 3, 286, b'0', 2);
INSERT INTO `reg_course_field` VALUES (390, 2, 286, b'0', 2);
INSERT INTO `reg_course_field` VALUES (391, 1, 286, b'0', 2);
INSERT INTO `reg_course_field` VALUES (392, 1, 323, b'1', 2);
INSERT INTO `reg_course_field` VALUES (393, 1, 324, b'1', 3);
INSERT INTO `reg_course_field` VALUES (394, 1, 325, b'1', 2);
INSERT INTO `reg_course_field` VALUES (395, 3, 326, b'1', 4);
INSERT INTO `reg_course_field` VALUES (396, 2, 326, b'1', 4);
INSERT INTO `reg_course_field` VALUES (397, 1, 326, b'1', 4);
INSERT INTO `reg_course_field` VALUES (398, 14, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (399, 3, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (400, 10, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (401, 9, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (402, 8, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (403, 15, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (404, 4, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (405, 11, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (406, 2, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (407, 1, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (408, 7, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (409, 1, 328, b'1', 4);
INSERT INTO `reg_course_field` VALUES (410, 2, 329, b'1', 4);
INSERT INTO `reg_course_field` VALUES (411, 1, 329, b'1', 4);
INSERT INTO `reg_course_field` VALUES (412, 3, 276, b'1', 2);
INSERT INTO `reg_course_field` VALUES (413, 2, 276, b'1', 2);
INSERT INTO `reg_course_field` VALUES (414, 1, 276, b'1', 2);
INSERT INTO `reg_course_field` VALUES (415, 15, 276, b'0', 2);
INSERT INTO `reg_course_field` VALUES (416, 8, 276, b'0', 2);
INSERT INTO `reg_course_field` VALUES (417, 9, 276, b'0', 2);
INSERT INTO `reg_course_field` VALUES (418, 7, 276, b'0', 2);
INSERT INTO `reg_course_field` VALUES (419, 10, 276, b'0', 2);
INSERT INTO `reg_course_field` VALUES (420, 14, 276, b'0', 2);
INSERT INTO `reg_course_field` VALUES (421, 4, 276, b'0', 2);
INSERT INTO `reg_course_field` VALUES (422, 11, 276, b'0', 2);
INSERT INTO `reg_course_field` VALUES (423, 7, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (424, 9, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (425, 11, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (426, 10, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (427, 4, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (428, 15, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (429, 14, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (430, 8, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (431, 1, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (432, 2, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (433, 3, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (434, 2, 281, b'1', 2);
INSERT INTO `reg_course_field` VALUES (435, 1, 281, b'1', 2);
INSERT INTO `reg_course_field` VALUES (436, 11, 281, b'0', 2);
INSERT INTO `reg_course_field` VALUES (437, 10, 281, b'0', 2);
INSERT INTO `reg_course_field` VALUES (438, 9, 281, b'0', 2);
INSERT INTO `reg_course_field` VALUES (439, 7, 281, b'0', 2);
INSERT INTO `reg_course_field` VALUES (440, 8, 281, b'0', 2);
INSERT INTO `reg_course_field` VALUES (441, 15, 281, b'0', 2);
INSERT INTO `reg_course_field` VALUES (442, 14, 281, b'0', 2);
INSERT INTO `reg_course_field` VALUES (443, 4, 281, b'0', 2);
INSERT INTO `reg_course_field` VALUES (444, 2, 333, b'1', 4);
INSERT INTO `reg_course_field` VALUES (445, 2, 334, b'1', 4);
INSERT INTO `reg_course_field` VALUES (446, 3, 336, b'1', 4);
INSERT INTO `reg_course_field` VALUES (447, 3, 337, b'1', 2);
INSERT INTO `reg_course_field` VALUES (448, 3, 338, b'1', 2);
INSERT INTO `reg_course_field` VALUES (449, 3, 339, b'1', 2);
INSERT INTO `reg_course_field` VALUES (450, 3, 340, b'1', 2);
INSERT INTO `reg_course_field` VALUES (451, 3, 341, b'1', 2);
INSERT INTO `reg_course_field` VALUES (452, 3, 342, b'1', 3);
INSERT INTO `reg_course_field` VALUES (453, 3, 291, b'0', 2);
INSERT INTO `reg_course_field` VALUES (454, 3, 344, b'1', 2);
INSERT INTO `reg_course_field` VALUES (455, 2, 335, b'1', 3);
INSERT INTO `reg_course_field` VALUES (456, 7, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (457, 11, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (458, 10, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (459, 9, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (460, 15, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (461, 14, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (462, 1, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (463, 2, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (464, 3, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (465, 8, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (466, 4, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (467, 4, 292, b'0', 2);
INSERT INTO `reg_course_field` VALUES (468, 9, 292, b'0', 2);
INSERT INTO `reg_course_field` VALUES (469, 7, 292, b'0', 2);
INSERT INTO `reg_course_field` VALUES (470, 8, 292, b'0', 2);
INSERT INTO `reg_course_field` VALUES (471, 11, 292, b'0', 2);
INSERT INTO `reg_course_field` VALUES (472, 10, 292, b'0', 2);
INSERT INTO `reg_course_field` VALUES (473, 15, 292, b'0', 2);
INSERT INTO `reg_course_field` VALUES (474, 14, 292, b'0', 2);
INSERT INTO `reg_course_field` VALUES (475, 11, 243, b'0', 2);
INSERT INTO `reg_course_field` VALUES (476, 4, 243, b'0', 2);
INSERT INTO `reg_course_field` VALUES (477, 15, 243, b'0', 2);
INSERT INTO `reg_course_field` VALUES (478, 8, 243, b'0', 2);
INSERT INTO `reg_course_field` VALUES (479, 9, 243, b'0', 2);
INSERT INTO `reg_course_field` VALUES (480, 10, 243, b'0', 2);
INSERT INTO `reg_course_field` VALUES (481, 14, 243, b'0', 2);
INSERT INTO `reg_course_field` VALUES (482, 7, 243, b'0', 2);
INSERT INTO `reg_course_field` VALUES (483, 11, 280, b'0', 2);
INSERT INTO `reg_course_field` VALUES (484, 10, 280, b'0', 2);
INSERT INTO `reg_course_field` VALUES (485, 8, 280, b'0', 2);
INSERT INTO `reg_course_field` VALUES (486, 7, 280, b'0', 2);
INSERT INTO `reg_course_field` VALUES (487, 4, 280, b'0', 2);
INSERT INTO `reg_course_field` VALUES (488, 9, 280, b'0', 2);
INSERT INTO `reg_course_field` VALUES (489, 15, 280, b'0', 2);
INSERT INTO `reg_course_field` VALUES (490, 14, 280, b'0', 2);
INSERT INTO `reg_course_field` VALUES (491, 11, 297, b'0', 3);
INSERT INTO `reg_course_field` VALUES (492, 4, 297, b'0', 3);
INSERT INTO `reg_course_field` VALUES (493, 7, 297, b'0', 3);
INSERT INTO `reg_course_field` VALUES (494, 14, 297, b'0', 3);
INSERT INTO `reg_course_field` VALUES (495, 9, 297, b'0', 3);
INSERT INTO `reg_course_field` VALUES (496, 10, 297, b'0', 3);
INSERT INTO `reg_course_field` VALUES (497, 15, 297, b'0', 3);
INSERT INTO `reg_course_field` VALUES (498, 8, 297, b'0', 3);
INSERT INTO `reg_course_field` VALUES (499, 7, 282, b'0', 2);
INSERT INTO `reg_course_field` VALUES (500, 8, 282, b'0', 2);
INSERT INTO `reg_course_field` VALUES (501, 9, 282, b'0', 2);
INSERT INTO `reg_course_field` VALUES (502, 4, 282, b'0', 2);
INSERT INTO `reg_course_field` VALUES (503, 14, 282, b'0', 2);
INSERT INTO `reg_course_field` VALUES (504, 15, 282, b'0', 2);
INSERT INTO `reg_course_field` VALUES (505, 10, 282, b'0', 2);
INSERT INTO `reg_course_field` VALUES (506, 11, 282, b'0', 2);
INSERT INTO `reg_course_field` VALUES (507, 14, 283, b'0', 2);
INSERT INTO `reg_course_field` VALUES (508, 7, 283, b'0', 2);
INSERT INTO `reg_course_field` VALUES (509, 11, 283, b'0', 2);
INSERT INTO `reg_course_field` VALUES (510, 4, 283, b'0', 2);
INSERT INTO `reg_course_field` VALUES (511, 9, 283, b'0', 2);
INSERT INTO `reg_course_field` VALUES (512, 10, 283, b'0', 2);
INSERT INTO `reg_course_field` VALUES (513, 15, 283, b'0', 2);
INSERT INTO `reg_course_field` VALUES (514, 8, 283, b'0', 2);
INSERT INTO `reg_course_field` VALUES (515, 8, 242, b'0', 2);
INSERT INTO `reg_course_field` VALUES (516, 7, 242, b'0', 2);
INSERT INTO `reg_course_field` VALUES (517, 15, 242, b'0', 2);
INSERT INTO `reg_course_field` VALUES (518, 11, 242, b'0', 2);
INSERT INTO `reg_course_field` VALUES (519, 14, 242, b'0', 2);
INSERT INTO `reg_course_field` VALUES (520, 10, 242, b'0', 2);
INSERT INTO `reg_course_field` VALUES (521, 4, 242, b'0', 2);
INSERT INTO `reg_course_field` VALUES (522, 9, 242, b'0', 2);
INSERT INTO `reg_course_field` VALUES (523, 13, 207, b'0', 2);
INSERT INTO `reg_course_field` VALUES (524, 13, 155, b'0', 2);
INSERT INTO `reg_course_field` VALUES (525, 13, 298, b'0', 2);
INSERT INTO `reg_course_field` VALUES (526, 13, 120, b'0', 1);
INSERT INTO `reg_course_field` VALUES (527, 13, 125, b'0', 1);
INSERT INTO `reg_course_field` VALUES (528, 13, 189, b'0', 2);
INSERT INTO `reg_course_field` VALUES (529, 13, 172, b'0', 2);
INSERT INTO `reg_course_field` VALUES (530, 13, 196, b'0', 3);
INSERT INTO `reg_course_field` VALUES (531, 13, 163, b'0', 4);
INSERT INTO `reg_course_field` VALUES (532, 13, 299, b'0', 2);
INSERT INTO `reg_course_field` VALUES (533, 13, 111, b'0', 3);
INSERT INTO `reg_course_field` VALUES (534, 13, 300, b'0', 2);
INSERT INTO `reg_course_field` VALUES (535, 13, 301, b'0', 2);
INSERT INTO `reg_course_field` VALUES (536, 13, 140, b'0', 2);
INSERT INTO `reg_course_field` VALUES (537, 13, 209, b'0', 2);
INSERT INTO `reg_course_field` VALUES (538, 13, 157, b'0', 2);
INSERT INTO `reg_course_field` VALUES (539, 13, 308, b'0', 2);
INSERT INTO `reg_course_field` VALUES (540, 13, 122, b'0', 1);
INSERT INTO `reg_course_field` VALUES (541, 13, 127, b'0', 1);
INSERT INTO `reg_course_field` VALUES (542, 13, 191, b'0', 2);
INSERT INTO `reg_course_field` VALUES (543, 13, 175, b'0', 2);
INSERT INTO `reg_course_field` VALUES (544, 13, 198, b'0', 3);
INSERT INTO `reg_course_field` VALUES (545, 13, 166, b'0', 4);
INSERT INTO `reg_course_field` VALUES (546, 13, 315, b'0', 2);
INSERT INTO `reg_course_field` VALUES (548, 13, 113, b'0', 3);
INSERT INTO `reg_course_field` VALUES (549, 13, 316, b'0', 2);
INSERT INTO `reg_course_field` VALUES (550, 13, 317, b'0', 2);
INSERT INTO `reg_course_field` VALUES (551, 13, 141, b'0', 2);
INSERT INTO `reg_course_field` VALUES (552, 13, 211, b'0', 2);
INSERT INTO `reg_course_field` VALUES (553, 13, 158, b'0', 2);
INSERT INTO `reg_course_field` VALUES (554, 13, 302, b'0', 2);
INSERT INTO `reg_course_field` VALUES (555, 13, 123, b'0', 1);
INSERT INTO `reg_course_field` VALUES (556, 13, 124, b'0', 1);
INSERT INTO `reg_course_field` VALUES (557, 13, 194, b'0', 2);
INSERT INTO `reg_course_field` VALUES (558, 13, 177, b'0', 2);
INSERT INTO `reg_course_field` VALUES (559, 13, 200, b'0', 3);
INSERT INTO `reg_course_field` VALUES (560, 13, 167, b'0', 4);
INSERT INTO `reg_course_field` VALUES (561, 13, 303, b'0', 2);
INSERT INTO `reg_course_field` VALUES (562, 13, 115, b'0', 3);
INSERT INTO `reg_course_field` VALUES (563, 13, 304, b'0', 2);
INSERT INTO `reg_course_field` VALUES (564, 13, 305, b'0', 2);
INSERT INTO `reg_course_field` VALUES (565, 13, 131, b'0', 2);
INSERT INTO `reg_course_field` VALUES (566, 3, 246, b'0', 4);
INSERT INTO `reg_course_field` VALUES (567, 3, 239, b'0', 2);
INSERT INTO `reg_course_field` VALUES (568, 3, 256, b'0', 2);
INSERT INTO `reg_course_field` VALUES (569, 16, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (570, 16, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (571, 16, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (572, 16, 233, b'0', 2);
INSERT INTO `reg_course_field` VALUES (573, 16, 234, b'0', 2);
INSERT INTO `reg_course_field` VALUES (574, 16, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (575, 16, 241, b'0', 2);
INSERT INTO `reg_course_field` VALUES (576, 16, 242, b'0', 2);
INSERT INTO `reg_course_field` VALUES (577, 16, 243, b'0', 2);
INSERT INTO `reg_course_field` VALUES (578, 16, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (579, 16, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (580, 16, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (581, 16, 262, b'0', 2);
INSERT INTO `reg_course_field` VALUES (582, 16, 263, b'0', 1);
INSERT INTO `reg_course_field` VALUES (583, 16, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (584, 16, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (585, 16, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (586, 16, 276, b'0', 2);
INSERT INTO `reg_course_field` VALUES (587, 16, 277, b'0', 1);
INSERT INTO `reg_course_field` VALUES (588, 16, 278, b'0', 2);
INSERT INTO `reg_course_field` VALUES (589, 16, 279, b'0', 2);
INSERT INTO `reg_course_field` VALUES (590, 16, 280, b'0', 2);
INSERT INTO `reg_course_field` VALUES (591, 16, 281, b'0', 2);
INSERT INTO `reg_course_field` VALUES (592, 16, 282, b'0', 2);
INSERT INTO `reg_course_field` VALUES (593, 16, 283, b'0', 2);
INSERT INTO `reg_course_field` VALUES (594, 16, 288, b'0', 1);
INSERT INTO `reg_course_field` VALUES (595, 16, 292, b'0', 2);
INSERT INTO `reg_course_field` VALUES (596, 16, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (597, 16, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (598, 16, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (599, 16, 297, b'0', 3);
INSERT INTO `reg_course_field` VALUES (600, 17, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (601, 17, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (602, 17, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (603, 17, 233, b'0', 2);
INSERT INTO `reg_course_field` VALUES (604, 17, 234, b'0', 2);
INSERT INTO `reg_course_field` VALUES (605, 17, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (606, 17, 241, b'0', 2);
INSERT INTO `reg_course_field` VALUES (607, 17, 242, b'0', 2);
INSERT INTO `reg_course_field` VALUES (608, 17, 243, b'0', 2);
INSERT INTO `reg_course_field` VALUES (609, 17, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (610, 17, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (611, 17, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (612, 17, 262, b'0', 2);
INSERT INTO `reg_course_field` VALUES (613, 17, 263, b'0', 1);
INSERT INTO `reg_course_field` VALUES (614, 17, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (615, 17, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (616, 17, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (617, 17, 276, b'0', 2);
INSERT INTO `reg_course_field` VALUES (618, 17, 277, b'0', 1);
INSERT INTO `reg_course_field` VALUES (619, 17, 278, b'0', 2);
INSERT INTO `reg_course_field` VALUES (620, 17, 279, b'0', 2);
INSERT INTO `reg_course_field` VALUES (621, 17, 280, b'0', 2);
INSERT INTO `reg_course_field` VALUES (622, 17, 281, b'0', 2);
INSERT INTO `reg_course_field` VALUES (623, 17, 282, b'0', 2);
INSERT INTO `reg_course_field` VALUES (624, 17, 283, b'0', 2);
INSERT INTO `reg_course_field` VALUES (625, 17, 288, b'0', 1);
INSERT INTO `reg_course_field` VALUES (626, 17, 292, b'0', 2);
INSERT INTO `reg_course_field` VALUES (627, 17, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (628, 17, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (629, 17, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (630, 17, 297, b'0', 3);
INSERT INTO `reg_course_field` VALUES (631, 18, 218, b'0', 2);
INSERT INTO `reg_course_field` VALUES (632, 18, 222, b'0', 2);
INSERT INTO `reg_course_field` VALUES (633, 18, 227, b'0', 2);
INSERT INTO `reg_course_field` VALUES (634, 18, 233, b'0', 2);
INSERT INTO `reg_course_field` VALUES (635, 18, 234, b'0', 2);
INSERT INTO `reg_course_field` VALUES (636, 18, 238, b'0', 2);
INSERT INTO `reg_course_field` VALUES (637, 18, 241, b'0', 2);
INSERT INTO `reg_course_field` VALUES (638, 18, 242, b'0', 2);
INSERT INTO `reg_course_field` VALUES (639, 18, 243, b'0', 2);
INSERT INTO `reg_course_field` VALUES (640, 18, 244, b'0', 2);
INSERT INTO `reg_course_field` VALUES (641, 18, 248, b'0', 2);
INSERT INTO `reg_course_field` VALUES (642, 18, 255, b'0', 2);
INSERT INTO `reg_course_field` VALUES (643, 18, 262, b'0', 2);
INSERT INTO `reg_course_field` VALUES (644, 18, 263, b'0', 1);
INSERT INTO `reg_course_field` VALUES (645, 18, 266, b'0', 2);
INSERT INTO `reg_course_field` VALUES (646, 18, 267, b'0', 2);
INSERT INTO `reg_course_field` VALUES (647, 18, 275, b'0', 2);
INSERT INTO `reg_course_field` VALUES (648, 18, 276, b'0', 2);
INSERT INTO `reg_course_field` VALUES (649, 18, 277, b'0', 1);
INSERT INTO `reg_course_field` VALUES (650, 18, 278, b'0', 2);
INSERT INTO `reg_course_field` VALUES (651, 18, 279, b'0', 2);
INSERT INTO `reg_course_field` VALUES (652, 18, 280, b'0', 2);
INSERT INTO `reg_course_field` VALUES (653, 18, 281, b'0', 2);
INSERT INTO `reg_course_field` VALUES (654, 18, 282, b'0', 2);
INSERT INTO `reg_course_field` VALUES (655, 18, 283, b'0', 2);
INSERT INTO `reg_course_field` VALUES (656, 18, 288, b'0', 1);
INSERT INTO `reg_course_field` VALUES (657, 18, 292, b'0', 2);
INSERT INTO `reg_course_field` VALUES (658, 18, 293, b'0', 2);
INSERT INTO `reg_course_field` VALUES (659, 18, 294, b'0', 2);
INSERT INTO `reg_course_field` VALUES (660, 18, 295, b'0', 2);
INSERT INTO `reg_course_field` VALUES (661, 18, 297, b'0', 3);
INSERT INTO `reg_course_field` VALUES (724, 13, 345, b'0', 2);
INSERT INTO `reg_course_field` VALUES (725, 13, 346, b'0', 1);
INSERT INTO `reg_course_field` VALUES (726, 13, 347, b'0', 2);
INSERT INTO `reg_course_field` VALUES (727, 13, 348, b'0', 1);
INSERT INTO `reg_course_field` VALUES (728, 13, 349, b'0', 2);
INSERT INTO `reg_course_field` VALUES (729, 13, 350, b'0', 1);
INSERT INTO `reg_course_field` VALUES (886, 7, 352, b'0', 4);
INSERT INTO `reg_course_field` VALUES (887, 8, 352, b'0', 4);
INSERT INTO `reg_course_field` VALUES (888, 15, 352, b'0', 4);
INSERT INTO `reg_course_field` VALUES (889, 14, 352, b'0', 4);
INSERT INTO `reg_course_field` VALUES (891, 11, 352, b'0', 4);
INSERT INTO `reg_course_field` VALUES (892, 10, 352, b'0', 4);
INSERT INTO `reg_course_field` VALUES (893, 9, 352, b'0', 4);
INSERT INTO `reg_course_field` VALUES (894, 16, 352, b'0', 4);
INSERT INTO `reg_course_field` VALUES (898, 18, 352, b'0', 4);
INSERT INTO `reg_course_field` VALUES (901, 17, 352, b'0', 4);
INSERT INTO `reg_course_field` VALUES (902, 4, 352, b'0', 4);
INSERT INTO `reg_course_field` VALUES (904, 2, 353, b'1', 2);
INSERT INTO `reg_course_field` VALUES (905, 1, 353, b'1', 2);
INSERT INTO `reg_course_field` VALUES (906, 1, 354, b'1', 2);
INSERT INTO `reg_course_field` VALUES (907, 2, 354, b'1', 2);
INSERT INTO `reg_course_field` VALUES (908, 3, 354, b'1', 2);
INSERT INTO `reg_course_field` VALUES (909, 1, 355, b'1', 2);
INSERT INTO `reg_course_field` VALUES (910, 2, 355, b'1', 2);
INSERT INTO `reg_course_field` VALUES (911, 3, 356, b'1', 2);
INSERT INTO `reg_course_field` VALUES (912, 2, 356, b'1', 2);
INSERT INTO `reg_course_field` VALUES (913, 1, 356, b'1', 2);
INSERT INTO `reg_course_field` VALUES (914, 7, 351, b'0', 2);
INSERT INTO `reg_course_field` VALUES (915, 8, 351, b'0', 2);
INSERT INTO `reg_course_field` VALUES (916, 15, 351, b'0', 2);
INSERT INTO `reg_course_field` VALUES (917, 14, 351, b'0', 2);
INSERT INTO `reg_course_field` VALUES (919, 11, 351, b'0', 2);
INSERT INTO `reg_course_field` VALUES (920, 10, 351, b'0', 2);
INSERT INTO `reg_course_field` VALUES (921, 9, 351, b'0', 2);
INSERT INTO `reg_course_field` VALUES (922, 16, 351, b'0', 2);
INSERT INTO `reg_course_field` VALUES (926, 18, 351, b'0', 2);
INSERT INTO `reg_course_field` VALUES (929, 17, 351, b'0', 2);
INSERT INTO `reg_course_field` VALUES (969, 10, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (970, 4, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (971, 15, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (972, 1, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (973, 11, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (974, 2, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (975, 7, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (976, 14, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (977, 9, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (978, 8, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (979, 16, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (980, 17, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (981, 18, 357, b'1', 2);
INSERT INTO `reg_course_field` VALUES (990, 1, 358, b'1', 1);
INSERT INTO `reg_course_field` VALUES (991, 2, 358, b'1', 1);
INSERT INTO `reg_course_field` VALUES (992, 15, 359, b'1', 2);
INSERT INTO `reg_course_field` VALUES (993, 8, 359, b'1', 2);
INSERT INTO `reg_course_field` VALUES (994, 9, 359, b'1', 2);
INSERT INTO `reg_course_field` VALUES (995, 10, 359, b'1', 2);
INSERT INTO `reg_course_field` VALUES (996, 11, 359, b'1', 2);
INSERT INTO `reg_course_field` VALUES (997, 4, 359, b'1', 2);
INSERT INTO `reg_course_field` VALUES (998, 7, 359, b'1', 2);
INSERT INTO `reg_course_field` VALUES (999, 3, 359, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1000, 14, 359, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1001, 16, 359, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1002, 17, 359, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1003, 18, 359, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1012, 2, 360, b'1', 3);
INSERT INTO `reg_course_field` VALUES (1014, 1, 360, b'1', 3);
INSERT INTO `reg_course_field` VALUES (1015, 3, 360, b'1', 3);
INSERT INTO `reg_course_field` VALUES (1016, 9, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1017, 10, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1018, 11, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1019, 14, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1020, 15, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1021, 4, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1022, 8, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1023, 1, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1024, 2, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1025, 3, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1026, 7, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1027, 16, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1028, 17, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1029, 18, 361, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1038, 7, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1039, 8, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1040, 3, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1041, 4, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1042, 9, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1043, 2, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1044, 15, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1045, 14, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1046, 11, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1047, 10, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1048, 1, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1049, 16, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1050, 17, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1051, 18, 362, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1060, 11, 363, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1061, 10, 363, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1062, 9, 363, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1063, 15, 363, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1064, 14, 363, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1065, 4, 363, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1066, 3, 363, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1067, 8, 363, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1068, 7, 363, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1069, 16, 363, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1070, 17, 363, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1071, 18, 363, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1080, 15, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1081, 7, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1082, 14, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1083, 9, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1084, 11, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1085, 10, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1086, 4, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1087, 1, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1088, 8, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1089, 2, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1090, 16, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1091, 17, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1092, 18, 364, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1101, 1, 365, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1102, 2, 365, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1103, 1, 367, b'1', 3);
INSERT INTO `reg_course_field` VALUES (1104, 3, 367, b'1', 3);
INSERT INTO `reg_course_field` VALUES (1105, 2, 367, b'1', 3);
INSERT INTO `reg_course_field` VALUES (1106, 11, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1107, 4, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1108, 7, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1109, 1, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1110, 2, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1111, 3, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1112, 14, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1113, 8, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1114, 15, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1115, 10, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1116, 9, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1117, 16, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1118, 17, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1119, 18, 368, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1128, 7, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1129, 1, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1130, 8, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1131, 3, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1132, 2, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1133, 4, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1134, 14, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1135, 15, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1136, 9, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1137, 10, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1138, 11, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1139, 16, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1140, 17, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1141, 18, 369, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1150, 11, 370, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1151, 2, 370, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1152, 10, 370, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1153, 4, 370, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1154, 7, 370, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1155, 8, 370, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1156, 1, 370, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1157, 15, 370, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1158, 9, 370, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1159, 14, 370, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1160, 16, 370, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1161, 17, 370, b'1', 2);
INSERT INTO `reg_course_field` VALUES (1162, 18, 370, b'1', 2);

-- ----------------------------
-- Table structure for reg_exam_course
-- ----------------------------
DROP TABLE IF EXISTS `reg_exam_course`;
CREATE TABLE `reg_exam_course`  (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `exam_time_id` bigint NULL DEFAULT NULL,
  `course_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `exam_time_id`(`exam_time_id` ASC) USING BTREE,
  INDEX `course_id`(`course_id` ASC) USING BTREE,
  CONSTRAINT `reg_exam_course_ibfk_1` FOREIGN KEY (`exam_time_id`) REFERENCES `reg_exam_time` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_exam_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `reg_course` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1015 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_exam_course
-- ----------------------------

-- ----------------------------
-- Table structure for reg_exam_hour_config
-- ----------------------------
DROP TABLE IF EXISTS `reg_exam_hour_config`;
CREATE TABLE `reg_exam_hour_config`  (
  `hour_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`hour_title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_exam_hour_config
-- ----------------------------
INSERT INTO `reg_exam_hour_config` VALUES ('10 صبح');
INSERT INTO `reg_exam_hour_config` VALUES ('10:30 صبح');
INSERT INTO `reg_exam_hour_config` VALUES ('14 عصر');
INSERT INTO `reg_exam_hour_config` VALUES ('15:30 عصر');
INSERT INTO `reg_exam_hour_config` VALUES ('16 عصر');
INSERT INTO `reg_exam_hour_config` VALUES ('17 عصر');
INSERT INTO `reg_exam_hour_config` VALUES ('17:30 عصر');
INSERT INTO `reg_exam_hour_config` VALUES ('7 صبح');
INSERT INTO `reg_exam_hour_config` VALUES ('8 صبح');
INSERT INTO `reg_exam_hour_config` VALUES ('9:30 صبح');

-- ----------------------------
-- Table structure for reg_exam_kart_config
-- ----------------------------
DROP TABLE IF EXISTS `reg_exam_kart_config`;
CREATE TABLE `reg_exam_kart_config`  (
  `id` bigint NOT NULL,
  `manager_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `school_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `exam_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_exam_kart_config
-- ----------------------------
INSERT INTO `reg_exam_kart_config` VALUES (1, 'هما قاسمی پور', 'مدرسه راه دور همای سعات', 'مدرسه راه دور همای سعات');

-- ----------------------------
-- Table structure for reg_exam_time
-- ----------------------------
DROP TABLE IF EXISTS `reg_exam_time`;
CREATE TABLE `reg_exam_time`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `term_id` bigint NULL DEFAULT NULL,
  `exam_date` datetime NULL DEFAULT NULL,
  `hour` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `term_id`(`term_id` ASC) USING BTREE,
  CONSTRAINT `reg_exam_time_ibfk_1` FOREIGN KEY (`term_id`) REFERENCES `reg_term` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 365 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_exam_time
-- ----------------------------

-- ----------------------------
-- Table structure for reg_field
-- ----------------------------
DROP TABLE IF EXISTS `reg_field`;
CREATE TABLE `reg_field`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_field
-- ----------------------------
INSERT INTO `reg_field` VALUES (1, 'ریاضی فیزیک');
INSERT INTO `reg_field` VALUES (2, 'علوم تجربی');
INSERT INTO `reg_field` VALUES (3, 'ادبیات و علوم انسانی');
INSERT INTO `reg_field` VALUES (4, 'گرافیک رایانه ای');
INSERT INTO `reg_field` VALUES (7, 'معماری داخلی');
INSERT INTO `reg_field` VALUES (8, 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `reg_field` VALUES (9, 'عکاسی دیجیتال');
INSERT INTO `reg_field` VALUES (10, 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `reg_field` VALUES (11, 'نقاشی ایرانی');
INSERT INTO `reg_field` VALUES (12, 'گل گیاه زینتی');
INSERT INTO `reg_field` VALUES (13, 'دستیار طراحی لباس');
INSERT INTO `reg_field` VALUES (14, 'مدیریت خانواده');
INSERT INTO `reg_field` VALUES (15, 'تولید محتوا');
INSERT INTO `reg_field` VALUES (16, 'آشبزی');
INSERT INTO `reg_field` VALUES (17, 'گرافیک رایانه ای');
INSERT INTO `reg_field` VALUES (18, 'مدیریت آشپزی و قنادی');

-- ----------------------------
-- Table structure for reg_identifier_code
-- ----------------------------
DROP TABLE IF EXISTS `reg_identifier_code`;
CREATE TABLE `reg_identifier_code`  (
  `id` int NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_identifier_code
-- ----------------------------
INSERT INTO `reg_identifier_code` VALUES (1, 'الف');
INSERT INTO `reg_identifier_code` VALUES (2, 'ب');
INSERT INTO `reg_identifier_code` VALUES (3, 'پ');
INSERT INTO `reg_identifier_code` VALUES (4, 'ت');
INSERT INTO `reg_identifier_code` VALUES (5, 'ث');
INSERT INTO `reg_identifier_code` VALUES (6, 'ج');
INSERT INTO `reg_identifier_code` VALUES (7, 'چ');
INSERT INTO `reg_identifier_code` VALUES (8, 'ح');
INSERT INTO `reg_identifier_code` VALUES (9, 'خ');
INSERT INTO `reg_identifier_code` VALUES (10, 'د');
INSERT INTO `reg_identifier_code` VALUES (11, 'ذ');
INSERT INTO `reg_identifier_code` VALUES (12, 'ر');
INSERT INTO `reg_identifier_code` VALUES (13, 'ز');
INSERT INTO `reg_identifier_code` VALUES (14, 'ژ');
INSERT INTO `reg_identifier_code` VALUES (15, 'س');
INSERT INTO `reg_identifier_code` VALUES (16, 'ش');
INSERT INTO `reg_identifier_code` VALUES (17, 'ص');
INSERT INTO `reg_identifier_code` VALUES (18, 'ض');
INSERT INTO `reg_identifier_code` VALUES (19, 'ط');
INSERT INTO `reg_identifier_code` VALUES (20, 'ظ');
INSERT INTO `reg_identifier_code` VALUES (21, 'ع');
INSERT INTO `reg_identifier_code` VALUES (22, 'غ');
INSERT INTO `reg_identifier_code` VALUES (23, 'ف');
INSERT INTO `reg_identifier_code` VALUES (24, 'ق');
INSERT INTO `reg_identifier_code` VALUES (25, 'ک');
INSERT INTO `reg_identifier_code` VALUES (26, 'گ');
INSERT INTO `reg_identifier_code` VALUES (27, 'ل');
INSERT INTO `reg_identifier_code` VALUES (28, 'م');
INSERT INTO `reg_identifier_code` VALUES (29, 'ن');
INSERT INTO `reg_identifier_code` VALUES (30, 'و');
INSERT INTO `reg_identifier_code` VALUES (31, 'ه');
INSERT INTO `reg_identifier_code` VALUES (32, 'ی');
INSERT INTO `reg_identifier_code` VALUES (42, 'یک المثني');
INSERT INTO `reg_identifier_code` VALUES (43, ' دو المثني');
INSERT INTO `reg_identifier_code` VALUES (44, 'سه المثني');
INSERT INTO `reg_identifier_code` VALUES (45, 'چهار المثني');
INSERT INTO `reg_identifier_code` VALUES (46, 'پنج المثني');
INSERT INTO `reg_identifier_code` VALUES (47, 'شش المثني');
INSERT INTO `reg_identifier_code` VALUES (48, 'هفت المثني');
INSERT INTO `reg_identifier_code` VALUES (49, 'هشت المثني');
INSERT INTO `reg_identifier_code` VALUES (50, 'نه المثني');
INSERT INTO `reg_identifier_code` VALUES (51, 'ده المثني');
INSERT INTO `reg_identifier_code` VALUES (52, 'يازده المثني');
INSERT INTO `reg_identifier_code` VALUES (53, 'دوازده المثني');

-- ----------------------------
-- Table structure for reg_level
-- ----------------------------
DROP TABLE IF EXISTS `reg_level`;
CREATE TABLE `reg_level`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_level
-- ----------------------------
INSERT INTO `reg_level` VALUES (1, 'دوره اول متوسطه');
INSERT INTO `reg_level` VALUES (2, 'دوره دوم متوسطه');
INSERT INTO `reg_level` VALUES (4, 'پیش دانشگاهی');
INSERT INTO `reg_level` VALUES (5, 'تعریف نشده');

-- ----------------------------
-- Table structure for reg_organization
-- ----------------------------
DROP TABLE IF EXISTS `reg_organization`;
CREATE TABLE `reg_organization`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_organization
-- ----------------------------
INSERT INTO `reg_organization` VALUES (1, 'مرکزی');

-- ----------------------------
-- Table structure for reg_persian_day
-- ----------------------------
DROP TABLE IF EXISTS `reg_persian_day`;
CREATE TABLE `reg_persian_day`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_persian_day
-- ----------------------------
INSERT INTO `reg_persian_day` VALUES (0, 'دوشنبه');
INSERT INTO `reg_persian_day` VALUES (1, 'سه شنبه');
INSERT INTO `reg_persian_day` VALUES (2, 'چهارشنبه');
INSERT INTO `reg_persian_day` VALUES (3, 'پنجشنبه');
INSERT INTO `reg_persian_day` VALUES (4, 'جمعه');
INSERT INTO `reg_persian_day` VALUES (5, 'شنبه');
INSERT INTO `reg_persian_day` VALUES (6, 'یکشنبه');

-- ----------------------------
-- Table structure for reg_receivable
-- ----------------------------
DROP TABLE IF EXISTS `reg_receivable`;
CREATE TABLE `reg_receivable`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `finance_factor_id` bigint NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `reg_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `finance_factor_id`(`finance_factor_id` ASC) USING BTREE,
  INDEX `reg_id`(`reg_id` ASC) USING BTREE,
  CONSTRAINT `reg_receivable_ibfk_1` FOREIGN KEY (`finance_factor_id`) REFERENCES `finance_factor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_receivable_ibfk_2` FOREIGN KEY (`reg_id`) REFERENCES `reg_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_receivable
-- ----------------------------
INSERT INTO `reg_receivable` VALUES (1, 33417, '2025-01-18 00:00:00', 33419);

-- ----------------------------
-- Table structure for reg_reg_check
-- ----------------------------
DROP TABLE IF EXISTS `reg_reg_check`;
CREATE TABLE `reg_reg_check`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime NULL DEFAULT NULL,
  `reg_id` bigint NULL DEFAULT NULL,
  `finance_check_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reg_id`(`reg_id` ASC) USING BTREE,
  INDEX `finance_check_id`(`finance_check_id` ASC) USING BTREE,
  CONSTRAINT `reg_reg_check_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `reg_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_reg_check_ibfk_2` FOREIGN KEY (`finance_check_id`) REFERENCES `finance_check` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_reg_check
-- ----------------------------

-- ----------------------------
-- Table structure for reg_reg_course
-- ----------------------------
DROP TABLE IF EXISTS `reg_reg_course`;
CREATE TABLE `reg_reg_course`  (
  `reg_id` bigint NOT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`reg_id`, `course_id`) USING BTREE,
  INDEX `course_id`(`course_id` ASC) USING BTREE,
  CONSTRAINT `reg_reg_course_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `reg_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_reg_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `reg_course` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_reg_course
-- ----------------------------

-- ----------------------------
-- Table structure for reg_reg_payment
-- ----------------------------
DROP TABLE IF EXISTS `reg_reg_payment`;
CREATE TABLE `reg_reg_payment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime NULL DEFAULT NULL,
  `reg_id` bigint NULL DEFAULT NULL,
  `finance_id` bigint NULL DEFAULT NULL,
  `next_payment` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reg_id`(`reg_id` ASC) USING BTREE,
  INDEX `finance_id`(`finance_id` ASC) USING BTREE,
  CONSTRAINT `reg_reg_payment_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `reg_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_reg_payment_ibfk_2` FOREIGN KEY (`finance_id`) REFERENCES `finance_receive_payment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_reg_payment
-- ----------------------------
INSERT INTO `reg_reg_payment` VALUES (1, '2025-01-18 00:00:00', 33419, 43297, NULL);

-- ----------------------------
-- Table structure for reg_registration
-- ----------------------------
DROP TABLE IF EXISTS `reg_registration`;
CREATE TABLE `reg_registration`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reg_date` datetime NOT NULL,
  `st_id` bigint NOT NULL,
  `field_id` bigint NOT NULL,
  `term_id` bigint NOT NULL,
  `level_id` bigint NULL DEFAULT NULL,
  `theory_units` double(11, 2) NOT NULL,
  `actional_units` int NOT NULL,
  `fix_salary` bigint NOT NULL,
  `actional_salary` bigint NOT NULL,
  `theory_salary` bigint NOT NULL,
  `other_salary_comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `other_salary_amount` bigint NOT NULL,
  `total_salary` bigint NOT NULL,
  `off_amount` bigint NOT NULL,
  `off_comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `base_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `st_id`(`st_id` ASC) USING BTREE,
  INDEX `field_id`(`field_id` ASC) USING BTREE,
  INDEX `term_id`(`term_id` ASC) USING BTREE,
  INDEX `level_id`(`level_id` ASC) USING BTREE,
  INDEX `base_id`(`base_id` ASC) USING BTREE,
  CONSTRAINT `reg_registration_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `reg_student` (`student_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_registration_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `reg_field` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_registration_ibfk_3` FOREIGN KEY (`term_id`) REFERENCES `reg_term` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_registration_ibfk_4` FOREIGN KEY (`level_id`) REFERENCES `reg_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_registration_ibfk_5` FOREIGN KEY (`base_id`) REFERENCES `reg_base_level` (`base_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33420 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_registration
-- ----------------------------
INSERT INTO `reg_registration` VALUES (33419, '2025-01-18 00:00:00', 1285177886, 1, 9329, 1, 18.00, 108, 2400000, 0, 680000, NULL, 0, 14640000, 0, NULL, NULL);

-- ----------------------------
-- Table structure for reg_salary_param
-- ----------------------------
DROP TABLE IF EXISTS `reg_salary_param`;
CREATE TABLE `reg_salary_param`  (
  `term_id` bigint NOT NULL DEFAULT 0,
  `level_id` bigint NOT NULL DEFAULT 0,
  `fix_salary` bigint NULL DEFAULT NULL,
  `action_salary` bigint NULL DEFAULT NULL,
  `theory_salary` bigint NULL DEFAULT NULL,
  `ac_th_rate` int NULL DEFAULT NULL,
  PRIMARY KEY (`term_id`, `level_id`) USING BTREE,
  INDEX `level_id`(`level_id` ASC) USING BTREE,
  CONSTRAINT `reg_salary_param_ibfk_1` FOREIGN KEY (`term_id`) REFERENCES `reg_term` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_salary_param_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `reg_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_salary_param
-- ----------------------------
INSERT INTO `reg_salary_param` VALUES (9329, 1, 2400000, 0, 680000, NULL);
INSERT INTO `reg_salary_param` VALUES (9329, 2, 2400000, 0, 730000, NULL);

-- ----------------------------
-- Table structure for reg_school
-- ----------------------------
DROP TABLE IF EXISTS `reg_school`;
CREATE TABLE `reg_school`  (
  `school_id` bigint NOT NULL DEFAULT 0,
  `school_description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `school_db_service` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `school_db_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `school_host` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`school_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_school
-- ----------------------------
INSERT INTO `reg_school` VALUES (35769905, 'راهنمايي', 'sqlexpress', 'Dana35769905', 'localhost');
INSERT INTO `reg_school` VALUES (35770006, 'متوسطه ', 'sqlexpress', 'Dana35770006', 'localhost');
INSERT INTO `reg_school` VALUES (35774606, 'پيش دانشگاهي', 'sqlexpress', 'Dana35774606', 'localhost');
INSERT INTO `reg_school` VALUES (35778603, 'كار و  دانش', 'sqlexpress', 'Dana35778603', 'localhost');
INSERT INTO `reg_school` VALUES (95134545, 'متوسطه اول', 'sqlexpress', 'Dana95134545', 'localhost');

-- ----------------------------
-- Table structure for reg_student
-- ----------------------------
DROP TABLE IF EXISTS `reg_student`;
CREATE TABLE `reg_student`  (
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `famili` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `national_code` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `identifier_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `identifier_serial` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `identifier_char` int NULL DEFAULT NULL,
  `student_code` bigint NOT NULL DEFAULT 0,
  `father_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status_id` bigint NULL DEFAULT NULL,
  `org_unit_id` bigint NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified` datetime NULL DEFAULT NULL,
  `level_id_last` bigint NULL DEFAULT NULL,
  `field_id_last` bigint NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `archive_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pish_madrak` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `diplom_madrak` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`student_code`) USING BTREE,
  INDEX `status_id`(`status_id` ASC) USING BTREE,
  INDEX `org_unit_id`(`org_unit_id` ASC) USING BTREE,
  INDEX `level_id_last`(`level_id_last` ASC) USING BTREE,
  INDEX `field_id_last`(`field_id_last` ASC) USING BTREE,
  CONSTRAINT `reg_student_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `reg_student_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_student_ibfk_3` FOREIGN KEY (`org_unit_id`) REFERENCES `reg_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_student_ibfk_4` FOREIGN KEY (`level_id_last`) REFERENCES `reg_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_student_ibfk_5` FOREIGN KEY (`field_id_last`) REFERENCES `reg_field` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_student
-- ----------------------------
INSERT INTO `reg_student` VALUES ('فاطمه', 'گلبي قلعهء', '112247687', NULL, NULL, 0, 112247687, 'امير', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('پریسا', 'رفیعی', '620080200', NULL, NULL, 0, 620080200, 'احمد', NULL, 'تولید محتوا', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('شیدا', 'ححیدری سلطانیی', '1080712399', NULL, NULL, 0, 1080712399, 'غلامعلی', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('شادي', 'ترك زاده اشني', '1080863001', NULL, NULL, 0, 1080863001, 'عبداله', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زينب', 'شكراللهي يانچشمه', '1080891781', NULL, NULL, 0, 1080891781, 'محسن', NULL, 'تولید محتوای آموزشی الکترونیکی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('ریحانه', 'کاظمی', '1100760318', NULL, NULL, 0, 1100760318, 'حسن', NULL, 'اشپزی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سمیه', 'جلالی جلال آبادی', '1110856520', NULL, NULL, 0, 1110856520, 'غلامعلی', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سید مرضیه', 'طهماسبی', '1120152372', NULL, NULL, 0, 1120152372, NULL, NULL, 'تجربی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('الينا', 'قلاني', '1120247713', NULL, NULL, 0, 1120247713, 'سروش', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('شادي', 'كرمي', '1130749908', NULL, NULL, 0, 1130749908, 'اسماعيل', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'مرادي', '1150054697', NULL, NULL, 0, 1150054697, 'عزت اله', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'محمدی', '1150182334', NULL, NULL, 0, 1150182334, 'نظرعلی', NULL, 'نقاشي ايراني', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('كيميا', 'كاظمي', '1150318945', NULL, NULL, 0, 1150318945, 'مصطفي', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'مهدي چهل خانه', '1159259658', NULL, NULL, 0, 1159259658, 'عقيل', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مریم', 'گرامی', '1159933022', NULL, NULL, 0, 1159933022, 'خدابخش', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مهسا', 'مهربان گهروئي', '1160445079', NULL, NULL, 0, 1160445079, 'لطف الله', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'حدادي بيستگاني', '1160486786', NULL, NULL, 0, 1160486786, 'وحيد', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('آتنا', 'عباسي كله مسلماني', '1160534047', NULL, NULL, 0, 1160534047, 'ناصر', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('نرگس', 'صدري', '1190353407', NULL, NULL, 0, 1190353407, 'حسينعلي', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مريم', 'آقائي سميرمي', '1200014324', NULL, NULL, 0, 1200014324, 'رسول', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مرجان', 'زارعي شمس آبادي', '1270220454', NULL, NULL, 0, 1270220454, 'اصغر', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('منصوره', 'وكيلي', '1270624326', NULL, NULL, 0, 1270624326, 'مصطفي', NULL, 'توليد و پرورش گل و گياهان زینتی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا ', 'سعیدی', '1270712950', NULL, NULL, 0, 1270712950, NULL, NULL, 'گل گیاه زینتی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('عاطفه', 'موسوی نهرخلجی', '1270727796', NULL, NULL, 0, 1270727796, 'علی اکبر', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('شيوا', 'پرويزي', '1271605635', NULL, NULL, 0, 1271605635, 'شهرام', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('فاطمه', 'صحرائي', '1272036790', NULL, NULL, 0, 1272036790, 'كرمعلي', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'صادقي', '1272340351', NULL, NULL, 0, 1272340351, 'جلال', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مينا', 'احمدي جو', '1272714551', NULL, NULL, 0, 1272714551, 'علي', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'مختاري مقدم', '1273020936', NULL, NULL, 0, 1273020936, 'حسين', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('فاطمه', 'باقرزاده', '1273101138', NULL, NULL, 0, 1273101138, 'عباس', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('ملیکا', 'ژیلانسب', '1273490843', NULL, NULL, 0, 1273490843, 'محمد', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'كارآور', '1274007372', NULL, NULL, 0, 1274007372, 'اكبر', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('الهه', 'رئیسی وستگانی', '1274034116', NULL, NULL, 0, 1274034116, 'طهمورث', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مبینا سادات', 'شاه زیدی', '1274336058', NULL, NULL, 0, 1274336058, 'سید اصغر', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('نرجس', 'طالبی', '1274363861', NULL, NULL, 0, 1274363861, 'داود', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سارا', 'مسعودي', '1274397944', NULL, NULL, 0, 1274397944, 'حميدرضا', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('پریناز', 'اینالویی', '1274407664', NULL, NULL, 0, 1274407664, 'سعید', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سارا', 'صابری زفرقندی', '1274424909', NULL, NULL, 0, 1274424909, 'کاظم', NULL, 'تجربی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('آتنا', 'قاسمي تبار', '1274441511', NULL, NULL, 0, 1274441511, 'حسين', NULL, 'توليد و پرورش گل و گياهان زینتی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('محدیث', 'غلامی سمسوری', '1274457459', NULL, NULL, 0, 1274457459, 'ناصر', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('فاطمه', 'خالقی', '1274520411', NULL, NULL, 0, 1274520411, 'حمیدرضا', NULL, 'تجربی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سارا', 'دهاقانی', '1274521701', NULL, NULL, 0, 1274521701, 'مرتضی', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('ريحانه سادات', 'سلطاني اورگاني', '1274591988', NULL, NULL, 0, 1274591988, 'سيدمهدي', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('فاطمه', 'رشیدی', '1274610311', NULL, NULL, 0, 1274610311, 'ستار', NULL, 'تجربی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('بهار', 'جعفري', '1274639042', NULL, NULL, 0, 1274639042, 'غلامرضا', NULL, 'معماری داخلی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('نازنين', 'حياتي دهلقي', '1274653347', NULL, NULL, 0, 1274653347, 'فردين', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('فاطمه', 'نوري', '1274675340', NULL, NULL, 0, 1274675340, 'عليرضا', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('پرنيا', 'جهانگيري نسب', '1274751462', NULL, NULL, 0, 1274751462, 'مهدي', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('عصمت', 'زارعان آدرمنابادي', '1274786681', NULL, NULL, 0, 1274786681, 'رضا', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مائده', 'حيدري', '1274789338', NULL, NULL, 0, 1274789338, 'مجيدرضا', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مایده', 'شجاعی جشوقانی', '1274809959', NULL, NULL, 0, 1274809959, 'محمد', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مهسا', 'رسولي', '1274812569', NULL, NULL, 0, 1274812569, 'شاهپور', NULL, 'معماری داخلی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زینب', 'حقیقی زاده', '1274817900', NULL, NULL, 0, 1274817900, 'مجید', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('نيلوفر', 'هژيراطهر', '1274834988', NULL, NULL, 0, 1274834988, 'حسنعلي', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('صبا', 'اميرحاجلو', '1274852757', NULL, NULL, 0, 1274852757, 'روح اله', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('فاطمه', 'غلامي فشاركي', '1274853117', NULL, NULL, 0, 1274853117, 'بهرام', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('دینا', 'محمودی', '1274871638', NULL, NULL, 0, 1274871638, 'عباس', NULL, 'ریاضی-فیزیک', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('كوثر', 'مطلبي فشاركي', '1274893771', NULL, NULL, 0, 1274893771, 'روح اله', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زكيه', 'نصرآزاداني', '1274903955', NULL, NULL, 0, 1274903955, 'حسين', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('نگار', 'پورياي ولي', '1274950015', NULL, NULL, 0, 1274950015, 'سعيد', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('الناز', 'بيات', '1274962900', NULL, NULL, 0, 1274962900, 'يوسف', NULL, 'دستياري طراحي لباس(دوخت و ترميم)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'قجاوندبلتيجه', '1274989396', NULL, NULL, 0, 1274989396, 'رسول', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('حديث', 'كريم زاده باردئي', '1275101143', NULL, NULL, 0, 1275101143, 'محمدرضا', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('ملينا', 'معيني كربكندي', '1275111785', NULL, NULL, 0, 1275111785, 'محمد', NULL, 'معماری داخلی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('روژينا', 'شمسي', '1275199534', NULL, NULL, 0, 1275199534, 'محمود', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مليكا', 'اكبري مورناني', '1275203159', NULL, NULL, 0, 1275203159, 'مجيد', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مائده', 'سرلك چيوا', '1275216595', NULL, NULL, 0, 1275216595, 'نعمت اله', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهراسادات', 'موسوي خرزوقي', '1275235141', NULL, NULL, 0, 1275235141, 'سيدهاشم', NULL, 'دستياري طراحي لباس(دوخت و ترميم)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('آتنا', 'كريمي', '1275244270', NULL, NULL, 0, 1275244270, 'رسول', NULL, 'تولید محتوای آموزشی الکترونیکی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('دنيا', 'رمضاني دستجردي', '1275248454', NULL, NULL, 0, 1275248454, 'محسن', NULL, 'معماری داخلی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('رونيكا', 'عباس پور', '1275258514', NULL, NULL, 0, 1275258514, 'مهدي', NULL, 'دستياري طراحي لباس(دوخت و ترميم)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مونا', 'رئيسي فرد', '1275264875', NULL, NULL, 0, 1275264875, 'اميررضا', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('ياسمن', 'كياني ابري', '1275280137', NULL, NULL, 0, 1275280137, 'عليرضا', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('نگار', 'الماسي', '1275284787', NULL, NULL, 0, 1275284787, 'مهدي', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('شيدا', 'حيدري', '1275298893', NULL, NULL, 0, 1275298893, 'فرهاد', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('روژان', 'مهدي راكي', '1275301894', NULL, NULL, 0, 1275301894, 'پيمان', NULL, 'تولید محتوای آموزشی الکترونیکی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مانيا', 'مرتضائي دمآبي', '1275303382', NULL, NULL, 0, 1275303382, 'دانيال', NULL, 'عكاسي ديجيتال', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('تبسم', 'بيات', '1275312985', NULL, NULL, 0, 1275312985, 'خليل', NULL, 'مديريت آشپزي و قنادي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مهسا', 'مطیعی جشوقانی', '1275336248', NULL, NULL, 0, 1275336248, 'رضا', NULL, 'مدیریت خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('فائزه', 'صفدريان', '1275343791', NULL, NULL, 0, 1275343791, 'حسن', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('ريحانه سادات', 'اسدي', '1275362206', NULL, NULL, 0, 1275362206, 'سيدمحمدرضا', NULL, 'دستياري طراحي لباس(دوخت و ترميم)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('يگانه', 'عابدي جوني', '1275365787', NULL, NULL, 0, 1275365787, 'رسول', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مبينا', 'احمدي', '1275379966', NULL, NULL, 0, 1275379966, 'محمد', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مهشيد', 'بخشي', '1275383221', NULL, NULL, 0, 1275383221, 'علي اصغر', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('پارميس', 'مصباح', '1275383319', NULL, NULL, 0, 1275383319, 'حميد', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مليكا', 'طالبي اسمعيلان', '1275386245', NULL, NULL, 0, 1275386245, 'حميدرضا', NULL, 'تولید محتوای آموزشی الکترونیکی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مارال', 'خرمي', '1275387519', NULL, NULL, 0, 1275387519, 'مهدي', NULL, 'عكاسي ديجيتال', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('محدثه', 'اوليائي', '1275409131', NULL, NULL, 0, 1275409131, 'ولي اله', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مهسا', 'فتوح', '1275411797', NULL, NULL, 0, 1275411797, 'مجيد', NULL, 'دستياري طراحي لباس(دوخت و ترميم)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مائده', 'موسوي زاده', '1275443095', NULL, NULL, 0, 1275443095, 'مختار', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('ستايش', 'سلطاني', '1275445251', NULL, NULL, 0, 1275445251, 'محمود', NULL, 'معماری داخلی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('پرنيا', 'شعباني افاراني', '1275451063', NULL, NULL, 0, 1275451063, 'داود', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('نكيسا', 'آتشگران خوزاني', '1275456006', NULL, NULL, 0, 1275456006, 'محمدجواد', NULL, 'معماری داخلی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('نرگس', 'قره داغي رزوه', '1275470742', NULL, NULL, 0, 1275470742, 'مهدي', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مهديه', 'اصلاني كرچي', '1275520057', NULL, NULL, 0, 1275520057, 'مهدي', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('هستي', 'پورسردار', '1275523013', NULL, NULL, 0, 1275523013, 'مهدي', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'بهرامي', '1275537731', NULL, NULL, 0, 1275537731, 'حجت', NULL, 'عكاسي ديجيتال', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('حديث', 'خليليان پوربيدآبادي', '1275562752', NULL, NULL, 0, 1275562752, 'مسعود', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'بهارلوئي', '1275565255', NULL, NULL, 0, 1275565255, 'علي', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('راضیه', 'رضایی قلعه تکی', '1275568050', NULL, NULL, 0, 1275568050, 'پرویز', NULL, 'مدیریت خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('راضيه', 'رضائي قلعه تكي', '1275568505', NULL, NULL, 0, 1275568505, 'داود', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('شكيلا', 'كلانتري دهقي', '1275569277', NULL, NULL, 0, 1275569277, 'اكبر', NULL, 'تولید محتوای آموزشی الکترونیکی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('آرزو', 'طراحان', '1275569341', NULL, NULL, 0, 1275569341, 'علي', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('نازنين زهرا', 'داوري دولت آبادي', '1275576125', NULL, NULL, 0, 1275576125, 'محمدعلي', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('هستي', 'محمدي آشياني', '1275597440', NULL, NULL, 0, 1275597440, 'مهران', NULL, 'تولید محتوای آموزشی الکترونیکی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('پرنيا', 'جرياني', '1275601138', NULL, NULL, 0, 1275601138, 'جعفر', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مهديس', 'مرادي كلبي بيگي', '1275602738', NULL, NULL, 0, 1275602738, 'منوچهر', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('هستي', 'روحاني قهساره', '1275629598', NULL, NULL, 0, 1275629598, 'روح اله', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('فاطمه', 'بزرگي علي آبادي', '1275637418', NULL, NULL, 0, 1275637418, 'نورالله', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('نگين', 'رضائي مزرعه', '1275705146', NULL, NULL, 0, 1275705146, 'نادعلي', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('النا', 'كورنگي', '1275707874', NULL, NULL, 0, 1275707874, 'مهدي', NULL, 'تولید محتوای آموزشی الکترونیکی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('شيماء', 'جادري', '1278737871', NULL, NULL, 0, 1278737871, 'طالب', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('حامد ', 'اسماعیلی', '1285177886', NULL, NULL, 1, 1285177886, 'حسن', '1363-11-01', NULL, 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, 'تست', '09132199706', NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سمیه', 'رنجکش ادرمنابادی', '1287307108', NULL, NULL, 0, 1287307108, 'حسن', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زينب', 'عابدپوردهاقاني', '1288183062', NULL, NULL, 0, 1288183062, 'حسنعلي', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('فاطمه', 'اعرابي', '1288220731', NULL, NULL, 0, 1288220731, 'خيراله', NULL, 'توليد و پرورش گل و گياهان زینتی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مريم', 'سنجري مورچگاني', '1291539492', NULL, NULL, 0, 1291539492, 'قاسمعلي', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('فرزانه', 'محمدخاني', '1292443049', NULL, NULL, 0, 1292443049, 'عبدالعظيم', NULL, 'توليد و پرورش گل و گياهان زینتی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('طاهره', 'سنجري مورچگاني', '1293395706', NULL, NULL, 0, 1293395706, 'قاسمعلي', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('ساره', 'ملک محمدی', '1293508608', NULL, NULL, 0, 1293508608, 'قربانعلی', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('عسل', 'خدابخش', '1452253218', NULL, NULL, 0, 1452253218, 'مسعود', NULL, 'دستياري طراحي لباس(دوخت و ترميم)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('تارا', 'طهماسبي زاده', '1745126767', NULL, NULL, 0, 1745126767, 'عباسعلي', NULL, 'تولید محتوای آموزشی الکترونیکی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سارا', 'طاهری مفرد', '1850626618', NULL, NULL, 0, 1850626618, 'ابراهیم', NULL, 'دستیار طراحی لباس', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('افسانه', 'سلطاني منصورنژاد', '1940291445', NULL, NULL, 0, 1940291445, 'صادق', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سوگند', 'شريفي قاسمي', '1941063918', NULL, NULL, 0, 1941063918, 'مصطفي', NULL, 'تولید محتوای آموزشی الکترونیکی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('شقایق', 'همایون پور', '1971669849', NULL, NULL, 0, 1971669849, 'غلامرضا', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سكينه', 'كرمي', '2296978843', NULL, NULL, 0, 2296978843, 'اسفنديار', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('هستي', 'فتحي هرسيني', '3310350711', NULL, NULL, 0, 3310350711, 'علي', NULL, 'معماری داخلی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مژگان', 'رضایی', '4160056903', NULL, NULL, 0, 4160056903, 'نصیر', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('گلزاده', 'والانیک', '4220322906', NULL, NULL, 0, 4220322906, 'علی نقی', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زينب', 'رمضاني گهروئي', '4610243067', NULL, NULL, 0, 4610243067, 'فريدون', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('پريسا', 'رسولي هاروني', '4611105997', NULL, NULL, 0, 4611105997, 'ابراهيم', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('رضوان', 'اصغرزاده', '4622191407', NULL, NULL, 0, 4622191407, 'محمدعلي', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مرضيه', 'شهراني كراني', '4670406221', NULL, NULL, 0, 4670406221, 'فرداد', NULL, 'دستياري طراحي لباس(دوخت و ترميم)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سولماز', 'درشوري', '5110001979', NULL, NULL, 0, 5110001979, 'شهريار', NULL, 'مدیریت و برنامه ریزی امور خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('فاطمه', 'حاتمي پور', '5410358856', NULL, NULL, 0, 5410358856, 'بيژن', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('عفت', 'صادقي', '5649970009', NULL, NULL, 0, 5649970009, 'محمد', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('شهناز', 'احمدی دستجردی', '5649974543', NULL, NULL, 0, 5649974543, 'علی', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('بيتا', 'نوري امامزاده', '5650136459', NULL, NULL, 0, 5650136459, 'فرهاد', NULL, 'دستياري طراحي لباس(دوخت و ترميم)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'کاظم زاده', '5659971962', NULL, NULL, 0, 5659971962, 'احمد', NULL, 'گل گیاه زینتی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مريم', 'امامي گشنيزجاني', '5759939300', NULL, NULL, 0, 5759939300, 'بهرام', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سحر', 'محرابي', '6210070426', NULL, NULL, 0, 6210070426, 'پرويز', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('پريسا', 'رفيعي مياندشتي', '6210080200', NULL, NULL, 0, 6210080200, 'احمد', NULL, 'تولید محتوای آموزشی الکترونیکی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سمیه', 'سرایی', '6479811755', NULL, NULL, 0, 6479811755, 'محمد', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'شكيبا', '6600140860', NULL, NULL, 0, 6600140860, 'رحمت اله', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('ساناز', 'ميرزائي', '6600204771', NULL, NULL, 0, 6600204771, 'محسن', NULL, 'تولید محتوای آموزشی الکترونیکی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('سودابه', 'رحیمی', '9025369871', NULL, NULL, 0, 9025369871, 'غلام', NULL, 'تولید محتوا', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('ثریا', 'محمدی', '9043718002', NULL, NULL, 0, 9043718002, 'ابراهیم', NULL, 'گل وگیاه زینتی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('حمیرا', 'مرادی', '9300713848', NULL, NULL, 0, 9300713848, 'عبدالواحد', NULL, 'تجربی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('ذاکره', 'حسن زاده', '9421523374', NULL, NULL, 0, 9421523374, 'رمضان', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا ', 'مرادی', '11500054697', NULL, NULL, 0, 11500054697, 'عثوت الله', NULL, 'مدیریت خانواده', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('الناز', 'بیات', '12749622900', NULL, NULL, 0, 12749622900, 'یوسف', NULL, 'دستیار طراحی لباس', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('پریناز', 'یزدانی', '12775280617', NULL, NULL, 0, 12775280617, 'حمید', NULL, 'ریاضی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زینب', 'قلی زاده', '91020572892', NULL, NULL, 0, 91020572892, 'محمد ابراهیم', NULL, 'ادبیات', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('مبینا', 'رسولی', '91027720841', NULL, NULL, 0, 91027720841, 'احمدجاوید', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('ثریا', 'نوروزی', '91027772577', NULL, NULL, 0, 91027772577, 'محمد نبی', NULL, 'گرافيك رايانه اي(314)', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('فاطمه', 'نیک زاد', '94020007856', NULL, NULL, 0, 94020007856, 'حیدر', NULL, 'تولید محتوای آموزشی الکترونیکی', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('نرگس', 'رضایی', '94020011404', NULL, NULL, 0, 94020011404, 'آیت الله', NULL, 'حسابداري مالي', 1, 1, '2025-01-18 00:00:00', '2025-01-18 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for reg_student_account
-- ----------------------------
DROP TABLE IF EXISTS `reg_student_account`;
CREATE TABLE `reg_student_account`  (
  `st_id` bigint NOT NULL AUTO_INCREMENT,
  `acc_id` bigint NOT NULL DEFAULT 0,
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`st_id`, `acc_id`) USING BTREE,
  INDEX `acc_id`(`acc_id` ASC) USING BTREE,
  CONSTRAINT `reg_student_account_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `reg_student` (`student_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_student_account_ibfk_2` FOREIGN KEY (`acc_id`) REFERENCES `finance_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 94020011405 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_student_account
-- ----------------------------
INSERT INTO `reg_student_account` VALUES (112247687, 14057, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (620080200, 14192, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1080712399, 14050, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1080863001, 14051, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1080891781, 14052, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1100760318, 14053, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1110856520, 14054, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1120152372, 14055, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1120247713, 14056, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1130749908, 14058, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1150054697, 14060, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1150182334, 14061, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1150318945, 14062, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1159259658, 14063, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1159933022, 14064, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1160445079, 14065, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1160486786, 14066, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1160534047, 14067, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1190353407, 14068, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1200014324, 14069, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1270220454, 14070, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1270624326, 14071, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1270712950, 14072, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1270727796, 14073, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1271605635, 14074, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1272036790, 14075, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1272340351, 14076, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1272714551, 14077, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1273020936, 14078, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1273101138, 14079, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1273490843, 14080, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274007372, 14081, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274034116, 14082, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274336058, 14083, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274363861, 14084, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274397944, 14085, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274407664, 14086, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274424909, 14087, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274441511, 14088, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274457459, 14089, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274520411, 14090, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274521701, 14091, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274591988, 14092, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274610311, 14093, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274639042, 14094, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274653347, 14095, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274675340, 14096, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274751462, 14097, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274786681, 14098, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274789338, 14099, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274809959, 14100, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274812569, 14101, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274817900, 14102, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274834988, 14103, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274852757, 14104, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274853117, 14105, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274871638, 14106, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274893771, 14107, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274903955, 14108, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274950015, 14109, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274962900, 14111, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1274989396, 14112, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275101143, 14113, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275111785, 14114, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275199534, 14115, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275203159, 14116, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275216595, 14117, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275235141, 14118, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275244270, 14119, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275248454, 14120, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275258514, 14121, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275264875, 14122, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275280137, 14123, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275284787, 14124, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275298893, 14125, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275301894, 14126, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275303382, 14127, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275312985, 14128, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275336248, 14129, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275343791, 14130, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275362206, 14131, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275365787, 14132, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275379966, 14133, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275383221, 14134, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275383319, 14135, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275386245, 14136, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275387519, 14137, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275409131, 14138, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275411797, 14139, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275443095, 14140, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275445251, 14141, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275451063, 14142, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275456006, 14143, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275470742, 14144, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275520057, 14145, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275523013, 14146, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275537731, 14147, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275562752, 14148, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275565255, 14149, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275568050, 14150, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275568505, 14151, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275569277, 14152, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275569341, 14153, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275576125, 14154, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275597440, 14155, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275601138, 14156, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275602738, 14157, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275629598, 14158, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275637418, 14159, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275705146, 14160, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1275707874, 14161, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1278737871, 14163, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1285177886, 14049, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1287307108, 14164, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1288183062, 14165, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1288220731, 14166, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1291539492, 14167, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1292443049, 14168, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1293395706, 14169, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1293508608, 14170, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1452253218, 14171, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1745126767, 14172, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1850626618, 14173, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1940291445, 14174, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1941063918, 14175, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1971669849, 14176, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (2296978843, 14177, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (3310350711, 14178, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (4160056903, 14179, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (4220322906, 14180, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (4610243067, 14181, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (4611105997, 14182, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (4622191407, 14183, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (4670406221, 14184, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (5110001979, 14185, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (5410358856, 14186, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (5649970009, 14187, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (5649974543, 14188, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (5650136459, 14189, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (5659971962, 14190, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (5759939300, 14191, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (6210070426, 14193, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (6210080200, 14194, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (6479811755, 14195, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (6600140860, 14196, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (6600204771, 14197, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (9025369871, 14198, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (9043718002, 14199, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (9300713848, 14203, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (9421523374, 14206, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (11500054697, 14059, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (12749622900, 14110, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (12775280617, 14162, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (91020572892, 14200, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (91027720841, 14201, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (91027772577, 14202, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (94020007856, 14204, '2025-01-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (94020011404, 14205, '2025-01-18 00:00:00');

-- ----------------------------
-- Table structure for reg_student_image
-- ----------------------------
DROP TABLE IF EXISTS `reg_student_image`;
CREATE TABLE `reg_student_image`  (
  `st_code` bigint NOT NULL,
  `st_image` blob NULL,
  PRIMARY KEY (`st_code`) USING BTREE,
  CONSTRAINT `reg_student_image_ibfk_1` FOREIGN KEY (`st_code`) REFERENCES `reg_student` (`student_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_student_image
-- ----------------------------

-- ----------------------------
-- Table structure for reg_student_status
-- ----------------------------
DROP TABLE IF EXISTS `reg_student_status`;
CREATE TABLE `reg_student_status`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_student_status
-- ----------------------------
INSERT INTO `reg_student_status` VALUES (1, 'فعال');
INSERT INTO `reg_student_status` VALUES (2, 'انتقال رفته');
INSERT INTO `reg_student_status` VALUES (3, 'بلاتکلیف');
INSERT INTO `reg_student_status` VALUES (4, 'ترک تحصیل');
INSERT INTO `reg_student_status` VALUES (5, 'فارغ التحصیل');

-- ----------------------------
-- Table structure for reg_term
-- ----------------------------
DROP TABLE IF EXISTS `reg_term`;
CREATE TABLE `reg_term`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `from_date` date NULL DEFAULT NULL,
  `to_date` date NULL DEFAULT NULL,
  `is_current` bit(1) NULL DEFAULT NULL,
  `year` int NULL DEFAULT NULL,
  `dore` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9331 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_term
-- ----------------------------
INSERT INTO `reg_term` VALUES (9329, 'نيمسال دوم 402-403', '2024-01-21', '2024-06-20', b'1', 402, 5);
INSERT INTO `reg_term` VALUES (9330, 'نیم سال دوم  403-404', NULL, NULL, b'0', 3, 5);

-- ----------------------------
-- Table structure for st_govahi_vaziat
-- ----------------------------
DROP TABLE IF EXISTS `st_govahi_vaziat`;
CREATE TABLE `st_govahi_vaziat`  (
  `id` bigint NOT NULL DEFAULT 0,
  `st_id` bigint NULL DEFAULT NULL,
  `govahi_letter_num` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `govahi_letter_date` datetime NULL DEFAULT NULL,
  `govahi_base` bigint NULL DEFAULT NULL,
  `govahi_level` bigint NULL DEFAULT NULL,
  `govahi_last_date` datetime NULL DEFAULT NULL,
  `govahi_last_status` int NOT NULL DEFAULT 0,
  `govahi_last_madrak` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `govahi_edit_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `st_id`(`st_id` ASC) USING BTREE,
  INDEX `govahi_base`(`govahi_base` ASC) USING BTREE,
  INDEX `govahi_level`(`govahi_level` ASC) USING BTREE,
  CONSTRAINT `st_govahi_vaziat_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `reg_student` (`student_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `st_govahi_vaziat_ibfk_2` FOREIGN KEY (`govahi_base`) REFERENCES `reg_base` (`base_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `st_govahi_vaziat_ibfk_3` FOREIGN KEY (`govahi_level`) REFERENCES `reg_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_govahi_vaziat
-- ----------------------------

-- ----------------------------
-- Table structure for temp_old_student
-- ----------------------------
DROP TABLE IF EXISTS `temp_old_student`;
CREATE TABLE `temp_old_student`  (
  `melli_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `father_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `birth_day` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`melli_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of temp_old_student
-- ----------------------------
INSERT INTO `temp_old_student` VALUES ('1080712399', 'شیدا', 'ححیدری سلطانیی', 'غلامعلی', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('1080863001', 'شادي', 'ترك زاده اشني', 'عبداله', '13870316', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1080891781', 'زينب', 'شكراللهي يانچشمه', 'محسن', '13871014', 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `temp_old_student` VALUES ('1100760318', 'ریحانه', 'کاظمی', 'حسن', NULL, 'اشپزی');
INSERT INTO `temp_old_student` VALUES ('1110856520', 'سمیه', 'جلالی جلال آبادی', 'غلامعلی', '13610307', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1120152372', 'سید مرضیه', 'طهماسبی', NULL, NULL, 'تجربی');
INSERT INTO `temp_old_student` VALUES ('1120247713', 'الينا', 'قلاني', 'سروش', '13860920', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('112247687', 'فاطمه', 'گلبي قلعهء', 'امير', '13860217', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1130749908', 'شادي', 'كرمي', 'اسماعيل', '13850904', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('11500054697', 'زهرا ', 'مرادی', 'عثوت الله', NULL, 'مدیریت خانواده');
INSERT INTO `temp_old_student` VALUES ('1150054697', 'زهرا', 'مرادي', 'عزت اله', '13680713', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1150182334', 'زهرا', 'محمدی', 'نظرعلی', '13731123', 'نقاشي ايراني');
INSERT INTO `temp_old_student` VALUES ('1150318945', 'كيميا', 'كاظمي', 'مصطفي', '13871029', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1159259658', 'زهرا', 'مهدي چهل خانه', 'عقيل', '13580701', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1159933022', 'مریم', 'گرامی', 'خدابخش', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('1160445079', 'مهسا', 'مهربان گهروئي', 'لطف الله', '13810705', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1160486786', 'زهرا', 'حدادي بيستگاني', 'وحيد', '13830520', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1160534047', 'آتنا', 'عباسي كله مسلماني', 'ناصر', '13850603', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1190353407', 'نرگس', 'صدري', 'حسينعلي', '13830710', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1200014324', 'مريم', 'آقائي سميرمي', 'رسول', '13680531', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1270220454', 'مرجان', 'زارعي شمس آبادي', 'اصغر', '13680625', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1270624326', 'منصوره', 'وكيلي', 'مصطفي', '13690612', 'توليد و پرورش گل و گياهان زینتی');
INSERT INTO `temp_old_student` VALUES ('1270712950', 'زهرا ', 'سعیدی', NULL, NULL, 'گل گیاه زینتی');
INSERT INTO `temp_old_student` VALUES ('1270727796', 'عاطفه', 'موسوی نهرخلجی', 'علی اکبر', '13691007', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1271605635', 'شيوا', 'پرويزي', 'شهرام', '13700907', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1272036790', 'فاطمه', 'صحرائي', 'كرمعلي', '13740525', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1272340351', 'زهرا', 'صادقي', 'جلال', '13751109', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1272714551', 'مينا', 'احمدي جو', 'علي', '13770510', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1273020936', 'زهرا', 'مختاري مقدم', 'حسين', '13780615', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1273101138', 'فاطمه', 'باقرزاده', 'عباس', '13781013', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1273490843', 'ملیکا', 'ژیلانسب', 'محمد', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('1274007372', 'زهرا', 'كارآور', 'اكبر', '13820303', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1274034116', 'الهه', 'رئیسی وستگانی', 'طهمورث', '13820326', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1274336058', 'مبینا سادات', 'شاه زیدی', 'سید اصغر', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('1274363861', 'نرجس', 'طالبی', 'داود', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('1274397944', 'سارا', 'مسعودي', 'حميدرضا', '13830910', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1274407664', 'پریناز', 'اینالویی', 'سعید', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('1274424909', 'سارا', 'صابری زفرقندی', 'کاظم', NULL, 'تجربی');
INSERT INTO `temp_old_student` VALUES ('1274441511', 'آتنا', 'قاسمي تبار', 'حسين', '13831106', 'توليد و پرورش گل و گياهان زینتی');
INSERT INTO `temp_old_student` VALUES ('1274457459', 'محدیث', 'غلامی سمسوری', 'ناصر', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('1274520411', 'فاطمه', 'خالقی', 'حمیدرضا', NULL, 'تجربی');
INSERT INTO `temp_old_student` VALUES ('1274521701', 'سارا', 'دهاقانی', 'مرتضی', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('1274591988', 'ريحانه سادات', 'سلطاني اورگاني', 'سيدمهدي', '13840424', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1274610311', 'فاطمه', 'رشیدی', 'ستار', NULL, 'تجربی');
INSERT INTO `temp_old_student` VALUES ('1274639042', 'بهار', 'جعفري', 'غلامرضا', '13840706', 'معماری داخلی');
INSERT INTO `temp_old_student` VALUES ('1274653347', 'نازنين', 'حياتي دهلقي', 'فردين', '13840728', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1274675340', 'فاطمه', 'نوري', 'عليرضا', '13840813', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1274751462', 'پرنيا', 'جهانگيري نسب', 'مهدي', '13841211', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1274786681', 'عصمت', 'زارعان آدرمنابادي', 'رضا', '13850210', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1274789338', 'مائده', 'حيدري', 'مجيدرضا', '13850131', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1274809959', 'مایده', 'شجاعی جشوقانی', 'محمد', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('1274812569', 'مهسا', 'رسولي', 'شاهپور', '13850301', 'معماری داخلی');
INSERT INTO `temp_old_student` VALUES ('1274817900', 'زینب', 'حقیقی زاده', 'مجید', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('1274834988', 'نيلوفر', 'هژيراطهر', 'حسنعلي', '13850121', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1274852757', 'صبا', 'اميرحاجلو', 'روح اله', '13850404', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1274853117', 'فاطمه', 'غلامي فشاركي', 'بهرام', '13850425', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1274871638', 'دینا', 'محمودی', 'عباس', NULL, 'ریاضی-فیزیک');
INSERT INTO `temp_old_student` VALUES ('1274893771', 'كوثر', 'مطلبي فشاركي', 'روح اله', '13850528', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1274903955', 'زكيه', 'نصرآزاداني', 'حسين', '13850619', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1274950015', 'نگار', 'پورياي ولي', 'سعيد', '13850909', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('12749622900', 'الناز', 'بیات', 'یوسف', NULL, 'دستیار طراحی لباس');
INSERT INTO `temp_old_student` VALUES ('1274962900', 'الناز', 'بيات', 'يوسف', '13850902', 'دستياري طراحي لباس(دوخت و ترميم)');
INSERT INTO `temp_old_student` VALUES ('1274989396', 'زهرا', 'قجاوندبلتيجه', 'رسول', '13851006', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275101143', 'حديث', 'كريم زاده باردئي', 'محمدرضا', '13860218', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275111785', 'ملينا', 'معيني كربكندي', 'محمد', '13860331', 'معماری داخلی');
INSERT INTO `temp_old_student` VALUES ('1275199534', 'روژينا', 'شمسي', 'محمود', '13860717', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275203159', 'مليكا', 'اكبري مورناني', 'مجيد', '13860714', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275216595', 'مائده', 'سرلك چيوا', 'نعمت اله', '13860728', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1275235141', 'زهراسادات', 'موسوي خرزوقي', 'سيدهاشم', '13860824', 'دستياري طراحي لباس(دوخت و ترميم)');
INSERT INTO `temp_old_student` VALUES ('1275244270', 'آتنا', 'كريمي', 'رسول', '13860822', 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `temp_old_student` VALUES ('1275248454', 'دنيا', 'رمضاني دستجردي', 'محسن', '13860910', 'معماری داخلی');
INSERT INTO `temp_old_student` VALUES ('1275258514', 'رونيكا', 'عباس پور', 'مهدي', '13861017', 'دستياري طراحي لباس(دوخت و ترميم)');
INSERT INTO `temp_old_student` VALUES ('1275264875', 'مونا', 'رئيسي فرد', 'اميررضا', '13861005', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275280137', 'ياسمن', 'كياني ابري', 'عليرضا', '13860110', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275284787', 'نگار', 'الماسي', 'مهدي', '13861012', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1275298893', 'شيدا', 'حيدري', 'فرهاد', '13861103', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1275301894', 'روژان', 'مهدي راكي', 'پيمان', '13861123', 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `temp_old_student` VALUES ('1275303382', 'مانيا', 'مرتضائي دمآبي', 'دانيال', '13861128', 'عكاسي ديجيتال');
INSERT INTO `temp_old_student` VALUES ('1275312985', 'تبسم', 'بيات', 'خليل', '13861211', 'مديريت آشپزي و قنادي');
INSERT INTO `temp_old_student` VALUES ('1275336248', 'مهسا', 'مطیعی جشوقانی', 'رضا', NULL, 'مدیریت خانواده');
INSERT INTO `temp_old_student` VALUES ('1275343791', 'فائزه', 'صفدريان', 'حسن', '13870131', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1275362206', 'ريحانه سادات', 'اسدي', 'سيدمحمدرضا', '13870231', 'دستياري طراحي لباس(دوخت و ترميم)');
INSERT INTO `temp_old_student` VALUES ('1275365787', 'يگانه', 'عابدي جوني', 'رسول', '13870218', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275379966', 'مبينا', 'احمدي', 'محمد', '13870321', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275383221', 'مهشيد', 'بخشي', 'علي اصغر', '13870419', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1275383319', 'پارميس', 'مصباح', 'حميد', '13870409', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1275386245', 'مليكا', 'طالبي اسمعيلان', 'حميدرضا', '13870319', 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `temp_old_student` VALUES ('1275387519', 'مارال', 'خرمي', 'مهدي', '13870322', 'عكاسي ديجيتال');
INSERT INTO `temp_old_student` VALUES ('1275409131', 'محدثه', 'اوليائي', 'ولي اله', '13870414', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275411797', 'مهسا', 'فتوح', 'مجيد', '13870423', 'دستياري طراحي لباس(دوخت و ترميم)');
INSERT INTO `temp_old_student` VALUES ('1275443095', 'مائده', 'موسوي زاده', 'مختار', '13870529', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275445251', 'ستايش', 'سلطاني', 'محمود', '13870602', 'معماری داخلی');
INSERT INTO `temp_old_student` VALUES ('1275451063', 'پرنيا', 'شعباني افاراني', 'داود', '13870529', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275456006', 'نكيسا', 'آتشگران خوزاني', 'محمدجواد', '13870516', 'معماری داخلی');
INSERT INTO `temp_old_student` VALUES ('1275470742', 'نرگس', 'قره داغي رزوه', 'مهدي', '13870622', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1275520057', 'مهديه', 'اصلاني كرچي', 'مهدي', '13870904', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275523013', 'هستي', 'پورسردار', 'مهدي', '13870906', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275537731', 'زهرا', 'بهرامي', 'حجت', '13870906', 'عكاسي ديجيتال');
INSERT INTO `temp_old_student` VALUES ('1275562752', 'حديث', 'خليليان پوربيدآبادي', 'مسعود', '13870829', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275565255', 'زهرا', 'بهارلوئي', 'علي', '13870913', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275568050', 'راضیه', 'رضایی قلعه تکی', 'پرویز', NULL, 'مدیریت خانواده');
INSERT INTO `temp_old_student` VALUES ('1275568505', 'راضيه', 'رضائي قلعه تكي', 'داود', '13871117', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1275569277', 'شكيلا', 'كلانتري دهقي', 'اكبر', '13871027', 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `temp_old_student` VALUES ('1275569341', 'آرزو', 'طراحان', 'علي', '13871115', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1275576125', 'نازنين زهرا', 'داوري دولت آبادي', 'محمدعلي', '13871004', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1275597440', 'هستي', 'محمدي آشياني', 'مهران', '13871116', 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `temp_old_student` VALUES ('1275601138', 'پرنيا', 'جرياني', 'جعفر', '13871215', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1275602738', 'مهديس', 'مرادي كلبي بيگي', 'منوچهر', '13871213', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275629598', 'هستي', 'روحاني قهساره', 'روح اله', '13880109', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275637418', 'فاطمه', 'بزرگي علي آبادي', 'نورالله', '13880116', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275705146', 'نگين', 'رضائي مزرعه', 'نادعلي', '13880411', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('1275707874', 'النا', 'كورنگي', 'مهدي', '13880417', 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `temp_old_student` VALUES ('12775280617', 'پریناز', 'یزدانی', 'حمید', NULL, 'ریاضی');
INSERT INTO `temp_old_student` VALUES ('1278737871', 'شيماء', 'جادري', 'طالب', '13620309', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1287307108', 'سمیه', 'رنجکش ادرمنابادی', 'حسن', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('1288183062', 'زينب', 'عابدپوردهاقاني', 'حسنعلي', '13580608', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('1288220731', 'فاطمه', 'اعرابي', 'خيراله', '13590310', 'توليد و پرورش گل و گياهان زینتی');
INSERT INTO `temp_old_student` VALUES ('1291539492', 'مريم', 'سنجري مورچگاني', 'قاسمعلي', '13600115', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1292443049', 'فرزانه', 'محمدخاني', 'عبدالعظيم', '13640912', 'توليد و پرورش گل و گياهان زینتی');
INSERT INTO `temp_old_student` VALUES ('1293395706', 'طاهره', 'سنجري مورچگاني', 'قاسمعلي', '13650213', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1293508608', 'ساره', 'ملک محمدی', 'قربانعلی', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('1452253218', 'عسل', 'خدابخش', 'مسعود', '13861026', 'دستياري طراحي لباس(دوخت و ترميم)');
INSERT INTO `temp_old_student` VALUES ('1745126767', 'تارا', 'طهماسبي زاده', 'عباسعلي', '13860418', 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `temp_old_student` VALUES ('1850626618', 'سارا', 'طاهری مفرد', 'ابراهیم', NULL, 'دستیار طراحی لباس');
INSERT INTO `temp_old_student` VALUES ('1940291445', 'افسانه', 'سلطاني منصورنژاد', 'صادق', '13710922', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('1941063918', 'سوگند', 'شريفي قاسمي', 'مصطفي', '13871027', 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `temp_old_student` VALUES ('1971669849', 'شقایق', 'همایون پور', 'غلامرضا', '13611122', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('2296978843', 'سكينه', 'كرمي', 'اسفنديار', '13600118', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('3310350711', 'هستي', 'فتحي هرسيني', 'علي', '13850327', 'معماری داخلی');
INSERT INTO `temp_old_student` VALUES ('4160056903', 'مژگان', 'رضایی', 'نصیر', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('4220322906', 'گلزاده', 'والانیک', 'علی نقی', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('4610243067', 'زينب', 'رمضاني گهروئي', 'فريدون', '13700430', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('4611105997', 'پريسا', 'رسولي هاروني', 'ابراهيم', '13851222', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('4622191407', 'رضوان', 'اصغرزاده', 'محمدعلي', '13610101', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('4670406221', 'مرضيه', 'شهراني كراني', 'فرداد', '13841209', 'دستياري طراحي لباس(دوخت و ترميم)');
INSERT INTO `temp_old_student` VALUES ('5110001979', 'سولماز', 'درشوري', 'شهريار', '13600726', 'مدیریت و برنامه ریزی امور خانواده');
INSERT INTO `temp_old_student` VALUES ('5410358856', 'فاطمه', 'حاتمي پور', 'بيژن', '13871111', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('5649970009', 'عفت', 'صادقي', 'محمد', '13670327', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('5649974543', 'شهناز', 'احمدی دستجردی', 'علی', '13650811', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('5650136459', 'بيتا', 'نوري امامزاده', 'فرهاد', '13850714', 'دستياري طراحي لباس(دوخت و ترميم)');
INSERT INTO `temp_old_student` VALUES ('5659971962', 'زهرا', 'کاظم زاده', 'احمد', NULL, 'گل گیاه زینتی');
INSERT INTO `temp_old_student` VALUES ('5759939300', 'مريم', 'امامي گشنيزجاني', 'بهرام', '13650601', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('620080200', 'پریسا', 'رفیعی', 'احمد', NULL, 'تولید محتوا');
INSERT INTO `temp_old_student` VALUES ('6210070426', 'سحر', 'محرابي', 'پرويز', '13830812', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('6210080200', 'پريسا', 'رفيعي مياندشتي', 'احمد', '13860824', 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `temp_old_student` VALUES ('6479811755', 'سمیه', 'سرایی', 'محمد', '13630605', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('6600140860', 'زهرا', 'شكيبا', 'رحمت اله', '13830421', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('6600204771', 'ساناز', 'ميرزائي', 'محسن', '13871218', 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `temp_old_student` VALUES ('9025369871', 'سودابه', 'رحیمی', 'غلام', NULL, 'تولید محتوا');
INSERT INTO `temp_old_student` VALUES ('9043718002', 'ثریا', 'محمدی', 'ابراهیم', NULL, 'گل وگیاه زینتی');
INSERT INTO `temp_old_student` VALUES ('91020572892', 'زینب', 'قلی زاده', 'محمد ابراهیم', NULL, 'ادبیات');
INSERT INTO `temp_old_student` VALUES ('91027720841', 'مبینا', 'رسولی', 'احمدجاوید', '13870513', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('91027772577', 'ثریا', 'نوروزی', 'محمد نبی', '13820109', 'گرافيك رايانه اي(314)');
INSERT INTO `temp_old_student` VALUES ('9300713848', 'حمیرا', 'مرادی', 'عبدالواحد', NULL, 'تجربی');
INSERT INTO `temp_old_student` VALUES ('94020007856', 'فاطمه', 'نیک زاد', 'حیدر', '13880216', 'تولید محتوای آموزشی الکترونیکی');
INSERT INTO `temp_old_student` VALUES ('94020011404', 'نرگس', 'رضایی', 'آیت الله', '13880527', 'حسابداري مالي');
INSERT INTO `temp_old_student` VALUES ('9421523374', 'ذاکره', 'حسن زاده', 'رمضان', '13790601', 'گرافيك رايانه اي(314)');

-- ----------------------------
-- Table structure for temp_test2
-- ----------------------------
DROP TABLE IF EXISTS `temp_test2`;
CREATE TABLE `temp_test2`  (
  `MajorCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `StudentCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `TimeDore` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Timeyear` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `NationalCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `LastName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `StudentCode1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FirstName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`StudentCode`, `TimeDore`, `Timeyear`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of temp_test2
-- ----------------------------
INSERT INTO `temp_test2` VALUES ('9901', '1080519874', '4', '96', '1080519874', 'كسائي دهكردي', '1080519874', 'سيدمحمد');
INSERT INTO `temp_test2` VALUES ('9901', '1080519874', '5', '96', '1080519874', 'كسائي دهكردي', '1080519874', 'سيدمحمد');
INSERT INTO `temp_test2` VALUES ('6184', '1091342334', '4', '96', '1091342334', 'اصلاني', '1091342334', 'الياس');
INSERT INTO `temp_test2` VALUES ('6116', '1092261443', '4', '96', '1092261443', 'جلالي نجف آبادي', '1092261443', 'حسين');
INSERT INTO `temp_test2` VALUES ('9901', '1100188673', '5', '96', '1100188673', 'شاه نظري زازراني', '1100188673', 'محمدرضا');
INSERT INTO `temp_test2` VALUES ('9901', '1100312821', '5', '96', '1100312821', 'كارگري', '1100312821', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9901', '1129802817', '4', '96', '1129802817', 'دادخواه', '1129802817', 'سيدحسين');
INSERT INTO `temp_test2` VALUES ('6184', '1130331938', '5', '96', '1130331938', 'ابراهيمي دستگردي', '1130331938', 'محسن');
INSERT INTO `temp_test2` VALUES ('9901', '1130449831', '5', '96', '1130449831', 'باقري كرم ورنوسفادراني', '1130449831', 'ميلاد');
INSERT INTO `temp_test2` VALUES ('6116', '1130503321', '4', '96', '1130503321', 'شكراني', '1130503321', 'عليرضا');
INSERT INTO `temp_test2` VALUES ('6116', '1130503321', '5', '96', '1130503321', 'شكراني', '1130503321', 'عليرضا');
INSERT INTO `temp_test2` VALUES ('9901', '1141181045', '5', '96', '1141181045', 'مهرابي كوشكي', '1141181045', 'رمضانعلي');
INSERT INTO `temp_test2` VALUES ('9916', '1142139948', '4', '96', '1142139948', 'رضائي آدرياني', '1142139948', 'اصغر');
INSERT INTO `temp_test2` VALUES ('9916', '1142139948', '5', '96', '1142139948', 'رضائي آدرياني', '1142139948', 'اصغر');
INSERT INTO `temp_test2` VALUES ('9901', '1142446662', '5', '96', '1142446662', 'حاجي ابراهيمي فروشاني', '1142446662', 'جواد');
INSERT INTO `temp_test2` VALUES ('9901', '1190013551', '4', '96', '1190013551', 'انصاريپور', '1190013551', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9916', '1209941627', '5', '96', '1209941627', 'طاهري', '1209941627', 'محمودرضا');
INSERT INTO `temp_test2` VALUES ('6184', '1229385959', '5', '96', '1229385959', 'اسماعيلي', '1229385959', 'حيدر');
INSERT INTO `temp_test2` VALUES ('9916', '1270128302', '4', '96', '1270128302', 'هاروني', '1270128302', 'محمدصادق');
INSERT INTO `temp_test2` VALUES ('9916', '1270151495', '4', '96', '1270151495', 'سلطاني', '1270151495', 'حسين');
INSERT INTO `temp_test2` VALUES ('9916', '1270151495', '5', '96', '1270151495', 'سلطاني', '1270151495', 'حسين');
INSERT INTO `temp_test2` VALUES ('6184', '1270162373', '5', '96', '1270162373', 'رضايي قهجاورستاني', '1270162373', 'وحيد');
INSERT INTO `temp_test2` VALUES ('9916', '1270179764', '5', '96', '1270179764', 'اسفندياري', '1270179764', 'علي اكبر');
INSERT INTO `temp_test2` VALUES ('9901', '1270307282', '5', '96', '1270307282', 'عزيزي', '1270307282', 'يونس');
INSERT INTO `temp_test2` VALUES ('9901', '1270308025', '4', '96', '1270308025', 'نيكبخت', '1270308025', 'مسعود');
INSERT INTO `temp_test2` VALUES ('9901', '1270565095', '4', '96', '1270565095', 'افراسيابي', '1270565095', 'مجيد');
INSERT INTO `temp_test2` VALUES ('9901', '1270579861', '4', '96', '1270579861', 'عباسيان آفاراني', '1270579861', 'احسان');
INSERT INTO `temp_test2` VALUES ('9901', '1270607091', '5', '96', '1270607091', 'سقائي پوراصفهاني', '1270607091', 'اميد');
INSERT INTO `temp_test2` VALUES ('9901', '1270614207', '5', '96', '1270614207', 'جلالي عاشق آبادي', '1270614207', 'مجتبي');
INSERT INTO `temp_test2` VALUES ('9916', '1270789651', '4', '96', '1270789651', 'شهبازي دستجرده', '1270789651', 'اميرحسين');
INSERT INTO `temp_test2` VALUES ('9901', '1270816111', '4', '96', '1270816111', 'منهاجي', '1270816111', 'احمد');
INSERT INTO `temp_test2` VALUES ('9901', '1270872346', '5', '96', '1270872346', 'عادلي امين آبادي', '1270872346', 'محمد');
INSERT INTO `temp_test2` VALUES ('9901', '1270896709', '4', '96', '1270896709', 'ژيلاتبار', '1270896709', 'جليل');
INSERT INTO `temp_test2` VALUES ('9901', '1270897251', '4', '96', '1270897251', 'مزروعي سبداني', '1270897251', 'وحيد');
INSERT INTO `temp_test2` VALUES ('9901', '1271025949', '5', '96', '1271025949', 'اميني هرندي', '1271025949', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9901', '1271042975', '4', '96', '1271042975', 'رحيمي ناغاني', '1271042975', 'حسين');
INSERT INTO `temp_test2` VALUES ('9901', '1271042975', '5', '96', '1271042975', 'رحيمي ناغاني', '1271042975', 'حسين');
INSERT INTO `temp_test2` VALUES ('9916', '1271158477', '5', '96', '1271158477', 'مكاري نژاد', '1271158477', 'آرش');
INSERT INTO `temp_test2` VALUES ('9901', '1271334607', '4', '96', '1271334607', 'صالح پور', '1271334607', 'علي');
INSERT INTO `temp_test2` VALUES ('6184', '1271413930', '5', '96', '1271413930', 'كياني', '1271413930', 'احسان');
INSERT INTO `temp_test2` VALUES ('9901', '1271610442', '4', '96', '1271610442', 'باقري سيني', '1271610442', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9901', '1271610442', '5', '96', '1271610442', 'باقري سيني', '1271610442', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9901', '1271671999', '4', '96', '1271671999', 'مزروعي سبداني', '1271671999', 'رسول');
INSERT INTO `temp_test2` VALUES ('9901', '1271682011', '4', '96', '1271682011', 'زاهدي نژاد', '1271682011', 'عليرضا');
INSERT INTO `temp_test2` VALUES ('9901', '1271682011', '5', '96', '1271682011', 'زاهدي نژاد', '1271682011', 'عليرضا');
INSERT INTO `temp_test2` VALUES ('6184', '1271721139', '5', '96', '1271721139', 'رحيمي', '1271721139', 'جواد');
INSERT INTO `temp_test2` VALUES ('9901', '1271760487', '4', '96', '1271760487', 'مختاري', '1271760487', 'احمد');
INSERT INTO `temp_test2` VALUES ('9901', '1271760487', '5', '96', '1271760487', 'مختاري', '1271760487', 'احمد');
INSERT INTO `temp_test2` VALUES ('9901', '1271918064', '4', '96', '1271918064', 'سلطاني قهفرخي', '1271918064', 'عليرضا');
INSERT INTO `temp_test2` VALUES ('6184', '1271959801', '5', '96', '1271959801', 'مناجاتي', '1271959801', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9901', '1272157318', '4', '96', '1272157318', 'حسيني', '1272157318', 'سيدمحسن');
INSERT INTO `temp_test2` VALUES ('9901', '1272157318', '5', '96', '1272157318', 'حسيني', '1272157318', 'سيدمحسن');
INSERT INTO `temp_test2` VALUES ('9901', '1272291472', '4', '96', '1272291472', 'شيرزادي قلعه شاهي', '1272291472', 'هومن');
INSERT INTO `temp_test2` VALUES ('9901', '1272291472', '5', '96', '1272291472', 'شيرزادي قلعه شاهي', '1272291472', 'هومن');
INSERT INTO `temp_test2` VALUES ('9901', '1272328491', '4', '96', '1272328491', 'باباصفري', '1272328491', 'ميلاد');
INSERT INTO `temp_test2` VALUES ('9901', '1272344606', '4', '96', '1272344606', 'مانيان سوداني', '1272344606', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9901', '1272344606', '5', '96', '1272344606', 'مانيان سوداني', '1272344606', 'مهدي');
INSERT INTO `temp_test2` VALUES ('6184', '1272378756', '4', '96', '1272378756', 'پورجعفري مقدم شارمي', '1272378756', 'پيمان');
INSERT INTO `temp_test2` VALUES ('9901', '1272440990', '4', '96', '1272440990', 'قرباني گاوناني', '1272440990', 'علي');
INSERT INTO `temp_test2` VALUES ('9901', '1272440990', '5', '96', '1272440990', 'قرباني گاوناني', '1272440990', 'علي');
INSERT INTO `temp_test2` VALUES ('9901', '1272481212', '4', '96', '1272481212', 'شاه قليان', '1272481212', 'عبدالله');
INSERT INTO `temp_test2` VALUES ('9901', '1272481212', '5', '96', '1272481212', 'شاه قليان', '1272481212', 'عبدالله');
INSERT INTO `temp_test2` VALUES ('6184', '1272537358', '4', '96', '1272537358', 'غفاري طرقي', '1272537358', 'علي');
INSERT INTO `temp_test2` VALUES ('6184', '1272654958', '4', '96', '1272654958', 'رضائي كوجاني', '1272654958', 'محمدحسين');
INSERT INTO `temp_test2` VALUES ('6184', '1272672654', '4', '96', '1272672654', 'شكريان', '1272672654', 'محمدپويا');
INSERT INTO `temp_test2` VALUES ('9901', '1272702537', '5', '96', '1272702537', 'اسماعيلي والا', '1272702537', 'محمد');
INSERT INTO `temp_test2` VALUES ('9901', '1272718174', '4', '96', '1272718174', 'حسني حيدري', '1272718174', 'ابراهيم');
INSERT INTO `temp_test2` VALUES ('9901', '1272718174', '5', '96', '1272718174', 'حسني حيدري', '1272718174', 'ابراهيم');
INSERT INTO `temp_test2` VALUES ('6116', '1272796523', '5', '96', '1272796523', 'سلطاني رناني', '1272796523', 'علي');
INSERT INTO `temp_test2` VALUES ('9901', '1272846660', '4', '96', '1272846660', 'جعفري طادي', '1272846660', 'مصطفي');
INSERT INTO `temp_test2` VALUES ('9901', '1272846660', '5', '96', '1272846660', 'جعفري طادي', '1272846660', 'مصطفي');
INSERT INTO `temp_test2` VALUES ('9901', '1272871381', '5', '96', '1272871381', 'رجبي جوزداني', '1272871381', 'عليرضا');
INSERT INTO `temp_test2` VALUES ('6184', '1272902609', '4', '96', '1272902609', 'جانقربان', '1272902609', 'سعيد');
INSERT INTO `temp_test2` VALUES ('6116', '1272903273', '4', '96', '1272903273', 'زاهدي يكتا', '1272903273', 'مسعود');
INSERT INTO `temp_test2` VALUES ('6116', '1272903273', '5', '96', '1272903273', 'زاهدي يكتا', '1272903273', 'مسعود');
INSERT INTO `temp_test2` VALUES ('9901', '1272907783', '5', '96', '1272907783', 'مختاري', '1272907783', 'محمد');
INSERT INTO `temp_test2` VALUES ('9916', '1272927547', '4', '96', '1272927547', 'صلصال', '1272927547', 'عرفان');
INSERT INTO `temp_test2` VALUES ('9916', '1272931951', '4', '96', '1272931951', 'ذوالفقاري عاشق آبادي', '1272931951', 'محمدجواد');
INSERT INTO `temp_test2` VALUES ('9916', '1272931951', '5', '96', '1272931951', 'ذوالفقاري عاشق آبادي', '1272931951', 'محمدجواد');
INSERT INTO `temp_test2` VALUES ('9901', '1272934561', '4', '96', '1272934561', 'بشيري', '1272934561', 'مجتبي');
INSERT INTO `temp_test2` VALUES ('9916', '1272937232', '4', '96', '1272937232', 'كياني', '1272937232', 'محمدرضا');
INSERT INTO `temp_test2` VALUES ('9916', '1272937232', '5', '96', '1272937232', 'كياني', '1272937232', 'محمدرضا');
INSERT INTO `temp_test2` VALUES ('9901', '1272939790', '4', '96', '1272939790', 'اميني', '1272939790', 'محمدمهدي');
INSERT INTO `temp_test2` VALUES ('9916', '1272945197', '4', '96', '1272945197', 'صالحيان فرد', '1272945197', 'سينا');
INSERT INTO `temp_test2` VALUES ('6184', '1272953025', '4', '96', '1272953025', 'كارخاني', '1272953025', 'علي');
INSERT INTO `temp_test2` VALUES ('6184', '1272953025', '5', '96', '1272953025', 'كارخاني', '1272953025', 'علي');
INSERT INTO `temp_test2` VALUES ('9916', '1272956571', '5', '96', '1272956571', 'عابديان لنباني', '1272956571', 'نويد');
INSERT INTO `temp_test2` VALUES ('9916', '1272959899', '4', '96', '1272959899', 'بابااصفهاني', '1272959899', 'سينا');
INSERT INTO `temp_test2` VALUES ('9916', '1272973131', '4', '96', '1272973131', 'شيراني بيدآبادي', '1272973131', 'پويا');
INSERT INTO `temp_test2` VALUES ('9916', '1272973131', '5', '96', '1272973131', 'شيراني بيدآبادي', '1272973131', 'پويا');
INSERT INTO `temp_test2` VALUES ('6184', '1272974138', '4', '96', '1272974138', 'عيدي وندي', '1272974138', 'عرفان');
INSERT INTO `temp_test2` VALUES ('6184', '1272974138', '5', '96', '1272974138', 'عيدي وندي', '1272974138', 'عرفان');
INSERT INTO `temp_test2` VALUES ('9901', '1272979490', '4', '96', '1272979490', 'عابدي', '1272979490', 'مرتضي');
INSERT INTO `temp_test2` VALUES ('9901', '1272979490', '5', '96', '1272979490', 'عابدي', '1272979490', 'مرتضي');
INSERT INTO `temp_test2` VALUES ('9901', '1272980669', '4', '96', '1272980669', 'حسيني بهارانچي', '1272980669', 'سيدرضا');
INSERT INTO `temp_test2` VALUES ('9901', '1272980669', '5', '96', '1272980669', 'حسيني بهارانچي', '1272980669', 'سيدرضا');
INSERT INTO `temp_test2` VALUES ('9901', '1272993541', '4', '96', '1272993541', 'ذوالفقاري', '1272993541', 'جواد');
INSERT INTO `temp_test2` VALUES ('9901', '1273023374', '5', '96', '1273023374', ' آذربويه', '1273023374', 'احسان');
INSERT INTO `temp_test2` VALUES ('9901', '1273037391', '4', '96', '1273037391', 'ذوالفقاري عاشق آبادي', '1273037391', 'محمد');
INSERT INTO `temp_test2` VALUES ('9901', '1273037510', '4', '96', '1273037510', 'هنرمندعاشق آبادي', '1273037510', 'ابوالفضل');
INSERT INTO `temp_test2` VALUES ('9901', '1273099850', '5', '96', '1273099850', 'محمدخاني', '1273099850', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9901', '1273106202', '4', '96', '1273106202', 'خدائي', '1273106202', 'سيداميرحسين');
INSERT INTO `temp_test2` VALUES ('6184', '1273137371', '4', '96', '1273137371', 'حسن زاده', '1273137371', 'داريوش');
INSERT INTO `temp_test2` VALUES ('6184', '1273137371', '5', '96', '1273137371', 'حسن زاده', '1273137371', 'داريوش');
INSERT INTO `temp_test2` VALUES ('9916', '1273140710', '4', '96', '1273140710', 'شفيعي', '1273140710', 'حسين');
INSERT INTO `temp_test2` VALUES ('9916', '1273140710', '5', '96', '1273140710', 'شفيعي', '1273140710', 'حسين');
INSERT INTO `temp_test2` VALUES ('6184', '1273156188', '3', '96', '1273156188', 'رسائي', '1273156188', 'شايان');
INSERT INTO `temp_test2` VALUES ('6184', '1273156188', '5', '96', '1273156188', 'رسائي', '1273156188', 'شايان');
INSERT INTO `temp_test2` VALUES ('9901', '1273158733', '5', '96', '1273158733', 'عسگري رناني', '1273158733', 'ابراهيم');
INSERT INTO `temp_test2` VALUES ('9901', '1273162587', '5', '96', '1273162587', 'مصطفي پور', '1273162587', 'حسن');
INSERT INTO `temp_test2` VALUES ('9901', '1273177444', '4', '96', '1273177444', 'حسيني', '1273177444', 'سيدعلي اصغر');
INSERT INTO `temp_test2` VALUES ('9901', '1273177444', '5', '96', '1273177444', 'حسيني', '1273177444', 'سيدعلي اصغر');
INSERT INTO `temp_test2` VALUES ('9901', '1273184191', '4', '96', '1273184191', 'ماراني', '1273184191', 'فرشيد');
INSERT INTO `temp_test2` VALUES ('9901', '1273188322', '4', '96', '1273188322', 'مرادي', '1273188322', 'سيدنيما');
INSERT INTO `temp_test2` VALUES ('9901', '1273189760', '4', '96', '1273189760', 'رستم زاده', '1273189760', 'علي');
INSERT INTO `temp_test2` VALUES ('9901', '1273189760', '5', '96', '1273189760', 'رستم زاده', '1273189760', 'علي');
INSERT INTO `temp_test2` VALUES ('9901', '1273234804', '4', '96', '1273234804', 'كاظمي گورتي', '1273234804', 'عليرضا');
INSERT INTO `temp_test2` VALUES ('9901', '1273349581', '4', '96', '1273349581', 'نجاري اصفهاني', '1273349581', 'سهيل');
INSERT INTO `temp_test2` VALUES ('9901', '1273349581', '5', '96', '1273349581', 'نجاري اصفهاني', '1273349581', 'سهيل');
INSERT INTO `temp_test2` VALUES ('9901', '1273838599', '4', '96', '1273838599', 'نيلي', '1273838599', 'سيدحسين');
INSERT INTO `temp_test2` VALUES ('9901', '1273838599', '5', '96', '1273838599', 'نيلي', '1273838599', 'سيدحسين');
INSERT INTO `temp_test2` VALUES ('9901', '1277379211', '4', '96', '1277379211', 'جعفري مقدم', '1277379211', 'امير');
INSERT INTO `temp_test2` VALUES ('9916', '1280424451', '4', '96', '1280424451', 'صابري ميرابادي', '1280424451', 'مصطفي');
INSERT INTO `temp_test2` VALUES ('9916', '1280424451', '5', '96', '1280424451', 'صابري ميرابادي', '1280424451', 'مصطفي');
INSERT INTO `temp_test2` VALUES ('9901', '1280424990', '5', '96', '1280424990', 'عندليب القراء', '1280424990', 'هادي');
INSERT INTO `temp_test2` VALUES ('9916', '1280949090', '4', '96', '1280949090', 'توراني كراني', '1280949090', 'اسفنديار');
INSERT INTO `temp_test2` VALUES ('6184', '1281037133', '4', '96', '1281037133', 'قلمزن', '1281037133', 'احسان');
INSERT INTO `temp_test2` VALUES ('6184', '1281037133', '5', '96', '1281037133', 'قلمزن', '1281037133', 'احسان');
INSERT INTO `temp_test2` VALUES ('9916', '1281053139', '4', '96', '1281053139', 'كرباسي باب الدشتي', '1281053139', 'منصور');
INSERT INTO `temp_test2` VALUES ('9901', '1282741217', '4', '96', '1282741217', 'حبيبي', '1282741217', 'فرشيد');
INSERT INTO `temp_test2` VALUES ('9901', '1282741217', '5', '96', '1282741217', 'حبيبي', '1282741217', 'فرشيد');
INSERT INTO `temp_test2` VALUES ('9901', '1283090368', '4', '96', '1283090368', 'سليماني پوردهنوي', '1283090368', 'حسين');
INSERT INTO `temp_test2` VALUES ('9901', '1283090368', '5', '96', '1283090368', 'سليماني پوردهنوي', '1283090368', 'حسين');
INSERT INTO `temp_test2` VALUES ('9901', '1283337657', '5', '96', '1283337657', 'عشقي', '1283337657', 'اكبر');
INSERT INTO `temp_test2` VALUES ('6184', '1284794415', '5', '96', '1284794415', 'حيدري', '1284794415', 'فرزاد');
INSERT INTO `temp_test2` VALUES ('9901', '1284948595', '5', '96', '1284948595', 'جعفريان', '1284948595', 'عباس');
INSERT INTO `temp_test2` VALUES ('9901', '1284959880', '5', '96', '1284959880', 'قاسمي', '1284959880', 'جواد');
INSERT INTO `temp_test2` VALUES ('6184', '1286100852', '5', '96', '1286100852', 'ابوطالبي', '1286100852', 'مهرداد');
INSERT INTO `temp_test2` VALUES ('9916', '1288441983', '5', '96', '1288441983', 'نظارتي زاده', '1288441983', 'حسين');
INSERT INTO `temp_test2` VALUES ('9901', '1289446342', '4', '96', '1289446342', 'افخمي عقدا', '1289446342', 'بهزاد');
INSERT INTO `temp_test2` VALUES ('9901', '1289446342', '5', '96', '1289446342', 'افخمي عقدا', '1289446342', 'بهزاد');
INSERT INTO `temp_test2` VALUES ('9901', '1289630860', '4', '96', '1289630860', 'جلالي كروئي', '1289630860', 'امير');
INSERT INTO `temp_test2` VALUES ('9901', '1290297071', '5', '96', '1290297071', 'حيدري جوني', '1290297071', 'علي');
INSERT INTO `temp_test2` VALUES ('9916', '1290414548', '4', '96', '1290414548', 'بختياري آب نيلي', '1290414548', 'اصغر');
INSERT INTO `temp_test2` VALUES ('9901', '1290590680', '4', '96', '1290590680', 'ماراني', '1290590680', 'رسول');
INSERT INTO `temp_test2` VALUES ('9901', '1290590680', '5', '96', '1290590680', 'ماراني', '1290590680', 'رسول');
INSERT INTO `temp_test2` VALUES ('9916', '1290754969', '5', '96', '1290754969', 'جان نثاري لاداني', '1290754969', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9901', '1290803481', '5', '96', '1290803481', 'كريم پور', '1290803481', 'مرتضي');
INSERT INTO `temp_test2` VALUES ('9901', '1290916012', '4', '96', '1290916012', 'بخشي', '1290916012', 'مجيد');
INSERT INTO `temp_test2` VALUES ('9901', '1290922608', '4', '96', '1290922608', 'مهاجري', '1290922608', 'مصطفي');
INSERT INTO `temp_test2` VALUES ('9901', '1290922608', '5', '96', '1290922608', 'مهاجري', '1290922608', 'مصطفي');
INSERT INTO `temp_test2` VALUES ('9901', '1290926174', '4', '96', '1290926174', 'سلطاني آفاراني', '1290926174', 'مجتبي');
INSERT INTO `temp_test2` VALUES ('9901', '1290953287', '5', '96', '1290953287', 'فخري فخرابادي', '1290953287', 'رضا');
INSERT INTO `temp_test2` VALUES ('9916', '1291050671', '5', '96', '1291050671', 'مهرابي', '1291050671', 'سعيد');
INSERT INTO `temp_test2` VALUES ('9901', '1291467203', '4', '96', '1291467203', 'زارعي جوزداني', '1291467203', 'محمدرضا');
INSERT INTO `temp_test2` VALUES ('9901', '1291467203', '5', '96', '1291467203', 'زارعي جوزداني', '1291467203', 'محمدرضا');
INSERT INTO `temp_test2` VALUES ('9901', '1292171707', '4', '96', '1292171707', 'ژيان مهر', '1292171707', 'ميثم');
INSERT INTO `temp_test2` VALUES ('9901', '1292264020', '5', '96', '1292264020', 'لندي اصفهاني', '1292264020', 'احمد');
INSERT INTO `temp_test2` VALUES ('6184', '1292307714', '4', '96', '1292307714', 'ماراني', '1292307714', 'اميرحسين');
INSERT INTO `temp_test2` VALUES ('9901', '1292438061', '4', '96', '1292438061', 'شعباني پوده', '1292438061', 'امين');
INSERT INTO `temp_test2` VALUES ('9901', '1292605340', '5', '96', '1292605340', 'زرگران', '1292605340', 'ميلاد');
INSERT INTO `temp_test2` VALUES ('9901', '1292827866', '4', '96', '1292827866', 'سليماني دهنوي', '1292827866', 'جواد');
INSERT INTO `temp_test2` VALUES ('9901', '1292827866', '5', '96', '1292827866', 'سليماني دهنوي', '1292827866', 'جواد');
INSERT INTO `temp_test2` VALUES ('9901', '1293045128', '4', '96', '1293045128', 'حيدري طبائي زواره', '1293045128', 'سيدمهدي');
INSERT INTO `temp_test2` VALUES ('9901', '1293045128', '5', '96', '1293045128', 'حيدري طبائي زواره', '1293045128', 'سيدمهدي');
INSERT INTO `temp_test2` VALUES ('9916', '1293104485', '5', '96', '1293104485', 'مصطفي پور', '1293104485', 'رضا');
INSERT INTO `temp_test2` VALUES ('9901', '1293109010', '4', '96', '1293109010', 'رضائي برزاني', '1293109010', 'مرتضي');
INSERT INTO `temp_test2` VALUES ('9901', '1293109010', '5', '96', '1293109010', 'رضائي برزاني', '1293109010', 'مرتضي');
INSERT INTO `temp_test2` VALUES ('9916', '1293125067', '4', '96', '1293125067', 'نريماني', '1293125067', 'علي');
INSERT INTO `temp_test2` VALUES ('9901', '1293130737', '5', '96', '1293130737', 'رمضاني', '1293130737', 'جواد');
INSERT INTO `temp_test2` VALUES ('9916', '1293191582', '5', '96', '1293191582', 'حسيني', '1293191582', 'سيدهادي');
INSERT INTO `temp_test2` VALUES ('9901', '1293251313', '4', '96', '1293251313', 'نعيمي افوسي', '1293251313', 'امين');
INSERT INTO `temp_test2` VALUES ('9901', '1293275522', '5', '96', '1293275522', 'برندگي', '1293275522', 'نويد');
INSERT INTO `temp_test2` VALUES ('6184', '1293399175', '5', '96', '1293399175', 'نظري', '1293399175', 'ابوالفضل');
INSERT INTO `temp_test2` VALUES ('6184', '1754472710', '4', '96', '1754472710', 'كشت كار', '1754472710', 'مرتضي');
INSERT INTO `temp_test2` VALUES ('9916', '1815621362', '4', '96', '1815621362', 'عابدي', '1815621362', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9901', '1920392912', '5', '96', '1920392912', 'داودوند', '1920392912', 'جواد');
INSERT INTO `temp_test2` VALUES ('9916', '1960089625', '4', '96', '1960089625', 'خداوردي', '1960089625', 'فرزين');
INSERT INTO `temp_test2` VALUES ('9916', '1960089625', '5', '96', '1960089625', 'خداوردي', '1960089625', 'فرزين');
INSERT INTO `temp_test2` VALUES ('6184', '1960597108', '4', '96', '1960597108', 'نظري بابرصاد', '1960597108', 'مهرگان');
INSERT INTO `temp_test2` VALUES ('6184', '1960597108', '5', '96', '1960597108', 'نظري بابرصاد', '1960597108', 'مهرگان');
INSERT INTO `temp_test2` VALUES ('6184', '22534105', '4', '96', '0022534105', 'برزگر', '22534105', 'علي');
INSERT INTO `temp_test2` VALUES ('9901', '22534105', '5', '96', '0022534105', 'برزگر', '22534105', 'علي');
INSERT INTO `temp_test2` VALUES ('6184', '2300223600', '4', '96', '2300223600', 'نيك اقبال', '2300223600', 'مصطفي');
INSERT INTO `temp_test2` VALUES ('9901', '2400019975', '4', '96', '2400019975', 'باقريان', '2400019975', 'داريوش');
INSERT INTO `temp_test2` VALUES ('9916', '2649391022', '5', '96', '2649391022', 'فكري كهن', '2649391022', 'محمدرضا');
INSERT INTO `temp_test2` VALUES ('9916', '3309807381', '5', '96', '3309807381', 'كريم آبادي', '3309807381', 'صادق');
INSERT INTO `temp_test2` VALUES ('9901', '4031930682', '5', '96', '4031930682', 'جعفري', '4031930682', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9901', '4070273761', '4', '96', '4070273761', 'كرمي', '4070273761', 'فرزاد');
INSERT INTO `temp_test2` VALUES ('9901', '4070273761', '5', '96', '4070273761', 'كرمي', '4070273761', 'فرزاد');
INSERT INTO `temp_test2` VALUES ('6184', '4160554148', '4', '96', '4160554148', 'اكبري', '4160554148', 'علي');
INSERT INTO `temp_test2` VALUES ('9901', '452404312', '5', '96', '0452404312', 'رمضانيان خارواني', '452404312', 'امير');
INSERT INTO `temp_test2` VALUES ('9916', '4610007770', '4', '96', '4610007770', 'احمدي بني', '4610007770', 'مجيد');
INSERT INTO `temp_test2` VALUES ('9916', '4610007770', '5', '96', '4610007770', 'احمدي بني', '4610007770', 'مجيد');
INSERT INTO `temp_test2` VALUES ('9901', '4610454777', '4', '96', '4610454777', 'رضائي', '4610454777', 'حامد');
INSERT INTO `temp_test2` VALUES ('6116', '4610600897', '5', '96', '4610600897', 'ملكمي بني', '4610600897', 'هادي');
INSERT INTO `temp_test2` VALUES ('9901', '4610685736', '4', '96', '4610685736', 'قائدي سودجاني', '4610685736', 'محمد');
INSERT INTO `temp_test2` VALUES ('9916', '4610747405', '5', '96', '4610747405', 'چوپاني چالشتري', '4610747405', 'حسين');
INSERT INTO `temp_test2` VALUES ('9901', '4621784031', '4', '96', '4621784031', 'عباسي تشنيزي', '4621784031', 'عبدالله');
INSERT INTO `temp_test2` VALUES ('9901', '4621784031', '5', '96', '4621784031', 'عباسي تشنيزي', '4621784031', 'عبدالله');
INSERT INTO `temp_test2` VALUES ('6184', '4640001282', '4', '96', '4640001282', 'دادوندبلداجي', '4640001282', 'ميثم');
INSERT INTO `temp_test2` VALUES ('9916', '4640010397', '4', '96', '4640010397', 'مرادي اورگاني', '4640010397', 'محمد');
INSERT INTO `temp_test2` VALUES ('9901', '4689124930', '4', '96', '4689124930', 'شيخي دشتكي', '4689124930', 'رضا');
INSERT INTO `temp_test2` VALUES ('9901', '4689124930', '5', '96', '4689124930', 'شيخي دشتكي', '4689124930', 'رضا');
INSERT INTO `temp_test2` VALUES ('9916', '5100032014', '4', '96', '5100032014', 'زارچون خرزوقي', '5100032014', 'ولي اله');
INSERT INTO `temp_test2` VALUES ('9916', '5100032014', '5', '96', '5100032014', 'زارچون خرزوقي', '5100032014', 'ولي اله');
INSERT INTO `temp_test2` VALUES ('9901', '5100220643', '4', '96', '5100220643', 'قشقائي راد', '5100220643', 'تاراز');
INSERT INTO `temp_test2` VALUES ('9901', '5100220643', '5', '96', '5100220643', 'قشقائي راد', '5100220643', 'تاراز');
INSERT INTO `temp_test2` VALUES ('9916', '5110640904', '5', '96', '5110640904', 'جعفري امين آبادي', '5110640904', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9916', '5110673527', '4', '96', '5110673527', 'موسوي زاهد', '5110673527', 'سيدعليرضا');
INSERT INTO `temp_test2` VALUES ('9901', '5410101464', '5', '96', '5410101464', 'كريمي', '5410101464', 'سعيد');
INSERT INTO `temp_test2` VALUES ('9901', '5410115325', '4', '96', '5410115325', 'افراسيابي', '5410115325', 'فرزاد');
INSERT INTO `temp_test2` VALUES ('9901', '5410184671', '5', '96', '5410184671', 'يزداني', '5410184671', 'ابوذر');
INSERT INTO `temp_test2` VALUES ('9901', '5410188799', '5', '96', '5410188799', 'مهدوي لنجي', '5410188799', 'اميرحسين');
INSERT INTO `temp_test2` VALUES ('9901', '5419158256', '4', '96', '5419158256', 'عظيمي عليائيان', '5419158256', 'امين');
INSERT INTO `temp_test2` VALUES ('9901', '5419158256', '5', '96', '5419158256', 'عظيمي عليائيان', '5419158256', 'امين');
INSERT INTO `temp_test2` VALUES ('9901', '5419750848', '5', '96', '5419750848', 'عليرضائي ديزيچه', '5419750848', 'عليرضا');
INSERT INTO `temp_test2` VALUES ('9901', '5419894890', '4', '96', '5419894890', 'اسماعيلي', '5419894890', 'مرتضي');
INSERT INTO `temp_test2` VALUES ('9901', '5419958929', '4', '96', '5419958929', 'ضيائي', '5419958929', 'محمدرضا');
INSERT INTO `temp_test2` VALUES ('9901', '5419958929', '5', '96', '5419958929', 'ضيائي', '5419958929', 'محمدرضا');
INSERT INTO `temp_test2` VALUES ('6184', '5490074590', '4', '96', '5490074590', 'فلاحتي تهراني', '5490074590', 'پيمان');
INSERT INTO `temp_test2` VALUES ('6116', '5490084162', '5', '96', '5490084162', 'دادخواه', '5490084162', 'محمدجواد');
INSERT INTO `temp_test2` VALUES ('9901', '5490111828', '4', '96', '5490111828', 'يزداني', '5490111828', 'مجتبي');
INSERT INTO `temp_test2` VALUES ('9901', '5499703035', '4', '96', '5499703035', 'رضواني قهريزجاني', '5499703035', 'حسينعلي');
INSERT INTO `temp_test2` VALUES ('9916', '5499780137', '4', '96', '5499780137', 'جمالي', '5499780137', 'اكبر');
INSERT INTO `temp_test2` VALUES ('9901', '5499880166', '5', '96', '5499880166', 'ميرزائي', '5499880166', 'علي');
INSERT INTO `temp_test2` VALUES ('6184', '5499953661', '5', '96', '5499953661', 'تيموري عسگراني', '5499953661', 'مهدي');
INSERT INTO `temp_test2` VALUES ('9901', '5499953996', '5', '96', '5499953996', 'ميرزائي عسگراني', '5499953996', 'حجت اله');
INSERT INTO `temp_test2` VALUES ('9901', '5499960712', '4', '96', '5499960712', 'خدائي', '5499960712', 'عليرضا');
INSERT INTO `temp_test2` VALUES ('9901', '5499960712', '5', '96', '5499960712', 'خدائي', '5499960712', 'عليرضا');
INSERT INTO `temp_test2` VALUES ('9901', '6290029614', '4', '96', '6290029614', 'صادقي گندماني', '6290029614', 'ميثم');
INSERT INTO `temp_test2` VALUES ('9901', '6600082781', '4', '96', '6600082781', 'معتمدي آدرمنابادي', '6600082781', 'محمدجواد');
INSERT INTO `temp_test2` VALUES ('9901', '6600082781', '5', '96', '6600082781', 'معتمدي آدرمنابادي', '6600082781', 'محمدجواد');
INSERT INTO `temp_test2` VALUES ('9901', '6609963363', '4', '96', '6609963363', 'نوربخش حبيب آبادي', '6609963363', 'عليرضا');
INSERT INTO `temp_test2` VALUES ('9901', '6609963363', '5', '96', '6609963363', 'نوربخش حبيب آبادي', '6609963363', 'عليرضا');
INSERT INTO `temp_test2` VALUES ('6184', '91027798059', '4', '96', '91027798059', 'محمدي', '91027798059', 'مجيد');

-- ----------------------------
-- Table structure for test_table
-- ----------------------------
DROP TABLE IF EXISTS `test_table`;
CREATE TABLE `test_table`  (
  `id` bigint NOT NULL DEFAULT 0,
  `amount` int NULL DEFAULT NULL,
  `d` double(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_table
-- ----------------------------
INSERT INTO `test_table` VALUES (1, 100, NULL);
INSERT INTO `test_table` VALUES (2, 200, NULL);

-- ----------------------------
-- Table structure for tmp_st
-- ----------------------------
DROP TABLE IF EXISTS `tmp_st`;
CREATE TABLE `tmp_st`  (
  `st_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `st_family` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `st_national_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `st_code` bigint NOT NULL,
  PRIMARY KEY (`st_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tmp_st
-- ----------------------------

-- ----------------------------
-- View structure for account_student_view
-- ----------------------------
DROP VIEW IF EXISTS `account_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `account_student_view` AS select `reg_student_account`.`st_id` AS `st_id`,`reg_student_account`.`acc_id` AS `acc_id`,`reg_student_account`.`create_date` AS `create_date`,`finance_account`.`name` AS `name`,`finance_account`.`person_name` AS `person_name`,`finance_account`.`person_mobile` AS `person_mobile`,`finance_account`.`fax` AS `fax`,`finance_account`.`address` AS `address`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`finance_account`.`phone` AS `phone`,`finance_account`.`create_date` AS `acc_create_date`,`reg_student`.`name` AS `st_name`,`reg_student`.`famili` AS `st_famili`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`identifier_serial` AS `identifier_serial`,`reg_student`.`identifier_char` AS `identifier_char`,`reg_student`.`student_code` AS `student_code`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `description`,`reg_student`.`status_id` AS `status_id`,`reg_student`.`org_unit_id` AS `org_unit_id`,`reg_student`.`created_date` AS `created_date`,`reg_student`.`last_modified` AS `last_modified`,`reg_student`.`level_id_last` AS `level_id_last`,`reg_student`.`field_id_last` AS `field_id_last`,`reg_student`.`address` AS `st_address`,`reg_student`.`mobile` AS `st_mobile`,`reg_student`.`phone` AS `st_phone`,`reg_student`.`archive_code` AS `archive_code` from ((`reg_student_account` join `finance_account` on((`reg_student_account`.`acc_id` = `finance_account`.`id`))) join `reg_student` on((`reg_student_account`.`st_id` = `reg_student`.`student_code`)));

-- ----------------------------
-- View structure for accounts_accounting_v
-- ----------------------------
DROP VIEW IF EXISTS `accounts_accounting_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `accounts_accounting_v` AS select `accounts`.`id` AS `id`,`accounts`.`name` AS `name`,(select sum(`finance_receive_payment`.`amount`) AS `all_payments` from `finance_receive_payment` where (`finance_receive_payment`.`account_person_id` = `accounts`.`id`)) AS `all_amounts`,(select sum(`finance_factor`.`amount`) AS `all_factors` from `finance_factor` where (`finance_factor`.`account_person_id` = `accounts`.`id`)) AS `all_factors`,(select sum(`finance_check`.`amount`) AS `all_amount` from `finance_check` where ((`finance_check`.`status_id` <> '1') and (`finance_check`.`account_id` = `accounts`.`id`))) AS `waiting_checks` from `finance_account` `accounts`;

-- ----------------------------
-- View structure for all_term_details
-- ----------------------------
DROP VIEW IF EXISTS `all_term_details`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_term_details` AS select `registration_view`.`term_name` AS `term_name`,sum(`registration_view`.`off_amount`) AS `sum_off`,sum(`registration_view`.`total_salary`) AS `sum_total`,sum(`registration_view`.`theory_units`) AS `sum_theory_uints`,sum(`registration_view`.`actional_units`) AS `sum_actional_units`,count(`registration_view`.`id`) AS `sum_registrations`,count(`registration_view`.`student_code`) AS `sum_students`,`registration_view`.`reg_term_id` AS `reg_term_id` from `registration_view` group by `registration_view`.`term_name`,`registration_view`.`reg_term_id` order by `registration_view`.`reg_term_id` desc;

-- ----------------------------
-- View structure for all_terms_checks_payments
-- ----------------------------
DROP VIEW IF EXISTS `all_terms_checks_payments`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_terms_checks_payments` AS select `reg_term`.`id` AS `id`,`reg_term`.`name` AS `name`,sum(`reg_check_v`.`amount`) AS `total_check_amout` from ((`reg_term` join `reg_check_v`) join `reg_registration`) where ((`reg_registration`.`id` = `reg_check_v`.`reg_id`) and (`reg_registration`.`term_id` = `reg_term`.`id`) and (`reg_check_v`.`status_id` <> '1')) group by `reg_term`.`id`;

-- ----------------------------
-- View structure for all_terms_naghd_payments
-- ----------------------------
DROP VIEW IF EXISTS `all_terms_naghd_payments`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_terms_naghd_payments` AS select sum(`reg_payments_v`.`amount`) AS `totalTermPayments`,`reg_term`.`id` AS `term_id`,`reg_term`.`name` AS `name` from (`reg_term` join `reg_payments_v`) where (`reg_term`.`id` = `reg_payments_v`.`reg_term_id`) group by `reg_term`.`id`;

-- ----------------------------
-- View structure for all_terms_salary
-- ----------------------------
DROP VIEW IF EXISTS `all_terms_salary`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_terms_salary` AS select sum(`reg_registration`.`total_salary`) AS `totalSalary`,sum(`reg_registration`.`off_amount`) AS `totalOf`,`reg_term`.`name` AS `term_name`,count(`reg_registration`.`id`) AS `countOfRegistrations`,`reg_term`.`id` AS `term_id` from (`reg_term` join `reg_registration`) where (`reg_term`.`id` = `reg_registration`.`term_id`) group by `reg_registration`.`term_id`;

-- ----------------------------
-- View structure for bank_account_v
-- ----------------------------
DROP VIEW IF EXISTS `bank_account_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bank_account_v` AS select `finance_account_bank`.`id` AS `id`,`finance_account_bank`.`name` AS `name`,`finance_account_bank`.`bank_id` AS `bank_id`,`finance_account_bank`.`first_amount` AS `first_amount`,`finance_account_bank`.`is_cash` AS `is_cash`,`finance_bank`.`name` AS `bank_name` from (`finance_account_bank` left join `finance_bank` on((`finance_account_bank`.`bank_id` = `finance_bank`.`id`)));

-- ----------------------------
-- View structure for check_v
-- ----------------------------
DROP VIEW IF EXISTS `check_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `check_v` AS select `finance_check`.`id` AS `id`,`finance_check`.`created_date` AS `created_date`,`finance_check`.`number` AS `number`,`finance_check`.`amount` AS `amount`,`finance_check`.`for_how` AS `for_how`,`finance_check`.`check_date` AS `check_date`,`finance_check`.`bank_id` AS `bank_id`,`finance_check`.`bank_branch` AS `bank_branch`,`finance_check`.`description` AS `description`,`finance_check`.`status_id` AS `status_id`,`finance_check`.`account_id` AS `account_id`,`finance_check`.`bank_account_id` AS `bank_account_id`,`finance_bank`.`name` AS `bank_name`,`finance_check_status`.`name` AS `status_name`,`finance_account`.`name` AS `account_name`,`finance_account`.`phone` AS `phone`,`finance_account`.`person_name` AS `person_name`,`finance_account`.`person_mobile` AS `person_mobile`,`finance_account`.`fax` AS `fax`,`finance_account`.`create_date` AS `create_date`,`finance_account`.`address` AS `address`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`bank_account_v`.`name` AS `bank_account_name`,`bank_account_v`.`bank_id` AS `bank_account_b_id`,`bank_account_v`.`first_amount` AS `first_amount`,`bank_account_v`.`is_cash` AS `is_cash`,`bank_account_v`.`bank_name` AS `bank_account_b_name` from ((((`finance_check` left join `finance_bank` on((`finance_check`.`bank_id` = `finance_bank`.`id`))) left join `finance_check_status` on((`finance_check`.`status_id` = `finance_check_status`.`id`))) left join `finance_account` on((`finance_check`.`account_id` = `finance_account`.`id`))) left join `bank_account_v` on((`finance_check`.`bank_account_id` = `bank_account_v`.`id`)));

-- ----------------------------
-- View structure for course_field_view
-- ----------------------------
DROP VIEW IF EXISTS `course_field_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `course_field_view` AS select `reg_course_field`.`id` AS `id`,`reg_course_field`.`field_id` AS `field_id`,`reg_course_field`.`course_id` AS `course_id`,`reg_course_field`.`is_final` AS `is_final`,`reg_course_field`.`unitCount` AS `unit_Count`,`reg_field`.`name` AS `field_name`,`reg_course`.`code` AS `course_code`,`reg_course`.`name` AS `course_name`,`reg_course`.`display_name` AS `course_display_name`,`reg_course`.`description` AS `course_description` from ((`reg_course_field` join `reg_course` on((`reg_course_field`.`course_id` = `reg_course`.`ID`))) join `reg_field` on((`reg_course_field`.`field_id` = `reg_field`.`id`)));

-- ----------------------------
-- View structure for course_view
-- ----------------------------
DROP VIEW IF EXISTS `course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `course_view` AS select `reg_course`.`code` AS `course_code`,`reg_course`.`name` AS `course_name`,`reg_course`.`display_name` AS `course_display_name`,`reg_course`.`description` AS `course_description`,`reg_exam_course`.`Id` AS `exam_course_id`,`reg_exam_course`.`exam_time_id` AS `exam_time_id`,`reg_exam_course`.`course_id` AS `course_id`,`reg_exam_time`.`term_id` AS `term_id`,`reg_exam_time`.`exam_date` AS `exam_date`,`reg_exam_time`.`hour` AS `exam_hour`,`reg_term`.`name` AS `term_name`,`reg_term`.`is_current` AS `term_is_current` from (((`reg_exam_course` join `reg_course` on((`reg_exam_course`.`course_id` = `reg_course`.`ID`))) join `reg_exam_time` on((`reg_exam_course`.`exam_time_id` = `reg_exam_time`.`ID`))) join `reg_term` on((`reg_exam_time`.`term_id` = `reg_term`.`id`)));

-- ----------------------------
-- View structure for current_accunting_view
-- ----------------------------
DROP VIEW IF EXISTS `current_accunting_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `current_accunting_view` AS select sum(`finance_receive_payment`.`amount`) AS `naghd`,`finance_account`.`id` AS `id`,sum(`factor`.`amount`) AS `factor`,sum(`ckecks`.`amount`) AS `check`,(((sum(`factor`.`amount`) + sum(`finance_receive_payment`.`amount`)) + sum(`ckecks`.`amount`)) + `finance_account`.`fisrt_payable`) AS `test`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`account_student_view`.`st_name` AS `st_name`,`account_student_view`.`st_famili` AS `st_famili`,`account_student_view`.`national_code` AS `national_code`,`account_student_view`.`st_mobile` AS `st_mobile`,`account_student_view`.`status_id` AS `status_id`,`account_student_view`.`org_unit_id` AS `org_unit_id`,`reg_organization`.`name` AS `org_name`,`reg_student_status`.`name` AS `status_name` from ((((((`finance_check` `ckecks` join `finance_account`) join `finance_receive_payment` on((`finance_account`.`id` = `finance_receive_payment`.`account_person_id`))) join `finance_factor` `factor` on((('' = '') and (`ckecks`.`status_id` <> 1)))) join `account_student_view` on((`finance_account`.`id` = `account_student_view`.`acc_id`))) join `reg_student_status` on((`account_student_view`.`status_id` = `reg_student_status`.`id`))) join `reg_organization` on((`reg_organization`.`id` = `account_student_view`.`org_unit_id`))) group by `finance_account`.`id` order by `account_student_view`.`st_famili`;

-- ----------------------------
-- View structure for exam_course_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `exam_course_view` AS select `reg_course`.`code` AS `course_code`,`reg_course`.`name` AS `course_name`,`reg_course`.`display_name` AS `course_display_name`,`reg_course`.`description` AS `course_description`,`reg_exam_course`.`Id` AS `exam_course_id`,`reg_exam_course`.`exam_time_id` AS `exam_time_id`,`reg_exam_course`.`course_id` AS `course_id`,`reg_exam_time`.`term_id` AS `term_id`,`reg_exam_time`.`exam_date` AS `exam_date`,`reg_exam_time`.`hour` AS `exam_hour`,`reg_term`.`name` AS `term_name`,`reg_term`.`is_current` AS `term_is_current` from (((`reg_exam_course` join `reg_course` on((`reg_exam_course`.`course_id` = `reg_course`.`ID`))) join `reg_exam_time` on((`reg_exam_course`.`exam_time_id` = `reg_exam_time`.`ID`))) join `reg_term` on((`reg_exam_time`.`term_id` = `reg_term`.`id`)));

-- ----------------------------
-- View structure for last_registration_students
-- ----------------------------
DROP VIEW IF EXISTS `last_registration_students`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `last_registration_students` AS select max(`registration_view2`.`reg_term_id`) AS `last_term`,`registration_view2`.`student_code` AS `student_code`,`registration_view2`.`famili` AS `famili`,`registration_view2`.`status_name` AS `status_name`,`registration_view2`.`level_id` AS `level_id`,`registration_view2`.`level_name` AS `level_name`,`registration_view2`.`mobile` AS `mobile`,`registration_view2`.`org_unit_id` AS `org_unit_id`,`registration_view2`.`reg_term_is_current` AS `reg_term_is_current`,`registration_view2`.`status_id` AS `status_id`,`registration_view2`.`archive_code` AS `archive_code`,`registration_view2`.`national_code` AS `national_code`,`registration_view2`.`father_name` AS `father_name`,`registration_view2`.`description` AS `description`,`registration_view2`.`org_name` AS `org_name`,`registration_view2`.`pish_madrak` AS `pish_madrak`,`registration_view2`.`diplom_madrak` AS `diplom_madrak`,`registration_view2`.`term_name` AS `term_name`,`registration_view2`.`field_name` AS `field_name`,`registration_view2`.`name` AS `name`,`registration_view2`.`date_of_birth` AS `date_of_birth`,`registration_view2`.`phone` AS `phone`,`registration_view2`.`st_org_id` AS `st_org_id`,`registration_view2`.`field_id` AS `field_id` from `registration_view2` group by `registration_view2`.`student_code` order by `registration_view2`.`reg_term_id` desc;

-- ----------------------------
-- View structure for receive_pay_factor
-- ----------------------------
DROP VIEW IF EXISTS `receive_pay_factor`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `receive_pay_factor` AS select `finance_factor`.`type_id` AS `type_id`,`finance_factor`.`id` AS `id`,`finance_factor`.`account_person_id` AS `account_person_id`,`finance_factor`.`create_date` AS `create_date` from (`finance_factor` join `finance_factor_type`);

-- ----------------------------
-- View structure for receive_pay_v
-- ----------------------------
DROP VIEW IF EXISTS `receive_pay_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `receive_pay_v` AS select `finance_receive_payment`.`id` AS `id`,`finance_receive_payment`.`event_date` AS `event_date`,`finance_receive_payment`.`amount` AS `amount`,`finance_receive_payment`.`account_bank_id` AS `account_bank_id`,`finance_receive_payment`.`account_person_id` AS `account_person_id`,`finance_receive_payment`.`receive_pay_type_id` AS `receive_pay_type_id`,`finance_receive_payment`.`description` AS `description`,`finance_receive_payment`.`code` AS `code`,`bank_account_v`.`name` AS `b_a_name`,`bank_account_v`.`bank_id` AS `bank_id`,`bank_account_v`.`first_amount` AS `first_amount`,`bank_account_v`.`is_cash` AS `is_cash`,`bank_account_v`.`bank_name` AS `bank_name`,`finance_account`.`name` AS `account_name`,`finance_account`.`phone` AS `phone`,`finance_account`.`person_name` AS `person_name`,`finance_account`.`person_mobile` AS `person_mobile`,`finance_account`.`fax` AS `fax`,`finance_account`.`create_date` AS `create_date`,`finance_account`.`address` AS `address`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`finance_receive_pay_type`.`name` AS `rec_pay_type_name` from (((`finance_receive_payment` join `bank_account_v` on((`finance_receive_payment`.`account_bank_id` = `bank_account_v`.`id`))) left join `finance_account` on((`finance_receive_payment`.`account_person_id` = `finance_account`.`id`))) join `finance_receive_pay_type` on((`finance_receive_payment`.`receive_pay_type_id` = `finance_receive_pay_type`.`id`)));

-- ----------------------------
-- View structure for reg_all_pays
-- ----------------------------
DROP VIEW IF EXISTS `reg_all_pays`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_all_pays` AS select `reg_pay_rec_v`.`amount` AS `amount_v`,`reg_pay_rec_v`.`create_date` AS `date_v`,`reg_pay_rec_v`.`reg_id` AS `reg_id_v`,'صندوق' AS `bank_v`,NULL AS `check_status_name`,`reg_pay_rec_v`.`code` AS `fish_number`,NULL AS `check_date`,`reg_pay_rec_v`.`rec_pay_type_name` AS `pay_type_name` from `reg_pay_rec_v` union select `reg_check_v`.`amount` AS `amount_v`,`reg_check_v`.`create_date` AS `date_v`,`reg_check_v`.`reg_id` AS `reg_id_v`,`reg_check_v`.`bank_name` AS `bank_v`,`reg_check_v`.`status_name` AS `check_status_name`,`reg_check_v`.`number` AS `fish_number`,`reg_check_v`.`check_date` AS `check_date`,'چک' AS `pay_type_name` from `reg_check_v`;

-- ----------------------------
-- View structure for reg_check_v
-- ----------------------------
DROP VIEW IF EXISTS `reg_check_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_check_v` AS select `reg_reg_check`.`id` AS `id`,`reg_reg_check`.`create_date` AS `create_date`,`reg_reg_check`.`reg_id` AS `reg_id`,`reg_reg_check`.`finance_check_id` AS `finance_check_id`,`check_v`.`created_date` AS `created_date`,`check_v`.`number` AS `number`,`check_v`.`amount` AS `amount`,`check_v`.`for_how` AS `for_how`,`check_v`.`check_date` AS `check_date`,`check_v`.`bank_id` AS `bank_id`,`check_v`.`bank_branch` AS `bank_branch`,`check_v`.`description` AS `description`,`check_v`.`status_id` AS `status_id`,`check_v`.`account_id` AS `account_id`,`check_v`.`bank_account_id` AS `bank_account_id`,`check_v`.`bank_name` AS `bank_name`,`check_v`.`status_name` AS `status_name`,`check_v`.`account_name` AS `account_name`,`check_v`.`phone` AS `phone`,`check_v`.`person_name` AS `person_name`,`check_v`.`person_mobile` AS `person_mobile`,`check_v`.`fax` AS `fax`,`check_v`.`create_date` AS `b_acc_create_date`,`check_v`.`address` AS `address`,`check_v`.`fisrt_payable` AS `fisrt_payable`,`check_v`.`bank_account_name` AS `bank_account_name`,`check_v`.`bank_account_b_id` AS `bank_account_b_id`,`check_v`.`first_amount` AS `first_amount`,`check_v`.`is_cash` AS `is_cash`,`check_v`.`bank_account_b_name` AS `bank_account_b_name` from (`reg_reg_check` join `check_v` on((`reg_reg_check`.`finance_check_id` = `check_v`.`id`)));

-- ----------------------------
-- View structure for reg_online_courses_sum_view
-- ----------------------------
DROP VIEW IF EXISTS `reg_online_courses_sum_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_online_courses_sum_view` AS select `reg_registration`.`st_id` AS `st_id`,`reg_student`.`name` AS `name`,`reg_student`.`famili` AS `famili`,group_concat(`reg_course`.`display_name` separator ',') AS `GROUP_CONCAT(reg_course.display_name)`,sum(`reg_course_field`.`unitCount`) AS `online_sum`,`reg_registration`.`id` AS `reg_id` from (((((`reg_reg_course` join `reg_course` on((`reg_reg_course`.`course_id` = `reg_course`.`ID`))) join `reg_registration` on((`reg_reg_course`.`reg_id` = `reg_registration`.`id`))) join `reg_course_field` on((`reg_course`.`ID` = `reg_course_field`.`course_id`))) join `reg_term` on((`reg_registration`.`term_id` = `reg_term`.`id`))) join `reg_student` on((`reg_registration`.`st_id` = `reg_student`.`student_code`))) where ((`reg_registration`.`field_id` = `reg_course_field`.`field_id`) and (`reg_term`.`is_current` = 1) and (`reg_reg_course`.`course_id` = `reg_course`.`ID`) and (`reg_course`.`has_online` = 1)) group by `reg_registration`.`st_id`;

-- ----------------------------
-- View structure for reg_pay_rec_v
-- ----------------------------
DROP VIEW IF EXISTS `reg_pay_rec_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_pay_rec_v` AS select `reg_reg_payment`.`id` AS `id`,`reg_reg_payment`.`create_date` AS `reg_pay_date`,`reg_reg_payment`.`reg_id` AS `reg_id`,`reg_reg_payment`.`finance_id` AS `finance_id`,`reg_reg_payment`.`next_payment` AS `next_payment`,`receive_pay_v`.`event_date` AS `event_date`,`receive_pay_v`.`amount` AS `amount`,`receive_pay_v`.`account_bank_id` AS `account_bank_id`,`receive_pay_v`.`account_person_id` AS `account_person_id`,`receive_pay_v`.`receive_pay_type_id` AS `receive_pay_type_id`,`receive_pay_v`.`description` AS `description`,`receive_pay_v`.`code` AS `code`,`receive_pay_v`.`b_a_name` AS `b_a_name`,`receive_pay_v`.`bank_id` AS `bank_id`,`receive_pay_v`.`first_amount` AS `first_amount`,`receive_pay_v`.`is_cash` AS `is_cash`,`receive_pay_v`.`bank_name` AS `bank_name`,`receive_pay_v`.`account_name` AS `account_name`,`receive_pay_v`.`phone` AS `phone`,`receive_pay_v`.`person_name` AS `person_name`,`receive_pay_v`.`person_mobile` AS `person_mobile`,`receive_pay_v`.`fax` AS `fax`,`receive_pay_v`.`create_date` AS `create_date`,`receive_pay_v`.`address` AS `address`,`receive_pay_v`.`fisrt_payable` AS `fisrt_payable`,`receive_pay_v`.`rec_pay_type_name` AS `rec_pay_type_name` from (`reg_reg_payment` join `receive_pay_v` on((`reg_reg_payment`.`finance_id` = `receive_pay_v`.`id`)));

-- ----------------------------
-- View structure for reg_payments_v
-- ----------------------------
DROP VIEW IF EXISTS `reg_payments_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_payments_v` AS select `registration_view`.`reg_date` AS `reg_date`,`registration_view`.`theory_units` AS `theory_units`,`registration_view`.`actional_units` AS `actional_units`,`registration_view`.`fix_salary` AS `fix_salary`,`registration_view`.`theory_salary` AS `theory_salary`,`registration_view`.`actional_salary` AS `actional_salary`,`registration_view`.`other_salary_comment` AS `other_salary_comment`,`registration_view`.`other_salary_amount` AS `other_salary_amount`,`registration_view`.`total_salary` AS `total_salary`,`registration_view`.`off_amount` AS `off_amount`,`registration_view`.`off_comment` AS `off_comment`,`registration_view`.`term_name` AS `term_name`,`registration_view`.`field_name` AS `field_name`,`registration_view`.`name` AS `name`,`registration_view`.`famili` AS `famili`,`registration_view`.`national_code` AS `national_code`,`registration_view`.`identifier_code` AS `identifier_code`,`registration_view`.`identifier_serial` AS `identifier_serial`,`registration_view`.`identifier_char` AS `identifier_char`,`registration_view`.`student_code` AS `student_code`,`registration_view`.`father_name` AS `father_name`,`registration_view`.`date_of_birth` AS `date_of_birth`,`registration_view`.`address` AS `address`,`registration_view`.`mobile` AS `mobile`,`registration_view`.`phone` AS `phone`,`registration_view`.`archive_code` AS `archive_code`,`registration_view`.`org_name` AS `org_name`,`registration_view`.`id` AS `id`,`registration_view`.`status_name` AS `status_name`,`registration_view`.`status_id` AS `status_id`,`registration_view`.`st_org_id` AS `st_org_id`,`registration_view`.`field_id` AS `field_id`,`registration_view`.`reg_term_is_current` AS `reg_term_is_current`,`registration_view`.`reg_term_id` AS `reg_term_id`,`registration_view`.`org_unit_id` AS `org_unit_id`,`registration_view`.`level_id` AS `level_id`,`registration_view`.`level_name` AS `level_name`,`registration_view`.`created_date` AS `created_date`,`registration_view`.`last_modified` AS `last_modified`,`registration_view`.`from_date` AS `from_date`,`reg_pay_rec_v`.`reg_id` AS `reg_id`,`reg_pay_rec_v`.`amount` AS `amount`,`reg_pay_rec_v`.`finance_id` AS `finance_id`,`reg_pay_rec_v`.`next_payment` AS `next_payment`,`reg_pay_rec_v`.`account_bank_id` AS `account_bank_id`,`reg_pay_rec_v`.`receive_pay_type_id` AS `receive_pay_type_id`,`reg_pay_rec_v`.`description` AS `description`,`reg_pay_rec_v`.`code` AS `code`,`reg_pay_rec_v`.`b_a_name` AS `b_a_name`,`reg_pay_rec_v`.`is_cash` AS `is_cash`,`reg_pay_rec_v`.`bank_name` AS `bank_name`,`reg_pay_rec_v`.`account_name` AS `account_name`,`reg_pay_rec_v`.`rec_pay_type_name` AS `rec_pay_type_name` from (`reg_pay_rec_v` join `registration_view`) where (`reg_pay_rec_v`.`reg_id` = `registration_view`.`id`);

-- ----------------------------
-- View structure for reg_registerd_course_view
-- ----------------------------
DROP VIEW IF EXISTS `reg_registerd_course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_registerd_course_view` AS select `reg_registration`.`id` AS `reg_id`,`reg_registration`.`reg_date` AS `reg_date`,`reg_registration`.`st_id` AS `st_id`,`reg_registration`.`field_id` AS `field_id`,`reg_registration`.`term_id` AS `term_id`,`reg_registration`.`level_id` AS `level_id`,`reg_registration`.`theory_units` AS `theory_units`,`reg_registration`.`actional_units` AS `actional_units`,`reg_registration`.`fix_salary` AS `fix_salary`,`reg_registration`.`actional_salary` AS `actional_salary`,`reg_registration`.`theory_salary` AS `theory_salary`,`reg_registration`.`other_salary_comment` AS `other_salary_comment`,`reg_registration`.`other_salary_amount` AS `other_salary_amount`,`reg_registration`.`total_salary` AS `total_salary`,`reg_registration`.`off_amount` AS `off_amount`,`reg_registration`.`off_comment` AS `off_comment`,`reg_registration`.`base_id` AS `base_id`,`reg_student`.`name` AS `first_name`,`reg_student`.`famili` AS `famili`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `st_description`,`reg_student`.`status_id` AS `status_id`,`reg_student`.`org_unit_id` AS `org_unit_id`,`reg_student`.`created_date` AS `created_date`,`reg_student`.`last_modified` AS `last_modified`,`reg_student`.`address` AS `address`,`reg_student`.`mobile` AS `mobile`,`reg_student`.`archive_code` AS `archive_code`,`reg_student`.`pish_madrak` AS `pish_madrak`,`reg_student`.`diplom_madrak` AS `diplom_madrak`,`reg_course`.`ID` AS `course_id`,`reg_course`.`code` AS `course_code`,`reg_course`.`name` AS `course_name`,`reg_course`.`unit` AS `course_unit`,`reg_course`.`is_final` AS `course_is_final`,`reg_course`.`display_name` AS `course_dispaly_name`,`reg_course`.`description` AS `course_description` from ((((`reg_reg_course` join `reg_course` on((`reg_reg_course`.`course_id` = `reg_course`.`ID`))) join `reg_registration` on((`reg_reg_course`.`reg_id` = `reg_registration`.`id`))) join `reg_student` on((`reg_registration`.`st_id` = `reg_student`.`student_code`))) join `reg_term` on((`reg_registration`.`term_id` = `reg_term`.`id`))) where (`reg_term`.`is_current` = 1);

-- ----------------------------
-- View structure for register_factor_view
-- ----------------------------
DROP VIEW IF EXISTS `register_factor_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `register_factor_view` AS select `reg_receivable`.`id` AS `id`,`reg_receivable`.`finance_factor_id` AS `finance_factor_id`,`reg_receivable`.`create_date` AS `create_date`,`reg_receivable`.`reg_id` AS `reg_id`,`reg_registration`.`st_id` AS `st_id`,`reg_registration`.`field_id` AS `field_id`,`reg_registration`.`term_id` AS `term_id`,`finance_factor`.`amount` AS `amount`,`finance_factor`.`type_id` AS `type_id`,`finance_factor`.`description` AS `description`,`finance_factor`.`account_person_id` AS `account_person_id` from ((`reg_receivable` join `reg_registration` on((`reg_receivable`.`reg_id` = `reg_registration`.`id`))) join `finance_factor` on((`reg_receivable`.`finance_factor_id` = `finance_factor`.`id`)));

-- ----------------------------
-- View structure for registration_view
-- ----------------------------
DROP VIEW IF EXISTS `registration_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `registration_view` AS select `reg_registration`.`reg_date` AS `reg_date`,`reg_registration`.`theory_units` AS `theory_units`,`reg_registration`.`actional_units` AS `actional_units`,`reg_registration`.`fix_salary` AS `fix_salary`,`reg_registration`.`theory_salary` AS `theory_salary`,`reg_registration`.`actional_salary` AS `actional_salary`,`reg_registration`.`other_salary_comment` AS `other_salary_comment`,`reg_registration`.`other_salary_amount` AS `other_salary_amount`,`reg_registration`.`total_salary` AS `total_salary`,`reg_registration`.`off_amount` AS `off_amount`,`reg_registration`.`off_comment` AS `off_comment`,`reg_term`.`name` AS `term_name`,`reg_field`.`name` AS `field_name`,`reg_student`.`name` AS `name`,`reg_student`.`famili` AS `famili`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`identifier_code` AS `identifier_code`,`reg_student`.`identifier_serial` AS `identifier_serial`,`reg_student`.`identifier_char` AS `identifier_char`,`reg_student`.`student_code` AS `student_code`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `description`,`reg_student`.`address` AS `address`,`reg_student`.`mobile` AS `mobile`,`reg_student`.`phone` AS `phone`,`reg_student`.`archive_code` AS `archive_code`,`reg_organization`.`name` AS `org_name`,`reg_registration`.`id` AS `id`,`reg_student_status`.`name` AS `status_name`,`reg_student_status`.`id` AS `status_id`,`reg_organization`.`id` AS `st_org_id`,`reg_field`.`id` AS `field_id`,`reg_term`.`is_current` AS `reg_term_is_current`,`reg_term`.`id` AS `reg_term_id`,`reg_organization`.`id` AS `org_unit_id`,`reg_level`.`id` AS `level_id`,`reg_level`.`name` AS `level_name`,`reg_student`.`created_date` AS `created_date`,`reg_student`.`last_modified` AS `last_modified`,`reg_term`.`from_date` AS `from_date`,`reg_student`.`pish_madrak` AS `pish_madrak`,`reg_student`.`diplom_madrak` AS `diplom_madrak`,`reg_base_level`.`base_name` AS `base_name` from (((((((`reg_registration` join `reg_term` on((`reg_registration`.`term_id` = `reg_term`.`id`))) join `reg_field` on((`reg_registration`.`field_id` = `reg_field`.`id`))) join `reg_student` on((`reg_registration`.`st_id` = `reg_student`.`student_code`))) join `reg_organization` on((`reg_student`.`org_unit_id` = `reg_organization`.`id`))) join `reg_student_status` on((`reg_student`.`status_id` = `reg_student_status`.`id`))) join `reg_level` on((`reg_registration`.`level_id` = `reg_level`.`id`))) left join `reg_base_level` on((`reg_registration`.`base_id` = `reg_base_level`.`base_id`)));

-- ----------------------------
-- View structure for registration_view2
-- ----------------------------
DROP VIEW IF EXISTS `registration_view2`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `registration_view2` AS select `reg_registration`.`reg_date` AS `reg_date`,`reg_registration`.`theory_units` AS `theory_units`,`reg_registration`.`actional_units` AS `actional_units`,`reg_registration`.`fix_salary` AS `fix_salary`,`reg_registration`.`theory_salary` AS `theory_salary`,`reg_registration`.`actional_salary` AS `actional_salary`,`reg_registration`.`other_salary_comment` AS `other_salary_comment`,`reg_registration`.`other_salary_amount` AS `other_salary_amount`,`reg_registration`.`total_salary` AS `total_salary`,`reg_registration`.`off_amount` AS `off_amount`,`reg_registration`.`off_comment` AS `off_comment`,`reg_term`.`name` AS `term_name`,`reg_field`.`name` AS `field_name`,`reg_student`.`name` AS `name`,`reg_student`.`famili` AS `famili`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`identifier_code` AS `identifier_code`,`reg_student`.`identifier_serial` AS `identifier_serial`,`reg_student`.`identifier_char` AS `identifier_char`,`reg_student`.`student_code` AS `student_code`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `description`,`reg_student`.`address` AS `address`,`reg_student`.`mobile` AS `mobile`,`reg_student`.`phone` AS `phone`,`reg_student`.`archive_code` AS `archive_code`,`reg_organization`.`name` AS `org_name`,`reg_registration`.`id` AS `id`,`reg_student_status`.`name` AS `status_name`,`reg_student_status`.`id` AS `status_id`,`reg_organization`.`id` AS `st_org_id`,`reg_field`.`id` AS `field_id`,`reg_term`.`is_current` AS `reg_term_is_current`,`reg_term`.`id` AS `reg_term_id`,`reg_organization`.`id` AS `org_unit_id`,`reg_level`.`id` AS `level_id`,`reg_level`.`name` AS `level_name`,`reg_student`.`created_date` AS `created_date`,`reg_student`.`last_modified` AS `last_modified`,`reg_term`.`from_date` AS `from_date`,`reg_student`.`pish_madrak` AS `pish_madrak`,`reg_student`.`diplom_madrak` AS `diplom_madrak`,`reg_base_level`.`base_name` AS `base_name` from (((((((`reg_registration` join `reg_term` on((`reg_registration`.`term_id` = `reg_term`.`id`))) join `reg_field` on((`reg_registration`.`field_id` = `reg_field`.`id`))) join `reg_student` on((`reg_registration`.`st_id` = `reg_student`.`student_code`))) join `reg_organization` on((`reg_student`.`org_unit_id` = `reg_organization`.`id`))) join `reg_student_status` on((`reg_student`.`status_id` = `reg_student_status`.`id`))) join `reg_level` on((`reg_registration`.`level_id` = `reg_level`.`id`))) left join `reg_base_level` on((`reg_registration`.`base_id` = `reg_base_level`.`base_id`))) order by `reg_registration`.`id`;

-- ----------------------------
-- View structure for st_current_term_v
-- ----------------------------
DROP VIEW IF EXISTS `st_current_term_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `st_current_term_v` AS select `student_view`.`name` AS `name`,`student_view`.`famili` AS `famili`,`student_view`.`student_code` AS `student_code`,`student_view`.`status_id` AS `status_id`,`student_view`.`org_unit_id` AS `org_unit_id`,`student_view`.`level_id_last` AS `level_id_last`,`student_view`.`field_id_last` AS `field_id_last`,`student_view`.`field_name` AS `field_name`,`student_view`.`level_name` AS `level_name`,`student_view`.`org_name` AS `org_name`,`student_view`.`status_name` AS `status_name`,`student_view`.`national_code` AS `national_code`,`student_view`.`identifier_code` AS `identifier_code`,`student_view`.`identifier_serial` AS `identifier_serial`,`student_view`.`identifier_char` AS `identifier_char`,`student_view`.`father_name` AS `father_name`,`student_view`.`date_of_birth` AS `date_of_birth`,`student_view`.`description` AS `description`,`student_view`.`created_date` AS `created_date`,`student_view`.`last_modified` AS `last_modified`,`student_view`.`address` AS `address`,`student_view`.`mobile` AS `mobile`,`student_view`.`phone` AS `phone`,`student_view`.`archive_code` AS `archive_code` from `student_view` where `student_view`.`student_code` in (select `reg_registration`.`st_id` AS `st_id` from `reg_registration` where `reg_registration`.`term_id` in (select `reg_term`.`id` AS `id` from `reg_term` where (`reg_term`.`is_current` = 1)));

-- ----------------------------
-- View structure for st_not_current_t_v
-- ----------------------------
DROP VIEW IF EXISTS `st_not_current_t_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `st_not_current_t_v` AS select `student_view`.`name` AS `name`,`student_view`.`famili` AS `famili`,`student_view`.`student_code` AS `student_code`,`student_view`.`status_id` AS `status_id`,`student_view`.`org_unit_id` AS `org_unit_id`,`student_view`.`level_id_last` AS `level_id_last`,`student_view`.`field_id_last` AS `field_id_last`,`student_view`.`field_name` AS `field_name`,`student_view`.`level_name` AS `level_name`,`student_view`.`org_name` AS `org_name`,`student_view`.`status_name` AS `status_name`,`student_view`.`national_code` AS `national_code`,`student_view`.`identifier_code` AS `identifier_code`,`student_view`.`identifier_serial` AS `identifier_serial`,`student_view`.`identifier_char` AS `identifier_char`,`student_view`.`father_name` AS `father_name`,`student_view`.`date_of_birth` AS `date_of_birth`,`student_view`.`description` AS `description`,`student_view`.`created_date` AS `created_date`,`student_view`.`last_modified` AS `last_modified`,`student_view`.`address` AS `address`,`student_view`.`mobile` AS `mobile`,`student_view`.`phone` AS `phone`,`student_view`.`archive_code` AS `archive_code` from `student_view` where `student_view`.`student_code` in (select `reg_registration`.`st_id` AS `st_id` from `reg_registration` where `reg_registration`.`term_id` in (select `reg_term`.`id` AS `id` from `reg_term` where (`reg_term`.`is_current` = 1)) is false);

-- ----------------------------
-- View structure for st_without_pic_view
-- ----------------------------
DROP VIEW IF EXISTS `st_without_pic_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `st_without_pic_view` AS select `registration_view`.`field_name` AS `field_name`,`registration_view`.`name` AS `name`,`registration_view`.`famili` AS `famili`,`registration_view`.`national_code` AS `national_code`,`registration_view`.`mobile` AS `mobile`,`registration_view`.`archive_code` AS `archive_code`,`registration_view`.`father_name` AS `father_name` from (`registration_view` left join `reg_student_image` on((`reg_student_image`.`st_code` = `registration_view`.`student_code`))) where ((`registration_view`.`reg_term_is_current` = 1) and (`reg_student_image`.`st_image` is null)) order by `registration_view`.`famili`;

-- ----------------------------
-- View structure for student_view
-- ----------------------------
DROP VIEW IF EXISTS `student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `student_view` AS select `reg_student`.`name` AS `name`,`reg_student`.`famili` AS `famili`,`reg_student`.`student_code` AS `student_code`,`reg_student`.`status_id` AS `status_id`,`reg_student`.`org_unit_id` AS `org_unit_id`,`reg_student`.`level_id_last` AS `level_id_last`,`reg_student`.`field_id_last` AS `field_id_last`,`reg_field`.`name` AS `field_name`,`reg_level`.`name` AS `level_name`,`reg_organization`.`name` AS `org_name`,`reg_student_status`.`name` AS `status_name`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`identifier_code` AS `identifier_code`,`reg_student`.`identifier_serial` AS `identifier_serial`,`reg_student`.`identifier_char` AS `identifier_char`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `description`,`reg_student`.`created_date` AS `created_date`,`reg_student`.`last_modified` AS `last_modified`,`reg_student`.`address` AS `address`,`reg_student`.`mobile` AS `mobile`,`reg_student`.`phone` AS `phone`,`reg_student`.`archive_code` AS `archive_code`,`reg_student`.`level_id_last` AS `level_id`,`reg_student`.`field_id_last` AS `field_id`,`reg_student`.`pish_madrak` AS `pish_madrak`,`reg_student`.`diplom_madrak` AS `diplom_madrak` from ((((`reg_student` left join `reg_field` on((`reg_student`.`field_id_last` = `reg_field`.`id`))) left join `reg_level` on((`reg_student`.`level_id_last` = `reg_level`.`id`))) join `reg_organization` on((`reg_student`.`org_unit_id` = `reg_organization`.`id`))) join `reg_student_status` on((`reg_student`.`status_id` = `reg_student_status`.`id`)));

-- ----------------------------
-- View structure for students_in_courses_view
-- ----------------------------
DROP VIEW IF EXISTS `students_in_courses_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `students_in_courses_view` AS select count(`reg_course`.`ID`) AS `COUNT(reg_course.ID)`,`reg_course`.`code` AS `code`,`reg_course`.`display_name` AS `display_name` from (`reg_course` join `reg_reg_course` on((`reg_course`.`ID` = `reg_reg_course`.`course_id`))) where `reg_reg_course`.`reg_id` in (select `registration_view`.`id` from `registration_view` where (`registration_view`.`reg_term_is_current` = 1)) group by `reg_reg_course`.`course_id`;

SET FOREIGN_KEY_CHECKS = 1;
