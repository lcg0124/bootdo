/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : bootdo

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-09-18 10:44:42
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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='文章内容';

-- ----------------------------
-- Records of b_content
-- ----------------------------
INSERT INTO `b_content` VALUES ('106', '1', null, null, null, '<p>123</p><p>32</p><p>1</p>', '', null, null, null, null, '0', null, '1', '0', '1');
INSERT INTO `b_content` VALUES ('107', '', null, null, null, '<p><br></p>', '', null, null, null, null, '1', null, '0', '0', '');
INSERT INTO `b_content` VALUES ('108', '标题', null, null, null, '<p>内容<span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span></p><p>内容<span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\"><br></span></p><p>内容<span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\"><br></span></p><p>内容<span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\"><br></span></p>', '', null, null, null, null, '1', null, '1', '1', '作者');
INSERT INTO `b_content` VALUES ('110', 'ceshi de ', null, null, null, '<p>fsdafdsafdsa</p>', '', null, null, null, null, '1', null, '1', '1', 'ysq');

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
) ENGINE=InnoDB AUTO_INCREMENT=1889 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1857', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '111.200.228.50', '2017-09-18 10:11:23');
INSERT INTO `sys_log` VALUES ('1858', '1', 'admin', '登录', '1', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '122.224.196.88', '2017-09-18 10:11:49');
INSERT INTO `sys_log` VALUES ('1859', '1', 'admin', '请求更改用户密码', '0', 'com.bootdo.system.controller.UserController.resetPwd()', '124', '111.200.228.50', '2017-09-18 10:12:29');
INSERT INTO `sys_log` VALUES ('1861', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '61.175.240.30', '2017-09-18 10:14:20');
INSERT INTO `sys_log` VALUES ('1862', '1', 'admin', '登录', '1', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '210.21.228.42', '2017-09-18 10:14:46');
INSERT INTO `sys_log` VALUES ('1863', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '118.192.134.27', '2017-09-18 10:15:30');
INSERT INTO `sys_log` VALUES ('1864', '1', 'admin', '添加用户', '0', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '118.192.134.27', '2017-09-18 10:16:31');
INSERT INTO `sys_log` VALUES ('1865', '1', 'admin', '请求更改用户密码', '0', 'com.bootdo.system.controller.UserController.resetPwd()', '124', '118.192.134.27', '2017-09-18 10:16:53');
INSERT INTO `sys_log` VALUES ('1866', '1', 'admin', '添加用户', '0', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '110.53.253.103', '2017-09-18 10:17:17');
INSERT INTO `sys_log` VALUES ('1867', '1', 'admin', '添加用户', '1', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '110.53.253.103', '2017-09-18 10:17:22');
INSERT INTO `sys_log` VALUES ('1868', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '101.81.252.217', '2017-09-18 10:18:52');
INSERT INTO `sys_log` VALUES ('1869', '1', 'admin', '编辑用户', '1', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"admin@example.com\",\"gmtCreate\":1502804439000,\"gmtModified\":1502804460000,\"mobile\":\"123456\",\"name\":\"超级管理员\",\"password\":\"33808479d49ca8a3cdc93d4f976d1e3d\",\"status\":1,\"userId\":1,\"userIdCreate\":1,\"username\":\"admin\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"true\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"false\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\",\"roleSign\":\"false\"}]}', '101.81.252.217', '2017-09-18 10:19:37');
INSERT INTO `sys_log` VALUES ('1870', '1', 'admin', '编辑用户', '1', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"ldh@bootdo.com\",\"name\":\"刘德华\",\"password\":\"362da61588d2b5f0a914c26217350d7b\",\"status\":1,\"userId\":36,\"username\":\"ldh\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"false\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"true\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\",\"roleSign\":\"false\"}]}', '101.81.252.217', '2017-09-18 10:20:14');
INSERT INTO `sys_log` VALUES ('1871', '1', 'admin', '登录', '1', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '113.106.79.26', '2017-09-18 10:22:55');
INSERT INTO `sys_log` VALUES ('1872', '1', 'admin', '登录', '11', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '218.78.199.131', '2017-09-18 10:23:18');
INSERT INTO `sys_log` VALUES ('1873', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '157.122.183.226', '2017-09-18 10:25:19');
INSERT INTO `sys_log` VALUES ('1874', '1', 'admin', '编辑用户', '1', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"admin@example.com\",\"gmtCreate\":1502804439000,\"gmtModified\":1502804460000,\"mobile\":\"123456\",\"name\":\"超级管理员\",\"password\":\"33808479d49ca8a3cdc93d4f976d1e3d\",\"status\":1,\"userId\":1,\"userIdCreate\":1,\"username\":\"admin\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"true\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"false\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\",\"roleSign\":\"false\"}]}', '157.122.183.226', '2017-09-18 10:26:36');
INSERT INTO `sys_log` VALUES ('1875', '1', 'admin', '登录', '1', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '27.38.250.70', '2017-09-18 10:28:56');
INSERT INTO `sys_log` VALUES ('1876', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '115.233.196.50', '2017-09-18 10:31:14');
INSERT INTO `sys_log` VALUES ('1877', '1', 'admin', '登录', '1', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '115.233.196.50', '2017-09-18 10:32:31');
INSERT INTO `sys_log` VALUES ('1878', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '58.132.171.180', '2017-09-18 10:32:36');
INSERT INTO `sys_log` VALUES ('1879', '1', 'admin', '登录', '1', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '124.14.124.159', '2017-09-18 10:37:08');
INSERT INTO `sys_log` VALUES ('1880', '1', 'admin', '添加用户', '1', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '124.14.124.159', '2017-09-18 10:37:58');
INSERT INTO `sys_log` VALUES ('1881', '1', 'admin', '登录', '1', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '1.119.132.167', '2017-09-18 10:41:10');
INSERT INTO `sys_log` VALUES ('1882', '1', 'admin', '添加用户', '0', 'com.bootdo.system.controller.UserController.add()', '{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\"}]}', '124.14.124.159', '2017-09-18 10:42:06');
INSERT INTO `sys_log` VALUES ('1883', '1', 'admin', '保存用户', '9', 'com.bootdo.system.controller.UserController.save()', '{\"email\":\"143434@qq.com\",\"name\":\"test001\",\"password\":\"2d050c20489755d08deb2577000b099e\",\"status\":1,\"userId\":129,\"username\":\"test001\"}', '124.14.124.159', '2017-09-18 10:42:39');
INSERT INTO `sys_log` VALUES ('1884', '129', 'test001', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"test001\"', '124.14.124.159', '2017-09-18 10:43:05');
INSERT INTO `sys_log` VALUES ('1885', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', '\"admin\"', '124.14.124.159', '2017-09-18 10:43:47');
INSERT INTO `sys_log` VALUES ('1886', '1', 'admin', '编辑用户', '1', 'com.bootdo.system.controller.UserController.edit()', '{\"user\":{\"email\":\"143434@qq.com\",\"name\":\"test001\",\"password\":\"2d050c20489755d08deb2577000b099e\",\"status\":1,\"userId\":129,\"username\":\"test001\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"true\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"false\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"},{\"remark\":\"\",\"roleId\":52,\"roleName\":\"白银会员\",\"roleSign\":\"false\"}]}', '124.14.124.159', '2017-09-18 10:44:12');
INSERT INTO `sys_log` VALUES ('1887', '1', 'admin', '更新用户', '0', 'com.bootdo.system.controller.UserController.update()', '{\"email\":\"143434@qq.com\",\"name\":\"test001\",\"status\":1,\"userId\":129,\"username\":\"test001\"}', '124.14.124.159', '2017-09-18 10:44:19');
INSERT INTO `sys_log` VALUES ('1888', '1', 'admin', '更新用户', '0', 'com.bootdo.system.controller.UserController.update()', '{\"email\":\"143434@qq.com\",\"name\":\"test001\",\"status\":1,\"userId\":129,\"username\":\"test001\"}', '124.14.124.159', '2017-09-18 10:44:22');

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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

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
INSERT INTO `sys_menu` VALUES ('51', '0', 'asdas', '', '1', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('52', '51', 'aasdsdsda', '', 'asdad', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('53', '52', 'aaaaa', '', '', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('54', '0', '1', '1', '1', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('55', '0', 'aaa', '/', '110', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('56', '0', '', '', '', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('57', '55', '23', '32', '2', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('58', '0', '', '', '', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('59', '0', '', '', '', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('60', '27', '', '', '', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('61', '0', '', '', '', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('62', '0', 'hhhh', 'hhhh', '', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('63', '2', '', '', '', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('64', '0', '百度外链', 'http://www.baidu.com', '1', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('65', '0', 'jgj', '', '', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('66', '55', '', '', '', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('67', '0', '测试', 'baidu.com', 'aa', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('68', '28', '', '', '', '2', null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=1100 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

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
INSERT INTO `sys_role_menu` VALUES ('1033', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('1034', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('1035', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('1036', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('1037', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('1038', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('1039', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('1040', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('1041', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('1042', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('1043', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('1044', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('1045', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('1046', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('1047', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('1048', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('1049', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('1050', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('1051', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('1052', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('1053', '1', '-1');
INSERT INTO `sys_role_menu` VALUES ('1054', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('1055', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('1056', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('1057', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('1080', '49', '55');
INSERT INTO `sys_role_menu` VALUES ('1081', '49', '27');
INSERT INTO `sys_role_menu` VALUES ('1082', '49', '60');
INSERT INTO `sys_role_menu` VALUES ('1083', '49', '28');
INSERT INTO `sys_role_menu` VALUES ('1084', '49', '29');
INSERT INTO `sys_role_menu` VALUES ('1085', '49', '30');
INSERT INTO `sys_role_menu` VALUES ('1086', '48', '28');
INSERT INTO `sys_role_menu` VALUES ('1087', '48', '29');
INSERT INTO `sys_role_menu` VALUES ('1088', '48', '30');
INSERT INTO `sys_role_menu` VALUES ('1089', '48', '27');
INSERT INTO `sys_role_menu` VALUES ('1090', '48', '1');
INSERT INTO `sys_role_menu` VALUES ('1091', '48', '49');
INSERT INTO `sys_role_menu` VALUES ('1092', '48', '13');
INSERT INTO `sys_role_menu` VALUES ('1096', '52', '13');
INSERT INTO `sys_role_menu` VALUES ('1097', '52', '50');
INSERT INTO `sys_role_menu` VALUES ('1098', '52', '49');
INSERT INTO `sys_role_menu` VALUES ('1099', '52', '6');

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
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '33808479d49ca8a3cdc93d4f976d1e3d', 'admin@example.com', '123456', '1', '1', '2017-08-15 21:40:39', '2017-08-15 21:41:00', '超级管理员');
INSERT INTO `sys_user` VALUES ('2', 'test', '25bb7c42604b0e7aba7bcae50e7762a9', 'test@bootdo.com', null, '0', '1', '2017-08-14 13:43:05', '2017-08-14 21:15:36', '临时用户');
INSERT INTO `sys_user` VALUES ('36', 'ldh', '362da61588d2b5f0a914c26217350d7b', 'ldh@bootdo.com', null, '1', null, null, null, '刘德华');
INSERT INTO `sys_user` VALUES ('37', 'zjl', '59cc2b9ab239fc4283f6789fd3eaddd2', 'zjl@bootdo.com', null, '0', null, null, null, '周杰伦');
INSERT INTO `sys_user` VALUES ('38', 'mby', '787fd9688f7df19d495e5a80755837d6', 'mby@bootdo.com', null, '1', null, null, null, '毛不易');
INSERT INTO `sys_user` VALUES ('49', 'wang', '451986fb688852365e16fae2810de5db', 'wangqiang@bootdo.com', '的', '1', '0', null, null, '王强');
INSERT INTO `sys_user` VALUES ('120', 'libai', '6560ad47df01d32ec08734c09a99b30b', 'libai@bootdo.com', null, '1', null, null, null, '李白');
INSERT INTO `sys_user` VALUES ('121', 'zxy', '35174ba93f5fe7267f1fb3c1bf903781', 'zxy@bootdo.com', null, '1', null, null, null, '张学友');
INSERT INTO `sys_user` VALUES ('122', '11', '6e5f4cea58661a4e52ddeaf751a7f25a', '1@11.com', null, '0', null, null, null, '1');
INSERT INTO `sys_user` VALUES ('123', 'harry', 'f1b0d60280c8d23268c4485f06343aeb', 'jkl@harry.cn', null, '1', null, null, null, 'jkl');
INSERT INTO `sys_user` VALUES ('124', 'jlimy lin', 'e70b115627a189b6e2184eab215a6364', '1564874941@qq.com', null, '1', null, null, null, '林俊杰');
INSERT INTO `sys_user` VALUES ('125', 'lzadmin', '88dafe6b9227cb8a7bc9913cdae061e5', '545624680@qq.com', null, '1', null, null, null, 'admin');
INSERT INTO `sys_user` VALUES ('126', '1231', '4e76eb315e3f72d757e6c3ef9955c9a4', '123123@qq.com', null, '1', null, null, null, '131');
INSERT INTO `sys_user` VALUES ('127', 'haha', '0b95a3d30bd175276c9fac59fdbc6727', 'haha@qq.com', null, '1', null, null, null, '哈哈');
INSERT INTO `sys_user` VALUES ('128', 'admin1', 'd24a3abfbcb1cc897ca1bff38f361ef5', 'wsofbj@163.com', null, '1', null, null, null, 'ws');
INSERT INTO `sys_user` VALUES ('129', 'test001', '2d050c20489755d08deb2577000b099e', '143434@qq.com', null, '1', null, null, null, 'test001');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
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
INSERT INTO `sys_user_role` VALUES ('103', '2', '48');
INSERT INTO `sys_user_role` VALUES ('104', '122', '1');
INSERT INTO `sys_user_role` VALUES ('105', '123', '48');
INSERT INTO `sys_user_role` VALUES ('106', '123', '49');
INSERT INTO `sys_user_role` VALUES ('107', '124', '1');
INSERT INTO `sys_user_role` VALUES ('108', '124', '48');
INSERT INTO `sys_user_role` VALUES ('109', '124', '49');
INSERT INTO `sys_user_role` VALUES ('110', '124', '52');
INSERT INTO `sys_user_role` VALUES ('111', '125', '52');
INSERT INTO `sys_user_role` VALUES ('112', '126', '1');
INSERT INTO `sys_user_role` VALUES ('113', '127', '1');
INSERT INTO `sys_user_role` VALUES ('114', '128', '1');
INSERT INTO `sys_user_role` VALUES ('115', '129', '1');
