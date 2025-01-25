/*
 Navicat Premium Dump SQL

 Source Server         : payamserver
 Source Server Type    : MySQL
 Source Server Version : 50137 (5.1.37-community)
 Source Host           : server:3306
 Source Schema         : school_new

 Target Server Type    : MySQL
 Target Server Version : 50137 (5.1.37-community)
 File Encoding         : 65001

 Date: 20/01/2025 18:42:06
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
  `fisrt_payable` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14208 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
-- Table structure for finance_bank
-- ----------------------------
DROP TABLE IF EXISTS `finance_bank`;
CREATE TABLE `finance_bank`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 34027 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
-- Table structure for finance_receive_pay_type
-- ----------------------------
DROP TABLE IF EXISTS `finance_receive_pay_type`;
CREATE TABLE `finance_receive_pay_type`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 44246 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
-- Table structure for reg_base_level
-- ----------------------------
DROP TABLE IF EXISTS `reg_base_level`;
CREATE TABLE `reg_base_level`  (
  `base_id` bigint(20) NOT NULL,
  `base_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`base_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reg_course
-- ----------------------------
DROP TABLE IF EXISTS `reg_course`;
CREATE TABLE `reg_course`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` int(255) NULL DEFAULT NULL,
  `is_final` bit(1) NULL DEFAULT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `has_online` bit(1) NULL DEFAULT NULL,
  `present_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 371 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for reg_course_field
-- ----------------------------
DROP TABLE IF EXISTS `reg_course_field`;
CREATE TABLE `reg_course_field`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `is_final` bit(1) NULL DEFAULT NULL,
  `unitCount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `field_id`(`field_id`, `course_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `reg_course_field_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `reg_field` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_course_field_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `reg_course` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1171 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for reg_exam_course
-- ----------------------------
DROP TABLE IF EXISTS `reg_exam_course`;
CREATE TABLE `reg_exam_course`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `exam_time_id` bigint(20) NULL DEFAULT NULL,
  `course_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `exam_time_id`(`exam_time_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `reg_exam_course_ibfk_1` FOREIGN KEY (`exam_time_id`) REFERENCES `reg_exam_time` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_exam_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `reg_course` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1219 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for reg_exam_hour_config
-- ----------------------------
DROP TABLE IF EXISTS `reg_exam_hour_config`;
CREATE TABLE `reg_exam_hour_config`  (
  `hour_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`hour_title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for reg_exam_kart_config
-- ----------------------------
DROP TABLE IF EXISTS `reg_exam_kart_config`;
CREATE TABLE `reg_exam_kart_config`  (
  `id` bigint(20) NOT NULL,
  `manager_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exam_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for reg_exam_time
-- ----------------------------
DROP TABLE IF EXISTS `reg_exam_time`;
CREATE TABLE `reg_exam_time`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) NULL DEFAULT NULL,
  `exam_date` datetime NULL DEFAULT NULL,
  `hour` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `term_id`(`term_id`) USING BTREE,
  CONSTRAINT `reg_exam_time_ibfk_1` FOREIGN KEY (`term_id`) REFERENCES `reg_term` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 425 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
-- Table structure for reg_identifier_code
-- ----------------------------
DROP TABLE IF EXISTS `reg_identifier_code`;
CREATE TABLE `reg_identifier_code`  (
  `id` int(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
-- Table structure for reg_organization
-- ----------------------------
DROP TABLE IF EXISTS `reg_organization`;
CREATE TABLE `reg_organization`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reg_persian_day
-- ----------------------------
DROP TABLE IF EXISTS `reg_persian_day`;
CREATE TABLE `reg_persian_day`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 34028 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reg_reg_course
-- ----------------------------
DROP TABLE IF EXISTS `reg_reg_course`;
CREATE TABLE `reg_reg_course`  (
  `reg_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  PRIMARY KEY (`reg_id`, `course_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `reg_reg_course_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `reg_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reg_reg_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `reg_course` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 44155 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reg_registration
-- ----------------------------
DROP TABLE IF EXISTS `reg_registration`;
CREATE TABLE `reg_registration`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reg_date` datetime NOT NULL,
  `st_id` bigint(20) NOT NULL,
  `field_id` bigint(20) NOT NULL,
  `term_id` bigint(20) NOT NULL,
  `level_id` bigint(20) NULL DEFAULT NULL,
  `theory_units` double(11, 2) NOT NULL,
  `actional_units` int(11) NOT NULL,
  `fix_salary` bigint(20) NOT NULL,
  `actional_salary` bigint(20) NOT NULL,
  `theory_salary` bigint(20) NOT NULL,
  `other_salary_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `other_salary_amount` bigint(20) NOT NULL,
  `total_salary` bigint(20) NOT NULL,
  `off_amount` bigint(20) NOT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 34029 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
-- Table structure for reg_student_image
-- ----------------------------
DROP TABLE IF EXISTS `reg_student_image`;
CREATE TABLE `reg_student_image`  (
  `st_code` bigint(255) NOT NULL,
  `st_image` blob NULL,
  PRIMARY KEY (`st_code`) USING BTREE,
  CONSTRAINT `reg_student_image_ibfk_1` FOREIGN KEY (`st_code`) REFERENCES `reg_student` (`student_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 9332 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
-- ----------------------------
-- Function structure for gdate
-- ----------------------------
DROP FUNCTION IF EXISTS `gdate`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `gdate`(`jy` smallint, `jm` smallint, `jd` smallint) RETURNS datetime
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
CREATE DEFINER=`root`@`localhost` FUNCTION `pdate`(`gdate` datetime) RETURNS char(100) CHARSET utf8
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
CREATE DEFINER=`root`@`localhost` FUNCTION `pday`(`gdate` datetime) RETURNS char(100) CHARSET utf8
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
CREATE DEFINER=`root`@`localhost` FUNCTION `PMONTH`(`gdate` datetime) RETURNS char(100) CHARSET utf8
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
CREATE DEFINER=`root`@`localhost` FUNCTION `pmonthname`(`gdate` datetime) RETURNS varchar(100) CHARSET utf8
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
CREATE DEFINER=`root`@`localhost` FUNCTION `pweekday`(`pdateinput` date) RETURNS varchar(100) CHARSET utf8
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
CREATE DEFINER=`root`@`localhost` FUNCTION `pyear`(`gdate` datetime) RETURNS char(100) CHARSET utf8
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
CREATE DEFINER=`root`@`localhost` FUNCTION `_gdmarray`(`m` smallint) RETURNS smallint(2)
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
CREATE DEFINER=`root`@`localhost` FUNCTION `_gdmarray2`(`m` smallint, `k` SMALLINT) RETURNS smallint(2)
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
CREATE DEFINER=`root`@`localhost` FUNCTION `_jdmarray`(`m` smallint) RETURNS smallint(2)
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
CREATE DEFINER=`root`@`localhost` FUNCTION `_jdmarray2`(`m` smallint) RETURNS smallint(2)
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
CREATE DEFINER=`root`@`localhost` FUNCTION `__mydiv`(`a` int, `b` int) RETURNS bigint(20)
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
CREATE DEFINER=`root`@`localhost` FUNCTION `__mymod`(`a` int, `b` int) RETURNS bigint(20)
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
-- View structure for registration_view
-- ----------------------------
DROP VIEW IF EXISTS `registration_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `registration_view` AS SELECT
	reg_registration.reg_date AS reg_date, 
	reg_registration.theory_units AS theory_units, 
	reg_registration.actional_units AS actional_units, 
	reg_registration.fix_salary AS fix_salary, 
	reg_registration.theory_salary AS theory_salary, 
	reg_registration.actional_salary AS actional_salary, 
	reg_registration.other_salary_comment AS other_salary_comment, 
	reg_registration.other_salary_amount AS other_salary_amount, 
	reg_registration.total_salary AS total_salary, 
	reg_registration.off_amount AS off_amount, 
	reg_registration.off_comment AS off_comment, 
	reg_term.`name` AS term_name, 
	reg_field.`name` AS field_name, 
	reg_student.`name` AS `name`, 
	reg_student.famili AS famili, 
	reg_student.national_code AS national_code, 
	reg_student.identifier_code AS identifier_code, 
	reg_student.identifier_serial AS identifier_serial, 
	reg_student.identifier_char AS identifier_char, 
	reg_student.student_code AS student_code, 
	reg_student.father_name AS father_name, 
	reg_student.date_of_birth AS date_of_birth, 
	reg_student.description AS description, 
	reg_student.address AS address, 
	reg_student.mobile AS mobile, 
	reg_student.phone AS phone, 
	reg_student.archive_code AS archive_code, 
	reg_organization.`name` AS org_name, 
	reg_registration.id AS id, 
	reg_student_status.`name` AS status_name, 
	reg_student_status.id AS status_id, 
	reg_organization.id AS st_org_id, 
	reg_field.id AS field_id, 
	reg_term.is_current AS reg_term_is_current, 
	reg_term.id AS reg_term_id, 
	reg_organization.id AS org_unit_id, 
	reg_level.id AS level_id, 
	reg_level.`name` AS level_name, 
	reg_student.created_date AS created_date, 
	reg_student.last_modified AS last_modified, 
	reg_term.from_date AS from_date, 
	reg_student.pish_madrak AS pish_madrak, 
	reg_student.diplom_madrak AS diplom_madrak, 
	reg_base_level.base_name
FROM
	(
		(
			(
				(
					(
						(
							reg_registration
							join
							reg_term
							ON 
								(
									(
										reg_registration.term_id = reg_term.id
									)
								)
						)
						join
						reg_field
						ON 
							(
								(
									reg_registration.field_id = reg_field.id
								)
							)
					)
					join
					reg_student
					ON 
						(
							(
								reg_registration.st_id = reg_student.student_code
							)
						)
				)
				join
				reg_organization
				ON 
					(
						(
							reg_student.org_unit_id = reg_organization.id
						)
					)
			)
			join
			reg_student_status
			ON 
				(
					(
						reg_student.status_id = reg_student_status.id
					)
				)
		)
		join
		reg_level
		ON 
			(
				(
					reg_registration.level_id = reg_level.id
				)
			)
	)
	left  JOIN
	 reg_base_level
	ON 
		reg_registration.base_id = reg_base_level.base_id ;

-- ----------------------------
-- View structure for registration_view2
-- ----------------------------
DROP VIEW IF EXISTS `registration_view2`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `registration_view2` AS SELECT
	reg_registration.reg_date AS reg_date, 
	reg_registration.theory_units AS theory_units, 
	reg_registration.actional_units AS actional_units, 
	reg_registration.fix_salary AS fix_salary, 
	reg_registration.theory_salary AS theory_salary, 
	reg_registration.actional_salary AS actional_salary, 
	reg_registration.other_salary_comment AS other_salary_comment, 
	reg_registration.other_salary_amount AS other_salary_amount, 
	reg_registration.total_salary AS total_salary, 
	reg_registration.off_amount AS off_amount, 
	reg_registration.off_comment AS off_comment, 
	reg_term.`name` AS term_name, 
	reg_field.`name` AS field_name, 
	reg_student.`name` AS `name`, 
	reg_student.famili AS famili, 
	reg_student.national_code AS national_code, 
	reg_student.identifier_code AS identifier_code, 
	reg_student.identifier_serial AS identifier_serial, 
	reg_student.identifier_char AS identifier_char, 
	reg_student.student_code AS student_code, 
	reg_student.father_name AS father_name, 
	reg_student.date_of_birth AS date_of_birth, 
	reg_student.description AS description, 
	reg_student.address AS address, 
	reg_student.mobile AS mobile, 
	reg_student.phone AS phone, 
	reg_student.archive_code AS archive_code, 
	reg_organization.`name` AS org_name, 
	reg_registration.id AS id, 
	reg_student_status.`name` AS status_name, 
	reg_student_status.id AS status_id, 
	reg_organization.id AS st_org_id, 
	reg_field.id AS field_id, 
	reg_term.is_current AS reg_term_is_current, 
	reg_term.id AS reg_term_id, 
	reg_organization.id AS org_unit_id, 
	reg_level.id AS level_id, 
	reg_level.`name` AS level_name, 
	reg_student.created_date AS created_date, 
	reg_student.last_modified AS last_modified, 
	reg_term.from_date AS from_date, 
	reg_student.pish_madrak AS pish_madrak, 
	reg_student.diplom_madrak AS diplom_madrak, 
	reg_base_level.base_name
FROM
	(
		(
			(
				(
					(
						(
							reg_registration
							join
							reg_term
							ON 
								(
									(
										reg_registration.term_id = reg_term.id
									)
								)
						)
						join
						reg_field
						ON 
							(
								(
									reg_registration.field_id = reg_field.id
								)
							)
					)
					join
					reg_student
					ON 
						(
							(
								reg_registration.st_id = reg_student.student_code
							)
						)
				)
				join
				reg_organization
				ON 
					(
						(
							reg_student.org_unit_id = reg_organization.id
						)
					)
			)
			join
			reg_student_status
			ON 
				(
					(
						reg_student.status_id = reg_student_status.id
					)
				)
		)
		join
		reg_level
		ON 
			(
				(
					reg_registration.level_id = reg_level.id
				)
			)
	)
	left  JOIN
	 reg_base_level
	ON 
		reg_registration.base_id = reg_base_level.base_id 
		ORDER BY reg_registration.id ;
-- ------------------------------------------
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
-- View structure for allregs_count__in_term
-- ----------------------------
DROP VIEW IF EXISTS `allregs_count__in_term`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `allregs_count__in_term` AS select  COUNT(student_code) as all_regs_count,student_code,registration_view.`name`,registration_view.famili,reg_term_id , registration_view.term_name as first_term from registration_view WHERE registration_view.reg_term_id  <=9331 and student_code in  (select student_code from registration_view where reg_term_id= 9331)  GROUP BY registration_view.student_code ;

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

-- ----------------------------
-- View structure for reg_pay_rec_v
-- ----------------------------
DROP VIEW IF EXISTS `reg_pay_rec_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_pay_rec_v` AS select `reg_reg_payment`.`id` AS `id`,`reg_reg_payment`.`create_date` AS `reg_pay_date`,`reg_reg_payment`.`reg_id` AS `reg_id`,`reg_reg_payment`.`finance_id` AS `finance_id`,`reg_reg_payment`.`next_payment` AS `next_payment`,`receive_pay_v`.`event_date` AS `event_date`,`receive_pay_v`.`amount` AS `amount`,`receive_pay_v`.`account_bank_id` AS `account_bank_id`,`receive_pay_v`.`account_person_id` AS `account_person_id`,`receive_pay_v`.`receive_pay_type_id` AS `receive_pay_type_id`,`receive_pay_v`.`description` AS `description`,`receive_pay_v`.`code` AS `code`,`receive_pay_v`.`b_a_name` AS `b_a_name`,`receive_pay_v`.`bank_id` AS `bank_id`,`receive_pay_v`.`first_amount` AS `first_amount`,`receive_pay_v`.`is_cash` AS `is_cash`,`receive_pay_v`.`bank_name` AS `bank_name`,`receive_pay_v`.`account_name` AS `account_name`,`receive_pay_v`.`phone` AS `phone`,`receive_pay_v`.`person_name` AS `person_name`,`receive_pay_v`.`person_mobile` AS `person_mobile`,`receive_pay_v`.`fax` AS `fax`,`receive_pay_v`.`create_date` AS `create_date`,`receive_pay_v`.`address` AS `address`,`receive_pay_v`.`fisrt_payable` AS `fisrt_payable`,`receive_pay_v`.`rec_pay_type_name` AS `rec_pay_type_name` from (`reg_reg_payment` join `receive_pay_v` on((`reg_reg_payment`.`finance_id` = `receive_pay_v`.`id`))) ;



-- ----------------------------
-- View structure for reg_payments_v
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
-- View structure for course_field_view
-- ----------------------------
DROP VIEW IF EXISTS `course_field_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `course_field_view` AS SELECT
	reg_course_field.id AS id, 
	reg_course_field.field_id AS field_id, 
	reg_course_field.course_id AS course_id, 
	reg_course_field.is_final AS is_final, 
	reg_course_field.unitCount AS unit_Count, 
	reg_field.`name` AS field_name, 
	reg_course.`code` AS course_code, 
	reg_course.`name` AS course_name, 
	reg_course.display_name AS course_display_name, 
	reg_course.description AS course_description
FROM
	(
		(
			reg_course_field
			join
			reg_course
			ON 
				(
					(
						reg_course_field.course_id = reg_course.ID
					)
				)
		)
		join
		reg_field
		ON 
			(
				(
					reg_course_field.field_id = reg_field.id
				)
			)
	) ;

-- ----------------------------
-- View structure for course_view
-- ----------------------------
DROP VIEW IF EXISTS `course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `course_view` AS SELECT
	reg_course.`code` AS course_code, 
	reg_course.`name` AS course_name, 
	reg_course.display_name AS course_display_name, 
	reg_course.description AS course_description, 
	reg_exam_course.Id AS exam_course_id, 
	reg_exam_course.exam_time_id AS exam_time_id, 
	reg_exam_course.course_id AS course_id, 
	reg_exam_time.term_id AS term_id, 
	reg_exam_time.exam_date AS exam_date, 
	reg_exam_time.`hour` AS exam_hour, 
	reg_term.`name` AS term_name, 
	reg_term.is_current AS term_is_current
FROM
	reg_exam_course
	INNER JOIN
	reg_course
	ON 
		reg_exam_course.course_id = reg_course.ID
	INNER JOIN
	reg_exam_time
	ON 
		reg_exam_course.exam_time_id = reg_exam_time.ID
	INNER JOIN
	reg_term
	ON 
		reg_exam_time.term_id = reg_term.id ;

-- ----------------------------
-- View structure for current_accunting_view
-- ----------------------------
DROP VIEW IF EXISTS `current_accunting_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `current_accunting_view` AS select sum(`finance_receive_payment`.`amount`) AS `naghd`,`finance_account`.`id` AS `id`,sum(`factor`.`amount`) AS `factor`,sum(`ckecks`.`amount`) AS `check`,(((sum(`factor`.`amount`) + sum(`finance_receive_payment`.`amount`)) + sum(`ckecks`.`amount`)) + `finance_account`.`fisrt_payable`) AS `test`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`account_student_view`.`st_name` AS `st_name`,`account_student_view`.`st_famili` AS `st_famili`,`account_student_view`.`national_code` AS `national_code`,`account_student_view`.`st_mobile` AS `st_mobile`,`account_student_view`.`status_id` AS `status_id`,`account_student_view`.`org_unit_id` AS `org_unit_id`,`reg_organization`.`name` AS `org_name`,`reg_student_status`.`name` AS `status_name` from ((((((`finance_check` `ckecks` join `finance_account`) join `finance_receive_payment` on((`finance_account`.`id` = `finance_receive_payment`.`account_person_id`))) join `finance_factor` `factor` on((('' = '') and (`ckecks`.`status_id` <> 1)))) join `account_student_view` on((`finance_account`.`id` = `account_student_view`.`acc_id`))) join `reg_student_status` on((`account_student_view`.`status_id` = `reg_student_status`.`id`))) join `reg_organization` on((`reg_organization`.`id` = `account_student_view`.`org_unit_id`))) group by `finance_account`.`id` order by `account_student_view`.`st_famili` ;

-- ----------------------------
-- View structure for exam_course_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `exam_course_view` AS SELECT
	reg_course.`code` AS course_code, 
	reg_course.`name` AS course_name, 
	reg_course.display_name AS course_display_name, 
	reg_course.description AS course_description, 
	reg_exam_course.Id AS exam_course_id, 
	reg_exam_course.exam_time_id AS exam_time_id, 
	reg_exam_course.course_id AS course_id, 
	reg_exam_time.term_id AS term_id, 
	reg_exam_time.exam_date AS exam_date, 
	reg_exam_time.`hour` AS exam_hour, 
	reg_term.`name` AS term_name, 
	reg_term.is_current AS term_is_current
FROM
	reg_exam_course
	INNER JOIN
	reg_course
	ON 
		reg_exam_course.course_id = reg_course.ID
	INNER JOIN
	reg_exam_time
	ON 
		reg_exam_course.exam_time_id = reg_exam_time.ID
	INNER JOIN
	reg_term
	ON 
		reg_exam_time.term_id = reg_term.id ;


-- ----------------------------
-- View structure for reg_registerd_course_view
-- ----------------------------
DROP VIEW IF EXISTS `reg_registerd_course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_registerd_course_view` AS SELECT
	reg_registration.id AS reg_id, 
	reg_registration.reg_date, 
	reg_registration.st_id, 
	reg_registration.field_id, 
	reg_registration.term_id, 
	reg_registration.level_id, 
	reg_registration.theory_units, 
	reg_registration.actional_units, 
	reg_registration.fix_salary, 
	reg_registration.actional_salary, 
	reg_registration.theory_salary, 
	reg_registration.other_salary_comment, 
	reg_registration.other_salary_amount, 
	reg_registration.total_salary, 
	reg_registration.off_amount, 
	reg_registration.off_comment, 
	reg_registration.base_id, 
	reg_student.`name` AS first_name, 
	reg_student.famili, 
	reg_student.national_code, 
	reg_student.father_name, 
	reg_student.date_of_birth, 
	reg_student.description AS st_description, 
	reg_student.status_id, 
	reg_student.org_unit_id, 
	reg_student.created_date, 
	reg_student.last_modified, 
	reg_student.address, 
	reg_student.mobile, 
	reg_student.archive_code, 
	reg_student.pish_madrak, 
	reg_student.diplom_madrak, 
	reg_course.ID AS course_id, 
	reg_course.`code` AS course_code, 
	reg_course.`name` AS course_name, 
	reg_course.unit AS course_unit, 
	reg_course.is_final AS course_is_final, 
	reg_course.display_name AS course_dispaly_name, 
	reg_course.description AS course_description
FROM
	reg_reg_course
	INNER JOIN
	reg_course
	ON 
		reg_reg_course.course_id = reg_course.ID
	INNER JOIN
	reg_registration
	ON 
		reg_reg_course.reg_id = reg_registration.id
	INNER JOIN
	reg_student
	ON 
		reg_registration.st_id = reg_student.student_code
	INNER JOIN
	reg_term
	ON 
		reg_registration.term_id = reg_term.id
WHERE
	reg_term.is_current = 1 ;



-- ----------------------------
-- View structure for exam_kart_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_kart_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `exam_kart_view` AS SELECT
	exam_course_view.term_id, 
	reg_registerd_course_view.first_name, 
	reg_registerd_course_view.famili, 
	exam_course_view.course_display_name, 
	exam_course_view.course_code, 
	exam_course_view.exam_date, 
	pdate(exam_course_view.exam_date) AS exam_farsi_date, 
	pweekday(exam_course_view.exam_date) AS exam_week_day, 
	pmonthname(exam_course_view.exam_date) AS exam_month_name, 
	exam_course_view.exam_hour, 
	exam_course_view.exam_time_id, 
	reg_registerd_course_view.father_name, 
	course_field_view.field_name, 
	reg_student_image.st_image, 
	exam_course_view.term_name, 
	reg_exam_kart_config.manager_name, 
	reg_exam_kart_config.school_name, 
	reg_exam_kart_config.exam_location, 
	reg_registerd_course_view.st_id, 
	reg_registerd_course_view.national_code,
	course_field_view.is_final
FROM
	reg_registerd_course_view
	INNER JOIN
	exam_course_view
	ON 
		exam_course_view.term_id = reg_registerd_course_view.term_id AND
		exam_course_view.course_id = reg_registerd_course_view.course_id
	INNER JOIN
	course_field_view
	ON 
		reg_registerd_course_view.course_id = course_field_view.course_id AND
		reg_registerd_course_view.field_id = course_field_view.field_id
	LEFT JOIN
	reg_student_image
	ON 
		reg_registerd_course_view.st_id = reg_student_image.st_code,
	reg_exam_kart_config
WHERE
	 exam_course_view.term_is_current = 1 ;

-- ----------------------------
-- View structure for last_registration_students
-- ----------------------------
DROP VIEW IF EXISTS `last_registration_students`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `last_registration_students` AS SELECT
Max(registration_view2.reg_term_id) AS last_term,
registration_view2.student_code AS student_code,
registration_view2.famili AS famili,
registration_view2.status_name AS status_name,
registration_view2.level_id AS level_id,
registration_view2.level_name AS level_name,
registration_view2.mobile AS mobile,
registration_view2.org_unit_id AS org_unit_id,
registration_view2.reg_term_is_current AS reg_term_is_current,
registration_view2.status_id AS status_id,
registration_view2.archive_code AS archive_code,
registration_view2.national_code AS national_code,
registration_view2.father_name AS father_name,
registration_view2.description AS description,
registration_view2.org_name AS org_name,
registration_view2.pish_madrak AS pish_madrak,
registration_view2.diplom_madrak AS diplom_madrak,
registration_view2.term_name AS term_name,
registration_view2.field_name AS field_name,
registration_view2.`name`,
registration_view2.date_of_birth,
registration_view2.phone,
registration_view2.st_org_id,
registration_view2.field_id
from `registration_view2`
group by `registration_view2`.`student_code`
order by `registration_view2`.`reg_term_id` desc ;

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
-- View structure for register_factor_view
-- ----------------------------
DROP VIEW IF EXISTS `register_factor_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `register_factor_view` AS select `reg_receivable`.`id` AS `id`,`reg_receivable`.`finance_factor_id` AS `finance_factor_id`,`reg_receivable`.`create_date` AS `create_date`,`reg_receivable`.`reg_id` AS `reg_id`,`reg_registration`.`st_id` AS `st_id`,`reg_registration`.`field_id` AS `field_id`,`reg_registration`.`term_id` AS `term_id`,`finance_factor`.`amount` AS `amount`,`finance_factor`.`type_id` AS `type_id`,`finance_factor`.`description` AS `description`,`finance_factor`.`account_person_id` AS `account_person_id` from ((`reg_receivable` join `reg_registration` on((`reg_receivable`.`reg_id` = `reg_registration`.`id`))) join `finance_factor` on((`reg_receivable`.`finance_factor_id` = `finance_factor`.`id`))) ;


-- ----------------------------
-- View structure for reg_all_pays
-- ----------------------------
DROP VIEW IF EXISTS `reg_all_pays`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_all_pays` AS (select reg_pay_rec_v.amount as amount_v , reg_pay_rec_v.create_date  as date_v ,reg_pay_rec_v.reg_id as reg_id_v , 'صندوق' as bank_v , null as check_status_name , reg_pay_rec_v.`code` as fish_number , null as check_date ,reg_pay_rec_v.rec_pay_type_name as pay_type_name from reg_pay_rec_v ) union (select reg_check_v.amount as amount_v , reg_check_v.create_date as date_v , reg_check_v.reg_id as reg_id_v , reg_check_v.bank_name as bank_v , reg_check_v.status_name as check_status_name , reg_check_v.number as fish_number , reg_check_v.check_date as check_date , 'چک' as pay_type_name from reg_check_v ) ;


-- ----------------------------
-- View structure for reg_not_registerd_course_view
-- ----------------------------
DROP VIEW IF EXISTS `reg_not_registerd_course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_not_registerd_course_view` AS select * from registration_view where student_code  
  not in (select reg_registerd_course_view.st_id from  reg_registerd_course_view )
and registration_view.reg_term_is_current = 1 
ORDER BY registration_view.famili ;

-- ----------------------------
-- View structure for reg_online_courses_sum_view
-- ----------------------------
DROP VIEW IF EXISTS `reg_online_courses_sum_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_online_courses_sum_view` AS SELECT DISTINCT
	reg_registration.st_id, 
	reg_student.`name`, 
	reg_student.famili, 
	GROUP_CONCAT(reg_course.display_name), 
	SUM(reg_course_field.unitCount) AS online_sum, 
	reg_registration.id AS reg_id
FROM
	reg_reg_course
	INNER JOIN
	reg_course
	ON 
		reg_reg_course.course_id = reg_course.ID
	INNER JOIN
	reg_registration
	ON 
		reg_reg_course.reg_id = reg_registration.id
	INNER JOIN
	reg_course_field
	ON 
		reg_course.ID = reg_course_field.course_id
	INNER JOIN
	reg_term
	ON 
		reg_registration.term_id = reg_term.id
	INNER JOIN
	reg_student
	ON 
		reg_registration.st_id = reg_student.student_code
WHERE
	reg_registration.field_id = reg_course_field.field_id AND
	reg_term.is_current = 1 AND
	reg_reg_course.course_id = reg_course.ID AND
	reg_course.has_online = 1
GROUP BY
	reg_registration.st_id ;




-- ----------------------------
-- View structure for students_in_courses_view
-- ----------------------------
DROP VIEW IF EXISTS `students_in_courses_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `students_in_courses_view` AS SELECT
	COUNT(reg_course.ID), 
	reg_course.`code`, 
	reg_course.display_name
FROM
	reg_course
	INNER JOIN
	reg_reg_course
	ON 
		reg_course.ID = reg_reg_course.course_id
		where reg_reg_course.reg_id in (select registration_view.id from registration_view where registration_view.reg_term_is_current = 1)
GROUP BY
	reg_reg_course.course_id ;

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

-- ----------------------------
-- View structure for st_without_pic_view
-- ----------------------------
DROP VIEW IF EXISTS `st_without_pic_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `st_without_pic_view` AS SELECT
	
	registration_view.field_name, 
	registration_view.`name`, 
	registration_view.famili, 
	registration_view.national_code, 
	registration_view.mobile, 
	registration_view.archive_code, 
	registration_view.father_name
FROM
	registration_view
	LEFT JOIN
	reg_student_image
	ON 
		reg_student_image.st_code = registration_view.student_code
WHERE
	registration_view.reg_term_is_current = 1 AND
	reg_student_image.st_image IS NULL
ORDER BY
	registration_view.famili ;

