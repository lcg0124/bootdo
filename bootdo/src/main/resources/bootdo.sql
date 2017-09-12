-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bootdo
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `b_comments`
--

DROP TABLE IF EXISTS `b_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_comments`
--

LOCK TABLES `b_comments` WRITE;
/*!40000 ALTER TABLE `b_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_content`
--

DROP TABLE IF EXISTS `b_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_content`
--

LOCK TABLES `b_content` WRITE;
/*!40000 ALTER TABLE `b_content` DISABLE KEYS */;
INSERT INTO `b_content` VALUES (61,'标题',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,1,1,1,1,''),(62,'行宫',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,1,1,0,1,'元稹'),(63,'登鹳雀楼',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,1,1,0,1,'王之涣'),(67,'hhh',NULL,NULL,NULL,'<p>3333</p>','',NULL,NULL,NULL,NULL,1,1,0,1,''),(69,'标题11',NULL,NULL,NULL,'<p><br></p>','',NULL,NULL,NULL,NULL,1,1,0,1,''),(70,'标题22',NULL,NULL,NULL,'<p><br></p>','',NULL,NULL,NULL,NULL,1,1,0,1,''),(71,'aaa',NULL,NULL,NULL,'<p><br></p>','',NULL,NULL,NULL,NULL,1,1,0,1,''),(72,'ccc',NULL,NULL,NULL,'<p><br></p>','',NULL,NULL,NULL,NULL,1,1,0,1,''),(74,'xxx000',NULL,NULL,NULL,'<p><br></p>','',NULL,NULL,NULL,NULL,1,1,0,1,''),(75,'静夜思',NULL,NULL,NULL,'<p><span style=\"background-color: rgb(255, 0, 0);\">窗前明月光，</span></p><p>疑是地上霜。</p>','',NULL,NULL,NULL,NULL,0,0,0,1,'李白'),(98,'dd',NULL,NULL,NULL,'<p><br></p>','',NULL,NULL,NULL,NULL,1,NULL,0,NULL,'dd');
/*!40000 ALTER TABLE `b_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (119,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-05 17:42:38'),(120,1,'admin','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-05 18:01:10'),(121,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-05 18:16:09'),(122,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-05 18:22:29'),(123,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-05 18:26:27'),(124,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-05 18:34:30'),(125,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-05 18:36:18'),(126,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-05 18:36:47'),(127,1,'admin','登录',9,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-05 21:52:22'),(128,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-05 21:55:10'),(129,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 08:31:17'),(130,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 08:39:28'),(131,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 08:43:04'),(132,1,'admin','登录',9,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 09:24:15'),(133,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 09:26:07'),(134,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 09:27:15'),(135,1,'admin','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 09:30:50'),(136,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 10:47:27'),(137,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 10:51:13'),(138,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 10:57:31'),(139,1,'admin','登录',16,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 11:42:32'),(140,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 11:51:43'),(141,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 12:50:52'),(142,1,'admin','登录',10,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 12:53:08'),(143,1,'admin','登录',10,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 13:01:48'),(144,1,'admin','登录',9,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 13:04:43'),(145,1,'admin','登录',9,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 13:29:14'),(146,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 13:30:11'),(147,1,'admin','登录',15,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 13:31:12'),(148,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 13:32:34'),(149,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 13:34:49'),(150,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 13:37:18'),(151,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 13:39:59'),(152,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 13:50:47'),(153,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 14:02:23'),(154,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 14:03:38'),(155,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 14:18:23'),(156,1,'admin','登录',16,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 14:20:54'),(157,1,'admin','登录',9,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 14:23:02'),(158,1,'admin','登录',15,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 14:25:39'),(159,1,'admin','登录',15,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 14:49:41'),(160,1,'admin','登录',16,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 14:50:43'),(161,1,'admin','登录',16,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 15:09:44'),(162,1,'admin','登录',10,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 15:48:40'),(163,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 16:03:26'),(164,1,'admin','登录',10,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 16:05:45'),(165,1,'admin','登录',16,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 16:07:47'),(166,1,'admin','登录',22,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 16:10:39'),(167,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 16:25:44'),(168,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 16:41:19'),(169,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 16:44:54'),(170,1,'admin','登录',15,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 16:46:50'),(171,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 16:48:48'),(172,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 17:12:25'),(173,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 17:16:46'),(174,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 17:19:18'),(175,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 17:31:42'),(176,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 17:34:15'),(177,1,'admin','登录',6,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 17:40:58'),(178,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 17:44:48'),(179,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 18:05:41'),(180,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 18:17:40'),(181,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 18:25:05'),(182,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 18:27:24'),(183,1,'admin','登录',9,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 18:29:42'),(184,-1,'获取用户信息为空','登录',15,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 18:41:15'),(185,-1,'获取用户信息为空','登录',5,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 18:41:17'),(186,-1,'获取用户信息为空','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 18:41:26'),(187,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 18:46:40'),(188,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 18:48:35'),(189,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 19:03:16'),(190,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-06 19:08:56'),(191,1,'admin','登录',39,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-07 08:49:03'),(192,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-07 09:21:34'),(194,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-07 10:10:45'),(195,1,'admin','删除用户',127,'com.bootdo.system.controller.UserController.remove()','87','127.0.0.1','2017-09-07 10:11:28'),(196,1,'admin','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-07 11:12:36'),(197,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-07 11:17:06'),(204,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-07 13:35:03'),(205,1,'admin','删除用户',146,'com.bootdo.system.controller.UserController.remove()','84','127.0.0.1','2017-09-07 13:49:59'),(206,1,'admin','登录',15,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-07 14:00:38'),(207,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-07 14:02:02'),(208,-1,'获取用户信息为空','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"‘or 1 = 1 –\"','127.0.0.1','2017-09-07 14:35:46'),(209,-1,'获取用户信息为空','登录',5,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"‘or 1 = 1 –\"','127.0.0.1','2017-09-07 14:35:53'),(210,-1,'获取用户信息为空','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"‘or 1 = 1 –\"','127.0.0.1','2017-09-07 14:35:57'),(211,-1,'获取用户信息为空','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"\'or 1 = 1 –\"','127.0.0.1','2017-09-07 14:36:48'),(212,-1,'获取用户信息为空','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"\'or 1 = 1 –\"','127.0.0.1','2017-09-07 14:36:49'),(213,-1,'获取用户信息为空','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\" \'or 1 = 1 –\"','127.0.0.1','2017-09-07 14:36:55'),(216,1,'admin','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-07 14:41:30'),(217,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-07 15:24:43'),(218,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-07 16:39:51'),(219,-1,'获取用户信息为空','登录',13,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-07 17:58:10'),(220,1,'admin','登录',39,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 09:49:37'),(221,1,'admin','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 10:48:41'),(222,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 11:18:38'),(223,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 11:47:23'),(224,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 12:58:21'),(225,1,'admin','登录',9,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 13:13:25'),(226,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 13:36:07'),(227,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 13:49:33'),(228,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 13:56:41'),(229,1,'admin','登录',15,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 14:13:40'),(231,1,'admin','登录',26,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 14:23:52'),(232,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 14:44:03'),(233,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 15:36:21'),(234,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 17:15:14'),(235,1,'admin','登录',16,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 17:25:39'),(236,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 17:26:36'),(237,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 17:52:14'),(238,1,'admin','登录',11,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 17:54:34'),(239,1,'admin','删除用户',193,'com.bootdo.system.controller.UserController.remove()','1','127.0.0.1','2017-09-08 17:54:56'),(240,-1,'获取用户信息为空','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 21:37:38'),(241,-1,'获取用户信息为空','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 21:37:41'),(242,-1,'获取用户信息为空','登录',5,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 21:37:44'),(243,-1,'获取用户信息为空','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 21:37:45'),(244,-1,'获取用户信息为空','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 21:37:46'),(245,-1,'获取用户信息为空','登录',6,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 21:37:47'),(246,-1,'获取用户信息为空','登录',32,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 21:37:54'),(247,-1,'获取用户信息为空','登录',6,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 21:37:55'),(248,-1,'获取用户信息为空','登录',25,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 21:38:03'),(249,-1,'获取用户信息为空','登录',5,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 21:38:58'),(250,-1,'获取用户信息为空','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 21:39:05'),(251,1,'admin','登录',5,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 21:40:44'),(252,1,'admin','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 22:03:51'),(253,1,'admin','登录',12,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 22:19:02'),(254,1,'admin','登录',16,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 22:41:16'),(255,1,'admin','登录',12,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 22:43:22'),(256,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-08 22:44:41'),(257,1,'admin','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 08:24:52'),(258,1,'admin','登录',15,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 08:33:28'),(259,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 08:36:08'),(260,1,'admin','删除用户',70,'com.bootdo.system.controller.UserController.remove()','1','127.0.0.1','2017-09-09 08:36:19'),(261,1,'admin','删除用户',4,'com.bootdo.system.controller.UserController.remove()','1','127.0.0.1','2017-09-09 08:37:11'),(262,1,'admin','删除用户',3,'com.bootdo.system.controller.UserController.remove()','1','127.0.0.1','2017-09-09 08:39:30'),(263,1,'admin','删除用户',4,'com.bootdo.system.controller.UserController.remove()','1','127.0.0.1','2017-09-09 08:39:44'),(264,-1,'获取用户信息为空','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 08:50:05'),(265,-1,'获取用户信息为空','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 08:50:09'),(266,-1,'获取用户信息为空','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 08:50:11'),(267,-1,'获取用户信息为空','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 08:50:13'),(268,-1,'获取用户信息为空','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 08:50:14'),(269,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 08:50:35'),(270,1,'admin','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 08:53:43'),(271,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 10:03:15'),(272,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 10:16:18'),(273,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 11:47:57'),(274,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 11:53:10'),(275,1,'admin','登录',74,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 14:15:37'),(276,1,'admin','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 14:33:31'),(277,1,'admin','登录',12,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 14:55:27'),(278,1,'admin','登录',5,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 18:26:37'),(279,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-09 18:52:37'),(280,1,'admin','登录',50,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-10 09:35:22'),(281,1,'admin','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-10 10:06:26'),(282,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-10 18:05:27'),(283,1,'admin','登录',6,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-10 18:58:57'),(284,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-10 19:42:46'),(285,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-10 19:52:14'),(286,1,'admin','删除用户',11,'com.bootdo.system.controller.UserController.remove()','59','127.0.0.1','2017-09-10 19:52:52'),(287,1,'admin','删除用户',2,'com.bootdo.system.controller.UserController.remove()','58','127.0.0.1','2017-09-10 19:52:55'),(288,1,'admin','删除用户',3,'com.bootdo.system.controller.UserController.remove()','58','127.0.0.1','2017-09-10 19:53:27'),(289,1,'admin','删除用户',5,'com.bootdo.system.controller.UserController.remove()','58','127.0.0.1','2017-09-10 19:53:36'),(290,1,'admin','登录',0,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-10 19:58:02'),(291,1,'admin','登录',39,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-11 13:18:09'),(292,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-11 13:33:23'),(293,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-11 13:51:06'),(294,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-11 14:01:20'),(295,1,'admin','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-11 14:46:08'),(296,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-11 15:37:13'),(297,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-11 15:44:44'),(298,1,'admin','登录',6,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-11 15:45:27'),(299,1,'admin','登录',38,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-11 15:46:52'),(300,1,'admin','登录',11,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-11 16:09:46'),(301,1,'admin','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-11 17:00:56'),(302,1,'admin','登录',39,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-11 18:44:42'),(303,1,'admin','添加用户',8,'com.bootdo.system.controller.UserController.add()','{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"}]}','127.0.0.1','2017-09-11 18:58:28'),(304,1,'admin','编辑用户',8,'com.bootdo.system.controller.UserController.edit()','{\"user\":{\"email\":\"admin@example.com\",\"gmtCreate\":1502804439000,\"gmtModified\":1502804460000,\"mobile\":\"123456\",\"name\":\"超级管理员\",\"password\":\"33808479d49ca8a3cdc93d4f976d1e3d\",\"status\":1,\"userId\":1,\"userIdCreate\":1,\"username\":\"admin\"},\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"true\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\",\"roleSign\":\"false\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\",\"roleSign\":\"false\"}]}','127.0.0.1','2017-09-11 19:04:58'),(305,1,'admin','登录',238,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-12 13:24:12'),(306,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-12 13:48:05'),(307,1,'admin','登录',7,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-12 14:03:39'),(308,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-12 14:44:39'),(309,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-12 16:10:14'),(310,1,'admin','添加用户',1,'com.bootdo.system.controller.UserController.add()','{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"}]}','127.0.0.1','2017-09-12 16:51:36'),(311,1,'admin','添加用户',3,'com.bootdo.system.controller.UserController.add()','{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"}]}','127.0.0.1','2017-09-12 16:51:44'),(312,1,'admin','添加用户',2,'com.bootdo.system.controller.UserController.add()','{\"roles\":[{\"gmtCreate\":1502469832000,\"gmtModified\":1502536499000,\"remark\":\"拥有最高权限\",\"roleId\":1,\"roleName\":\"超级用户角色\",\"roleSign\":\"admin\",\"userIdCreate\":2},{\"remark\":\"消费1w块\",\"roleId\":48,\"roleName\":\"钻石会员\"},{\"remark\":\"消费5000以上\",\"roleId\":49,\"roleName\":\"白金会员\"}]}','127.0.0.1','2017-09-12 16:54:56'),(313,1,'admin','登录',8,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-12 17:16:36'),(314,1,'admin','登录',12,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-12 17:39:54'),(315,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()','\"admin\"','127.0.0.1','2017-09-12 17:52:09');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_macro`
--

DROP TABLE IF EXISTS `sys_macro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_macro`
--

LOCK TABLES `sys_macro` WRITE;
/*!40000 ALTER TABLE `sys_macro` DISABLE KEYS */;
INSERT INTO `sys_macro` VALUES (1,0,'系统参数',NULL,1,0,0,NULL,'2017-08-15 14:51:27',NULL),(2,1,'用户状态','userStatus',1,0,0,NULL,'2017-08-15 14:51:30',NULL),(3,2,'正常','1',0,1,0,'用户可登录','2017-08-15 14:52:48','2017-08-15 20:23:29'),(4,2,'禁用','0',1,1,0,'禁止用户登录','2017-08-15 14:52:51','2017-08-15 20:44:42'),(5,0,'客户关系',' clientManage',1,0,1,NULL,'2017-08-15 19:58:24',NULL),(6,5,'产品信息','clientProduct',1,0,0,NULL,'2017-08-15 19:59:06',NULL);
/*!40000 ALTER TABLE `sys_macro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'基础管理','','',0,'fa fa-bars',0,'2017-08-09 22:49:47',NULL),(2,3,'系统菜单','sys/menu/','sys:menu',0,'fa fa-th-list',2,'2017-08-09 22:55:15',NULL),(3,0,'系统管理',NULL,NULL,0,'fa fa-desktop',1,'2017-08-09 23:06:55','2017-08-14 14:13:43'),(6,3,'用户管理','sys/user/','sys:user',1,'fa fa-user',0,'2017-08-10 14:12:11',NULL),(7,3,'角色管理','sys/role','sys:role',1,'fa fa-paw',1,'2017-08-10 14:13:19',NULL),(11,6,'刷新',NULL,'sys:user:list',2,NULL,0,'2017-08-14 10:51:05',NULL),(12,6,'新增',NULL,'sys:user:save',2,NULL,0,'2017-08-14 10:51:35',NULL),(13,6,'编辑',NULL,'sys:user:edit',2,NULL,0,'2017-08-14 10:52:06',NULL),(14,6,'删除',NULL,'sys:user:remove',2,NULL,0,'2017-08-14 10:52:24',NULL),(15,7,'刷新',NULL,'sys:role:list',2,NULL,0,'2017-08-14 10:56:37',NULL),(20,2,'刷新',NULL,'sys:menu:list',2,NULL,0,'2017-08-14 10:59:32',NULL),(21,2,'新增',NULL,'sys:menu:save',2,NULL,0,'2017-08-14 10:59:56',NULL),(22,2,'编辑',NULL,'sys:menu:edit',2,NULL,0,'2017-08-14 11:00:26',NULL),(23,2,'删除',NULL,'sys:menu:remove',2,NULL,0,'2017-08-14 11:00:58',NULL),(24,6,'启用',NULL,'sys:user:enable',2,NULL,0,'2017-08-14 17:27:18',NULL),(25,6,'停用',NULL,'sys:user:disable',2,NULL,0,'2017-08-14 17:27:43',NULL),(26,6,'重置密码',NULL,'sys:user:resetPassword',2,NULL,0,'2017-08-14 17:28:34',NULL),(27,1,'系统日志','common/log','common:log',1,'fa fa-warning',2,'2017-08-14 22:11:53',NULL),(28,27,'刷新',NULL,'sys:log:list',2,NULL,0,'2017-08-14 22:30:22',NULL),(29,27,'删除',NULL,'sys:log:remove',2,NULL,0,'2017-08-14 22:30:43',NULL),(30,27,'清空',NULL,'sys:log:clear',2,NULL,0,'2017-08-14 22:31:02',NULL),(48,1,'代码生成','common/generator','common:generator',1,'fa fa-code',NULL,NULL,NULL),(49,0,'博客管理','','',0,'fa fa-rss',NULL,NULL,NULL),(50,49,'文章列表','blog/bContent','',1,'',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级用户角色','admin','拥有最高权限',2,'2017-08-12 00:43:52','2017-08-12 19:14:59'),(48,'钻石会员',NULL,'消费1w块',NULL,NULL,NULL),(49,'白金会员',NULL,'消费5000以上',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=823 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (367,44,1),(368,44,32),(369,44,33),(370,44,34),(371,44,35),(372,44,28),(373,44,29),(374,44,30),(375,44,38),(376,44,4),(377,44,27),(378,45,38),(379,46,3),(380,46,20),(381,46,21),(382,46,22),(383,46,23),(384,46,11),(385,46,12),(386,46,13),(387,46,14),(388,46,24),(389,46,25),(390,46,26),(391,46,15),(392,46,2),(393,46,6),(394,46,7),(581,48,38),(582,48,32),(583,48,33),(584,48,34),(585,48,35),(586,48,4),(587,48,28),(588,48,29),(589,48,30),(590,48,27),(591,48,1),(592,49,38),(593,49,4),(594,49,32),(595,49,33),(596,49,34),(597,49,35),(598,50,38),(632,38,42),(732,52,20),(733,52,21),(734,52,22),(735,52,23),(736,52,2),(737,51,38),(738,51,39),(739,51,40),(740,51,41),(741,51,4),(742,51,32),(743,51,33),(744,51,34),(745,51,35),(746,51,27),(747,51,28),(748,51,29),(749,51,30),(750,51,1),(798,1,28),(799,1,29),(800,1,30),(801,1,27),(802,1,48),(803,1,1),(804,1,20),(805,1,21),(806,1,22),(807,1,23),(808,1,2),(809,1,11),(810,1,12),(811,1,13),(812,1,14),(813,1,24),(814,1,25),(815,1,26),(816,1,6),(817,1,15),(818,1,7),(819,1,3),(820,1,49),(821,1,50),(822,1,-1);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','33808479d49ca8a3cdc93d4f976d1e3d','admin@example.com','123456',1,1,'2017-08-15 21:40:39','2017-08-15 21:41:00','超级管理员'),(2,'test','6cf3bb3deba2aadbd41ec9a22511084e','test@bootdo.com',NULL,1,1,'2017-08-14 13:43:05','2017-08-14 21:15:36','临时用户'),(36,'ldh','bfd9394475754fbe45866eba97738c36','ldh@bootdo.com',NULL,1,NULL,NULL,NULL,'刘德华'),(37,'zjl','59cc2b9ab239fc4283f6789fd3eaddd2','zjl@bootdo.com',NULL,0,NULL,NULL,NULL,'周杰伦'),(38,'mby','787fd9688f7df19d495e5a80755837d6','mby@bootdo.com',NULL,1,NULL,NULL,NULL,'毛不易'),(49,'wang','451986fb688852365e16fae2810de5db','wangqiang@bootdo.com','的',1,0,NULL,NULL,'王强'),(85,'zhang','张','的','的',0,0,NULL,NULL,'张'),(86,'zhang','张','的','的',0,0,NULL,NULL,'张'),(88,'zhang','张','的','的',0,0,NULL,NULL,'张'),(89,'zhang','张','的','的',0,0,NULL,NULL,'张'),(90,'zhang','张','的','的',0,0,NULL,NULL,'张'),(91,'zhang','张','的','的',0,0,NULL,NULL,'张'),(92,'zhang','张','的','的',0,0,NULL,NULL,'张'),(93,'zhang','张','的','的',0,0,NULL,NULL,'张'),(94,'zhang','张','的','的',0,0,NULL,NULL,'张'),(95,'zhang','张','的','的',0,0,NULL,NULL,'张'),(96,'zhang','张','的','的',0,0,NULL,NULL,'张'),(97,'zhang','张','的','的',0,0,NULL,NULL,'张'),(98,'zhang','张','的','的',0,0,NULL,NULL,'张'),(99,'zhang','张','的','的',0,0,NULL,NULL,'张'),(100,'zhang','张','的','的',0,0,NULL,NULL,'张'),(101,'zhang','张','的','的',0,0,NULL,NULL,'张'),(102,'zhang','张','的','的',0,0,NULL,NULL,'张'),(103,'zhang','张','的','的',0,0,NULL,NULL,'张'),(104,'zhang','张','的','的',0,0,NULL,NULL,'张'),(105,'zhang','张','的','的',0,0,NULL,NULL,'张'),(106,'zhang','张','的','的',0,0,NULL,NULL,'张'),(107,'zhang','张','的','的',0,0,NULL,NULL,'张'),(108,'zhang','张','的','的',0,0,NULL,NULL,'张'),(109,'zhang','张','的','的',0,0,NULL,NULL,'张'),(110,'zhang','张','的','的',0,0,NULL,NULL,'张'),(111,'zhang','张','的','的',0,0,NULL,NULL,'张'),(112,'zhang','张','的','的',0,0,NULL,NULL,'张'),(113,'zhang','张','的','的',0,0,NULL,NULL,'张'),(114,'zhang','张','的','的',0,0,NULL,NULL,'张'),(115,'zhang','张','的','的',0,0,NULL,NULL,'张'),(116,'zhang','张','的','的',0,0,NULL,NULL,'张'),(117,'zhang','张','的','的',0,0,NULL,NULL,'张'),(118,'zhang','张','的','的',0,0,NULL,NULL,'张'),(119,'zhang','张','的','的',0,0,NULL,NULL,'张'),(120,'libai','6560ad47df01d32ec08734c09a99b30b','libai@bootdo.com',NULL,1,NULL,NULL,NULL,'李白');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (67,2,38),(68,2,48),(73,30,48),(74,30,49),(75,30,50),(76,31,48),(77,31,49),(78,31,52),(79,32,48),(80,32,49),(81,32,50),(82,32,51),(83,32,52),(84,33,38),(85,33,49),(86,33,52),(87,34,50),(88,34,51),(89,34,52),(96,37,38),(97,36,48),(98,38,51),(99,120,48),(100,49,49),(101,1,1);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bootdo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-12 18:13:44
