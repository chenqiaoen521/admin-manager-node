/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : yongdian

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 17/12/2018 16:31:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for role2
-- ----------------------------
DROP TABLE IF EXISTS `role2`;
CREATE TABLE `role2`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role2
-- ----------------------------
INSERT INTO `role2` VALUES (8, '00001', '超级管理员', '00001', '2018-12-11 09:21:32', '2018-12-11 09:21:32');
INSERT INTO `role2` VALUES (9, '0002', '编辑', '0002', '2018-12-13 01:47:49', '2018-12-13 01:47:49');

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission`  (
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `rolepermission_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `yd_perms` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rolepermission_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role2` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 1, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 2, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-13 17:19:09', '2018-12-13 17:19:09', 2, 9);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 3, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-13 17:19:09', '2018-12-13 17:19:09', 3, 9);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 4, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-13 17:19:09', '2018-12-13 17:19:09', 4, 9);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 5, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 6, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 7, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 8, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 9, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 10, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 11, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-13 11:10:51', '2018-12-13 11:10:51', 12, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-13 11:10:51', '2018-12-13 11:10:51', 13, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 14, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 15, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 16, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 17, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:01', '2018-12-11 17:25:01', 18, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 19, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 20, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 21, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 22, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 23, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:01', '2018-12-11 17:25:01', 24, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:07', '2018-12-11 17:25:07', 25, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 26, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 27, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 28, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 29, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:07', '2018-12-11 17:25:07', 30, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:07', '2018-12-11 17:25:07', 31, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 32, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:31', '2018-12-11 17:25:31', 33, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:31', '2018-12-11 17:25:31', 34, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 35, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 36, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:31', '2018-12-11 17:25:31', 37, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:31', '2018-12-11 17:25:31', 38, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:31', '2018-12-11 17:25:31', 39, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:31', '2018-12-11 17:25:31', 40, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:31', '2018-12-11 17:25:31', 41, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:22', '2018-12-11 17:25:22', 42, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-13 17:19:09', '2018-12-13 17:19:09', 42, 9);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:31', '2018-12-11 17:25:31', 44, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:31', '2018-12-11 17:25:31', 45, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:31', '2018-12-11 17:25:31', 46, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-11 17:25:31', '2018-12-11 17:25:31', 47, 8);
INSERT INTO `rolepermission` VALUES ('2018-12-13 17:46:54', '2018-12-13 17:46:54', 48, 8);

-- ----------------------------
-- Table structure for userdept
-- ----------------------------
DROP TABLE IF EXISTS `userdept`;
CREATE TABLE `userdept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`, `department_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  CONSTRAINT `userdept_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userdept_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `yd_depts` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userdept
-- ----------------------------
INSERT INTO `userdept` VALUES (2, '2018-12-17 14:42:00', '2018-12-17 14:42:00', 12);
INSERT INTO `userdept` VALUES (9, '2018-12-17 14:42:00', '2018-12-17 14:42:00', 12);

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role2` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES (2, '2018-12-13 09:48:10', '2018-12-13 09:48:10', 8);
INSERT INTO `userrole` VALUES (9, '2018-12-14 17:49:58', '2018-12-14 17:49:58', 9);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, '2018-09-12 08:28:08', '2018-12-17 06:37:22');
INSERT INTO `users` VALUES (9, 'dawang', '21232f297a57a5a743894a0e4a801fc3', 1, '2018-12-14 08:47:20', '2018-12-17 06:37:24');

-- ----------------------------
-- Table structure for yd_auths
-- ----------------------------
DROP TABLE IF EXISTS `yd_auths`;
CREATE TABLE `yd_auths`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pathname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `parentid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yd_auths
-- ----------------------------
INSERT INTO `yd_auths` VALUES (1, '/user/auth', '权限列表', '2018-09-12 01:57:22', '2018-09-14 09:20:58', NULL);
INSERT INTO `yd_auths` VALUES (2, '/user/role', '角色列表', '2018-09-12 02:00:40', '2018-09-12 08:33:37', NULL);
INSERT INTO `yd_auths` VALUES (3, '/user/list', '用户列表', '2018-09-12 02:01:05', '2018-09-14 06:05:30', NULL);
INSERT INTO `yd_auths` VALUES (4, '/documentation/index', '文档', '2018-09-14 07:37:24', '2018-09-14 07:37:24', -1);
INSERT INTO `yd_auths` VALUES (5, '/guide/index', '引导页', '2018-09-14 07:38:06', '2018-09-14 07:38:06', -1);
INSERT INTO `yd_auths` VALUES (6, '/permission/page', '页面权限', '2018-09-14 07:41:17', '2018-09-14 09:21:20', NULL);
INSERT INTO `yd_auths` VALUES (7, '/permission/directive', '指令权限', '2018-09-14 07:43:25', '2018-09-14 09:21:27', NULL);
INSERT INTO `yd_auths` VALUES (8, '/icon/index', '图标', '2018-09-14 07:47:10', '2018-09-14 07:47:10', NULL);
INSERT INTO `yd_auths` VALUES (9, '/components/tinymce', '富文本编辑器', '2018-09-14 07:48:13', '2018-09-14 07:48:13', NULL);
INSERT INTO `yd_auths` VALUES (10, '/components/markdown', 'markdown', '2018-09-14 07:48:34', '2018-09-14 07:48:34', NULL);
INSERT INTO `yd_auths` VALUES (11, '/components/json-editor', 'JSON编辑器', '2018-09-14 07:49:08', '2018-09-14 07:49:08', NULL);
INSERT INTO `yd_auths` VALUES (12, '/components/splitpane', 'Splitpane', '2018-09-14 07:49:25', '2018-09-14 07:49:25', NULL);
INSERT INTO `yd_auths` VALUES (13, '/components/avatar-upload', '头像上传', '2018-09-14 07:50:05', '2018-09-14 07:50:05', NULL);
INSERT INTO `yd_auths` VALUES (14, '/components/dropzone', 'Dropzone', '2018-09-14 07:51:00', '2018-09-14 07:51:00', NULL);
INSERT INTO `yd_auths` VALUES (15, '/components/sticky', 'Sticky', '2018-09-14 07:51:43', '2018-09-14 07:51:43', NULL);
INSERT INTO `yd_auths` VALUES (16, '/components/count-to', 'CountTo', '2018-09-14 07:53:42', '2018-09-14 07:53:42', NULL);
INSERT INTO `yd_auths` VALUES (17, '/components/mixin', '小组件', '2018-09-14 07:53:58', '2018-09-14 07:53:58', NULL);
INSERT INTO `yd_auths` VALUES (18, '/components/back-to-top', '返回顶部', '2018-09-14 07:54:20', '2018-09-14 07:54:20', NULL);
INSERT INTO `yd_auths` VALUES (19, '/components/drag-dialog', '可拖拽看板', '2018-09-14 07:54:46', '2018-09-14 07:54:46', NULL);
INSERT INTO `yd_auths` VALUES (20, '/charts/keyboard', '键盘图表', '2018-09-14 07:55:09', '2018-09-14 07:55:09', NULL);
INSERT INTO `yd_auths` VALUES (21, '/charts/line', '折线图', '2018-09-14 07:55:49', '2018-09-14 07:55:49', NULL);
INSERT INTO `yd_auths` VALUES (22, '/charts/mixchart', '混合图表', '2018-09-14 07:56:01', '2018-09-14 07:56:01', NULL);
INSERT INTO `yd_auths` VALUES (23, '/table/dynamic-table', '动态表单', '2018-09-14 08:12:05', '2018-09-14 08:12:05', NULL);
INSERT INTO `yd_auths` VALUES (24, '/table/drag-table', '拖拽表单', '2018-09-14 08:12:36', '2018-09-14 08:12:36', NULL);
INSERT INTO `yd_auths` VALUES (25, '/table/inline-edit-table', 'Table内编辑', '2018-09-14 08:15:21', '2018-09-14 08:15:21', NULL);
INSERT INTO `yd_auths` VALUES (26, '/table/tree-table', '树形表单', '2018-09-14 08:15:40', '2018-09-14 08:15:40', NULL);
INSERT INTO `yd_auths` VALUES (27, '/table/custom-tree-table', '自定义树形', '2018-09-14 08:16:03', '2018-09-14 08:16:03', NULL);
INSERT INTO `yd_auths` VALUES (28, '/table/complex-table', '综合Table', '2018-09-14 08:17:01', '2018-09-14 08:17:01', NULL);
INSERT INTO `yd_auths` VALUES (29, '/example/create', '创建文章', '2018-09-14 08:17:30', '2018-09-14 08:17:30', NULL);
INSERT INTO `yd_auths` VALUES (30, '/example/list', '文章列表', '2018-09-14 08:19:26', '2018-09-14 08:19:26', NULL);
INSERT INTO `yd_auths` VALUES (31, '/tab/index', 'Tab', '2018-09-14 08:19:52', '2018-09-14 08:19:52', NULL);
INSERT INTO `yd_auths` VALUES (32, '/error/401', '错误页面401', '2018-09-14 08:20:22', '2018-09-14 08:21:04', NULL);
INSERT INTO `yd_auths` VALUES (33, '/error/404', '错误页面404', '2018-09-14 08:21:14', '2018-09-14 08:21:14', NULL);
INSERT INTO `yd_auths` VALUES (34, '/error-log/log', '错误日志', '2018-09-14 08:22:29', '2018-09-14 08:22:29', NULL);
INSERT INTO `yd_auths` VALUES (35, '/excel/export-excel', 'Excel export', '2018-09-14 08:24:00', '2018-09-14 08:24:00', NULL);
INSERT INTO `yd_auths` VALUES (36, '/excel/export-selected-excel', 'Excel-select', '2018-09-14 08:24:32', '2018-09-14 08:24:32', NULL);
INSERT INTO `yd_auths` VALUES (37, '/excel/upload-excel', 'Excel-upload', '2018-09-14 08:27:38', '2018-09-14 08:27:38', NULL);
INSERT INTO `yd_auths` VALUES (38, '/zip/download', 'Zip Export', '2018-09-14 08:28:33', '2018-09-14 08:28:33', NULL);
INSERT INTO `yd_auths` VALUES (39, '/theme/index', '换肤', '2018-09-14 08:29:56', '2018-09-14 08:29:56', NULL);
INSERT INTO `yd_auths` VALUES (40, '/clipboard/index', '剪切板', '2018-09-14 08:30:35', '2018-09-14 08:30:35', NULL);
INSERT INTO `yd_auths` VALUES (41, '/i18n/index', '国际化', '2018-09-14 08:30:53', '2018-09-14 08:30:53', NULL);
INSERT INTO `yd_auths` VALUES (42, '/dashboard', '首页', '2018-09-14 08:36:35', '2018-09-14 08:36:35', -1);
INSERT INTO `yd_auths` VALUES (43, '/permission', '权限', '2018-09-14 09:20:51', '2018-09-14 09:20:51', -1);
INSERT INTO `yd_auths` VALUES (44, '/dept/list', '部门列表', '2018-11-19 09:18:27', '2018-11-19 09:18:27', -1);
INSERT INTO `yd_auths` VALUES (45, '/user/menu', '菜单列表', '2018-12-05 11:58:25', '2018-12-05 11:58:29', NULL);
INSERT INTO `yd_auths` VALUES (46, '/components/dnd-list', '列表拖拽', '2018-12-06 06:33:39', '2018-12-06 06:33:39', -1);
INSERT INTO `yd_auths` VALUES (47, '/components/drag-kanban', '可拖拽看板', '2018-12-06 06:36:54', '2018-12-06 06:36:54', -1);

-- ----------------------------
-- Table structure for yd_depts
-- ----------------------------
DROP TABLE IF EXISTS `yd_depts`;
CREATE TABLE `yd_depts`  (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `is_child` int(11) NULL DEFAULT 0,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`department_id`) USING BTREE,
  UNIQUE INDEX `departmentCode`(`department_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yd_depts
-- ----------------------------
INSERT INTO `yd_depts` VALUES (8, '001', '北京快鱼电子', 0, 0, '2018-12-14 02:36:27', '2018-12-14 02:36:27');
INSERT INTO `yd_depts` VALUES (9, '002', '四川快鱼电子', 0, 0, '2018-12-14 02:36:35', '2018-12-14 02:36:35');
INSERT INTO `yd_depts` VALUES (10, '005', '生产部', 9, 0, '2018-12-14 02:36:50', '2018-12-14 02:36:50');
INSERT INTO `yd_depts` VALUES (11, '006', '销售部', 9, 0, '2018-12-14 02:37:00', '2018-12-14 02:37:00');
INSERT INTO `yd_depts` VALUES (12, '009', '研发部', 10, 0, '2018-12-14 02:37:12', '2018-12-14 02:37:12');

-- ----------------------------
-- Table structure for yd_perms
-- ----------------------------
DROP TABLE IF EXISTS `yd_perms`;
CREATE TABLE `yd_perms`  (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `column_id` int(11) NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE,
  UNIQUE INDEX `permission_code`(`permission_code`) USING BTREE,
  UNIQUE INDEX `permission_uri`(`permission_uri`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yd_perms
-- ----------------------------
INSERT INTO `yd_perms` VALUES (1, NULL, '/user/auth', '权限列表', NULL, '2018-09-12 01:57:22', '2018-09-14 09:20:58');
INSERT INTO `yd_perms` VALUES (2, NULL, '/user/role', '角色列表', NULL, '2018-09-12 02:00:40', '2018-09-12 08:33:37');
INSERT INTO `yd_perms` VALUES (3, NULL, '/user/list', '用户列表', NULL, '2018-09-12 02:01:05', '2018-09-14 06:05:30');
INSERT INTO `yd_perms` VALUES (4, NULL, '/documentation/index', '文档', NULL, '2018-09-14 07:37:24', '2018-09-14 07:37:24');
INSERT INTO `yd_perms` VALUES (5, NULL, '/guide/index', '引导页', NULL, '2018-09-14 07:38:06', '2018-09-14 07:38:06');
INSERT INTO `yd_perms` VALUES (6, NULL, '/permission/page', '页面权限', NULL, '2018-09-14 07:41:17', '2018-09-14 09:21:20');
INSERT INTO `yd_perms` VALUES (7, NULL, '/permission/directive', '指令权限', NULL, '2018-09-14 07:43:25', '2018-09-14 09:21:27');
INSERT INTO `yd_perms` VALUES (8, NULL, '/icon/index', '图标', NULL, '2018-09-14 07:47:10', '2018-09-14 07:47:10');
INSERT INTO `yd_perms` VALUES (9, NULL, '/components/tinymce', '富文本编辑器', NULL, '2018-09-14 07:48:13', '2018-09-14 07:48:13');
INSERT INTO `yd_perms` VALUES (10, NULL, '/components/markdown', 'markdown', NULL, '2018-09-14 07:48:34', '2018-09-14 07:48:34');
INSERT INTO `yd_perms` VALUES (11, NULL, '/components/json-editor', 'JSON编辑器', NULL, '2018-09-14 07:49:08', '2018-09-14 07:49:08');
INSERT INTO `yd_perms` VALUES (12, NULL, '/components/splitpane', 'Splitpane', NULL, '2018-09-14 07:49:25', '2018-09-14 07:49:25');
INSERT INTO `yd_perms` VALUES (13, NULL, '/components/avatar-upload', '头像上传', NULL, '2018-09-14 07:50:05', '2018-09-14 07:50:05');
INSERT INTO `yd_perms` VALUES (14, NULL, '/components/dropzone', 'Dropzone', NULL, '2018-09-14 07:51:00', '2018-09-14 07:51:00');
INSERT INTO `yd_perms` VALUES (15, NULL, '/components/sticky', 'Sticky', NULL, '2018-09-14 07:51:43', '2018-09-14 07:51:43');
INSERT INTO `yd_perms` VALUES (16, NULL, '/components/count-to', 'CountTo', NULL, '2018-09-14 07:53:42', '2018-09-14 07:53:42');
INSERT INTO `yd_perms` VALUES (17, NULL, '/components/mixin', '小组件', NULL, '2018-09-14 07:53:58', '2018-09-14 07:53:58');
INSERT INTO `yd_perms` VALUES (18, NULL, '/components/back-to-top', '返回顶部', NULL, '2018-09-14 07:54:20', '2018-09-14 07:54:20');
INSERT INTO `yd_perms` VALUES (19, NULL, '/components/drag-dialog', '可拖拽看板', NULL, '2018-09-14 07:54:46', '2018-09-14 07:54:46');
INSERT INTO `yd_perms` VALUES (20, NULL, '/charts/keyboard', '键盘图表', NULL, '2018-09-14 07:55:09', '2018-09-14 07:55:09');
INSERT INTO `yd_perms` VALUES (21, NULL, '/charts/line', '折线图', NULL, '2018-09-14 07:55:49', '2018-09-14 07:55:49');
INSERT INTO `yd_perms` VALUES (22, NULL, '/charts/mixchart', '混合图表', NULL, '2018-09-14 07:56:01', '2018-09-14 07:56:01');
INSERT INTO `yd_perms` VALUES (23, NULL, '/table/dynamic-table', '动态表单', NULL, '2018-09-14 08:12:05', '2018-09-14 08:12:05');
INSERT INTO `yd_perms` VALUES (24, NULL, '/table/drag-table', '拖拽表单', NULL, '2018-09-14 08:12:36', '2018-09-14 08:12:36');
INSERT INTO `yd_perms` VALUES (25, NULL, '/table/inline-edit-table', 'Table内编辑', NULL, '2018-09-14 08:15:21', '2018-09-14 08:15:21');
INSERT INTO `yd_perms` VALUES (26, NULL, '/table/tree-table', '树形表单', NULL, '2018-09-14 08:15:40', '2018-09-14 08:15:40');
INSERT INTO `yd_perms` VALUES (27, NULL, '/table/custom-tree-table', '自定义树形', NULL, '2018-09-14 08:16:03', '2018-09-14 08:16:03');
INSERT INTO `yd_perms` VALUES (28, NULL, '/table/complex-table', '综合Table', NULL, '2018-09-14 08:17:01', '2018-09-14 08:17:01');
INSERT INTO `yd_perms` VALUES (29, NULL, '/example/create', '创建文章', NULL, '2018-09-14 08:17:30', '2018-09-14 08:17:30');
INSERT INTO `yd_perms` VALUES (30, NULL, '/example/list', '文章列表', NULL, '2018-09-14 08:19:26', '2018-09-14 08:19:26');
INSERT INTO `yd_perms` VALUES (31, NULL, '/tab/index', 'Tab', NULL, '2018-09-14 08:19:52', '2018-09-14 08:19:52');
INSERT INTO `yd_perms` VALUES (32, NULL, '/error/401', '错误页面401', NULL, '2018-09-14 08:20:22', '2018-09-14 08:21:04');
INSERT INTO `yd_perms` VALUES (33, NULL, '/error/404', '错误页面404', NULL, '2018-09-14 08:21:14', '2018-09-14 08:21:14');
INSERT INTO `yd_perms` VALUES (34, NULL, '/error-log/log', '错误日志', NULL, '2018-09-14 08:22:29', '2018-09-14 08:22:29');
INSERT INTO `yd_perms` VALUES (35, NULL, '/excel/export-excel', 'Excel export', NULL, '2018-09-14 08:24:00', '2018-09-14 08:24:00');
INSERT INTO `yd_perms` VALUES (36, NULL, '/excel/export-selected-excel', 'Excel-select', NULL, '2018-09-14 08:24:32', '2018-09-14 08:24:32');
INSERT INTO `yd_perms` VALUES (37, NULL, '/excel/upload-excel', 'Excel-upload', NULL, '2018-09-14 08:27:38', '2018-09-14 08:27:38');
INSERT INTO `yd_perms` VALUES (38, NULL, '/zip/download', 'Zip Export', NULL, '2018-09-14 08:28:33', '2018-09-14 08:28:33');
INSERT INTO `yd_perms` VALUES (39, NULL, '/theme/index', '换肤', NULL, '2018-09-14 08:29:56', '2018-09-14 08:29:56');
INSERT INTO `yd_perms` VALUES (40, NULL, '/clipboard/index', '剪切板', NULL, '2018-09-14 08:30:35', '2018-09-14 08:30:35');
INSERT INTO `yd_perms` VALUES (41, NULL, '/i18n/index', '国际化', NULL, '2018-09-14 08:30:53', '2018-09-14 08:30:53');
INSERT INTO `yd_perms` VALUES (42, NULL, '/dashboard', '首页', NULL, '2018-09-14 08:36:35', '2018-09-14 08:36:35');
INSERT INTO `yd_perms` VALUES (44, NULL, '/dept/list', '部门列表', NULL, '2018-11-19 09:18:27', '2018-11-19 09:18:27');
INSERT INTO `yd_perms` VALUES (45, NULL, '/user/menu', '菜单列表', NULL, '2018-12-05 11:58:25', '2018-12-05 11:58:29');
INSERT INTO `yd_perms` VALUES (46, NULL, '/components/dnd-list', '列表拖拽', NULL, '2018-12-06 06:33:39', '2018-12-06 06:33:39');
INSERT INTO `yd_perms` VALUES (47, NULL, '/components/drag-kanban', '可拖拽看板', NULL, '2018-12-06 06:36:54', '2018-12-06 06:36:54');
INSERT INTO `yd_perms` VALUES (48, 'i18n', '/i18n', 'i18n', NULL, '2018-12-13 09:46:14', '2018-12-13 09:46:14');

-- ----------------------------
-- Table structure for yd_roles
-- ----------------------------
DROP TABLE IF EXISTS `yd_roles`;
CREATE TABLE `yd_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yd_roles
-- ----------------------------
INSERT INTO `yd_roles` VALUES (1, '超级管理员', '3,2,1,4,5,6,9,11,8,7,10,12,13,15,19,16,22,21,18,17,14,20,23,24,26,25,27,28,30,29,31,33,32,34,35,37,36,38,39,40,41,42,43,44,45,46,47', '2018-09-12 08:40:55', '2018-12-06 06:37:01');
INSERT INTO `yd_roles` VALUES (2, '编辑', NULL, '2018-12-07 02:02:20', '2018-12-07 02:02:20');

-- ----------------------------
-- Table structure for yd_users
-- ----------------------------
DROP TABLE IF EXISTS `yd_users`;
CREATE TABLE `yd_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `yd_role_id` int(11) NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `yd_role_id`(`yd_role_id`) USING BTREE,
  CONSTRAINT `yd_users_ibfk_1` FOREIGN KEY (`yd_role_id`) REFERENCES `yd_roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yd_users
-- ----------------------------
INSERT INTO `yd_users` VALUES (2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 1, '2018-09-12 08:28:08', '2018-12-13 02:59:26');

SET FOREIGN_KEY_CHECKS = 1;
