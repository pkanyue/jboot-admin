/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jboot-b2c

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-23 12:12:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b2c_product
-- ----------------------------
DROP TABLE IF EXISTS `b2c_product`;
CREATE TABLE `b2c_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(40) DEFAULT NULL COMMENT '商品名称',
  `prodDesc` varchar(200) DEFAULT NULL COMMENT '商品详情',
  `totalNum` int(11) DEFAULT NULL COMMENT '总库存',
  `orderedNum` int(11) DEFAULT NULL COMMENT '订出量',
  `status` varchar(8) DEFAULT NULL COMMENT '状态',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastUpdAcct` varchar(20) DEFAULT NULL COMMENT '最新更新人',
  `lastUpdTime` datetime DEFAULT NULL COMMENT '最新更新时间',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of b2c_product
-- ----------------------------
INSERT INTO `b2c_product` VALUES ('1', '小米 mix2', '全面屏手机', '100', null, '1', '2018-01-23 12:07:47', 'admin', '2018-01-23 12:07:47', '新增商品');
INSERT INTO `b2c_product` VALUES ('2', 'iphone x', 'hello,未来.现 RMB 8,388 起售.立刻购买可享免息分期.免费送货与退货.', '300', null, '1', '2018-01-23 12:11:31', 'admin', '2018-01-23 12:11:31', '新增商品');
