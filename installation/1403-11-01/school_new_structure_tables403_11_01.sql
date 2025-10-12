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
