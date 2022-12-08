/*
 Navicat Premium Data Transfer

 Source Server         : mydb
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : guigu-auth

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 08/12/2022 23:10:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` bigint(0) DEFAULT 0 COMMENT '上级部门id',
  `tree_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT ',' COMMENT '树结构',
  `sort_value` int(0) DEFAULT 1 COMMENT '排序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电话',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态（1正常 0停用）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2018 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组织机构' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '硅谷集团有限公司', 0, ',1,', 1, '张老师', '15659090912', 1, '2022-05-24 16:13:13', '2022-05-24 16:13:13', 0);
INSERT INTO `sys_dept` VALUES (10, '北京校区', 1, ',1,10,', 1, '李老师', '18790007789', 1, '2022-05-24 16:13:15', '2022-05-24 16:13:15', 0);
INSERT INTO `sys_dept` VALUES (20, '上海校区', 1, ',1,20,', 1, '王老师', '15090987678', 1, '2022-05-25 14:02:25', '2022-05-25 14:02:25', 0);
INSERT INTO `sys_dept` VALUES (30, '深圳校区', 1, ',1,30,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:24', '2022-05-25 14:02:24', 0);
INSERT INTO `sys_dept` VALUES (1010, '教学部分', 10, ',1,10,1010,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:24', '2022-05-25 14:02:24', 0);
INSERT INTO `sys_dept` VALUES (1020, '运营部门', 10, ',1,10,1020,', 1, '王老师', '15090987678', 1, '2022-05-25 14:02:29', '2022-05-25 14:02:29', 0);
INSERT INTO `sys_dept` VALUES (1021, 'Java学科', 1010, ',1,10,1010,1021,', 1, '王老师', '15090987678', 1, '2022-05-24 16:13:31', '2022-05-24 16:13:31', 0);
INSERT INTO `sys_dept` VALUES (1022, '大数据学科', 1010, ',1,10,1010,1022,', 1, '王老师', '15090987678', 1, '2022-05-25 14:02:22', '2022-05-25 14:02:22', 0);
INSERT INTO `sys_dept` VALUES (1024, '前端学科', 1010, ',1,10,1010,1024,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:22', '2022-05-25 14:02:22', 0);
INSERT INTO `sys_dept` VALUES (1025, '客服', 1020, ',1,10,1020,1025,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:23', '2022-05-25 14:02:23', 0);
INSERT INTO `sys_dept` VALUES (1026, '网站推广', 1020, ',1,10,1020,1026,', 1, '30.607366', '15090987678', 1, '2022-05-25 14:02:26', '2022-05-25 14:02:26', 0);
INSERT INTO `sys_dept` VALUES (1027, '线下运营', 1020, ',1,10,1020,1027,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:26', '2022-05-25 14:02:26', 0);
INSERT INTO `sys_dept` VALUES (1028, '设计', 1020, ',1,10,1020,1028,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:27', '2022-05-25 14:02:27', 0);
INSERT INTO `sys_dept` VALUES (2012, '教学部门', 20, ',1,20,2012,', 1, '王老师', '18909890765', 1, '2022-05-24 16:13:51', '2022-05-24 16:13:51', 0);
INSERT INTO `sys_dept` VALUES (2013, '教学部门', 30, ',1,30,2013,', 1, '李老师', '18567867895', 1, '2022-05-24 16:13:50', '2022-05-24 16:13:50', 0);
INSERT INTO `sys_dept` VALUES (2016, 'Java学科', 2012, ',1,20,2012,2012,', 1, '张老师', '15090909909', 1, '2022-05-25 10:51:12', '2022-05-25 10:51:12', 0);
INSERT INTO `sys_dept` VALUES (2017, '大数据学科', 2012, ',1,20,2012,2012,', 1, '李老师', '15090980989', 1, '2022-05-27 09:11:54', NULL, 0);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录IP地址',
  `status` tinyint(1) DEFAULT 0 COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) DEFAULT NULL COMMENT '访问时间',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1600835910409707523 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (1, 'admin', '0:0:0:0:0:0:0:1', 1, '登录成功', NULL, '2022-06-10 11:24:14', NULL, 0);
INSERT INTO `sys_login_log` VALUES (2, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-06-10 11:53:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600835910409707522, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 20:53:17', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600851556971372546, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 21:55:28', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600851568270827522, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 21:55:30', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600851571781459970, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 21:55:31', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600851684671152130, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 21:55:58', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600851702924763138, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 21:56:03', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600852102876827650, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 21:57:38', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600852161429311489, 'zhangnx', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 21:57:52', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600852747742679041, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:00:12', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600852831645536257, 'zhangsan', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:00:32', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600853649685811202, 'zhangsan', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:03:47', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600853653498433537, 'zhangsan', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:03:48', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600853677963808769, 'zhangsan', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:03:53', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600853761359204354, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:04:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600854607614562306, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:07:35', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600855296902287361, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:10:19', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600855500032430081, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:11:08', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600859191267414018, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:25:48', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600859201111445506, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:25:50', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600859204894707714, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:25:51', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600859317935394817, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:26:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600859325992652802, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:26:20', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600859328500846594, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:26:21', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600859448697016322, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:26:49', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600860966527504386, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:32:51', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600861010810966018, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:33:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600865981057011713, 'admin', '0:0:0:0:0:0:0:1', 1, '登录成功', NULL, '2022-12-08 22:52:47', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600866183776112642, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:53:35', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600866493663875074, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:54:49', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600866680461398017, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:55:33', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600866682961203201, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:55:34', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600867419929776129, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:58:30', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600867514687492098, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:58:52', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600867544903258114, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:59:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600867548887846914, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:59:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1600867571650334721, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-12-08 22:59:06', NULL, 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '类型(0:目录,1:菜单,2:按钮)',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图标',
  `sort_value` int(0) DEFAULT NULL COMMENT '排序',
  `status` tinyint(0) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1600837775000133635 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, 0, '系统管理', 0, 'system', 'Layout', NULL, 'el-icon-s-tools', 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (3, 2, '用户管理', 1, 'sysUser', 'system/sysUser/list', '', 'el-icon-s-custom', 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (4, 2, '角色管理', 1, 'sysRole', 'system/sysRole/list', '', 'el-icon-user-solid', 2, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (5, 2, '菜单管理', 1, 'sysMenu', 'system/sysMenu/list', '', 'el-icon-s-unfold', 3, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (6, 3, '查看', 2, NULL, NULL, 'bnt.sysUser.list', NULL, 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (7, 3, '添加', 2, NULL, NULL, 'bnt.sysUser.add', NULL, 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (8, 3, '修改', 2, NULL, NULL, 'bnt.sysUser.update', NULL, 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (9, 3, '删除', 2, NULL, NULL, 'bnt.sysUser.remove', NULL, 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (10, 4, '查看', 2, NULL, NULL, 'bnt.sysRole.list', NULL, 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (11, 4, '添加', 2, NULL, NULL, 'bnt.sysRole.add', NULL, 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (12, 4, '修改', 2, NULL, NULL, 'bnt.sysRole.update', NULL, 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (13, 4, '删除', 2, NULL, NULL, 'bnt.sysRole.remove', NULL, 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (14, 5, '查看', 2, NULL, NULL, 'bnt.sysMenu.list', NULL, 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (15, 5, '添加', 2, NULL, NULL, 'bnt.sysMenu.add', NULL, 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (16, 5, '修改', 2, NULL, NULL, 'bnt.sysMenu.update', NULL, 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (17, 5, '删除', 2, NULL, NULL, 'bnt.sysMenu.remove', NULL, 1, 1, '2022-11-22 18:05:37', '2022-12-08 21:46:24', 0);
INSERT INTO `sys_menu` VALUES (18, 3, '分配角色', 2, NULL, NULL, 'bnt.sysUser.assignRole', NULL, 1, 1, '2022-10-23 17:14:32', '2022-12-08 21:42:58', 0);
INSERT INTO `sys_menu` VALUES (19, 4, '分配权限', 2, 'assignAuth', 'system/sysRole/assignAuth', 'bnt.sysRole.assignAuth', NULL, 1, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (20, 2, '部门管理', 1, 'sysDept', 'system/sysDept/list', '', 'el-icon-s-operation', 4, 1, '2022-10-23 17:14:32', '2022-12-08 21:43:14', 0);
INSERT INTO `sys_menu` VALUES (21, 20, '查看', 2, NULL, NULL, 'bnt.sysDept.list', NULL, 1, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (22, 2, '岗位管理', 1, 'sysPost', 'system/sysPost/list', '', 'el-icon-more-outline', 5, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (23, 22, '查看', 2, NULL, NULL, 'bnt.sysPost.list', NULL, 1, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (24, 20, '添加', 2, NULL, NULL, 'bnt.sysDept.add', NULL, 1, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (25, 20, '修改', 2, NULL, NULL, 'bnt.sysDept.update', NULL, 1, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (26, 20, '删除', 2, NULL, NULL, 'bnt.sysDept.remove', NULL, 1, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (27, 22, '添加', 2, NULL, NULL, 'bnt.sysPost.add', NULL, 1, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (28, 22, '修改', 2, NULL, NULL, 'bnt.sysPost.update', NULL, 1, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (29, 22, '删除', 2, NULL, NULL, 'bnt.sysPost.remove', NULL, 1, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (30, 34, '操作日志', 1, 'sysOperLog', 'system/sysOperLog/list', '', 'el-icon-document-remove', 7, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (31, 30, '查看', 2, NULL, NULL, 'bnt.sysOperLog.list', NULL, 1, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (32, 34, '登录日志', 1, 'sysLoginLog', 'system/sysLoginLog/list', '', 'el-icon-s-goods', 8, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (33, 32, '查看', 2, NULL, NULL, 'bnt.sysLoginLog.list', NULL, 1, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (34, 2, '日志管理', 0, 'log', 'ParentView', '', 'el-icon-tickets', 6, 1, '2022-12-02 17:14:32', '2022-12-08 21:45:57', 0);
INSERT INTO `sys_menu` VALUES (35, 0, '图书管理', 0, 'books', 'Layout', '', 'el-icon-document-remove', 2, 1, '2022-12-08 22:05:48', '2022-12-08 22:11:35', 0);
INSERT INTO `sys_menu` VALUES (36, 35, '外借图书', 1, 'bkBorrow', 'books/bkBorrow/list', '', 'el-icon-s-check', 2, 1, '2022-12-08 22:07:15', '2022-12-08 22:11:40', 0);
INSERT INTO `sys_menu` VALUES (37, 35, '归还图书', 1, 'bkReturn', 'books/bkReturn/list', '', 'el-icon-s-unfold', 1, 1, '2022-12-08 22:13:48', '2022-12-08 22:24:52', 0);
INSERT INTO `sys_menu` VALUES (38, 35, '书架图书目录', 1, 'bkBookshelf ', 'books/Bookshelf /list', '', 'el-icon-s-operation', 1, 1, '2022-12-08 22:14:51', '2022-12-08 22:24:54', 0);
INSERT INTO `sys_menu` VALUES (39, 35, '书库目录', 1, 'bkCatalogue', 'books/bkCatalogue/list', '', 'el-icon-more-outline', 1, 1, '2022-12-08 22:16:06', '2022-12-08 22:24:55', 0);
INSERT INTO `sys_menu` VALUES (40, 35, '出库图书目录', 1, 'bkOut', 'books/bkOut/list', '', 'el-icon-warning', 1, 1, '2022-12-08 22:16:54', '2022-12-08 22:24:56', 0);
INSERT INTO `sys_menu` VALUES (41, 0, '门禁管理', 0, 'door', 'Layout', '', 'el-icon-s-help', 3, 1, '2022-12-08 22:18:26', '2022-12-08 22:24:59', 0);
INSERT INTO `sys_menu` VALUES (42, 41, '后勤人员进出管理', 1, 'drBack', 'door/drBack/list', '', 'el-icon-user-solid', 1, 1, '2022-12-08 22:20:12', '2022-12-08 22:25:32', 0);
INSERT INTO `sys_menu` VALUES (43, 0, '后勤管理', 0, 'backs', 'Layout', '', 'el-icon-phone', 4, 1, '2022-12-08 22:21:00', '2022-12-08 22:25:01', 0);
INSERT INTO `sys_menu` VALUES (44, 41, '教师进出管理', 1, 'drTeacher', 'door/drTeacher/list', '', 'el-icon-s-custom', 2, 1, '2022-12-08 22:22:04', '2022-12-08 22:25:34', 0);
INSERT INTO `sys_menu` VALUES (45, 41, '学生进出管理', 1, 'drStudent', 'door/drStudent/list', '', 'el-icon-user-solid', 3, 1, '2022-12-08 22:22:46', '2022-12-08 22:58:48', 0);
INSERT INTO `sys_menu` VALUES (46, 43, '保洁人员管理', 1, '', '', '', 'el-icon-user-solid', 1, 1, '2022-12-08 22:23:43', '2022-12-08 22:59:04', 1);
INSERT INTO `sys_menu` VALUES (47, 43, '安保人员管理', 1, '', '', '', 'el-icon-user-solid', 2, 1, '2022-12-08 22:23:56', '2022-12-08 22:58:58', 1);
INSERT INTO `sys_menu` VALUES (48, 43, '固定资产管理', 1, '', '', '', 'el-icon-s-goods', 3, 1, '2022-12-08 22:24:14', '2022-12-08 22:58:26', 1);
INSERT INTO `sys_menu` VALUES (1600868183993552898, 43, '保洁人员管理', 1, 'bkCleaner', 'back/bkCleaner/list', '', 'el-icon-user-solid', 1, 1, '2022-12-08 23:01:32', '2022-12-08 23:01:32', 0);
INSERT INTO `sys_menu` VALUES (1600868475975831553, 43, '安保人员管理', 1, 'bkSecurity ', 'back/bkSecurity/list', '', 'el-icon-s-help', 2, 1, '2022-12-08 23:02:42', '2022-12-08 23:02:42', 0);
INSERT INTO `sys_menu` VALUES (1600868790334722050, 43, '固定资产管理', 1, 'bkFixed', 'back/bkFixed/list', '', 'el-icon-s-goods', 3, 1, '2022-12-08 23:03:56', '2022-12-08 23:03:56', 0);
INSERT INTO `sys_menu` VALUES (1600869131079979010, 43, '保洁用品管理', 1, 'bkCleaningS', 'back/bkCleaningS/list', '', 'el-icon-info', 4, 1, '2022-12-08 23:05:18', '2022-12-08 23:05:18', 0);
INSERT INTO `sys_menu` VALUES (1600869400777920514, 43, '后勤账目管理', 1, 'bkMoney', 'back/bkMoney/list', '', 'el-icon-s-check', 5, 1, '2022-12-08 23:06:22', '2022-12-08 23:06:22', 0);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int(0) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1600836249737289731 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '角色管理', '1', 'com.atguigu.auth.controller.SysRoleController.save()', 'POST', '1', 'admin', '', '/admin/auth/sysRole/save', '', '{\"param\":{},\"roleCode\":\"\",\"roleName\":\"test\",\"id\":5}', '{\"code\":200,\"message\":\"成功\"}', 0, '', NULL, '2022-05-26 15:59:44', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (2, '角色管理', 'DELETE', 'com.atguigu.auth.controller.SysRoleController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/auth/sysRole/remove/5', '', '', '{\"code\":200,\"message\":\"成功\"}', 0, '', NULL, '2022-05-26 16:05:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (3, '角色管理', 'DELETE', 'com.atguigu.auth.controller.SysRoleController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/auth/sysRole/remove/4', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-26 16:52:40', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (4, '角色管理', 'UPDATE', 'com.atguigu.auth.controller.SysRoleController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysRole/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1622507920000,\"param\":{},\"roleCode\":\"\",\"roleName\":\"普通管理员\",\"description\":\"普通管理员\",\"updateTime\":1645670566000,\"id\":2}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 08:47:54', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (5, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"SysRole\",\"select\":false,\"level\":3,\"updateTime\":1653287810000,\"type\":1,\"parentId\":2,\"isDeleted\":0,\"children\":[{\"code\":\"btn.SysRole.list\",\"select\":false,\"level\":4,\"updateTime\":1622460772000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"id\":10},{\"code\":\"btn.SysRole.add\",\"select\":false,\"level\":4,\"updateTime\":1653547976000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"id\":11},{\"code\":\"btn.SysRole.update\",\"select\":false,\"level\":4,\"updateTime\":1653547981000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"id\":12},{\"code\":\"btn.SysRole.remove\",\"select\":false,\"level\":4,\"updateTime\":1622507874000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"id\":13},{\"code\":\"btn.SysRole.assignAuth\",\"select\":false,\"level\":4,\"toCode\":\"AssignAuth\",\"updateTime\":1653376735000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1653297494000,\"param\":{},\"name\":\"分配权限\",\"id\":19}],\"createTime\":1622455537000,\"param\":{},\"name\":\"角色管理\",\"id\":4}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 08:48:08', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (6, '岗位管理', 'UPDATE', 'com.atguigu.auth.controller.SysPostController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysPost/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1653359648000,\"param\":{},\"name\":\"总经理\",\"description\":\"2\",\"postCode\":\"zjl\",\"id\":6,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 08:56:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (7, '岗位管理', 'INSERT', 'com.atguigu.auth.controller.SysPostController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/auth/sysPost/save', '127.0.0.1', '{\"param\":{},\"name\":\"网咨\",\"description\":\"\",\"postCode\":\"wz\",\"id\":7,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 08:56:37', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (8, '岗位管理', 'DELETE', 'com.atguigu.auth.controller.SysPostController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/auth/sysPost/remove/7', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 08:56:41', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (9, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"btn.sysDept.list\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653358064000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653358064000,\"param\":{},\"name\":\"查看\",\"id\":21}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:02:49', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (10, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"btn.sysDept.add\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653463887000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463887000,\"param\":{},\"name\":\"添加\",\"id\":24}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:02:55', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (11, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"btn.sysDept.update\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653463901000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463901000,\"param\":{},\"name\":\"修改\",\"id\":25}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:03:01', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (12, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"btn.sysDept.remove\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653463919000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463919000,\"param\":{},\"name\":\"删除\",\"id\":26}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:03:07', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (13, '部门管理', 'UPDATE', 'com.atguigu.auth.controller.SysDeptController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysDept/update', '127.0.0.1', '{\"leader\":\"张老师\",\"updateTime\":1653447072000,\"parentId\":2012,\"sortValue\":1,\"isDeleted\":0,\"createTime\":1653447072000,\"param\":{},\"phone\":\"15090909909\",\"name\":\"Java学科\",\"id\":2016,\"treePath\":\",1,20,2012,2012,\",\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:11:28', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (14, '部门管理', 'INSERT', 'com.atguigu.auth.controller.SysDeptController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/auth/sysDept/save', '127.0.0.1', '{\"leader\":\"李老师\",\"parentId\":2012,\"param\":{},\"phone\":\"15090980989\",\"name\":\"大数据学科\",\"id\":2017,\"treePath\":\",1,20,2012,2012,\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:11:54', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (15, '部门管理', 'UPDATE', 'com.atguigu.auth.controller.SysDeptController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysDept/update', '127.0.0.1', '{\"leader\":\"李老师\",\"parentId\":2012,\"sortValue\":1,\"isDeleted\":0,\"createTime\":1653613914000,\"param\":{},\"phone\":\"15090980989\",\"name\":\"大数据学科\",\"id\":2017,\"treePath\":\",1,20,2012,2012,\",\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:16:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (16, '角色管理', 'UPDATE', 'com.atguigu.auth.controller.SysRoleController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysRole/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1622507920000,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"description\":\"普通管理员\",\"updateTime\":1645670566000,\"id\":2}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:28:15', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (17, '角色管理', 'INSERT', 'com.atguigu.auth.controller.SysRoleController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/auth/sysRole/save', '127.0.0.1', '{\"param\":{},\"roleCode\":\"\",\"roleName\":\"用户管理员\",\"id\":6}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 10:42:18', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (18, '角色管理', 'UPDATE', 'com.atguigu.auth.controller.SysRoleController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysRole/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1653619337000,\"param\":{},\"roleCode\":\"\",\"roleName\":\"用户管理员\",\"updateTime\":1653619337000,\"id\":6}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 10:43:59', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysUser\",\"select\":false,\"level\":3,\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysUser/list\",\"sortValue\":1,\"component\":\"auth/sysUser/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysUser.list\",\"select\":false,\"level\":4,\"updateTime\":1653957062000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"id\":6,\"status\":1},{\"code\":\"bnt.sysUser.add\",\"select\":false,\"level\":4,\"updateTime\":1653957062000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"id\":7,\"status\":1},{\"code\":\"bnt.sysUser.update\",\"select\":false,\"level\":4,\"updateTime\":1653957062000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"id\":8,\"status\":1},{\"code\":\"bnt.sysUser.remove\",\"select\":false,\"level\":4,\"updateTime\":1653957062000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"id\":9,\"status\":1},{\"code\":\"bnt.sysUser.assignRole\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1653297272000,\"param\":{},\"name\":\"分配角色\",\"id\":18,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"用户管理\",\"perms\":\"bnt.sysUser.list\",\"id\":3,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:14:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (20, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysRole\",\"select\":false,\"level\":3,\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysRole/list\",\"sortValue\":0,\"component\":\"auth/sysRole/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysRole.list\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysRole.list\",\"id\":10,\"status\":1},{\"code\":\"bnt.sysRole.add\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysRole.add\",\"id\":11,\"status\":1},{\"code\":\"bnt.sysRole.update\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysRole.update\",\"id\":12,\"status\":1},{\"code\":\"bnt.sysRole.remove\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysRole.remove\",\"id\":13,\"status\":1},{\"code\":\"bnt.sysRole.assignAuth\",\"select\":false,\"level\":4,\"toCode\":\"assignAuth\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1653297494000,\"param\":{},\"name\":\"分配权限\",\"perms\":\"bnt.sysRole.assignAuth\",\"id\":19,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"角色管理\",\"perms\":\" bnt.sysRole.list\",\"id\":4,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:18:12', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (21, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysMenu\",\"select\":false,\"level\":3,\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysMenu/list\",\"sortValue\":0,\"component\":\"auth/sysMenu/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysMenu.list\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysMenu.list\",\"id\":14,\"status\":1},{\"code\":\"bnt.sysMenu.add\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysMenu.add\",\"id\":15,\"status\":1},{\"code\":\"bnt.sysMenu.update\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysMenu.update\",\"id\":16,\"status\":1},{\"code\":\"bnt.sysMenu.remove\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysMenu.remove\",\"id\":17,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"菜单管理\",\"perms\":\"bnt.sysMenu.list\",\"id\":5,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:18:37', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (22, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysDept\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysDept/list\",\"sortValue\":0,\"component\":\"auth/sysDept/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysDept.list\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653358064000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysDept.list\",\"id\":21,\"status\":1},{\"code\":\"bnt.sysDept.add\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463887000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysDept.add\",\"id\":24,\"status\":1},{\"code\":\"bnt.sysDept.update\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463901000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysDept.update\",\"id\":25,\"status\":1},{\"code\":\"bnt.sysDept.remove\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463919000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysDept.remove\",\"id\":26,\"status\":1}],\"createTime\":1653358025000,\"param\":{},\"name\":\"部门管理\",\"perms\":\"bnt.sysDept.list\",\"id\":20,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:19:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (23, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysPost\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysPost/list\",\"sortValue\":0,\"component\":\"auth/sysPost/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysPost.list\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653359145000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysPost.list\",\"id\":23,\"status\":1},{\"code\":\"bnt.sysPost.add\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653463964000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysPost.add\",\"id\":27,\"status\":1},{\"code\":\"bnt.sysPost.update\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653463978000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysPost.update\",\"id\":28,\"status\":1},{\"code\":\"bnt.sysPost.remove\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653463991000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysPost.remove\",\"id\":29,\"status\":1}],\"createTime\":1653359130000,\"param\":{},\"name\":\"岗位管理\",\"perms\":\"bnt.sysPost.list\",\"id\":22,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:19:23', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (24, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysOperLog\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysOperLog/list\",\"sortValue\":0,\"component\":\"auth/sysOperLog/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysOperLog.list\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":30,\"isDeleted\":0,\"children\":[],\"createTime\":1653552617000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysOperLog.list\",\"id\":31,\"status\":1}],\"createTime\":1653552599000,\"param\":{},\"name\":\"操作日志\",\"perms\":\"bnt.sysOperLog.list\",\"id\":30,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:19:40', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (25, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysLoginLog\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysLoginLog/list\",\"sortValue\":0,\"component\":\"auth/sysLoginLog/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysLoginLog.list\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":32,\"isDeleted\":0,\"children\":[],\"createTime\":1653554191000,\"param\":{},\"name\":\"查看\",\"id\":33,\"status\":1}],\"createTime\":1653554173000,\"param\":{},\"name\":\"登录日志\",\"perms\":\" bnt.sysLoginLog.list\",\"id\":32,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:20:09', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (26, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysUser\",\"select\":false,\"level\":2,\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysUser\",\"sortValue\":1,\"component\":\"auth/sysUser/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysUser.list\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysUser.list\",\"id\":6,\"status\":1},{\"code\":\"bnt.sysUser.add\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysUser.add\",\"id\":7,\"status\":1},{\"code\":\"bnt.sysUser.update\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysUser.update\",\"id\":8,\"status\":1},{\"code\":\"bnt.sysUser.remove\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysUser.remove\",\"id\":9,\"status\":1},{\"code\":\"bnt.sysUser.assignRole\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1653297272000,\"param\":{},\"name\":\"分配角色\",\"perms\":\"bnt.sysUser.assignRole\",\"id\":18,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"用户管理\",\"perms\":\"bnt.sysUser.list\",\"id\":3,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:41:35', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (27, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysRole\",\"select\":false,\"level\":2,\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysRole\",\"sortValue\":0,\"component\":\"auth/sysRole/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysRole.list\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysRole.list\",\"id\":10,\"status\":1},{\"code\":\"bnt.sysRole.add\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysRole.add\",\"id\":11,\"status\":1},{\"code\":\"bnt.sysRole.update\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysRole.update\",\"id\":12,\"status\":1},{\"code\":\"bnt.sysRole.remove\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysRole.remove\",\"id\":13,\"status\":1},{\"code\":\"bnt.sysRole.assignAuth\",\"select\":false,\"level\":3,\"toCode\":\"assignAuth\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1653297494000,\"param\":{},\"name\":\"分配权限\",\"perms\":\"bnt.sysRole.assignAuth\",\"id\":19,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"角色管理\",\"perms\":\" bnt.sysRole.list\",\"id\":4,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:41:42', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (28, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysMenu\",\"select\":false,\"level\":2,\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysMenu\",\"sortValue\":0,\"component\":\"auth/sysMenu/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysMenu.list\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysMenu.list\",\"id\":14,\"status\":1},{\"code\":\"bnt.sysMenu.add\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysMenu.add\",\"id\":15,\"status\":1},{\"code\":\"bnt.sysMenu.update\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysMenu.update\",\"id\":16,\"status\":1},{\"code\":\"bnt.sysMenu.remove\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysMenu.remove\",\"id\":17,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"菜单管理\",\"perms\":\"bnt.sysMenu.list\",\"id\":5,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:41:51', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (29, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysDept\",\"select\":false,\"level\":2,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysDept\",\"sortValue\":0,\"component\":\"auth/sysDept/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysDept.list\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653358064000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysDept.list\",\"id\":21,\"status\":1},{\"code\":\"bnt.sysDept.add\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463887000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysDept.add\",\"id\":24,\"status\":1},{\"code\":\"bnt.sysDept.update\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463901000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysDept.update\",\"id\":25,\"status\":1},{\"code\":\"bnt.sysDept.remove\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463919000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysDept.remove\",\"id\":26,\"status\":1}],\"createTime\":1653358025000,\"param\":{},\"name\":\"部门管理\",\"perms\":\"bnt.sysDept.list\",\"id\":20,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:41:58', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (30, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysPost\",\"select\":false,\"level\":2,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysPost\",\"sortValue\":0,\"component\":\"auth/sysPost/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysPost.list\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653359145000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysPost.list\",\"id\":23,\"status\":1},{\"code\":\"bnt.sysPost.add\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653463964000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysPost.add\",\"id\":27,\"status\":1},{\"code\":\"bnt.sysPost.update\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653463978000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysPost.update\",\"id\":28,\"status\":1},{\"code\":\"bnt.sysPost.remove\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653463991000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysPost.remove\",\"id\":29,\"status\":1}],\"createTime\":1653359130000,\"param\":{},\"name\":\"岗位管理\",\"perms\":\"bnt.sysPost.list\",\"id\":22,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-11-22 18:05:37', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (31, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysOperLog\",\"select\":false,\"level\":2,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysOperLog\",\"sortValue\":0,\"component\":\"auth/sysOperLog/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysOperLog.list\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":30,\"isDeleted\":0,\"children\":[],\"createTime\":1653552617000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysOperLog.list\",\"id\":31,\"status\":1}],\"createTime\":1653552599000,\"param\":{},\"name\":\"操作日志\",\"perms\":\"bnt.sysOperLog.list\",\"id\":30,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-08 21:17:36', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (32, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysLoginLog\",\"select\":false,\"level\":2,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysLoginLog\",\"sortValue\":0,\"component\":\"auth/sysLoginLog/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysLoginLog.list\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":32,\"isDeleted\":0,\"children\":[],\"createTime\":1653554191000,\"param\":{},\"name\":\"查看\",\"id\":33,\"status\":1}],\"createTime\":1653554173000,\"param\":{},\"name\":\"登录日志\",\"perms\":\" bnt.sysLoginLog.list\",\"id\":32,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-08 21:18:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (33, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"\",\"type\":0,\"parentId\":2,\"path\":\"log\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"日志管理\",\"perms\":\"\",\"id\":34,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-08 21:20:09', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (34, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"visible\":1,\"icon\":\"\",\"type\":0,\"parentId\":0,\"path\":\"order\",\"sortValue\":1,\"component\":\"Layout\",\"param\":{},\"name\":\"订单管理\",\"perms\":\"\",\"id\":35,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-10-23 17:14:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (35, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"visible\":1,\"icon\":\"\",\"type\":1,\"parentId\":35,\"path\":\"orderInfo\",\"sortValue\":1,\"component\":\"order/orderInfo/list\",\"param\":{},\"name\":\"订单列表\",\"perms\":\"bnt.orderInfo.list\",\"id\":36,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-08 21:21:44', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (36, '岗位管理', 'INSERT', 'com.atguigu.system.controller.SysPostController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysPost/save', '127.0.0.1', '{\"param\":{},\"name\":\"运营总监\",\"description\":\"\",\"postCode\":\"yyzj\",\"id\":8,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (37, '角色管理', 'INSERT', 'com.atguigu.system.controller.SysRoleController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysRole/save', '127.0.0.1', '{\"param\":{},\"roleCode\":\"\",\"roleName\":\"\",\"id\":8}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (38, '角色管理', 'UPDATE', 'com.atguigu.system.controller.SysRoleController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysRole/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1654681144000,\"param\":{},\"roleCode\":\"\",\"roleName\":\"\",\"updateTime\":1654681144000,\"id\":8}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (39, '角色管理', 'UPDATE', 'com.atguigu.system.controller.SysRoleController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysRole/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1654681144000,\"param\":{},\"roleCode\":\"\",\"roleName\":\"\",\"updateTime\":1654681144000,\"id\":8}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (40, '角色管理', 'UPDATE', 'com.atguigu.system.controller.SysRoleController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysRole/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1654681144000,\"param\":{},\"roleCode\":\"yhgly\",\"roleName\":\"用户管理员\",\"updateTime\":1654681144000,\"id\":8}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-08 21:00:42', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (41, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-phone\",\"type\":0,\"parentId\":0,\"path\":\"order\",\"sortValue\":1,\"component\":\"Layout\",\"param\":{},\"name\":\"订单管理\",\"perms\":\"\",\"id\":35,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-08 21:16:38', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (42, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-phone\",\"updateTime\":1654735813000,\"type\":0,\"parentId\":0,\"path\":\"order\",\"sortValue\":1,\"component\":\"Layout\",\"isDeleted\":0,\"children\":[],\"createTime\":1654735813000,\"param\":{},\"name\":\"订单管理\",\"perms\":\"\",\"id\":35,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (43, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-s-help\",\"type\":1,\"parentId\":35,\"path\":\"orderInfo\",\"sortValue\":1,\"component\":\"order/orderInfo/list\",\"param\":{},\"name\":\"订单列表\",\"perms\":\"bnt.orderInfo.list\",\"id\":36,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (44, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":36,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.add\",\"id\":37,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (45, '菜单管理', 'DELETE', 'com.atguigu.system.controller.SysMenuController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/system/sysMenu/remove/37', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (46, '菜单管理', 'DELETE', 'com.atguigu.system.controller.SysMenuController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/system/sysMenu/remove/36', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (47, '菜单管理', 'DELETE', 'com.atguigu.system.controller.SysMenuController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/system/sysMenu/remove/35', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-11-22 18:05:37', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (48, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-s-custom\",\"updateTime\":1654737767000,\"type\":1,\"parentId\":2,\"path\":\"sysUser\",\"sortValue\":1,\"component\":\"system/sysUser/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysUser.list\",\"id\":6,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysUser.add\",\"id\":7,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysUser.update\",\"id\":8,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysUser.remove\",\"id\":9,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653297272000,\"param\":{},\"name\":\"分配角色\",\"perms\":\"bnt.sysUser.assignRole\",\"id\":18,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"用户管理\",\"perms\":\"\",\"id\":3,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-11-22 18:05:37', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (49, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-user-solid\",\"updateTime\":1654737768000,\"type\":1,\"parentId\":2,\"path\":\"sysRole\",\"sortValue\":1,\"component\":\"system/sysRole/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":4,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysRole.list\",\"id\":10,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":4,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysRole.add\",\"id\":11,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":4,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysRole.update\",\"id\":12,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":4,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysRole.remove\",\"id\":13,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":4,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1653297494000,\"param\":{},\"name\":\"分配权限\",\"perms\":\"bnt.sysRole.assignAuth\",\"id\":19,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"角色管理\",\"perms\":\"\",\"id\":4,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-11-22 18:05:37', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (50, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-s-unfold\",\"updateTime\":1654737769000,\"type\":1,\"parentId\":2,\"path\":\"sysMenu\",\"sortValue\":1,\"component\":\"system/sysMenu/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysMenu.list\",\"id\":14,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysMenu.add\",\"id\":15,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysMenu.update\",\"id\":16,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysMenu.remove\",\"id\":17,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"菜单管理\",\"perms\":\"\",\"id\":5,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-11-22 18:05:37', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (51, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-s-operation\",\"updateTime\":1654737776000,\"type\":1,\"parentId\":2,\"path\":\"sysDept\",\"sortValue\":1,\"component\":\"system/sysDept/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":20,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653358064000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysDept.list\",\"id\":21,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":20,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463887000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysDept.add\",\"id\":24,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":20,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463901000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysDept.update\",\"id\":25,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":20,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463919000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysDept.remove\",\"id\":26,\"status\":1}],\"createTime\":1653358025000,\"param\":{},\"name\":\"部门管理\",\"perms\":\"\",\"id\":20,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (52, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-more-outline\",\"updateTime\":1654737777000,\"type\":1,\"parentId\":2,\"path\":\"sysPost\",\"sortValue\":1,\"component\":\"system/sysPost/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":22,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653359145000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysPost.list\",\"id\":23,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":22,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463964000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysPost.add\",\"id\":27,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":22,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463978000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysPost.update\",\"id\":28,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":22,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463991000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysPost.remove\",\"id\":29,\"status\":1}],\"createTime\":1653359130000,\"param\":{},\"name\":\"岗位管理\",\"perms\":\"\",\"id\":22,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:26', 0);
INSERT INTO `sys_oper_log` VALUES (53, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-tickets\",\"updateTime\":1653974966000,\"type\":0,\"parentId\":2,\"path\":\"log\",\"sortValue\":1,\"component\":\"ParentView\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737785000,\"type\":1,\"parentId\":34,\"path\":\"sysOperLog\",\"sortValue\":1,\"component\":\"system/sysOperLog/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":30,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653552617000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysOperLog.list\",\"id\":31,\"status\":1}],\"createTime\":1653552599000,\"param\":{},\"name\":\"操作日志\",\"perms\":\"\",\"id\":30,\"status\":1},{\"select\":false,\"updateTime\":1654737787000,\"type\":1,\"parentId\":34,\"path\":\"sysLoginLog\",\"sortValue\":1,\"component\":\"system/sysLoginLog/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":32,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653554191000,\"param\":{},\"name\":\"查看\",\"id\":33,\"status\":1}],\"createTime\":1653554173000,\"param\":{},\"name\":\"登录日志\",\"perms\":\"\",\"id\":32,\"status\":1}],\"createTime\":1653974587000,\"param\":{},\"name\":\"日志管理\",\"perms\":\"\",\"id\":34,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-11-22 18:05:37', '2022-12-08 21:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (54, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-document-remove\",\"updateTime\":1654737785000,\"type\":1,\"parentId\":34,\"path\":\"sysOperLog\",\"sortValue\":1,\"component\":\"system/sysOperLog/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":30,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653552617000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysOperLog.list\",\"id\":31,\"status\":1}],\"createTime\":1653552599000,\"param\":{},\"name\":\"操作日志\",\"perms\":\"\",\"id\":30,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-08 21:17:36', '2022-12-08 21:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (55, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-s-goods\",\"updateTime\":1654737787000,\"type\":1,\"parentId\":34,\"path\":\"sysLoginLog\",\"sortValue\":1,\"component\":\"system/sysLoginLog/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":32,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653554191000,\"param\":{},\"name\":\"查看\",\"id\":33,\"status\":1}],\"createTime\":1653554173000,\"param\":{},\"name\":\"登录日志\",\"perms\":\"\",\"id\":32,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-08 21:18:32', '2022-12-08 21:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (56, '用户管理', 'DELETE', 'com.atguigu.system.controller.SysUserController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/system/sysUser/remove/4', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-08 21:20:09', '2022-12-08 21:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (57, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":4,\"path\":\"assignAuth\",\"sortValue\":1,\"component\":\"system/sysRole/assignAuth\",\"isDeleted\":0,\"children\":[],\"createTime\":1653297494000,\"param\":{},\"name\":\"分配权限\",\"perms\":\"bnt.sysRole.assignAuth\",\"id\":19,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-10-23 17:14:32', '2022-12-08 21:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (58, '角色管理', 'ASSGIN', 'com.atguigu.system.controller.SysMenuController.doAssign()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/doAssign', '127.0.0.1', '{\"roleId\":2,\"menuIdList\":[2,3,6,7,8,5,14,20,21]}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-08 21:21:44', '2022-12-08 21:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (59, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-s-help\",\"type\":0,\"parentId\":0,\"path\":\"vod\",\"sortValue\":1,\"component\":\"Layout\",\"param\":{},\"name\":\"点播管理\",\"perms\":\"\",\"id\":35,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (60, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-phone\",\"type\":1,\"parentId\":35,\"path\":\"teacher/list\",\"sortValue\":1,\"component\":\"vod/teacher/list\",\"param\":{},\"name\":\"讲师列表\",\"perms\":\"\",\"id\":36,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (61, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":36,\"path\":\"teacher/create\",\"sortValue\":1,\"component\":\"vod/teacher/form\",\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.teacher.add\",\"id\":37,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (62, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":36,\"path\":\"teacher/edit/:id\",\"sortValue\":1,\"component\":\"vod/teacher/form\",\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.teacher.update\",\"id\":38,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-02 17:14:32', '2022-12-08 21:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (63, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":36,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.teacher.list\",\"id\":39,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-08 21:00:42', '2022-12-08 21:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (1600836249737289730, '角色管理', 'INSERT', 'com.atguigu.system.controller.SysRoleController.saveRole()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysRole/save', '127.0.0.1', '{\"param\":{},\"roleCode\":\"4\",\"roleName\":\"法外狂徒\",\"id\":\"1600836249603072002\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-12-08 21:16:38', '2022-12-08 21:48:32', 0);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '岗位名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态（1正常 0停用）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (5, 'dsz', '董事长', '1', 1, '2022-05-24 10:33:53', NULL, 0);
INSERT INTO `sys_post` VALUES (6, 'zjl', '总经理', '2', 1, '2022-05-24 10:34:08', NULL, 0);
INSERT INTO `sys_post` VALUES (7, 'wz', '网咨', '', 1, '2022-05-27 08:56:41', '2022-05-27 08:56:41', 1);
INSERT INTO `sys_post` VALUES (8, 'yyzj', '运营总监', '', 1, '2022-06-08 17:14:21', NULL, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1600836249603072003 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', 'SYSTEM', '系统管理员', '2021-05-31 18:09:18', '2022-11-26 12:01:10', 0);
INSERT INTO `sys_role` VALUES (2, '普通管理员', 'COMMON', '普通管理员', '2021-06-01 08:38:40', '2022-11-26 12:01:10', 0);
INSERT INTO `sys_role` VALUES (8, '用户管理员', 'yhgly', NULL, '2022-06-08 17:39:04', '2022-11-26 12:00:39', 0);
INSERT INTO `sys_role` VALUES (1596339234399694849, '测试角色2', 'testManager2', '测试角色2', '2022-11-26 11:05:07', '2022-11-26 12:00:39', 0);
INSERT INTO `sys_role` VALUES (1596339234399694850, '测试角色1', 'testManager1', '测试角色1', '2022-11-26 11:26:20', '2022-11-26 12:00:39', 0);
INSERT INTO `sys_role` VALUES (1596362503886536705, '角色管理员atguigu', 'role', '角色管理员', '2022-11-26 12:37:34', '2022-11-26 12:37:34', 0);
INSERT INTO `sys_role` VALUES (1596367669050306561, '角色管理员atguigu', 'role', '角色管理员', '2022-11-26 12:58:06', '2022-11-26 12:58:06', 0);
INSERT INTO `sys_role` VALUES (1600836249603072002, '法外狂徒', 'role', NULL, '2022-12-08 20:54:38', '2022-12-08 20:54:38', 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(0) NOT NULL DEFAULT 0,
  `menu_id` bigint(0) NOT NULL DEFAULT 0,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1600837564999720962 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 2, 2, '2022-11-22 18:05:37', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (2, 2, 3, '2022-12-08 21:17:36', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (3, 2, 6, '2022-12-08 21:18:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (4, 2, 7, '2022-12-08 21:20:09', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (5, 2, 8, '2022-10-23 17:14:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (6, 2, 9, '2022-12-08 21:21:44', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (7, 2, 18, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (8, 2, 4, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (9, 2, 10, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (10, 2, 11, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (11, 2, 12, '2022-12-08 21:00:42', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (12, 2, 13, '2022-12-08 21:16:38', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (13, 2, 19, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (14, 2, 5, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (15, 2, 14, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (16, 2, 15, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (17, 2, 16, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (18, 2, 17, '2022-11-22 18:05:37', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (19, 2, 2, '2022-11-22 18:05:37', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (20, 2, 3, '2022-11-22 18:05:37', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (21, 2, 6, '2022-11-22 18:05:37', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (22, 2, 7, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (23, 2, 8, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 1);
INSERT INTO `sys_role_menu` VALUES (24, 2, 2, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 0);
INSERT INTO `sys_role_menu` VALUES (25, 2, 3, '2022-12-02 17:14:32', '2022-12-08 21:48:54', 0);
INSERT INTO `sys_role_menu` VALUES (26, 2, 6, '2022-11-22 18:05:37', '2022-12-08 21:49:07', 0);
INSERT INTO `sys_role_menu` VALUES (27, 2, 7, '2022-12-08 21:17:36', '2022-12-08 21:49:07', 0);
INSERT INTO `sys_role_menu` VALUES (28, 2, 8, '2022-12-08 21:18:32', '2022-12-08 21:49:07', 0);
INSERT INTO `sys_role_menu` VALUES (29, 2, 5, '2022-12-08 21:20:09', '2022-12-08 21:49:07', 0);
INSERT INTO `sys_role_menu` VALUES (30, 2, 14, '2022-10-23 17:14:32', '2022-12-08 21:49:07', 0);
INSERT INTO `sys_role_menu` VALUES (31, 2, 20, '2022-12-08 21:21:44', '2022-12-08 21:49:07', 0);
INSERT INTO `sys_role_menu` VALUES (32, 2, 21, '2022-12-02 17:14:32', '2022-12-08 21:49:07', 0);
INSERT INTO `sys_role_menu` VALUES (1600836558777802754, 1600836249603072002, 2, '2022-12-02 17:14:32', '2022-12-08 21:49:07', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558777802755, 1600836249603072002, 3, '2022-12-02 17:14:32', '2022-12-08 21:49:07', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558777802756, 1600836249603072002, 6, '2022-12-02 17:14:32', '2022-12-08 21:49:07', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558840717313, 1600836249603072002, 7, '2022-12-08 21:00:42', '2022-12-08 21:49:07', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558840717314, 1600836249603072002, 8, '2022-12-08 21:16:38', '2022-12-08 21:49:07', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558840717315, 1600836249603072002, 9, '2022-12-02 17:14:32', '2022-12-08 21:49:07', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558840717316, 1600836249603072002, 18, '2022-12-02 17:14:32', '2022-12-08 21:49:07', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558907826177, 1600836249603072002, 4, '2022-12-02 17:14:32', '2022-12-08 21:49:07', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558907826178, 1600836249603072002, 10, '2022-12-02 17:14:32', '2022-12-08 21:49:07', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558907826179, 1600836249603072002, 11, '2022-12-02 17:14:32', '2022-12-08 21:49:07', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558907826180, 1600836249603072002, 12, '2022-11-22 18:05:37', '2022-12-08 21:49:07', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558974935041, 1600836249603072002, 13, '2022-11-22 18:05:37', '2022-12-08 21:49:07', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558974935042, 1600836249603072002, 19, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558974935043, 1600836249603072002, 5, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836558974935044, 1600836249603072002, 14, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559037849602, 1600836249603072002, 15, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559037849603, 1600836249603072002, 16, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559037849604, 1600836249603072002, 17, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559104958465, 1600836249603072002, 20, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559104958466, 1600836249603072002, 21, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559104958467, 1600836249603072002, 24, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559104958468, 1600836249603072002, 25, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559167873026, 1600836249603072002, 26, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559167873027, 1600836249603072002, 22, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559167873028, 1600836249603072002, 23, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559234981889, 1600836249603072002, 27, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559234981890, 1600836249603072002, 28, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559234981891, 1600836249603072002, 29, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559234981892, 1600836249603072002, 34, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559302090754, 1600836249603072002, 30, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559302090755, 1600836249603072002, 31, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559302090756, 1600836249603072002, 32, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600836559369199618, 1600836249603072002, 33, '2022-12-08 20:55:52', '2022-12-08 20:59:52', 1);
INSERT INTO `sys_role_menu` VALUES (1600837564425101313, 1600836249603072002, 2, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564488015873, 1600836249603072002, 3, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564488015874, 1600836249603072002, 6, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564488015875, 1600836249603072002, 7, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564488015876, 1600836249603072002, 8, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564550930434, 1600836249603072002, 9, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564550930435, 1600836249603072002, 18, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564550930436, 1600836249603072002, 4, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564550930437, 1600836249603072002, 10, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564613844994, 1600836249603072002, 11, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564613844995, 1600836249603072002, 12, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564613844996, 1600836249603072002, 13, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564676759554, 1600836249603072002, 19, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564676759555, 1600836249603072002, 5, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564676759556, 1600836249603072002, 14, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564676759557, 1600836249603072002, 15, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564676759558, 1600836249603072002, 16, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564743868417, 1600836249603072002, 17, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564743868418, 1600836249603072002, 20, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564743868419, 1600836249603072002, 21, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564806782977, 1600836249603072002, 24, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564806782978, 1600836249603072002, 25, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564806782979, 1600836249603072002, 26, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564806782980, 1600836249603072002, 22, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564869697537, 1600836249603072002, 23, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564869697538, 1600836249603072002, 27, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564869697539, 1600836249603072002, 28, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564869697540, 1600836249603072002, 29, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564936806402, 1600836249603072002, 34, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564936806403, 1600836249603072002, 30, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564936806404, 1600836249603072002, 31, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564936806405, 1600836249603072002, 32, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);
INSERT INTO `sys_role_menu` VALUES (1600837564999720961, 1600836249603072002, 33, '2022-12-08 20:59:52', '2022-12-08 20:59:52', 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机',
  `head_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '头像地址',
  `dept_id` bigint(0) DEFAULT NULL COMMENT '部门id',
  `post_id` bigint(0) DEFAULT NULL COMMENT '岗位id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `status` tinyint(0) DEFAULT NULL COMMENT '状态（1：正常 0：停用）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1600837429964103682 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '96e79218965eb72c92a549dd5a330112', 'admin', '15099909888', 'http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc', 1021, 5, NULL, 1, '2021-10-31 18:08:43', '2022-12-08 21:47:22', 0);
INSERT INTO `sys_user` VALUES (2, 'wangqq', '96e79218965eb72c92a549dd5a330112', '王倩倩', '15010546381', 'http://r61cnlsfq.hn-bkt.clouddn.com/b09b3467-3d99-437a-bd2e-dd8c9be92bb8', 1022, 6, NULL, 1, '2022-11-08 10:35:38', '2022-12-08 21:47:25', 0);
INSERT INTO `sys_user` VALUES (3, 'wanggang', '96e79218965eb72c92a549dd5a330112', '王刚', '18909098909', NULL, 1024, 5, NULL, 0, '2022-11-24 11:05:40', '2022-12-08 21:47:31', 0);
INSERT INTO `sys_user` VALUES (1600837133745577985, 'zhangnx', '78d94cfbcbb6f351b3def3688f7d2b51', '张南星', '13314091627', NULL, NULL, NULL, NULL, 1, '2022-12-08 20:58:09', '2022-12-08 20:58:09', 0);
INSERT INTO `sys_user` VALUES (1600837250628247553, 'anyx', '78d94cfbcbb6f351b3def3688f7d2b51', '安诣暄', '18801225506', NULL, NULL, NULL, NULL, 1, '2022-12-08 20:58:37', '2022-12-08 20:58:37', 0);
INSERT INTO `sys_user` VALUES (1600837429964103681, 'zhangsan', '96e79218965eb72c92a549dd5a330112', '张三', '18888888888', NULL, NULL, NULL, NULL, 1, '2022-12-08 20:59:20', '2022-12-08 20:59:20', 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '角色id',
  `user_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '用户id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_admin_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1600837523627106307 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (2, 2, 2, '2022-01-20 20:49:37', '2022-02-24 10:43:07', 0);
INSERT INTO `sys_user_role` VALUES (3, 1, 1, '2022-05-19 10:37:27', '2022-05-24 16:55:53', 1);
INSERT INTO `sys_user_role` VALUES (4, 2, 1, '2022-05-19 10:37:27', '2022-05-24 16:55:53', 1);
INSERT INTO `sys_user_role` VALUES (5, 1, 1, '2022-05-24 16:55:53', '2022-05-24 16:55:53', 0);
INSERT INTO `sys_user_role` VALUES (6, 2, 3, '2022-05-25 16:09:31', '2022-05-25 16:09:31', 0);
INSERT INTO `sys_user_role` VALUES (7, 2, 4, '2022-06-02 11:08:14', '2022-06-02 11:15:36', 1);
INSERT INTO `sys_user_role` VALUES (8, 2, 4, '2022-06-02 11:15:36', '2022-06-02 16:10:53', 1);
INSERT INTO `sys_user_role` VALUES (9, 1, 4, '2022-06-02 11:15:36', '2022-06-02 16:10:53', 1);
INSERT INTO `sys_user_role` VALUES (10, 1, 4, '2022-06-02 16:10:53', '2022-06-02 16:10:53', 0);
INSERT INTO `sys_user_role` VALUES (1600837500982059009, 1600836249603072002, 1600837429964103681, '2022-12-08 20:59:37', '2022-12-08 20:59:42', 1);
INSERT INTO `sys_user_role` VALUES (1600837523627106306, 1600836249603072002, 1600837429964103681, '2022-12-08 20:59:42', '2022-12-08 20:59:42', 0);

SET FOREIGN_KEY_CHECKS = 1;
