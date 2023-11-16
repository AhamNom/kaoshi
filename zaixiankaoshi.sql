/*
Navicat MySQL Data Transfer

Source Server         : mysql8.0
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : zaixiankaoshi

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2022-03-06 15:11:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banji
-- ----------------------------
DROP TABLE IF EXISTS `banji`;
CREATE TABLE `banji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of banji
-- ----------------------------
INSERT INTO `banji` VALUES ('1', '一班');
INSERT INTO `banji` VALUES ('2', '二班');
INSERT INTO `banji` VALUES ('3', '三班');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kid` int(11) DEFAULT NULL,
  `fen` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `kname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `starttime` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `endtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `state` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('3', '1', '2', '35', '第一学期第一次试验', '李斌', '2022-03-06 13:57:22', '2022-03-06 13:57:29', '1');

-- ----------------------------
-- Table structure for examtime
-- ----------------------------
DROP TABLE IF EXISTS `examtime`;
CREATE TABLE `examtime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idx` int(11) DEFAULT NULL,
  `kid` int(11) DEFAULT NULL,
  `kname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `tname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `daan` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `xuan` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `isright` tinyint(255) DEFAULT NULL,
  `createdate` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of examtime
-- ----------------------------
INSERT INTO `examtime` VALUES ('11', '1', '1', '第一学期第一次试验', '1', '国务院日前印发《“十四五”旅游业发展规划》。《规划》明确“（）”的原则1', '35', '李斌', 'b', 'c', '0', '2022-03-06 13:57:23');
INSERT INTO `examtime` VALUES ('12', '2', '1', '第一学期第一次试验', '2', '国务院日前印发《“十四五”旅游业发展规划》。《规划》明确“（）”的原则2', '35', '李斌', 'b', 'd', '0', '2022-03-06 13:57:24');
INSERT INTO `examtime` VALUES ('13', '3', '1', '第一学期第一次试验', '5', '国务院日前印发《“十四五”旅游业发展规划》。《规划》明确“（）”的原则5', '35', '李斌', 'b', 'b', '1', '2022-03-06 13:57:26');
INSERT INTO `examtime` VALUES ('14', '4', '1', '第一学期第一次试验', '4', '国务院日前印发《“十四五”旅游业发展规划》。《规划》明确“（）”的原则4', '35', '李斌', 'b', 'a', '0', '2022-03-06 13:57:27');
INSERT INTO `examtime` VALUES ('15', '5', '1', '第一学期第一次试验', '3', '国务院日前印发《“十四五”旅游业发展规划》。《规划》明确“（）”的原则3', '35', '李斌', 'b', 'b', '1', '2022-03-06 13:57:28');

-- ----------------------------
-- Table structure for kaoshi
-- ----------------------------
DROP TABLE IF EXISTS `kaoshi`;
CREATE TABLE `kaoshi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `kid` int(11) DEFAULT NULL,
  `kname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `bname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nid` int(11) DEFAULT NULL,
  `nname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `fen` int(11) DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `state` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kaoshi
-- ----------------------------
INSERT INTO `kaoshi` VALUES ('1', '第一学期第一次试验', '1', 'PPT基础知识', '1', '一班', '1', '一年级', '5', '60', '2022.3.5 10:00:00 ~ 2022.3.5 12:00:00', '0');

-- ----------------------------
-- Table structure for kemu
-- ----------------------------
DROP TABLE IF EXISTS `kemu`;
CREATE TABLE `kemu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kemu
-- ----------------------------
INSERT INTO `kemu` VALUES ('1', 'PPT基础知识');
INSERT INTO `kemu` VALUES ('2', 'PPT进阶知识');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `href` varchar(80) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `pid` smallint(5) DEFAULT '0' COMMENT '父ID',
  `icon` varchar(50) DEFAULT NULL,
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序',
  `spread` tinyint(2) DEFAULT '0' COMMENT '默认展开 0:false   1:true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '', '后台首页', '0', '&#xe68e;', '0', '1');
INSERT INTO `menu` VALUES ('10', 'admin/index/main', '后台首页', '1', '&#xe68e;', '0', '1');
INSERT INTO `menu` VALUES ('11', 'admin/index/pwd', '修改密码', '1', '&#xe716;', '1', '0');
INSERT INTO `menu` VALUES ('3', null, '用户管理', '0', '&#xe653;', '5', '1');
INSERT INTO `menu` VALUES ('13', 'admin/user/index?rid=2', '教师管理', '3', '&#xe653;', '0', '0');
INSERT INTO `menu` VALUES ('2', null, '考试管理', '0', '&#xe653;', '2', '1');
INSERT INTO `menu` VALUES ('12', 'admin/user/index?rid=1', '管理员', '3', '&#xe653;', '0', '0');
INSERT INTO `menu` VALUES ('14', 'admin/user/index?rid=3', '学生管理', '3', '&#xe653;', '0', '0');
INSERT INTO `menu` VALUES ('15', 'admin/nianji/index', '年级管理', '4', '&#xe653;', '0', '0');
INSERT INTO `menu` VALUES ('16', 'admin/kemu/index', '科目管理', '4', '&#xe653;', '0', '0');
INSERT INTO `menu` VALUES ('20', 'admin/banji/index', '班级管理', '4', '&#xe653;', '0', '0');
INSERT INTO `menu` VALUES ('21', 'admin/kaoshi/index', '考试管理', '2', '&#xe653;', '0', '0');
INSERT INTO `menu` VALUES ('22', 'admin/test/index', '试题管理', '2', '&#xe653;', '0', '0');
INSERT INTO `menu` VALUES ('23', 'admin/exam/index', '考试成绩', '2', '&#xe653;', '0', '0');
INSERT INTO `menu` VALUES ('4', null, '基础管理', '0', '&#xe653;', '1', '1');

-- ----------------------------
-- Table structure for nianji
-- ----------------------------
DROP TABLE IF EXISTS `nianji`;
CREATE TABLE `nianji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of nianji
-- ----------------------------
INSERT INTO `nianji` VALUES ('1', '一年级');
INSERT INTO `nianji` VALUES ('2', '二年级');
INSERT INTO `nianji` VALUES ('3', '三年级');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `role` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', 0x312C322C332C342C31302C31312C31322C31332C31342C31352C31362C32302C32312C32322C3233);
INSERT INTO `role` VALUES ('2', '老师', 0x312C322C332C31302C31312C31332C31342C32312C32322C3233);
INSERT INTO `role` VALUES ('3', '学生', 0x31);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `a` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `b` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `d` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `daan` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `kid` int(11) DEFAULT NULL,
  `kname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '国务院日前印发《“十四五”旅游业发展规划》。《规划》明确“（）”的原则1', '系统观念、筑牢防线，旅游为民、旅游带动，创新驱动、优质发展，生态优先、科学利用', '以文塑旅、以旅彰文，旅游带动，创新驱动、优质发展，生态优先、科学利用', '以文塑旅、以旅彰文，系统观念、筑牢防线，旅游为民、旅游带动，创新驱动', '以文塑旅、以旅彰文，系统观念、筑牢防线，旅游为民、旅游带动，创新驱动、优质发展，生态优先、科学利用', 'b', '1', 'PPT基础知识');
INSERT INTO `test` VALUES ('2', '国务院日前印发《“十四五”旅游业发展规划》。《规划》明确“（）”的原则2', '系统观念、筑牢防线，旅游为民、旅游带动，创新驱动、优质发展，生态优先、科学利用', '以文塑旅、以旅彰文，旅游带动，创新驱动、优质发展，生态优先、科学利用', '以文塑旅、以旅彰文，系统观念、筑牢防线，旅游为民、旅游带动，创新驱动', '以文塑旅、以旅彰文，系统观念、筑牢防线，旅游为民、旅游带动，创新驱动、优质发展，生态优先、科学利用', 'b', '1', 'PPT基础知识');
INSERT INTO `test` VALUES ('3', '国务院日前印发《“十四五”旅游业发展规划》。《规划》明确“（）”的原则3', '系统观念、筑牢防线，旅游为民、旅游带动，创新驱动、优质发展，生态优先、科学利用', '以文塑旅、以旅彰文，旅游带动，创新驱动、优质发展，生态优先、科学利用', '以文塑旅、以旅彰文，系统观念、筑牢防线，旅游为民、旅游带动，创新驱动', '以文塑旅、以旅彰文，系统观念、筑牢防线，旅游为民、旅游带动，创新驱动、优质发展，生态优先、科学利用', 'b', '1', 'PPT基础知识');
INSERT INTO `test` VALUES ('4', '国务院日前印发《“十四五”旅游业发展规划》。《规划》明确“（）”的原则4', '系统观念、筑牢防线，旅游为民、旅游带动，创新驱动、优质发展，生态优先、科学利用', '以文塑旅、以旅彰文，旅游带动，创新驱动、优质发展，生态优先、科学利用', '以文塑旅、以旅彰文，系统观念、筑牢防线，旅游为民、旅游带动，创新驱动', '以文塑旅、以旅彰文，系统观念、筑牢防线，旅游为民、旅游带动，创新驱动、优质发展，生态优先、科学利用', 'b', '1', 'PPT基础知识');
INSERT INTO `test` VALUES ('5', '国务院日前印发《“十四五”旅游业发展规划》。《规划》明确“（）”的原则5', '系统观念、筑牢防线，旅游为民、旅游带动，创新驱动、优质发展，生态优先、科学利用', '以文塑旅、以旅彰文，旅游带动，创新驱动、优质发展，生态优先、科学利用', '以文塑旅、以旅彰文，系统观念、筑牢防线，旅游为民、旅游带动，创新驱动', '以文塑旅、以旅彰文，系统观念、筑牢防线，旅游为民、旅游带动，创新驱动、优质发展，生态优先、科学利用', 'b', '1', 'PPT基础知识');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '名字',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `zhiwei` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `danwei` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `rname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `bname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nid` int(11) DEFAULT NULL,
  `nname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('29', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管工', '15644564', '管理员', '学校', '1', '管理员', '2', '二班', '2', '二年级');
INSERT INTO `user` VALUES ('34', 'dxd', 'e10adc3949ba59abbe56e057f20f883e', '丁晓迪', '18765465485', '老师', '学校', '2', '老师', null, null, null, null);
INSERT INTO `user` VALUES ('35', '12001', 'e10adc3949ba59abbe56e057f20f883e', '李斌', '1467484', '学生', '学校', '3', '学生', '1', '一班', '1', '一年级');
