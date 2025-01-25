/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : school_new

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 21/01/2025 13:35:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for finance_bank
-- ----------------------------
DROP TABLE IF EXISTS `finance_bank`;
CREATE TABLE `finance_bank`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of finance_bank
-- ----------------------------
BEGIN;
INSERT INTO `finance_bank` (`id`, `name`) VALUES (1, 'ملی'), (2, 'صادرات'), (3, 'مسکن'), (4, 'سپه');
COMMIT;

-- ----------------------------
-- Table structure for finance_check_status
-- ----------------------------
DROP TABLE IF EXISTS `finance_check_status`;
CREATE TABLE `finance_check_status`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of finance_check_status
-- ----------------------------
BEGIN;
INSERT INTO `finance_check_status` (`id`, `name`) VALUES (1, 'برگشت خورده'), (2, 'پاس شده'), (3, 'اولیه');
COMMIT;

-- ----------------------------
-- Table structure for finance_factor_type
-- ----------------------------
DROP TABLE IF EXISTS `finance_factor_type`;
CREATE TABLE `finance_factor_type`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of finance_factor_type
-- ----------------------------
BEGIN;
INSERT INTO `finance_factor_type` (`id`, `name`) VALUES (1, 'هزینه ثبت نام'), (2, 'هزینه صدور کارت');
COMMIT;

-- ----------------------------
-- Table structure for finance_receive_pay_type
-- ----------------------------
DROP TABLE IF EXISTS `finance_receive_pay_type`;
CREATE TABLE `finance_receive_pay_type`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of finance_receive_pay_type
-- ----------------------------
BEGIN;
INSERT INTO `finance_receive_pay_type` (`id`, `name`) VALUES (1, 'نقدی'), (2, 'pos'), (3, 'فیش بانکی'), (4, 'پاس شدن چک');
COMMIT;

-- ----------------------------
-- Table structure for reg_base
-- ----------------------------
DROP TABLE IF EXISTS `reg_base`;
CREATE TABLE `reg_base`  (
  `base_id` bigint NOT NULL DEFAULT 0,
  `base_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`base_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of reg_base
-- ----------------------------
BEGIN;
INSERT INTO `reg_base` (`base_id`, `base_name`) VALUES (1, 'پايه هفتم'), (2, 'پايه هشتم'), (3, 'پايه نهم'), (4, 'پايه دهم'), (5, 'پايه يازدهم'), (6, 'پايه دوازدهم');
COMMIT;

-- ----------------------------
-- Table structure for reg_exam_hour_config
-- ----------------------------
DROP TABLE IF EXISTS `reg_exam_hour_config`;
CREATE TABLE `reg_exam_hour_config`  (
  `hour_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`hour_title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of reg_exam_hour_config
-- ----------------------------
BEGIN;
INSERT INTO `reg_exam_hour_config` (`hour_title`) VALUES ('10 صبح'), ('10:30 صبح'), ('14 عصر'), ('15:30 عصر'), ('16 عصر'), ('17 عصر'), ('17:30 عصر'), ('7 صبح'), ('8 صبح'), ('9:30 صبح');
COMMIT;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of reg_exam_kart_config
-- ----------------------------
BEGIN;
INSERT INTO `reg_exam_kart_config` (`id`, `manager_name`, `school_name`, `exam_location`) VALUES (1, 'هما قاسمی پور', 'مدرسه راه دور همای سعات', 'مدرسه راه دور همای سعات');
COMMIT;

-- ----------------------------
-- Table structure for reg_field
-- ----------------------------
DROP TABLE IF EXISTS `reg_field`;
CREATE TABLE `reg_field`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of reg_field
-- ----------------------------
BEGIN;
INSERT INTO `reg_field` (`id`, `name`) VALUES (1, 'ریاضی فیزیک'), (2, 'علوم تجربی'), (3, 'ادبیات و علوم انسانی'), (4, 'گرافیک رایانه ای'), (5, 'متوسطه اول'), (7, 'معماری داخلی'), (8, 'مدیریت و برنامه ریزی امور خانواده'), (9, 'عکاسی دیجیتال'), (10, 'تولید محتوای آموزشی الکترونیکی'), (11, 'نقاشی ایرانی'), (12, 'گل گیاه زینتی'), (13, 'دستیار طراحی لباس'), (14, 'مدیریت خانواده'), (15, 'تولید محتوا'), (18, 'مدیریت آشپزی و قنادی');
COMMIT;

-- ----------------------------
-- Table structure for reg_identifier_code
-- ----------------------------
DROP TABLE IF EXISTS `reg_identifier_code`;
CREATE TABLE `reg_identifier_code`  (
  `id` int NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of reg_identifier_code
-- ----------------------------
BEGIN;
INSERT INTO `reg_identifier_code` (`id`, `name`) VALUES (1, 'الف'), (2, 'ب'), (3, 'پ'), (4, 'ت'), (5, 'ث'), (6, 'ج'), (7, 'چ'), (8, 'ح'), (9, 'خ'), (10, 'د'), (11, 'ذ'), (12, 'ر'), (13, 'ز'), (14, 'ژ'), (15, 'س'), (16, 'ش'), (17, 'ص'), (18, 'ض'), (19, 'ط'), (20, 'ظ'), (21, 'ع'), (22, 'غ'), (23, 'ف'), (24, 'ق'), (25, 'ک'), (26, 'گ'), (27, 'ل'), (28, 'م'), (29, 'ن'), (30, 'و'), (31, 'ه'), (32, 'ی'), (42, 'یک المثني'), (43, ' دو المثني'), (44, 'سه المثني'), (45, 'چهار المثني'), (46, 'پنج المثني'), (47, 'شش المثني'), (48, 'هفت المثني'), (49, 'هشت المثني'), (50, 'نه المثني'), (51, 'ده المثني'), (52, 'يازده المثني'), (53, 'دوازده المثني');
COMMIT;

-- ----------------------------
-- Table structure for reg_level
-- ----------------------------
DROP TABLE IF EXISTS `reg_level`;
CREATE TABLE `reg_level`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of reg_level
-- ----------------------------
BEGIN;
INSERT INTO `reg_level` (`id`, `name`) VALUES (1, 'دوره اول متوسطه'), (2, 'دوره دوم متوسطه'), (4, 'پیش دانشگاهی'), (5, 'تعریف نشده');
COMMIT;

-- ----------------------------
-- Table structure for reg_organization
-- ----------------------------
DROP TABLE IF EXISTS `reg_organization`;
CREATE TABLE `reg_organization`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of reg_organization
-- ----------------------------
BEGIN;
INSERT INTO `reg_organization` (`id`, `name`) VALUES (1, 'مرکزی');
COMMIT;

-- ----------------------------
-- Table structure for reg_persian_day
-- ----------------------------
DROP TABLE IF EXISTS `reg_persian_day`;
CREATE TABLE `reg_persian_day`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of reg_persian_day
-- ----------------------------
BEGIN;
INSERT INTO `reg_persian_day` (`id`, `name`) VALUES (0, 'دوشنبه'), (1, 'سه شنبه'), (2, 'چهارشنبه'), (3, 'پنجشنبه'), (4, 'جمعه'), (5, 'شنبه'), (6, 'یکشنبه');
COMMIT;

-- ----------------------------
-- Table structure for reg_student_status
-- ----------------------------
DROP TABLE IF EXISTS `reg_student_status`;
CREATE TABLE `reg_student_status`  (
  `id` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Records of reg_student_status
-- ----------------------------
BEGIN;
INSERT INTO `reg_student_status` (`id`, `name`) VALUES (1, 'فعال'), (2, 'انتقال رفته'), (3, 'بلاتکلیف'), (4, 'ترک تحصیل'), (5, 'فارغ التحصیل');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
