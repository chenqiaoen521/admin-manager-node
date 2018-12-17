/*
 Navicat Premium Data Transfer

 Source Server         : 公司
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.3.97:3307
 Source Schema         : kyappservermain

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 19/11/2018 17:22:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `department_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `department_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门编号',
  `department_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '上级id',
  `is_child` int(2) NULL DEFAULT 0 COMMENT '是否有下级0:没有，1：有',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '0002', '市场部', 0, NULL);
INSERT INTO `department` VALUES (2, '0001', 'admins', 0, NULL);
INSERT INTO `department` VALUES (3, '0003', '销售部', 0, NULL);
INSERT INTO `department` VALUES (4, '0004', '测试组', 0, NULL);
INSERT INTO `department` VALUES (5, '0004', '测试组', 0, NULL);
INSERT INTO `department` VALUES (6, '0004', '测试组', 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
