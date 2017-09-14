/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : bootdo

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-09-14 13:10:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `b_comments`
-- ----------------------------
DROP TABLE IF EXISTS `b_comments`;
CREATE TABLE `b_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created` varchar(100) DEFAULT NULL COMMENT '创建者',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `author_id` int(11) DEFAULT '0' COMMENT '作者编号',
  `owner_id` int(11) DEFAULT '0' COMMENT '归属人编号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `url` varchar(100) DEFAULT NULL COMMENT '链接地址',
  `ip` varchar(100) DEFAULT NULL COMMENT 'ip地址',
  `agent` varchar(100) DEFAULT NULL COMMENT '代理人',
  `content` text COMMENT '内容',
  `type` varchar(16) DEFAULT NULL COMMENT '类型',
  `status` varchar(16) DEFAULT NULL COMMENT '状态',
  `parent` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `b_content`
-- ----------------------------
DROP TABLE IF EXISTS `b_content`;
CREATE TABLE `b_content` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `slug` varchar(255) DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `modified` bigint(20) DEFAULT NULL COMMENT '最近修改人id',
  `content` text COMMENT '内容',
  `type` varchar(16) DEFAULT NULL COMMENT '类型',
  `tags` varchar(200) DEFAULT NULL COMMENT '标签',
  `categories` varchar(200) DEFAULT NULL COMMENT '分类',
  `hits` int(5) DEFAULT NULL,
  `comments_num` int(5) DEFAULT '0' COMMENT '评论数量',
  `allow_comment` int(1) DEFAULT '0' COMMENT '开启评论',
  `allow_ping` int(1) DEFAULT '0' COMMENT '允许ping',
  `allow_feed` int(1) DEFAULT '0' COMMENT '允许反馈',
  `status` int(1) DEFAULT NULL COMMENT '状态',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='文章内容';

-- ----------------------------
-- Records of b_content
-- ----------------------------
INSERT INTO `b_content` VALUES ('61', '标题', null, null, null, '', '', null, null, null, null, '1', '1', '1', '1', '');
INSERT INTO `b_content` VALUES ('62', '行宫', null, null, null, '', '', null, null, null, null, '1', '1', '0', '1', '元稹');
INSERT INTO `b_content` VALUES ('63', '登鹳雀楼', null, null, null, '', '', null, null, null, null, '1', '1', '0', '1', '王之涣');
INSERT INTO `b_content` VALUES ('67', 'hhh', null, null, null, '<p>3333</p>', '', null, null, null, null, '1', '1', '0', '1', '');
INSERT INTO `b_content` VALUES ('69', '标题11', null, null, null, '<p><br></p>', '', null, null, null, null, '1', '1', '0', '1', '');
INSERT INTO `b_content` VALUES ('70', '标题22', null, null, null, '<p><br></p>', '', null, null, null, null, '1', '1', '0', '1', '');
INSERT INTO `b_content` VALUES ('71', 'aaa', null, null, null, '<p><br></p>', '', null, null, null, null, '1', '1', '0', '1', '');
INSERT INTO `b_content` VALUES ('72', 'ccc', null, null, null, '<p><br></p>', '', null, null, null, null, '1', '1', '0', '1', '');
INSERT INTO `b_content` VALUES ('74', 'xxx000', null, null, null, '<p><br></p>', '', null, null, null, null, '1', '1', '0', '1', '');
INSERT INTO `b_content` VALUES ('75', '静夜思', null, null, null, '<p><span style=\"background-color: rgb(255, 0, 0);\">窗前明月光，</span></p><p>疑是地上霜。</p>', '', null, null, null, null, '0', '0', '0', '1', '李白');
INSERT INTO `b_content` VALUES ('98', 'dd', null, null, null, '<p><br></p>', '', null, null, null, null, '1', null, '0', null, 'dd');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('119', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-05 17:42:38');
INSERT INTO `sys_log` VALUES ('120', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-05 18:01:10');
INSERT INTO `sys_log` VALUES ('121', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-05 18:16:09');
INSERT INTO `sys_log` VALUES ('122', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-05 18:22:29');
INSERT INTO `sys_log` VALUES ('123', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-05 18:26:27');
INSERT INTO `sys_log` VALUES ('124', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-05 18:34:30');
INSERT INTO `sys_log` VALUES ('125', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-05 18:36:18');
INSERT INTO `sys_log` VALUES ('126', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-05 18:36:47');
INSERT INTO `sys_log` VALUES ('127', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-05 21:52:22');
INSERT INTO `sys_log` VALUES ('128', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-05 21:55:10');
INSERT INTO `sys_log` VALUES ('129', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 08:31:17');
INSERT INTO `sys_log` VALUES ('130', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 08:39:28');
INSERT INTO `sys_log` VALUES ('131', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 08:43:04');
INSERT INTO `sys_log` VALUES ('132', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 09:24:15');
INSERT INTO `sys_log` VALUES ('133', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 09:26:07');
INSERT INTO `sys_log` VALUES ('134', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 09:27:15');
INSERT INTO `sys_log` VALUES ('135', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 09:30:50');
INSERT INTO `sys_log` VALUES ('136', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 10:47:27');
INSERT INTO `sys_log` VALUES ('137', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 10:51:13');
INSERT INTO `sys_log` VALUES ('138', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 10:57:31');
INSERT INTO `sys_log` VALUES ('139', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 11:42:32');
INSERT INTO `sys_log` VALUES ('140', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 11:51:43');
INSERT INTO `sys_log` VALUES ('141', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 12:50:52');
INSERT INTO `sys_log` VALUES ('142', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 12:53:08');
INSERT INTO `sys_log` VALUES ('143', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 13:01:48');
INSERT INTO `sys_log` VALUES ('144', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 13:04:43');
INSERT INTO `sys_log` VALUES ('145', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 13:29:14');
INSERT INTO `sys_log` VALUES ('146', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 13:30:11');
INSERT INTO `sys_log` VALUES ('147', '1', 'admin', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 13:31:12');
INSERT INTO `sys_log` VALUES ('148', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 13:32:34');
INSERT INTO `sys_log` VALUES ('149', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 13:34:49');
INSERT INTO `sys_log` VALUES ('150', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 13:37:18');
INSERT INTO `sys_log` VALUES ('151', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 13:39:59');
INSERT INTO `sys_log` VALUES ('152', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 13:50:47');
INSERT INTO `sys_log` VALUES ('153', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 14:02:23');
INSERT INTO `sys_log` VALUES ('154', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 14:03:38');
INSERT INTO `sys_log` VALUES ('155', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 14:18:23');
INSERT INTO `sys_log` VALUES ('156', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 14:20:54');
INSERT INTO `sys_log` VALUES ('157', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 14:23:02');
INSERT INTO `sys_log` VALUES ('158', '1', 'admin', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 14:25:39');
INSERT INTO `sys_log` VALUES ('159', '1', 'admin', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 14:49:41');
INSERT INTO `sys_log` VALUES ('160', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 14:50:43');
INSERT INTO `sys_log` VALUES ('161', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 15:09:44');
INSERT INTO `sys_log` VALUES ('162', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 15:48:40');
INSERT INTO `sys_log` VALUES ('163', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 16:03:26');
INSERT INTO `sys_log` VALUES ('164', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 16:05:45');
INSERT INTO `sys_log` VALUES ('165', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 16:07:47');
INSERT INTO `sys_log` VALUES ('166', '1', 'admin', '登录', '22', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 16:10:39');
INSERT INTO `sys_log` VALUES ('167', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 16:25:44');
INSERT INTO `sys_log` VALUES ('168', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 16:41:19');
INSERT INTO `sys_log` VALUES ('169', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 16:44:54');
INSERT INTO `sys_log` VALUES ('170', '1', 'admin', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 16:46:50');
INSERT INTO `sys_log` VALUES ('171', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 16:48:48');
INSERT INTO `sys_log` VALUES ('172', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 17:12:25');
INSERT INTO `sys_log` VALUES ('173', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 17:16:46');
INSERT INTO `sys_log` VALUES ('174', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 17:19:18');
INSERT INTO `sys_log` VALUES ('175', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 17:31:42');
INSERT INTO `sys_log` VALUES ('176', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 17:34:15');
INSERT INTO `sys_log` VALUES ('177', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 17:40:58');
INSERT INTO `sys_log` VALUES ('178', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 17:44:48');
INSERT INTO `sys_log` VALUES ('179', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 18:05:41');
INSERT INTO `sys_log` VALUES ('180', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 18:17:40');
INSERT INTO `sys_log` VALUES ('181', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 18:25:05');
INSERT INTO `sys_log` VALUES ('182', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 18:27:24');
INSERT INTO `sys_log` VALUES ('183', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 18:29:42');
INSERT INTO `sys_log` VALUES ('184', '-1', '获取用户信息为空', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 18:41:15');
INSERT INTO `sys_log` VALUES ('185', '-1', '获取用户信息为空', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 18:41:17');
INSERT INTO `sys_log` VALUES ('186', '-1', '获取用户信息为空', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 18:41:26');
INSERT INTO `sys_log` VALUES ('187', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 18:46:40');
INSERT INTO `sys_log` VALUES ('188', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 18:48:35');
INSERT INTO `sys_log` VALUES ('189', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 19:03:16');
INSERT INTO `sys_log` VALUES ('190', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-06 19:08:56');
INSERT INTO `sys_log` VALUES ('191', '1', 'admin', '登录', '39', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-07 08:49:03');
INSERT INTO `sys_log` VALUES ('192', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-07 09:21:34');
INSERT INTO `sys_log` VALUES ('194', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-07 10:10:45');
INSERT INTO `sys_log` VALUES ('195', '1', 'admin', '删除用户', '127', 'com.bootdo.system.controller.UserController.remove()', '87', '127.0.0.1', '2017-09-07 10:11:28');
INSERT INTO `sys_log` VALUES ('196', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-07 11:12:36');
INSERT INTO `sys_log` VALUES ('197', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-07 11:17:06');
INSERT INTO `sys_log` VALUES ('204', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-07 13:35:03');
INSERT INTO `sys_log` VALUES ('205', '1', 'admin', '删除用户', '146', 'com.bootdo.system.controller.UserController.remove()', '84', '127.0.0.1', '2017-09-07 13:49:59');
INSERT INTO `sys_log` VALUES ('206', '1', 'admin', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-07 14:00:38');
INSERT INTO `sys_log` VALUES ('207', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-07 14:02:02');
INSERT INTO `sys_log` VALUES ('208', '-1', '获取用户信息为空', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"‘or 1 = 1 –\"', '127.0.0.1', '2017-09-07 14:35:46');
INSERT INTO `sys_log` VALUES ('209', '-1', '获取用户信息为空', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"‘or 1 = 1 –\"', '127.0.0.1', '2017-09-07 14:35:53');
INSERT INTO `sys_log` VALUES ('210', '-1', '获取用户信息为空', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"‘or 1 = 1 –\"', '127.0.0.1', '2017-09-07 14:35:57');
INSERT INTO `sys_log` VALUES ('211', '-1', '获取用户信息为空', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"\'or 1 = 1 –\"', '127.0.0.1', '2017-09-07 14:36:48');
INSERT INTO `sys_log` VALUES ('212', '-1', '获取用户信息为空', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"\'or 1 = 1 –\"', '127.0.0.1', '2017-09-07 14:36:49');
INSERT INTO `sys_log` VALUES ('213', '-1', '获取用户信息为空', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\" \'or 1 = 1 –\"', '127.0.0.1', '2017-09-07 14:36:55');
INSERT INTO `sys_log` VALUES ('216', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-07 14:41:30');
INSERT INTO `sys_log` VALUES ('217', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-07 15:24:43');
INSERT INTO `sys_log` VALUES ('218', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-07 16:39:51');
INSERT INTO `sys_log` VALUES ('219', '-1', '获取用户信息为空', '登录', '13', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-07 17:58:10');
INSERT INTO `sys_log` VALUES ('220', '1', 'admin', '登录', '39', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 09:49:37');
INSERT INTO `sys_log` VALUES ('221', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 10:48:41');
INSERT INTO `sys_log` VALUES ('222', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 11:18:38');
INSERT INTO `sys_log` VALUES ('223', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 11:47:23');
INSERT INTO `sys_log` VALUES ('224', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 12:58:21');
INSERT INTO `sys_log` VALUES ('225', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 13:13:25');
INSERT INTO `sys_log` VALUES ('226', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 13:36:07');
INSERT INTO `sys_log` VALUES ('227', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 13:49:33');
INSERT INTO `sys_log` VALUES ('228', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 13:56:41');
INSERT INTO `sys_log` VALUES ('229', '1', 'admin', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 14:13:40');
INSERT INTO `sys_log` VALUES ('231', '1', 'admin', '登录', '26', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 14:23:52');
INSERT INTO `sys_log` VALUES ('232', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 14:44:03');
INSERT INTO `sys_log` VALUES ('233', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 15:36:21');
INSERT INTO `sys_log` VALUES ('234', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 17:15:14');
INSERT INTO `sys_log` VALUES ('235', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 17:25:39');
INSERT INTO `sys_log` VALUES ('236', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 17:26:36');
INSERT INTO `sys_log` VALUES ('237', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 17:52:14');
INSERT INTO `sys_log` VALUES ('238', '1', 'admin', '登录', '11', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 17:54:34');
INSERT INTO `sys_log` VALUES ('239', '1', 'admin', '删除用户', '193', 'com.bootdo.system.controller.UserController.remove()', '1', '127.0.0.1', '2017-09-08 17:54:56');
INSERT INTO `sys_log` VALUES ('240', '-1', '获取用户信息为空', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 21:37:38');
INSERT INTO `sys_log` VALUES ('241', '-1', '获取用户信息为空', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 21:37:41');
INSERT INTO `sys_log` VALUES ('242', '-1', '获取用户信息为空', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 21:37:44');
INSERT INTO `sys_log` VALUES ('243', '-1', '获取用户信息为空', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 21:37:45');
INSERT INTO `sys_log` VALUES ('244', '-1', '获取用户信息为空', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 21:37:46');
INSERT INTO `sys_log` VALUES ('245', '-1', '获取用户信息为空', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 21:37:47');
INSERT INTO `sys_log` VALUES ('246', '-1', '获取用户信息为空', '登录', '32', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 21:37:54');
INSERT INTO `sys_log` VALUES ('247', '-1', '获取用户信息为空', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 21:37:55');
INSERT INTO `sys_log` VALUES ('248', '-1', '获取用户信息为空', '登录', '25', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 21:38:03');
INSERT INTO `sys_log` VALUES ('249', '-1', '获取用户信息为空', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 21:38:58');
INSERT INTO `sys_log` VALUES ('250', '-1', '获取用户信息为空', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 21:39:05');
INSERT INTO `sys_log` VALUES ('251', '1', 'admin', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 21:40:44');
INSERT INTO `sys_log` VALUES ('252', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 22:03:51');
INSERT INTO `sys_log` VALUES ('253', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 22:19:02');
INSERT INTO `sys_log` VALUES ('254', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 22:41:16');
INSERT INTO `sys_log` VALUES ('255', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 22:43:22');
INSERT INTO `sys_log` VALUES ('256', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-08 22:44:41');
INSERT INTO `sys_log` VALUES ('257', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 08:24:52');
INSERT INTO `sys_log` VALUES ('258', '1', 'admin', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 08:33:28');
INSERT INTO `sys_log` VALUES ('259', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 08:36:08');
INSERT INTO `sys_log` VALUES ('260', '1', 'admin', '删除用户', '70', 'com.bootdo.system.controller.UserController.remove()', '1', '127.0.0.1', '2017-09-09 08:36:19');
INSERT INTO `sys_log` VALUES ('261', '1', 'admin', '删除用户', '4', 'com.bootdo.system.controller.UserController.remove()', '1', '127.0.0.1', '2017-09-09 08:37:11');
INSERT INTO `sys_log` VALUES ('262', '1', 'admin', '删除用户', '3', 'com.bootdo.system.controller.UserController.remove()', '1', '127.0.0.1', '2017-09-09 08:39:30');
INSERT INTO `sys_log` VALUES ('263', '1', 'admin', '删除用户', '4', 'com.bootdo.system.controller.UserController.remove()', '1', '127.0.0.1', '2017-09-09 08:39:44');
INSERT INTO `sys_log` VALUES ('264', '-1', '获取用户信息为空', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 08:50:05');
INSERT INTO `sys_log` VALUES ('265', '-1', '获取用户信息为空', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 08:50:09');
INSERT INTO `sys_log` VALUES ('266', '-1', '获取用户信息为空', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 08:50:11');
INSERT INTO `sys_log` VALUES ('267', '-1', '获取用户信息为空', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 08:50:13');
INSERT INTO `sys_log` VALUES ('268', '-1', '获取用户信息为空', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 08:50:14');
INSERT INTO `sys_log` VALUES ('269', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 08:50:35');
INSERT INTO `sys_log` VALUES ('270', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 08:53:43');
INSERT INTO `sys_log` VALUES ('271', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 10:03:15');
INSERT INTO `sys_log` VALUES ('272', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 10:16:18');
INSERT INTO `sys_log` VALUES ('273', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 11:47:57');
INSERT INTO `sys_log` VALUES ('274', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 11:53:10');
INSERT INTO `sys_log` VALUES ('275', '1', 'admin', '登录', '74', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 14:15:37');
INSERT INTO `sys_log` VALUES ('276', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 14:33:31');
INSERT INTO `sys_log` VALUES ('277', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 14:55:27');
INSERT INTO `sys_log` VALUES ('278', '1', 'admin', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 18:26:37');
INSERT INTO `sys_log` VALUES ('279', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-09 18:52:37');
INSERT INTO `sys_log` VALUES ('280', '1', 'admin', '登录', '50', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-10 09:35:22');
INSERT INTO `sys_log` VALUES ('281', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-10 10:06:26');
INSERT INTO `sys_log` VALUES ('282', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-10 18:05:27');
INSERT INTO `sys_log` VALUES ('283', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-10 18:58:57');
INSERT INTO `sys_log` VALUES ('284', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-10 19:42:46');
INSERT INTO `sys_log` VALUES ('285', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-10 19:52:14');
INSERT INTO `sys_log` VALUES ('286', '1', 'admin', '删除用户', '11', 'com.bootdo.system.controller.UserController.remove()', '59', '127.0.0.1', '2017-09-10 19:52:52');
INSERT INTO `sys_log` VALUES ('287', '1', 'admin', '删除用户', '2', 'com.bootdo.system.controller.UserController.remove()', '58', '127.0.0.1', '2017-09-10 19:52:55');
INSERT INTO `sys_log` VALUES ('288', '1', 'admin', '删除用户', '3', 'com.bootdo.system.controller.UserController.remove()', '58', '127.0.0.1', '2017-09-10 19:53:27');
INSERT INTO `sys_log` VALUES ('289', '1', 'admin', '删除用户', '5', 'com.bootdo.system.controller.UserController.remove()', '58', '127.0.0.1', '2017-09-10 19:53:36');
INSERT INTO `sys_log` VALUES ('290', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-10 19:58:02');
INSERT INTO `sys_log` VALUES ('291', '1', 'admin', '登录', '39', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-11 13:18:09');
INSERT INTO `sys_log` VALUES ('292', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-11 13:33:23');
INSERT INTO `sys_log` VALUES ('293', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-11 13:51:06');
INSERT INTO `sys_log` VALUES ('294', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-11 14:01:20');
INSERT INTO `sys_log` VALUES ('295', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-11 14:46:08');
INSERT INTO `sys_log` VALUES ('296', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-11 15:37:13');
INSERT INTO `sys_log` VALUES ('297', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-11 15:44:44');
INSERT INTO `sys_log` VALUES ('298', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-11 15:45:27');
INSERT INTO `sys_log` VALUES ('299', '1', 'admin', '登录', '38', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-11 15:46:52');
INSERT INTO `sys_log` VALUES ('300', '1', 'admin', '登录', '11', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-11 16:09:46');
INSERT INTO `sys_log` VALUES ('301', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-11 17:00:56');
INSERT INTO `sys_log` VALUES ('302', '1', 'admin', '登录', '39', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-11 18:44:42');
INSERT INTO `sys_log` VALUES ('303', '1', 'admin', '添加用户', '8', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"}]}', '127.0.0.1', '2017-09-11 18:58:28');
INSERT INTO `sys_log` VALUES ('304', '1', 'admin', '编辑用户', '8', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"admin@example.com\",\"gmtCreate\":1502804439000,\"gmtModified\":1502804460000,\"mobile\":\"123456\",\"name\":\"超级管理员\",\"password\":\"33808479d49ca8a3cdc93d4f976d1e3d\",\"status\":1,\"userId\":1,\"userIdCreate\":1,\"username\":\"admin\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"true\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"false\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"}]}', '127.0.0.1', '2017-09-11 19:04:58');
INSERT INTO `sys_log` VALUES ('305', '1', 'admin', '登录', '238', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-12 13:24:12');
INSERT INTO `sys_log` VALUES ('306', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-12 13:48:05');
INSERT INTO `sys_log` VALUES ('307', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-12 14:03:39');
INSERT INTO `sys_log` VALUES ('308', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-12 14:44:39');
INSERT INTO `sys_log` VALUES ('309', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-12 16:10:14');
INSERT INTO `sys_log` VALUES ('310', '1', 'admin', '添加用户', '1', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"}]}', '127.0.0.1', '2017-09-12 16:51:36');
INSERT INTO `sys_log` VALUES ('311', '1', 'admin', '添加用户', '3', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"}]}', '127.0.0.1', '2017-09-12 16:51:44');
INSERT INTO `sys_log` VALUES ('312', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"}]}', '127.0.0.1', '2017-09-12 16:54:56');
INSERT INTO `sys_log` VALUES ('313', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-12 17:16:36');
INSERT INTO `sys_log` VALUES ('314', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-12 17:39:54');
INSERT INTO `sys_log` VALUES ('315', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-12 17:52:09');
INSERT INTO `sys_log` VALUES ('316', '1', 'admin', '添加用户', '3', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"}]}', '127.0.0.1', '2017-09-12 18:24:07');
INSERT INTO `sys_log` VALUES ('317', '1', 'admin', '登录', '31', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 09:53:27');
INSERT INTO `sys_log` VALUES ('318', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 12:48:51');
INSERT INTO `sys_log` VALUES ('319', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 13:17:20');
INSERT INTO `sys_log` VALUES ('320', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 16:02:34');
INSERT INTO `sys_log` VALUES ('321', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 17:00:07');
INSERT INTO `sys_log` VALUES ('322', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 17:03:55');
INSERT INTO `sys_log` VALUES ('323', '1', 'admin', '批量删除用户', '164', 'com.bootdo.system.controller.UserController.batchRemove()', '[85,86,88,89]', '127.0.0.1', '2017-09-13 17:04:24');
INSERT INTO `sys_log` VALUES ('324', '1', 'admin', '批量删除用户', '109', 'com.bootdo.system.controller.UserController.batchRemove()', '[94,95,96,97,98,99,100,101,102,103]', '127.0.0.1', '2017-09-13 17:04:32');
INSERT INTO `sys_log` VALUES ('325', '1', 'admin', '批量删除用户', '140', 'com.bootdo.system.controller.UserController.batchRemove()', '[104,105,106,107,108,109,110,111,112,113]', '127.0.0.1', '2017-09-13 17:04:36');
INSERT INTO `sys_log` VALUES ('326', '1', 'admin', '批量删除用户', '139', 'com.bootdo.system.controller.UserController.batchRemove()', '[114,115,116,117,118,119]', '127.0.0.1', '2017-09-13 17:04:41');
INSERT INTO `sys_log` VALUES ('327', '1', 'admin', '批量删除用户', '150', 'com.bootdo.system.controller.UserController.batchRemove()', '[90,91,92,93]', '127.0.0.1', '2017-09-13 17:04:52');
INSERT INTO `sys_log` VALUES ('328', '1', 'admin', '添加用户', '26', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 17:14:37');
INSERT INTO `sys_log` VALUES ('329', '1', 'admin', '请求更改用户密码', '0', 'com.bootdo.system.controller.UserController.resetPwd()', '36', '127.0.0.1', '2017-09-13 17:14:46');
INSERT INTO `sys_log` VALUES ('330', '1', 'admin', '登录', '21', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 17:21:24');
INSERT INTO `sys_log` VALUES ('331', '1', 'admin', '添加用户', '12', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 17:21:30');
INSERT INTO `sys_log` VALUES ('332', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 17:23:22');
INSERT INTO `sys_log` VALUES ('333', '1', 'admin', '添加用户', '10', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 17:23:31');
INSERT INTO `sys_log` VALUES ('334', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 17:37:10');
INSERT INTO `sys_log` VALUES ('335', '1', 'admin', '添加用户', '11', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 17:37:19');
INSERT INTO `sys_log` VALUES ('336', '1', 'admin', '登录', '1', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 17:47:24');
INSERT INTO `sys_log` VALUES ('337', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 18:15:10');
INSERT INTO `sys_log` VALUES ('338', '38', 'mby', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"mby\"', '127.0.0.1', '2017-09-13 18:18:57');
INSERT INTO `sys_log` VALUES ('339', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 19:14:23');
INSERT INTO `sys_log` VALUES ('340', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 19:14:47');
INSERT INTO `sys_log` VALUES ('341', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 19:14:51');
INSERT INTO `sys_log` VALUES ('342', '1', 'admin', '编辑用户', '9', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"admin@example.com\",\"gmtCreate\":1502804439000,\"gmtModified\":1502804460000,\"mobile\":\"123456\",\"name\":\"超级管理员\",\"password\":\"33808479d49ca8a3cdc93d4f976d1e3d\",\"status\":1,\"userId\":1,\"userIdCreate\":1,\"username\":\"admin\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"true\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"false\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\",\"roleSign\":\"false\"}]}', '127.0.0.1', '2017-09-13 19:15:05');
INSERT INTO `sys_log` VALUES ('343', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 19:41:23');
INSERT INTO `sys_log` VALUES ('344', '1', 'admin', '编辑用户', '4', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"admin@example.com\",\"gmtCreate\":1502804439000,\"gmtModified\":1502804460000,\"mobile\":\"123456\",\"name\":\"超级管理员\",\"password\":\"33808479d49ca8a3cdc93d4f976d1e3d\",\"status\":1,\"userId\":1,\"userIdCreate\":1,\"username\":\"admin\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"true\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"false\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\",\"roleSign\":\"false\"}]}', '127.0.0.1', '2017-09-13 20:21:51');
INSERT INTO `sys_log` VALUES ('345', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 20:26:16');
INSERT INTO `sys_log` VALUES ('346', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 20:30:55');
INSERT INTO `sys_log` VALUES ('347', '1', 'admin', '添加用户', '4', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 20:37:58');
INSERT INTO `sys_log` VALUES ('348', '1', 'admin', '编辑用户', '4', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"admin@example.com\",\"gmtCreate\":1502804439000,\"gmtModified\":1502804460000,\"mobile\":\"123456\",\"name\":\"超级管理员\",\"password\":\"33808479d49ca8a3cdc93d4f976d1e3d\",\"status\":1,\"userId\":1,\"userIdCreate\":1,\"username\":\"admin\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"true\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"false\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\",\"roleSign\":\"false\"}]}', '127.0.0.1', '2017-09-13 20:38:14');
INSERT INTO `sys_log` VALUES ('349', '1', 'admin', '添加用户', '4', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 20:38:22');
INSERT INTO `sys_log` VALUES ('350', '1', 'admin', '添加用户', '0', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 20:38:27');
INSERT INTO `sys_log` VALUES ('351', '1', 'admin', '添加用户', '0', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 20:38:50');
INSERT INTO `sys_log` VALUES ('352', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 20:41:03');
INSERT INTO `sys_log` VALUES ('353', '1', 'admin', '添加用户', '0', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 20:41:07');
INSERT INTO `sys_log` VALUES ('354', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 20:42:33');
INSERT INTO `sys_log` VALUES ('355', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 23:31:30');
INSERT INTO `sys_log` VALUES ('356', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 23:33:28');
INSERT INTO `sys_log` VALUES ('357', '1', 'admin', '编辑用户', '6', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"admin@example.com\",\"gmtCreate\":1502804439000,\"gmtModified\":1502804460000,\"mobile\":\"123456\",\"name\":\"超级管理员\",\"password\":\"33808479d49ca8a3cdc93d4f976d1e3d\",\"status\":1,\"userId\":1,\"userIdCreate\":1,\"username\":\"admin\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"true\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"false\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\",\"roleSign\":\"false\"}]}', '127.0.0.1', '2017-09-13 23:34:21');
INSERT INTO `sys_log` VALUES ('358', '1', 'admin', '添加用户', '1', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 23:35:21');
INSERT INTO `sys_log` VALUES ('359', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 23:37:00');
INSERT INTO `sys_log` VALUES ('360', '1', 'admin', '添加用户', '9', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 23:37:19');
INSERT INTO `sys_log` VALUES ('361', '1', 'admin', '添加用户', '3', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 23:39:18');
INSERT INTO `sys_log` VALUES ('362', '1', 'admin', '添加用户', '3', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 23:39:51');
INSERT INTO `sys_log` VALUES ('363', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 23:39:55');
INSERT INTO `sys_log` VALUES ('364', '1', 'admin', '添加用户', '1', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 23:40:03');
INSERT INTO `sys_log` VALUES ('365', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 23:41:11');
INSERT INTO `sys_log` VALUES ('366', '1', 'admin', '添加用户', '9', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 23:41:22');
INSERT INTO `sys_log` VALUES ('367', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 23:42:42');
INSERT INTO `sys_log` VALUES ('368', '1', 'admin', '添加用户', '9', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-13 23:42:52');
INSERT INTO `sys_log` VALUES ('369', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-13 23:44:48');
INSERT INTO `sys_log` VALUES ('370', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 08:43:43');
INSERT INTO `sys_log` VALUES ('371', '1', 'admin', '编辑用户', '13', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"test@bootdo.com\",\"gmtCreate\":1502689385000,\"gmtModified\":1502716536000,\"name\":\"临时用户\",\"password\":\"6cf3bb3deba2aadbd41ec9a22511084e\",\"status\":1,\"userId\":2,\"userIdCreate\":1,\"username\":\"test\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"false\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"true\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\",\"roleSign\":\"false\"}]}', '127.0.0.1', '2017-09-14 08:43:51');
INSERT INTO `sys_log` VALUES ('372', '1', 'admin', '编辑用户', '6', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"test@bootdo.com\",\"gmtCreate\":1502689385000,\"gmtModified\":1502716536000,\"name\":\"临时用户\",\"password\":\"6cf3bb3deba2aadbd41ec9a22511084e\",\"status\":1,\"userId\":2,\"userIdCreate\":1,\"username\":\"test\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"false\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"true\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\",\"roleSign\":\"false\"}]}', '127.0.0.1', '2017-09-14 08:43:58');
INSERT INTO `sys_log` VALUES ('373', '1', 'admin', '编辑用户', '7', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"test@bootdo.com\",\"gmtCreate\":1502689385000,\"gmtModified\":1502716536000,\"name\":\"临时用户\",\"password\":\"6cf3bb3deba2aadbd41ec9a22511084e\",\"status\":1,\"userId\":2,\"userIdCreate\":1,\"username\":\"test\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"false\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"true\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\",\"roleSign\":\"false\"}]}', '127.0.0.1', '2017-09-14 08:44:56');
INSERT INTO `sys_log` VALUES ('374', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 08:45:55');
INSERT INTO `sys_log` VALUES ('375', '1', 'admin', '添加用户', '8', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-14 08:46:02');
INSERT INTO `sys_log` VALUES ('376', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-14 08:46:09');
INSERT INTO `sys_log` VALUES ('377', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 08:48:48');
INSERT INTO `sys_log` VALUES ('378', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-14 08:48:56');
INSERT INTO `sys_log` VALUES ('379', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 08:55:34');
INSERT INTO `sys_log` VALUES ('380', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 08:59:16');
INSERT INTO `sys_log` VALUES ('381', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 09:02:28');
INSERT INTO `sys_log` VALUES ('382', '1', 'admin', '登录', '14', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 09:05:28');
INSERT INTO `sys_log` VALUES ('383', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 09:10:39');
INSERT INTO `sys_log` VALUES ('384', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 09:20:12');
INSERT INTO `sys_log` VALUES ('385', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 09:25:34');
INSERT INTO `sys_log` VALUES ('386', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 09:26:48');
INSERT INTO `sys_log` VALUES ('387', '1', 'admin', '登录', '11', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 09:27:35');
INSERT INTO `sys_log` VALUES ('388', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 09:28:34');
INSERT INTO `sys_log` VALUES ('389', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 10:25:49');
INSERT INTO `sys_log` VALUES ('390', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 10:37:45');
INSERT INTO `sys_log` VALUES ('391', '1', 'admin', '登录', '1', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 10:39:28');
INSERT INTO `sys_log` VALUES ('392', '1', 'admin', '编辑用户', '6', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"admin@example.com\",\"gmtCreate\":1502804439000,\"gmtModified\":1502804460000,\"mobile\":\"123456\",\"name\":\"超级管理员\",\"password\":\"33808479d49ca8a3cdc93d4f976d1e3d\",\"status\":1,\"userId\":1,\"userIdCreate\":1,\"username\":\"admin\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"true\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"false\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\",\"roleSign\":\"false\"}]}', '127.0.0.1', '2017-09-14 10:40:03');
INSERT INTO `sys_log` VALUES ('393', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 10:40:46');
INSERT INTO `sys_log` VALUES ('394', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 10:45:33');
INSERT INTO `sys_log` VALUES ('395', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 10:48:16');
INSERT INTO `sys_log` VALUES ('396', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-14 10:48:22');
INSERT INTO `sys_log` VALUES ('397', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 12:20:05');
INSERT INTO `sys_log` VALUES ('398', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-14 12:20:09');
INSERT INTO `sys_log` VALUES ('399', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 12:34:12');
INSERT INTO `sys_log` VALUES ('400', '1', 'admin', '添加用户', '12', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-14 12:34:18');
INSERT INTO `sys_log` VALUES ('401', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '127.0.0.1', '2017-09-14 12:36:58');
INSERT INTO `sys_log` VALUES ('402', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-14 12:51:28');
INSERT INTO `sys_log` VALUES ('403', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '127.0.0.1', '2017-09-14 12:55:55');
INSERT INTO `sys_log` VALUES ('404', '1', 'admin', '保存用户', '178', 'com.bootdo.system.controller.UserController.save()', '{\"email\":\"zxy@bootdo.com\",\"name\":\"张学友\",\"password\":\"35174ba93f5fe7267f1fb3c1bf903781\",\"status\":1,\"userId\":121,\"username\":\"zxy\"}', '127.0.0.1', '2017-09-14 12:56:25');

-- ----------------------------
-- Table structure for `sys_macro`
-- ----------------------------
DROP TABLE IF EXISTS `sys_macro`;
CREATE TABLE `sys_macro` (
  `macro_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` bigint(255) DEFAULT NULL COMMENT '父级id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `value` varchar(2000) DEFAULT NULL COMMENT '值',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，0：隐藏   1：显示',
  `type` tinyint(20) DEFAULT NULL COMMENT '类型,0:目录，1:参数配置',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`macro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='通用字典表';

-- ----------------------------
-- Records of sys_macro
-- ----------------------------
INSERT INTO `sys_macro` VALUES ('1', '0', '系统参数', null, '1', '0', '0', null, '2017-08-15 14:51:27', null);
INSERT INTO `sys_macro` VALUES ('2', '1', '用户状态', 'userStatus', '1', '0', '0', null, '2017-08-15 14:51:30', null);
INSERT INTO `sys_macro` VALUES ('3', '2', '正常', '1', '0', '1', '0', '用户可登录', '2017-08-15 14:52:48', '2017-08-15 20:23:29');
INSERT INTO `sys_macro` VALUES ('4', '2', '禁用', '0', '1', '1', '0', '禁止用户登录', '2017-08-15 14:52:51', '2017-08-15 20:44:42');
INSERT INTO `sys_macro` VALUES ('5', '0', '客户关系', ' clientManage', '1', '0', '1', null, '2017-08-15 19:58:24', null);
INSERT INTO `sys_macro` VALUES ('6', '5', '产品信息', 'clientProduct', '1', '0', '0', null, '2017-08-15 19:59:06', null);

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '基础管理', '', '', '0', 'fa fa-bars', '0', '2017-08-09 22:49:47', null);
INSERT INTO `sys_menu` VALUES ('2', '3', '系统菜单', 'sys/menu/', 'sys:menu', '1', 'fa fa-th-list', '2', '2017-08-09 22:55:15', null);
INSERT INTO `sys_menu` VALUES ('3', '0', '系统管理', null, null, '0', 'fa fa-desktop', '1', '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES ('6', '3', '用户管理', 'sys/user/', 'sys:user:list', '1', 'fa fa-user', '0', '2017-08-10 14:12:11', null);
INSERT INTO `sys_menu` VALUES ('7', '3', '角色管理', 'sys/role', 'sys:role', '1', 'fa fa-paw', '1', '2017-08-10 14:13:19', null);
INSERT INTO `sys_menu` VALUES ('11', '6', '刷新', null, 'sys:user:list', '2', null, '0', '2017-08-14 10:51:05', null);
INSERT INTO `sys_menu` VALUES ('12', '6', '新增', '', 'sys:user:add', '2', '', '0', '2017-08-14 10:51:35', null);
INSERT INTO `sys_menu` VALUES ('13', '6', '编辑', null, 'sys:user:edit', '2', null, '0', '2017-08-14 10:52:06', null);
INSERT INTO `sys_menu` VALUES ('14', '6', '删除', null, 'sys:user:remove', '2', null, '0', '2017-08-14 10:52:24', null);
INSERT INTO `sys_menu` VALUES ('15', '7', '刷新', null, 'sys:role:list', '2', null, '0', '2017-08-14 10:56:37', null);
INSERT INTO `sys_menu` VALUES ('20', '2', '刷新', null, 'sys:menu:list', '2', null, '0', '2017-08-14 10:59:32', null);
INSERT INTO `sys_menu` VALUES ('21', '2', '新增', null, 'sys:menu:save', '2', null, '0', '2017-08-14 10:59:56', null);
INSERT INTO `sys_menu` VALUES ('22', '2', '编辑', null, 'sys:menu:edit', '2', null, '0', '2017-08-14 11:00:26', null);
INSERT INTO `sys_menu` VALUES ('23', '2', '删除', null, 'sys:menu:remove', '2', null, '0', '2017-08-14 11:00:58', null);
INSERT INTO `sys_menu` VALUES ('24', '6', '启用', null, 'sys:user:enable', '2', null, '0', '2017-08-14 17:27:18', null);
INSERT INTO `sys_menu` VALUES ('25', '6', '停用', null, 'sys:user:disable', '2', null, '0', '2017-08-14 17:27:43', null);
INSERT INTO `sys_menu` VALUES ('26', '6', '重置密码', null, 'sys:user:resetPassword', '2', null, '0', '2017-08-14 17:28:34', null);
INSERT INTO `sys_menu` VALUES ('27', '1', '系统日志', 'common/log', 'common:log', '1', 'fa fa-warning', '2', '2017-08-14 22:11:53', null);
INSERT INTO `sys_menu` VALUES ('28', '27', '刷新', null, 'sys:log:list', '2', null, '0', '2017-08-14 22:30:22', null);
INSERT INTO `sys_menu` VALUES ('29', '27', '删除', null, 'sys:log:remove', '2', null, '0', '2017-08-14 22:30:43', null);
INSERT INTO `sys_menu` VALUES ('30', '27', '清空', null, 'sys:log:clear', '2', null, '0', '2017-08-14 22:31:02', null);
INSERT INTO `sys_menu` VALUES ('48', '1', '代码生成', 'common/generator', 'common:generator', '1', 'fa fa-code', null, null, null);
INSERT INTO `sys_menu` VALUES ('49', '0', '博客管理', '', '', '0', 'fa fa-rss', null, null, null);
INSERT INTO `sys_menu` VALUES ('50', '49', '文章列表', 'blog/bContent', '', '1', '', null, null, null);

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级用户角色', 'admin', '拥有最高权限', '2', '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES ('48', '钻石会员', null, '消费1w块', null, null, null);
INSERT INTO `sys_role` VALUES ('49', '白金会员', null, '消费5000以上', null, null, null);
INSERT INTO `sys_role` VALUES ('52', '白银会员', null, '', null, null, null);

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('367', '44', '1');
INSERT INTO `sys_role_menu` VALUES ('368', '44', '32');
INSERT INTO `sys_role_menu` VALUES ('369', '44', '33');
INSERT INTO `sys_role_menu` VALUES ('370', '44', '34');
INSERT INTO `sys_role_menu` VALUES ('371', '44', '35');
INSERT INTO `sys_role_menu` VALUES ('372', '44', '28');
INSERT INTO `sys_role_menu` VALUES ('373', '44', '29');
INSERT INTO `sys_role_menu` VALUES ('374', '44', '30');
INSERT INTO `sys_role_menu` VALUES ('375', '44', '38');
INSERT INTO `sys_role_menu` VALUES ('376', '44', '4');
INSERT INTO `sys_role_menu` VALUES ('377', '44', '27');
INSERT INTO `sys_role_menu` VALUES ('378', '45', '38');
INSERT INTO `sys_role_menu` VALUES ('379', '46', '3');
INSERT INTO `sys_role_menu` VALUES ('380', '46', '20');
INSERT INTO `sys_role_menu` VALUES ('381', '46', '21');
INSERT INTO `sys_role_menu` VALUES ('382', '46', '22');
INSERT INTO `sys_role_menu` VALUES ('383', '46', '23');
INSERT INTO `sys_role_menu` VALUES ('384', '46', '11');
INSERT INTO `sys_role_menu` VALUES ('385', '46', '12');
INSERT INTO `sys_role_menu` VALUES ('386', '46', '13');
INSERT INTO `sys_role_menu` VALUES ('387', '46', '14');
INSERT INTO `sys_role_menu` VALUES ('388', '46', '24');
INSERT INTO `sys_role_menu` VALUES ('389', '46', '25');
INSERT INTO `sys_role_menu` VALUES ('390', '46', '26');
INSERT INTO `sys_role_menu` VALUES ('391', '46', '15');
INSERT INTO `sys_role_menu` VALUES ('392', '46', '2');
INSERT INTO `sys_role_menu` VALUES ('393', '46', '6');
INSERT INTO `sys_role_menu` VALUES ('394', '46', '7');
INSERT INTO `sys_role_menu` VALUES ('581', '48', '38');
INSERT INTO `sys_role_menu` VALUES ('582', '48', '32');
INSERT INTO `sys_role_menu` VALUES ('583', '48', '33');
INSERT INTO `sys_role_menu` VALUES ('584', '48', '34');
INSERT INTO `sys_role_menu` VALUES ('585', '48', '35');
INSERT INTO `sys_role_menu` VALUES ('586', '48', '4');
INSERT INTO `sys_role_menu` VALUES ('587', '48', '28');
INSERT INTO `sys_role_menu` VALUES ('588', '48', '29');
INSERT INTO `sys_role_menu` VALUES ('589', '48', '30');
INSERT INTO `sys_role_menu` VALUES ('590', '48', '27');
INSERT INTO `sys_role_menu` VALUES ('591', '48', '1');
INSERT INTO `sys_role_menu` VALUES ('592', '49', '38');
INSERT INTO `sys_role_menu` VALUES ('593', '49', '4');
INSERT INTO `sys_role_menu` VALUES ('594', '49', '32');
INSERT INTO `sys_role_menu` VALUES ('595', '49', '33');
INSERT INTO `sys_role_menu` VALUES ('596', '49', '34');
INSERT INTO `sys_role_menu` VALUES ('597', '49', '35');
INSERT INTO `sys_role_menu` VALUES ('598', '50', '38');
INSERT INTO `sys_role_menu` VALUES ('632', '38', '42');
INSERT INTO `sys_role_menu` VALUES ('737', '51', '38');
INSERT INTO `sys_role_menu` VALUES ('738', '51', '39');
INSERT INTO `sys_role_menu` VALUES ('739', '51', '40');
INSERT INTO `sys_role_menu` VALUES ('740', '51', '41');
INSERT INTO `sys_role_menu` VALUES ('741', '51', '4');
INSERT INTO `sys_role_menu` VALUES ('742', '51', '32');
INSERT INTO `sys_role_menu` VALUES ('743', '51', '33');
INSERT INTO `sys_role_menu` VALUES ('744', '51', '34');
INSERT INTO `sys_role_menu` VALUES ('745', '51', '35');
INSERT INTO `sys_role_menu` VALUES ('746', '51', '27');
INSERT INTO `sys_role_menu` VALUES ('747', '51', '28');
INSERT INTO `sys_role_menu` VALUES ('748', '51', '29');
INSERT INTO `sys_role_menu` VALUES ('749', '51', '30');
INSERT INTO `sys_role_menu` VALUES ('750', '51', '1');
INSERT INTO `sys_role_menu` VALUES ('823', '52', '49');
INSERT INTO `sys_role_menu` VALUES ('824', '52', '50');
INSERT INTO `sys_role_menu` VALUES ('992', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('993', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('994', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('995', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('996', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('997', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('998', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('999', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('1000', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('1001', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('1002', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('1003', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('1004', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('1005', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('1006', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('1007', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('1008', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('1009', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('1010', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('1011', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('1012', '1', '26');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '33808479d49ca8a3cdc93d4f976d1e3d', 'admin@example.com', '123456', '1', '1', '2017-08-15 21:40:39', '2017-08-15 21:41:00', '超级管理员');
INSERT INTO `sys_user` VALUES ('2', 'test', '6cf3bb3deba2aadbd41ec9a22511084e', 'test@bootdo.com', null, '1', '1', '2017-08-14 13:43:05', '2017-08-14 21:15:36', '临时用户');
INSERT INTO `sys_user` VALUES ('36', 'ldh', 'bfd9394475754fbe45866eba97738c36', 'ldh@bootdo.com', null, '1', null, null, null, '刘德华');
INSERT INTO `sys_user` VALUES ('37', 'zjl', '59cc2b9ab239fc4283f6789fd3eaddd2', 'zjl@bootdo.com', null, '0', null, null, null, '周杰伦');
INSERT INTO `sys_user` VALUES ('38', 'mby', '787fd9688f7df19d495e5a80755837d6', 'mby@bootdo.com', null, '1', null, null, null, '毛不易');
INSERT INTO `sys_user` VALUES ('49', 'wang', '451986fb688852365e16fae2810de5db', 'wangqiang@bootdo.com', '的', '1', '0', null, null, '王强');
INSERT INTO `sys_user` VALUES ('120', 'libai', '6560ad47df01d32ec08734c09a99b30b', 'libai@bootdo.com', null, '1', null, null, null, '李白');
INSERT INTO `sys_user` VALUES ('121', 'zxy', '35174ba93f5fe7267f1fb3c1bf903781', 'zxy@bootdo.com', null, '1', null, null, null, '张学友');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('67', '2', '38');
INSERT INTO `sys_user_role` VALUES ('68', '2', '48');
INSERT INTO `sys_user_role` VALUES ('73', '30', '48');
INSERT INTO `sys_user_role` VALUES ('74', '30', '49');
INSERT INTO `sys_user_role` VALUES ('75', '30', '50');
INSERT INTO `sys_user_role` VALUES ('76', '31', '48');
INSERT INTO `sys_user_role` VALUES ('77', '31', '49');
INSERT INTO `sys_user_role` VALUES ('78', '31', '52');
INSERT INTO `sys_user_role` VALUES ('79', '32', '48');
INSERT INTO `sys_user_role` VALUES ('80', '32', '49');
INSERT INTO `sys_user_role` VALUES ('81', '32', '50');
INSERT INTO `sys_user_role` VALUES ('82', '32', '51');
INSERT INTO `sys_user_role` VALUES ('83', '32', '52');
INSERT INTO `sys_user_role` VALUES ('84', '33', '38');
INSERT INTO `sys_user_role` VALUES ('85', '33', '49');
INSERT INTO `sys_user_role` VALUES ('86', '33', '52');
INSERT INTO `sys_user_role` VALUES ('87', '34', '50');
INSERT INTO `sys_user_role` VALUES ('88', '34', '51');
INSERT INTO `sys_user_role` VALUES ('89', '34', '52');
INSERT INTO `sys_user_role` VALUES ('96', '37', '38');
INSERT INTO `sys_user_role` VALUES ('97', '36', '48');
INSERT INTO `sys_user_role` VALUES ('98', '38', '51');
INSERT INTO `sys_user_role` VALUES ('99', '120', '48');
INSERT INTO `sys_user_role` VALUES ('100', '49', '49');
INSERT INTO `sys_user_role` VALUES ('101', '1', '1');
INSERT INTO `sys_user_role` VALUES ('102', '121', '1');
