/*
Navicat MySQL Data Transfer

Source Server         : 127
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : portal

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-05-15 23:18:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_user`;
CREATE TABLE `t_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `nick_name` varchar(20) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(4) NOT NULL COMMENT '性别 0：保密；1：男；2：女',
  `update_time` timestamp NULL DEFAULT '2012-05-08 11:53:35',
  `create_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  `status` int(11) NOT NULL COMMENT '状态：0 停用；0x1 启用；0x2：禁止登录（密码错误次数过多，一定时间内禁止登录）',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `last_login_ip` varchar(18) DEFAULT NULL COMMENT '最后登录Ip',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `office_phone` varchar(18) DEFAULT NULL COMMENT '办公电话',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_t_base_user_email` (`email`),
  UNIQUE KEY `idx_t_base_nick_name` (`nick_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='后台管理用户';

-- ----------------------------
-- Records of t_admin_user
-- ----------------------------
INSERT INTO `t_admin_user` VALUES ('2', 'test@test.com', '90c523f5826301fb1e4ddc6a573fbaa4', '测试', '测试', '2', '2012-08-07 15:37:13', '2012-08-07 15:35:53', '0', '测试', null, null, '13764546654', '13764546654');
INSERT INTO `t_admin_user` VALUES ('3', 'admin@admin.com', 'fd8922228b92a18e611567b3195126ac', '系统管理员', null, '1', '2016-05-15 22:51:44', '2012-08-03 17:56:47', '1', null, '127.0.0.1', '2016-05-15 22:51:44', null, '');

-- ----------------------------
-- Table structure for t_banner_ad
-- ----------------------------
DROP TABLE IF EXISTS `t_banner_ad`;
CREATE TABLE `t_banner_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `image` varchar(400) NOT NULL COMMENT '图片',
  `thumb` varchar(400) NOT NULL COMMENT '缩略图',
  `href` varchar(400) NOT NULL COMMENT '跳转链接',
  `display_index` int(11) DEFAULT '0',
  `status` int(11) NOT NULL COMMENT '状态：0 停用；1 启用；',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  `update_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_banner_ad
-- ----------------------------
INSERT INTO `t_banner_ad` VALUES ('7', '广告1', 'http://127.0.0.1/attachment/images/e5e33672ad3d92459f093b0aec94ebed.jpg', 'http://127.0.0.1/attachment/images/e5e33672ad3d92459f093b0aec94ebed_thumb.jpg', 'http://127.0.0.1/cn/', '1', '1', '', '2016-05-15 18:05:39', '2016-05-15 21:17:56');
INSERT INTO `t_banner_ad` VALUES ('8', '广告2', 'http://127.0.0.1/attachment/images/4ab6cd3e62a231adafcc2f1b5b0ed696.jpg', 'http://127.0.0.1/attachment/images/4ab6cd3e62a231adafcc2f1b5b0ed696_thumb.jpg', 'http://127.0.0.1/cn/', '2', '1', '', '2016-05-15 18:08:12', '2016-05-15 18:08:12');
INSERT INTO `t_banner_ad` VALUES ('9', '广告3', 'http://127.0.0.1/attachment/images/69794ce0cabb746ae9303761d9b91a83.jpg', 'http://127.0.0.1/attachment/images/69794ce0cabb746ae9303761d9b91a83_thumb.jpg', 'http://127.0.0.1/cn/', '3', '1', '', '2016-05-15 18:09:11', '2016-05-15 18:09:11');

-- ----------------------------
-- Table structure for t_catalog
-- ----------------------------
DROP TABLE IF EXISTS `t_catalog`;
CREATE TABLE `t_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_code` varchar(100) NOT NULL COMMENT ' 类别代码（具体名称在国际化文件中配置）',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `display_index` int(11) NOT NULL COMMENT '显示顺序',
  `status` tinyint(4) NOT NULL COMMENT '状态：0 停用， 1 启用',
  `create_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  `update_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_t_catalog_catalog_code` (`catalog_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_catalog
-- ----------------------------
INSERT INTO `t_catalog` VALUES ('1', '白酒类', '白酒类', '1', '1', '2016-05-15 20:28:13', '2016-05-15 21:18:22');
INSERT INTO `t_catalog` VALUES ('2', '法国红酒', '法国红酒', '1', '1', '2016-05-15 20:28:52', '2016-05-15 20:58:17');
INSERT INTO `t_catalog` VALUES ('3', '洋酒类', '洋酒类', '1', '1', '2016-05-15 20:30:09', '2016-05-15 20:58:32');
INSERT INTO `t_catalog` VALUES ('4', '啤酒类', '啤酒类', '1', '1', '2016-05-15 20:30:55', '2016-05-15 20:58:39');

-- ----------------------------
-- Table structure for t_demo_video
-- ----------------------------
DROP TABLE IF EXISTS `t_demo_video`;
CREATE TABLE `t_demo_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `status` int(11) NOT NULL COMMENT '状态：0 停用；1 启用；',
  `create_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  `update_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_demo_video
-- ----------------------------
INSERT INTO `t_demo_video` VALUES ('3', '在线演示视频', 'http://localhost/attachment/flash/46fe07cc586354a883cb065353f1ec60.1.flv', '1', '2012-09-04 16:31:52', '2012-09-04 16:31:52');

-- ----------------------------
-- Table structure for t_global_address
-- ----------------------------
DROP TABLE IF EXISTS `t_global_address`;
CREATE TABLE `t_global_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(5) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `postalcode` varchar(15) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '状态：0 停用；1 启用；',
  `create_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  `update_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_global_address
-- ----------------------------
INSERT INTO `t_global_address` VALUES ('1', 'cn', '广州白云区嘉禾街道彭上兴富路汇侨大厦5007', '020-36772002 440-883-1212', '020-36772002', '510000', '1', '2012-09-03 16:54:17', '2016-05-15 21:30:44');
INSERT INTO `t_global_address` VALUES ('2', 'en', '6/F, B-3 BUilding, OCT-LOFT(East Industry Area), Nanshan District, Shenzhen', '0755-33309198  0755-33309188', '0755-33309173', '518112', '0', '2012-09-03 16:57:53', '2012-09-03 17:25:28');

-- ----------------------------
-- Table structure for t_media_gallery
-- ----------------------------
DROP TABLE IF EXISTS `t_media_gallery`;
CREATE TABLE `t_media_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL COMMENT '媒体路径（相当路径或绝对路径）',
  `name` varchar(100) NOT NULL,
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0 图片；1 视频(flv)',
  `status` int(11) NOT NULL COMMENT '状态：0 停用；1 启用；',
  `create_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  `update_time` timestamp NULL DEFAULT '2012-05-08 11:53:35',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_t_media_gallery_url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='媒体库：图片、视频、Flash';

-- ----------------------------
-- Records of t_media_gallery
-- ----------------------------
INSERT INTO `t_media_gallery` VALUES ('18', 'http://127.0.0.1/attachment/images/e5e33672ad3d92459f093b0aec94ebed.jpg', '测试1', '', '0', '1', '2016-05-15 18:01:48', '2016-05-15 18:01:48');
INSERT INTO `t_media_gallery` VALUES ('19', 'http://127.0.0.1/attachment/images/4ab6cd3e62a231adafcc2f1b5b0ed696.jpg', '测试2', '', '0', '1', '2016-05-15 18:02:25', '2016-05-15 18:02:25');
INSERT INTO `t_media_gallery` VALUES ('20', 'http://127.0.0.1/attachment/images/69794ce0cabb746ae9303761d9b91a83.jpg', '测试3', '', '0', '1', '2016-05-15 18:02:37', '2016-05-15 18:02:37');
INSERT INTO `t_media_gallery` VALUES ('21', 'http://127.0.0.1/attachment/images/91f3743540841ba0dfe6cb1fc32b6c67.jpg', '分公司成立图片', '', '0', '1', '2016-05-15 21:08:45', '2016-05-15 21:08:45');
INSERT INTO `t_media_gallery` VALUES ('29', 'http://127.0.0.1/attachment/images/dd970bb344b75eb379305b533806b5b4.jpg', '诗雅图', '', '0', '1', '2016-05-15 22:53:13', '2016-05-15 22:53:13');
INSERT INTO `t_media_gallery` VALUES ('30', 'http://127.0.0.1/attachment/images/fe022d5b3d660b66d86a0668e0a5eac2.jpg', '诗雅图1', '', '0', '1', '2016-05-15 22:54:11', '2016-05-15 22:54:11');
INSERT INTO `t_media_gallery` VALUES ('31', 'http://127.0.0.1/attachment/images/fb442ec4bc5c78cf00341d7f325b2822.jpg', '诗雅图2', '', '0', '1', '2016-05-15 22:54:39', '2016-05-15 22:54:39');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '菜单代码',
  `url` varchar(100) DEFAULT NULL COMMENT '链接',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单',
  `level` int(11) NOT NULL,
  `display_index` int(11) NOT NULL COMMENT '排序',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL COMMENT '状态：0 停用；1 启用；',
  `create_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  `update_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_t_menu_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', 'home', '/', null, '1', '1', '网站首页', '1', '2012-08-04 11:38:09', '2012-08-04 12:07:03');
INSERT INTO `t_menu` VALUES ('2', 'about_us', '/about_us', null, '1', '2', '关于我们', '1', '2012-05-08 11:53:35', '2012-05-08 11:53:35');
INSERT INTO `t_menu` VALUES ('3', 'news', '/news_list', null, '1', '3', '新闻动态', '1', '2012-05-08 11:53:35', '2012-05-08 11:53:35');
INSERT INTO `t_menu` VALUES ('4', 'products', '/products', null, '1', '4', '产品介绍', '1', '2012-05-08 11:53:35', '2012-05-08 11:53:35');
INSERT INTO `t_menu` VALUES ('5', 'online_demo', '/online_demo', null, '1', '5', '在线展示', '1', '2012-05-08 11:53:35', '2012-05-08 11:53:35');
INSERT INTO `t_menu` VALUES ('6', 'global', '/global', null, '1', '6', 'Global CARIT', '1', '2012-05-08 11:53:35', '2012-05-08 11:53:35');
INSERT INTO `t_menu` VALUES ('7', 'contact_us', '/contact_us', null, '1', '7', '联系我们', '1', '2012-05-08 11:53:35', '2012-05-08 11:53:35');
INSERT INTO `t_menu` VALUES ('8', 'bbs', '#', null, '1', '8', '互动论坛', '1', '2012-05-08 11:53:35', '2016-05-15 20:33:56');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类别：0 公司新闻；1 业界动态',
  `language` varchar(5) NOT NULL COMMENT '语言类别',
  `title` varchar(100) NOT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '状态：0 停用；1 启用；',
  `create_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  `update_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  PRIMARY KEY (`id`),
  KEY `idx_t_news_language` (`language`),
  KEY `idx_t_news_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', '0', 'cn', '天鹅堡参加2016广西甜展', '<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <span style=\"color:#FF9900;font-size:16px;\"><strong>相约中国南宁国际糖酒会</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;主题：第十三届广西国际糖酒会</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 地点：中国广西南宁.国际会展中心<br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 展位号：650-651<br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 时间：2015-10-27到2015-10-29日<br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 天鹅堡酒业受邀参加2015年中国广西南宁糖酒会，会展上我司展出了众多代理的法国欧诗图系列知名葡萄酒品牌，并受到众多客户青睐，结识了大批的中国酒行业的朋友，并一起探讨了中国酒行业的现状，期待来自五湖四海的酒类企业能创造未来中国酒行业的盛景！<br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:12px;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#FF9900;font-size:16px;\"><strong><br />\r\n</strong></span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '1', '2016-05-15 20:41:38', '2016-05-15 20:41:38');
INSERT INTO `t_news` VALUES ('2', '1', 'cn', '徽酒动态', '<h1 style=\"font-size:30px;text-align:center;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	徽酒三巨头（古井、口子、宣酒）轮番发出“提价宣言”<br />\r\n<span style=\"font-size:14px;font-weight:normal;line-height:20px;color:#999999;\">2016-05-14 16:17:35&nbsp;&nbsp;&nbsp;来源：<a href=\"http://www.cnwinenews.com/\" target=\"_blank\">中国酒业新闻网</a>&nbsp;&nbsp;&nbsp;作者：华夏酒报团队&nbsp;&nbsp;&nbsp;评论：<a href=\"http://www.cnwinenews.com/html/2016/shichang_0514/97359.html#comment_iframe\">0</a></span>\r\n</h1>\r\n<div style=\"font-size:16px;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;font-family:微软雅黑;line-height:25.6000003814697px;\">近日，《华夏酒报》记者独家获悉，安徽宣酒销售有限公司发布了提价通知，据悉，此次厂家供货价提高了5元/瓶。</span>\r\n	<p style=\"text-align:justify;color:#000000;font-family:微软雅黑;\">\r\n		<span style=\"color:#888888;\">&nbsp;</span>\r\n	</p>\r\n	<p style=\"text-align:justify;color:#000000;font-family:微软雅黑;\">\r\n		<span style=\"color:#888888;\">宣酒《提价通知》表示，宣酒一贯秉承“质量第一 客户至上”的宗旨，坚持传统的小窖酿造工艺，虽然酿造成本逐年上升，但产品品质得到了保障，一直深受广大消费者青睐，持续畅销。涨价后，要求各销售网点零售价格不得低于70元/瓶。此次价格调整自5月26日起执行。</span>\r\n	</p>\r\n</div>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">在安徽市场，今年4月，古井发布了新的调价通知：古井贡要求经销商对年份原浆献礼、5 年的实际成交价不得低于85元和120元，年份原浆5年的终端表现价为191元。口子酒业近期也发布了一则涨价消息，口子窖6年出厂价和零售价每瓶均上调10元，出厂价上涨为138元/瓶，零售价上涨为198元/瓶。加上这次宣酒提价，徽酒“三巨头”可谓不约而同宣布提价，并逐步落地执行各自的提价举措。</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">&nbsp;</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">应该说，进入2016年，行业整体性的复苏迹象明显。</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">&nbsp;</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">贵州茅台和五粮液作为白酒行业的风向标也准确地反映了这一趋势。2015年度报告显示，两家酒企均实现了营业收入和净利润的双增长。近段时间，伴随着更多企业年报和一季报的披露，我们发现，白酒行业内具备优势能力的企业正处于复苏状态。</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">&nbsp;</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">在这其中，聚焦主业、产品以及渠道和网路布局几乎是各家企业复苏最为明显的推动力量。</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">&nbsp;</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">很明显，这依旧是一个潜力无限而又前景可期的行业。也正是基于对未来市场的预期和自身品牌的信心，强势品牌纷纷在近期实施了各自的提价策略。</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">&nbsp;</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">产品价位定位于多数消费者的理想价位，同时又能体现产品的价值空间是企业的理想目标，应该说，在消费升级和固定资产投资发力带动的消费增速驱动下，酒企提价是顺应市场需求，但显然，不是每一家企业都有提价的自信和勇气。</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">&nbsp;</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">此时宣布提价的宣酒，意在表明一种态度和自信，同时也在坚持一份责任：彰显宣酒的品牌价值和产品定位，宣酒就是要做“安徽最畅销的中档白酒”，让消费者享受到性价比最高的酒。某种角度来说，这也是宣酒响应供给側改革，实现价值回归的具体表现。</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	&nbsp;\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;line-height:25.6000003814697px;\">对比来看，提价后古井贡和口子窖开始了在200元中高档价位上的“主权之争”，而聚焦于70-80元价位段的宣酒，意在持续领跑安徽中档白酒市场。</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">&nbsp;</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">据市场人士介绍，宣酒已经连续5年成为安徽畅销白酒，尤其是进入2016年后，宣酒更是出现了产销两旺的优势局面，渠道层面看，各级经销商库存率维持在一个合理水平，周转率高；终端层看，无论是在餐饮店自点率还是商超购买率，宣酒都具有很强的优势。</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">&nbsp;</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\">基于当下的消费基础和未来市场预期，可以预计，提价后专注于“小窖酿造”的宣酒会更加凸显其在中档酒市场的领先地位，逐渐形成古井贡、口子窖和宣酒的“三足鼎立”之势。</span><br />\r\n&nbsp;\r\n</p>\r\n<p style=\"font-size:16px;text-align:center;font-family:微软雅黑;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;\"><img src=\"http://cnwinenews.com/uploadfile/2016/0514/20160514041959681.png\" /></span>\r\n</p>\r\n<br />', '1', '2016-05-15 20:55:36', '2016-05-15 20:55:36');
INSERT INTO `t_news` VALUES ('4', '1', 'cn', '第95届全国糖酒会组展工作正式启动', '<p style=\"font-size:16px;text-align:justify;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	5月10日，第95届全国糖酒会组展工作会议在福州市顺利召开，标志着本届糖酒会的组展工作正式启动。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	第95届全国糖酒会将于2016年10月20-22日在福州海峡国际会展中心举行，规划面积超过12万平方米。本届会除划分了传统酒类、葡萄酒及国际烈酒、食品、饮料、调味品、食品机械、食品包装、食品科技等主题展区之外，还在各展区内根据需要特别规划了进口食品、啤酒、休闲食品、品牌农业及水产专区等，进一步细分品类，同时配合福建地方产业发展需求。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	本届会是全国糖酒会第二次花开福州。福州是中国市场化程度和对外开放度较高的地区之一。2015年，福州市国民生产总值突破5000亿元，同比增长9.6%，人均GDP超过1万美元。轻工食品是福州市“五大超千亿产业集群”之一。同时，近两年，福州市会展业借助国家级新区、自贸试验区、海上丝绸之路核心区、生态文明示范区“四区叠加”政策优势，也取得了飞速发展。完善的展览配套服务、便利的展会住宿交通，国际一流水平的展览设施，将为参展客商带来前所未有的参会体验。\r\n</p>\r\n<p style=\"font-size:16px;text-align:center;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	<img src=\"http://cnwinenews.com/uploadfile/2016/0512/20160512085146680.png\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	作为中国酒类和食品行业历史悠久、规模庞大、影响深远的会展综合平台，六十余年来，全国糖酒会一直在业内发挥着重要的作用。目前，国内食品及酒类行业正处于探索供给侧结构性改革，实现“去产能、去库存、去杠杆、降成本、补短板”的经济目标大背景下，业内人士对于展示交易、转型升级、信息沟通、思想交流的需求愈发迫切。本届会的举办将为业内企业实现自身的经济和社会目标提供必要的助力。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	欢迎从事食品和酒类生产、销售、经营、研发业务及相关产业的企业，参与本届糖酒会，展示企业风采，实现产销对接，传播企业品牌，交流业内信息，结交合作伙伴；相关展览事务，请联系中糖新世纪国际会展（北京）有限公司展览部或本届糖酒会相关组展单位，联系电话：010-88363768、010-68317248、010-68316827、010-68360546，或登录全国糖酒会官方网站（www.qgtjh.com）查询。\r\n</p>\r\n<span></span>', '1', '2016-05-15 20:57:08', '2016-05-15 20:57:08');
INSERT INTO `t_news` VALUES ('5', '1', 'cn', '23届布鲁塞尔国际葡萄酒大赛中国葡萄酒获36项奖', '<div style=\"border:1px solid #C3D4E7;padding:0px 30px;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	<div style=\"font-size:16px;\">\r\n		4月29日，第23届布鲁塞尔国际葡萄酒大赛（23th Concours Mondial de Bruxelles）首次在保加利亚的普罗夫迪夫（Plovdiv）举行。历时三天的激烈评选，比赛结果于5月6日出炉，中国在本届比赛获得1大金奖，8金奖， 27银奖，唐庭霞露酒庄北庭赤霞珠干红是唯一获得大金奖（Grand Gold Medal）的中国葡萄酒。\r\n		<p style=\"text-align:justify;\">\r\n			布鲁塞尔国际葡萄酒大赛创办于1994年，是世界最具权威的四大国际葡萄酒大赛之一，在世界葡萄酒界拥有广泛的影响力，素有“葡萄酒奥斯卡”之称。大赛采取百分制，共设银奖（Silver）、金奖（Gold）和大金奖（Grand Gold）三个奖项。\r\n		</p>\r\n		<p style=\"text-align:center;\">\r\n			&nbsp;\r\n		</p>\r\n		<p style=\"text-align:justify;\">\r\n			今年，比赛特意选择了在中东欧发展领先的葡萄酒产区保加利亚。来自51个国家，超过8750款葡萄酒参与此次大赛的评选。\r\n		</p>\r\n		<p style=\"text-align:center;\">\r\n			&nbsp;\r\n		</p>\r\n		<p style=\"text-align:justify;\">\r\n			此次大赛的评委来自葡萄酒行业的不同领域，包括侍酒师、进口商、葡萄酒记者以及作家在内的320位评委聚集与此，每天都要品评五六十款酒样。这些不同背景的评委们更加保证了大赛的公平性，使得这项比赛在短短几年时间成为世界葡萄酒的风向标。\r\n		</p>\r\n		<p style=\"text-align:center;\">\r\n			&nbsp;\r\n		</p>\r\n		<p style=\"text-align:justify;\">\r\n			在8000多款葡萄酒中仅有80款葡萄酒获得了此次大赛的大金奖，竞争可谓激烈。唯一获得此类大奖的中国酒庄唐庭霞露酒庄位于新疆天山北麓，因得天独厚的气候条件盛产高品质葡萄，从而酿造出优质葡萄酒。这次获奖的北庭赤霞珠干红葡萄酒也曾在多个大赛上屡次获奖。\r\n		</p>\r\n		<p style=\"text-align:center;\">\r\n			&nbsp;\r\n		</p>\r\n		<p style=\"text-align:justify;\">\r\n			除此之外，中国葡萄酒也获得多个金奖和银奖，其中包括来自北京房山产区的莱恩堡酒庄、京沃德酒庄以及丹世红酒庄。北京房山产区能够在此次大赛中获得如此成绩，可谓中国葡萄酒产区冉冉升起的一颗新星。\r\n		</p>\r\n		<p style=\"text-align:center;\">\r\n			&nbsp;\r\n		</p>\r\n		<p style=\"text-align:justify;\">\r\n			大赛期间，北京市房山区政府与大赛组委会联合举办了新闻发布会，宣布“一带一路”国际葡萄酒大赛将于今年10月在北京房山举行，并邀请了30多个“一带一路”沿线国家和地区参赛。\r\n		</p>\r\n		<p style=\"text-align:justify;\">\r\n			此次大赛获奖的所有中国酒款如下：\r\n		</p>\r\n		<p style=\"text-align:center;\">\r\n			<img alt=\"\" src=\"http://cnwinenews.com/uploadfile/2016/0509/20160509053729816.jpg\" style=\"width:449px;height:2316px;\" />\r\n		</p>\r\n		<p style=\"text-align:justify;\">\r\n			<br />\r\n		</p>\r\n	</div>\r\n</div>', '1', '2016-05-15 21:19:59', '2016-05-15 21:19:59');
INSERT INTO `t_news` VALUES ('6', '1', 'cn', '中国葡萄酒论坛6月在烟台市举行', '<p style=\"font-size:16px;text-align:justify;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	近日，从中国葡萄酒论坛新闻发布会传来消息，由中国酒业协会和滨州医学院主办的“2016（第三届）中国葡萄酒论坛”，将于6月12日至14日在我市召开。本届论坛由中国酒业协会葡萄酒分会、滨州医学院葡萄酒学院、烟台瀑拉谷酒庄管理有限公司承办，市葡萄与葡萄酒局、市葡萄与葡萄酒协会、蓬莱市葡萄与葡萄酒局、西北农林科技大学葡萄酒学院、宁夏大学葡萄酒学院协办，邀请多位国内外着名葡萄酒专家、企业家，根据本届论坛主题“国际化与中国风”，进行主题演讲和对话交流。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	主题演讲环节上，将有国内外专家学者和企业家发表《全球葡萄酒发展趋势及对中国葡萄酒产业的启示》、《国际化融合中的中国葡萄酒产业发展趋势》、《融入国际化，彰显中国风，国际经济融合下的中国葡萄酒》、《中国如何与世界葡萄酒产业融合》、《葡萄酒供给侧结构性改革思路及举措》、《中国葡萄酒消费市场调查》、《葡萄酒流通市场发展》等主题报告。此外，国内外葡萄酒产业学者将发表《全球葡萄与葡萄酒学术研究前沿及发展趋势》、《国际化下的中国葡萄酒教育与人才培养》、《中国葡萄酒法定产区制度建设》、《葡萄酒多酚类物质与健康研究》、《以美国加州为例谈葡萄酒产业的可持续发展》、《国际化下的中国葡萄酒文化建设》等学术报告。葡萄酒行业营销人士还将带来《国际化下的葡萄酒与互联网》、《金融与葡萄酒互联网的融合》、《葡萄酒企业电子商务发展措施及建议》等葡萄酒与互联网报告。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	论坛期间还将举行国家级葡萄酒学术组织―――中国食品科学技术学会葡萄酒分会成立大会，这是我国第一个进行葡萄酒科学研究和学术交流的学术组织。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	滨州医学院葡萄酒学院副院长刘世松介绍，今年是中国葡萄酒产业调整复苏更为关键一年，“2016中国葡萄酒论坛”仍然旨在推动中国葡萄酒产业树立全新的战略思维，以国际思维与世界视角探索中国葡萄酒产业发展的有效发展模式，引领中国葡萄酒产业健康发展。对于“国际化和中国风”主题的提出，他认为，这是中国葡萄酒产业永恒的主题。随着国产葡萄酒复苏抬头，进口酒以凶勐的姿态进攻中国市场。鉴于这种趋势，这次论坛就是为各界专家学者、企业家提供了思想碰撞的平台，大家共同探寻中国葡萄酒应该如何从“顶层设计”高度，思考在国际化大背景下如何与世界葡萄酒主流趋势融合，打造中国葡萄酒的自有风格特色。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	中国葡萄酒论坛是目前中国葡萄酒行业出席人员层次最高、深度讨论产业发展的高峰论坛，中国葡萄酒论坛每年一个主题，已经连续举办两届，每年有200多位专家、学者和企业家出席论坛。\r\n</p>', '1', '2016-05-15 21:20:39', '2016-05-15 21:20:39');
INSERT INTO `t_news` VALUES ('7', '0', 'cn', '天鹅堡紧急补仓畅销酒', '&nbsp; &nbsp; 近日，天鹅堡酒业代理法国欧诗图系列受到业界代理商一致好评，订单不断增加，为此，天鹅堡紧急从法国再次进入一批1500多的库存，以备各位尊敬的代理商们及时补充库存，欢迎大家速来购货！<img src=\"http://127.0.0.1:8080/resources/kindeditor-4.1.2/plugins/emoticons/images/42.gif\" border=\"0\" alt=\"\" />', '1', '2016-05-15 21:26:38', '2016-05-15 21:26:38');
INSERT INTO `t_news` VALUES ('8', '1', 'cn', '2016国际葡萄酒及烈酒大赛', '<h1 style=\"font-size:30px;text-align:center;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	2016国际葡萄酒及烈酒大赛第一轮比赛 中国获19枚奖牌<br />\r\n<span style=\"font-size:14px;font-weight:normal;line-height:20px;color:#999999;\">2016-05-06 14:56:21&nbsp;&nbsp;&nbsp;来源：db&nbsp;&nbsp;&nbsp;作者：乐酒客Suki编译&nbsp;&nbsp;&nbsp;评论：<a href=\"http://www.cnwinenews.com/html/2016/putaojiu_0506/96982.html#comment_iframe\">0</a></span>\r\n</h1>\r\n<div style=\"font-size:16px;color:#444444;font-family:\'Microsoft YaHei\', 宋体, \'Arial Narrow\', HELVETICA;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;\">国际葡萄酒及烈酒大赛（IWSC）公布2016年第一轮比赛结果。第一轮比赛囊括北半球的参赛酒品，获奖葡萄酒分别来自东欧、亚洲、美国、加拿大、葡萄牙、德国、奥地利和英国。</span>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-family:微软雅黑;\">IWSC是业界公认的全球顶级葡萄酒竞赛，也是全球最盛大、最尊贵的醇酒美食盛宴。此次所颁发的46枚金奖和杰出金奖中，葡萄牙和加拿大获奖数目最多。加拿大共13枚，其中11枚是颁给冰酒。葡萄牙18枚。英国紧随其后，获得7枚金牌，均为来自苏塞克斯、肯特和多塞特的起泡酒。</span>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-family:微软雅黑;\">顶级获奖酒品包括Court Garden Ditchling Reserve Vintage Brut 2010、Chapel Down Three Graces 2010和Nutty Brut 2013等。</span>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-family:微软雅黑;\">亚洲葡萄酒表现良好。中国获得19枚奖牌，其中张裕辽宁2014年份钻石级黄金谷冰酒，获得银奖。另外一款Jade Aria’s 2014 Cabernet Sauvignon获银奖。</span>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-family:微软雅黑;\">贺兰晴雪酒庄、新疆中菲酒庄和天塞酒庄各获四枚奖牌。另外，台湾的一款莫斯卡托Domaine Shu Sheng Moscato Oro Vino Formosa获铜奖。这证明了亚洲生产商的酿酒能力。</span>\r\n	</p>\r\n</div>', '1', '2016-05-15 21:28:14', '2016-05-15 21:28:14');

-- ----------------------------
-- Table structure for t_product_release
-- ----------------------------
DROP TABLE IF EXISTS `t_product_release`;
CREATE TABLE `t_product_release` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL COMMENT '类别Id',
  `language` varchar(5) NOT NULL COMMENT '语言类别',
  `title` varchar(100) NOT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `top` int(11) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `picture` varchar(1500) NOT NULL COMMENT '产品图片',
  `main_pic` varchar(200) NOT NULL,
  `thumb` varchar(200) NOT NULL COMMENT '缩略图',
  `status` int(11) NOT NULL COMMENT '状态：0 停用；1 启用；',
  `create_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  `update_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_t_product_release_title` (`title`),
  KEY `idx_t_product_release_catalog_id` (`catalog_id`),
  KEY `idx_t_product_release_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product_release
-- ----------------------------
INSERT INTO `t_product_release` VALUES ('7', '2', 'cn', '诗雅图', '诗雅图诗雅图诗雅图诗雅图诗雅图诗雅图诗雅图诗雅图诗雅图诗雅图', '1', 'http://127.0.0.1/attachment/images/fe022d5b3d660b66d86a0668e0a5eac2.jpg;http://127.0.0.1/attachment/images/fb442ec4bc5c78cf00341d7f325b2822.jpg;', 'http://127.0.0.1/attachment/images/dd970bb344b75eb379305b533806b5b4.jpg', 'http://127.0.0.1/attachment/images/fb442ec4bc5c78cf00341d7f325b2822_thumb.jpg', '1', '2016-05-15 22:54:48', '2016-05-15 22:54:48');
INSERT INTO `t_product_release` VALUES ('8', '2', 'cn', '诗雅图2', '诗雅图2诗雅图2诗雅图2诗雅图2诗雅图2诗雅图2诗雅图2', '1', 'http://127.0.0.1/attachment/images/fe022d5b3d660b66d86a0668e0a5eac2.jpg;http://127.0.0.1/attachment/images/fb442ec4bc5c78cf00341d7f325b2822.jpg;', 'http://127.0.0.1/attachment/images/dd970bb344b75eb379305b533806b5b4.jpg', 'http://127.0.0.1/attachment/images/fb442ec4bc5c78cf00341d7f325b2822_thumb.jpg', '1', '2016-05-15 22:58:06', '2016-05-15 22:58:06');

-- ----------------------------
-- Table structure for t_support_language
-- ----------------------------
DROP TABLE IF EXISTS `t_support_language`;
CREATE TABLE `t_support_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso_code` varchar(2) NOT NULL COMMENT '两位语言ISO代码',
  `name` varchar(20) NOT NULL COMMENT '后台显示名称',
  `status` int(11) NOT NULL COMMENT '状态：0 停用；1 启用；',
  `create_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  `update_time` timestamp NOT NULL DEFAULT '2012-05-08 11:53:35',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_iso_code` (`iso_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_support_language
-- ----------------------------
INSERT INTO `t_support_language` VALUES ('1', 'cn', '简体中文', '1', '2012-08-07 12:22:15', '2016-05-14 21:31:33');
INSERT INTO `t_support_language` VALUES ('2', 'en', '英语', '0', '2012-08-07 12:25:24', '2016-05-14 21:31:33');
