/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : 127.0.0.1:3306
 Source Schema         : bootdo

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 13/09/2021 23:00:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '书名',
  `author` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '作者',
  `category` tinyint(4) NOT NULL COMMENT '图书类别 0：科技 1：人文 2：悬疑  3：经济  4：农业  5：其它',
  `introduction` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简介',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `name_idex` (`bookname`,`author`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='图书表';

-- ----------------------------
-- Records of books
-- ----------------------------
BEGIN;
INSERT INTO `books` VALUES (1, '西游记', '吴承恩', 1, '大师兄，师傅被妖怪抓走啦', '2021-09-13 22:39:08');
INSERT INTO `books` VALUES (2, '红楼梦', '曹雪芹', 1, '少不读红楼', '2021-09-13 22:38:52');
INSERT INTO `books` VALUES (3, '三国演义', '罗贯中', 1, '老不读三国', '2021-09-13 22:59:51');
INSERT INTO `books` VALUES (4, '水浒传', '施耐庵', 1, '', '2021-09-13 22:59:30');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (6, 0, '研发部', 1, 1);
INSERT INTO `sys_dept` VALUES (7, 6, '研發一部', 1, 1);
INSERT INTO `sys_dept` VALUES (8, 6, '研发二部', 2, 1);
INSERT INTO `sys_dept` VALUES (9, 0, '销售部', 2, 1);
INSERT INTO `sys_dept` VALUES (10, 9, '销售一部', 1, 1);
INSERT INTO `sys_dept` VALUES (11, 0, '产品部', 3, 1);
INSERT INTO `sys_dept` VALUES (12, 11, '产品一部', 1, 1);
INSERT INTO `sys_dept` VALUES (13, 0, '测试部', 5, 1);
INSERT INTO `sys_dept` VALUES (14, 13, '测试一部', 1, 1);
INSERT INTO `sys_dept` VALUES (15, 13, '测试二部', 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` int(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES (1, '正常', '0', 'del_flag', '删除标记', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (3, '显示', '1', 'show_hide', '显示/隐藏', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (4, '隐藏', '0', 'show_hide', '显示/隐藏', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (5, '是', '1', 'yes_no', '是/否', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (6, '否', '0', 'yes_no', '是/否', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (7, '红色', 'red', 'color', '颜色值', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (8, '绿色', 'green', 'color', '颜色值', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (9, '蓝色', 'blue', 'color', '颜色值', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (10, '黄色', 'yellow', 'color', '颜色值', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (11, '橙色', 'orange', 'color', '颜色值', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (12, '默认主题', 'default', 'theme', '主题方案', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (13, '天蓝主题', 'cerulean', 'theme', '主题方案', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (14, '橙色主题', 'readable', 'theme', '主题方案', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (15, '红色主题', 'united', 'theme', '主题方案', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (16, 'Flat主题', 'flat', 'theme', '主题方案', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (17, '国家', '1', 'sys_area_type', '区域类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (18, '省份、直辖市', '2', 'sys_area_type', '区域类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (19, '地市', '3', 'sys_area_type', '区域类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (20, '区县', '4', 'sys_area_type', '区域类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (21, '公司', '1', 'sys_office_type', '机构类型', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (22, '部门', '2', 'sys_office_type', '机构类型', 70, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (23, '小组', '3', 'sys_office_type', '机构类型', 80, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (24, '其它', '4', 'sys_office_type', '机构类型', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (25, '综合部', '1', 'sys_office_common', '快捷通用部门', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (26, '开发部', '2', 'sys_office_common', '快捷通用部门', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (27, '人力部', '3', 'sys_office_common', '快捷通用部门', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (28, '一级', '1', 'sys_office_grade', '机构等级', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (29, '二级', '2', 'sys_office_grade', '机构等级', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (30, '三级', '3', 'sys_office_grade', '机构等级', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (31, '四级', '4', 'sys_office_grade', '机构等级', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (32, '所有数据', '1', 'sys_data_scope', '数据范围', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (33, '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (34, '所在公司数据', '3', 'sys_data_scope', '数据范围', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (35, '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (36, '所在部门数据', '5', 'sys_data_scope', '数据范围', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (37, '仅本人数据', '8', 'sys_data_scope', '数据范围', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (38, '按明细设置', '9', 'sys_data_scope', '数据范围', 100, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (39, '系统管理', '1', 'sys_user_type', '用户类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (40, '部门经理', '2', 'sys_user_type', '用户类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (41, '普通用户', '3', 'sys_user_type', '用户类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (42, '基础主题', 'basic', 'cms_theme', '站点主题', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (43, '蓝色主题', 'blue', 'cms_theme', '站点主题', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (44, '红色主题', 'red', 'cms_theme', '站点主题', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (45, '文章模型', 'article', 'cms_module', '栏目模型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (46, '图片模型', 'picture', 'cms_module', '栏目模型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (47, '下载模型', 'download', 'cms_module', '栏目模型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (48, '链接模型', 'link', 'cms_module', '栏目模型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (49, '专题模型', 'special', 'cms_module', '栏目模型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (50, '默认展现方式', '0', 'cms_show_modes', '展现方式', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (51, '首栏目内容列表', '1', 'cms_show_modes', '展现方式', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (52, '栏目第一条内容', '2', 'cms_show_modes', '展现方式', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (53, '发布', '0', 'cms_del_flag', '内容状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (54, '删除', '1', 'cms_del_flag', '内容状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (55, '审核', '2', 'cms_del_flag', '内容状态', 15, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (56, '首页焦点图', '1', 'cms_posid', '推荐位', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (57, '栏目页文章推荐', '2', 'cms_posid', '推荐位', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (58, '咨询', '1', 'cms_guestbook', '留言板分类', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (59, '建议', '2', 'cms_guestbook', '留言板分类', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (60, '投诉', '3', 'cms_guestbook', '留言板分类', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (61, '其它', '4', 'cms_guestbook', '留言板分类', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (62, '公休', '1', 'oa_leave_type', '请假类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (63, '病假', '2', 'oa_leave_type', '请假类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (64, '事假', '3', 'oa_leave_type', '请假类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (65, '调休', '4', 'oa_leave_type', '请假类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (66, '婚假', '5', 'oa_leave_type', '请假类型', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (67, '接入日志', '1', 'sys_log_type', '日志类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (68, '异常日志', '2', 'sys_log_type', '日志类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (69, '请假流程', 'leave', 'act_type', '流程类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (70, '审批测试流程', 'test_audit', 'act_type', '流程类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (71, '分类1', '1', 'act_category', '流程分类', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (72, '分类2', '2', 'act_category', '流程分类', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (73, '增删改查', 'crud', 'gen_category', '代码生成分类', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (74, '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (75, '树结构', 'tree', 'gen_category', '代码生成分类', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (76, '=', '=', 'gen_query_type', '查询方式', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (77, '!=', '!=', 'gen_query_type', '查询方式', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (78, '&gt;', '&gt;', 'gen_query_type', '查询方式', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (79, '&lt;', '&lt;', 'gen_query_type', '查询方式', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (80, 'Between', 'between', 'gen_query_type', '查询方式', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (81, 'Like', 'like', 'gen_query_type', '查询方式', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (82, 'Left Like', 'left_like', 'gen_query_type', '查询方式', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (83, 'Right Like', 'right_like', 'gen_query_type', '查询方式', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (84, '文本框', 'input', 'gen_show_type', '字段生成方案', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (85, '文本域', 'textarea', 'gen_show_type', '字段生成方案', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (86, '下拉框', 'select', 'gen_show_type', '字段生成方案', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (87, '复选框', 'checkbox', 'gen_show_type', '字段生成方案', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (88, '单选框', 'radiobox', 'gen_show_type', '字段生成方案', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (89, '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (90, '人员选择', 'userselect', 'gen_show_type', '字段生成方案', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (91, '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (92, '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (93, 'String', 'String', 'gen_java_type', 'Java类型', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (94, 'Long', 'Long', 'gen_java_type', 'Java类型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (95, '仅持久层', 'dao', 'gen_category', '代码生成分类', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (96, '男', '1', 'sex', '性别', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (97, '女', '2', 'sex', '性别', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (98, 'Integer', 'Integer', 'gen_java_type', 'Java类型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (99, 'Double', 'Double', 'gen_java_type', 'Java类型', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (100, 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (104, 'Custom', 'Custom', 'gen_java_type', 'Java类型', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (105, '会议通告', '1', 'oa_notify_type', '通知通告类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (106, '奖惩通告', '2', 'oa_notify_type', '通知通告类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (107, '活动通告', '3', 'oa_notify_type', '通知通告类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (108, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (109, '发布', '1', 'oa_notify_status', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (110, '未读', '0', 'oa_notify_read', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (111, '已读', '1', 'oa_notify_read', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (112, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (113, '删除', '0', 'del_flag', '删除标记', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (118, '关于', 'about', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '全url是:/blog/open/page/about', '');
INSERT INTO `sys_dict` VALUES (119, '交流', 'communication', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (120, '文章', 'article', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (121, '编码', 'code', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (122, '绘画', 'painting', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
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
) ENGINE=InnoDB AUTO_INCREMENT=742 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (609, 1, 'admin', '登录', 50, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-10 22:08:32');
INSERT INTO `sys_log` VALUES (610, 1, 'admin', '请求访问主页', 137, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-10 22:08:32');
INSERT INTO `sys_log` VALUES (611, 1, 'admin', '添加用户', 11, 'com.bootdo.system.controller.UserController.add()', NULL, '127.0.0.1', '2021-09-10 22:17:05');
INSERT INTO `sys_log` VALUES (612, 1, 'admin', '保存用户', 32, 'com.bootdo.system.controller.UserController.save()', NULL, '127.0.0.1', '2021-09-10 22:17:32');
INSERT INTO `sys_log` VALUES (613, 138, 'james', '登录', 37, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-10 22:18:00');
INSERT INTO `sys_log` VALUES (614, 138, 'james', '请求访问主页', 35, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-10 22:18:00');
INSERT INTO `sys_log` VALUES (615, 138, 'james', '请求访问主页', 11, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-10 22:21:14');
INSERT INTO `sys_log` VALUES (616, 1, 'admin', '登录', 7, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-10 22:22:01');
INSERT INTO `sys_log` VALUES (617, 1, 'admin', '请求访问主页', 11, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-10 22:22:01');
INSERT INTO `sys_log` VALUES (618, 1, 'admin', '登录', 43, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-10 22:27:59');
INSERT INTO `sys_log` VALUES (619, 1, 'admin', '请求访问主页', 116, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-10 22:27:59');
INSERT INTO `sys_log` VALUES (620, 1, 'admin', '编辑用户', 27, 'com.bootdo.system.controller.UserController.edit()', NULL, '127.0.0.1', '2021-09-10 22:28:10');
INSERT INTO `sys_log` VALUES (621, 1, 'admin', '请求更改用户密码', 1, 'com.bootdo.system.controller.UserController.resetPwd()', NULL, '127.0.0.1', '2021-09-10 22:28:13');
INSERT INTO `sys_log` VALUES (622, 1, 'admin', '登录', 30, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-11 12:32:50');
INSERT INTO `sys_log` VALUES (623, 1, 'admin', '请求访问主页', 111, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-11 12:32:50');
INSERT INTO `sys_log` VALUES (624, 1, 'admin', '登录', 23, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-11 12:34:52');
INSERT INTO `sys_log` VALUES (625, 1, 'admin', '请求访问主页', 23, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-11 12:34:52');
INSERT INTO `sys_log` VALUES (626, 1, 'admin', '登录', 31, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-11 12:40:01');
INSERT INTO `sys_log` VALUES (627, 1, 'admin', '请求访问主页', 69, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-11 12:40:02');
INSERT INTO `sys_log` VALUES (628, 1, 'admin', '登录', 20, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-11 12:40:44');
INSERT INTO `sys_log` VALUES (629, 1, 'admin', '请求访问主页', 21, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-11 12:40:44');
INSERT INTO `sys_log` VALUES (630, 1, 'admin', '登录', 39, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-11 12:57:05');
INSERT INTO `sys_log` VALUES (631, 1, 'admin', '请求访问主页', 128, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-11 12:57:06');
INSERT INTO `sys_log` VALUES (632, 1, 'admin', '登录', 20, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-11 13:00:23');
INSERT INTO `sys_log` VALUES (633, 1, 'admin', '请求访问主页', 20, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-11 13:00:24');
INSERT INTO `sys_log` VALUES (634, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-11 13:00:26');
INSERT INTO `sys_log` VALUES (635, 1, 'admin', '登录', 37, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-11 13:01:19');
INSERT INTO `sys_log` VALUES (636, 1, 'admin', '请求访问主页', 156, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-11 13:01:19');
INSERT INTO `sys_log` VALUES (637, 1, 'admin', '登录', 52, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-11 17:28:31');
INSERT INTO `sys_log` VALUES (638, 1, 'admin', '请求访问主页', 164, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-11 17:28:31');
INSERT INTO `sys_log` VALUES (639, 1, 'admin', '编辑角色', 9, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2021-09-11 17:28:41');
INSERT INTO `sys_log` VALUES (640, 1, 'admin', 'error', NULL, 'http://localhost:8081/oa/notify/save', 'org.springframework.jdbc.UncategorizedSQLException: \n### Error updating database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect \')\' : insert into oa_notify_record\n		(\n		`notify_id`,\n		`user_id`,\n		`is_read`,\n		`read_date`\n		)\n		values\n### SQL: insert into oa_notify_record   (   `notify_id`,   `user_id`,   `is_read`,   `read_date`   )   values\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect \')\' : insert into oa_notify_record\n		(\n		`notify_id`,\n		`user_id`,\n		`is_read`,\n		`read_date`\n		)\n		values\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, expect \')\' : insert into oa_notify_record\n		(\n		`notify_id`,\n		`user_id`,\n		`is_read`,\n		`read_date`\n		)\n		values; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, expect \')\' : insert into oa_notify_record\n		(\n		`notify_id`,\n		`user_id`,\n		`is_read`,\n		`read_date`\n		)\n		values', NULL, '2021-09-11 17:31:28');
INSERT INTO `sys_log` VALUES (641, 1, 'admin', '登录', 44, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 12:48:28');
INSERT INTO `sys_log` VALUES (642, 1, 'admin', '请求访问主页', 167, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 12:48:29');
INSERT INTO `sys_log` VALUES (643, 1, 'admin', '登录', 74, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 16:15:44');
INSERT INTO `sys_log` VALUES (644, 1, 'admin', '请求访问主页', 51, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 16:15:44');
INSERT INTO `sys_log` VALUES (645, 1, 'admin', '登录', 16, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 16:16:46');
INSERT INTO `sys_log` VALUES (646, 1, 'admin', '请求访问主页', 20, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 16:16:46');
INSERT INTO `sys_log` VALUES (647, 1, 'admin', '登录', 65, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 16:27:12');
INSERT INTO `sys_log` VALUES (648, 1, 'admin', '请求访问主页', 20, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 16:27:12');
INSERT INTO `sys_log` VALUES (649, 1, 'admin', '登录', 32, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 17:02:36');
INSERT INTO `sys_log` VALUES (650, 1, 'admin', '请求访问主页', 23, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:02:36');
INSERT INTO `sys_log` VALUES (651, -1, '获取用户信息为空', '登录', 9, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 17:13:40');
INSERT INTO `sys_log` VALUES (652, -1, '获取用户信息为空', '登录', 1, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 17:13:43');
INSERT INTO `sys_log` VALUES (653, 1, 'admin', '登录', 59, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 17:13:54');
INSERT INTO `sys_log` VALUES (654, 1, 'admin', '请求访问主页', 227, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:13:54');
INSERT INTO `sys_log` VALUES (655, 1, 'admin', '登录', 32, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 17:31:02');
INSERT INTO `sys_log` VALUES (656, 1, 'admin', '请求访问主页', 224, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:31:02');
INSERT INTO `sys_log` VALUES (657, 1, 'admin', '登录', 35, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 17:44:35');
INSERT INTO `sys_log` VALUES (658, 1, 'admin', '请求访问主页', 103, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:44:35');
INSERT INTO `sys_log` VALUES (659, 1, 'admin', '请求访问主页', 29, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:48:56');
INSERT INTO `sys_log` VALUES (660, 1, 'admin', '请求访问主页', 12, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:48:59');
INSERT INTO `sys_log` VALUES (661, 1, 'admin', '请求访问主页', 15, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:49:00');
INSERT INTO `sys_log` VALUES (662, 1, 'admin', '请求访问主页', 33, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:51:49');
INSERT INTO `sys_log` VALUES (663, 1, 'admin', '请求访问主页', 10, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:51:53');
INSERT INTO `sys_log` VALUES (664, 1, 'admin', '登录', 38, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 17:52:06');
INSERT INTO `sys_log` VALUES (665, 1, 'admin', '请求访问主页', 13, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:52:06');
INSERT INTO `sys_log` VALUES (666, 1, 'admin', '编辑角色', 5, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2021-09-12 17:52:14');
INSERT INTO `sys_log` VALUES (667, 1, 'admin', '更新角色', 35, 'com.bootdo.system.controller.RoleController.update()', NULL, '127.0.0.1', '2021-09-12 17:52:20');
INSERT INTO `sys_log` VALUES (668, 1, 'admin', '请求访问主页', 8, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:52:22');
INSERT INTO `sys_log` VALUES (669, 1, 'admin', '请求访问主页', 31, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:58:51');
INSERT INTO `sys_log` VALUES (670, 1, 'admin', '请求访问主页', 18, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 17:59:02');
INSERT INTO `sys_log` VALUES (671, 1, 'admin', '编辑角色', 7, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2021-09-12 18:16:07');
INSERT INTO `sys_log` VALUES (672, 1, 'admin', '编辑角色', 4, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2021-09-12 18:16:10');
INSERT INTO `sys_log` VALUES (673, 1, 'admin', '请求访问主页', 94, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 18:20:59');
INSERT INTO `sys_log` VALUES (674, 1, 'admin', '登录', 48, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 18:21:14');
INSERT INTO `sys_log` VALUES (675, 1, 'admin', '请求访问主页', 83, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 18:21:14');
INSERT INTO `sys_log` VALUES (676, 1, 'admin', '登录', 35, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 18:26:03');
INSERT INTO `sys_log` VALUES (677, 1, 'admin', '请求访问主页', 78, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 18:26:03');
INSERT INTO `sys_log` VALUES (678, 1, 'admin', '登录', 43, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 18:57:52');
INSERT INTO `sys_log` VALUES (679, 1, 'admin', '请求访问主页', 20, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 18:57:52');
INSERT INTO `sys_log` VALUES (680, 1, 'admin', '登录', 29, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 19:00:22');
INSERT INTO `sys_log` VALUES (681, 1, 'admin', '请求访问主页', 71, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 19:00:23');
INSERT INTO `sys_log` VALUES (682, 1, 'admin', '登录', 32, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 19:08:19');
INSERT INTO `sys_log` VALUES (683, 1, 'admin', '请求访问主页', 67, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 19:08:19');
INSERT INTO `sys_log` VALUES (684, 1, 'admin', '编辑角色', 9, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2021-09-12 19:08:25');
INSERT INTO `sys_log` VALUES (685, 1, 'admin', '更新角色', 36, 'com.bootdo.system.controller.RoleController.update()', NULL, '127.0.0.1', '2021-09-12 19:08:33');
INSERT INTO `sys_log` VALUES (686, 1, 'admin', '请求访问主页', 12, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 19:08:38');
INSERT INTO `sys_log` VALUES (687, 1, 'admin', '登录', 7, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 19:08:47');
INSERT INTO `sys_log` VALUES (688, 1, 'admin', '请求访问主页', 12, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 19:08:47');
INSERT INTO `sys_log` VALUES (689, 1, 'admin', '登录', 37, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 19:10:50');
INSERT INTO `sys_log` VALUES (690, 1, 'admin', '请求访问主页', 76, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 19:10:50');
INSERT INTO `sys_log` VALUES (691, 1, 'admin', 'error', NULL, 'http://localhost:8082/system/books/save', 'org.springframework.dao.DataIntegrityViolationException: \n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'id\' cannot be null\n### The error may involve com.bootdo.books.dao.BooksDao.save-Inline\n### The error occurred while setting parameters\n### SQL: insert into books   (    `id`,     `bookname`,     `author`,     `category`,     `introduction`,     `update_time`   )   values   (    ?,     ?,     ?,     ?,     ?,     ?   )\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'id\' cannot be null\n; ]; Column \'id\' cannot be null; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'id\' cannot be null', NULL, '2021-09-12 19:13:15');
INSERT INTO `sys_log` VALUES (692, 1, 'admin', '登录', 29, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 19:16:53');
INSERT INTO `sys_log` VALUES (693, 1, 'admin', '请求访问主页', 72, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 19:16:53');
INSERT INTO `sys_log` VALUES (694, 1, 'admin', 'error', NULL, 'http://localhost:8082/system/books/save', 'org.springframework.dao.DataIntegrityViolationException: \n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may involve com.bootdo.books.dao.BooksDao.save-Inline\n### The error occurred while setting parameters\n### SQL: insert into books   (    `bookname`,    `author`,     `category`,     `introduction`,     `update_time`   )   values   (    ?,    ?,     ?,     ?,     ?   )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; ]; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', NULL, '2021-09-12 19:17:06');
INSERT INTO `sys_log` VALUES (695, 1, 'admin', '登录', 32, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 19:23:12');
INSERT INTO `sys_log` VALUES (696, 1, 'admin', '请求访问主页', 134, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 19:23:13');
INSERT INTO `sys_log` VALUES (697, 1, 'admin', '编辑角色', 14, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2021-09-12 19:35:25');
INSERT INTO `sys_log` VALUES (698, 1, 'admin', '编辑角色', 9, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2021-09-12 19:36:05');
INSERT INTO `sys_log` VALUES (699, -1, '获取用户信息为空', '登录', 51, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 20:56:58');
INSERT INTO `sys_log` VALUES (700, 1, 'admin', '登录', 10, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-12 20:57:05');
INSERT INTO `sys_log` VALUES (701, 1, 'admin', '请求访问主页', 96, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-12 20:57:05');
INSERT INTO `sys_log` VALUES (702, -1, '获取用户信息为空', '登录', 260, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 21:52:57');
INSERT INTO `sys_log` VALUES (703, -1, '获取用户信息为空', '登录', 7, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 21:53:00');
INSERT INTO `sys_log` VALUES (704, 1, 'admin', '登录', 8, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 21:53:04');
INSERT INTO `sys_log` VALUES (705, 1, 'admin', '请求访问主页', 102, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 21:53:04');
INSERT INTO `sys_log` VALUES (706, -1, '获取用户信息为空', '登录', 258, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 21:58:43');
INSERT INTO `sys_log` VALUES (707, 1, 'admin', '登录', 9, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 21:58:47');
INSERT INTO `sys_log` VALUES (708, 1, 'admin', '请求访问主页', 65, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 21:58:47');
INSERT INTO `sys_log` VALUES (709, 1, 'admin', '编辑角色', 7, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2021-09-13 21:59:10');
INSERT INTO `sys_log` VALUES (710, 1, 'admin', '编辑角色', 3, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2021-09-13 21:59:21');
INSERT INTO `sys_log` VALUES (711, 1, 'admin', '登录', 234, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:04:10');
INSERT INTO `sys_log` VALUES (712, 1, 'admin', 'error', NULL, 'http://localhost:8080/index', 'org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.bootdo.common.dao.FileDao.get', NULL, '2021-09-13 22:04:10');
INSERT INTO `sys_log` VALUES (713, 1, 'admin', 'error', NULL, 'http://localhost:8080/index', 'org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.bootdo.common.dao.FileDao.get', NULL, '2021-09-13 22:04:15');
INSERT INTO `sys_log` VALUES (714, 1, 'admin', '登录', 255, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:13:41');
INSERT INTO `sys_log` VALUES (715, 1, 'admin', '请求访问主页', 88, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:13:41');
INSERT INTO `sys_log` VALUES (716, 1, 'admin', '登录', 242, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:32:38');
INSERT INTO `sys_log` VALUES (717, 1, 'admin', '请求访问主页', 118, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:32:39');
INSERT INTO `sys_log` VALUES (718, 1, 'admin', '登录', 251, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:33:36');
INSERT INTO `sys_log` VALUES (719, 1, 'admin', '请求访问主页', 67, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:33:36');
INSERT INTO `sys_log` VALUES (720, 1, 'admin', '登录', 276, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:36:29');
INSERT INTO `sys_log` VALUES (721, 1, 'admin', '请求访问主页', 81, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:36:29');
INSERT INTO `sys_log` VALUES (722, 1, 'admin', '登录', 219, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:37:36');
INSERT INTO `sys_log` VALUES (723, 1, 'admin', '请求访问主页', 55, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:37:36');
INSERT INTO `sys_log` VALUES (724, 1, 'admin', '登录', 250, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:38:29');
INSERT INTO `sys_log` VALUES (725, 1, 'admin', '请求访问主页', 91, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:38:29');
INSERT INTO `sys_log` VALUES (726, 1, 'admin', '登录', 283, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:41:44');
INSERT INTO `sys_log` VALUES (727, 1, 'admin', '请求访问主页', 79, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:41:45');
INSERT INTO `sys_log` VALUES (728, 1, 'admin', '登录', 230, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:45:07');
INSERT INTO `sys_log` VALUES (729, 1, 'admin', '请求访问主页', 60, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:45:07');
INSERT INTO `sys_log` VALUES (730, 1, 'admin', '登录', 241, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:46:12');
INSERT INTO `sys_log` VALUES (731, 1, 'admin', '请求访问主页', 162, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:46:12');
INSERT INTO `sys_log` VALUES (732, 1, 'admin', '登录', 221, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:49:48');
INSERT INTO `sys_log` VALUES (733, 1, 'admin', '请求访问主页', 61, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:49:48');
INSERT INTO `sys_log` VALUES (734, 1, 'admin', '请求访问主页', 31, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:52:28');
INSERT INTO `sys_log` VALUES (735, 1, 'admin', '请求访问主页', 10, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:52:29');
INSERT INTO `sys_log` VALUES (736, 1, 'admin', '编辑用户', 21, 'com.bootdo.system.controller.UserController.edit()', NULL, '127.0.0.1', '2021-09-13 22:52:50');
INSERT INTO `sys_log` VALUES (737, 1, 'admin', '更新用户', 28, 'com.bootdo.system.controller.UserController.update()', NULL, '127.0.0.1', '2021-09-13 22:53:00');
INSERT INTO `sys_log` VALUES (738, 1, 'admin', '登录', 7, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:54:32');
INSERT INTO `sys_log` VALUES (739, 1, 'admin', '请求访问主页', 15, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:54:32');
INSERT INTO `sys_log` VALUES (740, 1, 'admin', '登录', 242, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2021-09-13 22:58:30');
INSERT INTO `sys_log` VALUES (741, 1, 'admin', '请求访问主页', 53, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2021-09-13 22:58:31');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
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
) ENGINE=InnoDB AUTO_INCREMENT=1110 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (2, 3, '系统菜单', 'sys/menu/', 'sys:menu:menu', 1, 'fa fa-th-list', 2, '2017-08-09 22:55:15', NULL);
INSERT INTO `sys_menu` VALUES (3, 0, '系统管理', NULL, NULL, 0, 'fa fa-desktop', 1, '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES (6, 3, '用户管理', 'sys/user/', 'sys:user:user', 1, 'fa fa-user', 0, '2017-08-10 14:12:11', NULL);
INSERT INTO `sys_menu` VALUES (7, 3, '角色管理', 'sys/role', 'sys:role:role', 1, 'fa fa-paw', 1, '2017-08-10 14:13:19', NULL);
INSERT INTO `sys_menu` VALUES (12, 6, '新增', '', 'sys:user:add', 2, '', 0, '2017-08-14 10:51:35', NULL);
INSERT INTO `sys_menu` VALUES (13, 6, '编辑', '', 'sys:user:edit', 2, '', 0, '2017-08-14 10:52:06', NULL);
INSERT INTO `sys_menu` VALUES (14, 6, '删除', NULL, 'sys:user:remove', 2, NULL, 0, '2017-08-14 10:52:24', NULL);
INSERT INTO `sys_menu` VALUES (15, 7, '新增', '', 'sys:role:add', 2, '', 0, '2017-08-14 10:56:37', NULL);
INSERT INTO `sys_menu` VALUES (20, 2, '新增', '', 'sys:menu:add', 2, '', 0, '2017-08-14 10:59:32', NULL);
INSERT INTO `sys_menu` VALUES (21, 2, '编辑', '', 'sys:menu:edit', 2, '', 0, '2017-08-14 10:59:56', NULL);
INSERT INTO `sys_menu` VALUES (22, 2, '删除', '', 'sys:menu:remove', 2, '', 0, '2017-08-14 11:00:26', NULL);
INSERT INTO `sys_menu` VALUES (24, 6, '批量删除', '', 'sys:user:batchRemove', 2, '', 0, '2017-08-14 17:27:18', NULL);
INSERT INTO `sys_menu` VALUES (25, 6, '停用', NULL, 'sys:user:disable', 2, NULL, 0, '2017-08-14 17:27:43', NULL);
INSERT INTO `sys_menu` VALUES (26, 6, '重置密码', '', 'sys:user:resetPwd', 2, '', 0, '2017-08-14 17:28:34', NULL);
INSERT INTO `sys_menu` VALUES (27, 91, '系统日志', 'common/log', 'common:log', 1, 'fa fa-warning', 0, '2017-08-14 22:11:53', NULL);
INSERT INTO `sys_menu` VALUES (28, 27, '刷新', NULL, 'sys:log:list', 2, NULL, 0, '2017-08-14 22:30:22', NULL);
INSERT INTO `sys_menu` VALUES (29, 27, '删除', NULL, 'sys:log:remove', 2, NULL, 0, '2017-08-14 22:30:43', NULL);
INSERT INTO `sys_menu` VALUES (30, 27, '清空', NULL, 'sys:log:clear', 2, NULL, 0, '2017-08-14 22:31:02', NULL);
INSERT INTO `sys_menu` VALUES (48, 77, '代码生成', 'common/generator', 'common:generator', 1, 'fa fa-code', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (55, 7, '编辑', '', 'sys:role:edit', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (56, 7, '删除', '', 'sys:role:remove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (57, 91, '运行监控', '/druid/index.html', '', 1, 'fa fa-caret-square-o-right', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (61, 2, '批量删除', '', 'sys:menu:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (62, 7, '批量删除', '', 'sys:role:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (73, 3, '部门管理', '/system/sysDept', 'system:sysDept:sysDept', 1, 'fa fa-users', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (74, 73, '增加', '/system/sysDept/add', 'system:sysDept:add', 2, NULL, 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (75, 73, '刪除', 'system/sysDept/remove', 'system:sysDept:remove', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (76, 73, '编辑', '/system/sysDept/edit', 'system:sysDept:edit', 2, NULL, 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (77, 0, '系统工具', '', '', 0, 'fa fa-gear', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (79, 78, '增加', '/common/dict/add', 'common:dict:add', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (80, 78, '编辑', '/common/dict/edit', 'common:dict:edit', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (81, 78, '删除', '/common/dict/remove', 'common:dict:remove', 2, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (83, 78, '批量删除', '/common/dict/batchRemove', 'common:dict:batchRemove', 2, '', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (91, 0, '系统监控', '', '', 0, 'fa fa-video-camera', 5, NULL, NULL);
INSERT INTO `sys_menu` VALUES (92, 91, '在线用户', 'sys/online', '', 1, 'fa fa-user', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (104, 77, 'swagger', '/swagger-ui.html', '', 1, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (105, 0, '图书管理', NULL, '', 0, 'fa fa-book', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (106, 105, '图书', '/system/books', 'system:books:books', 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (107, 106, '新增', '/system/books/add', 'system:books:add', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (108, 106, '修改', '/system/books/edit', 'system:books:edit', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (109, 106, '删除', '/system/books/remove', 'system:books:remove', 2, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级用户角色', 'admin', '拥有最高权限', 2, '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES (59, '普通用户', NULL, '基本用户权限', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3415 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (367, 44, 1);
INSERT INTO `sys_role_menu` VALUES (368, 44, 32);
INSERT INTO `sys_role_menu` VALUES (369, 44, 33);
INSERT INTO `sys_role_menu` VALUES (370, 44, 34);
INSERT INTO `sys_role_menu` VALUES (371, 44, 35);
INSERT INTO `sys_role_menu` VALUES (372, 44, 28);
INSERT INTO `sys_role_menu` VALUES (373, 44, 29);
INSERT INTO `sys_role_menu` VALUES (374, 44, 30);
INSERT INTO `sys_role_menu` VALUES (375, 44, 38);
INSERT INTO `sys_role_menu` VALUES (376, 44, 4);
INSERT INTO `sys_role_menu` VALUES (377, 44, 27);
INSERT INTO `sys_role_menu` VALUES (378, 45, 38);
INSERT INTO `sys_role_menu` VALUES (379, 46, 3);
INSERT INTO `sys_role_menu` VALUES (380, 46, 20);
INSERT INTO `sys_role_menu` VALUES (381, 46, 21);
INSERT INTO `sys_role_menu` VALUES (382, 46, 22);
INSERT INTO `sys_role_menu` VALUES (383, 46, 23);
INSERT INTO `sys_role_menu` VALUES (384, 46, 11);
INSERT INTO `sys_role_menu` VALUES (385, 46, 12);
INSERT INTO `sys_role_menu` VALUES (386, 46, 13);
INSERT INTO `sys_role_menu` VALUES (387, 46, 14);
INSERT INTO `sys_role_menu` VALUES (388, 46, 24);
INSERT INTO `sys_role_menu` VALUES (389, 46, 25);
INSERT INTO `sys_role_menu` VALUES (390, 46, 26);
INSERT INTO `sys_role_menu` VALUES (391, 46, 15);
INSERT INTO `sys_role_menu` VALUES (392, 46, 2);
INSERT INTO `sys_role_menu` VALUES (393, 46, 6);
INSERT INTO `sys_role_menu` VALUES (394, 46, 7);
INSERT INTO `sys_role_menu` VALUES (598, 50, 38);
INSERT INTO `sys_role_menu` VALUES (632, 38, 42);
INSERT INTO `sys_role_menu` VALUES (737, 51, 38);
INSERT INTO `sys_role_menu` VALUES (738, 51, 39);
INSERT INTO `sys_role_menu` VALUES (739, 51, 40);
INSERT INTO `sys_role_menu` VALUES (740, 51, 41);
INSERT INTO `sys_role_menu` VALUES (741, 51, 4);
INSERT INTO `sys_role_menu` VALUES (742, 51, 32);
INSERT INTO `sys_role_menu` VALUES (743, 51, 33);
INSERT INTO `sys_role_menu` VALUES (744, 51, 34);
INSERT INTO `sys_role_menu` VALUES (745, 51, 35);
INSERT INTO `sys_role_menu` VALUES (746, 51, 27);
INSERT INTO `sys_role_menu` VALUES (747, 51, 28);
INSERT INTO `sys_role_menu` VALUES (748, 51, 29);
INSERT INTO `sys_role_menu` VALUES (749, 51, 30);
INSERT INTO `sys_role_menu` VALUES (750, 51, 1);
INSERT INTO `sys_role_menu` VALUES (1064, 54, 53);
INSERT INTO `sys_role_menu` VALUES (1095, 55, 2);
INSERT INTO `sys_role_menu` VALUES (1096, 55, 6);
INSERT INTO `sys_role_menu` VALUES (1097, 55, 7);
INSERT INTO `sys_role_menu` VALUES (1098, 55, 3);
INSERT INTO `sys_role_menu` VALUES (1099, 55, 50);
INSERT INTO `sys_role_menu` VALUES (1100, 55, 49);
INSERT INTO `sys_role_menu` VALUES (1101, 55, 1);
INSERT INTO `sys_role_menu` VALUES (1856, 53, 28);
INSERT INTO `sys_role_menu` VALUES (1857, 53, 29);
INSERT INTO `sys_role_menu` VALUES (1858, 53, 30);
INSERT INTO `sys_role_menu` VALUES (1859, 53, 27);
INSERT INTO `sys_role_menu` VALUES (1860, 53, 57);
INSERT INTO `sys_role_menu` VALUES (1862, 53, 48);
INSERT INTO `sys_role_menu` VALUES (1863, 53, 72);
INSERT INTO `sys_role_menu` VALUES (1864, 53, 1);
INSERT INTO `sys_role_menu` VALUES (1865, 53, 7);
INSERT INTO `sys_role_menu` VALUES (1866, 53, 55);
INSERT INTO `sys_role_menu` VALUES (1867, 53, 56);
INSERT INTO `sys_role_menu` VALUES (1868, 53, 62);
INSERT INTO `sys_role_menu` VALUES (1869, 53, 15);
INSERT INTO `sys_role_menu` VALUES (1870, 53, 2);
INSERT INTO `sys_role_menu` VALUES (1871, 53, 61);
INSERT INTO `sys_role_menu` VALUES (1872, 53, 20);
INSERT INTO `sys_role_menu` VALUES (1873, 53, 21);
INSERT INTO `sys_role_menu` VALUES (1874, 53, 22);
INSERT INTO `sys_role_menu` VALUES (2084, 56, 68);
INSERT INTO `sys_role_menu` VALUES (2085, 56, 60);
INSERT INTO `sys_role_menu` VALUES (2086, 56, 59);
INSERT INTO `sys_role_menu` VALUES (2087, 56, 58);
INSERT INTO `sys_role_menu` VALUES (2088, 56, 51);
INSERT INTO `sys_role_menu` VALUES (2089, 56, 50);
INSERT INTO `sys_role_menu` VALUES (2090, 56, 49);
INSERT INTO `sys_role_menu` VALUES (2243, 48, 72);
INSERT INTO `sys_role_menu` VALUES (2247, 63, -1);
INSERT INTO `sys_role_menu` VALUES (2248, 63, 84);
INSERT INTO `sys_role_menu` VALUES (2249, 63, 85);
INSERT INTO `sys_role_menu` VALUES (2250, 63, 88);
INSERT INTO `sys_role_menu` VALUES (2251, 63, 87);
INSERT INTO `sys_role_menu` VALUES (2252, 64, 84);
INSERT INTO `sys_role_menu` VALUES (2253, 64, 89);
INSERT INTO `sys_role_menu` VALUES (2254, 64, 88);
INSERT INTO `sys_role_menu` VALUES (2255, 64, 87);
INSERT INTO `sys_role_menu` VALUES (2256, 64, 86);
INSERT INTO `sys_role_menu` VALUES (2257, 64, 85);
INSERT INTO `sys_role_menu` VALUES (2258, 65, 89);
INSERT INTO `sys_role_menu` VALUES (2259, 65, 88);
INSERT INTO `sys_role_menu` VALUES (2260, 65, 86);
INSERT INTO `sys_role_menu` VALUES (2262, 67, 48);
INSERT INTO `sys_role_menu` VALUES (2263, 68, 88);
INSERT INTO `sys_role_menu` VALUES (2264, 68, 87);
INSERT INTO `sys_role_menu` VALUES (2265, 69, 89);
INSERT INTO `sys_role_menu` VALUES (2266, 69, 88);
INSERT INTO `sys_role_menu` VALUES (2267, 69, 86);
INSERT INTO `sys_role_menu` VALUES (2268, 69, 87);
INSERT INTO `sys_role_menu` VALUES (2269, 69, 85);
INSERT INTO `sys_role_menu` VALUES (2270, 69, 84);
INSERT INTO `sys_role_menu` VALUES (2271, 70, 85);
INSERT INTO `sys_role_menu` VALUES (2272, 70, 89);
INSERT INTO `sys_role_menu` VALUES (2273, 70, 88);
INSERT INTO `sys_role_menu` VALUES (2274, 70, 87);
INSERT INTO `sys_role_menu` VALUES (2275, 70, 86);
INSERT INTO `sys_role_menu` VALUES (2276, 70, 84);
INSERT INTO `sys_role_menu` VALUES (2277, 71, 87);
INSERT INTO `sys_role_menu` VALUES (2278, 72, 59);
INSERT INTO `sys_role_menu` VALUES (2279, 73, 48);
INSERT INTO `sys_role_menu` VALUES (2280, 74, 88);
INSERT INTO `sys_role_menu` VALUES (2281, 74, 87);
INSERT INTO `sys_role_menu` VALUES (2282, 75, 88);
INSERT INTO `sys_role_menu` VALUES (2283, 75, 87);
INSERT INTO `sys_role_menu` VALUES (2284, 76, 85);
INSERT INTO `sys_role_menu` VALUES (2285, 76, 89);
INSERT INTO `sys_role_menu` VALUES (2286, 76, 88);
INSERT INTO `sys_role_menu` VALUES (2287, 76, 87);
INSERT INTO `sys_role_menu` VALUES (2288, 76, 86);
INSERT INTO `sys_role_menu` VALUES (2289, 76, 84);
INSERT INTO `sys_role_menu` VALUES (2292, 78, 88);
INSERT INTO `sys_role_menu` VALUES (2293, 78, 87);
INSERT INTO `sys_role_menu` VALUES (2294, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2295, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2296, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2308, 80, 87);
INSERT INTO `sys_role_menu` VALUES (2309, 80, 86);
INSERT INTO `sys_role_menu` VALUES (2310, 80, -1);
INSERT INTO `sys_role_menu` VALUES (2311, 80, 84);
INSERT INTO `sys_role_menu` VALUES (2312, 80, 85);
INSERT INTO `sys_role_menu` VALUES (2328, 79, 72);
INSERT INTO `sys_role_menu` VALUES (2329, 79, 48);
INSERT INTO `sys_role_menu` VALUES (2330, 79, 77);
INSERT INTO `sys_role_menu` VALUES (2331, 79, 84);
INSERT INTO `sys_role_menu` VALUES (2332, 79, 89);
INSERT INTO `sys_role_menu` VALUES (2333, 79, 88);
INSERT INTO `sys_role_menu` VALUES (2334, 79, 87);
INSERT INTO `sys_role_menu` VALUES (2335, 79, 86);
INSERT INTO `sys_role_menu` VALUES (2336, 79, 85);
INSERT INTO `sys_role_menu` VALUES (2337, 79, -1);
INSERT INTO `sys_role_menu` VALUES (2338, 77, 89);
INSERT INTO `sys_role_menu` VALUES (2339, 77, 88);
INSERT INTO `sys_role_menu` VALUES (2340, 77, 87);
INSERT INTO `sys_role_menu` VALUES (2341, 77, 86);
INSERT INTO `sys_role_menu` VALUES (2342, 77, 85);
INSERT INTO `sys_role_menu` VALUES (2343, 77, 84);
INSERT INTO `sys_role_menu` VALUES (2344, 77, 72);
INSERT INTO `sys_role_menu` VALUES (2345, 77, -1);
INSERT INTO `sys_role_menu` VALUES (2346, 77, 77);
INSERT INTO `sys_role_menu` VALUES (2974, 57, 93);
INSERT INTO `sys_role_menu` VALUES (2975, 57, 99);
INSERT INTO `sys_role_menu` VALUES (2976, 57, 95);
INSERT INTO `sys_role_menu` VALUES (2977, 57, 101);
INSERT INTO `sys_role_menu` VALUES (2978, 57, 96);
INSERT INTO `sys_role_menu` VALUES (2979, 57, 94);
INSERT INTO `sys_role_menu` VALUES (2980, 57, -1);
INSERT INTO `sys_role_menu` VALUES (2981, 58, 93);
INSERT INTO `sys_role_menu` VALUES (2982, 58, 99);
INSERT INTO `sys_role_menu` VALUES (2983, 58, 95);
INSERT INTO `sys_role_menu` VALUES (2984, 58, 101);
INSERT INTO `sys_role_menu` VALUES (2985, 58, 96);
INSERT INTO `sys_role_menu` VALUES (2986, 58, 94);
INSERT INTO `sys_role_menu` VALUES (2987, 58, -1);
INSERT INTO `sys_role_menu` VALUES (3232, 59, 98);
INSERT INTO `sys_role_menu` VALUES (3233, 59, 101);
INSERT INTO `sys_role_menu` VALUES (3234, 59, 99);
INSERT INTO `sys_role_menu` VALUES (3235, 59, 95);
INSERT INTO `sys_role_menu` VALUES (3236, 59, 90);
INSERT INTO `sys_role_menu` VALUES (3237, 59, 89);
INSERT INTO `sys_role_menu` VALUES (3238, 59, 88);
INSERT INTO `sys_role_menu` VALUES (3239, 59, 87);
INSERT INTO `sys_role_menu` VALUES (3240, 59, 86);
INSERT INTO `sys_role_menu` VALUES (3241, 59, 68);
INSERT INTO `sys_role_menu` VALUES (3242, 59, 60);
INSERT INTO `sys_role_menu` VALUES (3243, 59, 59);
INSERT INTO `sys_role_menu` VALUES (3244, 59, 58);
INSERT INTO `sys_role_menu` VALUES (3245, 59, 51);
INSERT INTO `sys_role_menu` VALUES (3246, 59, 76);
INSERT INTO `sys_role_menu` VALUES (3247, 59, 75);
INSERT INTO `sys_role_menu` VALUES (3248, 59, 74);
INSERT INTO `sys_role_menu` VALUES (3249, 59, 62);
INSERT INTO `sys_role_menu` VALUES (3250, 59, 56);
INSERT INTO `sys_role_menu` VALUES (3251, 59, 55);
INSERT INTO `sys_role_menu` VALUES (3252, 59, 15);
INSERT INTO `sys_role_menu` VALUES (3253, 59, 26);
INSERT INTO `sys_role_menu` VALUES (3254, 59, 25);
INSERT INTO `sys_role_menu` VALUES (3255, 59, 24);
INSERT INTO `sys_role_menu` VALUES (3256, 59, 14);
INSERT INTO `sys_role_menu` VALUES (3257, 59, 13);
INSERT INTO `sys_role_menu` VALUES (3258, 59, 12);
INSERT INTO `sys_role_menu` VALUES (3259, 59, 61);
INSERT INTO `sys_role_menu` VALUES (3260, 59, 22);
INSERT INTO `sys_role_menu` VALUES (3261, 59, 21);
INSERT INTO `sys_role_menu` VALUES (3262, 59, 20);
INSERT INTO `sys_role_menu` VALUES (3263, 59, 83);
INSERT INTO `sys_role_menu` VALUES (3264, 59, 81);
INSERT INTO `sys_role_menu` VALUES (3265, 59, 80);
INSERT INTO `sys_role_menu` VALUES (3266, 59, 79);
INSERT INTO `sys_role_menu` VALUES (3268, 59, 97);
INSERT INTO `sys_role_menu` VALUES (3269, 59, 96);
INSERT INTO `sys_role_menu` VALUES (3270, 59, 94);
INSERT INTO `sys_role_menu` VALUES (3271, 59, 93);
INSERT INTO `sys_role_menu` VALUES (3272, 59, 85);
INSERT INTO `sys_role_menu` VALUES (3273, 59, 84);
INSERT INTO `sys_role_menu` VALUES (3274, 59, 50);
INSERT INTO `sys_role_menu` VALUES (3275, 59, 49);
INSERT INTO `sys_role_menu` VALUES (3276, 59, 73);
INSERT INTO `sys_role_menu` VALUES (3277, 59, 7);
INSERT INTO `sys_role_menu` VALUES (3278, 59, 6);
INSERT INTO `sys_role_menu` VALUES (3279, 59, 2);
INSERT INTO `sys_role_menu` VALUES (3280, 59, 3);
INSERT INTO `sys_role_menu` VALUES (3281, 59, 78);
INSERT INTO `sys_role_menu` VALUES (3282, 59, 1);
INSERT INTO `sys_role_menu` VALUES (3283, 59, -1);
INSERT INTO `sys_role_menu` VALUES (3348, 1, 98);
INSERT INTO `sys_role_menu` VALUES (3349, 1, 101);
INSERT INTO `sys_role_menu` VALUES (3350, 1, 99);
INSERT INTO `sys_role_menu` VALUES (3351, 1, 95);
INSERT INTO `sys_role_menu` VALUES (3352, 1, 92);
INSERT INTO `sys_role_menu` VALUES (3353, 1, 57);
INSERT INTO `sys_role_menu` VALUES (3354, 1, 30);
INSERT INTO `sys_role_menu` VALUES (3355, 1, 29);
INSERT INTO `sys_role_menu` VALUES (3356, 1, 28);
INSERT INTO `sys_role_menu` VALUES (3357, 1, 90);
INSERT INTO `sys_role_menu` VALUES (3358, 1, 89);
INSERT INTO `sys_role_menu` VALUES (3359, 1, 88);
INSERT INTO `sys_role_menu` VALUES (3360, 1, 87);
INSERT INTO `sys_role_menu` VALUES (3361, 1, 86);
INSERT INTO `sys_role_menu` VALUES (3362, 1, 104);
INSERT INTO `sys_role_menu` VALUES (3363, 1, 72);
INSERT INTO `sys_role_menu` VALUES (3364, 1, 48);
INSERT INTO `sys_role_menu` VALUES (3365, 1, 68);
INSERT INTO `sys_role_menu` VALUES (3366, 1, 60);
INSERT INTO `sys_role_menu` VALUES (3367, 1, 59);
INSERT INTO `sys_role_menu` VALUES (3368, 1, 58);
INSERT INTO `sys_role_menu` VALUES (3369, 1, 51);
INSERT INTO `sys_role_menu` VALUES (3370, 1, 76);
INSERT INTO `sys_role_menu` VALUES (3371, 1, 75);
INSERT INTO `sys_role_menu` VALUES (3372, 1, 74);
INSERT INTO `sys_role_menu` VALUES (3373, 1, 62);
INSERT INTO `sys_role_menu` VALUES (3374, 1, 56);
INSERT INTO `sys_role_menu` VALUES (3375, 1, 55);
INSERT INTO `sys_role_menu` VALUES (3376, 1, 15);
INSERT INTO `sys_role_menu` VALUES (3377, 1, 26);
INSERT INTO `sys_role_menu` VALUES (3378, 1, 25);
INSERT INTO `sys_role_menu` VALUES (3379, 1, 24);
INSERT INTO `sys_role_menu` VALUES (3380, 1, 14);
INSERT INTO `sys_role_menu` VALUES (3381, 1, 13);
INSERT INTO `sys_role_menu` VALUES (3382, 1, 12);
INSERT INTO `sys_role_menu` VALUES (3383, 1, 61);
INSERT INTO `sys_role_menu` VALUES (3384, 1, 22);
INSERT INTO `sys_role_menu` VALUES (3385, 1, 21);
INSERT INTO `sys_role_menu` VALUES (3386, 1, 20);
INSERT INTO `sys_role_menu` VALUES (3387, 1, 83);
INSERT INTO `sys_role_menu` VALUES (3388, 1, 81);
INSERT INTO `sys_role_menu` VALUES (3389, 1, 80);
INSERT INTO `sys_role_menu` VALUES (3390, 1, 79);
INSERT INTO `sys_role_menu` VALUES (3391, 1, 97);
INSERT INTO `sys_role_menu` VALUES (3392, 1, 96);
INSERT INTO `sys_role_menu` VALUES (3393, 1, 94);
INSERT INTO `sys_role_menu` VALUES (3394, 1, 93);
INSERT INTO `sys_role_menu` VALUES (3395, 1, 27);
INSERT INTO `sys_role_menu` VALUES (3396, 1, 91);
INSERT INTO `sys_role_menu` VALUES (3397, 1, 85);
INSERT INTO `sys_role_menu` VALUES (3398, 1, 84);
INSERT INTO `sys_role_menu` VALUES (3399, 1, 77);
INSERT INTO `sys_role_menu` VALUES (3400, 1, 50);
INSERT INTO `sys_role_menu` VALUES (3401, 1, 49);
INSERT INTO `sys_role_menu` VALUES (3402, 1, 73);
INSERT INTO `sys_role_menu` VALUES (3403, 1, 7);
INSERT INTO `sys_role_menu` VALUES (3404, 1, 6);
INSERT INTO `sys_role_menu` VALUES (3405, 1, 2);
INSERT INTO `sys_role_menu` VALUES (3406, 1, 3);
INSERT INTO `sys_role_menu` VALUES (3407, 1, 78);
INSERT INTO `sys_role_menu` VALUES (3408, 1, 105);
INSERT INTO `sys_role_menu` VALUES (3409, 1, 109);
INSERT INTO `sys_role_menu` VALUES (3410, 1, 108);
INSERT INTO `sys_role_menu` VALUES (3411, 1, 107);
INSERT INTO `sys_role_menu` VALUES (3412, 1, 106);
INSERT INTO `sys_role_menu` VALUES (3413, 1, -1);
INSERT INTO `sys_role_menu` VALUES (3414, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) DEFAULT NULL,
  `live_address` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='后台管理用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '超级管理员', '27bd386e70f280e24c2f4f2a549b82cf', 6, 'admin@example.com', '17699999999', 1, 1, '2017-08-15 21:40:39', '2017-08-15 21:41:00', 96, '2017-12-14 00:00:00', 138, 'ccc', '122;121;', '北京市', '北京市市辖区', '东城区');
INSERT INTO `sys_user` VALUES (2, 'test', '临时用户', '6cf3bb3deba2aadbd41ec9a22511084e', 6, 'test@bootdo.com', NULL, 1, 1, '2017-08-14 13:43:05', '2017-08-14 21:15:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (36, 'ldh', '刘德华', 'bfd9394475754fbe45866eba97738c36', 7, 'ldh@bootdo.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (123, 'zxy', '张学友', '35174ba93f5fe7267f1fb3c1bf903781', 6, 'zxy@bootdo', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (124, 'wyf', '吴亦凡', 'e179e6f687bbd57b9d7efc4746c8090a', 6, 'wyf@bootdo.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (130, 'lh', '鹿晗', '7924710cd673f68967cde70e188bb097', 9, 'lh@bootdo.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (131, 'lhc', '令狐冲', 'd515538e17ecb570ba40344b5618f5d4', 6, 'lhc@bootdo.com', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (132, 'lyf', '刘亦菲', '7fdb1d9008f45950c1620ba0864e5fbd', 13, 'lyf@bootdo.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (134, 'lyh', '李彦宏', 'dc26092b3244d9d432863f2738180e19', 8, 'lyh@bootdo.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (135, 'wjl', '王健林', '3967697dfced162cf6a34080259b83aa', 6, 'wjl@bootod.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (136, 'gdg', '郭德纲', '3bb1bda86bc02bf6478cd91e42135d2f', 9, 'gdg@bootdo.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (138, 'james', 'james', '4be5f36fae12cb42dc8cbef8e8ce8528', 13, 'aaa123@gmail.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (73, 30, 48);
INSERT INTO `sys_user_role` VALUES (74, 30, 49);
INSERT INTO `sys_user_role` VALUES (75, 30, 50);
INSERT INTO `sys_user_role` VALUES (76, 31, 48);
INSERT INTO `sys_user_role` VALUES (77, 31, 49);
INSERT INTO `sys_user_role` VALUES (78, 31, 52);
INSERT INTO `sys_user_role` VALUES (79, 32, 48);
INSERT INTO `sys_user_role` VALUES (80, 32, 49);
INSERT INTO `sys_user_role` VALUES (81, 32, 50);
INSERT INTO `sys_user_role` VALUES (82, 32, 51);
INSERT INTO `sys_user_role` VALUES (83, 32, 52);
INSERT INTO `sys_user_role` VALUES (84, 33, 38);
INSERT INTO `sys_user_role` VALUES (85, 33, 49);
INSERT INTO `sys_user_role` VALUES (86, 33, 52);
INSERT INTO `sys_user_role` VALUES (87, 34, 50);
INSERT INTO `sys_user_role` VALUES (88, 34, 51);
INSERT INTO `sys_user_role` VALUES (89, 34, 52);
INSERT INTO `sys_user_role` VALUES (106, 124, 1);
INSERT INTO `sys_user_role` VALUES (110, 1, 1);
INSERT INTO `sys_user_role` VALUES (111, 2, 1);
INSERT INTO `sys_user_role` VALUES (113, 131, 48);
INSERT INTO `sys_user_role` VALUES (117, 135, 1);
INSERT INTO `sys_user_role` VALUES (120, 134, 1);
INSERT INTO `sys_user_role` VALUES (121, 134, 48);
INSERT INTO `sys_user_role` VALUES (123, 130, 1);
INSERT INTO `sys_user_role` VALUES (124, NULL, 48);
INSERT INTO `sys_user_role` VALUES (125, 132, 52);
INSERT INTO `sys_user_role` VALUES (126, 132, 49);
INSERT INTO `sys_user_role` VALUES (127, 123, 48);
INSERT INTO `sys_user_role` VALUES (132, 36, 48);
INSERT INTO `sys_user_role` VALUES (136, 138, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
