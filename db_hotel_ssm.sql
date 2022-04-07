/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_hotel_ssm

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-01-20 16:18:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `realName` varchar(32) DEFAULT NULL,
  `idCard` varchar(32) CHARACTER SET utf32 DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '猿来入此', '123456', '猿来入此', '62225225666552', '13656565656', '上海 浦东', '0');
INSERT INTO `account` VALUES ('2', '张三', '123', '张三五', '4622987745565656', '13912233333', '北京 三里屯 酒吧', '0');
INSERT INTO `account` VALUES ('3', '李四', '123', '李四', '6565656565656', '13999999999', '南京', '0');
INSERT INTO `account` VALUES ('4', '王麻子', '123', '大刀王五', '110110120121110110', '13656565656', '北京 朝阳区 群众', '-1');
INSERT INTO `account` VALUES ('5', '小明', '123456', '张小明', '31012002522555', '13545455454', '江苏 南京', '0');

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `authority_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('148', '2', '35');
INSERT INTO `authority` VALUES ('149', '2', '36');
INSERT INTO `authority` VALUES ('150', '2', '25');
INSERT INTO `authority` VALUES ('151', '2', '1');
INSERT INTO `authority` VALUES ('152', '2', '14');
INSERT INTO `authority` VALUES ('153', '2', '15');
INSERT INTO `authority` VALUES ('383', '1', '1');
INSERT INTO `authority` VALUES ('384', '1', '5');
INSERT INTO `authority` VALUES ('385', '1', '17');
INSERT INTO `authority` VALUES ('386', '1', '18');
INSERT INTO `authority` VALUES ('387', '1', '19');
INSERT INTO `authority` VALUES ('388', '1', '20');
INSERT INTO `authority` VALUES ('389', '1', '13');
INSERT INTO `authority` VALUES ('390', '1', '21');
INSERT INTO `authority` VALUES ('391', '1', '22');
INSERT INTO `authority` VALUES ('392', '1', '23');
INSERT INTO `authority` VALUES ('393', '1', '35');
INSERT INTO `authority` VALUES ('394', '1', '36');
INSERT INTO `authority` VALUES ('395', '1', '14');
INSERT INTO `authority` VALUES ('396', '1', '15');
INSERT INTO `authority` VALUES ('397', '1', '24');
INSERT INTO `authority` VALUES ('398', '1', '25');
INSERT INTO `authority` VALUES ('399', '1', '26');
INSERT INTO `authority` VALUES ('400', '1', '31');
INSERT INTO `authority` VALUES ('401', '1', '32');
INSERT INTO `authority` VALUES ('402', '1', '33');
INSERT INTO `authority` VALUES ('403', '1', '34');
INSERT INTO `authority` VALUES ('404', '1', '37');
INSERT INTO `authority` VALUES ('405', '1', '38');
INSERT INTO `authority` VALUES ('406', '1', '39');
INSERT INTO `authority` VALUES ('407', '1', '40');
INSERT INTO `authority` VALUES ('408', '1', '41');
INSERT INTO `authority` VALUES ('409', '1', '42');
INSERT INTO `authority` VALUES ('410', '1', '43');
INSERT INTO `authority` VALUES ('411', '1', '44');
INSERT INTO `authority` VALUES ('412', '1', '45');
INSERT INTO `authority` VALUES ('413', '1', '46');
INSERT INTO `authority` VALUES ('414', '1', '47');
INSERT INTO `authority` VALUES ('415', '1', '48');
INSERT INTO `authority` VALUES ('416', '1', '49');
INSERT INTO `authority` VALUES ('417', '1', '50');
INSERT INTO `authority` VALUES ('418', '1', '51');
INSERT INTO `authority` VALUES ('419', '1', '52');
INSERT INTO `authority` VALUES ('420', '1', '53');
INSERT INTO `authority` VALUES ('421', '1', '54');
INSERT INTO `authority` VALUES ('422', '1', '55');
INSERT INTO `authority` VALUES ('423', '1', '56');
INSERT INTO `authority` VALUES ('424', '1', '57');
INSERT INTO `authority` VALUES ('425', '1', '58');
INSERT INTO `authority` VALUES ('426', '1', '59');
INSERT INTO `authority` VALUES ('427', '1', '60');
INSERT INTO `authority` VALUES ('428', '1', '61');
INSERT INTO `authority` VALUES ('429', '1', '62');
INSERT INTO `authority` VALUES ('430', '1', '63');
INSERT INTO `authority` VALUES ('431', '1', '64');
INSERT INTO `authority` VALUES ('432', '1', '65');
INSERT INTO `authority` VALUES ('433', '1', '66');
INSERT INTO `authority` VALUES ('434', '1', '67');
INSERT INTO `authority` VALUES ('435', '1', '68');
INSERT INTO `authority` VALUES ('436', '1', '69');

-- ----------------------------
-- Table structure for `book_order`
-- ----------------------------
DROP TABLE IF EXISTS `book_order`;
CREATE TABLE `book_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL,
  `roomTypeId` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `idCard` varchar(32) CHARACTER SET utf32 DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `arriveDate` varchar(32) DEFAULT NULL,
  `leaveDate` varchar(32) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`),
  KEY `roomTypeId` (`roomTypeId`),
  CONSTRAINT `book_order_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`),
  CONSTRAINT `book_order_ibfk_2` FOREIGN KEY (`roomTypeId`) REFERENCES `room_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_order
-- ----------------------------
INSERT INTO `book_order` VALUES ('10', '1', '1', '猿来入此', '62225225666552', '13656565656', '2', '2019-01-18', '2019-01-19', 'da', '2019-01-18 23:56:58');
INSERT INTO `book_order` VALUES ('11', '2', '2', '张三五', '622987745565656', '13918655256', '2', '2019-01-18', '2019-01-19', '', '2019-01-18 23:57:11');
INSERT INTO `book_order` VALUES ('13', '3', '1', '李四', '6565656565656', '13999999999', '0', '2019-01-19', '2019-01-20', '预计晚上八点到。', '2019-01-19 13:27:35');
INSERT INTO `book_order` VALUES ('14', '5', '2', '小明', '31012002522555', '13545455454', '2', '2019-01-19', '2019-01-20', '帮我留一个有窗户的靠南的！谢谢！', '2019-01-19 23:02:16');
INSERT INTO `book_order` VALUES ('15', '5', '6', '小明', '31012002522555', '13545455454', '1', '2019-01-21', '2019-01-22', '我会尽快赶来！', '2019-01-19 23:02:45');
INSERT INTO `book_order` VALUES ('16', '5', '10', '小明', '31012002522555', '13545455454', '0', '2019-01-21', '2019-01-23', '奢侈一把！', '2019-01-19 23:03:25');

-- ----------------------------
-- Table structure for `c3p0testtable`
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c3p0testtable
-- ----------------------------

-- ----------------------------
-- Table structure for `checkin`
-- ----------------------------
DROP TABLE IF EXISTS `checkin`;
CREATE TABLE `checkin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomId` int(11) NOT NULL,
  `roomTypeId` int(11) NOT NULL,
  `checkinPrice` float(8,2) NOT NULL,
  `name` varchar(32) NOT NULL,
  `idCard` varchar(32) CHARACTER SET utf32 DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `arriveDate` varchar(32) DEFAULT NULL,
  `leaveDate` varchar(32) NOT NULL,
  `bookOrderId` int(11) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`roomId`),
  KEY `roomTypeId` (`roomTypeId`),
  CONSTRAINT `checkin_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`),
  CONSTRAINT `checkin_ibfk_2` FOREIGN KEY (`roomTypeId`) REFERENCES `room_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkin
-- ----------------------------
INSERT INTO `checkin` VALUES ('9', '2', '1', '123.00', 'wq', 'ewq', 'ewq', '1', '2019-01-18', '2019-01-19', null, '', '2019-01-18 23:57:55');
INSERT INTO `checkin` VALUES ('10', '4', '3', '298.00', '张三五', '622987745565656', '13918655256', '1', '2019-01-18', '2019-01-19', '11', '', '2019-01-19 00:00:08');
INSERT INTO `checkin` VALUES ('11', '2', '1', '198.00', '猿来入此', '62225225666552', '13656565656', '1', '2019-01-18', '2019-01-19', '10', '猿来入此', '2019-01-19 00:32:15');
INSERT INTO `checkin` VALUES ('12', '3', '2', '299.00', '小明', '31012002522555', '13545455454', '1', '2019-01-19', '2019-01-20', '14', '帮我留一个有窗户的靠南的！谢谢！', '2019-01-19 23:05:23');
INSERT INTO `checkin` VALUES ('13', '6', '6', '200.00', '小明', '31012002522555', '13545455454', '0', '2019-01-21', '2019-01-22', '15', '我会尽快赶来！', '2019-01-19 23:08:57');
INSERT INTO `checkin` VALUES ('14', '3', '2', '189.00', '马冬梅', '65656465656565656', '13848484878', '1', '2019-01-20', '2019-01-22', null, '马冬梅', '2019-01-20 15:33:14');
INSERT INTO `checkin` VALUES ('15', '4', '3', '659.00', '张小帅', '62225225666552', '13656565656', '1', '2019-01-16', '2019-01-18', null, '测试数据', '2019-01-20 15:34:49');
INSERT INTO `checkin` VALUES ('16', '2', '1', '168.00', '猿来入此', '62225225666552', '13656565656', '0', '2019-01-20', '2019-01-22', null, '猿来入此站长', '2019-01-20 15:36:26');
INSERT INTO `checkin` VALUES ('17', '3', '2', '189.00', '马冬', '65656465656565656', '13848484878', '1', '2019-01-20', '2019-01-22', null, '马冬梅', '2019-01-20 15:33:14');
INSERT INTO `checkin` VALUES ('18', '3', '2', '189.00', '马冬', '65656465656565656', '13848484878', '1', '2019-01-20', '2019-01-22', null, '马冬梅', '2018-11-20 15:33:14');
INSERT INTO `checkin` VALUES ('19', '3', '2', '189.00', '马冬', '65656465656565656', '13848484878', '1', '2019-01-20', '2019-01-22', null, '马冬梅', '2018-12-22 15:33:14');
INSERT INTO `checkin` VALUES ('20', '3', '2', '189.00', '马军', '65656465656565656', '13848484878', '1', '2019-01-20', '2019-01-22', null, '马冬梅', '2018-10-22 15:33:14');
INSERT INTO `checkin` VALUES ('21', '3', '2', '189.00', '马军', '65656465656565656', '13848484878', '1', '2019-01-20', '2019-01-22', null, '马冬梅', '2019-01-12 15:33:14');
INSERT INTO `checkin` VALUES ('22', '3', '2', '189.00', '马军', '65656465656565656', '13848484878', '1', '2019-01-20', '2019-01-22', null, '马冬梅', '2018-11-12 15:33:14');
INSERT INTO `checkin` VALUES ('23', '3', '2', '589.00', '马军', '65656465656565656', '13848484878', '1', '2019-01-20', '2019-01-22', null, '马冬梅', '2018-11-17 15:33:14');

-- ----------------------------
-- Table structure for `floor`
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of floor
-- ----------------------------
INSERT INTO `floor` VALUES ('1', '1楼', '一楼');
INSERT INTO `floor` VALUES ('2', '2楼', '2楼的逃生通道有点阻塞。');
INSERT INTO `floor` VALUES ('3', '3楼', '3楼');
INSERT INTO `floor` VALUES ('4', '4楼', '4楼监控坏了。');
INSERT INTO `floor` VALUES ('5', '5楼', '');
INSERT INTO `floor` VALUES ('6', '6楼', '六楼正常');
INSERT INTO `floor` VALUES ('7', '7楼', '正常');
INSERT INTO `floor` VALUES ('11', '8楼', '正常');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('13', '用户名为admin的用户登录时输入验证码错误!', '2018-12-16 18:17:30');
INSERT INTO `log` VALUES ('14', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:22:56');
INSERT INTO `log` VALUES ('15', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:37:15');
INSERT INTO `log` VALUES ('16', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:40:21');
INSERT INTO `log` VALUES ('17', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 19:11:49');
INSERT INTO `log` VALUES ('18', '用户名为{admin}，的用户成功修改密码!', '2018-12-16 19:13:32');
INSERT INTO `log` VALUES ('19', '用户名为{admin}，的用户成功修改密码!', '2018-12-16 19:14:01');
INSERT INTO `log` VALUES ('20', '用户名为{猿来入此}，角色为{普通用户}的用户登录成功!', '2018-12-16 19:17:46');
INSERT INTO `log` VALUES ('21', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-12 18:07:05');
INSERT INTO `log` VALUES ('22', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-12 18:19:53');
INSERT INTO `log` VALUES ('23', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-12 21:45:10');
INSERT INTO `log` VALUES ('24', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-12 22:19:12');
INSERT INTO `log` VALUES ('25', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-12 22:30:20');
INSERT INTO `log` VALUES ('26', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-14 21:07:53');
INSERT INTO `log` VALUES ('27', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-14 21:21:15');
INSERT INTO `log` VALUES ('28', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-14 21:30:28');
INSERT INTO `log` VALUES ('29', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-14 21:32:13');
INSERT INTO `log` VALUES ('30', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-14 22:11:28');
INSERT INTO `log` VALUES ('31', '用户名为admin的用户登录时输入验证码错误!', '2019-01-14 22:14:42');
INSERT INTO `log` VALUES ('32', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-14 22:14:50');
INSERT INTO `log` VALUES ('33', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-14 22:20:34');
INSERT INTO `log` VALUES ('34', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-14 22:22:03');
INSERT INTO `log` VALUES ('35', '用户名为admin的用户登录时输入验证码错误!', '2019-01-15 20:51:43');
INSERT INTO `log` VALUES ('36', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-15 20:51:54');
INSERT INTO `log` VALUES ('37', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-15 20:54:30');
INSERT INTO `log` VALUES ('38', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-15 21:53:56');
INSERT INTO `log` VALUES ('39', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-16 20:19:39');
INSERT INTO `log` VALUES ('40', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-16 21:05:03');
INSERT INTO `log` VALUES ('41', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-16 22:07:35');
INSERT INTO `log` VALUES ('42', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-16 22:09:11');
INSERT INTO `log` VALUES ('43', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-16 22:14:28');
INSERT INTO `log` VALUES ('44', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-17 19:55:20');
INSERT INTO `log` VALUES ('45', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-17 20:31:20');
INSERT INTO `log` VALUES ('46', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-17 20:54:32');
INSERT INTO `log` VALUES ('47', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-17 21:06:01');
INSERT INTO `log` VALUES ('48', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-18 21:48:24');
INSERT INTO `log` VALUES ('49', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-18 22:05:43');
INSERT INTO `log` VALUES ('50', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-18 22:20:15');
INSERT INTO `log` VALUES ('51', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-18 23:16:37');
INSERT INTO `log` VALUES ('52', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-18 23:47:39');
INSERT INTO `log` VALUES ('53', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-18 23:56:21');
INSERT INTO `log` VALUES ('54', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-19 00:14:47');
INSERT INTO `log` VALUES ('55', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-19 00:29:40');
INSERT INTO `log` VALUES ('56', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-19 00:39:55');
INSERT INTO `log` VALUES ('57', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-19 01:11:08');
INSERT INTO `log` VALUES ('58', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-19 01:13:07');
INSERT INTO `log` VALUES ('59', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-19 09:53:40');
INSERT INTO `log` VALUES ('60', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-19 09:59:28');
INSERT INTO `log` VALUES ('61', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-19 10:32:24');
INSERT INTO `log` VALUES ('62', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-19 13:23:41');
INSERT INTO `log` VALUES ('63', '用户名为admin的用户登录时输入验证码错误!', '2019-01-19 22:13:41');
INSERT INTO `log` VALUES ('64', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-19 22:13:49');
INSERT INTO `log` VALUES ('65', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-19 22:41:07');
INSERT INTO `log` VALUES ('66', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-19 22:48:05');
INSERT INTO `log` VALUES ('67', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-20 14:00:36');
INSERT INTO `log` VALUES ('68', '用户名为admin的用户登录时输入验证码错误!', '2019-01-20 15:15:19');
INSERT INTO `log` VALUES ('69', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-20 15:15:26');
INSERT INTO `log` VALUES ('70', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-20 15:22:25');
INSERT INTO `log` VALUES ('71', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-20 15:25:25');
INSERT INTO `log` VALUES ('72', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-20 15:50:06');
INSERT INTO `log` VALUES ('73', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-20 16:06:22');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(32) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '系统设置', '', 'icon-advancedsettings');
INSERT INTO `menu` VALUES ('5', '1', '菜单管理', '../admin/menu/list', 'icon-chart-organisation');
INSERT INTO `menu` VALUES ('13', '1', '角色管理', '../admin/role/list', 'icon-group-key');
INSERT INTO `menu` VALUES ('14', '0', '用户管理', '', 'icon-group-gear');
INSERT INTO `menu` VALUES ('15', '14', '用户列表', '../admin/user/list', 'icon-group');
INSERT INTO `menu` VALUES ('17', '5', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('18', '5', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('19', '5', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('20', '5', '添加按钮', 'openAddMenu()', 'icon-add');
INSERT INTO `menu` VALUES ('21', '13', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('22', '13', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('23', '13', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('24', '15', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('25', '15', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('26', '15', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('31', '0', '系统日志', '', 'icon-table-cell');
INSERT INTO `menu` VALUES ('32', '31', '日志列表', '../admin/log/list', 'icon-page-white-text');
INSERT INTO `menu` VALUES ('33', '32', '添加日志', 'openAdd()', 'icon-add1');
INSERT INTO `menu` VALUES ('34', '32', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('35', '1', '修改密码', 'edit_password', 'icon-lock-edit');
INSERT INTO `menu` VALUES ('36', '35', '修改密码', 'openAdd()', 'icon-lock-edit');
INSERT INTO `menu` VALUES ('37', '0', '楼层管理', '', 'icon-house');
INSERT INTO `menu` VALUES ('38', '37', '楼层列表', '../admin/floor/list', 'icon-house-connect');
INSERT INTO `menu` VALUES ('39', '38', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('40', '38', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('41', '38', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('42', '0', '房型管理', '', 'icon-house-star');
INSERT INTO `menu` VALUES ('43', '42', '房型列表', '../admin/room_type/list', 'icon-house-key');
INSERT INTO `menu` VALUES ('44', '43', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('45', '43', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('46', '43', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('47', '0', '房间管理', '', 'icon-house-go');
INSERT INTO `menu` VALUES ('48', '47', '房间列表', '../admin/room/list', 'icon-house-key');
INSERT INTO `menu` VALUES ('49', '48', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('50', '48', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('51', '48', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('52', '0', '客户管理', '', 'icon-users');
INSERT INTO `menu` VALUES ('53', '52', '客户列表', '../admin/account/list', 'icon-user-business-boss');
INSERT INTO `menu` VALUES ('54', '53', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('55', '53', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('56', '53', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('57', '0', '预定管理', '', 'icon-time-green');
INSERT INTO `menu` VALUES ('58', '57', '预定列表', '../admin/book_order/list', 'icon-clock');
INSERT INTO `menu` VALUES ('59', '58', '新增预定', 'openAdd()', 'icon-clock-add');
INSERT INTO `menu` VALUES ('60', '58', '编辑预定', 'openEdit()', 'icon-clock-edit');
INSERT INTO `menu` VALUES ('61', '0', '入住管理', '', 'icon-heart-connect');
INSERT INTO `menu` VALUES ('62', '61', '入住列表', '../admin/checkin/list', 'icon-heart');
INSERT INTO `menu` VALUES ('63', '62', '登记入住', 'openAdd()', 'icon-heart-add');
INSERT INTO `menu` VALUES ('64', '62', '编辑入住', 'openEdit()', 'icon-heart-connect');
INSERT INTO `menu` VALUES ('65', '62', '登记退房', 'openCheckOut()', 'icon-heart-delete');
INSERT INTO `menu` VALUES ('66', '0', '营业统计', '', 'icon-money-yen');
INSERT INTO `menu` VALUES ('67', '66', '统计图表', '../admin/stats/stats', 'icon-chart-curve');
INSERT INTO `menu` VALUES ('68', '67', '按月统计', 'statsByMonth()', 'icon-chart-curve-add');
INSERT INTO `menu` VALUES ('69', '67', '按日统计', 'statsByDay()', 'icon-chart-curve-edit');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '超级管理员拥有一切权限！');
INSERT INTO `role` VALUES ('2', '普通用户', '普通用户，请自由授权！');

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(128) DEFAULT NULL,
  `sn` varchar(32) NOT NULL,
  `roomTypeId` int(11) NOT NULL,
  `floorId` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roomTypeId` (`roomTypeId`),
  KEY `floorId` (`floorId`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`roomTypeId`) REFERENCES `room_type` (`id`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`floorId`) REFERENCES `floor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('2', '/HotelSSM/resources/upload/1547560664869.jpg', '1001', '1', '1', '1', '1001单人间、1楼。');
INSERT INTO `room` VALUES ('3', '/HotelSSM/resources/upload/1547560745508.jpg', '2001', '2', '2', '2', '2楼普通大床房');
INSERT INTO `room` VALUES ('4', '/HotelSSM/resources/upload/1547560846621.jpg', '3001', '3', '3', '2', '3001豪华大床房');
INSERT INTO `room` VALUES ('5', '/HotelSSM/resources/upload/1547824761959.jpg', '4001', '4', '4', '0', '商务大床房');
INSERT INTO `room` VALUES ('6', '/HotelSSM/resources/upload/1547910499411.jpg', '5001', '6', '5', '1', '豪华标准房');

-- ----------------------------
-- Table structure for `room_type`
-- ----------------------------
DROP TABLE IF EXISTS `room_type`;
CREATE TABLE `room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `price` float(8,2) NOT NULL,
  `liveNum` int(2) NOT NULL,
  `bedNum` int(2) NOT NULL,
  `roomNum` int(5) NOT NULL,
  `avilableNum` int(5) NOT NULL,
  `bookNum` int(5) NOT NULL DEFAULT '0',
  `livedNum` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_type
-- ----------------------------
INSERT INTO `room_type` VALUES ('1', '单人间', '/HotelSSM/resources/upload/1547863202049.jpg', '168.00', '1', '1', '12', '10', '1', '1', '1', '单人间只能入住一个人，大概15平米左右！');
INSERT INTO `room_type` VALUES ('2', '普通大床房', '/HotelSSM/resources/upload/1547863299550.jpg', '299.00', '2', '1', '15', '15', '0', '0', '0', '普通大床房，面积25平左右！');
INSERT INTO `room_type` VALUES ('3', '豪华大床房', '/HotelSSM/resources/upload/1547863308339.jpg', '399.00', '2', '1', '8', '8', '0', '0', '1', '豪华大床房，面积30平左右！');
INSERT INTO `room_type` VALUES ('4', '商务大床房', '/HotelSSM/resources/upload/1547865202071.jpg', '429.00', '2', '1', '10', '10', '0', '0', '1', '商务大床房，面积40平左右！');
INSERT INTO `room_type` VALUES ('5', '普通标准间', '/HotelSSM/resources/upload/1547863370413.jpg', '199.00', '2', '2', '11', '11', '0', '0', '1', '普通标准房，面积20平左右！');
INSERT INTO `room_type` VALUES ('6', '豪华标准房', '/HotelSSM/resources/upload/1547863398297.jpg', '199.00', '2', '2', '10', '9', '1', '1', '1', '豪华标准房，面积30平左右！');
INSERT INTO `room_type` VALUES ('7', '商务标准间', '/HotelSSM/resources/upload/1547863458969.jpg', '299.00', '2', '2', '10', '10', '0', '0', '1', '商务标准间，面积35平左右！');
INSERT INTO `room_type` VALUES ('8', '普通套房', '/HotelSSM/resources/upload/1547863486075.jpg', '699.00', '2', '2', '6', '6', '0', '0', '1', '普通套房，面积50平左右！');
INSERT INTO `room_type` VALUES ('9', '豪华套房', '/HotelSSM/resources/upload/1547863508790.jpg', '899.00', '2', '2', '5', '5', '0', '0', '1', '豪华套房，面积70平左右！');
INSERT INTO `room_type` VALUES ('10', '总统套房', '/HotelSSM/resources/upload/1547863538884.jpg', '1299.00', '2', '2', '3', '2', '1', '0', '1', '总统套房，面积100平，超豪华！');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `roleId` int(11) NOT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `sex` int(1) NOT NULL DEFAULT '0',
  `age` int(3) NOT NULL DEFAULT '0',
  `address` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '1', '/HotelSSM/resources/upload/1547287973818.png', '1', '1', '上海市浦东新区浦东南路1835号');
INSERT INTO `user` VALUES ('13', '猿来入此', '123456', '2', '/HotelSSM/resources/upload/1547288014056.jpg', '1', '1', '猿来入此');
