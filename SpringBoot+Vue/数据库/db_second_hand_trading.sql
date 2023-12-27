/*
 Navicat Premium Data Transfer

 Source Server         : db_secondhand_platform
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3306
 Source Schema         : db_second_hand_trading

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 27/12/2023 17:40:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sh_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_address`;
CREATE TABLE `sh_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `consignee_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人姓名',
  `consignee_phone` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人手机号',
  `province_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '省',
  `city_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '市',
  `region_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '区',
  `detail_address` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '详细地址',
  `default_flag` tinyint NOT NULL COMMENT '是否默认地址',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_address
-- ----------------------------
INSERT INTO `sh_address` VALUES (1, 'user1', '13011110009', '江苏省', '南通市', '崇川区', '花园一单元一号楼', 1, 10);
INSERT INTO `sh_address` VALUES (2, 'user2', '13011110008', '江苏省', '南通市', '崇川区', '888', 1, 9);
INSERT INTO `sh_address` VALUES (27, 'user3', '13011110000', '河南省', '新乡市', '原阳县', '测试测试', 1, 1);
INSERT INTO `sh_address` VALUES (28, '张雅雄', '12345678', '广东省', '汕头市', '澄海区', '汕头大学东海岸校区A栋', 1, 2);
INSERT INTO `sh_address` VALUES (29, '下雨', '1788888888', '天津市', '市辖区', '河西区', '北京', 1, 4);
INSERT INTO `sh_address` VALUES (30, '鸡哥', '252525', '湖南省', '湘西土家族苗族自治州', '吉首市', '鸡你太美', 1, 11);

-- ----------------------------
-- Table structure for sh_admin
-- ----------------------------
DROP TABLE IF EXISTS `sh_admin`;
CREATE TABLE `sh_admin`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员账号',
  `admin_password` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `admin_name` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员名字',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_number`(`account_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_admin
-- ----------------------------
INSERT INTO `sh_admin` VALUES (1, 'hmxy', '123456', '超级管理员');
INSERT INTO `sh_admin` VALUES (2, 'w', '123123', '管理员1');
INSERT INTO `sh_admin` VALUES (3, 'z', '123123', '管理员2');
INSERT INTO `sh_admin` VALUES (11, 'l', '123123', '管理员3');
INSERT INTO `sh_admin` VALUES (12, '123', '123123', '管理员4');

-- ----------------------------
-- Table structure for sh_favorite
-- ----------------------------
DROP TABLE IF EXISTS `sh_favorite`;
CREATE TABLE `sh_favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
  `create_time` datetime NOT NULL COMMENT '加入收藏的时间',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置物主键id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC, `idle_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_favorite
-- ----------------------------
INSERT INTO `sh_favorite` VALUES (42, '2023-12-01 07:21:59', 9, 80);
INSERT INTO `sh_favorite` VALUES (43, '2023-12-02 22:20:08', 4, 90);
INSERT INTO `sh_favorite` VALUES (44, '2023-12-01 10:23:09', 3, 93);
INSERT INTO `sh_favorite` VALUES (45, '2023-12-03 17:56:57', 3, 98);
INSERT INTO `sh_favorite` VALUES (46, '2023-12-05 17:58:11', 3, 97);
INSERT INTO `sh_favorite` VALUES (49, '2023-12-03 05:52:15', 2, 106);
INSERT INTO `sh_favorite` VALUES (50, '2023-12-27 09:25:37', 1, 112);
INSERT INTO `sh_favorite` VALUES (51, '2023-12-27 09:25:40', 1, 111);
INSERT INTO `sh_favorite` VALUES (52, '2023-12-27 09:25:43', 1, 110);

-- ----------------------------
-- Table structure for sh_idle_item
-- ----------------------------
DROP TABLE IF EXISTS `sh_idle_item`;
CREATE TABLE `sh_idle_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `idle_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '闲置物名称',
  `idle_details` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '详情',
  `picture_list` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图集',
  `idle_price` decimal(10, 2) NOT NULL COMMENT '价格',
  `idle_place` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '发货地区',
  `idle_label` int NOT NULL COMMENT '分类标签',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  `idle_status` tinyint NOT NULL COMMENT '状态（发布1、下架2、删除0）',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_idle_item
-- ----------------------------
INSERT INTO `sh_idle_item` VALUES (1, '111', '111', '[\"http://localhost:8080/image?imageName=file16866307653031002壁纸.jpg\"]', 20.01, '市辖区', 1, '2023-12-01 04:32:47', 2, 1);
INSERT INTO `sh_idle_item` VALUES (2, '运动鞋', '跑步非常舒服 回弹性好', '[\"http://localhost:8080/image?imageName=file16868385096121002运动鞋.jpg\"]', 100.00, '市辖区', 3, '2023-12-01 14:15:11', 1, 1);
INSERT INTO `sh_idle_item` VALUES (3, '电风扇', '贼凉快', '[\"http://localhost:8080/image?imageName=file16868385807991003风扇.jpg\"]', 120.00, '唐山市', 2, '2023-12-01 14:16:37', 2, 1);
INSERT INTO `sh_idle_item` VALUES (4, '加湿器', '干燥空气瞬间变湿', '[\"http://localhost:8080/image?imageName=file16868386408251004file16513152624181010加湿器.jpg\"]', 50.00, '阳泉市', 1, '2023-12-01 14:19:20', 1, 1);
INSERT INTO `sh_idle_item` VALUES (5, '考研单词书', '考研背单词必备', '[\"http://localhost:8080/image?imageName=file16868387852141005file16527758200311002考研单词书.jpg\"]', 10.00, '市辖区', 4, '2023-12-01 14:20:34', 2, 1);
INSERT INTO `sh_idle_item` VALUES (105, '袜子', '没穿过。', '[\"http://localhost:8080/image?imageName=file17023382374621002企业微信截图_20231212074317.png\"]', 19.99, '秦皇岛市', 5, '2023-12-01 23:44:01', 1, 1);
INSERT INTO `sh_idle_item` VALUES (106, '华为mate60pro', '遥遥领先', '[\"http://localhost:8080/image?imageName=file17032212461601002R-C.png\"]', 8000.00, '汕头市', 1, '2023-12-01 05:00:49', 1, 1);
INSERT INTO `sh_idle_item` VALUES (107, '坤蛋', '鸽鸽的蛋', '[\"http://localhost:8080/image?imageName=file17032645206541003坤蛋.jpg\"]', 2.00, '湘西土家族苗族自治州', 5, '2023-12-22 17:03:27', 1, 11);
INSERT INTO `sh_idle_item` VALUES (108, '油饼', '油饼食不食', '[\"http://localhost:8080/image?imageName=file17032647527321004油饼.jpg\"]', 2.50, '汕头市', 5, '2023-12-22 17:05:56', 1, 11);
INSERT INTO `sh_idle_item` VALUES (109, '香精煎鱼', '香精煎鱼食不食', '[\"http://localhost:8080/image?imageName=file17032648780791005香精煎鱼.jpg\"]', 25.00, '温州市', 5, '2023-12-22 17:07:59', 1, 11);
INSERT INTO `sh_idle_item` VALUES (110, '瓜', '保熟的瓜', '[\"http://localhost:8080/image?imageName=file17032655347761008生瓜蛋子.png\"]', 2.00, '市辖区', 5, '2023-12-22 17:18:59', 1, 12);
INSERT INTO `sh_idle_item` VALUES (111, '佳能400D', '打虎相机', '[\"http://localhost:8080/image?imageName=file17032663495791011佳能400d.png\"]', 88.00, '香港特别行政区', 1, '2023-12-22 17:32:31', 1, 14);
INSERT INTO `sh_idle_item` VALUES (112, '菜', '菜就多练，输不起就别玩\n蚁钳是蚁钳，蟹仔是蟹仔', '[\"http://localhost:8080/image?imageName=file17032672036081014菜就多练.jpg\"]', 4070.00, '无锡市', 5, '2023-12-22 17:46:46', 1, 15);

-- ----------------------------
-- Table structure for sh_message
-- ----------------------------
DROP TABLE IF EXISTS `sh_message`;
CREATE TABLE `sh_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置主键id',
  `content` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '留言内容',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `to_user` bigint NOT NULL COMMENT '所回复的用户',
  `to_message` bigint NULL DEFAULT NULL COMMENT '所回复的留言',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `idle_id_index`(`idle_id` ASC) USING BTREE,
  INDEX `to_user_index`(`to_user` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_message
-- ----------------------------
INSERT INTO `sh_message` VALUES (34, 1, 27, '测试测试', '2023-12-02 01:24:00', 7, NULL);
INSERT INTO `sh_message` VALUES (35, 2, 3, '测试测试', '2023-12-02 00:55:32', 1, NULL);
INSERT INTO `sh_message` VALUES (36, 2, 82, '俺想要', '2023-12-02 20:30:12', 2, NULL);
INSERT INTO `sh_message` VALUES (37, 4, 90, '一寸光阴一寸金，寸金难买寸光阴。', '2023-12-02 22:18:53', 3, NULL);
INSERT INTO `sh_message` VALUES (38, 2, 97, '不错不错', '2023-12-02 15:50:23', 2, NULL);
INSERT INTO `sh_message` VALUES (39, 2, 95, '我喜欢这个自行车，请问怎么进行提货啊', '2023-12-02 17:53:13', 2, NULL);
INSERT INTO `sh_message` VALUES (40, 3, 98, '你这个电风扇很不错啊，我很喜欢', '2023-12-02 17:56:46', 2, NULL);
INSERT INTO `sh_message` VALUES (41, 3, 97, '喜欢', '2023-12-02 17:58:40', 2, 38);
INSERT INTO `sh_message` VALUES (42, 2, 97, '眼光不错', '2023-12-02 18:00:23', 3, 41);
INSERT INTO `sh_message` VALUES (43, 2, 103, '1111', '2023-12-03 03:40:15', 1, NULL);
INSERT INTO `sh_message` VALUES (44, 2, 103, '111', '2023-12-03 03:40:22', 2, 43);
INSERT INTO `sh_message` VALUES (45, 1, 102, '111111', '2023-12-03 03:40:49', 1, NULL);
INSERT INTO `sh_message` VALUES (46, 1, 102, '1111', '2023-12-03 03:40:51', 1, NULL);
INSERT INTO `sh_message` VALUES (47, 1, 102, '1111', '2023-12-03 03:40:55', 1, 45);
INSERT INTO `sh_message` VALUES (48, 2, 105, '男生可以穿吗', '2023-12-22 04:57:06', 1, NULL);
INSERT INTO `sh_message` VALUES (49, 1, 106, '苹果才是最牛的', '2023-12-22 05:02:41', 1, NULL);
INSERT INTO `sh_message` VALUES (50, 2, 106, '果gou不得house', '2023-12-22 05:05:40', 1, 49);
INSERT INTO `sh_message` VALUES (51, 2, 106, '能不能便宜点', '2023-12-22 05:50:35', 1, NULL);
INSERT INTO `sh_message` VALUES (52, 12, 110, '两块钱一斤', '2023-12-22 17:19:36', 12, NULL);
INSERT INTO `sh_message` VALUES (53, 13, 110, '这瓜皮是金子做的，还是这瓜粒子是金子做的', '2023-12-22 17:21:56', 12, 52);
INSERT INTO `sh_message` VALUES (54, 14, 111, '就在这千钧一发之际，我掏出了佳能400D，马上拍照，老虎被吓得浑身麻痹，无法动弹', '2023-12-22 17:33:48', 14, NULL);

-- ----------------------------
-- Table structure for sh_order
-- ----------------------------
DROP TABLE IF EXISTS `sh_order`;
CREATE TABLE `sh_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_number` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单编号',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置物品主键id',
  `order_price` decimal(10, 2) NOT NULL COMMENT '订单总价',
  `payment_status` tinyint NOT NULL COMMENT '支付状态',
  `payment_way` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint NOT NULL COMMENT '订单状态',
  `is_deleted` tinyint NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_order
-- ----------------------------
INSERT INTO `sh_order` VALUES (65, '166644845940310002', 2, 89, 52.00, 0, NULL, '2023-12-03 22:20:59', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (66, '166644847386610003', 2, 90, 100.00, 0, NULL, '2023-12-03 22:21:13', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (73, '167316390306810008', 2, 91, 20.00, 0, NULL, '2023-12-03 15:45:03', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (74, '167316390677010009', 2, 90, 100.00, 0, NULL, '2023-12-04 15:45:06', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (75, '167316391048610010', 2, 87, 52.00, 0, NULL, '2023-12-04 15:45:10', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (76, '167317079822610011', 2, 91, 20.00, 0, NULL, '2023-12-04 17:39:58', NULL, 0, NULL);
INSERT INTO `sh_order` VALUES (77, '167317080313310012', 2, 90, 100.00, 0, NULL, '2023-12-04 17:40:03', NULL, 0, NULL);
INSERT INTO `sh_order` VALUES (78, '167317080721110013', 2, 87, 52.00, 0, NULL, '2023-12-04 17:40:07', NULL, 0, NULL);
INSERT INTO `sh_order` VALUES (79, '167317197510610014', 3, 98, 30.00, 1, '支付宝', '2023-12-05 17:59:35', '2023-01-08 17:59:39', 2, NULL);
INSERT INTO `sh_order` VALUES (80, '169868139833810002', 2, 3, 120.00, 0, NULL, '2023-12-05 15:56:38', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (81, '169868142096810003', 2, 5, 10.00, 0, NULL, '2023-12-05 15:57:01', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (82, '169868167883610004', 2, 5, 10.00, 0, NULL, '2023-12-05 16:01:19', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (83, '169868176136110005', 2, 5, 10.00, 1, '支付宝', '2023-12-05 16:02:41', '2023-10-30 16:03:06', 1, NULL);
INSERT INTO `sh_order` VALUES (84, '170233774650610002', 7, 3, 120.00, 0, NULL, '2023-12-11 23:35:47', NULL, 0, NULL);
INSERT INTO `sh_order` VALUES (85, '170233778849310003', 4, 5, 10.00, 1, '支付宝', '2023-12-11 23:36:28', '2023-12-11 23:37:07', 3, NULL);
INSERT INTO `sh_order` VALUES (86, '170322426885210002', 2, 106, 8000.00, 0, NULL, '2023-12-22 05:51:09', NULL, 4, NULL);

-- ----------------------------
-- Table structure for sh_order_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_order_address`;
CREATE TABLE `sh_order_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `consignee_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人',
  `consignee_phone` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '电话',
  `detail_address` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderId`(`order_id` ASC) USING BTREE,
  INDEX `order_id_index`(`order_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_order_address
-- ----------------------------
INSERT INTO `sh_order_address` VALUES (1, 58, 'user9', '13011110009', '江苏省南通市崇川区花园一单元一号楼');
INSERT INTO `sh_order_address` VALUES (2, 59, 'user8', '13011110008', '江苏省南通市崇川区888');
INSERT INTO `sh_order_address` VALUES (3, 60, 'user9', '13011110009', '江苏省南通市崇川区花园一单元一号楼');
INSERT INTO `sh_order_address` VALUES (4, 62, 'MZ', '13011110000', '河南省新乡市原阳县测试测试');
INSERT INTO `sh_order_address` VALUES (5, 61, 'MZ', '13011110000', '河南省新乡市原阳县测试测试');
INSERT INTO `sh_order_address` VALUES (6, 63, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (7, 64, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (8, 65, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (9, 66, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (10, 73, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (11, 74, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (12, 75, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (13, 76, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (14, 77, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (15, 78, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (16, 79, '下雨', '1788888888', '天津市市辖区河西区北京');
INSERT INTO `sh_order_address` VALUES (17, 80, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (18, 81, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (19, 82, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (20, 83, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (21, 85, '下雨', '1788888888', '天津市市辖区河西区北京');
INSERT INTO `sh_order_address` VALUES (22, 86, '1211111111', '1212', '天津市市辖区河东区212');

-- ----------------------------
-- Table structure for sh_user
-- ----------------------------
DROP TABLE IF EXISTS `sh_user`;
CREATE TABLE `sh_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '账号（手机号）',
  `user_password` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录密码',
  `nickname` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '头像',
  `sign_in_time` datetime NOT NULL COMMENT '注册时间',
  `user_status` tinyint NULL DEFAULT NULL COMMENT '状态（1代表封禁）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_number`(`account_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_user
-- ----------------------------
INSERT INTO `sh_user` VALUES (1, 'wh', '123456', '吴昊', 'http://localhost:8080/image?imageName=file168663143432210031.jpg', '2023-12-01 10:49:01', 0);
INSERT INTO `sh_user` VALUES (2, 'zyx', '123456', '张雅雄', 'http://localhost:8080/image?imageName=file168663143432210030.png', '2023-12-01 11:47:19', 0);
INSERT INTO `sh_user` VALUES (3, 'lm', '123456', '李苗', 'http://localhost:8080/image?imageName=file16731717831451008file16512163108731007tx10.jpg', '2023-12-02 11:47:30', 0);
INSERT INTO `sh_user` VALUES (4, 'ljx', '123456', '刘金鑫', 'http://localhost:8080/image?imageName=file16664482422991023伞.jpg', '2021-12-02 11:53:15', 0);
INSERT INTO `sh_user` VALUES (5, 'wrz', '123456', '王瑞卓', 'http://localhost:8080/image?imageName=file16600445641151003109951165625541004.jpg', '2023-12-02 12:21:50', 1);
INSERT INTO `sh_user` VALUES (6, 'wsl', '123456', '王树廉', 'http://localhost:8080/image?imageName=file16600445641151003109951165625541004.jpg', '2023-12-02 12:22:33', 1);
INSERT INTO `sh_user` VALUES (7, 'zzj', '123456', '张梓俊', 'http://localhost:8080/image?imageName=file16600445641151003109951165625541004.jpg', '2023-12-01 12:23:15', 0);
INSERT INTO `sh_user` VALUES (8, 'wzw', '123456', '王振玮', 'http://localhost:8080/image?imageName=file16600445641151003109951165625541004.jpg', '2023-12-03 12:25:36', 1);
INSERT INTO `sh_user` VALUES (9, '13011110008', '123456', 'user8', 'http://localhost:8080/image?imageName=file16600445641151003109951165625541004.jpg', '2023-12-02 13:24:04', 1);
INSERT INTO `sh_user` VALUES (10, '13011110009', '123456', 'user9', 'http://localhost:8080/image?imageName=file16600445641151003109951165625541004.jpg', '2023-12-03 13:49:01', 1);
INSERT INTO `sh_user` VALUES (11, 'cxk', '123456', '蔡徐坤', 'http://localhost:8080/image?imageName=file17032641939471002鸡哥_20231223005551.png', '2023-12-22 16:54:03', NULL);
INSERT INTO `sh_user` VALUES (12, 'glb', '123456', '瓜老板', 'http://localhost:8080/image?imageName=file17032653713271007瓜老板.png', '2023-12-22 17:11:20', NULL);
INSERT INTO `sh_user` VALUES (13, 'lhq', '123456', '刘华强', 'http://localhost:8080/image?imageName=file17032656605781009刘华强.png', '2023-12-22 17:20:08', NULL);
INSERT INTO `sh_user` VALUES (14, 'hg', '123456', '胡戈', 'http://localhost:8080/image?imageName=file17032662569821010打老虎.png', '2023-12-22 17:30:45', NULL);
INSERT INTO `sh_user` VALUES (15, 'gj', '123456', '广君', 'http://localhost:8080/image?imageName=file17032668984181013广君.jpg', '2023-12-22 17:38:21', NULL);

SET FOREIGN_KEY_CHECKS = 1;
