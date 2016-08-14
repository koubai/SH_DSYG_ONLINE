/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.51-community : Database - dsyg
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dsyg` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dsyg`;

/*Table structure for table `otb_mailauth` */

DROP TABLE IF EXISTS `otb_mailauth`;

CREATE TABLE `otb_mailauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `authtype` int(8) DEFAULT NULL COMMENT '类型，1为订单确认',
  `userid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `mailauthcode` varchar(512) DEFAULT NULL COMMENT '认证内容，加密后',
  `note` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` int(8) DEFAULT NULL COMMENT '1为有效，0为无效',
  `updateip` varchar(64) DEFAULT NULL COMMENT '数据更新IP',
  `createuid` varchar(32) DEFAULT NULL COMMENT '数据创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuid` varchar(32) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `otb_mailauth` */

LOCK TABLES `otb_mailauth` WRITE;

insert  into `otb_mailauth`(`id`,`authtype`,`userid`,`mailauthcode`,`note`,`status`,`updateip`,`createuid`,`createdate`,`updateuid`,`updatedate`) values (1,1,'test1','b36382b2f687ebc2735014782c459910a2081467183c6cc4cc76d5938ae32a55','ceshi',0,'127.0.0.1','admin','2016-08-05 00:00:00','test1','2016-08-06 20:19:40');

UNLOCK TABLES;

/*Table structure for table `otb_user` */

DROP TABLE IF EXISTS `otb_user`;

CREATE TABLE `otb_user` (
  `userid` varchar(32) NOT NULL COMMENT '用户登录ID',
  `username` varchar(64) DEFAULT NULL COMMENT '用户姓名',
  `belongto` varchar(4) DEFAULT NULL COMMENT '0上海，1深圳，99全部',
  `password` varchar(32) DEFAULT NULL COMMENT '登录密码，MD5加密',
  `rolecode` varchar(32) DEFAULT NULL COMMENT '角色CODE',
  `status` int(4) DEFAULT NULL COMMENT '状态，1为有效，其他为无效',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  `createuid` varchar(32) DEFAULT NULL COMMENT '创建者ID',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuid` varchar(32) DEFAULT NULL COMMENT '更新者ID',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `otb_user` */

LOCK TABLES `otb_user` WRITE;

insert  into `otb_user`(`userid`,`username`,`belongto`,`password`,`rolecode`,`status`,`note`,`createuid`,`createdate`,`updateuid`,`updatedate`) values ('cust1','客户1','0','b59c67bf196a4758191e42f76670ceba','',1,'customer','admin','2014-12-08 00:00:00','admin','2015-07-27 22:54:20');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
