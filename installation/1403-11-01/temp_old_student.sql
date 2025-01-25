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

 Date: 21/01/2025 14:08:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
