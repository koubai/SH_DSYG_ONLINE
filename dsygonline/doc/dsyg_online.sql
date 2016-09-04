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

/*Table structure for table `otb_customer` */

DROP TABLE IF EXISTS `otb_customer`;

CREATE TABLE `otb_customer` (
  `customerid` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户登录ID',
  `customeremail` varchar(64) DEFAULT NULL COMMENT '用户邮件地址',
  `belongto` varchar(4) DEFAULT NULL COMMENT '0上海，1深圳，99全部',
  `password` varchar(32) DEFAULT NULL COMMENT '登录密码，MD5加密',
  `companycn` varchar(128) DEFAULT NULL COMMENT '购买方公司名',
  `companyen` varchar(128) DEFAULT NULL COMMENT '购买方英文公司名或拼音',
  `department` varchar(64) DEFAULT NULL COMMENT '购买方所属部门',
  `name` varchar(32) DEFAULT NULL COMMENT '购买方姓名',
  `postcode` varchar(32) DEFAULT NULL COMMENT '购买方邮编',
  `address` varchar(128) DEFAULT NULL COMMENT '购买方地址',
  `tell` varchar(32) DEFAULT NULL COMMENT '购买方电话号码',
  `companycn2` varchar(128) DEFAULT NULL COMMENT '收件人公司名',
  `companyen2` varchar(128) DEFAULT NULL COMMENT '收件人英文公司名或拼音',
  `department2` varchar(64) DEFAULT NULL COMMENT '所属部门',
  `name2` varchar(32) DEFAULT NULL COMMENT '收件人姓名',
  `postcode2` varchar(32) DEFAULT NULL COMMENT '收件人邮编',
  `address2` varchar(128) DEFAULT NULL COMMENT '收件人地址',
  `tell2` varchar(32) DEFAULT NULL COMMENT '收件人电话号码',
  `paytype` int(4) NOT NULL DEFAULT '0' COMMENT '交货方法',
  `accounttype` int(4) NOT NULL DEFAULT '0' COMMENT '账户类型，1为企业，2为个人',
  `companytax` varchar(32) DEFAULT NULL COMMENT '公司税号',
  `accountbank` varchar(128) DEFAULT NULL COMMENT '公司开户行',
  `accountid` varchar(32) DEFAULT NULL COMMENT '开户行账号',
  `receipttype` int(4) NOT NULL DEFAULT '0' COMMENT '发票类型，1为普通发票，2为专用发票',
  `note` varchar(256) DEFAULT NULL COMMENT '客户备注',
  `status` int(4) DEFAULT NULL COMMENT '状态，1为临时登录，2为正式登录，其他为无效',
  `res01` varchar(10) DEFAULT NULL COMMENT '预备项目1',
  `res02` varchar(10) DEFAULT NULL COMMENT '预备项目2',
  `res03` varchar(10) DEFAULT NULL COMMENT '预备项目3',
  `res04` varchar(10) DEFAULT NULL COMMENT '预备项目4',
  `res05` varchar(10) DEFAULT NULL COMMENT '预备项目5',
  `res06` varchar(10) DEFAULT NULL COMMENT '预备项目6',
  `res07` varchar(10) DEFAULT NULL COMMENT '预备项目7',
  `res08` varchar(10) DEFAULT NULL COMMENT '预备项目8',
  `res09` varchar(50) DEFAULT NULL COMMENT '预备项目9',
  `res10` varchar(200) DEFAULT NULL COMMENT '预备项目10',
  `createuid` varchar(32) DEFAULT NULL COMMENT '创建者ID',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuid` varchar(32) DEFAULT NULL COMMENT '更新者ID',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=100021 DEFAULT CHARSET=utf8;

/*Data for the table `otb_customer` */

LOCK TABLES `otb_customer` WRITE;

insert  into `otb_customer`(`customerid`,`customeremail`,`belongto`,`password`,`companycn`,`companyen`,`department`,`name`,`postcode`,`address`,`tell`,`companycn2`,`companyen2`,`department2`,`name2`,`postcode2`,`address2`,`tell2`,`paytype`,`accounttype`,`companytax`,`accountbank`,`accountid`,`receipttype`,`note`,`status`,`res01`,`res02`,`res03`,`res04`,`res05`,`res06`,`res07`,`res08`,`res09`,`res10`,`createuid`,`createdate`,`updateuid`,`updatedate`) values (100020,'liuqiangli@163.com',NULL,'b59c67bf196a4758191e42f76670ceba','上海古镇','SH.CHUWA','市场','刘小小','201323','浦东新区','45367823','345','werwe','wer','werw','33333','retret','ewrwerw',1,0,NULL,NULL,NULL,0,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'web','2016-09-01 16:25:47','100020','2016-09-04 09:30:17');

UNLOCK TABLES;

/*Table structure for table `otb_order` */

DROP TABLE IF EXISTS `otb_order`;

CREATE TABLE `otb_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordercode` varchar(32) DEFAULT NULL COMMENT '订单号，逻辑主键',
  `customerid` int(11) DEFAULT NULL COMMENT '线上客户ID',
  `amount` decimal(11,2) DEFAULT NULL COMMENT '总金额',
  `taxamount` decimal(11,2) DEFAULT NULL COMMENT '总金额含税',
  `deliverydate` datetime DEFAULT NULL COMMENT '交期日',
  `cashdate` decimal(10,0) DEFAULT NULL COMMENT '付款日',
  `bank` varchar(32) DEFAULT NULL COMMENT '收款银行',
  `bankaccount` varchar(32) DEFAULT NULL COMMENT '收款银行帐号',
  `receive` varchar(32) DEFAULT NULL COMMENT '收货人',
  `receivecode` varchar(16) DEFAULT NULL COMMENT '收货邮编',
  `receivetell` varchar(32) DEFAULT NULL COMMENT '收货人电话',
  `receiveaddress` varchar(128) DEFAULT NULL COMMENT '收货地址',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  `status` int(4) DEFAULT NULL COMMENT '10新建，20交期确认，30交期回复，40下单成功，50付款成功，60收款成功，70已发货，80已收货订单完成，99订单关闭',
  `res01` varchar(32) DEFAULT NULL COMMENT '备用字段1',
  `res02` varchar(32) DEFAULT NULL COMMENT '备用字段2',
  `res03` varchar(32) DEFAULT NULL COMMENT '备用字段3',
  `res04` varchar(32) DEFAULT NULL COMMENT '备用字段4',
  `res05` varchar(32) DEFAULT NULL COMMENT '备用字段5',
  `updateip` varchar(32) DEFAULT NULL COMMENT '最后操作者电脑IP',
  `createuid` varchar(32) DEFAULT NULL COMMENT '创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuid` varchar(32) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `otb_order` */

LOCK TABLES `otb_order` WRITE;

UNLOCK TABLES;

/*Table structure for table `otb_orderdetail` */

DROP TABLE IF EXISTS `otb_orderdetail`;

CREATE TABLE `otb_orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `orderid` int(11) DEFAULT NULL COMMENT '订单ID',
  `batchno` varchar(32) DEFAULT NULL COMMENT '批次号',
  `productid` int(11) DEFAULT NULL COMMENT '产品ID',
  `amount` decimal(11,2) DEFAULT NULL COMMENT '产品数量',
  `price` decimal(11,6) DEFAULT NULL COMMENT 'online销售单价',
  `taxprice` decimal(11,6) DEFAULT NULL COMMENT 'online含税单价',
  `status` int(4) DEFAULT NULL COMMENT '0无效，1有效',
  `res01` varchar(32) DEFAULT NULL COMMENT '备用字段1',
  `res02` varchar(32) DEFAULT NULL COMMENT '备用字段2',
  `res03` varchar(32) DEFAULT NULL COMMENT '备用字段3',
  `res04` varchar(32) DEFAULT NULL COMMENT '备用字段4',
  `res05` varchar(32) DEFAULT NULL COMMENT '备用字段5',
  `updateip` varchar(32) DEFAULT NULL COMMENT '最后操作者电脑IP',
  `createuid` varchar(32) DEFAULT NULL COMMENT '创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuid` varchar(32) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `otb_orderdetail` */

LOCK TABLES `otb_orderdetail` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
