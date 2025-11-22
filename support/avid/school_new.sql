/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : school_new

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 18/11/2025 18:56:47
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
) ENGINE = InnoDB AUTO_INCREMENT = 14211 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of finance_account
-- ----------------------------
INSERT INTO `finance_account` VALUES (14208, 'فاطمه ابراهیم خمیسی', NULL, 'فاطمه ابراهیم خمیسی', '09023164468', NULL, '2025-11-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14209, 'زهرا اسحقی', NULL, 'زهرا اسحقی', '09140401548', NULL, '2025-11-18 00:00:00', NULL, 0);
INSERT INTO `finance_account` VALUES (14210, 'زهره باقری', NULL, 'زهره باقری', '09130152534', NULL, '2025-11-18 00:00:00', NULL, 0);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of finance_account_bank
-- ----------------------------
INSERT INTO `finance_account_bank` VALUES (1, 'حساب مرکزی', 1, 0, b'0');
INSERT INTO `finance_account_bank` VALUES (2, 'صندوق', NULL, 0, b'1');

-- ----------------------------
-- Table structure for finance_bank
-- ----------------------------
DROP TABLE IF EXISTS `finance_bank`;
CREATE TABLE `finance_bank`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 34030 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of finance_factor
-- ----------------------------
INSERT INTO `finance_factor` VALUES (34027, 14208, -30500000, '2025-11-18 00:00:00', NULL, 1);
INSERT INTO `finance_factor` VALUES (34028, 14209, -25250000, '2025-11-18 00:00:00', NULL, 1);
INSERT INTO `finance_factor` VALUES (34029, 14210, -30500000, '2025-11-18 00:00:00', NULL, 1);

-- ----------------------------
-- Table structure for finance_factor_type
-- ----------------------------
DROP TABLE IF EXISTS `finance_factor_type`;
CREATE TABLE `finance_factor_type`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 44251 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of finance_receive_payment
-- ----------------------------
INSERT INTO `finance_receive_payment` VALUES (44249, '2025-10-20 00:00:00', 25250000, 1, 14209, 2, NULL, NULL);
INSERT INTO `finance_receive_payment` VALUES (44250, '2025-11-18 00:00:00', 10000000, 1, 14210, 2, NULL, NULL);

-- ----------------------------
-- Table structure for reg_base
-- ----------------------------
DROP TABLE IF EXISTS `reg_base`;
CREATE TABLE `reg_base`  (
  `base_id` bigint NOT NULL DEFAULT 0,
  `base_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`base_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_base_level
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 915 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_course
-- ----------------------------
INSERT INTO `reg_course` VALUES (141, '10011', NULL, NULL, b'0', 'دینی و اخلاق1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (150, '10021', NULL, NULL, b'0', 'عربی و زبان قرآن1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (158, '10022', NULL, NULL, b'0', 'عربی و زبان قرآن1-کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (173, '10031', NULL, NULL, b'0', 'فارسی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (177, '10041', NULL, NULL, b'0', 'نگارش 1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (183, '10051', NULL, NULL, b'0', 'ریاضی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (184, '10061', NULL, NULL, b'0', 'هندسه1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (193, '10071', NULL, NULL, b'0', 'آمادگی دفاعی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (197, '10081', NULL, NULL, b'0', 'زبان خارجی1-نظری', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (205, '10082', NULL, NULL, b'0', 'زبان خارجه1-کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (211, '10092', NULL, NULL, b'0', 'تربیت بدنی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (218, '10101', NULL, NULL, b'0', 'فیزیک1 رشته ریاضی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (220, '10111', NULL, NULL, b'0', 'شیمی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (221, '10121', NULL, NULL, b'0', 'آزمایشگاه علوم 1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (233, '10131', NULL, NULL, b'0', 'جغرافیا عمومی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (234, '10141', NULL, NULL, b'0', 'زیست شناسی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (235, '10151', NULL, NULL, b'0', 'دینی 1 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (236, '10161', NULL, NULL, b'0', 'عربی 1 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (237, '10171', NULL, NULL, b'0', 'علوم و فنون ادبی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (238, '10181', NULL, NULL, b'0', 'ریاضی و آمار1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (239, '10191', NULL, NULL, b'0', 'تاریخ1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (246, '10201', NULL, NULL, b'0', 'جامعه شناسی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (256, '10211', NULL, NULL, b'0', 'اقتصاد', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (258, '10221', NULL, NULL, b'0', 'منطق', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (259, '10291', NULL, NULL, b'0', 'فیزیک1 تجربی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (267, '11011', NULL, NULL, b'0', 'دینی و اخلاق 2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (270, '11021', NULL, NULL, b'0', 'عربی 2 ریاضی وتجربی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (275, '11022', NULL, NULL, b'0', 'عربی (2) کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (283, '11031', NULL, NULL, b'0', 'فارسی 2 - کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (291, '11041', NULL, NULL, b'0', 'نگارش2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (293, '11051', NULL, NULL, b'0', 'هندسه 2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (294, '11061', NULL, NULL, b'0', 'حسابان1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (295, '11071', NULL, NULL, b'0', 'آمار و احتمال', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (296, '11081', NULL, NULL, b'0', 'زبان خارجه (2)', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (300, '11082', NULL, NULL, b'0', 'زبان خارجه(2) کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (316, '11092', NULL, NULL, b'0', 'تربیت بدنی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (318, '11101', NULL, NULL, b'0', 'فیزیک 2 رشته ریاضی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (319, '11111', NULL, NULL, b'0', 'شیمی 2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (322, '11121', NULL, NULL, b'0', 'آزمایشگاه علوم2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (324, '11131', NULL, NULL, b'0', 'انسان و محیط زیست', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (340, '11141', NULL, NULL, b'0', 'تاریخ معاصر', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (345, '11151', NULL, NULL, b'0', 'زمین شناسی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (346, '11161', NULL, NULL, b'0', 'ریاضی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (347, '11171', NULL, NULL, b'0', 'زیست شناسی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (349, '11191', NULL, NULL, b'0', 'عربی 2 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (350, '11201', NULL, NULL, b'0', 'علوم و فنون ادبی 2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (351, '11211', NULL, NULL, b'0', 'ریاضی و آمار2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (352, '11221', NULL, NULL, b'0', 'جغرافیا2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (353, '11231', NULL, NULL, b'0', 'تاریخ 2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (354, '11241', NULL, NULL, b'0', 'جامعه شناسی 2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (355, '11251', NULL, NULL, b'0', 'روان شناسی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (356, '11261', NULL, NULL, b'0', 'فلسفه', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (357, '11331', NULL, NULL, b'0', 'فیزیک 2 تجربی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (358, '12011', NULL, NULL, b'1', 'دینی و اخلاق3  ', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (368, '12021', NULL, NULL, b'1', 'عربی،زبان قرآن3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (370, '12022', NULL, NULL, b'0', 'عربی زبان قرآن3 کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (378, '12031', NULL, NULL, b'1', 'فارسی 3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (391, '12041', NULL, NULL, b'0', 'نگارش3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (392, '12051', NULL, NULL, b'1', 'هندسه3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (393, '12061', NULL, NULL, b'1', 'حسابان2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (394, '12071', NULL, NULL, b'1', 'ریاضیات گسسته', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (397, '12081', NULL, NULL, b'1', 'زبان خارجی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (407, '12091', NULL, NULL, b'0', 'تربیت بدنی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (409, '12101', NULL, NULL, b'1', 'فیزیک 3 ', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (411, '12111', NULL, NULL, b'1', 'شیمی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (414, '12121', NULL, NULL, b'1', 'سلامت و بهداشت ', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (431, '12131', NULL, NULL, b'0', 'مدیریت خانواده و سبک زندگی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (435, '12141', NULL, NULL, b'1', 'علوم اجتماعی ', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (444, '12151', NULL, NULL, b'1', 'زیست شناسی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (445, '12161', NULL, NULL, b'1', 'ریاضی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (446, '12171', NULL, NULL, b'1', 'دینی 3 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (447, '12181', NULL, NULL, b'1', 'عربی3 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (448, '12191', NULL, NULL, b'1', 'علوم و فنون ادبی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (449, '12201', NULL, NULL, b'1', 'ریاضی و آمار3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (450, '12211', NULL, NULL, b'1', 'جغرافیا3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (451, '12221', NULL, NULL, b'1', 'تاریخ3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (452, '12231', NULL, NULL, b'1', 'جامعه شناسی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (453, '12241', NULL, NULL, b'0', 'مطالعات فرهنگی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (454, '12251', NULL, NULL, b'1', 'فلسفه2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (455, '12331', NULL, NULL, b'1', 'فیزیک3 تجربی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (462, '14031', NULL, NULL, b'0', 'تفکر و سواد رسانه ای', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (467, '88901', NULL, NULL, b'0', 'فیزیک1 کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (476, '88510', NULL, NULL, b'0', 'ریاضی1 کاردانش', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (487, '88150', NULL, NULL, b'0', 'اخلاق حرفه ای', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (492, '88140', NULL, NULL, b'0', 'کارگاه نوآوری و کارآفرینی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (502, '88130', NULL, NULL, b'0', 'مدیریت تولید', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (510, '88120', NULL, NULL, b'0', 'کاربرد فناوری های نوین', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (521, '88110', NULL, NULL, b'0', 'الزامات محیط کار', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (523, '24501', NULL, NULL, b'0', 'قرآن1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (524, '24502', NULL, NULL, b'0', 'معارف اسلامی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (526, '24504', NULL, NULL, b'0', 'املاء1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (528, '24507', NULL, NULL, b'0', 'عربی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (529, '24508', NULL, NULL, b'0', 'زبان خارجه1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (530, '24509', NULL, NULL, b'0', 'علوم تجربی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (531, '24510', NULL, NULL, b'0', 'ریاضی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (532, '24511', NULL, NULL, b'0', 'تربیت بدنی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (533, '24512', NULL, NULL, b'0', 'اجتماعی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (534, '24513', NULL, NULL, b'0', 'فرهنگ و هنر1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (535, '24514', NULL, NULL, b'0', 'کار و فناوری1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (536, '24515', NULL, NULL, b'0', 'تفکر و سبک زندگی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (537, '24601', NULL, NULL, b'0', 'قرآن2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (538, '24602', NULL, NULL, b'0', 'معارف اسلامی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (540, '24604', NULL, NULL, b'0', 'املاء2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (542, '24607', NULL, NULL, b'0', 'عربی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (543, '24608', NULL, NULL, b'0', 'زبان خارجه2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (544, '24609', NULL, NULL, b'0', 'علوم تجربی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (545, '24610', NULL, NULL, b'0', 'ریاضی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (546, '24611', NULL, NULL, b'0', 'تربیت بدنی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (548, '24612', NULL, NULL, b'0', 'اجتماعی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (549, '24613', NULL, NULL, b'0', 'فرهنگ و هنر2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (550, '24614', NULL, NULL, b'0', 'کاروفناوری2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (551, '24615', NULL, NULL, b'0', 'تفکر و سبک زندگی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (552, '24701', NULL, NULL, b'0', 'قرآن3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (553, '24702', NULL, NULL, b'0', 'معارف اسلامی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (555, '24704', NULL, NULL, b'0', 'املاء3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (557, '24707', NULL, NULL, b'0', 'عربی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (558, '24708', NULL, NULL, b'0', 'زبان خارجه3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (559, '24709', NULL, NULL, b'0', 'علوم تجربی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (560, '24710', NULL, NULL, b'0', 'ریاضی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (561, '24711', NULL, NULL, b'0', 'تربیت بدنی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (562, '24712', NULL, NULL, b'0', 'اجتماعی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (563, '24713', NULL, NULL, b'0', 'فرهنگ و هنر3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (564, '24714', NULL, NULL, b'0', 'کار و فناوری3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (565, '24717', NULL, NULL, b'0', 'آمادگی دفاعی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (566, '11181', NULL, NULL, b'0', 'دینی و اخلاق 2 انسانی', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (724, '24520', NULL, NULL, b'0', 'فارسی1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (725, '24521', NULL, NULL, b'0', 'نگارش 1', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (726, '24620', NULL, NULL, b'0', 'فارسی2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (727, '24621', NULL, NULL, b'0', 'نگارش2', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (728, '24720', NULL, NULL, b'0', 'فارسی3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (729, '24721', NULL, NULL, b'0', 'نگارش3', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (902, '1111', NULL, NULL, b'0', 'مهارت', NULL, NULL, NULL);
INSERT INTO `reg_course` VALUES (914, '88701', NULL, NULL, b'0', 'زیست شناسی کاردانش', NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1219 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

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
INSERT INTO `reg_exam_kart_config` VALUES (1, 'شیرین حاجی زاده', 'مدرسه آوید', 'مدرسه آوید');

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
) ENGINE = InnoDB AUTO_INCREMENT = 425 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

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
  `is_active` bit(1) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_field
-- ----------------------------
INSERT INTO `reg_field` VALUES (1, 'ریاضی و فیزیک', b'1', NULL);
INSERT INTO `reg_field` VALUES (2, 'ادبیات و علوم انسانی', b'1', NULL);
INSERT INTO `reg_field` VALUES (3, 'علوم تجربی', b'1', NULL);
INSERT INTO `reg_field` VALUES (4, 'تولید و پرورش گیاهان زینتی', b'1', '92152');
INSERT INTO `reg_field` VALUES (5, 'مدیریت و برنامه ریزی خانواده', b'1', '94101');
INSERT INTO `reg_field` VALUES (6, 'چاپ دستی', b'1', '99201');
INSERT INTO `reg_field` VALUES (7, 'تصویربرداری', b'1', NULL);
INSERT INTO `reg_field` VALUES (8, 'عیب‌یابی و مونتاژ سیم‌های رایانه‌ای', b'1', '61381');
INSERT INTO `reg_field` VALUES (9, 'تعمیر تلفن‌های رومیزی و همراه', b'1', '91112');
INSERT INTO `reg_field` VALUES (10, 'تعمیر دستگاه اداری', b'1', '91113');
INSERT INTO `reg_field` VALUES (11, 'تولید و توسعه‌دهنده پایگاه‌های اینترنتی', b'1', '91125');
INSERT INTO `reg_field` VALUES (12, 'تولید محتوای آموزشی الکترونیکی', b'1', '91123');
INSERT INTO `reg_field` VALUES (13, 'نقشه‌کشی صنعتی با رایانه', b'1', '61011');
INSERT INTO `reg_field` VALUES (14, 'نقشه‌کشی ساختمان', b'1', '61841');
INSERT INTO `reg_field` VALUES (15, 'امور باغی گیاهان زینتی و فضای سبز', b'1', '81211');
INSERT INTO `reg_field` VALUES (16, 'امور زراعی گیاهان دارویی', b'1', '81121');
INSERT INTO `reg_field` VALUES (17, 'دامپروری طیور و دام', b'1', '81112');
INSERT INTO `reg_field` VALUES (18, 'دامپروری طیور و حشرات مفید', b'1', '81111');
INSERT INTO `reg_field` VALUES (19, 'شیلات', b'1', '83110');
INSERT INTO `reg_field` VALUES (20, 'نان، شیرینی و شکلات', b'1', '92173');
INSERT INTO `reg_field` VALUES (21, 'دوخت لباس‌های محلی', b'0', '61501');
INSERT INTO `reg_field` VALUES (22, 'دوخت لباس‌های سنتی', b'0', '93155');
INSERT INTO `reg_field` VALUES (23, 'سراجی کیف', b'1', '93151');
INSERT INTO `reg_field` VALUES (24, 'سراجی دوزنده کفش', b'1', '93152');
INSERT INTO `reg_field` VALUES (25, 'تصویرسازی و جلوه‌های ویژه رایانه‌ای', b'1', '62321');
INSERT INTO `reg_field` VALUES (26, 'طراحی طلا و جواهر', b'1', '62261');
INSERT INTO `reg_field` VALUES (27, 'طلا و جواهرسازی', b'1', '93141');
INSERT INTO `reg_field` VALUES (28, 'تراش و تزئین شیشه و کریستال', b'1', '99441');
INSERT INTO `reg_field` VALUES (29, 'قلم‌زنی روی فلز', b'1', '97371');
INSERT INTO `reg_field` VALUES (30, 'تراش سنگ‌های قیمتی', b'1', '98471');
INSERT INTO `reg_field` VALUES (31, 'هنر آیینه‌کاری', b'1', '99221');
INSERT INTO `reg_field` VALUES (32, 'گرافیک رایانه‌ای', b'1', '99011');
INSERT INTO `reg_field` VALUES (33, 'عکاسی دیجیتال', b'1', '99211');
INSERT INTO `reg_field` VALUES (34, 'سازسازی (سنتور و سه‌تار)', b'1', '99171');
INSERT INTO `reg_field` VALUES (35, 'سازسازی سنتور (سه‌تار و ساز ضربی)', b'1', '99181');
INSERT INTO `reg_field` VALUES (36, 'سازسازی (سنتور و ساز ضربی)', b'1', '99261');
INSERT INTO `reg_field` VALUES (37, 'نوازندگی ساز ایرانی', b'1', '99411');
INSERT INTO `reg_field` VALUES (38, 'نوازندگی ساز جهانی', b'1', '99421');
INSERT INTO `reg_field` VALUES (39, 'آواز ایرانی', b'1', '99431');
INSERT INTO `reg_field` VALUES (40, 'آواز جهانی', b'1', '99361');
INSERT INTO `reg_field` VALUES (41, 'نگارگری', b'1', '99061');
INSERT INTO `reg_field` VALUES (42, 'تذهیب و تشعیر', b'1', '99071');
INSERT INTO `reg_field` VALUES (43, 'چهره‌سازی', b'1', '99161');
INSERT INTO `reg_field` VALUES (44, 'نقاشی ایرانی', b'1', '98411');
INSERT INTO `reg_field` VALUES (45, 'چهره‌پردازی', b'1', '93111');
INSERT INTO `reg_field` VALUES (46, 'چاپ باتیک و سیلک اسکرین', b'1', '98491');
INSERT INTO `reg_field` VALUES (47, 'صحافی و جلدسازی', b'1', '98501');
INSERT INTO `reg_field` VALUES (48, 'امور اداری', b'1', '94201');
INSERT INTO `reg_field` VALUES (49, 'مدیریت آشپزی و قنادی', b'1', '62241');
INSERT INTO `reg_field` VALUES (50, 'هتلداری', b'1', '61741');
INSERT INTO `reg_field` VALUES (51, 'راهنمای گردشگری', b'1', '62201');

-- ----------------------------
-- Table structure for reg_identifier_code
-- ----------------------------
DROP TABLE IF EXISTS `reg_identifier_code`;
CREATE TABLE `reg_identifier_code`  (
  `id` int NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_level
-- ----------------------------
INSERT INTO `reg_level` VALUES (1, 'دوره اول متوسطه');
INSERT INTO `reg_level` VALUES (2, 'دوره دوم  متوسطه  نظری');
INSERT INTO `reg_level` VALUES (3, 'دوره دوم متوسطه کاردانش');

-- ----------------------------
-- Table structure for reg_organization
-- ----------------------------
DROP TABLE IF EXISTS `reg_organization`;
CREATE TABLE `reg_organization`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 34032 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_receivable
-- ----------------------------
INSERT INTO `reg_receivable` VALUES (34028, 34027, '2025-01-21 00:00:00', 34029);
INSERT INTO `reg_receivable` VALUES (34029, 34027, '2025-11-18 00:00:00', 34029);
INSERT INTO `reg_receivable` VALUES (34030, 34028, '2025-11-18 00:00:00', 34030);
INSERT INTO `reg_receivable` VALUES (34031, 34029, '2025-11-18 00:00:00', 34031);

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
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 44160 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_reg_payment
-- ----------------------------
INSERT INTO `reg_reg_payment` VALUES (44158, '2025-10-20 00:00:00', 34030, 44249, NULL);
INSERT INTO `reg_reg_payment` VALUES (44159, '2025-11-18 00:00:00', 34031, 44250, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 34032 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_registration
-- ----------------------------
INSERT INTO `reg_registration` VALUES (34029, '2025-11-18 00:00:00', 372208991, 32, 9332, 3, 18.00, 108, 4400000, 0, 1450000, NULL, 0, 30500000, 0, NULL, NULL);
INSERT INTO `reg_registration` VALUES (34030, '2025-11-18 00:00:00', 1282728301, 32, 9332, 3, 11.00, 66, 4400000, 0, 1450000, 'ثبت مهارت +مدرک', 4900000, 25250000, 0, NULL, NULL);
INSERT INTO `reg_registration` VALUES (34031, '2025-11-18 00:00:00', 5659277004, 32, 9332, 3, 18.00, 108, 4400000, 0, 1450000, NULL, 0, 30500000, 0, NULL, NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_salary_param
-- ----------------------------
INSERT INTO `reg_salary_param` VALUES (9332, 1, 4400000, 0, 1350000, NULL);
INSERT INTO `reg_salary_param` VALUES (9332, 2, 4400000, 0, 1450000, NULL);
INSERT INTO `reg_salary_param` VALUES (9332, 3, 4400000, 0, 1450000, NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_school
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reg_student
-- ----------------------------
INSERT INTO `reg_student` VALUES ('فاطمه', 'ابراهیم خمیسی', '0372208991', NULL, NULL, 1, 372208991, 'حسین', '1998-11-11', NULL, 1, 1, '2025-11-18 00:00:00', '2025-11-18 00:00:00', NULL, NULL, NULL, '09023164468', NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهرا', 'اسحقی', '1282728301', NULL, NULL, 1, 1282728301, 'محمود', '1980-12-23', NULL, 1, 1, '2025-11-18 00:00:00', '2025-11-18 00:00:00', NULL, NULL, NULL, '09140401548', NULL, NULL, NULL, NULL);
INSERT INTO `reg_student` VALUES ('زهره', 'باقری', '5659277004', NULL, NULL, 1, 5659277004, 'حیدر', '1978-09-23', NULL, 1, 1, '2025-11-18 00:00:00', '2025-11-18 00:00:00', NULL, NULL, NULL, '09130152534', NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1111111111112 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_student_account
-- ----------------------------
INSERT INTO `reg_student_account` VALUES (372208991, 14208, '2025-11-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (1282728301, 14209, '2025-11-18 00:00:00');
INSERT INTO `reg_student_account` VALUES (5659277004, 14210, '2025-11-18 00:00:00');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 9333 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reg_term
-- ----------------------------
INSERT INTO `reg_term` VALUES (9332, 'نیم سال اول 404- 405', '2025-09-23', '2026-02-19', b'1', 4, 4);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of st_govahi_vaziat
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of temp_test2
-- ----------------------------

-- ----------------------------
-- Table structure for test_table
-- ----------------------------
DROP TABLE IF EXISTS `test_table`;
CREATE TABLE `test_table`  (
  `id` bigint NOT NULL DEFAULT 0,
  `amount` int NULL DEFAULT NULL,
  `d` double(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of test_table
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

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
-- View structure for allregs_count__in_term
-- ----------------------------
DROP VIEW IF EXISTS `allregs_count__in_term`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `allregs_count__in_term` AS select count(`registration_view`.`student_code`) AS `all_regs_count`,`registration_view`.`student_code` AS `student_code`,`registration_view`.`name` AS `name`,`registration_view`.`famili` AS `famili`,`registration_view`.`reg_term_id` AS `reg_term_id`,`registration_view`.`term_name` AS `first_term` from `registration_view` where ((`registration_view`.`reg_term_id` <= 9331) and `registration_view`.`student_code` in (select `registration_view`.`student_code` from `registration_view` where (`registration_view`.`reg_term_id` = 9331))) group by `registration_view`.`student_code`;

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
-- View structure for exam_kart_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_kart_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `exam_kart_view` AS select `exam_course_view`.`term_id` AS `term_id`,`reg_registerd_course_view`.`first_name` AS `first_name`,`reg_registerd_course_view`.`famili` AS `famili`,`exam_course_view`.`course_display_name` AS `course_display_name`,`exam_course_view`.`course_code` AS `course_code`,`exam_course_view`.`exam_date` AS `exam_date`,`pdate`(`exam_course_view`.`exam_date`) AS `exam_farsi_date`,`pweekday`(`exam_course_view`.`exam_date`) AS `exam_week_day`,`pmonthname`(`exam_course_view`.`exam_date`) AS `exam_month_name`,`exam_course_view`.`exam_hour` AS `exam_hour`,`exam_course_view`.`exam_time_id` AS `exam_time_id`,`reg_registerd_course_view`.`father_name` AS `father_name`,`course_field_view`.`field_name` AS `field_name`,`reg_student_image`.`st_image` AS `st_image`,`exam_course_view`.`term_name` AS `term_name`,`reg_exam_kart_config`.`manager_name` AS `manager_name`,`reg_exam_kart_config`.`school_name` AS `school_name`,`reg_exam_kart_config`.`exam_location` AS `exam_location`,`reg_registerd_course_view`.`st_id` AS `st_id`,`reg_registerd_course_view`.`national_code` AS `national_code`,`course_field_view`.`is_final` AS `is_final` from ((((`reg_registerd_course_view` join `exam_course_view` on(((`exam_course_view`.`term_id` = `reg_registerd_course_view`.`term_id`) and (`exam_course_view`.`course_id` = `reg_registerd_course_view`.`course_id`)))) join `course_field_view` on(((`reg_registerd_course_view`.`course_id` = `course_field_view`.`course_id`) and (`reg_registerd_course_view`.`field_id` = `course_field_view`.`field_id`)))) left join `reg_student_image` on((`reg_registerd_course_view`.`st_id` = `reg_student_image`.`st_code`))) join `reg_exam_kart_config`) where (`exam_course_view`.`term_is_current` = 1);

-- ----------------------------
-- View structure for last_registration_students
-- ----------------------------
DROP VIEW IF EXISTS `last_registration_students`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `last_registration_students` AS select max(`registration_view2`.`reg_term_id`) AS `last_term`,`registration_view2`.`student_code` AS `student_code`,`registration_view2`.`famili` AS `famili`,`registration_view2`.`status_name` AS `status_name`,`registration_view2`.`level_id` AS `level_id`,`registration_view2`.`level_name` AS `level_name`,`registration_view2`.`mobile` AS `mobile`,`registration_view2`.`org_unit_id` AS `org_unit_id`,`registration_view2`.`reg_term_is_current` AS `reg_term_is_current`,`registration_view2`.`status_id` AS `status_id`,`registration_view2`.`archive_code` AS `archive_code`,`registration_view2`.`national_code` AS `national_code`,`registration_view2`.`father_name` AS `father_name`,`registration_view2`.`description` AS `description`,`registration_view2`.`org_name` AS `org_name`,`registration_view2`.`pish_madrak` AS `pish_madrak`,`registration_view2`.`diplom_madrak` AS `diplom_madrak`,`registration_view2`.`term_name` AS `term_name`,`registration_view2`.`field_name` AS `field_name`,`registration_view2`.`name` AS `name`,`registration_view2`.`date_of_birth` AS `date_of_birth`,`registration_view2`.`phone` AS `phone`,`registration_view2`.`st_org_id` AS `st_org_id`,`registration_view2`.`field_id` AS `field_id` from `registration_view2` group by `registration_view2`.`student_code` order by `registration_view2`.`reg_term_id` desc;

-- ----------------------------
-- View structure for last_registration_view
-- ----------------------------
DROP VIEW IF EXISTS `last_registration_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `last_registration_view` AS select `last_registration_students`.`last_term` AS `last_term`,`last_registration_students`.`student_code` AS `student_code`,`registration_view`.`reg_date` AS `reg_date`,`registration_view`.`theory_units` AS `theory_units`,`registration_view`.`actional_units` AS `actional_units`,`registration_view`.`fix_salary` AS `fix_salary`,`registration_view`.`theory_salary` AS `theory_salary`,`registration_view`.`actional_salary` AS `actional_salary`,`registration_view`.`other_salary_comment` AS `other_salary_comment`,`registration_view`.`other_salary_amount` AS `other_salary_amount`,`registration_view`.`total_salary` AS `total_salary`,`registration_view`.`off_amount` AS `off_amount`,`registration_view`.`off_comment` AS `off_comment`,`registration_view`.`term_name` AS `term_name`,`registration_view`.`field_name` AS `field_name`,`registration_view`.`name` AS `name`,`registration_view`.`famili` AS `famili`,`registration_view`.`national_code` AS `national_code`,`registration_view`.`identifier_code` AS `identifier_code`,`registration_view`.`identifier_serial` AS `identifier_serial`,`registration_view`.`identifier_char` AS `identifier_char`,`registration_view`.`father_name` AS `father_name`,`registration_view`.`date_of_birth` AS `date_of_birth`,`registration_view`.`description` AS `description`,`registration_view`.`address` AS `address`,`registration_view`.`mobile` AS `mobile`,`registration_view`.`phone` AS `phone`,`registration_view`.`archive_code` AS `archive_code`,`registration_view`.`org_name` AS `org_name`,`registration_view`.`id` AS `id`,`registration_view`.`status_name` AS `status_name`,`registration_view`.`status_id` AS `status_id`,`registration_view`.`st_org_id` AS `st_org_id`,`registration_view`.`field_id` AS `field_id`,`registration_view`.`reg_term_is_current` AS `reg_term_is_current`,`registration_view`.`reg_term_id` AS `reg_term_id`,`registration_view`.`org_unit_id` AS `org_unit_id`,`registration_view`.`level_id` AS `level_id`,`registration_view`.`level_name` AS `level_name`,`registration_view`.`created_date` AS `created_date`,`registration_view`.`last_modified` AS `last_modified`,`registration_view`.`from_date` AS `from_date`,`registration_view`.`pish_madrak` AS `pish_madrak`,`registration_view`.`diplom_madrak` AS `diplom_madrak`,`pdate`(`last_registration_students`.`date_of_birth`) AS `pdate(last_registration_students.date_of_birth)` from (`last_registration_students` join `registration_view`) where ((`last_registration_students`.`last_term` = `registration_view`.`reg_term_id`) and (`last_registration_students`.`student_code` = `registration_view`.`student_code`));

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
-- View structure for reg_not_registerd_course_view
-- ----------------------------
DROP VIEW IF EXISTS `reg_not_registerd_course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_not_registerd_course_view` AS select `registration_view`.`reg_date` AS `reg_date`,`registration_view`.`theory_units` AS `theory_units`,`registration_view`.`actional_units` AS `actional_units`,`registration_view`.`fix_salary` AS `fix_salary`,`registration_view`.`theory_salary` AS `theory_salary`,`registration_view`.`actional_salary` AS `actional_salary`,`registration_view`.`other_salary_comment` AS `other_salary_comment`,`registration_view`.`other_salary_amount` AS `other_salary_amount`,`registration_view`.`total_salary` AS `total_salary`,`registration_view`.`off_amount` AS `off_amount`,`registration_view`.`off_comment` AS `off_comment`,`registration_view`.`term_name` AS `term_name`,`registration_view`.`field_name` AS `field_name`,`registration_view`.`name` AS `name`,`registration_view`.`famili` AS `famili`,`registration_view`.`national_code` AS `national_code`,`registration_view`.`identifier_code` AS `identifier_code`,`registration_view`.`identifier_serial` AS `identifier_serial`,`registration_view`.`identifier_char` AS `identifier_char`,`registration_view`.`student_code` AS `student_code`,`registration_view`.`father_name` AS `father_name`,`registration_view`.`date_of_birth` AS `date_of_birth`,`registration_view`.`description` AS `description`,`registration_view`.`address` AS `address`,`registration_view`.`mobile` AS `mobile`,`registration_view`.`phone` AS `phone`,`registration_view`.`archive_code` AS `archive_code`,`registration_view`.`org_name` AS `org_name`,`registration_view`.`id` AS `id`,`registration_view`.`status_name` AS `status_name`,`registration_view`.`status_id` AS `status_id`,`registration_view`.`st_org_id` AS `st_org_id`,`registration_view`.`field_id` AS `field_id`,`registration_view`.`reg_term_is_current` AS `reg_term_is_current`,`registration_view`.`reg_term_id` AS `reg_term_id`,`registration_view`.`org_unit_id` AS `org_unit_id`,`registration_view`.`level_id` AS `level_id`,`registration_view`.`level_name` AS `level_name`,`registration_view`.`created_date` AS `created_date`,`registration_view`.`last_modified` AS `last_modified`,`registration_view`.`from_date` AS `from_date`,`registration_view`.`pish_madrak` AS `pish_madrak`,`registration_view`.`diplom_madrak` AS `diplom_madrak`,`registration_view`.`base_name` AS `base_name` from `registration_view` where (`registration_view`.`student_code` in (select `reg_registerd_course_view`.`st_id` from `reg_registerd_course_view`) is false and (`registration_view`.`reg_term_is_current` = 1)) order by `registration_view`.`famili`;

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

-- ----------------------------
-- Function structure for gdate
-- ----------------------------
DROP FUNCTION IF EXISTS `gdate`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `gdate`(`jy` smallint, `jm` smallint, `jd` smallint) RETURNS datetime
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2011-2012 Mehran . M . Spitman
# WebLog :spitman.azdaa.com
# Version V1.0.1

	DECLARE
		i, j, e, k, mo,
		gy, gm, gd,
		g_day_no, j_day_no, bkab, jmm, mday, g_day_mo, bkab1, j1
	INT DEFAULT 0; /* Can be unsigned int? */
	DECLARE resout char(100);
	DECLARE fdate datetime;

	
  SET bkab = __mymod(jy,33);

  IF (bkab = 1 or bkab= 5 or bkab = 9 or bkab = 13 or bkab = 17 or bkab = 22 or bkab = 26 or bkab = 30) THEN
    SET j=1;
  end IF;

  SET bkab1 = __mymod(jy+1,33);

  IF (bkab1 = 1 or bkab1= 5 or bkab1 = 9 or bkab1 = 13 or bkab1 = 17 or bkab1 = 22 or bkab1 = 26 or bkab1 = 30) THEN
    SET j1=1;
  end IF;

	CASE jm
		WHEN 1 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 2 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 3 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 4 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 5 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 6 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 7 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 8 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 9 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 10 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 11 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 12 THEN IF jd > _jdmarray2(jm)+j or jd <= 0 THEN SET e=1; end IF;
	END CASE;
  IF jm > 12 or jm <= 0 THEN SET e=1; end IF;
  IF jy <= 0 THEN SET e=1; end IF;

  IF e>0 THEN
    RETURN 0;
  end IF;

  IF (jm>=11) or (jm=10 and jd>=11 and j=0) or (jm=10 and jd>11 and j=1) THEN
    SET i=1;
  end IF;
  SET gy = jy + 621 + i;

  IF (__mymod(gy,4)=0) THEN
    SET k=1;
  end IF;
	
	IF (__mymod(gy,100)=0) and (__mymod(gy,400)<>0) THEN
		SET k=0;
	END IF;

  SET jmm=jm-1;

  WHILE (jmm > 0) do
    SET mday=mday+_jdmarray2(jmm);
    SET jmm=jmm-1;
  end WHILE;

  SET j_day_no=(jy-1)*365+(__mydiv(jy,4))+mday+jd;
  SET g_day_no=j_day_no+226899;


  SET g_day_no=g_day_no-(__mydiv(gy-1,4));
  SET g_day_mo=__mymod(g_day_no,365);

	IF (k=1 and j=1) THEN
		IF (g_day_mo=0) THEN
			RETURN CONCAT_WS('-',gy,'12','30');
		END IF;
		IF (g_day_mo=1) THEN
			RETURN CONCAT_WS('-',gy,'12','31');
		END IF;
	END IF;

	IF (g_day_mo=0) THEN
		RETURN CONCAT_WS('-',gy,'12','31');
	END IF;
			

  SET mo=0;
  SET gm=gm+1;
  while g_day_mo>_gdmarray2(mo,k) do
		SET g_day_mo=g_day_mo-_gdmarray2(mo,k);
    SET mo=mo+1;
    SET gm=gm+1;
  end WHILE;
  SET gd=g_day_mo;

  RETURN CONCAT_WS('-',gy,gm,gd);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for gdatestr
-- ----------------------------
DROP FUNCTION IF EXISTS `gdatestr`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `gdatestr`(`jdat` char(10)) RETURNS datetime
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2011-2012 Mehran . M . Spitman
# WebLog spitman.azdaa.com
# Version V1.0.1

	DECLARE
		i, j, e, k, mo,
		gy, gm, gd,
		g_day_no, j_day_no, bkab, jmm, mday, g_day_mo, jd, jy, jm,bkab1,j1
	INT DEFAULT 0; /* ### Can't be unsigned int! ### */
	DECLARE resout char(100);
	DECLARE jdd, jyd, jmd, jt varchar(100);
	DECLARE fdate datetime;

	SET jdd = SUBSTRING_INDEX(jdat, '/', -1);
	SET jt = SUBSTRING_INDEX(jdat, '/', 2);
	SET jyd = SUBSTRING_INDEX(jt, '/', 1);
	SET jmd = SUBSTRING_INDEX(jt, '/', -1);
	SET jd = CAST(jdd as SIGNED);
	SET jy = CAST(jyd as SIGNED);
	SET jm = CAST(jmd as SIGNED);


	 SET bkab = __mymod(jy,33);

  IF (bkab = 1 or bkab= 5 or bkab = 9 or bkab = 13 or bkab = 17 or bkab = 22 or bkab = 26 or bkab = 30) THEN
    SET j=1;
  end IF;

  SET bkab1 = __mymod(jy+1,33);

  IF (bkab1 = 1 or bkab1= 5 or bkab1 = 9 or bkab1 = 13 or bkab1 = 17 or bkab1 = 22 or bkab1 = 26 or bkab1 = 30) THEN
    SET j1=1;
  end IF;

	CASE jm
		WHEN 1 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 2 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 3 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 4 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 5 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 6 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 7 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 8 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 9 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 10 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 11 THEN IF jd > _jdmarray2(jm) or jd <= 0 THEN SET e=1; end IF;
		WHEN 12 THEN IF jd > _jdmarray2(jm)+j or jd <= 0 THEN SET e=1; end IF;
	END CASE;
  IF jm > 12 or jm <= 0 THEN SET e=1; end IF;
  IF jy <= 0 THEN SET e=1; end IF;

  IF e>0 THEN
    RETURN 0;
  end IF;

  IF (jm>=11) or (jm=10 and jd>=11 and j=0) or (jm=10 and jd>11 and j=1) THEN
    SET i=1;
  end IF;
  SET gy = jy + 621 + i;

  IF (__mymod(gy,4)=0) THEN
    SET k=1;
  end IF;
	
	IF (__mymod(gy,100)=0) and (__mymod(gy,400)<>0) THEN
		SET k=0;
	END IF;

  SET jmm=jm-1;

  WHILE (jmm > 0) do
    SET mday=mday+_jdmarray2(jmm);
    SET jmm=jmm-1;
  end WHILE;

  SET j_day_no=(jy-1)*365+(__mydiv(jy,4))+mday+jd;
  SET g_day_no=j_day_no+226899;


  SET g_day_no=g_day_no-(__mydiv(gy-1,4));
  SET g_day_mo=__mymod(g_day_no,365);

	IF (k=1 and j=1) THEN
		IF (g_day_mo=0) THEN
			RETURN CONCAT_WS('-',gy,'12','30');
		END IF;
		IF (g_day_mo=1) THEN
			RETURN CONCAT_WS('-',gy,'12','31');
		END IF;
	END IF;

	IF (g_day_mo=0) THEN
		RETURN CONCAT_WS('-',gy,'12','31');
	END IF;
			

  SET mo=0;
  SET gm=gm+1;
  while g_day_mo>_gdmarray2(mo,k) do
		SET g_day_mo=g_day_mo-_gdmarray2(mo,k);
    SET mo=mo+1;
    SET gm=gm+1;
  end WHILE;
  SET gd=g_day_mo;

  RETURN CONCAT_WS('-',gy,gm,gd);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for pdate
-- ----------------------------
DROP FUNCTION IF EXISTS `pdate`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pdate`(`gdate` datetime) RETURNS char(100) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2009-2012 Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0.2

	DECLARE 
		i,
		gy, gm, gd,
		g_day_no, j_day_no, j_np,
		jy, jm, jd INT DEFAULT 0; /* Can be unsigned int? */
	DECLARE resout char(100);
	DECLARE ttime CHAR(20);

	SET gy = YEAR(gdate) - 1600;
	SET gm = MONTH(gdate) - 1;
	SET gd = DAY(gdate) - 1;
	SET ttime = TIME(gdate);
	SET g_day_no = ((365 * gy) + __mydiv(gy + 3, 4) - __mydiv(gy + 99, 100) + __mydiv (gy + 399, 400));
	SET i = 0;

	WHILE (i < gm) do
		SET g_day_no = g_day_no + _gdmarray(i);
		SET i = i + 1; 
	END WHILE;

	IF gm > 1 and ((gy % 4 = 0 and gy % 100 <> 0)) or gy % 400 = 0 THEN 
		SET g_day_no =	g_day_no + 1;
	END IF;
	
	SET g_day_no = g_day_no + gd; 
	SET j_day_no = g_day_no - 79;
	SET j_np = j_day_no DIV 12053;
	SET j_day_no = j_day_no % 12053;
	SET jy = 979 + 33 * j_np + 4 * __mydiv(j_day_no, 1461);
	SET j_day_no = j_day_no % 1461;

	IF j_day_no >= 366 then 
		SET jy = jy + __mydiv(j_day_no - 1, 365);
		SET j_day_no = (j_day_no - 1) % 365;
	END IF;

	SET i = 0;

	WHILE (i < 11 and j_day_no >= _jdmarray(i)) do
		SET j_day_no = j_day_no - _jdmarray(i);
		SET i = i + 1;
	END WHILE;

	SET jm = i + 1;
	SET jd = j_day_no + 1;
	SET resout = CONCAT_WS ('-', jy, jm, jd);

	IF (ttime <> '00:00:00') then
		SET resout = CONCAT_WS(' ', resout, ttime);
	END IF;

	RETURN resout;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for pday
-- ----------------------------
DROP FUNCTION IF EXISTS `pday`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pday`(`gdate` datetime) RETURNS char(100) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2011-2012 Mohammad Saleh Souzanchi, Mehran . M . Spitman
# WebLog : www.saleh.soozanchi.ir, spitman.azdaa.com
# Version V1.0.1

	DECLARE
		i,
		gy, gm, gd,
		g_day_no, j_day_no, j_np,
		jy, jm, jd INT DEFAULT 0; /* Can be unsigned int? */
	DECLARE resout char(100);
	DECLARE ttime CHAR(20);

	SET gy = YEAR(gdate) - 1600;
	SET gm = MONTH(gdate) - 1;
	SET gd = DAY(gdate) - 1;
	SET ttime = TIME(gdate);
	SET g_day_no = ((365 * gy) + __mydiv(gy + 3, 4) - __mydiv(gy + 99 , 100) + __mydiv(gy + 399, 400));
	SET i = 0;

	WHILE (i < gm) do
		SET g_day_no = g_day_no + _gdmarray(i);
		SET i = i + 1;
	END WHILE;

	IF gm > 1 and ((gy % 4 = 0 and gy % 100 <> 0)) or gy % 400 = 0 THEN
		SET g_day_no = g_day_no + 1;
	END IF;
	
	SET g_day_no = g_day_no + gd;
	SET j_day_no = g_day_no - 79;
	SET j_np = j_day_no DIV 12053;
	SET j_day_no = j_day_no % 12053;
	SET jy = 979 + 33 * j_np + 4 * __mydiv(j_day_no, 1461);
	SET j_day_no = j_day_no % 1461;

	IF j_day_no >= 366 then
		SET jy = jy + __mydiv(j_day_no - 1, 365);
		SET j_day_no = (j_day_no-1) % 365;
	END IF;

	SET i = 0;

	WHILE (i < 11 and j_day_no >= _jdmarray(i)) do
		SET j_day_no = j_day_no - _jdmarray(i);
		SET i = i + 1;
	END WHILE;

	SET jm = i + 1;
	SET jd = j_day_no + 1;
	RETURN jd;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for PMONTH
-- ----------------------------
DROP FUNCTION IF EXISTS `PMONTH`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `PMONTH`(`gdate` datetime) RETURNS char(100) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2009-2012 Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0.2

	DECLARE 
		i,
		gy, gm, gd,
		g_day_no, j_day_no, j_np,
		jy, jm, jd INT DEFAULT 0; /* Can be unsigned int? */
	DECLARE resout char(100);
	DECLARE ttime CHAR(20);

	SET gy = YEAR(gdate) - 1600;
	SET gm = MONTH(gdate) - 1;
	SET gd = DAY(gdate) - 1;
	SET ttime = TIME(gdate);
	SET g_day_no = ((365 * gy) + __mydiv(gy + 3, 4) - __mydiv(gy + 99, 100) + __mydiv(gy + 399, 400));
	SET i = 0;

	WHILE (i < gm) do
		SET g_day_no = g_day_no + _gdmarray(i);
		SET i = i + 1; 
	END WHILE;

	IF gm > 1 and ((gy % 4 = 0 and gy % 100 <> 0)) or gy % 400 = 0 THEN 
		SET g_day_no = g_day_no + 1;
	END IF;
	
	SET g_day_no = g_day_no + gd;
	SET j_day_no = g_day_no - 79;
	SET j_np = j_day_no DIV 12053;
	set j_day_no = j_day_no % 12053;
	SET jy = 979 + 33 * j_np + 4 * __mydiv(j_day_no, 1461);
	SET j_day_no = j_day_no % 1461;

	IF j_day_no >= 366 then 
		SET jy = jy + __mydiv(j_day_no - 1, 365);
		SET j_day_no =(j_day_no - 1) % 365;
	END IF;

	SET i = 0;

	WHILE (i < 11 and j_day_no >= _jdmarray(i)) do
		SET j_day_no = j_day_no - _jdmarray(i);
		SET i = i + 1;
	END WHILE;

	SET jm = i + 1;
	SET jd = j_day_no + 1;
	RETURN jm;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for pmonthname
-- ----------------------------
DROP FUNCTION IF EXISTS `pmonthname`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pmonthname`(`gdate` datetime) RETURNS varchar(100) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2009-2012 Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0.1

	CASE PMONTH(gdate)
		WHEN 1 THEN RETURN 'فروردین';
		WHEN 2 THEN RETURN 'اردیبهشت';
		WHEN 3 THEN	RETURN 'خرداد';
		WHEN 4 THEN	RETURN 'تیر';
		WHEN 5 THEN	RETURN 'مرداد';
		WHEN 6 THEN	RETURN 'شهریور';
		WHEN 7 THEN	RETURN 'مهر';
		WHEN 8 THEN	RETURN 'آبان';
		WHEN 9 THEN	RETURN 'آذر';
		WHEN 10 THEN RETURN	'دی';
		WHEN 11 THEN RETURN	'بهمن';
		WHEN 12 THEN RETURN	'اسفند';
	END CASE;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for pweekday
-- ----------------------------
DROP FUNCTION IF EXISTS `pweekday`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pweekday`(`pdateinput` date) RETURNS varchar(100) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	
	CASE WEEKDAY(pdateinput)
		WHEN 0 THEN RETURN 'دوشنبه';
		WHEN 1 THEN RETURN 'سه شنبه';
		WHEN 2 THEN	RETURN 'چهارشنبه';
		WHEN 3 THEN	RETURN 'پنجشنبه';
		WHEN 4 THEN	RETURN 'جمعه';
		WHEN 5 THEN	RETURN 'شنبه';
		WHEN 6 THEN	RETURN 'یکشنبه';		
	END CASE;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for pyear
-- ----------------------------
DROP FUNCTION IF EXISTS `pyear`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pyear`(`gdate` datetime) RETURNS char(100) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2009-2012 Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0.1

	DECLARE
		i,
		gy, gm, gd,
		g_day_no, j_day_no, j_np,
		jy, jm, jd INT DEFAULT 0; /* Can be unsigned int? */
	DECLARE resout char(100);
	DECLARE ttime CHAR(20);

	SET gy = YEAR(gdate) - 1600;
	SET gm = MONTH(gdate) - 1;
	SET gd = DAY(gdate) - 1;
	SET ttime = TIME(gdate);
	SET g_day_no = ((365 * gy) + __mydiv(gy + 3, 4) - __mydiv(gy + 99, 100) + __mydiv(gy + 399, 400));
	SET i = 0;

	WHILE (i < gm) do
		SET g_day_no = g_day_no + _gdmarray(i);
		SET i = i + 1;
	END WHILE;

	IF gm > 1 and ((gy % 4 = 0 and gy % 100 <> 0)) or gy % 400 = 0 THEN
		SET g_day_no =	g_day_no + 1;
	END IF;
	
	SET g_day_no = g_day_no + gd;
	SET j_day_no = g_day_no - 79;
	SET j_np = j_day_no DIV 12053;
	set j_day_no = j_day_no % 12053;
	SET jy = 979 + 33 * j_np + 4 * __mydiv(j_day_no, 1461);
	SET j_day_no = j_day_no % 1461;

	IF j_day_no >= 366 then
		SET jy = jy + __mydiv(j_day_no - 1, 365);
		SET j_day_no = (j_day_no - 1) % 365;
	END IF;

	SET i = 0;

	WHILE (i < 11 and j_day_no >= _jdmarray(i)) do
		SET j_day_no = j_day_no - _jdmarray(i);
		SET i = i + 1;
	END WHILE;

	SET jm = i + 1;
	SET jd = j_day_no + 1;
	RETURN jy;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for _gdmarray
-- ----------------------------
DROP FUNCTION IF EXISTS `_gdmarray`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_gdmarray`(`m` smallint) RETURNS smallint
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2009-2012 Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0.1

	CASE m
		WHEN 0 THEN RETURN 31;
		WHEN 1 THEN RETURN 28;
		WHEN 2 THEN RETURN 31;
		WHEN 3 THEN RETURN 30;
		WHEN 4 THEN RETURN 31;
		WHEN 5 THEN RETURN 30;
		WHEN 6 THEN RETURN 31;
		WHEN 7 THEN RETURN 31;
		WHEN 8 THEN RETURN 30;
		WHEN 9 THEN RETURN 31;
		WHEN 10 THEN RETURN 30;
		WHEN 11 THEN RETURN 31;
	END CASE;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for _gdmarray2
-- ----------------------------
DROP FUNCTION IF EXISTS `_gdmarray2`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_gdmarray2`(`m` smallint, `k` SMALLINT) RETURNS smallint
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2011-2012  Mehran . M . Spitman
# WebLog :spitman.azdaa.com
# Version V1.0

	CASE m
		WHEN 0 THEN RETURN 31;
		WHEN 1 THEN RETURN 28+k;
		WHEN 2 THEN RETURN 31;
		WHEN 3 THEN RETURN 30;
		WHEN 4 THEN RETURN 31;
		WHEN 5 THEN RETURN 30;
		WHEN 6 THEN RETURN 31;
		WHEN 7 THEN RETURN 31;
		WHEN 8 THEN RETURN 30;
		WHEN 9 THEN RETURN 31;
		WHEN 10 THEN RETURN 30;
		WHEN 11 THEN RETURN 31;
	END CASE;
   

END
;;
delimiter ;

-- ----------------------------
-- Function structure for _jdmarray
-- ----------------------------
DROP FUNCTION IF EXISTS `_jdmarray`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_jdmarray`(`m` smallint) RETURNS smallint
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2009-2012 Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0.1

	CASE m
		WHEN 0 THEN RETURN 31;
		WHEN 1 THEN RETURN 31;
		WHEN 2 THEN RETURN 31;
		WHEN 3 THEN RETURN 31;
		WHEN 4 THEN RETURN 31;
		WHEN 5 THEN RETURN 31;
		WHEN 6 THEN RETURN 30;
		WHEN 7 THEN RETURN 30;
		WHEN 8 THEN RETURN 30;
		WHEN 9 THEN RETURN 30;
		WHEN 10 THEN RETURN 30;
		WHEN 11 THEN RETURN 29;
	END CASE;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for _jdmarray2
-- ----------------------------
DROP FUNCTION IF EXISTS `_jdmarray2`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_jdmarray2`(`m` smallint) RETURNS smallint
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2011-2012 Mehran . M . Spitman
# WebLog :spitman.azdaa.com
# Version V1.0.1

	CASE m
		WHEN 1 THEN RETURN 31;
		WHEN 2 THEN RETURN 31;
		WHEN 3 THEN RETURN 31;
		WHEN 4 THEN RETURN 31;
		WHEN 5 THEN RETURN 31;
		WHEN 6 THEN RETURN 31;
		WHEN 7 THEN RETURN 30;
		WHEN 8 THEN RETURN 30;
		WHEN 9 THEN RETURN 30;
		WHEN 10 THEN RETURN 30;
		WHEN 11 THEN RETURN 30;
		WHEN 12 THEN RETURN 29;
	END CASE;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for __mydiv
-- ----------------------------
DROP FUNCTION IF EXISTS `__mydiv`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `__mydiv`(`a` int, `b` int) RETURNS bigint
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2009-2012 Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0.2

	return FLOOR(a / b);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for __mymod
-- ----------------------------
DROP FUNCTION IF EXISTS `__mymod`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `__mymod`(`a` int, `b` int) RETURNS bigint
    READS SQL DATA
    DETERMINISTIC
BEGIN
# Copyright (C) 2011-2012 Mehran . M . Spitman
# WebLog :spitman.azdaa.com
# Version V1.0.2

	return (a - b * FLOOR(a / b));
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
