/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jboot-admin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-02-28 10:23:50
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
) ENGINE=InnoDB AUTO_INCREMENT=742 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-01-15 17:53:30', '1', 'guest', '2018-01-15 17:53:30', '记录日志');

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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

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
INSERT INTO `sys_res` VALUES ('98', '56', '系统数据监控', '系统数据监控', 'http://127.0.0.1:8888/metric.html', '3', '', '20', '1', '1', 'admin', '2018-02-27 17:19:19', '修改系统资源');

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
) ENGINE=InnoDB AUTO_INCREMENT=1605 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_res
-- ----------------------------
INSERT INTO `sys_role_res` VALUES ('1399', '65', '7');
INSERT INTO `sys_role_res` VALUES ('1562', '1', '1');
INSERT INTO `sys_role_res` VALUES ('1563', '2', '1');
INSERT INTO `sys_role_res` VALUES ('1564', '3', '1');
INSERT INTO `sys_role_res` VALUES ('1565', '20', '1');
INSERT INTO `sys_role_res` VALUES ('1566', '21', '1');
INSERT INTO `sys_role_res` VALUES ('1567', '22', '1');
INSERT INTO `sys_role_res` VALUES ('1568', '46', '1');
INSERT INTO `sys_role_res` VALUES ('1569', '47', '1');
INSERT INTO `sys_role_res` VALUES ('1570', '10', '1');
INSERT INTO `sys_role_res` VALUES ('1571', '26', '1');
INSERT INTO `sys_role_res` VALUES ('1572', '27', '1');
INSERT INTO `sys_role_res` VALUES ('1573', '28', '1');
INSERT INTO `sys_role_res` VALUES ('1574', '53', '1');
INSERT INTO `sys_role_res` VALUES ('1575', '4', '1');
INSERT INTO `sys_role_res` VALUES ('1576', '23', '1');
INSERT INTO `sys_role_res` VALUES ('1577', '24', '1');
INSERT INTO `sys_role_res` VALUES ('1578', '25', '1');
INSERT INTO `sys_role_res` VALUES ('1579', '54', '1');
INSERT INTO `sys_role_res` VALUES ('1580', '55', '1');
INSERT INTO `sys_role_res` VALUES ('1581', '60', '1');
INSERT INTO `sys_role_res` VALUES ('1582', '17', '1');
INSERT INTO `sys_role_res` VALUES ('1583', '8', '1');
INSERT INTO `sys_role_res` VALUES ('1584', '48', '1');
INSERT INTO `sys_role_res` VALUES ('1585', '49', '1');
INSERT INTO `sys_role_res` VALUES ('1586', '50', '1');
INSERT INTO `sys_role_res` VALUES ('1587', '51', '1');
INSERT INTO `sys_role_res` VALUES ('1588', '52', '1');
INSERT INTO `sys_role_res` VALUES ('1589', '59', '1');
INSERT INTO `sys_role_res` VALUES ('1590', '9', '1');
INSERT INTO `sys_role_res` VALUES ('1591', '13', '1');
INSERT INTO `sys_role_res` VALUES ('1592', '14', '1');
INSERT INTO `sys_role_res` VALUES ('1593', '56', '1');
INSERT INTO `sys_role_res` VALUES ('1594', '57', '1');
INSERT INTO `sys_role_res` VALUES ('1595', '62', '1');
INSERT INTO `sys_role_res` VALUES ('1596', '58', '1');
INSERT INTO `sys_role_res` VALUES ('1597', '61', '1');
INSERT INTO `sys_role_res` VALUES ('1598', '98', '1');
INSERT INTO `sys_role_res` VALUES ('1599', '65', '1');
INSERT INTO `sys_role_res` VALUES ('1600', '96', '1');
INSERT INTO `sys_role_res` VALUES ('1601', '97', '1');
INSERT INTO `sys_role_res` VALUES ('1602', '93', '1');
INSERT INTO `sys_role_res` VALUES ('1603', '94', '1');
INSERT INTO `sys_role_res` VALUES ('1604', '95', '1');

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
