/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : jiuzhou_chb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-12-20 08:39:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_user_fk` (`userid`),
  CONSTRAINT `address_user_fk` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('12', '6', '谢韦列 18320399586 广东海洋大学 海浪A603', '1');

-- ----------------------------
-- Table structure for `chatrecord`
-- ----------------------------
DROP TABLE IF EXISTS `chatrecord`;
CREATE TABLE `chatrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id 自增长',
  `userId` int(11) NOT NULL COMMENT '用户id号',
  `chatContent` varchar(500) NOT NULL COMMENT '记录每条聊天记录',
  `chatTime` datetime NOT NULL COMMENT '记录该条记录发出时间',
  `msgObject` int(2) NOT NULL COMMENT '记录发出该条消息的人（0代表客服、1代表用户）',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `chatrecord_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线客服聊天记录表，记录用户与客服聊天内容';

-- ----------------------------
-- Records of chatrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `complain`
-- ----------------------------
DROP TABLE IF EXISTS `complain`;
CREATE TABLE `complain` (
  `userid` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `orderid` bigint(20) DEFAULT NULL,
  `shopid` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `otherreason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complain_ibfk_1` (`userid`),
  KEY `complain_ibfk_2` (`orderid`),
  KEY `complain_ibfk_3` (`shopid`),
  CONSTRAINT `complain_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complain_ibfk_3` FOREIGN KEY (`shopid`) REFERENCES `shop` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complain_ibfk_4` FOREIGN KEY (`orderid`) REFERENCES `ordertable` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of complain
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `goodNumber` char(14) NOT NULL COMMENT '商品编号',
  `goodName` varchar(100) NOT NULL COMMENT '商品名称',
  `goodStyleId` int(16) NOT NULL COMMENT '商品类型表id',
  `price` double(100,1) NOT NULL COMMENT '商品价格',
  `quantity` int(100) NOT NULL COMMENT '商品数量',
  `goodPic` varchar(100) NOT NULL COMMENT '商品图片',
  `goodIntro` varchar(100) NOT NULL COMMENT '商品介绍',
  `sellState` int(10) NOT NULL DEFAULT '0' COMMENT '销售状态(0正在销售/1无)',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `goodStyleId` (`goodStyleId`),
  CONSTRAINT `goods_fk_2` FOREIGN KEY (`goodStyleId`) REFERENCES `goodsstyle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('5', '20171219111621', '煲仔饭', '32', '15.0', '22', '1317ebbb584b49f09fc528737dc584b6.jpg', '这是煲仔饭', '0', '2017-12-19 17:02:29');
INSERT INTO `goods` VALUES ('6', '20171219143114', '香辣鱿鱼', '32', '16.0', '22', '46275aa91f8049169dda44c721f7c739.jpg', '好吃香辣鱿鱼', '0', '2017-12-19 17:01:01');
INSERT INTO `goods` VALUES ('7', '20171219143209', '咸鱼茄子煲', '32', '15.0', '22', '65508cab2661482abf76ea0565122ea1.jpg', '这是咸鱼茄子煲', '0', '2017-12-19 16:55:57');
INSERT INTO `goods` VALUES ('8', '20171219143242', '猪颈肉', '32', '16.0', '1024', '8de888f6570f43b78c9e1197ba2e07e0.jpg', '这是猪颈肉', '0', '2017-12-19 16:55:41');
INSERT INTO `goods` VALUES ('9', '20171219143733', '乞丐鸡', '35', '10.0', '22', '49ab5a6eebe24d4a8ea45df17a563862.jpg', '这是乞丐鸡', '0', '2017-12-19 16:37:31');
INSERT INTO `goods` VALUES ('10', '20171219163937', '大阪套餐', '35', '22.0', '651', '00e900f769f84457a658b417352497b2.jpg', '大阪套餐特色美食', '0', '2017-12-19 16:39:37');
INSERT INTO `goods` VALUES ('11', '20171219164011', '煲仔饭经典系列', '35', '16.0', '1024', '9abcb9dd069e47b399b5328bb881d9e4.jpg', '这是煲仔饭经典系列', '0', '2017-12-19 16:40:11');
INSERT INTO `goods` VALUES ('12', '20171219164117', '尖椒烤鱼', '37', '18.5', '520', 'a0da42dc8f704b489df921b9338875e8.jpg', '这是尖椒烤鱼', '0', '2017-12-19 16:41:17');
INSERT INTO `goods` VALUES ('13', '20171219164550', '羊肉卷', '36', '22.0', '222', '22447ebe0df6494eb3da6072b0d9e84f.jpg', '这是羊肉卷', '0', '2017-12-19 16:45:50');
INSERT INTO `goods` VALUES ('14', '20171219164728', '万花筒', '39', '22.0', '111', '9617e5e349cf41c888e093d0491fe316.jpg', '这是万花筒', '0', '2017-12-19 16:47:28');
INSERT INTO `goods` VALUES ('15', '20171219164831', '百味炖鸡', '36', '19.0', '143', '333bd5410ed44cc6ad3c4dbe720f9aa0.jpg', '这是百味炖鸡', '0', '2017-12-19 16:48:31');
INSERT INTO `goods` VALUES ('16', '20171219165213', '白丹早餐', '38', '15.0', '222', '7bd28e5f7f044c8d85506a5a92f53fb9.jpg', '这是白丹早餐', '0', '2017-12-19 16:52:13');

-- ----------------------------
-- Table structure for `goodsstyle`
-- ----------------------------
DROP TABLE IF EXISTS `goodsstyle`;
CREATE TABLE `goodsstyle` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `shopId` int(16) NOT NULL COMMENT '商店id',
  `styleName` varchar(50) NOT NULL COMMENT '类型名称',
  `styleDesc` varchar(500) DEFAULT NULL COMMENT '类型描述',
  PRIMARY KEY (`id`),
  KEY `shopId` (`shopId`),
  CONSTRAINT `goodsstyle_ibfk_1` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='商品类型表';

-- ----------------------------
-- Records of goodsstyle
-- ----------------------------
INSERT INTO `goodsstyle` VALUES ('32', '11', '快餐', '');
INSERT INTO `goodsstyle` VALUES ('33', '11', '小吃', '');
INSERT INTO `goodsstyle` VALUES ('34', '11', '配菜', '');
INSERT INTO `goodsstyle` VALUES ('35', '12', '快餐', '');
INSERT INTO `goodsstyle` VALUES ('36', '13', '快餐', '');
INSERT INTO `goodsstyle` VALUES ('37', '12', '特色美食', '');
INSERT INTO `goodsstyle` VALUES ('38', '13', '特色美食', '');
INSERT INTO `goodsstyle` VALUES ('39', '13', '小吃', '');

-- ----------------------------
-- Table structure for `manage`
-- ----------------------------
DROP TABLE IF EXISTS `manage`;
CREATE TABLE `manage` (
  `manageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `manageName` varchar(20) NOT NULL COMMENT '管理员登录账户',
  `managePassword` varchar(20) NOT NULL COMMENT '管理员登录密码',
  PRIMARY KEY (`manageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员的属性';

-- ----------------------------
-- Records of manage
-- ----------------------------

-- ----------------------------
-- Table structure for `manageroperation`
-- ----------------------------
DROP TABLE IF EXISTS `manageroperation`;
CREATE TABLE `manageroperation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `operation` varchar(500) NOT NULL COMMENT '管理员id',
  `operaDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作类型id',
  `operaRole` int(11) NOT NULL COMMENT '操作的时间',
  PRIMARY KEY (`id`),
  KEY `manageId` (`operation`),
  KEY `operaStyleId` (`operaDate`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='用来记录管理员的操作';

-- ----------------------------
-- Records of manageroperation
-- ----------------------------
INSERT INTO `manageroperation` VALUES ('31', '新增商家类型为快餐的操作', '2017-12-19 10:46:12', '1');
INSERT INTO `manageroperation` VALUES ('32', '新增商家类型为小吃店的操作', '2017-12-19 10:46:12', '1');
INSERT INTO `manageroperation` VALUES ('33', '新增商家类型为西餐的操作', '2017-12-19 10:46:12', '1');
INSERT INTO `manageroperation` VALUES ('34', '审核商家id为11的通过操作', '2017-12-19 11:10:23', '1');

-- ----------------------------
-- Table structure for `maninfo`
-- ----------------------------
DROP TABLE IF EXISTS `maninfo`;
CREATE TABLE `maninfo` (
  `infoId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `manageId` int(11) NOT NULL COMMENT '管理员id',
  `infomation` varchar(500) NOT NULL COMMENT '发送的消息',
  `sendObject` int(11) NOT NULL COMMENT '发送的对象类型',
  `sendId` int(11) NOT NULL COMMENT '发送的对象id编号',
  `infoDate` datetime NOT NULL COMMENT '发送的时间',
  PRIMARY KEY (`infoId`),
  KEY `manageId` (`manageId`),
  CONSTRAINT `maninfo_ibfk_1` FOREIGN KEY (`manageId`) REFERENCES `manage` (`manageId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用来记录管理员对用户或商家发送的消息';

-- ----------------------------
-- Records of maninfo
-- ----------------------------

-- ----------------------------
-- Table structure for `orderanalyse`
-- ----------------------------
DROP TABLE IF EXISTS `orderanalyse`;
CREATE TABLE `orderanalyse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopName` varchar(200) DEFAULT NULL,
  `shopStyleName` varchar(200) DEFAULT NULL,
  `goodsName` varchar(200) DEFAULT NULL,
  `goodsStyleName` varchar(200) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `payTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `goodsMoney` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderanalyse
-- ----------------------------
INSERT INTO `orderanalyse` VALUES ('15', '新旧程度', '快餐', '煲仔饭', '小吃', '1', '2017-12-19 13:53:42', '15');
INSERT INTO `orderanalyse` VALUES ('16', '额无法登v', '快餐', '过任务', '防水层', '1', '2017-12-18 13:54:30', '20');

-- ----------------------------
-- Table structure for `ordergoods`
-- ----------------------------
DROP TABLE IF EXISTS `ordergoods`;
CREATE TABLE `ordergoods` (
  `orderId` bigint(16) DEFAULT NULL COMMENT '订单ID',
  `goodsName` varchar(20) DEFAULT NULL COMMENT '商品名',
  `goodsQuatity` int(10) DEFAULT NULL COMMENT '商品数量',
  `goodsMoney` double(10,2) DEFAULT NULL COMMENT '商品金额',
  KEY `orderId` (`orderId`),
  CONSTRAINT `ordergoods_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `ordertable` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- ----------------------------
-- Records of ordergoods
-- ----------------------------
INSERT INTO `ordergoods` VALUES ('1513658068400', '煲仔饭', '1', '15.00');
INSERT INTO `ordergoods` VALUES ('1513658211017', '煲仔饭', '1', '15.00');
INSERT INTO `ordergoods` VALUES ('1513658669858', '煲仔饭', '1', '15.00');
INSERT INTO `ordergoods` VALUES ('1513658986073', '煲仔饭', '1', '15.00');
INSERT INTO `ordergoods` VALUES ('1513660130341', '煲仔饭', '1', '15.00');
INSERT INTO `ordergoods` VALUES ('1513665399999', '猪颈肉', '1', '16.00');
INSERT INTO `ordergoods` VALUES ('1513665399999', '香辣鱿鱼', '1', '16.00');
INSERT INTO `ordergoods` VALUES ('1513665685508', '番茄炒蛋111', '1', '10.00');
INSERT INTO `ordergoods` VALUES ('1513666239486', '猪颈肉', '1', '16.00');
INSERT INTO `ordergoods` VALUES ('1513666239486', '咸鱼茄子煲', '1', '15.00');
INSERT INTO `ordergoods` VALUES ('1513666564566', '咸鱼茄子煲', '1', '15.00');
INSERT INTO `ordergoods` VALUES ('1513666655816', '煲仔饭', '1', '15.00');
INSERT INTO `ordergoods` VALUES ('1513666814968', '咸鱼茄子煲', '1', '15.00');
INSERT INTO `ordergoods` VALUES ('1513666983100', '咸鱼茄子煲', '1', '15.00');

-- ----------------------------
-- Table structure for `ordertable`
-- ----------------------------
DROP TABLE IF EXISTS `ordertable`;
CREATE TABLE `ordertable` (
  `id` bigint(16) NOT NULL COMMENT '订单ID',
  `userId` int(11) NOT NULL COMMENT '用户ID ',
  `shopId` int(11) NOT NULL COMMENT '商家ID ',
  `shopName` varchar(20) DEFAULT NULL COMMENT '商家名',
  `arriveTime` varchar(20) DEFAULT NULL COMMENT '送达时间',
  `deliverMethod` varchar(20) DEFAULT NULL COMMENT '配送方式',
  `userAddress` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `payMethod` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `createTime` datetime DEFAULT NULL COMMENT '下单时间',
  `orderState` int(10) DEFAULT NULL COMMENT '订单状态(0待接收/1已接收/2待退单/3已退单)',
  `totalMoney` double(10,2) DEFAULT NULL COMMENT '付款金额',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `shopService` varchar(10) DEFAULT '0',
  `deliverSpeed` varchar(10) DEFAULT NULL,
  `evaluateFood` varchar(10) DEFAULT '0',
  `shopPhone` varchar(20) DEFAULT NULL,
  `shopcartid` int(11) DEFAULT NULL,
  `shopRemark` varchar(255) DEFAULT NULL,
  `shoppic` varchar(255) DEFAULT NULL,
  `usercomment` varchar(500) DEFAULT NULL COMMENT '用户评论',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `shopId` (`shopId`),
  KEY `shopcartid` (`shopcartid`),
  CONSTRAINT `ordertable_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `ordertable_ibfk_2` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `ordertable_ibfk_3` FOREIGN KEY (`shopcartid`) REFERENCES `shopcart` (`shopcartId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of ordertable
-- ----------------------------
INSERT INTO `ordertable` VALUES ('1513658068400', '6', '11', '小吃货店', '19:10-19:30', '第三方', '谢韦列 18320399586 广东海洋大学 海浪A603', '在线支付', '2017-12-19 12:34:28', '1', '15.00', '', '0', null, '0', '13598464684', '71', null, '3756c80bd4144fe2a6eb3d90b5e5c099.png', null);
INSERT INTO `ordertable` VALUES ('1513658211017', '6', '11', '小吃货店', '13:30-13:50', '第三方配送', '谢韦列 18320399586 广东海洋大学 海浪A603', '在线支付', '2017-12-19 12:36:51', '3', '15.00', '', '0', null, '0', '13598464684', '72', null, '3756c80bd4144fe2a6eb3d90b5e5c099.png', null);
INSERT INTO `ordertable` VALUES ('1513658669858', '6', '11', '小吃货店', '19:10-19:30', '第三方', '谢韦列 18320399586 广东海洋大学 海浪A603', '在线支付', '2017-12-19 12:44:29', '9', '15.00', '', '0', null, '0', '13598464684', '73', null, '3756c80bd4144fe2a6eb3d90b5e5c099.png', null);
INSERT INTO `ordertable` VALUES ('1513658986073', '6', '11', '小吃货店', '18:50-19:10', '第三方', '谢韦列 18320399586 广东海洋大学 海浪A603', '在线支付', '2017-12-19 12:49:46', '4', '15.00', '', '0', null, '0', '13598464684', '74', null, '3756c80bd4144fe2a6eb3d90b5e5c099.png', null);
INSERT INTO `ordertable` VALUES ('1513660130341', '6', '11', '小吃货店', '', '第三方配送', '谢韦列 18320399586 广东海洋大学 海浪A603', '在线支付', '2017-12-19 13:08:50', '5', '15.00', '', '0', null, '0', '13598464684', '76', null, '3756c80bd4144fe2a6eb3d90b5e5c099.png', null);
INSERT INTO `ordertable` VALUES ('1513665399999', '6', '11', '小吃货店', '16:30-16:50', '第三方', '谢韦列 18320399586 广东海洋大学 海浪A603', '在线支付', '2017-12-19 14:36:39', '3', '32.00', '', '0', null, '0', '13598464684', '77', null, '3756c80bd4144fe2a6eb3d90b5e5c099.png', null);
INSERT INTO `ordertable` VALUES ('1513665685508', '6', '12', '大碗饭', '13:10-13:30', '第三方', '谢韦列 18320399586 广东海洋大学 海浪A603', '在线支付', '2017-12-19 14:41:25', '9', '10.00', '速度快点', '0', null, '0', '13498616465', '78', null, '94041bf8165b40a19c5549d9baca3bb8.jpg', null);
INSERT INTO `ordertable` VALUES ('1513666239486', '6', '11', '小吃货店', '18:50-19:10', '第三方', '谢韦列 18320399586 广东海洋大学 海浪A603', '在线支付', '2017-12-19 14:50:39', '9', '31.00', '', '0', null, '0', '13598464684', '79', null, '3756c80bd4144fe2a6eb3d90b5e5c099.png', null);
INSERT INTO `ordertable` VALUES ('1513666564566', '6', '11', '小吃货店', '18:30-18:50', '第三方', '谢韦列 18320399586 广东海洋大学 海浪A603', '在线支付', '2017-12-19 14:56:04', '1', '15.00', '', '0', null, '0', '13598464684', '80', null, '3756c80bd4144fe2a6eb3d90b5e5c099.png', null);
INSERT INTO `ordertable` VALUES ('1513666655816', '6', '11', '小吃货店', '', '第三方配送', '谢韦列 18320399586 广东海洋大学 海浪A603', '在线支付', '2017-12-19 14:57:35', '8', '15.00', '', '3', '47分钟', '3.5', '13598464684', '81', null, '3756c80bd4144fe2a6eb3d90b5e5c099.png', '481631163');
INSERT INTO `ordertable` VALUES ('1513666814968', '6', '11', '小吃货店', '18:50-19:10', '第三方', '谢韦列 18320399586 广东海洋大学 海浪A603', '在线支付', '2017-12-19 15:00:14', '9', '15.00', '', '0', null, '0', '13598464684', '82', null, '3756c80bd4144fe2a6eb3d90b5e5c099.png', null);
INSERT INTO `ordertable` VALUES ('1513666983100', '6', '11', '小吃货店', '18:30-18:50', '第三方', '谢韦列 18320399586 广东海洋大学 海浪A603', '在线支付', '2017-12-19 15:03:03', '9', '15.00', '', '0', null, '0', '13598464684', '83', null, '3756c80bd4144fe2a6eb3d90b5e5c099.png', null);

-- ----------------------------
-- Table structure for `paymethod`
-- ----------------------------
DROP TABLE IF EXISTS `paymethod`;
CREATE TABLE `paymethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id 自增长',
  `payMethod` varchar(50) NOT NULL COMMENT '支付方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付方式表，根据payMethod字段找到对应的支付方式';

-- ----------------------------
-- Records of paymethod
-- ----------------------------

-- ----------------------------
-- Table structure for `shop`
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `shopNumber` char(14) NOT NULL COMMENT '商店编号',
  `shopName` varchar(100) NOT NULL COMMENT '商店名',
  `storerId` int(16) NOT NULL COMMENT '商家id',
  `shopOwner` varchar(100) NOT NULL COMMENT '商店合法代表人',
  `address` varchar(100) NOT NULL COMMENT '商店地址',
  `longitude` double(50,6) NOT NULL COMMENT '地址经度',
  `latitude` double(50,6) NOT NULL COMMENT '地址纬度',
  `telephone` varchar(50) NOT NULL COMMENT '联系手机',
  `shopPic` varchar(100) DEFAULT NULL COMMENT '商店照片',
  `announce` varchar(300) DEFAULT NULL COMMENT '商店公告',
  `businessTime` varchar(200) DEFAULT NULL COMMENT '营业时间',
  `startPrice` double(50,1) DEFAULT NULL COMMENT '起步价',
  `deliveryCost` double(50,1) DEFAULT NULL COMMENT '配送费',
  `shopScore` double(10,1) DEFAULT NULL COMMENT '商店评分',
  `openState` int(10) NOT NULL DEFAULT '0' COMMENT '营业状态(0营业/1关闭)',
  `auditState` int(10) NOT NULL DEFAULT '0' COMMENT '审核状态(0待审核/1已审核/2审核不通过)',
  `shopStyleId` int(16) NOT NULL COMMENT '商店类型表id',
  `serviceScope` int(50) NOT NULL COMMENT '服务范围(公里)',
  PRIMARY KEY (`id`),
  KEY `storerId` (`storerId`),
  KEY `shopStyleId` (`shopStyleId`),
  CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`storerId`) REFERENCES `storeraccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shop_ibfk_2` FOREIGN KEY (`shopStyleId`) REFERENCES `shopstyle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='商店信息表';

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('11', '20171219000001', '小吃货店', '22', 'BD', '湛江市麻章区广东海洋大学', '110.307239', '21.157362', '13598464684', '3756c80bd4144fe2a6eb3d90b5e5c099.png', '这是小次货店，订购请联系13598464684', '11:00-13:00|16:30-18:00', '8.0', '0.0', '0.0', '0', '1', '3', '5');
INSERT INTO `shop` VALUES ('12', '20171219000002', '大碗饭', '23', '张三', '湛江市麻章区广东海洋大学', '110.307239', '21.157362', '13498616465', '94041bf8165b40a19c5549d9baca3bb8.jpg', '这是大碗饭', '11:00-13:00|16:30-18:00', '9.5', '0.0', '0.0', '0', '1', '3', '8');
INSERT INTO `shop` VALUES ('13', '20171219000003', '李大哥美食', '24', '李四', '湛江市麻章区广东海洋大学', '110.307239', '21.157362', '15651496065', '68b2d123ad264e1db5a0bd1202c776f3.jpg', '这是李大哥美食，订购请联系15651496065', '11:00-13:00|16:30-18:00', '8.5', '0.0', null, '0', '0', '3', '8');

-- ----------------------------
-- Table structure for `shopanalyse`
-- ----------------------------
DROP TABLE IF EXISTS `shopanalyse`;
CREATE TABLE `shopanalyse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopName` varchar(200) DEFAULT NULL,
  `styleName` varchar(200) DEFAULT NULL,
  `total` double(11,0) DEFAULT NULL COMMENT '当天销售最多商品的商家的商品数',
  `payTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopanalyse
-- ----------------------------

-- ----------------------------
-- Table structure for `shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `shopcartId` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL,
  `shopName` varchar(255) DEFAULT NULL,
  `totalPrice` double(10,2) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`shopcartId`),
  KEY `shopId` (`shopId`),
  KEY `userId` (`userId`),
  CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopcart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcart
-- ----------------------------
INSERT INTO `shopcart` VALUES ('71', '11', '小吃货店', '15.00', '6');
INSERT INTO `shopcart` VALUES ('72', '11', '小吃货店', '15.00', '6');
INSERT INTO `shopcart` VALUES ('73', '11', '小吃货店', '15.00', '6');
INSERT INTO `shopcart` VALUES ('74', '11', '小吃货店', '15.00', '6');
INSERT INTO `shopcart` VALUES ('75', '11', '小吃货店', '15.00', '6');
INSERT INTO `shopcart` VALUES ('76', '11', '小吃货店', '15.00', '6');
INSERT INTO `shopcart` VALUES ('77', '11', '小吃货店', '32.00', '6');
INSERT INTO `shopcart` VALUES ('78', '12', '大碗饭', '10.00', '6');
INSERT INTO `shopcart` VALUES ('79', '11', '小吃货店', '31.00', '6');
INSERT INTO `shopcart` VALUES ('80', '11', '小吃货店', '15.00', '6');
INSERT INTO `shopcart` VALUES ('81', '11', '小吃货店', '15.00', '6');
INSERT INTO `shopcart` VALUES ('82', '11', '小吃货店', '15.00', '6');
INSERT INTO `shopcart` VALUES ('83', '11', '小吃货店', '15.00', '6');

-- ----------------------------
-- Table structure for `shopcartlist`
-- ----------------------------
DROP TABLE IF EXISTS `shopcartlist`;
CREATE TABLE `shopcartlist` (
  `shopcartId` int(11) NOT NULL,
  `goodsQuatity` int(11) DEFAULT NULL,
  `goodsName` varchar(255) DEFAULT NULL,
  `goodsPrice` double(10,2) DEFAULT NULL,
  KEY `shopcartId` (`shopcartId`),
  CONSTRAINT `shopcartlist_ibfk_1` FOREIGN KEY (`shopcartId`) REFERENCES `shopcart` (`shopcartId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcartlist
-- ----------------------------
INSERT INTO `shopcartlist` VALUES ('71', '1', '煲仔饭', '15.00');
INSERT INTO `shopcartlist` VALUES ('72', '1', '煲仔饭', '15.00');
INSERT INTO `shopcartlist` VALUES ('73', '1', '煲仔饭', '15.00');
INSERT INTO `shopcartlist` VALUES ('74', '1', '煲仔饭', '15.00');
INSERT INTO `shopcartlist` VALUES ('75', '1', '煲仔饭', '15.00');
INSERT INTO `shopcartlist` VALUES ('76', '1', '煲仔饭', '15.00');
INSERT INTO `shopcartlist` VALUES ('77', '1', '猪颈肉', '16.00');
INSERT INTO `shopcartlist` VALUES ('77', '1', '香辣鱿鱼', '16.00');
INSERT INTO `shopcartlist` VALUES ('78', '1', '番茄炒蛋111', '10.00');
INSERT INTO `shopcartlist` VALUES ('79', '1', '猪颈肉', '16.00');
INSERT INTO `shopcartlist` VALUES ('79', '1', '咸鱼茄子煲', '15.00');
INSERT INTO `shopcartlist` VALUES ('80', '1', '咸鱼茄子煲', '15.00');
INSERT INTO `shopcartlist` VALUES ('81', '1', '煲仔饭', '15.00');
INSERT INTO `shopcartlist` VALUES ('82', '1', '咸鱼茄子煲', '15.00');
INSERT INTO `shopcartlist` VALUES ('83', '1', '咸鱼茄子煲', '15.00');

-- ----------------------------
-- Table structure for `shopcomment`
-- ----------------------------
DROP TABLE IF EXISTS `shopcomment`;
CREATE TABLE `shopcomment` (
  `commentShopId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `shopId` int(11) NOT NULL COMMENT '商家id',
  `shopComment` varchar(500) NOT NULL COMMENT '评论内容',
  `commentDate` datetime NOT NULL COMMENT '评论的时间',
  PRIMARY KEY (`commentShopId`),
  KEY `shopId_for_key` (`shopId`),
  CONSTRAINT `shopId_for_key` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用来记录商家的评论信息';

-- ----------------------------
-- Records of shopcomment
-- ----------------------------

-- ----------------------------
-- Table structure for `shopdata`
-- ----------------------------
DROP TABLE IF EXISTS `shopdata`;
CREATE TABLE `shopdata` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `shopId` int(16) NOT NULL COMMENT '商店id',
  `outPic` varchar(100) NOT NULL COMMENT '商店正面照片',
  `inPic` varchar(100) NOT NULL COMMENT '商店内部照片',
  `shopLicense` varchar(100) NOT NULL COMMENT '营业执照',
  `ownerId` varchar(100) NOT NULL COMMENT '法定代表人身份证号码',
  `ownerIdUpPic` varchar(100) NOT NULL COMMENT '身份证正面照',
  `ownerIdDownPic` varchar(100) NOT NULL COMMENT '身份证反面照',
  `serviceLicense` varchar(100) NOT NULL COMMENT '餐饮服务许可证照片',
  `advise` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shopId` (`shopId`),
  CONSTRAINT `shopdata_ibfk_1` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商店审核资料表';

-- ----------------------------
-- Records of shopdata
-- ----------------------------
INSERT INTO `shopdata` VALUES ('6', '11', 'ac7a3c4fc5964fda90c15c4e42b6a9e6.png', '60ce38f9968c4c1294fa60ba04b122ea.png', 'c4af4d36a5bd453e8b7ca00f3e565a6f.png', '11346815318513546865515', '03ce4a51f9e4434bbb0987c3a3220bb0.png', '1d5ec8fa7e734a4fb7309447a59fcf4b.png', 'b60718de29bd48cf8f07909a7ac08be5.png', null);
INSERT INTO `shopdata` VALUES ('7', '12', 'd9cc4dd975e54556993a1d349096819c.png', 'd5d0ced341f740ad889ef51fd8e9d944.png', '7d2ea1fe15ea497a92989a6b610e80fa.png', '136849846564600000000', '1064ab418bd7432e8bbbf00f4c1b2432.png', '5c2cd9aa28704dc087653801d96bd797.png', '7335d3da436145bb9f83399c6621ce92.png', null);
INSERT INTO `shopdata` VALUES ('8', '13', '6a92f9685e374454887b920653a0be7a.jpg', 'f3bd9851d6304ae9a316618f34e2821c.jpg', '8c1e46b9a20840ccacc20f614fef314d.jpg', '11346815318513546865515', 'ba0bc37ce17c4c6d9dfdfd60f99efb05.jpg', '201deb85cb3248b2907869df8d64188d.jpg', 'c9fd74e0b9704b64b00c415a1ed4ee95.jpg', null);

-- ----------------------------
-- Table structure for `shopstyle`
-- ----------------------------
DROP TABLE IF EXISTS `shopstyle`;
CREATE TABLE `shopstyle` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `styleName` varchar(50) NOT NULL COMMENT '类型名称',
  `styleDesc` varchar(500) DEFAULT NULL COMMENT '类型描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商家类型表';

-- ----------------------------
-- Records of shopstyle
-- ----------------------------
INSERT INTO `shopstyle` VALUES ('3', '快餐', '快餐');
INSERT INTO `shopstyle` VALUES ('4', '小吃店', '小吃');
INSERT INTO `shopstyle` VALUES ('5', '西餐', '西餐');

-- ----------------------------
-- Table structure for `storeraccount`
-- ----------------------------
DROP TABLE IF EXISTS `storeraccount`;
CREATE TABLE `storeraccount` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `storerNumber` char(16) NOT NULL COMMENT '用户编号',
  `storerName` varchar(100) DEFAULT NULL COMMENT '商家名',
  `storerRegistTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `password` varchar(100) DEFAULT '000000' COMMENT '密码',
  `storerPic` varchar(100) DEFAULT NULL COMMENT '商家头像',
  `storerMoney` double(50,2) DEFAULT '0.00' COMMENT '商家资金，默认为0.0',
  `accountState` int(10) NOT NULL DEFAULT '0' COMMENT '账号状态(0正常/1冻结)',
  `telephone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商家账号信息表';

-- ----------------------------
-- Records of storeraccount
-- ----------------------------
INSERT INTO `storeraccount` VALUES ('22', '2017121900000001', 'BD', '2017-12-19 21:48:56', '', '123456', '22e1427c013d43ec9eea782f058c0594.png', '77.00', '0', '15816039724');
INSERT INTO `storeraccount` VALUES ('23', '2017121900000002', '张三', '2017-12-19 14:34:09', '16984798654@qq.com', '000000', 'c0d0562991b34b21acdf0b2201ebaa25.jpg', '0.00', '0', '13498616465');
INSERT INTO `storeraccount` VALUES ('24', '2017121900000003', '李四', '2017-12-19 16:18:31', '24616584@qq.com', '000000', 'e38ef2140ad544c3a29d4a76acaa7294.jpg', '0.00', '0', '15889648566');

-- ----------------------------
-- Table structure for `storermessage`
-- ----------------------------
DROP TABLE IF EXISTS `storermessage`;
CREATE TABLE `storermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storerId` int(11) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `messageDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `type` int(1) unsigned zerofill DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storermessage
-- ----------------------------
INSERT INTO `storermessage` VALUES ('5', '22', '你个小西瓜', '2017-12-19 13:45:02', '0');
INSERT INTO `storermessage` VALUES ('6', '22', '666666', '2017-12-19 13:45:02', '0');
INSERT INTO `storermessage` VALUES ('7', '22', '66666', '2017-12-19 13:52:25', '0');

-- ----------------------------
-- Table structure for `thirdpayment`
-- ----------------------------
DROP TABLE IF EXISTS `thirdpayment`;
CREATE TABLE `thirdpayment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id 自增长',
  `userId` int(11) NOT NULL COMMENT '用户名',
  `payMethod` int(11) NOT NULL COMMENT '支付方式',
  `payId` varchar(50) NOT NULL COMMENT '支付帐号',
  PRIMARY KEY (`id`),
  KEY `thirdpayment_ibfk_1` (`payMethod`),
  KEY `userId` (`userId`),
  CONSTRAINT `thirdpayment_ibfk_1` FOREIGN KEY (`payMethod`) REFERENCES `paymethod` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `thirdpayment_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方支付表，添加支付方式、更改支付方式在这个表增加、修改一条记录';

-- ----------------------------
-- Records of thirdpayment
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增长',
  `username` varchar(255) NOT NULL COMMENT '用户名，唯一',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) NOT NULL COMMENT '手机号码',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像图片存放的地址',
  `registertime` datetime DEFAULT NULL COMMENT '注册时间',
  `userstatus` int(11) DEFAULT NULL COMMENT '用户是否登录状态(0表示未登录，1表示已登录)',
  `userfreeze` int(11) DEFAULT NULL COMMENT '用户是否被冻结状态（0表示未被冻结，1表示已冻结）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户表，新注册的普通用户就会在此表增加一条记录';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('6', '谢韦列', '123', null, null, null, '18320399586', 'a1985dfe-b270-4024-8aec-059ce35c995c.jpg', '2017-12-19 11:01:56', '1', null);

-- ----------------------------
-- Table structure for `usercomment`
-- ----------------------------
DROP TABLE IF EXISTS `usercomment`;
CREATE TABLE `usercomment` (
  `commentUserId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `shopId` int(11) NOT NULL COMMENT '商家id',
  `userComment` varchar(500) NOT NULL COMMENT '评论内容',
  `commentDate` datetime NOT NULL COMMENT '评论的时间',
  PRIMARY KEY (`commentUserId`),
  KEY `userId_forkey` (`userId`),
  KEY `shop_forkey` (`shopId`),
  CONSTRAINT `shop_forkey` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `userId_forkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用来记录商家下用户的评论信息';

-- ----------------------------
-- Records of usercomment
-- ----------------------------

-- ----------------------------
-- Table structure for `usermessage`
-- ----------------------------
DROP TABLE IF EXISTS `usermessage`;
CREATE TABLE `usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `messageDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tyle` int(1) unsigned zerofill DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usermessage
-- ----------------------------

-- ----------------------------
-- Table structure for `usertest`
-- ----------------------------
DROP TABLE IF EXISTS `usertest`;
CREATE TABLE `usertest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usertest
-- ----------------------------
DROP TRIGGER IF EXISTS `goodNumber_before_insert`;
DELIMITER ;;
CREATE TRIGGER `goodNumber_before_insert` BEFORE INSERT ON `goods` FOR EACH ROW BEGIN     
     DECLARE new_bh VARCHAR(14);
     SET new_bh = DATE_FORMAT(current_timestamp(),'%Y%m%d%H%i%s');
     SET NEW.goodNumber = new_bh;
 END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `shopNumber_before_insert`;
DELIMITER ;;
CREATE TRIGGER `shopNumber_before_insert` BEFORE INSERT ON `shop` FOR EACH ROW BEGIN     
     DECLARE dt CHAR(8);
     DECLARE bh_id CHAR(14);
     DECLARE number INT;
     DECLARE new_bh VARCHAR(14);

     SET dt = DATE_FORMAT(CURDATE(),'%Y%m%d');

     SELECT
         MAX(shopNumber) INTO bh_id
     FROM shop;

     IF bh_id = '' OR bh_id IS NULL OR bh_id NOT LIKE CONCAT(dt,'%') THEN
         SET new_bh = CONCAT(dt,'000001');
     ELSE
         SET number = RIGHT(bh_id,6) + 1;
         SET new_bh =  RIGHT(CONCAT('000000',number),6);
         SET new_bh=CONCAT(dt,new_bh);
     END IF;

     SET NEW.shopNumber = new_bh;
 END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `storerNumber_BEFORE_INSERT`;
DELIMITER ;;
CREATE TRIGGER `storerNumber_BEFORE_INSERT` BEFORE INSERT ON `storeraccount` FOR EACH ROW BEGIN     
     DECLARE dt CHAR(8);
     DECLARE bh_id CHAR(16);
     DECLARE number INT;
     DECLARE new_bh VARCHAR(16);

     SET dt = DATE_FORMAT(CURDATE(),'%Y%m%d');

     SELECT
         MAX(storerNumber) INTO bh_id
     FROM storeraccount;

     IF bh_id = '' OR bh_id IS NULL  OR bh_id NOT LIKE CONCAT(dt,'%') THEN
         SET new_bh = CONCAT(dt,'00000001');
     ELSE
         SET number = RIGHT(bh_id,8) + 1;
         SET new_bh =  RIGHT(CONCAT('00000000',number),8);
         SET new_bh=CONCAT(dt,new_bh);
     END IF;

     SET NEW.storerNumber = new_bh;
 END
;;
DELIMITER ;
