/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jboot-admin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-23 12:12:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_data`;
CREATE TABLE `sys_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '代码',
  `codeDesc` varchar(200) DEFAULT NULL COMMENT '代码描述',
  `type` varchar(20) DEFAULT NULL COMMENT '类型代码',
  `typeDesc` varchar(200) DEFAULT NULL COMMENT '类型描述',
  `status` varchar(2) DEFAULT NULL COMMENT '状态 0-未生效 1-已生效',
  `orderNo` varchar(255) DEFAULT NULL COMMENT '排序',
  `createDate` datetime DEFAULT NULL,
  `lastUpdAcct` varchar(20) DEFAULT NULL,
  `lastUpdTime` datetime DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_data
-- ----------------------------
INSERT INTO `sys_data` VALUES ('1', '0', '未启用', 'STATUS_COMMON', '通用状态', '1', '1', '2016-09-28 11:00:18', 'admin', '2018-01-17 19:07:18', '修改数据字典');
INSERT INTO `sys_data` VALUES ('2', '1', '启用', 'STATUS_COMMON', '通用状态', '1', '2', '2016-09-28 11:00:56', 'sys', '2016-09-28 11:00:18', '初始数据');
INSERT INTO `sys_data` VALUES ('3', '0', '正常', 'STATUS_USER4S', '系统用户状态', '1', '1', '2016-09-28 11:20:03', 'sys', '2016-09-28 11:20:03', '添加数据字典');
INSERT INTO `sys_data` VALUES ('4', '2', '冻结', 'STATUS_USER4S', '系统用户状态', '1', '2', '2016-09-28 11:20:38', 'sys', '2017-10-17 10:35:59', '启用数据');
INSERT INTO `sys_data` VALUES ('5', '1', '菜单', 'TYPE_SYSTEM_RES', '资源类型1-菜单 2-功能', '1', '1', '2016-10-18 14:37:15', 'sys', '2016-10-18 14:37:15', '添加数据字典');
INSERT INTO `sys_data` VALUES ('6', '2', '功能', 'TYPE_SYSTEM_RES', '资源类型1-菜单 2-功能', '1', '2', '2016-10-18 14:38:15', 'sys', '2016-10-18 14:38:15', '添加数据字典');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `operation` varchar(20) DEFAULT NULL COMMENT 'GET/POST',
  `from` varchar(255) DEFAULT NULL COMMENT '来源 url',
  `ip` varchar(200) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `status` varchar(2) DEFAULT '1' COMMENT '1-记录',
  `lastUpdAcct` varchar(20) DEFAULT NULL,
  `lastUpdTime` datetime DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sys_EVENT` (`uid`) USING BTREE,
  CONSTRAINT `sys_log_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-01-15 17:53:30', '1', 'guest', '2018-01-15 17:53:30', '记录日志');
INSERT INTO `sys_log` VALUES ('2', null, 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/captcha', '2018-01-15 17:53:31', '1', 'guest', '2018-01-15 17:53:31', '记录日志');
INSERT INTO `sys_log` VALUES ('3', null, 'Chrome', 'POST', 'http://127.0.0.1:8888/login', '127.0.0.1', '/postLogin', '2018-01-15 17:53:40', '1', 'guest', '2018-01-15 17:53:40', '记录日志');
INSERT INTO `sys_log` VALUES ('4', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-15 17:53:40', '1', 'admin', '2018-01-15 17:53:40', '记录日志');
INSERT INTO `sys_log` VALUES ('5', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-15 17:53:40', '1', 'admin', '2018-01-15 17:53:40', '记录日志');
INSERT INTO `sys_log` VALUES ('6', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-15 17:53:41', '1', 'admin', '2018-01-15 17:53:41', '记录日志');
INSERT INTO `sys_log` VALUES ('7', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-15 17:53:41', '1', 'admin', '2018-01-15 17:53:41', '记录日志');
INSERT INTO `sys_log` VALUES ('8', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-15 17:53:45', '1', 'admin', '2018-01-15 17:53:45', '记录日志');
INSERT INTO `sys_log` VALUES ('9', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/data/tableData', '2018-01-15 17:53:46', '1', 'admin', '2018-01-15 17:53:46', '记录日志');
INSERT INTO `sys_log` VALUES ('10', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 17:54:04', '1', 'admin', '2018-01-15 17:54:04', '记录日志');
INSERT INTO `sys_log` VALUES ('11', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-15 17:58:45', '1', 'admin', '2018-01-15 17:58:45', '记录日志');
INSERT INTO `sys_log` VALUES ('12', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-15 17:58:46', '1', 'admin', '2018-01-15 17:58:46', '记录日志');
INSERT INTO `sys_log` VALUES ('13', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-15 17:58:46', '1', 'admin', '2018-01-15 17:58:46', '记录日志');
INSERT INTO `sys_log` VALUES ('14', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-15 17:58:46', '1', 'admin', '2018-01-15 17:58:46', '记录日志');
INSERT INTO `sys_log` VALUES ('15', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-15 17:58:55', '1', 'admin', '2018-01-15 17:58:55', '记录日志');
INSERT INTO `sys_log` VALUES ('16', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/data/tableData', '2018-01-15 17:58:55', '1', 'admin', '2018-01-15 17:58:55', '记录日志');
INSERT INTO `sys_log` VALUES ('17', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/data/tableData', '2018-01-15 17:59:40', '1', 'admin', '2018-01-15 17:59:40', '记录日志');
INSERT INTO `sys_log` VALUES ('18', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-15 18:00:54', '1', 'admin', '2018-01-15 18:00:54', '记录日志');
INSERT INTO `sys_log` VALUES ('19', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:00:54', '1', 'admin', '2018-01-15 18:00:54', '记录日志');
INSERT INTO `sys_log` VALUES ('20', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:03:45', '1', 'admin', '2018-01-15 18:03:45', '记录日志');
INSERT INTO `sys_log` VALUES ('21', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-15 18:03:48', '1', 'admin', '2018-01-15 18:03:48', '记录日志');
INSERT INTO `sys_log` VALUES ('22', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:03:49', '1', 'admin', '2018-01-15 18:03:49', '记录日志');
INSERT INTO `sys_log` VALUES ('23', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:04:43', '1', 'admin', '2018-01-15 18:04:43', '记录日志');
INSERT INTO `sys_log` VALUES ('24', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-15 18:04:46', '1', 'admin', '2018-01-15 18:04:46', '记录日志');
INSERT INTO `sys_log` VALUES ('25', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:04:47', '1', 'admin', '2018-01-15 18:04:47', '记录日志');
INSERT INTO `sys_log` VALUES ('26', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-15 18:06:12', '1', 'admin', '2018-01-15 18:06:12', '记录日志');
INSERT INTO `sys_log` VALUES ('27', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:06:12', '1', 'admin', '2018-01-15 18:06:12', '记录日志');
INSERT INTO `sys_log` VALUES ('28', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-15 18:10:07', '1', 'admin', '2018-01-15 18:10:07', '记录日志');
INSERT INTO `sys_log` VALUES ('29', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-15 18:10:08', '1', 'admin', '2018-01-15 18:10:08', '记录日志');
INSERT INTO `sys_log` VALUES ('30', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-15 18:10:09', '1', 'admin', '2018-01-15 18:10:09', '记录日志');
INSERT INTO `sys_log` VALUES ('31', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-15 18:10:09', '1', 'admin', '2018-01-15 18:10:09', '记录日志');
INSERT INTO `sys_log` VALUES ('32', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-15 18:10:11', '1', 'admin', '2018-01-15 18:10:11', '记录日志');
INSERT INTO `sys_log` VALUES ('33', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:10:11', '1', 'admin', '2018-01-15 18:10:11', '记录日志');
INSERT INTO `sys_log` VALUES ('34', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:10:20', '1', 'admin', '2018-01-15 18:10:20', '记录日志');
INSERT INTO `sys_log` VALUES ('35', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:10:23', '1', 'admin', '2018-01-15 18:10:23', '记录日志');
INSERT INTO `sys_log` VALUES ('36', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:10:27', '1', 'admin', '2018-01-15 18:10:27', '记录日志');
INSERT INTO `sys_log` VALUES ('37', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:10:31', '1', 'admin', '2018-01-15 18:10:31', '记录日志');
INSERT INTO `sys_log` VALUES ('38', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:10:38', '1', 'admin', '2018-01-15 18:10:38', '记录日志');
INSERT INTO `sys_log` VALUES ('39', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:10:40', '1', 'admin', '2018-01-15 18:10:40', '记录日志');
INSERT INTO `sys_log` VALUES ('40', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-15 18:11:59', '1', 'admin', '2018-01-15 18:11:59', '记录日志');
INSERT INTO `sys_log` VALUES ('41', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:11:59', '1', 'admin', '2018-01-15 18:11:59', '记录日志');
INSERT INTO `sys_log` VALUES ('42', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:12:03', '1', 'admin', '2018-01-15 18:12:03', '记录日志');
INSERT INTO `sys_log` VALUES ('43', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-15 18:12:36', '1', 'admin', '2018-01-15 18:12:36', '记录日志');
INSERT INTO `sys_log` VALUES ('44', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:12:37', '1', 'admin', '2018-01-15 18:12:37', '记录日志');
INSERT INTO `sys_log` VALUES ('45', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:12:40', '1', 'admin', '2018-01-15 18:12:40', '记录日志');
INSERT INTO `sys_log` VALUES ('46', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:12:42', '1', 'admin', '2018-01-15 18:12:42', '记录日志');
INSERT INTO `sys_log` VALUES ('47', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:12:46', '1', 'admin', '2018-01-15 18:12:46', '记录日志');
INSERT INTO `sys_log` VALUES ('48', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:12:47', '1', 'admin', '2018-01-15 18:12:47', '记录日志');
INSERT INTO `sys_log` VALUES ('49', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:12:50', '1', 'admin', '2018-01-15 18:12:50', '记录日志');
INSERT INTO `sys_log` VALUES ('50', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-15 18:13:00', '1', 'admin', '2018-01-15 18:13:00', '记录日志');
INSERT INTO `sys_log` VALUES ('51', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-15 18:13:19', '1', 'admin', '2018-01-15 18:13:19', '记录日志');
INSERT INTO `sys_log` VALUES ('52', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-15 18:13:19', '1', 'admin', '2018-01-15 18:13:19', '记录日志');
INSERT INTO `sys_log` VALUES ('53', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-15 18:13:19', '1', 'admin', '2018-01-15 18:13:19', '记录日志');
INSERT INTO `sys_log` VALUES ('54', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-15 18:13:35', '1', 'admin', '2018-01-15 18:13:35', '记录日志');
INSERT INTO `sys_log` VALUES ('55', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/changepwd', '2018-01-15 18:13:36', '1', 'admin', '2018-01-15 18:13:36', '记录日志');
INSERT INTO `sys_log` VALUES ('56', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/', '2018-01-15 18:13:46', '1', 'admin', '2018-01-15 18:13:46', '记录日志');
INSERT INTO `sys_log` VALUES ('57', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-15 18:13:47', '1', 'admin', '2018-01-15 18:13:47', '记录日志');
INSERT INTO `sys_log` VALUES ('58', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-15 18:13:47', '1', 'admin', '2018-01-15 18:13:47', '记录日志');
INSERT INTO `sys_log` VALUES ('59', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-15 18:13:47', '1', 'admin', '2018-01-15 18:13:47', '记录日志');
INSERT INTO `sys_log` VALUES ('60', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-15 18:13:49', '1', 'admin', '2018-01-15 18:13:49', '记录日志');
INSERT INTO `sys_log` VALUES ('61', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-15 18:13:51', '1', 'admin', '2018-01-15 18:13:51', '记录日志');
INSERT INTO `sys_log` VALUES ('62', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-15 18:13:51', '1', 'admin', '2018-01-15 18:13:51', '记录日志');
INSERT INTO `sys_log` VALUES ('63', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-15 18:13:51', '1', 'admin', '2018-01-15 18:13:51', '记录日志');
INSERT INTO `sys_log` VALUES ('64', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-15 18:23:42', '1', 'admin', '2018-01-15 18:23:42', '记录日志');
INSERT INTO `sys_log` VALUES ('65', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-15 18:23:43', '1', 'admin', '2018-01-15 18:23:43', '记录日志');
INSERT INTO `sys_log` VALUES ('66', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-15 18:23:44', '1', 'admin', '2018-01-15 18:23:44', '记录日志');
INSERT INTO `sys_log` VALUES ('67', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-15 18:23:44', '1', 'admin', '2018-01-15 18:23:44', '记录日志');
INSERT INTO `sys_log` VALUES ('68', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-15 18:23:45', '1', 'admin', '2018-01-15 18:23:45', '记录日志');
INSERT INTO `sys_log` VALUES ('69', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-15 18:23:46', '1', 'admin', '2018-01-15 18:23:46', '记录日志');
INSERT INTO `sys_log` VALUES ('70', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-15 18:23:46', '1', 'admin', '2018-01-15 18:23:46', '记录日志');
INSERT INTO `sys_log` VALUES ('71', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user', '2018-01-15 18:23:48', '1', 'admin', '2018-01-15 18:23:48', '记录日志');
INSERT INTO `sys_log` VALUES ('72', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/tableData', '2018-01-15 18:23:48', '1', 'admin', '2018-01-15 18:23:48', '记录日志');
INSERT INTO `sys_log` VALUES ('73', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-17 09:56:00', '1', 'admin', '2018-01-17 09:56:00', '记录日志');
INSERT INTO `sys_log` VALUES ('74', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-17 09:56:01', '1', 'admin', '2018-01-17 09:56:01', '记录日志');
INSERT INTO `sys_log` VALUES ('75', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-17 09:56:01', '1', 'admin', '2018-01-17 09:56:01', '记录日志');
INSERT INTO `sys_log` VALUES ('76', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-17 09:56:01', '1', 'admin', '2018-01-17 09:56:01', '记录日志');
INSERT INTO `sys_log` VALUES ('77', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/role', '2018-01-17 09:56:05', '1', 'admin', '2018-01-17 09:56:05', '记录日志');
INSERT INTO `sys_log` VALUES ('78', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-17 09:56:05', '1', 'admin', '2018-01-17 09:56:05', '记录日志');
INSERT INTO `sys_log` VALUES ('79', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/auth', '2018-01-17 09:56:09', '1', 'admin', '2018-01-17 09:56:09', '记录日志');
INSERT INTO `sys_log` VALUES ('80', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role/auth?id=7', '127.0.0.1', '/system/res/resAuthTree', '2018-01-17 09:56:09', '1', 'admin', '2018-01-17 09:56:09', '记录日志');
INSERT INTO `sys_log` VALUES ('81', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/role/auth?id=7', '127.0.0.1', '/system/role/postAuth', '2018-01-17 09:56:15', '1', 'admin', '2018-01-17 09:56:15', '记录日志');
INSERT INTO `sys_log` VALUES ('82', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/role/auth?id=7', '127.0.0.1', '/system/role/postAuth', '2018-01-17 09:56:31', '1', 'admin', '2018-01-17 09:56:31', '记录日志');
INSERT INTO `sys_log` VALUES ('83', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-17 09:56:31', '1', 'admin', '2018-01-17 09:56:31', '记录日志');
INSERT INTO `sys_log` VALUES ('84', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/auth', '2018-01-17 09:56:35', '1', 'admin', '2018-01-17 09:56:35', '记录日志');
INSERT INTO `sys_log` VALUES ('85', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role/auth?id=7', '127.0.0.1', '/system/res/resAuthTree', '2018-01-17 09:56:35', '1', 'admin', '2018-01-17 09:56:35', '记录日志');
INSERT INTO `sys_log` VALUES ('86', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-17 09:56:38', '1', 'admin', '2018-01-17 09:56:38', '记录日志');
INSERT INTO `sys_log` VALUES ('87', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-17 10:00:40', '1', 'admin', '2018-01-17 10:00:40', '记录日志');
INSERT INTO `sys_log` VALUES ('88', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-17 10:00:40', '1', 'admin', '2018-01-17 10:00:40', '记录日志');
INSERT INTO `sys_log` VALUES ('89', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-17 10:00:40', '1', 'admin', '2018-01-17 10:00:40', '记录日志');
INSERT INTO `sys_log` VALUES ('90', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-17 10:00:40', '1', 'admin', '2018-01-17 10:00:40', '记录日志');
INSERT INTO `sys_log` VALUES ('91', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-17 10:04:22', '1', 'admin', '2018-01-17 10:04:22', '记录日志');
INSERT INTO `sys_log` VALUES ('92', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-17 10:04:22', '1', 'admin', '2018-01-17 10:04:22', '记录日志');
INSERT INTO `sys_log` VALUES ('93', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-17 10:04:23', '1', 'admin', '2018-01-17 10:04:23', '记录日志');
INSERT INTO `sys_log` VALUES ('94', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-17 10:04:23', '1', 'admin', '2018-01-17 10:04:23', '记录日志');
INSERT INTO `sys_log` VALUES ('95', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-17 10:07:34', '1', 'admin', '2018-01-17 10:07:34', '记录日志');
INSERT INTO `sys_log` VALUES ('96', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-17 10:07:34', '1', 'admin', '2018-01-17 10:07:34', '记录日志');
INSERT INTO `sys_log` VALUES ('97', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-17 10:07:35', '1', 'admin', '2018-01-17 10:07:35', '记录日志');
INSERT INTO `sys_log` VALUES ('98', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-17 10:07:35', '1', 'admin', '2018-01-17 10:07:35', '记录日志');
INSERT INTO `sys_log` VALUES ('99', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-17 10:07:40', '1', 'admin', '2018-01-17 10:07:40', '记录日志');
INSERT INTO `sys_log` VALUES ('100', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/changepwd', '2018-01-17 10:07:43', '1', 'admin', '2018-01-17 10:07:43', '记录日志');
INSERT INTO `sys_log` VALUES ('101', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-17 10:07:53', '1', 'admin', '2018-01-17 10:07:53', '记录日志');
INSERT INTO `sys_log` VALUES ('102', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-17 10:07:53', '1', 'admin', '2018-01-17 10:07:53', '记录日志');
INSERT INTO `sys_log` VALUES ('103', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 10:07:53', '1', 'admin', '2018-01-17 10:07:53', '记录日志');
INSERT INTO `sys_log` VALUES ('104', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-17 10:09:31', '1', 'admin', '2018-01-17 10:09:31', '记录日志');
INSERT INTO `sys_log` VALUES ('105', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-17 10:09:31', '1', 'admin', '2018-01-17 10:09:31', '记录日志');
INSERT INTO `sys_log` VALUES ('106', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-17 10:09:31', '1', 'admin', '2018-01-17 10:09:31', '记录日志');
INSERT INTO `sys_log` VALUES ('107', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-17 10:09:31', '1', 'admin', '2018-01-17 10:09:31', '记录日志');
INSERT INTO `sys_log` VALUES ('108', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-17 10:09:34', '1', 'admin', '2018-01-17 10:09:34', '记录日志');
INSERT INTO `sys_log` VALUES ('109', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/changepwd', '2018-01-17 10:09:37', '1', 'admin', '2018-01-17 10:09:37', '记录日志');
INSERT INTO `sys_log` VALUES ('110', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-17 10:20:19', '1', 'admin', '2018-01-17 10:20:19', '记录日志');
INSERT INTO `sys_log` VALUES ('111', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-17 10:20:19', '1', 'admin', '2018-01-17 10:20:19', '记录日志');
INSERT INTO `sys_log` VALUES ('112', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-17 10:20:20', '1', 'admin', '2018-01-17 10:20:20', '记录日志');
INSERT INTO `sys_log` VALUES ('113', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-17 10:20:20', '1', 'admin', '2018-01-17 10:20:20', '记录日志');
INSERT INTO `sys_log` VALUES ('114', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-17 10:20:23', '1', 'admin', '2018-01-17 10:20:23', '记录日志');
INSERT INTO `sys_log` VALUES ('115', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-17 10:20:24', '1', 'admin', '2018-01-17 10:20:24', '记录日志');
INSERT INTO `sys_log` VALUES ('116', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-17 10:20:24', '1', 'admin', '2018-01-17 10:20:24', '记录日志');
INSERT INTO `sys_log` VALUES ('117', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-17 10:20:24', '1', 'admin', '2018-01-17 10:20:24', '记录日志');
INSERT INTO `sys_log` VALUES ('118', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-17 10:20:31', '1', 'admin', '2018-01-17 10:20:31', '记录日志');
INSERT INTO `sys_log` VALUES ('119', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-17 10:20:31', '1', 'admin', '2018-01-17 10:20:31', '记录日志');
INSERT INTO `sys_log` VALUES ('120', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 10:20:31', '1', 'admin', '2018-01-17 10:20:31', '记录日志');
INSERT INTO `sys_log` VALUES ('121', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-17 10:20:37', '1', 'admin', '2018-01-17 10:20:37', '记录日志');
INSERT INTO `sys_log` VALUES ('122', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-17 10:20:41', '1', 'admin', '2018-01-17 10:20:41', '记录日志');
INSERT INTO `sys_log` VALUES ('123', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 10:20:41', '1', 'admin', '2018-01-17 10:20:41', '记录日志');
INSERT INTO `sys_log` VALUES ('124', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-17 10:21:02', '1', 'admin', '2018-01-17 10:21:02', '记录日志');
INSERT INTO `sys_log` VALUES ('125', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-17 10:21:02', '1', 'admin', '2018-01-17 10:21:02', '记录日志');
INSERT INTO `sys_log` VALUES ('126', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-17 10:21:03', '1', 'admin', '2018-01-17 10:21:03', '记录日志');
INSERT INTO `sys_log` VALUES ('127', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-17 10:21:03', '1', 'admin', '2018-01-17 10:21:03', '记录日志');
INSERT INTO `sys_log` VALUES ('128', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-17 10:21:14', '1', 'admin', '2018-01-17 10:21:14', '记录日志');
INSERT INTO `sys_log` VALUES ('129', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-17 10:21:14', '1', 'admin', '2018-01-17 10:21:14', '记录日志');
INSERT INTO `sys_log` VALUES ('130', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 10:21:14', '1', 'admin', '2018-01-17 10:21:14', '记录日志');
INSERT INTO `sys_log` VALUES ('131', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/role', '2018-01-17 10:21:14', '1', 'admin', '2018-01-17 10:21:14', '记录日志');
INSERT INTO `sys_log` VALUES ('132', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-17 10:21:14', '1', 'admin', '2018-01-17 10:21:14', '记录日志');
INSERT INTO `sys_log` VALUES ('133', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/data', '2018-01-17 10:21:18', '1', 'admin', '2018-01-17 10:21:18', '记录日志');
INSERT INTO `sys_log` VALUES ('134', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/data', '127.0.0.1', '/system/data/tableData', '2018-01-17 10:21:18', '1', 'admin', '2018-01-17 10:21:18', '记录日志');
INSERT INTO `sys_log` VALUES ('135', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-17 10:21:26', '1', 'admin', '2018-01-17 10:21:26', '记录日志');
INSERT INTO `sys_log` VALUES ('136', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-17 10:21:27', '1', 'admin', '2018-01-17 10:21:27', '记录日志');
INSERT INTO `sys_log` VALUES ('137', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-17 10:21:41', '1', 'admin', '2018-01-17 10:21:41', '记录日志');
INSERT INTO `sys_log` VALUES ('138', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/changepwd', '2018-01-17 10:21:42', '1', 'admin', '2018-01-17 10:21:42', '记录日志');
INSERT INTO `sys_log` VALUES ('139', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 10:21:55', '1', 'admin', '2018-01-17 10:21:55', '记录日志');
INSERT INTO `sys_log` VALUES ('140', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-17 10:21:57', '1', 'admin', '2018-01-17 10:21:57', '记录日志');
INSERT INTO `sys_log` VALUES ('141', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 10:22:00', '1', 'admin', '2018-01-17 10:22:00', '记录日志');
INSERT INTO `sys_log` VALUES ('142', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-17 10:22:00', '1', 'admin', '2018-01-17 10:22:00', '记录日志');
INSERT INTO `sys_log` VALUES ('143', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/unuse', '2018-01-17 10:22:01', '1', 'admin', '2018-01-17 10:22:01', '记录日志');
INSERT INTO `sys_log` VALUES ('144', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 10:22:01', '1', 'admin', '2018-01-17 10:22:01', '记录日志');
INSERT INTO `sys_log` VALUES ('145', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/use', '2018-01-17 10:22:03', '1', 'admin', '2018-01-17 10:22:03', '记录日志');
INSERT INTO `sys_log` VALUES ('146', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 10:22:03', '1', 'admin', '2018-01-17 10:22:03', '记录日志');
INSERT INTO `sys_log` VALUES ('147', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/data', '2018-01-17 10:25:11', '1', 'admin', '2018-01-17 10:25:11', '记录日志');
INSERT INTO `sys_log` VALUES ('148', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/data', '127.0.0.1', '/system/data/tableData', '2018-01-17 10:25:11', '1', 'admin', '2018-01-17 10:25:11', '记录日志');
INSERT INTO `sys_log` VALUES ('149', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-17 10:25:57', '1', 'admin', '2018-01-17 10:25:57', '记录日志');
INSERT INTO `sys_log` VALUES ('150', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-17 10:25:57', '1', 'admin', '2018-01-17 10:25:57', '记录日志');
INSERT INTO `sys_log` VALUES ('151', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-17 10:25:58', '1', 'admin', '2018-01-17 10:25:58', '记录日志');
INSERT INTO `sys_log` VALUES ('152', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-17 10:25:58', '1', 'admin', '2018-01-17 10:25:58', '记录日志');
INSERT INTO `sys_log` VALUES ('153', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-17 10:26:00', '1', 'admin', '2018-01-17 10:26:00', '记录日志');
INSERT INTO `sys_log` VALUES ('154', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-17 10:26:00', '1', 'admin', '2018-01-17 10:26:00', '记录日志');
INSERT INTO `sys_log` VALUES ('155', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 10:26:00', '1', 'admin', '2018-01-17 10:26:00', '记录日志');
INSERT INTO `sys_log` VALUES ('156', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user', '2018-01-17 10:26:10', '1', 'admin', '2018-01-17 10:26:10', '记录日志');
INSERT INTO `sys_log` VALUES ('157', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/tableData', '2018-01-17 10:26:10', '1', 'admin', '2018-01-17 10:26:10', '记录日志');
INSERT INTO `sys_log` VALUES ('158', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/update', '2018-01-17 10:26:21', '1', 'admin', '2018-01-17 10:26:21', '记录日志');
INSERT INTO `sys_log` VALUES ('159', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/tableData', '2018-01-17 10:26:24', '1', 'admin', '2018-01-17 10:26:24', '记录日志');
INSERT INTO `sys_log` VALUES ('160', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/role', '2018-01-17 10:27:58', '1', 'admin', '2018-01-17 10:27:58', '记录日志');
INSERT INTO `sys_log` VALUES ('161', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-17 10:27:58', '1', 'admin', '2018-01-17 10:27:58', '记录日志');
INSERT INTO `sys_log` VALUES ('162', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/data', '2018-01-17 10:27:59', '1', 'admin', '2018-01-17 10:27:59', '记录日志');
INSERT INTO `sys_log` VALUES ('163', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/data', '127.0.0.1', '/system/data/tableData', '2018-01-17 10:28:00', '1', 'admin', '2018-01-17 10:28:00', '记录日志');
INSERT INTO `sys_log` VALUES ('164', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-17 10:28:02', '1', 'admin', '2018-01-17 10:28:02', '记录日志');
INSERT INTO `sys_log` VALUES ('165', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-17 10:28:02', '1', 'admin', '2018-01-17 10:28:02', '记录日志');
INSERT INTO `sys_log` VALUES ('166', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-17 10:28:07', '1', 'admin', '2018-01-17 10:28:07', '记录日志');
INSERT INTO `sys_log` VALUES ('167', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/changepwd', '2018-01-17 10:28:08', '1', 'admin', '2018-01-17 10:28:08', '记录日志');
INSERT INTO `sys_log` VALUES ('168', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-01-17 11:48:42', '1', 'guest', '2018-01-17 11:48:42', '记录日志');
INSERT INTO `sys_log` VALUES ('169', null, 'Chrome', 'GET', 'http://rlaxtest.tunnel.qydev.com/login', '127.0.0.1', '/captcha', '2018-01-17 11:48:43', '1', 'guest', '2018-01-17 11:48:43', '记录日志');
INSERT INTO `sys_log` VALUES ('170', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-17 17:59:23', '1', 'admin', '2018-01-17 17:59:23', '记录日志');
INSERT INTO `sys_log` VALUES ('171', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-17 17:59:23', '1', 'admin', '2018-01-17 17:59:23', '记录日志');
INSERT INTO `sys_log` VALUES ('172', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-17 17:59:24', '1', 'admin', '2018-01-17 17:59:24', '记录日志');
INSERT INTO `sys_log` VALUES ('173', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-17 17:59:24', '1', 'admin', '2018-01-17 17:59:24', '记录日志');
INSERT INTO `sys_log` VALUES ('174', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-17 19:06:08', '1', 'admin', '2018-01-17 19:06:08', '记录日志');
INSERT INTO `sys_log` VALUES ('175', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-17 19:06:08', '1', 'admin', '2018-01-17 19:06:08', '记录日志');
INSERT INTO `sys_log` VALUES ('176', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-17 19:06:09', '1', 'admin', '2018-01-17 19:06:09', '记录日志');
INSERT INTO `sys_log` VALUES ('177', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-17 19:06:09', '1', 'admin', '2018-01-17 19:06:09', '记录日志');
INSERT INTO `sys_log` VALUES ('178', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/logout', '2018-01-17 19:06:13', '1', 'admin', '2018-01-17 19:06:13', '记录日志');
INSERT INTO `sys_log` VALUES ('179', null, 'Chrome', 'GET', 'http://127.0.0.1:8888/logout', '127.0.0.1', '/captcha', '2018-01-17 19:06:13', '1', 'guest', '2018-01-17 19:06:13', '记录日志');
INSERT INTO `sys_log` VALUES ('180', null, 'Chrome', 'POST', 'http://127.0.0.1:8888/logout', '127.0.0.1', '/postLogin', '2018-01-17 19:06:24', '1', 'guest', '2018-01-17 19:06:24', '记录日志');
INSERT INTO `sys_log` VALUES ('181', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/logout', '127.0.0.1', '/', '2018-01-17 19:06:25', '1', 'admin', '2018-01-17 19:06:25', '记录日志');
INSERT INTO `sys_log` VALUES ('182', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-17 19:06:25', '1', 'admin', '2018-01-17 19:06:25', '记录日志');
INSERT INTO `sys_log` VALUES ('183', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-17 19:06:25', '1', 'admin', '2018-01-17 19:06:25', '记录日志');
INSERT INTO `sys_log` VALUES ('184', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-17 19:06:25', '1', 'admin', '2018-01-17 19:06:25', '记录日志');
INSERT INTO `sys_log` VALUES ('185', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-17 19:06:28', '1', 'admin', '2018-01-17 19:06:28', '记录日志');
INSERT INTO `sys_log` VALUES ('186', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-17 19:06:28', '1', 'admin', '2018-01-17 19:06:28', '记录日志');
INSERT INTO `sys_log` VALUES ('187', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 19:06:29', '1', 'admin', '2018-01-17 19:06:29', '记录日志');
INSERT INTO `sys_log` VALUES ('188', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 19:06:31', '1', 'admin', '2018-01-17 19:06:31', '记录日志');
INSERT INTO `sys_log` VALUES ('189', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-17 19:06:33', '1', 'admin', '2018-01-17 19:06:33', '记录日志');
INSERT INTO `sys_log` VALUES ('190', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res/update?id=20', '127.0.0.1', '/system/res/postUpdate', '2018-01-17 19:06:37', '1', 'admin', '2018-01-17 19:06:37', '记录日志');
INSERT INTO `sys_log` VALUES ('191', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 19:06:37', '1', 'admin', '2018-01-17 19:06:37', '记录日志');
INSERT INTO `sys_log` VALUES ('192', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-17 19:06:37', '1', 'admin', '2018-01-17 19:06:37', '记录日志');
INSERT INTO `sys_log` VALUES ('193', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/unuse', '2018-01-17 19:06:40', '1', 'admin', '2018-01-17 19:06:40', '记录日志');
INSERT INTO `sys_log` VALUES ('194', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 19:06:40', '1', 'admin', '2018-01-17 19:06:40', '记录日志');
INSERT INTO `sys_log` VALUES ('195', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/use', '2018-01-17 19:06:41', '1', 'admin', '2018-01-17 19:06:41', '记录日志');
INSERT INTO `sys_log` VALUES ('196', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-17 19:06:41', '1', 'admin', '2018-01-17 19:06:41', '记录日志');
INSERT INTO `sys_log` VALUES ('197', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/role', '2018-01-17 19:06:44', '1', 'admin', '2018-01-17 19:06:44', '记录日志');
INSERT INTO `sys_log` VALUES ('198', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-17 19:06:44', '1', 'admin', '2018-01-17 19:06:44', '记录日志');
INSERT INTO `sys_log` VALUES ('199', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/auth', '2018-01-17 19:06:46', '1', 'admin', '2018-01-17 19:06:46', '记录日志');
INSERT INTO `sys_log` VALUES ('200', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role/auth?id=1', '127.0.0.1', '/system/res/resAuthTree', '2018-01-17 19:06:46', '1', 'admin', '2018-01-17 19:06:46', '记录日志');
INSERT INTO `sys_log` VALUES ('201', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-17 19:06:49', '1', 'admin', '2018-01-17 19:06:49', '记录日志');
INSERT INTO `sys_log` VALUES ('202', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/auth', '2018-01-17 19:06:52', '1', 'admin', '2018-01-17 19:06:52', '记录日志');
INSERT INTO `sys_log` VALUES ('203', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role/auth?id=7', '127.0.0.1', '/system/res/resAuthTree', '2018-01-17 19:06:52', '1', 'admin', '2018-01-17 19:06:52', '记录日志');
INSERT INTO `sys_log` VALUES ('204', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-17 19:06:55', '1', 'admin', '2018-01-17 19:06:55', '记录日志');
INSERT INTO `sys_log` VALUES ('205', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user', '2018-01-17 19:06:56', '1', 'admin', '2018-01-17 19:06:56', '记录日志');
INSERT INTO `sys_log` VALUES ('206', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/tableData', '2018-01-17 19:06:56', '1', 'admin', '2018-01-17 19:06:56', '记录日志');
INSERT INTO `sys_log` VALUES ('207', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/unuse', '2018-01-17 19:07:04', '1', 'admin', '2018-01-17 19:07:04', '记录日志');
INSERT INTO `sys_log` VALUES ('208', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/tableData', '2018-01-17 19:07:04', '1', 'admin', '2018-01-17 19:07:04', '记录日志');
INSERT INTO `sys_log` VALUES ('209', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/use', '2018-01-17 19:07:06', '1', 'admin', '2018-01-17 19:07:06', '记录日志');
INSERT INTO `sys_log` VALUES ('210', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/tableData', '2018-01-17 19:07:06', '1', 'admin', '2018-01-17 19:07:06', '记录日志');
INSERT INTO `sys_log` VALUES ('211', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/update', '2018-01-17 19:07:07', '1', 'admin', '2018-01-17 19:07:07', '记录日志');
INSERT INTO `sys_log` VALUES ('212', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user/update?id=3', '127.0.0.1', '/system/user/postUpdate', '2018-01-17 19:07:09', '1', 'admin', '2018-01-17 19:07:09', '记录日志');
INSERT INTO `sys_log` VALUES ('213', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/tableData', '2018-01-17 19:07:09', '1', 'admin', '2018-01-17 19:07:09', '记录日志');
INSERT INTO `sys_log` VALUES ('214', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/data', '2018-01-17 19:07:11', '1', 'admin', '2018-01-17 19:07:11', '记录日志');
INSERT INTO `sys_log` VALUES ('215', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/data', '127.0.0.1', '/system/data/tableData', '2018-01-17 19:07:11', '1', 'admin', '2018-01-17 19:07:11', '记录日志');
INSERT INTO `sys_log` VALUES ('216', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/data', '127.0.0.1', '/system/data/cache', '2018-01-17 19:07:14', '1', 'admin', '2018-01-17 19:07:14', '记录日志');
INSERT INTO `sys_log` VALUES ('217', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/data', '127.0.0.1', '/system/data/update', '2018-01-17 19:07:17', '1', 'admin', '2018-01-17 19:07:17', '记录日志');
INSERT INTO `sys_log` VALUES ('218', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/data/update?id=1', '127.0.0.1', '/system/data/postUpdate', '2018-01-17 19:07:18', '1', 'admin', '2018-01-17 19:07:18', '记录日志');
INSERT INTO `sys_log` VALUES ('219', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/data', '127.0.0.1', '/system/data/tableData', '2018-01-17 19:07:19', '1', 'admin', '2018-01-17 19:07:19', '记录日志');
INSERT INTO `sys_log` VALUES ('220', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-17 19:07:21', '1', 'admin', '2018-01-17 19:07:21', '记录日志');
INSERT INTO `sys_log` VALUES ('221', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-17 19:07:21', '1', 'admin', '2018-01-17 19:07:21', '记录日志');
INSERT INTO `sys_log` VALUES ('222', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-17 19:07:24', '1', 'admin', '2018-01-17 19:07:24', '记录日志');
INSERT INTO `sys_log` VALUES ('223', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/changepwd', '2018-01-17 19:07:26', '1', 'admin', '2018-01-17 19:07:26', '记录日志');
INSERT INTO `sys_log` VALUES ('224', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-18 10:15:55', '1', 'admin', '2018-01-18 10:15:55', '记录日志');
INSERT INTO `sys_log` VALUES ('225', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-18 10:15:56', '1', 'admin', '2018-01-18 10:15:56', '记录日志');
INSERT INTO `sys_log` VALUES ('226', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-18 10:15:57', '1', 'admin', '2018-01-18 10:15:57', '记录日志');
INSERT INTO `sys_log` VALUES ('227', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-18 10:15:57', '1', 'admin', '2018-01-18 10:15:57', '记录日志');
INSERT INTO `sys_log` VALUES ('228', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-18 10:15:58', '1', 'admin', '2018-01-18 10:15:58', '记录日志');
INSERT INTO `sys_log` VALUES ('229', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-18 10:15:59', '1', 'admin', '2018-01-18 10:15:59', '记录日志');
INSERT INTO `sys_log` VALUES ('230', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-18 10:15:59', '1', 'admin', '2018-01-18 10:15:59', '记录日志');
INSERT INTO `sys_log` VALUES ('231', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user', '2018-01-18 10:16:00', '1', 'admin', '2018-01-18 10:16:00', '记录日志');
INSERT INTO `sys_log` VALUES ('232', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/tableData', '2018-01-18 10:16:00', '1', 'admin', '2018-01-18 10:16:00', '记录日志');
INSERT INTO `sys_log` VALUES ('233', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-18 10:16:01', '1', 'admin', '2018-01-18 10:16:01', '记录日志');
INSERT INTO `sys_log` VALUES ('234', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-18 10:16:01', '1', 'admin', '2018-01-18 10:16:01', '记录日志');
INSERT INTO `sys_log` VALUES ('235', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-18 10:16:02', '1', 'admin', '2018-01-18 10:16:02', '记录日志');
INSERT INTO `sys_log` VALUES ('236', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/data', '2018-01-18 10:16:03', '1', 'admin', '2018-01-18 10:16:03', '记录日志');
INSERT INTO `sys_log` VALUES ('237', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/data', '127.0.0.1', '/system/data/tableData', '2018-01-18 10:16:03', '1', 'admin', '2018-01-18 10:16:03', '记录日志');
INSERT INTO `sys_log` VALUES ('238', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-18 10:16:11', '1', 'admin', '2018-01-18 10:16:11', '记录日志');
INSERT INTO `sys_log` VALUES ('239', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-18 10:16:11', '1', 'admin', '2018-01-18 10:16:11', '记录日志');
INSERT INTO `sys_log` VALUES ('240', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-18 10:16:12', '1', 'admin', '2018-01-18 10:16:12', '记录日志');
INSERT INTO `sys_log` VALUES ('241', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-18 10:16:12', '1', 'admin', '2018-01-18 10:16:12', '记录日志');
INSERT INTO `sys_log` VALUES ('242', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-18 10:16:12', '1', 'admin', '2018-01-18 10:16:12', '记录日志');
INSERT INTO `sys_log` VALUES ('243', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-18 10:16:13', '1', 'admin', '2018-01-18 10:16:13', '记录日志');
INSERT INTO `sys_log` VALUES ('244', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/role', '2018-01-18 19:39:35', '1', 'admin', '2018-01-18 19:39:35', '记录日志');
INSERT INTO `sys_log` VALUES ('245', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-18 19:39:35', '1', 'admin', '2018-01-18 19:39:35', '记录日志');
INSERT INTO `sys_log` VALUES ('246', '3', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-01-19 17:56:30', '1', 'admin', '2018-01-19 17:56:30', '记录日志');
INSERT INTO `sys_log` VALUES ('247', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-19 17:56:31', '1', 'admin', '2018-01-19 17:56:31', '记录日志');
INSERT INTO `sys_log` VALUES ('248', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-19 17:56:31', '1', 'admin', '2018-01-19 17:56:31', '记录日志');
INSERT INTO `sys_log` VALUES ('249', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-19 17:56:31', '1', 'admin', '2018-01-19 17:56:31', '记录日志');
INSERT INTO `sys_log` VALUES ('250', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-19 17:56:35', '1', 'admin', '2018-01-19 17:56:35', '记录日志');
INSERT INTO `sys_log` VALUES ('251', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user/profile', '127.0.0.1', '/system/user/profileUpdate', '2018-01-19 17:56:42', '1', 'admin', '2018-01-19 17:56:42', '记录日志');
INSERT INTO `sys_log` VALUES ('252', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user/profile', '127.0.0.1', '/system/user/profileUpdate', '2018-01-19 17:56:46', '1', 'admin', '2018-01-19 17:56:46', '记录日志');
INSERT INTO `sys_log` VALUES ('253', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/changepwd', '2018-01-19 17:56:50', '1', 'admin', '2018-01-19 17:56:50', '记录日志');
INSERT INTO `sys_log` VALUES ('254', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-19 17:58:00', '1', 'admin', '2018-01-19 17:58:00', '记录日志');
INSERT INTO `sys_log` VALUES ('255', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user/profile', '127.0.0.1', '/system/user/postProfile', '2018-01-19 17:58:05', '1', 'admin', '2018-01-19 17:58:05', '记录日志');
INSERT INTO `sys_log` VALUES ('256', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-19 17:58:10', '1', 'admin', '2018-01-19 17:58:10', '记录日志');
INSERT INTO `sys_log` VALUES ('257', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/role', '2018-01-19 17:58:29', '1', 'admin', '2018-01-19 17:58:29', '记录日志');
INSERT INTO `sys_log` VALUES ('258', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-19 17:58:29', '1', 'admin', '2018-01-19 17:58:29', '记录日志');
INSERT INTO `sys_log` VALUES ('259', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user', '2018-01-19 17:58:30', '1', 'admin', '2018-01-19 17:58:30', '记录日志');
INSERT INTO `sys_log` VALUES ('260', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/tableData', '2018-01-19 17:58:30', '1', 'admin', '2018-01-19 17:58:30', '记录日志');
INSERT INTO `sys_log` VALUES ('261', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-19 17:58:35', '1', 'admin', '2018-01-19 17:58:35', '记录日志');
INSERT INTO `sys_log` VALUES ('262', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user/changepwd', '127.0.0.1', '/system/user/changepwdUpdate', '2018-01-19 17:58:47', '1', 'admin', '2018-01-19 17:58:47', '记录日志');
INSERT INTO `sys_log` VALUES ('263', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/changepwd', '2018-01-19 17:58:51', '1', 'admin', '2018-01-19 17:58:51', '记录日志');
INSERT INTO `sys_log` VALUES ('264', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user/changepwd', '127.0.0.1', '/system/user/postChangepwd', '2018-01-19 17:58:54', '1', 'admin', '2018-01-19 17:58:54', '记录日志');
INSERT INTO `sys_log` VALUES ('265', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user/changepwd', '127.0.0.1', '/system/user/postChangepwd', '2018-01-19 17:58:58', '1', 'admin', '2018-01-19 17:58:58', '记录日志');
INSERT INTO `sys_log` VALUES ('266', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-19 18:01:54', '1', 'admin', '2018-01-19 18:01:54', '记录日志');
INSERT INTO `sys_log` VALUES ('267', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-19 18:01:57', '1', 'admin', '2018-01-19 18:01:57', '记录日志');
INSERT INTO `sys_log` VALUES ('268', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/log', '127.0.0.1', '/system/log/tableData', '2018-01-19 18:01:57', '1', 'admin', '2018-01-19 18:01:57', '记录日志');
INSERT INTO `sys_log` VALUES ('269', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-19 18:05:23', '1', 'admin', '2018-01-19 18:05:23', '记录日志');
INSERT INTO `sys_log` VALUES ('270', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user/profile', '127.0.0.1', '/system/user/postProfile', '2018-01-19 18:05:31', '1', 'admin', '2018-01-19 18:05:31', '记录日志');
INSERT INTO `sys_log` VALUES ('271', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user/profile', '127.0.0.1', '/system/user/profile', '2018-01-19 18:05:31', '1', 'admin', '2018-01-19 18:05:31', '记录日志');
INSERT INTO `sys_log` VALUES ('272', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user', '2018-01-19 18:05:37', '1', 'admin', '2018-01-19 18:05:37', '记录日志');
INSERT INTO `sys_log` VALUES ('273', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/tableData', '2018-01-19 18:05:37', '1', 'admin', '2018-01-19 18:05:37', '记录日志');
INSERT INTO `sys_log` VALUES ('274', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/update', '2018-01-19 18:05:46', '1', 'admin', '2018-01-19 18:05:46', '记录日志');
INSERT INTO `sys_log` VALUES ('275', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/user', '127.0.0.1', '/system/user/tableData', '2018-01-19 18:05:50', '1', 'admin', '2018-01-19 18:05:50', '记录日志');
INSERT INTO `sys_log` VALUES ('276', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-19 18:09:08', '1', 'admin', '2018-01-19 18:09:08', '记录日志');
INSERT INTO `sys_log` VALUES ('277', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user/profile', '127.0.0.1', '/system/user/postProfile', '2018-01-19 18:09:13', '1', 'admin', '2018-01-19 18:09:13', '记录日志');
INSERT INTO `sys_log` VALUES ('278', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-19 18:13:09', '1', 'admin', '2018-01-19 18:13:09', '记录日志');
INSERT INTO `sys_log` VALUES ('279', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user/profile', '2018-01-19 18:13:11', '1', 'admin', '2018-01-19 18:13:11', '记录日志');
INSERT INTO `sys_log` VALUES ('280', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user/profile', '127.0.0.1', '/system/user/postProfile', '2018-01-19 18:13:16', '1', 'admin', '2018-01-19 18:13:16', '记录日志');
INSERT INTO `sys_log` VALUES ('281', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user/profile', '127.0.0.1', '/system/user/postProfile', '2018-01-19 18:16:10', '1', 'admin', '2018-01-19 18:16:10', '记录日志');
INSERT INTO `sys_log` VALUES ('282', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/user/profile', '127.0.0.1', '/system/user/postProfile', '2018-01-19 18:17:48', '1', 'admin', '2018-01-19 18:17:48', '记录日志');
INSERT INTO `sys_log` VALUES ('283', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-01-23 11:18:33', '1', 'guest', '2018-01-23 11:18:33', '记录日志');
INSERT INTO `sys_log` VALUES ('284', null, 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/captcha', '2018-01-23 11:18:34', '1', 'guest', '2018-01-23 11:18:34', '记录日志');
INSERT INTO `sys_log` VALUES ('285', null, 'Chrome', 'POST', 'http://127.0.0.1:8888/login', '127.0.0.1', '/postLogin', '2018-01-23 11:18:42', '1', 'guest', '2018-01-23 11:18:42', '记录日志');
INSERT INTO `sys_log` VALUES ('286', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 11:18:42', '1', 'admin', '2018-01-23 11:18:42', '记录日志');
INSERT INTO `sys_log` VALUES ('287', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 11:18:43', '1', 'admin', '2018-01-23 11:18:43', '记录日志');
INSERT INTO `sys_log` VALUES ('288', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 11:18:43', '1', 'admin', '2018-01-23 11:18:43', '记录日志');
INSERT INTO `sys_log` VALUES ('289', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:18:43', '1', 'admin', '2018-01-23 11:18:43', '记录日志');
INSERT INTO `sys_log` VALUES ('290', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-23 11:18:48', '1', 'admin', '2018-01-23 11:18:48', '记录日志');
INSERT INTO `sys_log` VALUES ('291', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:18:49', '1', 'admin', '2018-01-23 11:18:49', '记录日志');
INSERT INTO `sys_log` VALUES ('292', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:18:49', '1', 'admin', '2018-01-23 11:18:49', '记录日志');
INSERT INTO `sys_log` VALUES ('293', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:19:01', '1', 'admin', '2018-01-23 11:19:01', '记录日志');
INSERT INTO `sys_log` VALUES ('294', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:19:10', '1', 'admin', '2018-01-23 11:19:10', '记录日志');
INSERT INTO `sys_log` VALUES ('295', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:19:24', '1', 'admin', '2018-01-23 11:19:24', '记录日志');
INSERT INTO `sys_log` VALUES ('296', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:19:25', '1', 'admin', '2018-01-23 11:19:25', '记录日志');
INSERT INTO `sys_log` VALUES ('297', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-23 11:19:29', '1', 'admin', '2018-01-23 11:19:29', '记录日志');
INSERT INTO `sys_log` VALUES ('298', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:19:40', '1', 'admin', '2018-01-23 11:19:40', '记录日志');
INSERT INTO `sys_log` VALUES ('299', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:19:40', '1', 'admin', '2018-01-23 11:19:40', '记录日志');
INSERT INTO `sys_log` VALUES ('300', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:19:42', '1', 'admin', '2018-01-23 11:19:42', '记录日志');
INSERT INTO `sys_log` VALUES ('301', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-23 11:19:53', '1', 'admin', '2018-01-23 11:19:53', '记录日志');
INSERT INTO `sys_log` VALUES ('302', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res/update?id=92', '127.0.0.1', '/system/res/postUpdate', '2018-01-23 11:31:21', '1', 'admin', '2018-01-23 11:31:21', '记录日志');
INSERT INTO `sys_log` VALUES ('303', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:31:21', '1', 'admin', '2018-01-23 11:31:21', '记录日志');
INSERT INTO `sys_log` VALUES ('304', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:31:21', '1', 'admin', '2018-01-23 11:31:21', '记录日志');
INSERT INTO `sys_log` VALUES ('305', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 11:31:26', '1', 'admin', '2018-01-23 11:31:26', '记录日志');
INSERT INTO `sys_log` VALUES ('306', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 11:31:26', '1', 'admin', '2018-01-23 11:31:26', '记录日志');
INSERT INTO `sys_log` VALUES ('307', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 11:31:26', '1', 'admin', '2018-01-23 11:31:26', '记录日志');
INSERT INTO `sys_log` VALUES ('308', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:31:26', '1', 'admin', '2018-01-23 11:31:26', '记录日志');
INSERT INTO `sys_log` VALUES ('309', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:31:27', '1', 'admin', '2018-01-23 11:31:27', '记录日志');
INSERT INTO `sys_log` VALUES ('310', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 11:31:28', '1', 'admin', '2018-01-23 11:31:28', '记录日志');
INSERT INTO `sys_log` VALUES ('311', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 11:33:06', '1', 'admin', '2018-01-23 11:33:06', '记录日志');
INSERT INTO `sys_log` VALUES ('312', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 11:33:35', '1', 'admin', '2018-01-23 11:33:35', '记录日志');
INSERT INTO `sys_log` VALUES ('313', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 11:34:31', '1', 'admin', '2018-01-23 11:34:31', '记录日志');
INSERT INTO `sys_log` VALUES ('314', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:36:34', '1', 'admin', '2018-01-23 11:36:34', '记录日志');
INSERT INTO `sys_log` VALUES ('315', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/role', '2018-01-23 11:36:35', '1', 'admin', '2018-01-23 11:36:35', '记录日志');
INSERT INTO `sys_log` VALUES ('316', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/user', '2018-01-23 11:36:36', '1', 'admin', '2018-01-23 11:36:36', '记录日志');
INSERT INTO `sys_log` VALUES ('317', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-23 11:36:39', '1', 'admin', '2018-01-23 11:36:39', '记录日志');
INSERT INTO `sys_log` VALUES ('318', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:36:39', '1', 'admin', '2018-01-23 11:36:39', '记录日志');
INSERT INTO `sys_log` VALUES ('319', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/log', '2018-01-23 11:37:25', '1', 'admin', '2018-01-23 11:37:25', '记录日志');
INSERT INTO `sys_log` VALUES ('320', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/data', '2018-01-23 11:37:27', '1', 'admin', '2018-01-23 11:37:27', '记录日志');
INSERT INTO `sys_log` VALUES ('321', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 11:38:22', '1', 'admin', '2018-01-23 11:38:22', '记录日志');
INSERT INTO `sys_log` VALUES ('322', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 11:38:22', '1', 'admin', '2018-01-23 11:38:22', '记录日志');
INSERT INTO `sys_log` VALUES ('323', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 11:38:22', '1', 'admin', '2018-01-23 11:38:22', '记录日志');
INSERT INTO `sys_log` VALUES ('324', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:38:22', '1', 'admin', '2018-01-23 11:38:22', '记录日志');
INSERT INTO `sys_log` VALUES ('325', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-23 11:38:24', '1', 'admin', '2018-01-23 11:38:24', '记录日志');
INSERT INTO `sys_log` VALUES ('326', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:38:24', '1', 'admin', '2018-01-23 11:38:24', '记录日志');
INSERT INTO `sys_log` VALUES ('327', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/role', '2018-01-23 11:38:37', '1', 'admin', '2018-01-23 11:38:37', '记录日志');
INSERT INTO `sys_log` VALUES ('328', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 11:42:27', '1', 'admin', '2018-01-23 11:42:27', '记录日志');
INSERT INTO `sys_log` VALUES ('329', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 11:42:28', '1', 'admin', '2018-01-23 11:42:28', '记录日志');
INSERT INTO `sys_log` VALUES ('330', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 11:42:28', '1', 'admin', '2018-01-23 11:42:28', '记录日志');
INSERT INTO `sys_log` VALUES ('331', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:42:28', '1', 'admin', '2018-01-23 11:42:28', '记录日志');
INSERT INTO `sys_log` VALUES ('332', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 11:42:32', '1', 'admin', '2018-01-23 11:42:32', '记录日志');
INSERT INTO `sys_log` VALUES ('333', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 11:42:32', '1', 'admin', '2018-01-23 11:42:32', '记录日志');
INSERT INTO `sys_log` VALUES ('334', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 11:42:32', '1', 'admin', '2018-01-23 11:42:32', '记录日志');
INSERT INTO `sys_log` VALUES ('335', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:42:32', '1', 'admin', '2018-01-23 11:42:32', '记录日志');
INSERT INTO `sys_log` VALUES ('336', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 11:44:49', '1', 'admin', '2018-01-23 11:44:49', '记录日志');
INSERT INTO `sys_log` VALUES ('337', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 11:44:49', '1', 'admin', '2018-01-23 11:44:49', '记录日志');
INSERT INTO `sys_log` VALUES ('338', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 11:44:49', '1', 'admin', '2018-01-23 11:44:49', '记录日志');
INSERT INTO `sys_log` VALUES ('339', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:44:49', '1', 'admin', '2018-01-23 11:44:49', '记录日志');
INSERT INTO `sys_log` VALUES ('340', '3', 'Chrome', 'GET', null, '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:45:27', '1', 'admin', '2018-01-23 11:45:27', '记录日志');
INSERT INTO `sys_log` VALUES ('341', '3', 'Chrome', 'GET', null, '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:45:31', '1', 'admin', '2018-01-23 11:45:31', '记录日志');
INSERT INTO `sys_log` VALUES ('342', '3', 'Chrome', 'GET', null, '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:45:42', '1', 'admin', '2018-01-23 11:45:42', '记录日志');
INSERT INTO `sys_log` VALUES ('343', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 11:50:48', '1', 'admin', '2018-01-23 11:50:48', '记录日志');
INSERT INTO `sys_log` VALUES ('344', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 11:50:48', '1', 'admin', '2018-01-23 11:50:48', '记录日志');
INSERT INTO `sys_log` VALUES ('345', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 11:50:49', '1', 'admin', '2018-01-23 11:50:49', '记录日志');
INSERT INTO `sys_log` VALUES ('346', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:50:49', '1', 'admin', '2018-01-23 11:50:49', '记录日志');
INSERT INTO `sys_log` VALUES ('347', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-23 11:50:52', '1', 'admin', '2018-01-23 11:50:52', '记录日志');
INSERT INTO `sys_log` VALUES ('348', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:50:52', '1', 'admin', '2018-01-23 11:50:52', '记录日志');
INSERT INTO `sys_log` VALUES ('349', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:50:52', '1', 'admin', '2018-01-23 11:50:52', '记录日志');
INSERT INTO `sys_log` VALUES ('350', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:50:54', '1', 'admin', '2018-01-23 11:50:54', '记录日志');
INSERT INTO `sys_log` VALUES ('351', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 11:50:55', '1', 'admin', '2018-01-23 11:50:55', '记录日志');
INSERT INTO `sys_log` VALUES ('352', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/', '2018-01-23 11:50:57', '1', 'admin', '2018-01-23 11:50:57', '记录日志');
INSERT INTO `sys_log` VALUES ('353', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 11:50:57', '1', 'admin', '2018-01-23 11:50:57', '记录日志');
INSERT INTO `sys_log` VALUES ('354', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 11:50:58', '1', 'admin', '2018-01-23 11:50:58', '记录日志');
INSERT INTO `sys_log` VALUES ('355', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:50:58', '1', 'admin', '2018-01-23 11:50:58', '记录日志');
INSERT INTO `sys_log` VALUES ('356', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:51:01', '1', 'admin', '2018-01-23 11:51:01', '记录日志');
INSERT INTO `sys_log` VALUES ('357', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/role', '2018-01-23 11:51:11', '1', 'admin', '2018-01-23 11:51:11', '记录日志');
INSERT INTO `sys_log` VALUES ('358', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-23 11:51:11', '1', 'admin', '2018-01-23 11:51:11', '记录日志');
INSERT INTO `sys_log` VALUES ('359', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/auth', '2018-01-23 11:51:16', '1', 'admin', '2018-01-23 11:51:16', '记录日志');
INSERT INTO `sys_log` VALUES ('360', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role/auth?id=1', '127.0.0.1', '/system/res/resAuthTree', '2018-01-23 11:51:16', '1', 'admin', '2018-01-23 11:51:16', '记录日志');
INSERT INTO `sys_log` VALUES ('361', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-23 11:51:26', '1', 'admin', '2018-01-23 11:51:26', '记录日志');
INSERT INTO `sys_log` VALUES ('362', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:51:30', '1', 'admin', '2018-01-23 11:51:30', '记录日志');
INSERT INTO `sys_log` VALUES ('363', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/delete', '2018-01-23 11:51:36', '1', 'admin', '2018-01-23 11:51:36', '记录日志');
INSERT INTO `sys_log` VALUES ('364', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:51:36', '1', 'admin', '2018-01-23 11:51:36', '记录日志');
INSERT INTO `sys_log` VALUES ('365', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:51:36', '1', 'admin', '2018-01-23 11:51:36', '记录日志');
INSERT INTO `sys_log` VALUES ('366', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:51:41', '1', 'admin', '2018-01-23 11:51:41', '记录日志');
INSERT INTO `sys_log` VALUES ('367', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:51:43', '1', 'admin', '2018-01-23 11:51:43', '记录日志');
INSERT INTO `sys_log` VALUES ('368', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:51:50', '1', 'admin', '2018-01-23 11:51:50', '记录日志');
INSERT INTO `sys_log` VALUES ('369', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 11:51:56', '1', 'admin', '2018-01-23 11:51:56', '记录日志');
INSERT INTO `sys_log` VALUES ('370', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 11:51:56', '1', 'admin', '2018-01-23 11:51:56', '记录日志');
INSERT INTO `sys_log` VALUES ('371', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 11:51:56', '1', 'admin', '2018-01-23 11:51:56', '记录日志');
INSERT INTO `sys_log` VALUES ('372', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:51:56', '1', 'admin', '2018-01-23 11:51:56', '记录日志');
INSERT INTO `sys_log` VALUES ('373', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/role', '2018-01-23 11:51:58', '1', 'admin', '2018-01-23 11:51:58', '记录日志');
INSERT INTO `sys_log` VALUES ('374', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-23 11:51:58', '1', 'admin', '2018-01-23 11:51:58', '记录日志');
INSERT INTO `sys_log` VALUES ('375', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/auth', '2018-01-23 11:52:01', '1', 'admin', '2018-01-23 11:52:01', '记录日志');
INSERT INTO `sys_log` VALUES ('376', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role/auth?id=1', '127.0.0.1', '/system/res/resAuthTree', '2018-01-23 11:52:01', '1', 'admin', '2018-01-23 11:52:01', '记录日志');
INSERT INTO `sys_log` VALUES ('377', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/role/auth?id=1', '127.0.0.1', '/system/role/postAuth', '2018-01-23 11:52:04', '1', 'admin', '2018-01-23 11:52:04', '记录日志');
INSERT INTO `sys_log` VALUES ('378', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-23 11:52:04', '1', 'admin', '2018-01-23 11:52:04', '记录日志');
INSERT INTO `sys_log` VALUES ('379', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:52:12', '1', 'admin', '2018-01-23 11:52:12', '记录日志');
INSERT INTO `sys_log` VALUES ('380', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 11:52:13', '1', 'admin', '2018-01-23 11:52:13', '记录日志');
INSERT INTO `sys_log` VALUES ('381', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/tableData', '2018-01-23 11:52:13', '1', 'admin', '2018-01-23 11:52:13', '记录日志');
INSERT INTO `sys_log` VALUES ('382', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:52:22', '1', 'admin', '2018-01-23 11:52:22', '记录日志');
INSERT INTO `sys_log` VALUES ('383', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-23 11:52:23', '1', 'admin', '2018-01-23 11:52:23', '记录日志');
INSERT INTO `sys_log` VALUES ('384', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:52:23', '1', 'admin', '2018-01-23 11:52:23', '记录日志');
INSERT INTO `sys_log` VALUES ('385', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:52:24', '1', 'admin', '2018-01-23 11:52:24', '记录日志');
INSERT INTO `sys_log` VALUES ('386', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:52:26', '1', 'admin', '2018-01-23 11:52:26', '记录日志');
INSERT INTO `sys_log` VALUES ('387', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/add', '2018-01-23 11:52:28', '1', 'admin', '2018-01-23 11:52:28', '记录日志');
INSERT INTO `sys_log` VALUES ('388', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res/add?pid=92', '127.0.0.1', '/system/res/postAdd', '2018-01-23 11:52:51', '1', 'admin', '2018-01-23 11:52:51', '记录日志');
INSERT INTO `sys_log` VALUES ('389', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:52:51', '1', 'admin', '2018-01-23 11:52:51', '记录日志');
INSERT INTO `sys_log` VALUES ('390', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:52:51', '1', 'admin', '2018-01-23 11:52:51', '记录日志');
INSERT INTO `sys_log` VALUES ('391', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/add', '2018-01-23 11:52:56', '1', 'admin', '2018-01-23 11:52:56', '记录日志');
INSERT INTO `sys_log` VALUES ('392', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:53:01', '1', 'admin', '2018-01-23 11:53:01', '记录日志');
INSERT INTO `sys_log` VALUES ('393', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:53:01', '1', 'admin', '2018-01-23 11:53:01', '记录日志');
INSERT INTO `sys_log` VALUES ('394', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-23 11:53:05', '1', 'admin', '2018-01-23 11:53:05', '记录日志');
INSERT INTO `sys_log` VALUES ('395', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res/update?id=93', '127.0.0.1', '/system/res/postUpdate', '2018-01-23 11:53:23', '1', 'admin', '2018-01-23 11:53:23', '记录日志');
INSERT INTO `sys_log` VALUES ('396', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:53:24', '1', 'admin', '2018-01-23 11:53:24', '记录日志');
INSERT INTO `sys_log` VALUES ('397', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:53:24', '1', 'admin', '2018-01-23 11:53:24', '记录日志');
INSERT INTO `sys_log` VALUES ('398', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/add', '2018-01-23 11:53:26', '1', 'admin', '2018-01-23 11:53:26', '记录日志');
INSERT INTO `sys_log` VALUES ('399', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res/add?pid=92', '127.0.0.1', '/system/res/postAdd', '2018-01-23 11:53:55', '1', 'admin', '2018-01-23 11:53:55', '记录日志');
INSERT INTO `sys_log` VALUES ('400', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:53:56', '1', 'admin', '2018-01-23 11:53:56', '记录日志');
INSERT INTO `sys_log` VALUES ('401', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:53:56', '1', 'admin', '2018-01-23 11:53:56', '记录日志');
INSERT INTO `sys_log` VALUES ('402', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/add', '2018-01-23 11:54:05', '1', 'admin', '2018-01-23 11:54:05', '记录日志');
INSERT INTO `sys_log` VALUES ('403', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res/add?pid=92', '127.0.0.1', '/system/res/postAdd', '2018-01-23 11:54:35', '1', 'admin', '2018-01-23 11:54:35', '记录日志');
INSERT INTO `sys_log` VALUES ('404', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:54:35', '1', 'admin', '2018-01-23 11:54:35', '记录日志');
INSERT INTO `sys_log` VALUES ('405', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:54:35', '1', 'admin', '2018-01-23 11:54:35', '记录日志');
INSERT INTO `sys_log` VALUES ('406', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/auth', '2018-01-23 11:54:41', '1', 'admin', '2018-01-23 11:54:41', '记录日志');
INSERT INTO `sys_log` VALUES ('407', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role/auth?id=1', '127.0.0.1', '/system/res/resAuthTree', '2018-01-23 11:54:41', '1', 'admin', '2018-01-23 11:54:41', '记录日志');
INSERT INTO `sys_log` VALUES ('408', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/role/auth?id=1', '127.0.0.1', '/system/role/postAuth', '2018-01-23 11:54:44', '1', 'admin', '2018-01-23 11:54:44', '记录日志');
INSERT INTO `sys_log` VALUES ('409', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-23 11:54:45', '1', 'admin', '2018-01-23 11:54:45', '记录日志');
INSERT INTO `sys_log` VALUES ('410', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 11:54:47', '1', 'admin', '2018-01-23 11:54:47', '记录日志');
INSERT INTO `sys_log` VALUES ('411', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 11:54:47', '1', 'admin', '2018-01-23 11:54:47', '记录日志');
INSERT INTO `sys_log` VALUES ('412', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 11:54:47', '1', 'admin', '2018-01-23 11:54:47', '记录日志');
INSERT INTO `sys_log` VALUES ('413', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:54:47', '1', 'admin', '2018-01-23 11:54:47', '记录日志');
INSERT INTO `sys_log` VALUES ('414', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:54:48', '1', 'admin', '2018-01-23 11:54:48', '记录日志');
INSERT INTO `sys_log` VALUES ('415', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:54:57', '1', 'admin', '2018-01-23 11:54:57', '记录日志');
INSERT INTO `sys_log` VALUES ('416', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-23 11:54:58', '1', 'admin', '2018-01-23 11:54:58', '记录日志');
INSERT INTO `sys_log` VALUES ('417', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:54:58', '1', 'admin', '2018-01-23 11:54:58', '记录日志');
INSERT INTO `sys_log` VALUES ('418', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:54:58', '1', 'admin', '2018-01-23 11:54:58', '记录日志');
INSERT INTO `sys_log` VALUES ('419', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:55:00', '1', 'admin', '2018-01-23 11:55:00', '记录日志');
INSERT INTO `sys_log` VALUES ('420', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-23 11:55:03', '1', 'admin', '2018-01-23 11:55:03', '记录日志');
INSERT INTO `sys_log` VALUES ('421', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:55:15', '1', 'admin', '2018-01-23 11:55:15', '记录日志');
INSERT INTO `sys_log` VALUES ('422', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:55:15', '1', 'admin', '2018-01-23 11:55:15', '记录日志');
INSERT INTO `sys_log` VALUES ('423', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-23 11:55:20', '1', 'admin', '2018-01-23 11:55:20', '记录日志');
INSERT INTO `sys_log` VALUES ('424', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:55:25', '1', 'admin', '2018-01-23 11:55:25', '记录日志');
INSERT INTO `sys_log` VALUES ('425', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:55:25', '1', 'admin', '2018-01-23 11:55:25', '记录日志');
INSERT INTO `sys_log` VALUES ('426', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-23 11:55:26', '1', 'admin', '2018-01-23 11:55:26', '记录日志');
INSERT INTO `sys_log` VALUES ('427', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:55:30', '1', 'admin', '2018-01-23 11:55:30', '记录日志');
INSERT INTO `sys_log` VALUES ('428', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:55:30', '1', 'admin', '2018-01-23 11:55:30', '记录日志');
INSERT INTO `sys_log` VALUES ('429', null, 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/login', '2018-01-23 11:58:48', '1', 'guest', '2018-01-23 11:58:48', '记录日志');
INSERT INTO `sys_log` VALUES ('430', null, 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/captcha', '2018-01-23 11:58:49', '1', 'guest', '2018-01-23 11:58:49', '记录日志');
INSERT INTO `sys_log` VALUES ('431', null, 'Chrome', 'POST', 'http://127.0.0.1:8888/login', '127.0.0.1', '/postLogin', '2018-01-23 11:58:59', '1', 'guest', '2018-01-23 11:58:59', '记录日志');
INSERT INTO `sys_log` VALUES ('432', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 11:58:59', '1', 'admin', '2018-01-23 11:58:59', '记录日志');
INSERT INTO `sys_log` VALUES ('433', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 11:58:59', '1', 'admin', '2018-01-23 11:58:59', '记录日志');
INSERT INTO `sys_log` VALUES ('434', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 11:59:00', '1', 'admin', '2018-01-23 11:59:00', '记录日志');
INSERT INTO `sys_log` VALUES ('435', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:59:00', '1', 'admin', '2018-01-23 11:59:00', '记录日志');
INSERT INTO `sys_log` VALUES ('436', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-23 11:59:04', '1', 'admin', '2018-01-23 11:59:04', '记录日志');
INSERT INTO `sys_log` VALUES ('437', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:59:04', '1', 'admin', '2018-01-23 11:59:04', '记录日志');
INSERT INTO `sys_log` VALUES ('438', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:59:05', '1', 'admin', '2018-01-23 11:59:05', '记录日志');
INSERT INTO `sys_log` VALUES ('439', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:59:08', '1', 'admin', '2018-01-23 11:59:08', '记录日志');
INSERT INTO `sys_log` VALUES ('440', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-23 11:59:12', '1', 'admin', '2018-01-23 11:59:12', '记录日志');
INSERT INTO `sys_log` VALUES ('441', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res/update?id=93', '127.0.0.1', '/system/res/postUpdate', '2018-01-23 11:59:24', '1', 'admin', '2018-01-23 11:59:24', '记录日志');
INSERT INTO `sys_log` VALUES ('442', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:59:24', '1', 'admin', '2018-01-23 11:59:24', '记录日志');
INSERT INTO `sys_log` VALUES ('443', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:59:24', '1', 'admin', '2018-01-23 11:59:24', '记录日志');
INSERT INTO `sys_log` VALUES ('444', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-23 11:59:29', '1', 'admin', '2018-01-23 11:59:29', '记录日志');
INSERT INTO `sys_log` VALUES ('445', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res/update?id=93', '127.0.0.1', '/system/res/postUpdate', '2018-01-23 11:59:34', '1', 'admin', '2018-01-23 11:59:34', '记录日志');
INSERT INTO `sys_log` VALUES ('446', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:59:34', '1', 'admin', '2018-01-23 11:59:34', '记录日志');
INSERT INTO `sys_log` VALUES ('447', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:59:34', '1', 'admin', '2018-01-23 11:59:34', '记录日志');
INSERT INTO `sys_log` VALUES ('448', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 11:59:41', '1', 'admin', '2018-01-23 11:59:41', '记录日志');
INSERT INTO `sys_log` VALUES ('449', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 11:59:41', '1', 'admin', '2018-01-23 11:59:41', '记录日志');
INSERT INTO `sys_log` VALUES ('450', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 11:59:41', '1', 'admin', '2018-01-23 11:59:41', '记录日志');
INSERT INTO `sys_log` VALUES ('451', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:59:41', '1', 'admin', '2018-01-23 11:59:41', '记录日志');
INSERT INTO `sys_log` VALUES ('452', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:59:42', '1', 'admin', '2018-01-23 11:59:42', '记录日志');
INSERT INTO `sys_log` VALUES ('453', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:59:45', '1', 'admin', '2018-01-23 11:59:45', '记录日志');
INSERT INTO `sys_log` VALUES ('454', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:59:48', '1', 'admin', '2018-01-23 11:59:48', '记录日志');
INSERT INTO `sys_log` VALUES ('455', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 11:59:53', '1', 'admin', '2018-01-23 11:59:53', '记录日志');
INSERT INTO `sys_log` VALUES ('456', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-23 11:59:55', '1', 'admin', '2018-01-23 11:59:55', '记录日志');
INSERT INTO `sys_log` VALUES ('457', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 11:59:55', '1', 'admin', '2018-01-23 11:59:55', '记录日志');
INSERT INTO `sys_log` VALUES ('458', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:59:55', '1', 'admin', '2018-01-23 11:59:55', '记录日志');
INSERT INTO `sys_log` VALUES ('459', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 11:59:58', '1', 'admin', '2018-01-23 11:59:58', '记录日志');
INSERT INTO `sys_log` VALUES ('460', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 12:00:27', '1', 'admin', '2018-01-23 12:00:27', '记录日志');
INSERT INTO `sys_log` VALUES ('461', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 12:00:32', '1', 'admin', '2018-01-23 12:00:32', '记录日志');
INSERT INTO `sys_log` VALUES ('462', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:00:35', '1', 'admin', '2018-01-23 12:00:35', '记录日志');
INSERT INTO `sys_log` VALUES ('463', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:00:36', '1', 'admin', '2018-01-23 12:00:36', '记录日志');
INSERT INTO `sys_log` VALUES ('464', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:00:37', '1', 'admin', '2018-01-23 12:00:37', '记录日志');
INSERT INTO `sys_log` VALUES ('465', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/add', '2018-01-23 12:00:45', '1', 'admin', '2018-01-23 12:00:45', '记录日志');
INSERT INTO `sys_log` VALUES ('466', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 12:01:19', '1', 'admin', '2018-01-23 12:01:19', '记录日志');
INSERT INTO `sys_log` VALUES ('467', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:01:19', '1', 'admin', '2018-01-23 12:01:19', '记录日志');
INSERT INTO `sys_log` VALUES ('468', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:01:21', '1', 'admin', '2018-01-23 12:01:21', '记录日志');
INSERT INTO `sys_log` VALUES ('469', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-23 12:01:23', '1', 'admin', '2018-01-23 12:01:23', '记录日志');
INSERT INTO `sys_log` VALUES ('470', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res/update?id=65', '127.0.0.1', '/system/res/postUpdate', '2018-01-23 12:01:46', '1', 'admin', '2018-01-23 12:01:46', '记录日志');
INSERT INTO `sys_log` VALUES ('471', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:01:47', '1', 'admin', '2018-01-23 12:01:47', '记录日志');
INSERT INTO `sys_log` VALUES ('472', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 12:01:47', '1', 'admin', '2018-01-23 12:01:47', '记录日志');
INSERT INTO `sys_log` VALUES ('473', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:01:54', '1', 'admin', '2018-01-23 12:01:54', '记录日志');
INSERT INTO `sys_log` VALUES ('474', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/update', '2018-01-23 12:02:01', '1', 'admin', '2018-01-23 12:02:01', '记录日志');
INSERT INTO `sys_log` VALUES ('475', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:02:11', '1', 'admin', '2018-01-23 12:02:11', '记录日志');
INSERT INTO `sys_log` VALUES ('476', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 12:02:11', '1', 'admin', '2018-01-23 12:02:11', '记录日志');
INSERT INTO `sys_log` VALUES ('477', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/add', '2018-01-23 12:02:13', '1', 'admin', '2018-01-23 12:02:13', '记录日志');
INSERT INTO `sys_log` VALUES ('478', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res/add?pid=65', '127.0.0.1', '/system/res/postAdd', '2018-01-23 12:02:27', '1', 'admin', '2018-01-23 12:02:27', '记录日志');
INSERT INTO `sys_log` VALUES ('479', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:02:27', '1', 'admin', '2018-01-23 12:02:27', '记录日志');
INSERT INTO `sys_log` VALUES ('480', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 12:02:27', '1', 'admin', '2018-01-23 12:02:27', '记录日志');
INSERT INTO `sys_log` VALUES ('481', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:02:44', '1', 'admin', '2018-01-23 12:02:44', '记录日志');
INSERT INTO `sys_log` VALUES ('482', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/add', '2018-01-23 12:02:46', '1', 'admin', '2018-01-23 12:02:46', '记录日志');
INSERT INTO `sys_log` VALUES ('483', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res/add?pid=96', '127.0.0.1', '/system/res/postAdd', '2018-01-23 12:03:02', '1', 'admin', '2018-01-23 12:03:02', '记录日志');
INSERT INTO `sys_log` VALUES ('484', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:03:03', '1', 'admin', '2018-01-23 12:03:03', '记录日志');
INSERT INTO `sys_log` VALUES ('485', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 12:03:03', '1', 'admin', '2018-01-23 12:03:03', '记录日志');
INSERT INTO `sys_log` VALUES ('486', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/role', '2018-01-23 12:03:12', '1', 'admin', '2018-01-23 12:03:12', '记录日志');
INSERT INTO `sys_log` VALUES ('487', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-23 12:03:12', '1', 'admin', '2018-01-23 12:03:12', '记录日志');
INSERT INTO `sys_log` VALUES ('488', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/auth', '2018-01-23 12:03:14', '1', 'admin', '2018-01-23 12:03:14', '记录日志');
INSERT INTO `sys_log` VALUES ('489', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role/auth?id=1', '127.0.0.1', '/system/res/resAuthTree', '2018-01-23 12:03:15', '1', 'admin', '2018-01-23 12:03:15', '记录日志');
INSERT INTO `sys_log` VALUES ('490', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/role/auth?id=1', '127.0.0.1', '/system/role/postAuth', '2018-01-23 12:03:19', '1', 'admin', '2018-01-23 12:03:19', '记录日志');
INSERT INTO `sys_log` VALUES ('491', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-23 12:03:19', '1', 'admin', '2018-01-23 12:03:19', '记录日志');
INSERT INTO `sys_log` VALUES ('492', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 12:03:22', '1', 'admin', '2018-01-23 12:03:22', '记录日志');
INSERT INTO `sys_log` VALUES ('493', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 12:03:22', '1', 'admin', '2018-01-23 12:03:22', '记录日志');
INSERT INTO `sys_log` VALUES ('494', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 12:03:22', '1', 'admin', '2018-01-23 12:03:22', '记录日志');
INSERT INTO `sys_log` VALUES ('495', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 12:03:22', '1', 'admin', '2018-01-23 12:03:22', '记录日志');
INSERT INTO `sys_log` VALUES ('496', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 12:03:23', '1', 'admin', '2018-01-23 12:03:23', '记录日志');
INSERT INTO `sys_log` VALUES ('497', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 12:03:25', '1', 'admin', '2018-01-23 12:03:25', '记录日志');
INSERT INTO `sys_log` VALUES ('498', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/tableData', '2018-01-23 12:03:25', '1', 'admin', '2018-01-23 12:03:25', '记录日志');
INSERT INTO `sys_log` VALUES ('499', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 12:03:29', '1', 'admin', '2018-01-23 12:03:29', '记录日志');
INSERT INTO `sys_log` VALUES ('500', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 12:03:29', '1', 'admin', '2018-01-23 12:03:29', '记录日志');
INSERT INTO `sys_log` VALUES ('501', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 12:03:31', '1', 'admin', '2018-01-23 12:03:31', '记录日志');
INSERT INTO `sys_log` VALUES ('502', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-23 12:03:32', '1', 'admin', '2018-01-23 12:03:32', '记录日志');
INSERT INTO `sys_log` VALUES ('503', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 12:03:32', '1', 'admin', '2018-01-23 12:03:32', '记录日志');
INSERT INTO `sys_log` VALUES ('504', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:03:32', '1', 'admin', '2018-01-23 12:03:32', '记录日志');
INSERT INTO `sys_log` VALUES ('505', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 12:05:27', '1', 'admin', '2018-01-23 12:05:27', '记录日志');
INSERT INTO `sys_log` VALUES ('506', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 12:05:27', '1', 'admin', '2018-01-23 12:05:27', '记录日志');
INSERT INTO `sys_log` VALUES ('507', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 12:05:27', '1', 'admin', '2018-01-23 12:05:27', '记录日志');
INSERT INTO `sys_log` VALUES ('508', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 12:05:27', '1', 'admin', '2018-01-23 12:05:27', '记录日志');
INSERT INTO `sys_log` VALUES ('509', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-23 12:05:34', '1', 'admin', '2018-01-23 12:05:34', '记录日志');
INSERT INTO `sys_log` VALUES ('510', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 12:05:34', '1', 'admin', '2018-01-23 12:05:34', '记录日志');
INSERT INTO `sys_log` VALUES ('511', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:05:34', '1', 'admin', '2018-01-23 12:05:34', '记录日志');
INSERT INTO `sys_log` VALUES ('512', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:05:36', '1', 'admin', '2018-01-23 12:05:36', '记录日志');
INSERT INTO `sys_log` VALUES ('513', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/delete', '2018-01-23 12:05:53', '1', 'admin', '2018-01-23 12:05:53', '记录日志');
INSERT INTO `sys_log` VALUES ('514', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:05:53', '1', 'admin', '2018-01-23 12:05:53', '记录日志');
INSERT INTO `sys_log` VALUES ('515', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 12:05:53', '1', 'admin', '2018-01-23 12:05:53', '记录日志');
INSERT INTO `sys_log` VALUES ('516', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:05:58', '1', 'admin', '2018-01-23 12:05:58', '记录日志');
INSERT INTO `sys_log` VALUES ('517', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:05:58', '1', 'admin', '2018-01-23 12:05:58', '记录日志');
INSERT INTO `sys_log` VALUES ('518', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 12:06:54', '1', 'admin', '2018-01-23 12:06:54', '记录日志');
INSERT INTO `sys_log` VALUES ('519', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 12:06:54', '1', 'admin', '2018-01-23 12:06:54', '记录日志');
INSERT INTO `sys_log` VALUES ('520', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 12:06:54', '1', 'admin', '2018-01-23 12:06:54', '记录日志');
INSERT INTO `sys_log` VALUES ('521', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 12:06:54', '1', 'admin', '2018-01-23 12:06:54', '记录日志');
INSERT INTO `sys_log` VALUES ('522', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res', '2018-01-23 12:06:56', '1', 'admin', '2018-01-23 12:06:56', '记录日志');
INSERT INTO `sys_log` VALUES ('523', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resTree', '2018-01-23 12:06:56', '1', 'admin', '2018-01-23 12:06:56', '记录日志');
INSERT INTO `sys_log` VALUES ('524', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:06:56', '1', 'admin', '2018-01-23 12:06:56', '记录日志');
INSERT INTO `sys_log` VALUES ('525', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/res', '127.0.0.1', '/system/res/resData', '2018-01-23 12:06:59', '1', 'admin', '2018-01-23 12:06:59', '记录日志');
INSERT INTO `sys_log` VALUES ('526', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/role', '2018-01-23 12:07:04', '1', 'admin', '2018-01-23 12:07:04', '记录日志');
INSERT INTO `sys_log` VALUES ('527', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-23 12:07:04', '1', 'admin', '2018-01-23 12:07:04', '记录日志');
INSERT INTO `sys_log` VALUES ('528', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/auth', '2018-01-23 12:07:05', '1', 'admin', '2018-01-23 12:07:05', '记录日志');
INSERT INTO `sys_log` VALUES ('529', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role/auth?id=1', '127.0.0.1', '/system/res/resAuthTree', '2018-01-23 12:07:05', '1', 'admin', '2018-01-23 12:07:05', '记录日志');
INSERT INTO `sys_log` VALUES ('530', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/system/role/auth?id=1', '127.0.0.1', '/system/role/postAuth', '2018-01-23 12:07:09', '1', 'admin', '2018-01-23 12:07:09', '记录日志');
INSERT INTO `sys_log` VALUES ('531', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/system/role', '127.0.0.1', '/system/role/tableData', '2018-01-23 12:07:09', '1', 'admin', '2018-01-23 12:07:09', '记录日志');
INSERT INTO `sys_log` VALUES ('532', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/login', '127.0.0.1', '/', '2018-01-23 12:07:15', '1', 'admin', '2018-01-23 12:07:15', '记录日志');
INSERT INTO `sys_log` VALUES ('533', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/welcome', '2018-01-23 12:07:15', '1', 'admin', '2018-01-23 12:07:15', '记录日志');
INSERT INTO `sys_log` VALUES ('534', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuTop', '2018-01-23 12:07:16', '1', 'admin', '2018-01-23 12:07:16', '记录日志');
INSERT INTO `sys_log` VALUES ('535', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 12:07:16', '1', 'admin', '2018-01-23 12:07:16', '记录日志');
INSERT INTO `sys_log` VALUES ('536', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 12:07:16', '1', 'admin', '2018-01-23 12:07:16', '记录日志');
INSERT INTO `sys_log` VALUES ('537', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 12:07:17', '1', 'admin', '2018-01-23 12:07:17', '记录日志');
INSERT INTO `sys_log` VALUES ('538', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/tableData', '2018-01-23 12:07:17', '1', 'admin', '2018-01-23 12:07:17', '记录日志');
INSERT INTO `sys_log` VALUES ('539', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/add', '2018-01-23 12:07:21', '1', 'admin', '2018-01-23 12:07:21', '记录日志');
INSERT INTO `sys_log` VALUES ('540', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/b2c/product/add', '127.0.0.1', '/b2c/product/postAdd', '2018-01-23 12:07:47', '1', 'admin', '2018-01-23 12:07:47', '记录日志');
INSERT INTO `sys_log` VALUES ('541', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/tableData', '2018-01-23 12:07:47', '1', 'admin', '2018-01-23 12:07:47', '记录日志');
INSERT INTO `sys_log` VALUES ('542', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 12:08:37', '1', 'admin', '2018-01-23 12:08:37', '记录日志');
INSERT INTO `sys_log` VALUES ('543', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/tableData', '2018-01-23 12:08:38', '1', 'admin', '2018-01-23 12:08:38', '记录日志');
INSERT INTO `sys_log` VALUES ('544', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 12:09:06', '1', 'admin', '2018-01-23 12:09:06', '记录日志');
INSERT INTO `sys_log` VALUES ('545', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/tableData', '2018-01-23 12:09:06', '1', 'admin', '2018-01-23 12:09:06', '记录日志');
INSERT INTO `sys_log` VALUES ('546', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 12:09:11', '1', 'admin', '2018-01-23 12:09:11', '记录日志');
INSERT INTO `sys_log` VALUES ('547', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/tableData', '2018-01-23 12:09:11', '1', 'admin', '2018-01-23 12:09:11', '记录日志');
INSERT INTO `sys_log` VALUES ('548', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 12:09:36', '1', 'admin', '2018-01-23 12:09:36', '记录日志');
INSERT INTO `sys_log` VALUES ('549', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/tableData', '2018-01-23 12:09:36', '1', 'admin', '2018-01-23 12:09:36', '记录日志');
INSERT INTO `sys_log` VALUES ('550', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 12:10:03', '1', 'admin', '2018-01-23 12:10:03', '记录日志');
INSERT INTO `sys_log` VALUES ('551', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/tableData', '2018-01-23 12:10:03', '1', 'admin', '2018-01-23 12:10:03', '记录日志');
INSERT INTO `sys_log` VALUES ('552', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 12:10:19', '1', 'admin', '2018-01-23 12:10:19', '记录日志');
INSERT INTO `sys_log` VALUES ('553', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/tableData', '2018-01-23 12:10:20', '1', 'admin', '2018-01-23 12:10:20', '记录日志');
INSERT INTO `sys_log` VALUES ('554', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/b2c/product', '2018-01-23 12:10:38', '1', 'admin', '2018-01-23 12:10:38', '记录日志');
INSERT INTO `sys_log` VALUES ('555', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/tableData', '2018-01-23 12:10:38', '1', 'admin', '2018-01-23 12:10:38', '记录日志');
INSERT INTO `sys_log` VALUES ('556', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/add', '2018-01-23 12:10:49', '1', 'admin', '2018-01-23 12:10:49', '记录日志');
INSERT INTO `sys_log` VALUES ('557', '3', 'Chrome', 'POST', 'http://127.0.0.1:8888/b2c/product/add', '127.0.0.1', '/b2c/product/postAdd', '2018-01-23 12:11:31', '1', 'admin', '2018-01-23 12:11:31', '记录日志');
INSERT INTO `sys_log` VALUES ('558', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/b2c/product', '127.0.0.1', '/b2c/product/tableData', '2018-01-23 12:11:31', '1', 'admin', '2018-01-23 12:11:31', '记录日志');
INSERT INTO `sys_log` VALUES ('559', '3', 'Chrome', 'GET', 'http://127.0.0.1:8888/', '127.0.0.1', '/system/res/menuLeft', '2018-01-23 12:11:39', '1', 'admin', '2018-01-23 12:11:39', '记录日志');

-- ----------------------------
-- Table structure for sys_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_res`;
CREATE TABLE `sys_res` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL,
  `name` varchar(111) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT 'am-icon-file',
  `seq` bigint(20) DEFAULT '1',
  `type` varchar(2) DEFAULT '2' COMMENT '1 功能 2 权限',
  `status` varchar(2) DEFAULT '1' COMMENT '1-启用 0-未启用',
  `lastUpdAcct` varchar(20) DEFAULT NULL,
  `lastUpdTime` datetime DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_res
-- ----------------------------
INSERT INTO `sys_res` VALUES ('1', '0', '系统管理', '系统管理', '#', '1', '&#xe614;', '1', '1', '1', 'admin', '2018-01-17 10:22:03', '启用系统资源');
INSERT INTO `sys_res` VALUES ('2', '1', '系统管理', '系统管理', '#', '2', '&#xe614;', '1', '1', '1', 'admin', '2016-10-25 10:47:23', '修改资源');
INSERT INTO `sys_res` VALUES ('3', '2', '资源管理', '资源管理', '/system/res', '3', '&#xe614;', '1', '1', '1', 'admin', '2016-10-18 16:24:08', '添加资源');
INSERT INTO `sys_res` VALUES ('4', '2', '用户管理', '用户管理', '/system/user', '3', '&#xe614;', '3', '1', '1', '', '2017-10-13 11:26:19', '修改系统资源');
INSERT INTO `sys_res` VALUES ('8', '2', '数据管理', '数据管理', '/system/data', '3', '&#xe614;', '8', '1', '1', 'admin', '2016-10-20 21:29:24', '修改资源');
INSERT INTO `sys_res` VALUES ('9', '2', '日志管理', '日志管理', '/system/log', '3', '&#xe614;', '10', '1', '1', 'admin', '2016-10-18 19:31:47', '添加资源');
INSERT INTO `sys_res` VALUES ('10', '2', '角色管理', '角色管理', '/system/role', '3', '&#xe614;', '2', '1', '1', '', '2017-10-13 11:26:14', '修改系统资源');
INSERT INTO `sys_res` VALUES ('13', '2', '个人资料', '个人资料', '/system/user/profile', '3', '&#xe614;', '15', '1', '1', 'admin', '2016-10-25 16:16:00', '添加资源');
INSERT INTO `sys_res` VALUES ('14', '2', '修改密码', '修改密码', '/system/user/changepwd', '3', '&#xe614;', '20', '1', '1', 'admin', '2017-10-17 11:44:37', '启用系统资源');
INSERT INTO `sys_res` VALUES ('17', '2', '页面管理', '页面管理', '/system/page', '3', '&#xe614;', '7', '1', '1', 'admin', '2017-03-29 16:31:47', '添加资源');
INSERT INTO `sys_res` VALUES ('20', '3', '资源管理-添加', '资源管理-添加', '/system/res/add', '4', '&#xe614;', '1', '2', '1', 'admin', '2018-01-17 19:06:41', '启用系统资源');
INSERT INTO `sys_res` VALUES ('21', '3', '资源管理-编辑', '资源管理-编辑', '/system/res/update', '4', '&#xe614;', '2', '2', '1', 'admin', '2017-05-11 16:24:08', '添加资源');
INSERT INTO `sys_res` VALUES ('22', '3', '资源管理-删除', '资源管理-删除', '/system/res/delete', '4', '&#xe614;', '3', '2', '1', 'admin', '2017-05-11 16:24:46', '添加资源');
INSERT INTO `sys_res` VALUES ('23', '4', '用户管理-新增', '用户管理-新增', '/system/user/add', '4', '&#xe614;', '1', '2', '1', 'admin', '2017-05-11 16:35:50', '添加资源');
INSERT INTO `sys_res` VALUES ('24', '4', '用户管理-编辑', '用户管理-编辑', '/system/user/update', '4', '&#xe614;', '2', '2', '1', 'admin', '2017-05-11 16:36:21', '添加资源');
INSERT INTO `sys_res` VALUES ('25', '4', '用户管理-删除', '用户管理-删除', '/system/user/delete', '4', '&#xe614;', '3', '2', '1', 'admin', '2017-05-11 16:36:45', '添加资源');
INSERT INTO `sys_res` VALUES ('26', '10', '角色管理-新增', '角色管理-新增', '/system/role/add', '4', '&#xe614;', '1', '2', '1', 'admin', '2017-05-11 16:37:14', '添加资源');
INSERT INTO `sys_res` VALUES ('27', '10', '角色管理-编辑', '角色管理-编辑', '/system/role/update', '4', '&#xe614;', '1', '2', '1', 'admin', '2017-05-11 16:37:59', '修改资源');
INSERT INTO `sys_res` VALUES ('28', '10', '角色管理-删除', '角色管理-删除', '/system/role/delete', '4', '&#xe614;', '3', '2', '1', 'admin', '2017-05-11 16:38:28', '添加资源');
INSERT INTO `sys_res` VALUES ('46', '3', '资源管理-启用', '资源管理-启用', '/system/res/use', '4', '&#xe614;', '4', '2', '1', 'admin', '2017-10-17 16:38:34', '保存系统资源');
INSERT INTO `sys_res` VALUES ('47', '3', '资源管理-停用', '资源管理-停用', '/system/res/unuse', '4', '&#xe614;', '6', '2', '1', 'admin', '2017-10-17 16:39:03', '保存系统资源');
INSERT INTO `sys_res` VALUES ('48', '8', '数据管理-添加', '数据管理-添加', '/system/data/add', '4', '&#xe614;', '1', '2', '1', 'admin', '2017-10-17 17:11:10', '修改系统资源');
INSERT INTO `sys_res` VALUES ('49', '8', '数据管理-修改', '数据管理-修改', '/system/data/update', '4', '&#xe614;', '2', '2', '1', 'admin', '2017-10-17 17:11:17', '修改系统资源');
INSERT INTO `sys_res` VALUES ('50', '8', '数据管理-删除', '数据管理-删除', '/system/data/delete', '4', '&#xe614;', '3', '2', '1', 'admin', '2017-10-17 16:59:59', '保存系统资源');
INSERT INTO `sys_res` VALUES ('51', '8', '数据管理-启用', '数据管理-启用', '/system/data/use', '4', '&#xe614;', '4', '2', '1', 'admin', '2017-10-17 17:00:32', '保存系统资源');
INSERT INTO `sys_res` VALUES ('52', '8', '数据管理-停用', '数据管理-停用', '/system/data/unuse', '4', '&#xe614;', '5', '2', '1', 'admin', '2017-10-17 17:00:58', '保存系统资源');
INSERT INTO `sys_res` VALUES ('53', '10', '角色管理-权限', '角色管理-权限', '/system/role/auth', '4', '&#xe614;', '4', '2', '1', 'admin', '2017-10-19 11:36:33', '保存系统资源');
INSERT INTO `sys_res` VALUES ('54', '4', '用户管理-解锁', '用户管理-解锁', '/system/user/use', '4', '&#xe614;', '4', '2', '1', 'admin', '2017-10-19 11:43:39', '修改系统资源');
INSERT INTO `sys_res` VALUES ('55', '4', '用户管理-锁定', '用户管理-锁定', '/system/user/unuse', '4', '&#xe614;', '5', '2', '1', 'admin', '2018-01-03 16:23:21', '启用系统资源');
INSERT INTO `sys_res` VALUES ('56', '1', '监控管理', '监控管理', '#', '2', '&#xe614;', '2', '1', '1', 'admin', '2017-10-19 11:53:00', '保存系统资源');
INSERT INTO `sys_res` VALUES ('57', '56', '注册中心监控', '注册中心监控', 'http://127.0.0.1:8500', '3', '&#xe614;', '1', '1', '1', 'admin', '2018-01-11 13:23:09', '修改系统资源');
INSERT INTO `sys_res` VALUES ('58', '56', '服务监控', '服务监控', 'http://127.0.0.1:7010/hystrix', '3', '&#xe614;', '5', '1', '1', 'admin', '2018-01-11 13:23:23', '修改系统资源');
INSERT INTO `sys_res` VALUES ('59', '8', '数据管理-刷新缓存', '数据管理-刷新缓存', '/system/data/cache', '4', '&#xe614;', '6', '2', '1', 'admin', '2017-10-24 09:47:50', '修改系统资源');
INSERT INTO `sys_res` VALUES ('60', '2', '会话管理', '会话管理', '/system/session', '4', '&#xe614;', '4', '1', '1', 'admin', '2017-10-24 10:11:44', '保存系统资源');
INSERT INTO `sys_res` VALUES ('61', '56', '服务链路跟踪', '服务链路跟踪', 'http://127.0.0.1:9411', '3', '&#xe614;', '15', '1', '1', 'admin', '2018-01-11 13:23:30', '修改系统资源');
INSERT INTO `sys_res` VALUES ('62', '56', '服务治理', '服务治理', 'http://127.0.0.1:7001', '3', '&#xe614;', '4', '1', '1', 'admin', '2018-01-11 13:23:16', '修改系统资源');
INSERT INTO `sys_res` VALUES ('65', '0', '电商平台', '电商平台', '#', '1', '&#xe614;', '2', '1', '1', 'admin', '2018-01-23 12:01:46', '修改系统资源');
INSERT INTO `sys_res` VALUES ('93', '97', '商品管理-添加', '商品管理-添加', '/b2c/product/add', '4', '&#xe614;', '1', '2', '1', 'admin', '2018-01-23 11:59:34', '修改系统资源');
INSERT INTO `sys_res` VALUES ('94', '97', '商品管理-编辑', '商品管理-编辑', '/b2c/product/update', '4', '&#xe614;', '2', '2', '1', 'admin', '2018-01-23 11:53:55', '保存系统资源');
INSERT INTO `sys_res` VALUES ('95', '97', '商品管理-删除', '商品管理-删除', '/b2c/product/delete', '4', '&#xe614;', '3', '2', '1', 'admin', '2018-01-23 11:54:35', '保存系统资源');
INSERT INTO `sys_res` VALUES ('96', '65', '商品中心', '商品中心', '#', '2', '&#xe614;', '1', '1', '1', 'admin', '2018-01-23 12:02:27', '保存系统资源');
INSERT INTO `sys_res` VALUES ('97', '96', '商品管理', '商品管理', '/b2c/product', '3', '&#xe614;', '1', '2', '1', 'admin', '2018-01-23 12:03:03', '保存系统资源');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `des` varchar(55) DEFAULT NULL,
  `seq` bigint(20) DEFAULT '1',
  `iconCls` varchar(55) DEFAULT 'status_online',
  `pid` bigint(20) DEFAULT '0',
  `createdate` datetime DEFAULT NULL,
  `status` varchar(2) DEFAULT '1' COMMENT '1-启用 0-未启用',
  `lastUpdAcct` varchar(20) DEFAULT NULL,
  `lastUpdTime` datetime DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '管理员-系统最高权限拥有者', '1', 'status_online', '0', '2016-10-19 15:02:25', '1', 'admin', '2017-05-11 16:41:59', '更新角色');
INSERT INTO `sys_role` VALUES ('7', '测试', '测试', '100', 'status_online', '0', null, '1', 'admin', '2018-01-11 13:18:55', '保存系统角色');

-- ----------------------------
-- Table structure for sys_role_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_res`;
CREATE TABLE `sys_role_res` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `res_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sys_ROLE_RES_RES_ID` (`res_id`) USING BTREE,
  KEY `FK_sys_ROLE_RES_ROLE_ID` (`role_id`) USING BTREE,
  CONSTRAINT `sys_role_res_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `sys_res` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_role_res_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1562 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_res
-- ----------------------------
INSERT INTO `sys_role_res` VALUES ('1399', '65', '7');
INSERT INTO `sys_role_res` VALUES ('1520', '1', '1');
INSERT INTO `sys_role_res` VALUES ('1521', '2', '1');
INSERT INTO `sys_role_res` VALUES ('1522', '3', '1');
INSERT INTO `sys_role_res` VALUES ('1523', '20', '1');
INSERT INTO `sys_role_res` VALUES ('1524', '21', '1');
INSERT INTO `sys_role_res` VALUES ('1525', '22', '1');
INSERT INTO `sys_role_res` VALUES ('1526', '46', '1');
INSERT INTO `sys_role_res` VALUES ('1527', '47', '1');
INSERT INTO `sys_role_res` VALUES ('1528', '10', '1');
INSERT INTO `sys_role_res` VALUES ('1529', '26', '1');
INSERT INTO `sys_role_res` VALUES ('1530', '27', '1');
INSERT INTO `sys_role_res` VALUES ('1531', '28', '1');
INSERT INTO `sys_role_res` VALUES ('1532', '53', '1');
INSERT INTO `sys_role_res` VALUES ('1533', '4', '1');
INSERT INTO `sys_role_res` VALUES ('1534', '23', '1');
INSERT INTO `sys_role_res` VALUES ('1535', '24', '1');
INSERT INTO `sys_role_res` VALUES ('1536', '25', '1');
INSERT INTO `sys_role_res` VALUES ('1537', '54', '1');
INSERT INTO `sys_role_res` VALUES ('1538', '55', '1');
INSERT INTO `sys_role_res` VALUES ('1539', '60', '1');
INSERT INTO `sys_role_res` VALUES ('1540', '17', '1');
INSERT INTO `sys_role_res` VALUES ('1541', '8', '1');
INSERT INTO `sys_role_res` VALUES ('1542', '48', '1');
INSERT INTO `sys_role_res` VALUES ('1543', '49', '1');
INSERT INTO `sys_role_res` VALUES ('1544', '50', '1');
INSERT INTO `sys_role_res` VALUES ('1545', '51', '1');
INSERT INTO `sys_role_res` VALUES ('1546', '52', '1');
INSERT INTO `sys_role_res` VALUES ('1547', '59', '1');
INSERT INTO `sys_role_res` VALUES ('1548', '9', '1');
INSERT INTO `sys_role_res` VALUES ('1549', '13', '1');
INSERT INTO `sys_role_res` VALUES ('1550', '14', '1');
INSERT INTO `sys_role_res` VALUES ('1551', '56', '1');
INSERT INTO `sys_role_res` VALUES ('1552', '57', '1');
INSERT INTO `sys_role_res` VALUES ('1553', '62', '1');
INSERT INTO `sys_role_res` VALUES ('1554', '58', '1');
INSERT INTO `sys_role_res` VALUES ('1555', '61', '1');
INSERT INTO `sys_role_res` VALUES ('1556', '65', '1');
INSERT INTO `sys_role_res` VALUES ('1557', '96', '1');
INSERT INTO `sys_role_res` VALUES ('1558', '97', '1');
INSERT INTO `sys_role_res` VALUES ('1559', '93', '1');
INSERT INTO `sys_role_res` VALUES ('1560', '94', '1');
INSERT INTO `sys_role_res` VALUES ('1561', '95', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `status` varchar(2) DEFAULT '1' COMMENT '#1 正常 2.封号 ',
  `icon` varchar(255) DEFAULT 'images/guest.jpg',
  `email` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `salt2` varchar(55) DEFAULT NULL,
  `onlineStatus` varchar(2) DEFAULT NULL COMMENT '在线状态  1-在线 0-离线',
  `lastUpdAcct` varchar(20) DEFAULT NULL,
  `lastUpdTime` datetime DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('3', 'admin', '8b276c6430bc6cfec325a09dc6713167', '1', 'images/guest.jpg', '1233', '2017-05-11 15:54:56', '123', '66432cd44c4abf25202aca49a5e14436', null, 'admin', '2018-01-19 18:17:57', '用户修改个人资料');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SYSTME_USER_ROLE_USER_ID` (`user_id`) USING BTREE,
  KEY `FK_SYSTME_USER_ROLE_ROLE_ID` (`role_id`) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('21', '3', '1');

-- ----------------------------
-- Function structure for querySysRes
-- ----------------------------
DROP FUNCTION IF EXISTS `querySysRes`;
DELIMITER ;;
CREATE FUNCTION `querySysRes`(treeCode INT) RETURNS varchar(4000) CHARSET utf8
    DETERMINISTIC
BEGIN

      DECLARE sTemp VARCHAR(4000);
      DECLARE sTempChd VARCHAR(1000);
    
      SET sTemp = '$';
      
      select id  into sTempChd from sys_res t where t.id = treeCode;
    
      WHILE sTempChd is not null DO
				IF (sTempChd != treeCode) THEN
				SET sTemp = concat(sTemp,',',sTempChd);
				END IF;
        SELECT group_concat(id) INTO sTempChd FROM sys_res where FIND_IN_SET(pid,sTempChd)>0;
      END WHILE;
      RETURN sTemp;
    END
;;
DELIMITER ;
