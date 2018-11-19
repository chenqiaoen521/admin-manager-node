/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : yongdian

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2018-09-14 17:49:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yd_auths
-- ----------------------------
DROP TABLE IF EXISTS `yd_auths`;
CREATE TABLE `yd_auths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `pathname` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yd_auths
-- ----------------------------
INSERT INTO `yd_auths` VALUES ('1', '/user/auth', '权限列表', '2018-09-12 01:57:22', '2018-09-14 09:20:58', null);
INSERT INTO `yd_auths` VALUES ('2', '/user/role', '角色列表', '2018-09-12 02:00:40', '2018-09-12 08:33:37', null);
INSERT INTO `yd_auths` VALUES ('3', '/user/list', '用户列表', '2018-09-12 02:01:05', '2018-09-14 06:05:30', null);
INSERT INTO `yd_auths` VALUES ('4', '/documentation/index', '文档', '2018-09-14 07:37:24', '2018-09-14 07:37:24', '-1');
INSERT INTO `yd_auths` VALUES ('5', '/guide/index', '引导页', '2018-09-14 07:38:06', '2018-09-14 07:38:06', '-1');
INSERT INTO `yd_auths` VALUES ('6', '/permission/page', '页面权限', '2018-09-14 07:41:17', '2018-09-14 09:21:20', null);
INSERT INTO `yd_auths` VALUES ('7', '/permission/directive', '指令权限', '2018-09-14 07:43:25', '2018-09-14 09:21:27', null);
INSERT INTO `yd_auths` VALUES ('8', '/icon/index', '图标', '2018-09-14 07:47:10', '2018-09-14 07:47:10', null);
INSERT INTO `yd_auths` VALUES ('9', '/components/tinymce', '富文本编辑器', '2018-09-14 07:48:13', '2018-09-14 07:48:13', null);
INSERT INTO `yd_auths` VALUES ('10', '/components/markdown', 'markdown', '2018-09-14 07:48:34', '2018-09-14 07:48:34', null);
INSERT INTO `yd_auths` VALUES ('11', '/components/json-editor', 'JSON编辑器', '2018-09-14 07:49:08', '2018-09-14 07:49:08', null);
INSERT INTO `yd_auths` VALUES ('12', '/components/splitpane', 'Splitpane', '2018-09-14 07:49:25', '2018-09-14 07:49:25', null);
INSERT INTO `yd_auths` VALUES ('13', '/components/avatar-upload', '头像上传', '2018-09-14 07:50:05', '2018-09-14 07:50:05', null);
INSERT INTO `yd_auths` VALUES ('14', '/components/dropzone', 'Dropzone', '2018-09-14 07:51:00', '2018-09-14 07:51:00', null);
INSERT INTO `yd_auths` VALUES ('15', '/components/sticky', 'Sticky', '2018-09-14 07:51:43', '2018-09-14 07:51:43', null);
INSERT INTO `yd_auths` VALUES ('16', '/components/count-to', 'CountTo', '2018-09-14 07:53:42', '2018-09-14 07:53:42', null);
INSERT INTO `yd_auths` VALUES ('17', '/components/mixin', '小组件', '2018-09-14 07:53:58', '2018-09-14 07:53:58', null);
INSERT INTO `yd_auths` VALUES ('18', '/components/back-to-top', '返回顶部', '2018-09-14 07:54:20', '2018-09-14 07:54:20', null);
INSERT INTO `yd_auths` VALUES ('19', '/components/drag-dialog', '可拖拽看板', '2018-09-14 07:54:46', '2018-09-14 07:54:46', null);
INSERT INTO `yd_auths` VALUES ('20', '/charts/keyboard', '键盘图表', '2018-09-14 07:55:09', '2018-09-14 07:55:09', null);
INSERT INTO `yd_auths` VALUES ('21', '/charts/line', '折线图', '2018-09-14 07:55:49', '2018-09-14 07:55:49', null);
INSERT INTO `yd_auths` VALUES ('22', '/charts/mixchart', '混合图表', '2018-09-14 07:56:01', '2018-09-14 07:56:01', null);
INSERT INTO `yd_auths` VALUES ('23', '/table/dynamic-table', '动态表单', '2018-09-14 08:12:05', '2018-09-14 08:12:05', null);
INSERT INTO `yd_auths` VALUES ('24', '/table/drag-table', '拖拽表单', '2018-09-14 08:12:36', '2018-09-14 08:12:36', null);
INSERT INTO `yd_auths` VALUES ('25', '/table/inline-edit-table', 'Table内编辑', '2018-09-14 08:15:21', '2018-09-14 08:15:21', null);
INSERT INTO `yd_auths` VALUES ('26', '/table/tree-table', '树形表单', '2018-09-14 08:15:40', '2018-09-14 08:15:40', null);
INSERT INTO `yd_auths` VALUES ('27', '/table/custom-tree-table', '自定义树形', '2018-09-14 08:16:03', '2018-09-14 08:16:03', null);
INSERT INTO `yd_auths` VALUES ('28', '/table/complex-table', '综合Table', '2018-09-14 08:17:01', '2018-09-14 08:17:01', null);
INSERT INTO `yd_auths` VALUES ('29', '/example/create', '创建文章', '2018-09-14 08:17:30', '2018-09-14 08:17:30', null);
INSERT INTO `yd_auths` VALUES ('30', '/example/list', '文章列表', '2018-09-14 08:19:26', '2018-09-14 08:19:26', null);
INSERT INTO `yd_auths` VALUES ('31', '/tab/index', 'Tab', '2018-09-14 08:19:52', '2018-09-14 08:19:52', null);
INSERT INTO `yd_auths` VALUES ('32', '/error/401', '错误页面401', '2018-09-14 08:20:22', '2018-09-14 08:21:04', null);
INSERT INTO `yd_auths` VALUES ('33', '/error/404', '错误页面404', '2018-09-14 08:21:14', '2018-09-14 08:21:14', null);
INSERT INTO `yd_auths` VALUES ('34', '/error-log/log', '错误日志', '2018-09-14 08:22:29', '2018-09-14 08:22:29', null);
INSERT INTO `yd_auths` VALUES ('35', '/excel/export-excel', 'Excel export', '2018-09-14 08:24:00', '2018-09-14 08:24:00', null);
INSERT INTO `yd_auths` VALUES ('36', '/excel/export-selected-excel', 'Excel-select', '2018-09-14 08:24:32', '2018-09-14 08:24:32', null);
INSERT INTO `yd_auths` VALUES ('37', '/excel/upload-excel', 'Excel-upload', '2018-09-14 08:27:38', '2018-09-14 08:27:38', null);
INSERT INTO `yd_auths` VALUES ('38', '/zip/download', 'Zip Export', '2018-09-14 08:28:33', '2018-09-14 08:28:33', null);
INSERT INTO `yd_auths` VALUES ('39', '/theme/index', '换肤', '2018-09-14 08:29:56', '2018-09-14 08:29:56', null);
INSERT INTO `yd_auths` VALUES ('40', '/clipboard/index', '剪切板', '2018-09-14 08:30:35', '2018-09-14 08:30:35', null);
INSERT INTO `yd_auths` VALUES ('41', '/i18n/index', '国际化', '2018-09-14 08:30:53', '2018-09-14 08:30:53', null);
INSERT INTO `yd_auths` VALUES ('42', '/dashboard', '首页', '2018-09-14 08:36:35', '2018-09-14 08:36:35', '-1');
INSERT INTO `yd_auths` VALUES ('43', '/permission', '权限', '2018-09-14 09:20:51', '2018-09-14 09:20:51', '-1');

-- ----------------------------
-- Table structure for yd_roles
-- ----------------------------
DROP TABLE IF EXISTS `yd_roles`;
CREATE TABLE `yd_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `groupid` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yd_roles
-- ----------------------------
INSERT INTO `yd_roles` VALUES ('1', '超级管理员', '3,2,1,4,5,6,9,11,8,7,10,12,13,15,19,16,22,21,18,17,14,20,23,24,26,25,27,28,30,29,31,33,32,34,35,37,36,38,39,40,41,42', '2018-09-12 08:40:55', '2018-09-14 08:36:44');

-- ----------------------------
-- Table structure for yd_users
-- ----------------------------
DROP TABLE IF EXISTS `yd_users`;
CREATE TABLE `yd_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `yd_role_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `yd_role_id` (`yd_role_id`),
  CONSTRAINT `yd_users_ibfk_1` FOREIGN KEY (`yd_role_id`) REFERENCES `yd_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yd_users
-- ----------------------------
INSERT INTO `yd_users` VALUES ('2', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', '1', '2018-09-12 08:28:08', '2018-09-14 02:17:49');
