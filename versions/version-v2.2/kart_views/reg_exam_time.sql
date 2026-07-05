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

 Date: 24/05/2026 22:28:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for reg_exam_time
-- ----------------------------
DROP TABLE IF EXISTS `reg_exam_time`;
CREATE TABLE `reg_exam_time`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `term_id` bigint NULL DEFAULT NULL,
  `exam_date` datetime NULL DEFAULT NULL,
  `hour` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `level_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `term_id`(`term_id` ASC) USING BTREE,
  CONSTRAINT `reg_exam_time_ibfk_1` FOREIGN KEY (`term_id`) REFERENCES `reg_term` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 427 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

SET FOREIGN_KEY_CHECKS = 1;
