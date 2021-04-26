/*
 Navicat MySQL Data Transfer

 Source Server         : server
 Source Server Type    : MySQL
 Source Server Version : 50137
 Source Host           : server:3306
 Source Schema         : school_new

 Target Server Type    : MySQL
 Target Server Version : 50137
 File Encoding         : 65001

 Date: 24/04/2021 17:42:20
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for finance_account
-- ----------------------------
DROP TABLE IF EXISTS `finance_account`;
CREATE TABLE `finance_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `person_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `person_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fisrt_payable` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13239 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of finance_account
-- ----------------------------


-- ----------------------------
-- Table structure for finance_account_bank
-- ----------------------------
DROP TABLE IF EXISTS `finance_account_bank`;
CREATE TABLE `finance_account_bank`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_id` bigint(20) NULL DEFAULT NULL,
  `first_amount` bigint(20) NULL DEFAULT NULL,
  `is_cash` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bank_id`(`bank_id`) USING BTREE,
  CONSTRAINT `finance_account_bank_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `finance_bank` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of finance_account_bank
-- ----------------------------
INSERT INTO `finance_account_bank` VALUES (10, 'حساب مرکزی ملی', 1, 120000, b'0');
INSERT INTO `finance_account_bank` VALUES (20, 'صندوق', NULL, 1000000, b'1');

-- ----------------------------
-- Table structure for finance_bank
-- ----------------------------
DROP TABLE IF EXISTS `finance_bank`;
CREATE TABLE `finance_bank`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NULL DEFAULT NULL,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` bigint(20) NULL DEFAULT NULL,
  `for_how` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_date` date NULL DEFAULT NULL,
  `bank_id` bigint(20) NULL DEFAULT NULL,
  `bank_branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_id` bigint(20) NULL DEFAULT NULL,
  `account_id` bigint(20) NULL DEFAULT NULL,
  `bank_account_id` bigint(20) NULL DEFAULT NULL,
  `pay_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bank_id`(`bank_id`) USING BTREE,
  INDEX `status_id`(`status_id`) USING BTREE,
  INDEX `account_id`(`account_id`) USING BTREE,
  INDEX `bank_account_id`(`bank_account_id`) USING BTREE,
  CONSTRAINT `finance_check_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `finance_bank` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finance_check_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `finance_check_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finance_check_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `finance_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finance_check_ibfk_4` FOREIGN KEY (`bank_account_id`) REFERENCES `finance_account_bank` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 245 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of finance_check
-- ----------------------------

-- ----------------------------
-- Table structure for finance_check_status
-- ----------------------------
DROP TABLE IF EXISTS `finance_check_status`;
CREATE TABLE `finance_check_status`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_person_id` bigint(20) NULL DEFAULT NULL,
  `amount` bigint(20) NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_person_id`(`account_person_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  CONSTRAINT `finance_factor_ibfk_1` FOREIGN KEY (`account_person_id`) REFERENCES `finance_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finance_factor_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `finance_factor_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30296 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of finance_factor
-- ----------------------------

-- ----------------------------
-- Table structure for finance_factor_type
-- ----------------------------
DROP TABLE IF EXISTS `finance_factor_type`;
CREATE TABLE `finance_factor_type`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_date` datetime NULL DEFAULT NULL,
  `amount` bigint(20) NULL DEFAULT NULL,
  `account_bank_id` bigint(20) NULL DEFAULT NULL,
  `account_person_id` bigint(20) NULL DEFAULT NULL,
  `receive_pay_type_id` bigint(20) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_bank_id`(`account_bank_id`) USING BTREE,
  INDEX `receive_pay_type_id`(`receive_pay_type_id`) USING BTREE,
  INDEX `account_person_id`(`account_person_id`) USING BTREE,
  CONSTRAINT `finance_receive_payment_ibfk_1` FOREIGN KEY (`account_bank_id`) REFERENCES `finance_account_bank` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finance_receive_payment_ibfk_3` FOREIGN KEY (`receive_pay_type_id`) REFERENCES `finance_receive_pay_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finance_receive_payment_ibfk_4` FOREIGN KEY (`account_person_id`) REFERENCES `finance_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37893 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of finance_receive_payment
-- ----------------------------

-- ----------------------------
-- Table structure for reg_base
-- ----------------------------
DROP TABLE IF EXISTS `reg_base`;
CREATE TABLE `reg_base`  (
  `base_id` bigint(20) NOT NULL DEFAULT 0,
  `base_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`base_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `base_id` bigint(20) NOT NULL,
  `base_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`base_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
-- Table structure for reg_field
-- ----------------------------
DROP TABLE IF EXISTS `reg_field`;
CREATE TABLE `reg_field`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reg_field
-- ----------------------------
INSERT INTO `reg_field` VALUES (1, 'ریاضی فیزیک');
INSERT INTO `reg_field` VALUES (2, 'علوم تجربی');
INSERT INTO `reg_field` VALUES (3, 'ادبیات و علوم انسانی');
INSERT INTO `reg_field` VALUES (4, 'گرافیک رایانه ای');
INSERT INTO `reg_field` VALUES (5, 'بزرگسالان');
INSERT INTO `reg_field` VALUES (6, 'عمومي بزرگسالان');
INSERT INTO `reg_field` VALUES (7, 'نقشه كشي ساختمان');
INSERT INTO `reg_field` VALUES (8, ' تعمير ماشين هاي ثابت کشاورزی');
INSERT INTO `reg_field` VALUES (9, 'چهره سازي');
INSERT INTO `reg_field` VALUES (10, 'ماشين هاي الكتريكي');
INSERT INTO `reg_field` VALUES (11, 'برق صنعتي');
INSERT INTO `reg_field` VALUES (12, 'راهنمایی بزرگسالان');
INSERT INTO `reg_field` VALUES (13, 'متوسطه اول بزرگسالان');
INSERT INTO `reg_field` VALUES (14, 'پرورش ماهی');
INSERT INTO `reg_field` VALUES (15, 'تعمير خودرو');

-- ----------------------------
-- Table structure for reg_identifier_code
-- ----------------------------
DROP TABLE IF EXISTS `reg_identifier_code`;
CREATE TABLE `reg_identifier_code`  (
  `id` int(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reg_organization
-- ----------------------------
INSERT INTO `reg_organization` VALUES (1, 'پيام نو');
INSERT INTO `reg_organization` VALUES (2, 'دهنو');
INSERT INTO `reg_organization` VALUES (3, 'عاشق آباد');
INSERT INTO `reg_organization` VALUES (4, 'رهنان');
INSERT INTO `reg_organization` VALUES (5, 'مجازی');

-- ----------------------------
-- Table structure for reg_receivable
-- ----------------------------
DROP TABLE IF EXISTS `reg_receivable`;
CREATE TABLE `reg_receivable`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `finance_factor_id` bigint(20) NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `reg_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `finance_factor_id`(`finance_factor_id`) USING BTREE,
  INDEX `reg_id`(`reg_id`) USING BTREE,
  CONSTRAINT `reg_receivable_ibfk_1` FOREIGN KEY (`finance_factor_id`) REFERENCES `finance_factor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_receivable_ibfk_2` FOREIGN KEY (`reg_id`) REFERENCES `reg_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30296 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reg_receivable
-- ----------------------------

-- ----------------------------
-- Table structure for reg_reg_check
-- ----------------------------
DROP TABLE IF EXISTS `reg_reg_check`;
CREATE TABLE `reg_reg_check`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NULL DEFAULT NULL,
  `reg_id` bigint(20) NULL DEFAULT NULL,
  `finance_check_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reg_id`(`reg_id`) USING BTREE,
  INDEX `finance_check_id`(`finance_check_id`) USING BTREE,
  CONSTRAINT `reg_reg_check_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `reg_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_reg_check_ibfk_2` FOREIGN KEY (`finance_check_id`) REFERENCES `finance_check` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 245 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reg_reg_check
-- ----------------------------

-- ----------------------------
-- Table structure for reg_reg_payment
-- ----------------------------
DROP TABLE IF EXISTS `reg_reg_payment`;
CREATE TABLE `reg_reg_payment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NULL DEFAULT NULL,
  `reg_id` bigint(20) NULL DEFAULT NULL,
  `finance_id` bigint(20) NULL DEFAULT NULL,
  `next_payment` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reg_id`(`reg_id`) USING BTREE,
  INDEX `finance_id`(`finance_id`) USING BTREE,
  CONSTRAINT `reg_reg_payment_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `reg_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_reg_payment_ibfk_2` FOREIGN KEY (`finance_id`) REFERENCES `finance_receive_payment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37802 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reg_reg_payment
-- ----------------------------

-- ----------------------------
-- Table structure for reg_registration
-- ----------------------------
DROP TABLE IF EXISTS `reg_registration`;
CREATE TABLE `reg_registration`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reg_date` datetime NULL DEFAULT NULL,
  `st_id` bigint(20) NULL DEFAULT NULL,
  `field_id` bigint(20) NULL DEFAULT NULL,
  `term_id` bigint(20) NULL DEFAULT NULL,
  `level_id` bigint(20) NULL DEFAULT NULL,
  `theory_units` double(11, 2) NULL DEFAULT NULL,
  `actional_units` int(11) NULL DEFAULT NULL,
  `fix_salary` bigint(20) NULL DEFAULT NULL,
  `actional_salary` bigint(20) NULL DEFAULT NULL,
  `theory_salary` bigint(20) NULL DEFAULT NULL,
  `other_salary_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `other_salary_amount` bigint(20) NULL DEFAULT NULL,
  `total_salary` bigint(20) NULL DEFAULT NULL,
  `off_amount` bigint(20) NULL DEFAULT NULL,
  `off_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `base_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `st_id`(`st_id`) USING BTREE,
  INDEX `field_id`(`field_id`) USING BTREE,
  INDEX `term_id`(`term_id`) USING BTREE,
  INDEX `level_id`(`level_id`) USING BTREE,
  INDEX `base_id`(`base_id`) USING BTREE,
  CONSTRAINT `reg_registration_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `reg_student` (`student_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_registration_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `reg_field` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_registration_ibfk_3` FOREIGN KEY (`term_id`) REFERENCES `reg_term` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_registration_ibfk_4` FOREIGN KEY (`level_id`) REFERENCES `reg_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_registration_ibfk_5` FOREIGN KEY (`base_id`) REFERENCES `reg_base_level` (`base_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30298 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reg_registration
-- ----------------------------

-- ----------------------------
-- Table structure for reg_salary_param
-- ----------------------------
DROP TABLE IF EXISTS `reg_salary_param`;
CREATE TABLE `reg_salary_param`  (
  `term_id` bigint(20) NOT NULL DEFAULT 0,
  `level_id` bigint(20) NOT NULL DEFAULT 0,
  `fix_salary` bigint(20) NULL DEFAULT NULL,
  `action_salary` bigint(20) NULL DEFAULT NULL,
  `theory_salary` bigint(20) NULL DEFAULT NULL,
  `ac_th_rate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`term_id`, `level_id`) USING BTREE,
  INDEX `level_id`(`level_id`) USING BTREE,
  CONSTRAINT `reg_salary_param_ibfk_1` FOREIGN KEY (`term_id`) REFERENCES `reg_term` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_salary_param_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `reg_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reg_salary_param
-- ----------------------------
INSERT INTO `reg_salary_param` VALUES (8901, 1, 1000, 1230, 111, NULL);
INSERT INTO `reg_salary_param` VALUES (8901, 2, 180000, 35000, 20000, NULL);
INSERT INTO `reg_salary_param` VALUES (8901, 4, 1000, 10, 10, NULL);
INSERT INTO `reg_salary_param` VALUES (9201, 1, 100000, 20, 20, NULL);
INSERT INTO `reg_salary_param` VALUES (9201, 2, 180000, 120, 130, NULL);
INSERT INTO `reg_salary_param` VALUES (9201, 4, 1550, 133, 145, NULL);
INSERT INTO `reg_salary_param` VALUES (9201, 5, 458, 100, 12, NULL);
INSERT INTO `reg_salary_param` VALUES (9202, 1, 20000, 800, 800, NULL);
INSERT INTO `reg_salary_param` VALUES (9202, 2, 480000, 480, 9000, NULL);
INSERT INTO `reg_salary_param` VALUES (9303, 1, 230000, 0, 80000, NULL);
INSERT INTO `reg_salary_param` VALUES (9303, 2, 230000, 0, 90000, NULL);
INSERT INTO `reg_salary_param` VALUES (9303, 4, 0, 0, 30000, NULL);
INSERT INTO `reg_salary_param` VALUES (9304, 1, 500000, 0, 100000, NULL);
INSERT INTO `reg_salary_param` VALUES (9304, 2, 500000, 0, 120000, NULL);
INSERT INTO `reg_salary_param` VALUES (9304, 4, 500000, 0, 120000, NULL);
INSERT INTO `reg_salary_param` VALUES (9304, 5, 460000, NULL, 80000, NULL);
INSERT INTO `reg_salary_param` VALUES (9305, 1, 500000, 0, 100000, NULL);
INSERT INTO `reg_salary_param` VALUES (9305, 2, 500000, 0, 120000, NULL);
INSERT INTO `reg_salary_param` VALUES (9305, 4, 500000, 0, 120000, NULL);
INSERT INTO `reg_salary_param` VALUES (9306, 1, 250000, 0, 100000, NULL);
INSERT INTO `reg_salary_param` VALUES (9306, 2, 250000, 0, 120000, NULL);
INSERT INTO `reg_salary_param` VALUES (9306, 4, 250000, 0, 40000, NULL);
INSERT INTO `reg_salary_param` VALUES (9307, 1, 560000, 0, 140000, NULL);
INSERT INTO `reg_salary_param` VALUES (9307, 2, 560000, 0, 150000, NULL);
INSERT INTO `reg_salary_param` VALUES (9307, 4, 560000, 0, 150000, NULL);
INSERT INTO `reg_salary_param` VALUES (9308, 1, 560000, 0, 140000, NULL);
INSERT INTO `reg_salary_param` VALUES (9308, 2, 560000, 0, 150000, NULL);
INSERT INTO `reg_salary_param` VALUES (9308, 4, 560000, 0, 150000, NULL);
INSERT INTO `reg_salary_param` VALUES (9309, 1, 280000, 0, 140000, NULL);
INSERT INTO `reg_salary_param` VALUES (9309, 2, 280000, 0, 150000, NULL);
INSERT INTO `reg_salary_param` VALUES (9309, 4, 0, 0, 50000, NULL);
INSERT INTO `reg_salary_param` VALUES (9310, 1, 600000, 0, 160000, NULL);
INSERT INTO `reg_salary_param` VALUES (9310, 2, 600000, 0, 170000, NULL);
INSERT INTO `reg_salary_param` VALUES (9310, 4, 600000, 0, 170000, NULL);
INSERT INTO `reg_salary_param` VALUES (9311, 1, 600000, 0, 160000, NULL);
INSERT INTO `reg_salary_param` VALUES (9311, 2, 600000, 0, 170000, NULL);
INSERT INTO `reg_salary_param` VALUES (9311, 4, 600000, 0, 170000, NULL);
INSERT INTO `reg_salary_param` VALUES (9312, 1, 300000, 0, 160000, NULL);
INSERT INTO `reg_salary_param` VALUES (9312, 2, 300000, 0, 170000, NULL);
INSERT INTO `reg_salary_param` VALUES (9312, 4, 0, 0, 60000, NULL);
INSERT INTO `reg_salary_param` VALUES (9313, 1, 660000, 0, 180000, NULL);
INSERT INTO `reg_salary_param` VALUES (9313, 2, 660000, 0, 200000, NULL);
INSERT INTO `reg_salary_param` VALUES (9313, 4, 660000, 0, 200000, NULL);
INSERT INTO `reg_salary_param` VALUES (9314, 1, 660000, 0, 180000, NULL);
INSERT INTO `reg_salary_param` VALUES (9314, 2, 660000, 0, 200000, NULL);
INSERT INTO `reg_salary_param` VALUES (9314, 4, 660000, 0, 200000, NULL);
INSERT INTO `reg_salary_param` VALUES (9315, 1, 330000, 0, 180000, NULL);
INSERT INTO `reg_salary_param` VALUES (9315, 2, 330000, 0, 200000, NULL);
INSERT INTO `reg_salary_param` VALUES (9315, 4, 0, 0, 70000, NULL);
INSERT INTO `reg_salary_param` VALUES (9316, 1, 860000, 0, 230000, NULL);
INSERT INTO `reg_salary_param` VALUES (9316, 2, 860000, 0, 250000, NULL);
INSERT INTO `reg_salary_param` VALUES (9316, 4, 860000, 0, 250000, NULL);
INSERT INTO `reg_salary_param` VALUES (9317, 1, 860000, 0, 230000, NULL);
INSERT INTO `reg_salary_param` VALUES (9317, 2, 860000, 0, 250000, NULL);
INSERT INTO `reg_salary_param` VALUES (9317, 4, 860000, 0, 250000, NULL);
INSERT INTO `reg_salary_param` VALUES (9318, 1, 430000, 0, 230000, NULL);
INSERT INTO `reg_salary_param` VALUES (9318, 2, 430000, 0, 250000, NULL);
INSERT INTO `reg_salary_param` VALUES (9318, 4, 430000, 0, 85000, NULL);
INSERT INTO `reg_salary_param` VALUES (9319, 1, 1000000, 0, 280000, NULL);
INSERT INTO `reg_salary_param` VALUES (9319, 2, 1000000, 0, 300000, NULL);
INSERT INTO `reg_salary_param` VALUES (9319, 4, 1000000, 0, 300000, NULL);
INSERT INTO `reg_salary_param` VALUES (9320, 1, 1000000, 0, 280000, NULL);
INSERT INTO `reg_salary_param` VALUES (9320, 2, 1000000, 0, 300000, NULL);
INSERT INTO `reg_salary_param` VALUES (9320, 4, 1000000, 0, 300000, NULL);

-- ----------------------------
-- Table structure for reg_school
-- ----------------------------
DROP TABLE IF EXISTS `reg_school`;
CREATE TABLE `reg_school`  (
  `school_id` bigint(20) NOT NULL DEFAULT 0,
  `school_description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_db_service` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_db_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_host` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`school_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `famili` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `national_code` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identifier_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identifier_serial` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identifier_char` int(255) NULL DEFAULT NULL,
  `student_code` bigint(20) NOT NULL DEFAULT 0,
  `father_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_id` bigint(20) NULL DEFAULT NULL,
  `org_unit_id` bigint(20) NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified` datetime NULL DEFAULT NULL,
  `level_id_last` bigint(20) NULL DEFAULT NULL,
  `field_id_last` bigint(20) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `archive_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pish_madrak` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `diplom_madrak` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`student_code`) USING BTREE,
  INDEX `status_id`(`status_id`) USING BTREE,
  INDEX `org_unit_id`(`org_unit_id`) USING BTREE,
  INDEX `level_id_last`(`level_id_last`) USING BTREE,
  INDEX `field_id_last`(`field_id_last`) USING BTREE,
  CONSTRAINT `reg_student_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `reg_student_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_student_ibfk_3` FOREIGN KEY (`org_unit_id`) REFERENCES `reg_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_student_ibfk_4` FOREIGN KEY (`level_id_last`) REFERENCES `reg_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_student_ibfk_5` FOREIGN KEY (`field_id_last`) REFERENCES `reg_field` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reg_student
-- ----------------------------

-- ----------------------------
-- Table structure for reg_student_account
-- ----------------------------
DROP TABLE IF EXISTS `reg_student_account`;
CREATE TABLE `reg_student_account`  (
  `st_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acc_id` bigint(20) NOT NULL DEFAULT 0,
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`st_id`, `acc_id`) USING BTREE,
  INDEX `acc_id`(`acc_id`) USING BTREE,
  CONSTRAINT `reg_student_account_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `reg_student` (`student_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_student_account_ibfk_2` FOREIGN KEY (`acc_id`) REFERENCES `finance_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1111111111112 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reg_student_account
-- ----------------------------
-- ----------------------------
-- Table structure for reg_student_status
-- ----------------------------
DROP TABLE IF EXISTS `reg_student_status`;
CREATE TABLE `reg_student_status`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_date` date NULL DEFAULT NULL,
  `to_date` date NULL DEFAULT NULL,
  `is_current` bit(1) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `dore` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9321 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reg_term
-- ----------------------------
INSERT INTO `reg_term` VALUES (8901, 'نيمسال اول 89-90', '1963-07-01', '2000-03-31', b'0', 99, 6);
INSERT INTO `reg_term` VALUES (8902, 'نيمسال دوم 90-89', '2011-01-21', '2011-06-21', b'0', 0, 0);
INSERT INTO `reg_term` VALUES (8903, 'نيمسال تابستاني 90-89', '2011-06-22', '2011-09-21', b'0', 0, 0);
INSERT INTO `reg_term` VALUES (9001, 'نيمسال اول 91-90', '2011-09-23', '2012-01-20', b'0', 0, 0);
INSERT INTO `reg_term` VALUES (9002, 'نيمسال دوم 91-90', '2012-01-21', '2012-06-20', b'0', 0, 0);
INSERT INTO `reg_term` VALUES (9003, 'نيمسال تابستاني 91-90', '2012-06-21', '2012-09-20', b'0', 0, 0);
INSERT INTO `reg_term` VALUES (9101, 'نيمسال اول 92-91', '2012-09-22', '2013-01-19', b'0', 0, 0);
INSERT INTO `reg_term` VALUES (9102, 'نيمسال دوم 92-91', NULL, NULL, b'0', 0, 0);
INSERT INTO `reg_term` VALUES (9103, 'نيمسال تابستاني 92-91', NULL, NULL, b'0', 0, 0);
INSERT INTO `reg_term` VALUES (9201, 'نيمسال اول 93-92', NULL, NULL, b'0', 0, 0);
INSERT INTO `reg_term` VALUES (9202, 'نيمسال دوم 93-92', NULL, NULL, b'0', 0, 0);
INSERT INTO `reg_term` VALUES (9203, 'نيمسال تابستاني 93-92', NULL, NULL, b'0', 0, 0);
INSERT INTO `reg_term` VALUES (9301, 'نيمسال اول 94-93', NULL, NULL, b'0', 0, 0);
INSERT INTO `reg_term` VALUES (9302, 'نيمسال دوم 94-93', NULL, NULL, b'0', 93, 5);
INSERT INTO `reg_term` VALUES (9303, 'نيمسال تابستاني 94-93', NULL, NULL, b'0', 0, 0);
INSERT INTO `reg_term` VALUES (9304, 'نيمسال اول95-94', '2015-09-23', NULL, b'0', 94, 4);
INSERT INTO `reg_term` VALUES (9305, 'نيمسال دوم 95-94', '2016-01-21', NULL, b'0', 94, 5);
INSERT INTO `reg_term` VALUES (9306, 'نيمسال تابستاني 95-94', '2016-01-21', '2016-09-22', b'0', 94, 6);
INSERT INTO `reg_term` VALUES (9307, 'نيمسال اول  96-95 ', '2016-09-22', '2017-01-19', b'0', 95, 4);
INSERT INTO `reg_term` VALUES (9308, 'نيمسال دوم  96-95 ', '2017-01-20', '2017-06-21', b'0', 95, 4);
INSERT INTO `reg_term` VALUES (9309, 'نيمسال تابستاني96-95', '2017-01-20', '2017-09-21', b'0', 95, 6);
INSERT INTO `reg_term` VALUES (9310, 'نيمسال اول 97-96', '2018-01-21', '2018-06-21', b'0', 96, 4);
INSERT INTO `reg_term` VALUES (9311, 'نيمسال دوم 97-96', '2018-01-21', '2018-09-21', b'0', 96, 6);
INSERT INTO `reg_term` VALUES (9312, 'نیمسال تابستان 97-96', '2018-09-23', '2019-01-20', b'0', 97, 4);
INSERT INTO `reg_term` VALUES (9313, 'نیمسال اول 98-97', '2018-09-23', '2019-01-20', b'0', 97, 4);
INSERT INTO `reg_term` VALUES (9314, 'نيمسال دوم 98-97', '2019-01-21', '2019-06-21', b'0', 97, 5);
INSERT INTO `reg_term` VALUES (9315, 'نيمسال تابستاني98-97', '2019-01-21', '2019-09-21', b'0', 97, 6);
INSERT INTO `reg_term` VALUES (9316, 'نيمسال اول 98-99', '2019-09-23', '2020-01-20', b'0', 98, 4);
INSERT INTO `reg_term` VALUES (9317, 'نيمسال دوم  98-99', '2020-01-21', '2020-06-19', b'0', 98, 5);
INSERT INTO `reg_term` VALUES (9318, 'نيمسال تابستان 98-99', '2010-09-23', '2011-01-20', b'0', 89, 6);
INSERT INTO `reg_term` VALUES (9319, 'نبم سال اول400-99', '2020-09-22', '2021-01-19', b'0', 99, 4);
INSERT INTO `reg_term` VALUES (9320, 'نیمسال دوم 1400-99', '2021-01-20', '2021-06-21', b'1', 99, 5);

-- ----------------------------
-- Table structure for st_govahi_vaziat
-- ----------------------------
DROP TABLE IF EXISTS `st_govahi_vaziat`;
CREATE TABLE `st_govahi_vaziat`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `st_id` bigint(20) NULL DEFAULT NULL,
  `govahi_letter_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `govahi_letter_date` datetime NULL DEFAULT NULL,
  `govahi_base` bigint(20) NULL DEFAULT NULL,
  `govahi_level` bigint(20) NULL DEFAULT NULL,
  `govahi_last_date` datetime NULL DEFAULT NULL,
  `govahi_last_status` int(11) NOT NULL DEFAULT 0,
  `govahi_last_madrak` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `govahi_edit_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `st_id`(`st_id`) USING BTREE,
  INDEX `govahi_base`(`govahi_base`) USING BTREE,
  INDEX `govahi_level`(`govahi_level`) USING BTREE,
  CONSTRAINT `st_govahi_vaziat_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `reg_student` (`student_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `st_govahi_vaziat_ibfk_2` FOREIGN KEY (`govahi_base`) REFERENCES `reg_base` (`base_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `st_govahi_vaziat_ibfk_3` FOREIGN KEY (`govahi_level`) REFERENCES `reg_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of st_govahi_vaziat
-- ----------------------------

-- ----------------------------
-- Table structure for temp_test2
-- ----------------------------
DROP TABLE IF EXISTS `temp_test2`;
CREATE TABLE `temp_test2`  (
  `MajorCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `StudentCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `TimeDore` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Timeyear` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `NationalCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `StudentCode1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FirstName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`StudentCode`, `TimeDore`, `Timeyear`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of temp_test2
-- ----------------------------

-- ----------------------------
-- Table structure for test_table
-- ----------------------------
DROP TABLE IF EXISTS `test_table`;
CREATE TABLE `test_table`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `amount` int(11) NULL DEFAULT NULL,
  `d` double(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `st_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `st_family` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `st_national_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `st_code` bigint(11) NOT NULL,
  PRIMARY KEY (`st_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tmp_st
-- ----------------------------


-- ----------------------------
-- Function structure for gdate
-- ----------------------------
DROP FUNCTION IF EXISTS `gdate`;
delimiter ;;
CREATE FUNCTION `gdate`(`jy` smallint, `jm` smallint, `jd` smallint)
 RETURNS datetime
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
CREATE FUNCTION `gdatestr`(`jdat` char(10))
 RETURNS datetime
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
CREATE FUNCTION `pdate`(`gdate` datetime)
 RETURNS char(100) CHARSET utf8
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
CREATE FUNCTION `pday`(`gdate` datetime)
 RETURNS char(100) CHARSET utf8
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
CREATE FUNCTION `PMONTH`(`gdate` datetime)
 RETURNS char(100) CHARSET utf8
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
CREATE FUNCTION `pmonthname`(`gdate` datetime)
 RETURNS varchar(100) CHARSET utf8
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
-- Function structure for pyear
-- ----------------------------
DROP FUNCTION IF EXISTS `pyear`;
delimiter ;;
CREATE FUNCTION `pyear`(`gdate` datetime)
 RETURNS char(100) CHARSET utf8
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
CREATE FUNCTION `_gdmarray`(`m` smallint)
 RETURNS smallint(2)
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
CREATE FUNCTION `_gdmarray2`(`m` smallint, `k` SMALLINT)
 RETURNS smallint(2)
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
CREATE FUNCTION `_jdmarray`(`m` smallint)
 RETURNS smallint(2)
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
CREATE FUNCTION `_jdmarray2`(`m` smallint)
 RETURNS smallint(2)
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
CREATE FUNCTION `__mydiv`(`a` int, `b` int)
 RETURNS bigint(20)
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
CREATE FUNCTION `__mymod`(`a` int, `b` int)
 RETURNS bigint(20)
BEGIN
# Copyright (C) 2011-2012 Mehran . M . Spitman
# WebLog :spitman.azdaa.com
# Version V1.0.2

	return (a - b * FLOOR(a / b));
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
-- View structure for bank_account_v
-- ----------------------------
DROP VIEW IF EXISTS `bank_account_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bank_account_v` AS select `finance_account_bank`.`id` AS `id`,`finance_account_bank`.`name` AS `name`,`finance_account_bank`.`bank_id` AS `bank_id`,`finance_account_bank`.`first_amount` AS `first_amount`,`finance_account_bank`.`is_cash` AS `is_cash`,`finance_bank`.`name` AS `bank_name` from (`finance_account_bank` left join `finance_bank` on((`finance_account_bank`.`bank_id` = `finance_bank`.`id`))) ;

-- ----------------------------
-- View structure for check_v
-- ----------------------------
DROP VIEW IF EXISTS `check_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `check_v` AS select `finance_check`.`id` AS `id`,`finance_check`.`created_date` AS `created_date`,`finance_check`.`number` AS `number`,`finance_check`.`amount` AS `amount`,`finance_check`.`for_how` AS `for_how`,`finance_check`.`check_date` AS `check_date`,`finance_check`.`bank_id` AS `bank_id`,`finance_check`.`bank_branch` AS `bank_branch`,`finance_check`.`description` AS `description`,`finance_check`.`status_id` AS `status_id`,`finance_check`.`account_id` AS `account_id`,`finance_check`.`bank_account_id` AS `bank_account_id`,`finance_bank`.`name` AS `bank_name`,`finance_check_status`.`name` AS `status_name`,`finance_account`.`name` AS `account_name`,`finance_account`.`phone` AS `phone`,`finance_account`.`person_name` AS `person_name`,`finance_account`.`person_mobile` AS `person_mobile`,`finance_account`.`fax` AS `fax`,`finance_account`.`create_date` AS `create_date`,`finance_account`.`address` AS `address`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`bank_account_v`.`name` AS `bank_account_name`,`bank_account_v`.`bank_id` AS `bank_account_b_id`,`bank_account_v`.`first_amount` AS `first_amount`,`bank_account_v`.`is_cash` AS `is_cash`,`bank_account_v`.`bank_name` AS `bank_account_b_name` from ((((`finance_check` left join `finance_bank` on((`finance_check`.`bank_id` = `finance_bank`.`id`))) left join `finance_check_status` on((`finance_check`.`status_id` = `finance_check_status`.`id`))) left join `finance_account` on((`finance_check`.`account_id` = `finance_account`.`id`))) left join `bank_account_v` on((`finance_check`.`bank_account_id` = `bank_account_v`.`id`))) ;



-- ----------------------------
-- View structure for reg_check_v
-- ----------------------------
DROP VIEW IF EXISTS `reg_check_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_check_v` AS select `reg_reg_check`.`id` AS `id`,`reg_reg_check`.`create_date` AS `create_date`,`reg_reg_check`.`reg_id` AS `reg_id`,`reg_reg_check`.`finance_check_id` AS `finance_check_id`,`check_v`.`created_date` AS `created_date`,`check_v`.`number` AS `number`,`check_v`.`amount` AS `amount`,`check_v`.`for_how` AS `for_how`,`check_v`.`check_date` AS `check_date`,`check_v`.`bank_id` AS `bank_id`,`check_v`.`bank_branch` AS `bank_branch`,`check_v`.`description` AS `description`,`check_v`.`status_id` AS `status_id`,`check_v`.`account_id` AS `account_id`,`check_v`.`bank_account_id` AS `bank_account_id`,`check_v`.`bank_name` AS `bank_name`,`check_v`.`status_name` AS `status_name`,`check_v`.`account_name` AS `account_name`,`check_v`.`phone` AS `phone`,`check_v`.`person_name` AS `person_name`,`check_v`.`person_mobile` AS `person_mobile`,`check_v`.`fax` AS `fax`,`check_v`.`create_date` AS `b_acc_create_date`,`check_v`.`address` AS `address`,`check_v`.`fisrt_payable` AS `fisrt_payable`,`check_v`.`bank_account_name` AS `bank_account_name`,`check_v`.`bank_account_b_id` AS `bank_account_b_id`,`check_v`.`first_amount` AS `first_amount`,`check_v`.`is_cash` AS `is_cash`,`check_v`.`bank_account_b_name` AS `bank_account_b_name` from (`reg_reg_check` join `check_v` on((`reg_reg_check`.`finance_check_id` = `check_v`.`id`))) ;



-- View structure for registration_view
-- ----------------------------
DROP VIEW IF EXISTS `registration_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `registration_view` AS select `reg_registration`.`reg_date` AS `reg_date`,`reg_registration`.`theory_units` AS `theory_units`,`reg_registration`.`actional_units` AS `actional_units`,`reg_registration`.`fix_salary` AS `fix_salary`,`reg_registration`.`theory_salary` AS `theory_salary`,`reg_registration`.`actional_salary` AS `actional_salary`,`reg_registration`.`other_salary_comment` AS `other_salary_comment`,`reg_registration`.`other_salary_amount` AS `other_salary_amount`,`reg_registration`.`total_salary` AS `total_salary`,`reg_registration`.`off_amount` AS `off_amount`,`reg_registration`.`off_comment` AS `off_comment`,`reg_term`.`name` AS `term_name`,`reg_field`.`name` AS `field_name`,`reg_student`.`name` AS `name`,`reg_student`.`famili` AS `famili`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`identifier_code` AS `identifier_code`,`reg_student`.`identifier_serial` AS `identifier_serial`,`reg_student`.`identifier_char` AS `identifier_char`,`reg_student`.`student_code` AS `student_code`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `description`,`reg_student`.`address` AS `address`,`reg_student`.`mobile` AS `mobile`,`reg_student`.`phone` AS `phone`,`reg_student`.`archive_code` AS `archive_code`,`reg_organization`.`name` AS `org_name`,`reg_registration`.`id` AS `id`,`reg_student_status`.`name` AS `status_name`,`reg_student_status`.`id` AS `status_id`,`reg_organization`.`id` AS `st_org_id`,`reg_field`.`id` AS `field_id`,`reg_term`.`is_current` AS `reg_term_is_current`,`reg_term`.`id` AS `reg_term_id`,`reg_organization`.`id` AS `org_unit_id`,`reg_level`.`id` AS `level_id`,`reg_level`.`name` AS `level_name`,`reg_student`.`created_date` AS `created_date`,`reg_student`.`last_modified` AS `last_modified`,`reg_term`.`from_date` AS `from_date`,`reg_student`.`pish_madrak` AS `pish_madrak`,`reg_student`.`diplom_madrak` AS `diplom_madrak` from ((((((`reg_registration` join `reg_term` on((`reg_registration`.`term_id` = `reg_term`.`id`))) join `reg_field` on((`reg_registration`.`field_id` = `reg_field`.`id`))) join `reg_student` on((`reg_registration`.`st_id` = `reg_student`.`student_code`))) join `reg_organization` on((`reg_student`.`org_unit_id` = `reg_organization`.`id`))) join `reg_student_status` on((`reg_student`.`status_id` = `reg_student_status`.`id`))) join `reg_level` on((`reg_registration`.`level_id` = `reg_level`.`id`))) ;


-- View structure for last_registration_students
-- ----------------------------
DROP VIEW IF EXISTS `last_registration_students`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `last_registration_students` AS SELECT
Max(registration_view.reg_term_id) AS last_term,
registration_view.student_code AS student_code,
registration_view.famili AS famili,
registration_view.status_name AS status_name,
registration_view.level_id AS level_id,
registration_view.level_name AS level_name,
registration_view.mobile AS mobile,
registration_view.org_unit_id AS org_unit_id,
registration_view.reg_term_is_current AS reg_term_is_current,
registration_view.status_id AS status_id,
registration_view.archive_code AS archive_code,
registration_view.national_code AS national_code,
registration_view.father_name AS father_name,
registration_view.description AS description,
registration_view.org_name AS org_name,
registration_view.pish_madrak AS pish_madrak,
registration_view.diplom_madrak AS diplom_madrak,
registration_view.term_name AS term_name,
registration_view.field_name AS field_name,
registration_view.`name`,
registration_view.date_of_birth,
registration_view.phone,
registration_view.st_org_id,
registration_view.field_id
from `registration_view`
group by `registration_view`.`student_code`
order by `registration_view`.`reg_term_id` desc ;
-- ----------------------------
-- View structure for accounts_accounting_v
-- ----------------------------
DROP VIEW IF EXISTS `accounts_accounting_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `accounts_accounting_v` AS select `accounts`.`id` AS `id`,`accounts`.`name` AS `name`,(select sum(`finance_receive_payment`.`amount`) AS `all_payments` from `finance_receive_payment` where (`finance_receive_payment`.`account_person_id` = `accounts`.`id`)) AS `all_amounts`,(select sum(`finance_factor`.`amount`) AS `all_factors` from `finance_factor` where (`finance_factor`.`account_person_id` = `accounts`.`id`)) AS `all_factors`,(select sum(`finance_check`.`amount`) AS `all_amount` from `finance_check` where ((`finance_check`.`status_id` <> '1') and (`finance_check`.`account_id` = `accounts`.`id`))) AS `waiting_checks` from `finance_account` `accounts` ;

-- ----------------------------
-- View structure for account_student_view
-- ----------------------------
DROP VIEW IF EXISTS `account_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `account_student_view` AS select `reg_student_account`.`st_id` AS `st_id`,`reg_student_account`.`acc_id` AS `acc_id`,`reg_student_account`.`create_date` AS `create_date`,`finance_account`.`name` AS `name`,`finance_account`.`person_name` AS `person_name`,`finance_account`.`person_mobile` AS `person_mobile`,`finance_account`.`fax` AS `fax`,`finance_account`.`address` AS `address`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`finance_account`.`phone` AS `phone`,`finance_account`.`create_date` AS `acc_create_date`,`reg_student`.`name` AS `st_name`,`reg_student`.`famili` AS `st_famili`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`identifier_serial` AS `identifier_serial`,`reg_student`.`identifier_char` AS `identifier_char`,`reg_student`.`student_code` AS `student_code`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `description`,`reg_student`.`status_id` AS `status_id`,`reg_student`.`org_unit_id` AS `org_unit_id`,`reg_student`.`created_date` AS `created_date`,`reg_student`.`last_modified` AS `last_modified`,`reg_student`.`level_id_last` AS `level_id_last`,`reg_student`.`field_id_last` AS `field_id_last`,`reg_student`.`address` AS `st_address`,`reg_student`.`mobile` AS `st_mobile`,`reg_student`.`phone` AS `st_phone`,`reg_student`.`archive_code` AS `archive_code` from ((`reg_student_account` join `finance_account` on((`reg_student_account`.`acc_id` = `finance_account`.`id`))) join `reg_student` on((`reg_student_account`.`st_id` = `reg_student`.`student_code`))) ;

-- ----------------------------
-- View structure for all_terms_checks_payments
-- ----------------------------
DROP VIEW IF EXISTS `all_terms_checks_payments`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_terms_checks_payments` AS select `reg_term`.`id` AS `id`,`reg_term`.`name` AS `name`,sum(`reg_check_v`.`amount`) AS `total_check_amout` from ((`reg_term` join `reg_check_v`) join `reg_registration`) where ((`reg_registration`.`id` = `reg_check_v`.`reg_id`) and (`reg_registration`.`term_id` = `reg_term`.`id`) and (`reg_check_v`.`status_id` <> '1')) group by `reg_term`.`id` ;

-- ----------------------------


-- View structure for receive_pay_v
-- ----------------------------
DROP VIEW IF EXISTS `receive_pay_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `receive_pay_v` AS select `finance_receive_payment`.`id` AS `id`,`finance_receive_payment`.`event_date` AS `event_date`,`finance_receive_payment`.`amount` AS `amount`,`finance_receive_payment`.`account_bank_id` AS `account_bank_id`,`finance_receive_payment`.`account_person_id` AS `account_person_id`,`finance_receive_payment`.`receive_pay_type_id` AS `receive_pay_type_id`,`finance_receive_payment`.`description` AS `description`,`finance_receive_payment`.`code` AS `code`,`bank_account_v`.`name` AS `b_a_name`,`bank_account_v`.`bank_id` AS `bank_id`,`bank_account_v`.`first_amount` AS `first_amount`,`bank_account_v`.`is_cash` AS `is_cash`,`bank_account_v`.`bank_name` AS `bank_name`,`finance_account`.`name` AS `account_name`,`finance_account`.`phone` AS `phone`,`finance_account`.`person_name` AS `person_name`,`finance_account`.`person_mobile` AS `person_mobile`,`finance_account`.`fax` AS `fax`,`finance_account`.`create_date` AS `create_date`,`finance_account`.`address` AS `address`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`finance_receive_pay_type`.`name` AS `rec_pay_type_name` from (((`finance_receive_payment` join `bank_account_v` on((`finance_receive_payment`.`account_bank_id` = `bank_account_v`.`id`))) left join `finance_account` on((`finance_receive_payment`.`account_person_id` = `finance_account`.`id`))) join `finance_receive_pay_type` on((`finance_receive_payment`.`receive_pay_type_id` = `finance_receive_pay_type`.`id`))) ;

-- View structure for reg_pay_rec_v
-- ----------------------------
DROP VIEW IF EXISTS `reg_pay_rec_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_pay_rec_v` AS select `reg_reg_payment`.`id` AS `id`,`reg_reg_payment`.`create_date` AS `reg_pay_date`,`reg_reg_payment`.`reg_id` AS `reg_id`,`reg_reg_payment`.`finance_id` AS `finance_id`,`reg_reg_payment`.`next_payment` AS `next_payment`,`receive_pay_v`.`event_date` AS `event_date`,`receive_pay_v`.`amount` AS `amount`,`receive_pay_v`.`account_bank_id` AS `account_bank_id`,`receive_pay_v`.`account_person_id` AS `account_person_id`,`receive_pay_v`.`receive_pay_type_id` AS `receive_pay_type_id`,`receive_pay_v`.`description` AS `description`,`receive_pay_v`.`code` AS `code`,`receive_pay_v`.`b_a_name` AS `b_a_name`,`receive_pay_v`.`bank_id` AS `bank_id`,`receive_pay_v`.`first_amount` AS `first_amount`,`receive_pay_v`.`is_cash` AS `is_cash`,`receive_pay_v`.`bank_name` AS `bank_name`,`receive_pay_v`.`account_name` AS `account_name`,`receive_pay_v`.`phone` AS `phone`,`receive_pay_v`.`person_name` AS `person_name`,`receive_pay_v`.`person_mobile` AS `person_mobile`,`receive_pay_v`.`fax` AS `fax`,`receive_pay_v`.`create_date` AS `create_date`,`receive_pay_v`.`address` AS `address`,`receive_pay_v`.`fisrt_payable` AS `fisrt_payable`,`receive_pay_v`.`rec_pay_type_name` AS `rec_pay_type_name` from (`reg_reg_payment` join `receive_pay_v` on((`reg_reg_payment`.`finance_id` = `receive_pay_v`.`id`))) ;

-- ----------------------------

DROP VIEW IF EXISTS `reg_payments_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_payments_v` AS select `registration_view`.`reg_date` AS `reg_date`,`registration_view`.`theory_units` AS `theory_units`,`registration_view`.`actional_units` AS `actional_units`,`registration_view`.`fix_salary` AS `fix_salary`,`registration_view`.`theory_salary` AS `theory_salary`,`registration_view`.`actional_salary` AS `actional_salary`,`registration_view`.`other_salary_comment` AS `other_salary_comment`,`registration_view`.`other_salary_amount` AS `other_salary_amount`,`registration_view`.`total_salary` AS `total_salary`,`registration_view`.`off_amount` AS `off_amount`,`registration_view`.`off_comment` AS `off_comment`,`registration_view`.`term_name` AS `term_name`,`registration_view`.`field_name` AS `field_name`,`registration_view`.`name` AS `name`,`registration_view`.`famili` AS `famili`,`registration_view`.`national_code` AS `national_code`,`registration_view`.`identifier_code` AS `identifier_code`,`registration_view`.`identifier_serial` AS `identifier_serial`,`registration_view`.`identifier_char` AS `identifier_char`,`registration_view`.`student_code` AS `student_code`,`registration_view`.`father_name` AS `father_name`,`registration_view`.`date_of_birth` AS `date_of_birth`,`registration_view`.`address` AS `address`,`registration_view`.`mobile` AS `mobile`,`registration_view`.`phone` AS `phone`,`registration_view`.`archive_code` AS `archive_code`,`registration_view`.`org_name` AS `org_name`,`registration_view`.`id` AS `id`,`registration_view`.`status_name` AS `status_name`,`registration_view`.`status_id` AS `status_id`,`registration_view`.`st_org_id` AS `st_org_id`,`registration_view`.`field_id` AS `field_id`,`registration_view`.`reg_term_is_current` AS `reg_term_is_current`,`registration_view`.`reg_term_id` AS `reg_term_id`,`registration_view`.`org_unit_id` AS `org_unit_id`,`registration_view`.`level_id` AS `level_id`,`registration_view`.`level_name` AS `level_name`,`registration_view`.`created_date` AS `created_date`,`registration_view`.`last_modified` AS `last_modified`,`registration_view`.`from_date` AS `from_date`,`reg_pay_rec_v`.`reg_id` AS `reg_id`,`reg_pay_rec_v`.`amount` AS `amount`,`reg_pay_rec_v`.`finance_id` AS `finance_id`,`reg_pay_rec_v`.`next_payment` AS `next_payment`,`reg_pay_rec_v`.`account_bank_id` AS `account_bank_id`,`reg_pay_rec_v`.`receive_pay_type_id` AS `receive_pay_type_id`,`reg_pay_rec_v`.`description` AS `description`,`reg_pay_rec_v`.`code` AS `code`,`reg_pay_rec_v`.`b_a_name` AS `b_a_name`,`reg_pay_rec_v`.`is_cash` AS `is_cash`,`reg_pay_rec_v`.`bank_name` AS `bank_name`,`reg_pay_rec_v`.`account_name` AS `account_name`,`reg_pay_rec_v`.`rec_pay_type_name` AS `rec_pay_type_name` from (`reg_pay_rec_v` join `registration_view`) where (`reg_pay_rec_v`.`reg_id` = `registration_view`.`id`) ;

-- ----------------------------


-- View structure for all_terms_naghd_payments
-- ----------------------------
DROP VIEW IF EXISTS `all_terms_naghd_payments`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_terms_naghd_payments` AS select sum(`reg_payments_v`.`amount`) AS `totalTermPayments`,`reg_term`.`id` AS `term_id`,`reg_term`.`name` AS `name` from (`reg_term` join `reg_payments_v`) where (`reg_term`.`id` = `reg_payments_v`.`reg_term_id`) group by `reg_term`.`id` ;

-- ----------------------------
-- View structure for all_terms_salary
-- ----------------------------
DROP VIEW IF EXISTS `all_terms_salary`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_terms_salary` AS select sum(`reg_registration`.`total_salary`) AS `totalSalary`,sum(`reg_registration`.`off_amount`) AS `totalOf`,`reg_term`.`name` AS `term_name`,count(`reg_registration`.`id`) AS `countOfRegistrations`,`reg_term`.`id` AS `term_id` from (`reg_term` join `reg_registration`) where (`reg_term`.`id` = `reg_registration`.`term_id`) group by `reg_registration`.`term_id` ;

-- ----------------------------
-- View structure for all_term_details
-- ----------------------------
DROP VIEW IF EXISTS `all_term_details`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_term_details` AS select `registration_view`.`term_name` AS `term_name`,sum(`registration_view`.`off_amount`) AS `sum_off`,sum(`registration_view`.`total_salary`) AS `sum_total`,sum(`registration_view`.`theory_units`) AS `sum_theory_uints`,sum(`registration_view`.`actional_units`) AS `sum_actional_units`,count(`registration_view`.`id`) AS `sum_registrations`,count(`registration_view`.`student_code`) AS `sum_students`,`registration_view`.`reg_term_id` AS `reg_term_id` from `registration_view` group by `registration_view`.`term_name`,`registration_view`.`reg_term_id` order by `registration_view`.`reg_term_id` desc ;


-- ----------------------------
-- View structure for current_accunting_view
-- ----------------------------
DROP VIEW IF EXISTS `current_accunting_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `current_accunting_view` AS select sum(`finance_receive_payment`.`amount`) AS `naghd`,`finance_account`.`id` AS `id`,sum(`factor`.`amount`) AS `factor`,sum(`ckecks`.`amount`) AS `check`,(((sum(`factor`.`amount`) + sum(`finance_receive_payment`.`amount`)) + sum(`ckecks`.`amount`)) + `finance_account`.`fisrt_payable`) AS `test`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`account_student_view`.`st_name` AS `st_name`,`account_student_view`.`st_famili` AS `st_famili`,`account_student_view`.`national_code` AS `national_code`,`account_student_view`.`st_mobile` AS `st_mobile`,`account_student_view`.`status_id` AS `status_id`,`account_student_view`.`org_unit_id` AS `org_unit_id`,`reg_organization`.`name` AS `org_name`,`reg_student_status`.`name` AS `status_name` from ((((((`finance_check` `ckecks` join `finance_account`) join `finance_receive_payment` on((`finance_account`.`id` = `finance_receive_payment`.`account_person_id`))) join `finance_factor` `factor` on((('' = '') and (`ckecks`.`status_id` <> 1)))) join `account_student_view` on((`finance_account`.`id` = `account_student_view`.`acc_id`))) join `reg_student_status` on((`account_student_view`.`status_id` = `reg_student_status`.`id`))) join `reg_organization` on((`reg_organization`.`id` = `account_student_view`.`org_unit_id`))) group by `finance_account`.`id` order by `account_student_view`.`st_famili` ;

-- ----------------------------


-- ----------------------------
-- View structure for last_registration_view
-- ----------------------------
DROP VIEW IF EXISTS `last_registration_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `last_registration_view` AS SELECT
last_registration_students.last_term,
last_registration_students.student_code,
registration_view.reg_date,
registration_view.theory_units,
registration_view.actional_units,
registration_view.fix_salary,
registration_view.theory_salary,
registration_view.actional_salary,
registration_view.other_salary_comment,
registration_view.other_salary_amount,
registration_view.total_salary,
registration_view.off_amount,
registration_view.off_comment,
registration_view.term_name,
registration_view.field_name,
registration_view.`name`,
registration_view.famili,
registration_view.national_code,
registration_view.identifier_code,
registration_view.identifier_serial,
registration_view.identifier_char,
registration_view.father_name,
registration_view.date_of_birth,
registration_view.description,
registration_view.address,
registration_view.mobile,
registration_view.phone,
registration_view.archive_code,
registration_view.org_name,
registration_view.id,
registration_view.status_name,
registration_view.status_id,
registration_view.st_org_id,
registration_view.field_id,
registration_view.reg_term_is_current,
registration_view.reg_term_id,
registration_view.org_unit_id,
registration_view.level_id,
registration_view.level_name,
registration_view.created_date,
registration_view.last_modified,
registration_view.from_date,
registration_view.pish_madrak,
registration_view.diplom_madrak,
pdate(last_registration_students.date_of_birth)
FROM
last_registration_students ,
registration_view
WHERE
last_registration_students.last_term = registration_view.reg_term_id AND
last_registration_students.student_code = registration_view.student_code ;

-- ----------------------------
-- View structure for receive_pay_factor
-- ----------------------------
DROP VIEW IF EXISTS `receive_pay_factor`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `receive_pay_factor` AS select `finance_factor`.`type_id` AS `type_id`,`finance_factor`.`id` AS `id`,`finance_factor`.`account_person_id` AS `account_person_id`,`finance_factor`.`create_date` AS `create_date` from (`finance_factor` join `finance_factor_type`) ;

-- ----------------------------

-- ----------------------------
-- View structure for register_factor_view
-- ----------------------------
DROP VIEW IF EXISTS `register_factor_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `register_factor_view` AS select `reg_receivable`.`id` AS `id`,`reg_receivable`.`finance_factor_id` AS `finance_factor_id`,`reg_receivable`.`create_date` AS `create_date`,`reg_receivable`.`reg_id` AS `reg_id`,`reg_registration`.`st_id` AS `st_id`,`reg_registration`.`field_id` AS `field_id`,`reg_registration`.`term_id` AS `term_id`,`finance_factor`.`amount` AS `amount`,`finance_factor`.`type_id` AS `type_id`,`finance_factor`.`description` AS `description`,`finance_factor`.`account_person_id` AS `account_person_id` from ((`reg_receivable` join `reg_registration` on((`reg_receivable`.`reg_id` = `reg_registration`.`id`))) join `finance_factor` on((`reg_receivable`.`finance_factor_id` = `finance_factor`.`id`))) ;

-- ----------------------------

-- ----------------------------
-- View structure for reg_all_pays
-- ----------------------------
DROP VIEW IF EXISTS `reg_all_pays`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_all_pays` AS select `reg_pay_rec_v`.`event_date` AS `event_date`,`reg_pay_rec_v`.`amount` AS `amount`,`reg_pay_rec_v`.`id` AS `id`,`reg_pay_rec_v`.`reg_pay_date` AS `reg_pay_date`,`reg_check_v`.`id` AS `check_id`,`reg_check_v`.`reg_id` AS `reg_id`,`reg_check_v`.`amount` AS `check_amount`,`reg_check_v`.`number` AS `number` from (`reg_check_v` join `reg_pay_rec_v` on((`reg_check_v`.`reg_id` = `reg_pay_rec_v`.`reg_id`))) ;


-- ----------------------------
-- View structure for reg_payments_v
-- ----------------------------

-- View structure for student_view
-- ----------------------------
DROP VIEW IF EXISTS `student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `student_view` AS select `reg_student`.`name` AS `name`,`reg_student`.`famili` AS `famili`,`reg_student`.`student_code` AS `student_code`,`reg_student`.`status_id` AS `status_id`,`reg_student`.`org_unit_id` AS `org_unit_id`,`reg_student`.`level_id_last` AS `level_id_last`,`reg_student`.`field_id_last` AS `field_id_last`,`reg_field`.`name` AS `field_name`,`reg_level`.`name` AS `level_name`,`reg_organization`.`name` AS `org_name`,`reg_student_status`.`name` AS `status_name`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`identifier_code` AS `identifier_code`,`reg_student`.`identifier_serial` AS `identifier_serial`,`reg_student`.`identifier_char` AS `identifier_char`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `description`,`reg_student`.`created_date` AS `created_date`,`reg_student`.`last_modified` AS `last_modified`,`reg_student`.`address` AS `address`,`reg_student`.`mobile` AS `mobile`,`reg_student`.`phone` AS `phone`,`reg_student`.`archive_code` AS `archive_code`,`reg_student`.`level_id_last` AS `level_id`,`reg_student`.`field_id_last` AS `field_id`,`reg_student`.`pish_madrak` AS `pish_madrak`,`reg_student`.`diplom_madrak` AS `diplom_madrak` from ((((`reg_student` left join `reg_field` on((`reg_student`.`field_id_last` = `reg_field`.`id`))) left join `reg_level` on((`reg_student`.`level_id_last` = `reg_level`.`id`))) join `reg_organization` on((`reg_student`.`org_unit_id` = `reg_organization`.`id`))) join `reg_student_status` on((`reg_student`.`status_id` = `reg_student_status`.`id`))) ;

-- ----------------------------
-- View structure for st_current_term_v
-- ----------------------------
DROP VIEW IF EXISTS `st_current_term_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `st_current_term_v` AS select `student_view`.`name` AS `name`,`student_view`.`famili` AS `famili`,`student_view`.`student_code` AS `student_code`,`student_view`.`status_id` AS `status_id`,`student_view`.`org_unit_id` AS `org_unit_id`,`student_view`.`level_id_last` AS `level_id_last`,`student_view`.`field_id_last` AS `field_id_last`,`student_view`.`field_name` AS `field_name`,`student_view`.`level_name` AS `level_name`,`student_view`.`org_name` AS `org_name`,`student_view`.`status_name` AS `status_name`,`student_view`.`national_code` AS `national_code`,`student_view`.`identifier_code` AS `identifier_code`,`student_view`.`identifier_serial` AS `identifier_serial`,`student_view`.`identifier_char` AS `identifier_char`,`student_view`.`father_name` AS `father_name`,`student_view`.`date_of_birth` AS `date_of_birth`,`student_view`.`description` AS `description`,`student_view`.`created_date` AS `created_date`,`student_view`.`last_modified` AS `last_modified`,`student_view`.`address` AS `address`,`student_view`.`mobile` AS `mobile`,`student_view`.`phone` AS `phone`,`student_view`.`archive_code` AS `archive_code` from `student_view` where `student_view`.`student_code` in (select `reg_registration`.`st_id` AS `st_id` from `reg_registration` where `reg_registration`.`term_id` in (select `reg_term`.`id` AS `id` from `reg_term` where (`reg_term`.`is_current` = 1))) ;

-- ----------------------------
-- View structure for st_not_current_t_v
-- ----------------------------
DROP VIEW IF EXISTS `st_not_current_t_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `st_not_current_t_v` AS select `student_view`.`name` AS `name`,`student_view`.`famili` AS `famili`,`student_view`.`student_code` AS `student_code`,`student_view`.`status_id` AS `status_id`,`student_view`.`org_unit_id` AS `org_unit_id`,`student_view`.`level_id_last` AS `level_id_last`,`student_view`.`field_id_last` AS `field_id_last`,`student_view`.`field_name` AS `field_name`,`student_view`.`level_name` AS `level_name`,`student_view`.`org_name` AS `org_name`,`student_view`.`status_name` AS `status_name`,`student_view`.`national_code` AS `national_code`,`student_view`.`identifier_code` AS `identifier_code`,`student_view`.`identifier_serial` AS `identifier_serial`,`student_view`.`identifier_char` AS `identifier_char`,`student_view`.`father_name` AS `father_name`,`student_view`.`date_of_birth` AS `date_of_birth`,`student_view`.`description` AS `description`,`student_view`.`created_date` AS `created_date`,`student_view`.`last_modified` AS `last_modified`,`student_view`.`address` AS `address`,`student_view`.`mobile` AS `mobile`,`student_view`.`phone` AS `phone`,`student_view`.`archive_code` AS `archive_code` from `student_view` where `student_view`.`student_code` in (select `reg_registration`.`st_id` AS `st_id` from `reg_registration` where (not(`reg_registration`.`term_id` in (select `reg_term`.`id` AS `id` from `reg_term` where (`reg_term`.`is_current` = 1))))) ;


