/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ruoyi

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 25/10/2022 11:29:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`
(
    `table_id`          bigint(20)                                                     NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_name`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '表名称',
    `table_comment`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '表描述',
    `sub_table_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '关联子表的表名',
    `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '子表关联的外键名',
    `class_name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '实体类名称',
    `tpl_category`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
    `package_name`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '生成包路径',
    `module_name`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '生成模块名',
    `business_name`     varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '生成业务名',
    `function_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '生成功能名',
    `function_author`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '生成功能作者',
    `gen_type`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci       NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
    `gen_path`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
    `options`           varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '其它生成选项',
    `create_by`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT '' COMMENT '创建者',
    `create_time`       datetime(0)                                                    NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT '' COMMENT '更新者',
    `update_time`       datetime(0)                                                    NULL DEFAULT NULL COMMENT '更新时间',
    `remark`            varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 20
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table`
VALUES (1, 'sys_dept', '部门表', NULL, NULL, 'SysDept', 'crud', 'com.ruoyi.system', 'system', 'dept', '部门', 'ruoyi',
        '0', '/', NULL, 'admin', '2021-11-18 16:25:51', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (2, 'repair_file_response', '测试记录附件', NULL, NULL, 'RepairFileResponse', 'crud', 'com.ruoyi.repair',
        'repair', 'response', '测试记录附件', 'ruoyi', '0', '/', '{}', 'admin', '2021-11-18 16:56:07', '',
        '2021-11-18 22:28:57', NULL);
INSERT INTO `gen_table`
VALUES (3, 'repair_place', '道岔树形结构', '', '', 'RepairPlace', 'tree', 'com.ruoyi.repair', 'repair', 'place',
        '道岔号基础结构', 'guoge', '0', '/',
        '{\"treeCode\":\"id\",\"treeName\":\"name\",\"treeParentCode\":\"parent_id\"}', 'admin', '2021-11-18 16:56:07',
        '', '2021-11-22 13:47:52', NULL);
INSERT INTO `gen_table`
VALUES (8, 'repair_place_info', '道岔信息', NULL, NULL, 'RepairPlaceInfo', 'crud', 'com.ruoyi.repair', 'repair', 'info',
        '道岔信息', 'ruoyi', '0', 'C:\\Users\\1\\Desktop\\ruoyi', '{}', 'admin', '2021-11-23 12:41:09', '',
        '2021-11-23 12:43:46', NULL);
INSERT INTO `gen_table`
VALUES (10, 'repair_record', '检修记录', NULL, NULL, 'RepairRecord', 'crud', 'com.ruoyi.repair', 'repair', 'record',
        '检修记录', 'ruoyi', '0', '/', '{}', 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06', NULL);
INSERT INTO `gen_table`
VALUES (11, 'repair_table', '检测表', NULL, NULL, 'RepairTable', 'crud', 'com.ruoyi.system', 'system', 'table', '检测',
        'ruoyi', '0', '/', NULL, 'admin', '2021-11-24 20:45:01', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (12, 'repair_test', '检修记录', NULL, NULL, 'RepairTest', 'crud', 'com.ruoyi.system', 'system', 'test',
        '检修记录', 'ruoyi', '0', '/', NULL, 'admin', '2021-11-24 20:45:01', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (13, 'repair_file_res', '测试记录附件', NULL, NULL, 'RepairFileRes', 'crud', 'com.ruoyi.system', 'system', 'res',
        '测试记录附件', 'ruoyi', '0', '/', NULL, 'admin', '2021-12-03 14:28:25', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (14, 'angeek_trusted_apply', '可信终端应用', NULL, NULL, 'AngeekTrustedApply', 'crud', 'com.ruoyi.system',
        'system', 'apply', '可信终端应用', 'ruoyi', '0', '/', NULL, 'admin', '2022-03-01 14:54:58', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (15, 'angeek_trusted_system', '可信终端系统', NULL, NULL, 'AngeekTrustedSystem', 'crud', 'com.ruoyi.system',
        'system', 'system', '可信终端系统', 'ruoyi', '0', '/', NULL, 'admin', '2022-03-01 14:54:58', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (16, 'angeek__statistics', '数据统计', NULL, NULL, 'AngeekStatistics', 'crud', 'com.ruoyi.system', 'system',
        'statistics', '数据统计', 'ruoyi', '0', '/', NULL, 'admin', '2022-03-07 13:43:25', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (17, 'angeek__statistics_apply', '热门应用总量', NULL, NULL, 'AngeekStatisticsApply', 'crud', 'com.ruoyi.system',
        'system', 'apply', '热门应用总量', 'ruoyi', '0', '/', NULL, 'admin', '2022-03-07 13:43:25', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (18, 'angeek_authority_revoke', '权限回收列表', NULL, NULL, 'AngeekAuthorityRevoke', 'crud', 'com.ruoyi.system',
        'system', 'revoke', '权限回收列', 'ruoyi', '0', '/', NULL, 'admin', '2022-05-31 15:54:26', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (19, 'angeek_authority_revoke_history', '权限回收列表', NULL, NULL, 'AngeekAuthorityRevokeHistory', 'crud',
        'com.ruoyi.system', 'system', 'history', '权限回收列', 'ruoyi', '0', '/', NULL, 'admin', '2022-05-31 15:54:26',
        '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`
(
    `column_id`      bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '归属表编号',
    `column_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列描述',
    `column_type`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列类型',
    `java_type`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
    `java_field`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT NULL COMMENT '是否主键（1是）',
    `is_increment`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT NULL COMMENT '是否自增（1是）',
    `is_required`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT NULL COMMENT '是否必填（1是）',
    `is_insert`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
    `is_edit`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
    `is_list`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
    `is_query`       char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
    `query_type`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    `html_type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
    `sort`           int(11)                                                       NULL DEFAULT NULL COMMENT '排序',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 258
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务表字段'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column`
VALUES (1, '1', 'dept_id', '部门id', 'bigint(20)', 'Long', 'deptId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ',
        'input', '', 1, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (2, '1', 'parent_id', '父部门id', 'bigint(20)', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 2, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (3, '1', 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 3, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (4, '1', 'dept_name', '部门名称', 'varchar(30)', 'String', 'deptName', '0', '0', NULL, '1', '1', '1', '1',
        'LIKE', 'input', '', 4, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (5, '1', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 5, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (6, '1', 'leader', '负责人', 'varchar(20)', 'String', 'leader', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 6, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (7, '1', 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 7, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (8, '1', 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 8, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (9, '1', 'status', '部门状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'radio', '', 9, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (10, '1', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL,
        NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (11, '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'input', '', 11, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (12, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 12, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (13, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ',
        'input', '', 13, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (14, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'datetime', '', 14, 'admin', '2021-11-18 16:25:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (15, '2', 'id', '主键Id', 'varchar(50)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input',
        '', 1, 'admin', '2021-11-18 16:56:07', '', '2021-11-18 22:28:57');
INSERT INTO `gen_table_column`
VALUES (16, '2', 'record_id', '测试记录id', 'varchar(50)', 'String', 'recordId', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 2, 'admin', '2021-11-18 16:56:07', '', '2021-11-18 22:28:57');
INSERT INTO `gen_table_column`
VALUES (17, '2', 'machine_type', '转辙机类型', 'varchar(8)', 'String', 'machineType', '0', '0', NULL, '1', '1', '1',
        '1', 'EQ', 'select', '', 3, 'admin', '2021-11-18 16:56:07', '', '2021-11-18 22:28:57');
INSERT INTO `gen_table_column`
VALUES (18, '2', 'title', '附件标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 4, 'admin', '2021-11-18 16:56:07', '', '2021-11-18 22:28:57');
INSERT INTO `gen_table_column`
VALUES (19, '2', 'url', '附件地址', 'varchar(255)', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 5, 'admin', '2021-11-18 16:56:07', '', '2021-11-18 22:28:57');
INSERT INTO `gen_table_column`
VALUES (20, '2', 'create_id', '创建人', 'varchar(255)', 'String', 'createId', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 6, 'admin', '2021-11-18 16:56:07', '', '2021-11-18 22:28:57');
INSERT INTO `gen_table_column`
VALUES (21, '2', 'create_date', '创建日期', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'datetime', '', 7, 'admin', '2021-11-18 16:56:07', '', '2021-11-18 22:28:57');
INSERT INTO `gen_table_column`
VALUES (22, '2', 'update_id', '修改人', 'varchar(255)', 'String', 'updateId', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 8, 'admin', '2021-11-18 16:56:07', '', '2021-11-18 22:28:57');
INSERT INTO `gen_table_column`
VALUES (23, '2', 'update_date', '修改日期', 'datetime', 'Date', 'updateDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'datetime', '', 9, 'admin', '2021-11-18 16:56:07', '', '2021-11-18 22:28:57');
INSERT INTO `gen_table_column`
VALUES (24, '2', 'is_delete', '是否有效 0：有效 1：失效', 'tinyint(4)', 'Integer', 'isDelete', '0', '0', '1', '1', '1',
        '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-11-18 16:56:07', '', '2021-11-18 22:28:57');
INSERT INTO `gen_table_column`
VALUES (25, '3', 'id', '主键id', 'varchar(32)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input',
        '', 1, 'admin', '2021-11-18 16:56:07', '', '2021-11-22 13:47:52');
INSERT INTO `gen_table_column`
VALUES (26, '3', 'parent_id', '父id', 'varchar(32)', 'String', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 2, 'admin', '2021-11-18 16:56:07', '', '2021-11-22 13:47:52');
INSERT INTO `gen_table_column`
VALUES (27, '3', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input',
        '', 3, 'admin', '2021-11-18 16:56:07', '', '2021-11-22 13:47:52');
INSERT INTO `gen_table_column`
VALUES (28, '3', 'type', '类型', 'int(8)', 'Integer', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4,
        'admin', '2021-11-18 16:56:07', '', '2021-11-22 13:47:52');
INSERT INTO `gen_table_column`
VALUES (30, '3', 'sort_no', '排序', 'double(8,2)', 'BigDecimal', 'sortNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 6, 'admin', '2021-11-18 16:56:07', '', '2021-11-22 13:47:52');
INSERT INTO `gen_table_column`
VALUES (31, '3', 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'input', '', 7, 'admin', '2021-11-18 16:56:07', '', '2021-11-22 13:47:52');
INSERT INTO `gen_table_column`
VALUES (32, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 8, 'admin', '2021-11-18 16:56:07', '', '2021-11-22 13:47:52');
INSERT INTO `gen_table_column`
VALUES (33, '3', 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ',
        'input', '', 9, 'admin', '2021-11-18 16:56:07', '', '2021-11-22 13:47:52');
INSERT INTO `gen_table_column`
VALUES (34, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'datetime', '', 10, 'admin', '2021-11-18 16:56:07', '', '2021-11-22 13:47:52');
INSERT INTO `gen_table_column`
VALUES (107, '3', 'switch_no', '编号', 'int(32)', 'Long', 'switchNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 5, '', '2021-11-22 14:38:14', '', NULL);
INSERT INTO `gen_table_column`
VALUES (108, '3', 'dep', '维护部', 'varchar(32)', 'String', 'dep', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 6, '', '2021-11-22 14:38:14', '', NULL);
INSERT INTO `gen_table_column`
VALUES (109, '3', 'org', '维护组', 'varchar(32)', 'String', 'org', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 7, '', '2021-11-22 14:38:14', '', NULL);
INSERT INTO `gen_table_column`
VALUES (110, '3', 'eqt_type', '道岔类型', 'varchar(32)', 'String', 'eqtType', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'select', '', 8, '', '2021-11-22 14:38:14', '', NULL);
INSERT INTO `gen_table_column`
VALUES (111, '3', 'eqt_mode', '道岔型号', 'varchar(32)', 'String', 'eqtMode', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 9, '', '2021-11-22 14:38:14', '', NULL);
INSERT INTO `gen_table_column`
VALUES (112, '3', 'eqt_level', '道岔等级', 'char(1)', 'String', 'eqtLevel', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 10, '', '2021-11-22 14:38:14', '', NULL);
INSERT INTO `gen_table_column`
VALUES (113, '3', 'action', '动作', 'varchar(8)', 'String', 'action', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 11, '', '2021-11-22 14:38:14', '', NULL);
INSERT INTO `gen_table_column`
VALUES (114, '3', 'lock_mode', '锁闭方式', 'char(1)', 'String', 'lockMode', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 12, '', '2021-11-22 14:38:14', '', NULL);
INSERT INTO `gen_table_column`
VALUES (116, '8', 'id', '主键id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (117, '8', 'switch_no', '道岔编号', 'int(32)', 'Long', 'switchNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 2, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (118, '8', 'route', '线路', 'varchar(64)', 'String', 'route', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 3, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (119, '8', 'station', '车站', 'varchar(64)', 'String', 'station', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 4, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (120, '8', 'dep', '维护部', 'varchar(32)', 'String', 'dep', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 5, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (121, '8', 'org', '维护组', 'varchar(32)', 'String', 'org', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 6, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (122, '8', 'name', '道岔名称', 'varchar(64)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE',
        'input', '', 7, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (123, '8', 'eqt_type', '道岔类型', 'varchar(32)', 'String', 'eqtType', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'select', '', 8, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (124, '8', 'eqt_mode', '道岔型号', 'varchar(32)', 'String', 'eqtMode', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 9, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (125, '8', 'eqt_level', '道岔等级', 'varchar(8)', 'String', 'eqtLevel', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 10, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (126, '8', 'admit_location', '开向位置', 'varchar(32)', 'String', 'admitLocation', '0', '0', NULL, '1', '1', '1',
        '1', 'EQ', 'input', '', 11, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (127, '8', 'position_colsed', '定位闭合', 'varchar(32)', 'String', 'positionColsed', '0', '0', NULL, '1', '1',
        '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (128, '8', 'action', '动作', 'varchar(8)', 'String', 'action', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 13, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (129, '8', 'sequence', '顺序', 'varchar(32)', 'String', 'sequence', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 14, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (130, '8', 'lock_mode', '锁闭方式', 'varchar(32)', 'String', 'lockMode', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 15, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (131, '8', 'installation_mode', '安装方式', 'varchar(32)', 'String', 'installationMode', '0', '0', NULL, '1',
        '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (132, '8', 'installation_drawing_no', '安装装置图号', 'varchar(255)', 'String', 'installationDrawingNo', '0',
        '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2021-11-23 12:41:09', '',
        '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (133, '8', 'external_locking_device', '外锁闭装置', 'varchar(32)', 'String', 'externalLockingDevice', '0', '0',
        NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (134, '8', 'paste_checker', '密贴检查器', 'varchar(32)', 'String', 'pasteChecker', '0', '0', NULL, '1', '1', '1',
        '1', 'EQ', 'input', '', 19, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (135, '8', 'circuit_standard', '电路制式', 'varchar(32)', 'String', 'circuitStandard', '0', '0', NULL, '1', '1',
        '1', '1', 'EQ', 'input', '', 20, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (136, '8', 'express', '表示', 'varchar(32)', 'String', 'express', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 21, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (137, '8', 'install_date', '道岔安装', 'date', 'Date', 'installDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'datetime', '', 22, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (138, '8', 'unloading_date', '道岔拆卸', 'date', 'Date', 'unloadingDate', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'datetime', '', 23, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (139, '8', 'line_coordinates', '线路坐标', 'varchar(32)', 'String', 'lineCoordinates', '0', '0', NULL, '1', '1',
        '1', '1', 'EQ', 'input', '', 24, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (140, '8', 'line_enviroment', '线路环境', 'varchar(32)', 'String', 'lineEnviroment', '0', '0', NULL, '1', '1',
        '1', '1', 'EQ', 'input', '', 25, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (141, '8', 'ballast_bed_type', '道床类型', 'varchar(32)', 'String', 'ballastBedType', '0', '0', NULL, '1', '1',
        '1', '1', 'EQ', 'select', '', 26, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (142, '8', 'switch_type', '道岔类型', 'varchar(32)', 'String', 'switchType', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'select', '', 27, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (143, '8', 'rail_type', '钢轨类型', 'varchar(32)', 'String', 'railType', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'select', '', 28, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (144, '8', 'switch_num', '道岔号数', 'varchar(32)', 'String', 'switchNum', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 29, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (145, '8', 'drawing_num', '工务图号', 'varchar(32)', 'String', 'drawingNum', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 30, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (146, '8', 'responsible', '包保人', 'varchar(32)', 'String', 'responsible', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 31, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (147, '8', 'locked', '锁定', 'varchar(32)', 'String', 'locked', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 32, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (148, '8', 'pic', '道岔图', 'varchar(255)', 'String', 'pic', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 33, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (149, '8', 'coordinate_x', '横坐标', 'varchar(32)', 'String', 'coordinateX', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 34, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (150, '8', 'coordinate_y', '纵坐标', 'varchar(32)', 'String', 'coordinateY', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 35, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (151, '8', 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'input', '', 36, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (152, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 37, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (153, '8', 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'input', '', 38, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (154, '8', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'datetime', '', 39, 'admin', '2021-11-23 12:41:09', '', '2021-11-23 12:43:46');
INSERT INTO `gen_table_column`
VALUES (170, '10', 'id', '主键id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (171, '10', 'route_id', '线路id', 'bigint(20)', 'Long', 'routeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 2, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (172, '10', 'station_id', '车站id', 'bigint(20)', 'Long', 'stationId', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 3, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (173, '10', 'switch_id', '道岔号id', 'bigint(20)', 'Long', 'switchId', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 4, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (174, '10', 'type', '类型', 'varchar(8)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select',
        '', 5, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (175, '10', 'description', '描述', 'varchar(255)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 6, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (176, '10', 'file1', '\r\n文件1', 'varchar(255)', 'String', 'file1', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 7, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (177, '10', 'file2', '文件2', 'varchar(255)', 'String', 'file2', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 8, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (178, '10', 'file3', '文件3', 'varchar(255)', 'String', 'file3', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 9, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (179, '10', 'file4', '文件4', 'varchar(255)', 'String', 'file4', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 10, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (180, '10', 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'input', '', 11, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (181, '10', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 12, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (182, '10', 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'input', '', 13, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (183, '10', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'datetime', '', 14, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (184, '10', 'del_flag', '是否有效 0：有效 1：失效', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL,
        NULL, 'EQ', 'input', '', 15, 'admin', '2021-11-23 20:50:47', '', '2021-11-23 20:51:06');
INSERT INTO `gen_table_column`
VALUES (185, '11', 'id', '主键id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (186, '11', 'label', '检修内容', 'varchar(255)', 'String', 'label', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 2, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (187, '11', 'sort_no', '排序', 'int(8)', 'Integer', 'sortNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 3, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (188, '11', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1',
        'EQ', 'radio', '', 4, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (189, '11', 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'input', '', 5, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (190, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 6, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (191, '11', 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'input', '', 7, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (192, '11', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'datetime', '', 8, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (193, '12', 'id', '主键id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (194, '12', 'record_id', '检修记录id', 'varchar(64)', 'String', 'recordId', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 2, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (195, '12', 'type', '类型(0前机,1后机)', 'varchar(32)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'select', '', 3, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (196, '12', 'label', '检修内容', 'varchar(255)', 'String', 'label', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 4, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (197, '12', 'status', '状态', 'varchar(64)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'radio', '', 5, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (198, '12', 'sort_no', '排序', 'int(8)', 'Integer', 'sortNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 6, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (199, '12', 'is_delete', '是否有效 0：有效 1：失效', 'tinyint(4)', 'Integer', 'isDelete', '0', '0', '1', '1', '1',
        '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-11-24 20:45:01', '', NULL);
INSERT INTO `gen_table_column`
VALUES (200, '13', 'id', '主键Id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1, 'admin', '2021-12-03 14:28:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (201, '13', 'record_id', '测试记录id', 'varchar(50)', 'String', 'recordId', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 2, 'admin', '2021-12-03 14:28:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (202, '13', 'row_type', '类型(0: 1-2排,1: 3-4排)', 'varchar(8)', 'String', 'rowType', '0', '0', NULL, '1', '1',
        '1', '1', 'EQ', 'select', '', 3, 'admin', '2021-12-03 14:28:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (203, '13', 'flag', '状态', 'varchar(255)', 'String', 'flag', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 4, 'admin', '2021-12-03 14:28:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (204, '13', 'depth', '深度', 'varchar(32)', 'String', 'depth', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 5, 'admin', '2021-12-03 14:28:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (205, '13', 'param_one', '参数一', 'varchar(32)', 'String', 'paramOne', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 6, 'admin', '2021-12-03 14:28:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (206, '13', 'param_two', '参数二', 'varchar(32)', 'String', 'paramTwo', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 7, 'admin', '2021-12-03 14:28:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (207, '13', 'param_three', '参数三', 'varchar(32)', 'String', 'paramThree', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 8, 'admin', '2021-12-03 14:28:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (208, '14', 'apply_id', '主键', 'bigint(20)', 'Long', 'applyId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ',
        'input', '', 1, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (209, '14', 'apply_name', '应用名称', 'varchar(30)', 'String', 'applyName', '0', '0', NULL, '1', '1', '1', '1',
        'LIKE', 'input', '', 2, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (210, '14', 'version_low', '最低版本', 'varchar(64)', 'String', 'versionLow', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 3, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (211, '14', 'recommended', '推荐版本', 'varchar(64)', 'String', 'recommended', '0', '0', NULL, '1', '1', '1',
        '1', 'EQ', 'input', '', 4, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (212, '14', 'remark', '备注', 'varchar(128)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ',
        'input', '', 5, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (213, '14', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1',
        NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (214, '14', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'input', '', 7, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (215, '14', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 8, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (216, '14', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'input', '', 9, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (217, '14', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'datetime', '', 10, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (218, '15', 'system_id', '主键', 'bigint(20)', 'Long', 'systemId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ',
        'input', '', 1, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (219, '15', 'system_name', '应用名称', 'varchar(30)', 'String', 'systemName', '0', '0', NULL, '1', '1', '1', '1',
        'LIKE', 'input', '', 2, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (220, '15', 'remark', '备注', 'varchar(128)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ',
        'input', '', 3, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (221, '15', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1',
        NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (222, '15', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'input', '', 5, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (223, '15', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 6, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (224, '15', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'input', '', 7, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (225, '15', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'datetime', '', 8, 'admin', '2022-03-01 14:54:58', '', NULL);
INSERT INTO `gen_table_column`
VALUES (226, '16', 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1, 'admin', '2022-03-07 13:43:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (227, '16', 'label', '应用名称', 'varchar(30)', 'String', 'label', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 2, 'admin', '2022-03-07 13:43:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (228, '16', 'type', '类型(0用户登录,1低评分用户,2网管异常告警)', 'varchar(8)', 'String', 'type', '0', '0', NULL,
        '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2022-03-07 13:43:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (229, '16', 'data', '日期', 'date', 'Date', 'data', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4,
        'admin', '2022-03-07 13:43:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (230, '17', 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1, 'admin', '2022-03-07 13:43:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (231, '17', 'count', '数量', 'bigint(20)', 'Long', 'count', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 2, 'admin', '2022-03-07 13:43:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (232, '17', 'type', '类型(0历史记录,1每日最高记录)', 'varchar(8)', 'String', 'type', '0', '0', NULL, '1', '1',
        '1', '1', 'EQ', 'select', '', 3, 'admin', '2022-03-07 13:43:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (233, '17', 'data', '日期', 'date', 'Date', 'data', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4,
        'admin', '2022-03-07 13:43:25', '', NULL);
INSERT INTO `gen_table_column`
VALUES (234, '18', 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (235, '18', 'user_name', '用户名', 'varchar(30)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1',
        'LIKE', 'input', '', 2, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (236, '18', 'phone', '手机号码', 'varchar(64)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 3, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (237, '18', 'email', '邮箱', 'varchar(64)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 4, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (238, '18', 'apply_name', '应用名称', 'varchar(128)', 'String', 'applyName', '0', '0', NULL, '1', '1', '1', '1',
        'LIKE', 'input', '', 5, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (239, '18', 'last_time', '最后使用时间', 'datetime', 'Date', 'lastTime', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'datetime', '', 6, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (240, '18', 'auth_status', '授权状态（0正常 1代表已回收）', 'char(1)', 'String', 'authStatus', '0', '0', NULL, '1',
        '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (241, '18', 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1',
        NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (242, '18', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'input', '', 9, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (243, '18', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 10, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (244, '18', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'input', '', 11, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (245, '18', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'datetime', '', 12, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (246, '19', 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (247, '19', 'user_name', '用户名', 'varchar(30)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1',
        'LIKE', 'input', '', 2, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (248, '19', 'phone', '手机号码', 'varchar(64)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 3, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (249, '19', 'email', '邮箱', 'varchar(64)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 4, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (250, '19', 'apply_name', '应用名称', 'varchar(128)', 'String', 'applyName', '0', '0', NULL, '1', '1', '1', '1',
        'LIKE', 'input', '', 5, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (251, '19', 'last_time', '最后使用时间', 'datetime', 'Date', 'lastTime', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'datetime', '', 6, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (252, '19', 'operate_status', '操作状态（0正常 1回收 2重新授权）', 'char(1)', 'String', 'operateStatus', '0', '0',
        NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (253, '19', 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1',
        NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (254, '19', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'input', '', 9, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (255, '19', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 10, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (256, '19', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'input', '', 11, 'admin', '2022-05-31 15:54:26', '', NULL);
INSERT INTO `gen_table_column`
VALUES (257, '19', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'datetime', '', 12, 'admin', '2022-05-31 15:54:26', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `blob_data`     blob                                                          NULL COMMENT '存放持久化Trigger对象',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = 'Blob类型的触发器表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日历名称',
    `calendar`      blob                                                          NOT NULL COMMENT '存放持久化calendar对象',
    PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '日历信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`
(
    `sched_name`      varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cron表达式',
    `time_zone_id`    varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '时区',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = 'Cron类型的触发器表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`
(
    `sched_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `entry_id`          varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '调度器实例id',
    `trigger_name`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `instance_name`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例名',
    `fired_time`        bigint(13)                                                    NOT NULL COMMENT '触发的时间',
    `sched_time`        bigint(13)                                                    NOT NULL COMMENT '定时器制定的时间',
    `priority`          int(11)                                                       NOT NULL COMMENT '优先级',
    `state`             varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '状态',
    `job_name`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务名称',
    `job_group`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务组名',
    `is_nonconcurrent`  varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '是否并发',
    `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '是否接受恢复执行',
    PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '已触发的触发器表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`
(
    `sched_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `job_name`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
    `job_group`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
    `description`       varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
    `job_class_name`    varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行任务类名称',
    `is_durable`        varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '是否持久化',
    `is_nonconcurrent`  varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '是否并发',
    `is_update_data`    varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '是否更新数据',
    `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '是否接受恢复执行',
    `job_data`          blob                                                          NULL COMMENT '存放持久化job对象',
    PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '任务详细信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL,
        'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D31C100C078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL,
        'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D31C100C078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL,
        'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D31C100C078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`
(
    `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `lock_name`  varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '悲观锁名称',
    PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '存储的悲观锁信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks`
VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks`
VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '暂停的触发器表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`
(
    `sched_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `instance_name`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实例名称',
    `last_checkin_time` bigint(13)                                                    NOT NULL COMMENT '上次检查时间',
    `checkin_interval`  bigint(13)                                                    NOT NULL COMMENT '检查间隔时间',
    PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '调度器状态表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state`
VALUES ('RuoyiScheduler', 'DESKTOP-2PJR2GH1666668025545', 1666668584076, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`
(
    `sched_name`      varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `repeat_count`    bigint(7)                                                     NOT NULL COMMENT '重复的次数统计',
    `repeat_interval` bigint(12)                                                    NOT NULL COMMENT '重复的间隔时间',
    `times_triggered` bigint(10)                                                    NOT NULL COMMENT '已经触发的次数',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '简单触发器的信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `str_prop_1`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
    `str_prop_2`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
    `str_prop_3`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
    `int_prop_1`    int(11)                                                       NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
    `int_prop_2`    int(11)                                                       NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
    `long_prop_1`   bigint(20)                                                    NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
    `long_prop_2`   bigint(20)                                                    NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
    `dec_prop_1`    decimal(13, 4)                                                NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
    `dec_prop_2`    decimal(13, 4)                                                NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
    `bool_prop_1`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
    `bool_prop_2`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '同步机制的行锁表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`
(
    `sched_name`     varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的名字',
    `trigger_group`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
    `job_name`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
    `job_group`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
    `description`    varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
    `next_fire_time` bigint(13)                                                    NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
    `prev_fire_time` bigint(13)                                                    NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
    `priority`       int(11)                                                       NULL DEFAULT NULL COMMENT '优先级',
    `trigger_state`  varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '触发器状态',
    `trigger_type`   varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '触发器的类型',
    `start_time`     bigint(13)                                                    NOT NULL COMMENT '开始时间',
    `end_time`       bigint(13)                                                    NULL DEFAULT NULL COMMENT '结束时间',
    `calendar_name`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日程表名称',
    `misfire_instr`  smallint(2)                                                   NULL DEFAULT NULL COMMENT '补偿执行的策略',
    `job_data`       blob                                                          NULL COMMENT '存放持久化job对象',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    INDEX `sched_name` (`sched_name`, `job_name`, `job_group`) USING BTREE,
    CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '触发器详细信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1666668030000, -1, 5,
        'PAUSED', 'CRON', 1666668025000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1666668030000, -1, 5,
        'PAUSED', 'CRON', 1666668025000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1666668040000, -1, 5,
        'PAUSED', 'CRON', 1666668025000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for repair_file_res
-- ----------------------------
DROP TABLE IF EXISTS `repair_file_res`;
CREATE TABLE `repair_file_res`
(
    `id`          bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '主键Id',
    `record_id`   bigint(20)                                                    NULL DEFAULT NULL COMMENT '测试记录id',
    `row_type`    varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '类型(0: 1-2排,1: 3-4排)',
    `flag`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
    `depth`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '深度',
    `param_one`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '参数一',
    `param_two`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '参数二',
    `param_three` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '参数三',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `index_record_id` (`record_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 131
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '测试记录附件'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair_file_res
-- ----------------------------
INSERT INTO `repair_file_res`
VALUES (103, 141, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (104, 141, '0', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (105, 142, '1', '2', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (106, 142, '0', '2', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (107, 143, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (108, 143, '0', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (109, 144, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (110, 144, '0', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (111, 145, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (112, 145, '0', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (113, 146, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (114, 146, '0', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (115, 147, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (116, 147, '0', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (117, 148, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (118, 148, '0', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (119, 149, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (120, 149, '0', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (121, 150, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (122, 150, '0', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (123, 151, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (124, 151, '0', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (125, 152, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (126, 152, '0', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (127, 153, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (128, 153, '0', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (129, 154, '1', '1', '2', '3', '4', '5');
INSERT INTO `repair_file_res`
VALUES (130, 154, '0', '1', '2', '3', '4', '5');

-- ----------------------------
-- Table structure for repair_place
-- ----------------------------
DROP TABLE IF EXISTS `repair_place`;
CREATE TABLE `repair_place`
(
    `id`          bigint(20)                                             NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `parent_id`   bigint(20)                                             NULL DEFAULT 0 COMMENT '父id',
    `name`        varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
    `type`        char(1) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '类型',
    `switch_no`   int(32)                                                NULL DEFAULT NULL COMMENT '编号',
    `dep`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护部',
    `org`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护组',
    `eqt_type`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道岔类型',
    `eqt_mode`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道岔型号',
    `eqt_level`   varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '道岔等级',
    `action`      varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '动作',
    `lock_mode`   varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '锁闭方式',
    `sort_no`     double(4, 0)                                           NULL DEFAULT NULL COMMENT '排序',
    `create_by`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(0)                                            NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(0)                                            NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `index_prem_pid` (`parent_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 163887453010904
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '道岔号树形列表)'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair_place
-- ----------------------------
INSERT INTO `repair_place`
VALUES (163887453010243, 0, '01号线', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `repair_place`
VALUES (163887453010253, 163887453010243, '莘庄', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010263, 163887453010253, '2#', '2', 10102, '维护一部', '轨旁一组', '交叉渡线', 'ZDJ9-170/4K', '二级',
        '0', '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010273, 163887453010253, '4#', '2', 10104, '维护一部', '轨旁一组', '交叉渡线', 'ZDJ9-170/4K', '二级',
        '0', '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010283, 163887453010253, '6#', '2', 10106, '维护一部', '轨旁一组', '交叉渡线', 'ZDJ9-170/4K', '三级',
        '0', '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010293, 163887453010253, '8#', '2', 10108, '维护一部', '轨旁一组', '交叉渡线', 'ZDJ9-170/4K', '三级',
        '0', '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010303, 163887453010253, '1#', '2', 10101, '维护一部', '轨旁一组', '交叉渡线', 'ZDJ9-C/D', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010313, 163887453010253, '3#', '2', 10103, '维护一部', '轨旁一组', '交叉渡线', 'ZDJ9-C/D', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010323, 163887453010253, '5#', '2', 10105, '维护一部', '轨旁一组', '交叉渡线', 'ZDJ9-C/D', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010333, 163887453010253, '7#', '2', 10107, '维护一部', '轨旁一组', '交叉渡线', 'ZDJ9-C/D', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010343, 163887453010253, '11#', '2', 10111, '维护一部', '轨旁一组', '单独单开', 'ZDJ9-C/D', '三级',
        '1', '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010353, 163887453010243, '锦江乐园', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010363, 163887453010353, '2#', '2', 10402, '维护一部', '轨旁一组', '交叉渡线', 'ZD6-D', '三级', '0',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010373, 163887453010353, '4#', '2', 10404, '维护一部', '轨旁一组', '交叉渡线', 'ZD6-D', '三级', '0',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010383, 163887453010353, '6#', '2', 10406, '维护一部', '轨旁一组', '交叉渡线', 'ZD6-D', '三级', '0',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010393, 163887453010353, '8#', '2', 10408, '维护一部', '轨旁一组', '交叉渡线', 'ZD6-D', '三级', '0',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010403, 163887453010353, '10#', '2', 10410, '维护一部', '轨旁一组', '单独单开', 'ZD6-D', '三级', '0',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010413, 163887453010353, '12#', '2', 10412, '维护一部', '轨旁一组', '单渡线', 'ZD6-D', '三级', '0',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010423, 163887453010353, '14#', '2', 10414, '维护一部', '轨旁一组', '单渡线', 'ZD6-D', '三级', '0',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010433, 163887453010243, '上海南站', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010443, 163887453010433, '2#', '2', 10502, '维护一部', '轨旁一组', '单独单开', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010453, 163887453010433, '4#', '2', 10504, '维护一部', '轨旁一组', '单独单开', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010463, 163887453010433, '6#', '2', 10506, '维护一部', '轨旁一组', '交叉渡线', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010473, 163887453010433, '8#', '2', 10508, '维护一部', '轨旁一组', '交叉渡线', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010483, 163887453010433, '10#', '2', 10510, '维护一部', '轨旁一组', '交叉渡线', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010493, 163887453010433, '12#', '2', 10512, '维护一部', '轨旁一组', '交叉渡线', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010503, 0, '02号线', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `repair_place`
VALUES (163887453010513, 163887453010503, '创新中路', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010523, 163887453010513, '2#', '2', 22405, '维护一部', '轨旁二组', '单渡线', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010533, 163887453010513, '6#', '2', 22406, '维护一部', '轨旁二组', '单渡线', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010543, 163887453010513, '8#', '2', 22407, '维护一部', '轨旁二组', '单渡线', 'ZYJ7三开', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010553, 163887453010513, '7#', '2', 22408, '维护一部', '轨旁二组', '单渡线', 'ZYJ7三开', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010563, 163887453010503, '凌空路', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010573, 163887453010563, '2#', '2', 22702, '维护一部', '轨旁二组', '单渡线', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010583, 163887453010563, '4#', '2', 22704, '维护一部', '轨旁二组', '单渡线', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010593, 163887453010503, '远东大道', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010603, 163887453010593, '1#', '2', 22801, '维护一部', '轨旁二组', '单渡线', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010613, 163887453010593, '3#', '2', 22803, '维护一部', '轨旁二组', '单渡线', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010623, 163887453010593, '5#', '2', 22805, '维护一部', '轨旁二组', '单独单开', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010633, 163887453010593, '7#', '2', 22807, '维护一部', '轨旁二组', '单独单开', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010643, 163887453010503, '海天三路', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010653, 163887453010643, '2#', '2', 22902, '维护一部', '轨旁二组', '单渡线', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010663, 163887453010643, '4#', '2', 22904, '维护一部', '轨旁二组', '单渡线', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010673, 163887453010643, '6#', '2', 22906, '维护一部', '轨旁二组', '单独单开', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010683, 163887453010503, '浦东机场', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010693, 163887453010683, '1#', '2', 23001, '维护一部', '轨旁二组', '交叉渡线', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010703, 163887453010683, '3#', '2', 23003, '维护一部', '轨旁二组', '交叉渡线', 'ZDJ9-A/B', '三级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010713, 163887453010683, '5#', '2', 23005, '维护一部', '轨旁二组', '交叉渡线', 'ZDJ9-A/B', '二级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010723, 163887453010683, '7#', '2', 23007, '维护一部', '轨旁二组', '交叉渡线', 'ZDJ9-A/B', '二级', '1',
        '外锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010733, 0, '03号线', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `repair_place`
VALUES (163887453010743, 163887453010433, '2#', '2', 30102, '维护三部', '轨旁二组', '单渡线', 'ZD6-E/J', '二级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010753, 163887453010433, '4#', '2', 30104, '维护三部', '轨旁二组', '单渡线', 'ZD6-E/J', '二级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010763, 163887453010433, '6#', '2', 30106, '维护三部', '轨旁二组', '单渡线', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010773, 163887453010433, '8#', '2', 30108, '维护三部', '轨旁二组', '单渡线', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010783, 163887453010733, '石龙路', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010793, 163887453010783, '2#', '2', 30202, '维护三部', '轨旁二组', '单独', 'ZD6-E/J', '二级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010803, 163887453010783, '4#', '2', 30204, '维护三部', '轨旁二组', '单渡线', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010813, 163887453010783, '6#', '2', 30206, '维护三部', '轨旁二组', '单渡线', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010823, 163887453010783, '8#', '2', 30208, '维护三部', '轨旁二组', '单渡线', 'ZD6-D', '三级', '0',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010833, 163887453010783, '10#', '2', 30210, '维护三部', '轨旁二组', '单渡线', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010843, 163887453010783, '12#', '2', 30212, '维护三部', '轨旁二组', '单渡线', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010853, 163887453010783, '14#', '2', 30214, '维护三部', '轨旁二组', '单渡线', 'ZD6-D', '三级', '0',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010863, 163887453010783, '16#', '2', 30216, '维护三部', '轨旁二组', '单独', 'ZD6-D', '三级', '0',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010873, 163887453010783, '18#', '2', 30218, '维护三部', '轨旁二组', '单独', 'ZD6-D', '三级', '0',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010883, 163887453010733, '宜山路', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010893, 163887453010883, '1#', '2', 30501, '维护三部', '轨旁二组', '单渡线', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `repair_place`
VALUES (163887453010903, 163887453010883, '3#', '2', 30503, '维护三部', '轨旁二组', '单渡线', 'ZD6-E/J', '三级', '1',
        '内锁闭', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for repair_place_info
-- ----------------------------
DROP TABLE IF EXISTS `repair_place_info`;
CREATE TABLE `repair_place_info`
(
    `id`                      bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `switch_no`               varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '道岔编号',
    `route`                   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '线路',
    `station`                 varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '车站',
    `dep`                     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '维护部',
    `org`                     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '维护组',
    `name`                    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '道岔名称',
    `eqt_type`                varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '道岔类型',
    `eqt_mode`                varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '道岔型号',
    `eqt_level`               varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '道岔等级',
    `admit_location`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '开向位置',
    `position_colsed`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '定位闭合',
    `action`                  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '动作',
    `sequence`                varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '顺序',
    `lock_mode`               varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '锁闭方式',
    `installation_mode`       varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '安装方式',
    `installation_drawing_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安装装置图号',
    `external_locking_device` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '外锁闭装置',
    `paste_checker`           varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '密贴检查器',
    `circuit_standard`        varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '电路制式',
    `express`                 varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '表示',
    `install_date`            date                                                    NULL DEFAULT NULL COMMENT '道岔安装',
    `unloading_date`          date                                                    NULL DEFAULT NULL COMMENT '道岔拆卸',
    `line_coordinates`        varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '线路坐标',
    `line_enviroment`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '线路环境',
    `ballast_bed_type`        varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '道床类型',
    `switch_type`             varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '道岔类型',
    `rail_type`               varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '钢轨类型',
    `switch_num`              varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '道岔号数',
    `drawing_num`             varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '工务图号',
    `responsible`             varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '包保人',
    `locked`                  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '锁定',
    `pic`                     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道岔图',
    `coordinate_x`            varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '横坐标',
    `coordinate_y`            varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '纵坐标',
    `create_by`               varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建人',
    `create_time`             datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`               varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新人',
    `update_time`             datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `index_prem_switch_no` (`switch_no`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1703
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '道岔信息'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair_place_info
-- ----------------------------
INSERT INTO `repair_place_info`
VALUES (1649, '010102', '01号线', '莘庄', '维护一部', '轨旁一组', '2#', '交叉渡线', 'ZDJ9-170/4K', '二级', '右', '',
        '单机', '', '内锁闭', '基础角钢', 'STB-GJ-030525-300', '', '', '五线制', '单动双机串联', '2018-01-31',
        '2033-01-31', '5+760.07S', '露天、地面', '碎石', NULL, '60kg/m', '9号', 'STB-GJ-030535', '', '正常',
        'daocha5.jpg', '282', '55', 'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1650, '010104', '01号线', '莘庄', '维护一部', '轨旁一组', '4#', '交叉渡线', 'ZDJ9-170/4K', '二级', '左开',
        '1、3', '单机', '', '内锁闭', '大小角钢', 'G09-118-2', '', '', '五线制', '单独', '2012-11-24', '2016-03-25', '',
        '露天、地面', '碎石', NULL, '60kg/m', '9号', '专线7583', '', '正常', 'daocha2.jpg', '95', '55', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1651, '010106', '01号线', '莘庄', '维护一部', '轨旁一组', '6#', '交叉渡线', 'ZDJ9-170/4K', '三级', '右', '',
        '单机', '', '内锁闭', '基础角钢', 'STB-GJ-030525-300', '', '', '五线制', '单动双机串联', '2018-01-31',
        '2033-01-31', '5+830.15S', '露天、地面', '碎石', NULL, '60kg/m', '9号', 'STB-GJ-030535', '', '正常',
        'daocha5.jpg', '200', '131', 'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1652, '010108', '01号线', '莘庄', '维护一部', '轨旁一组', '8#', '交叉渡线', 'ZDJ9-170/4K', '三级', '左开',
        '1、3', '单机', '', '内锁闭', '大小角钢', 'G09-118-2', '', '', '五线制', '单独', '2012-11-24', '2016-03-25', '',
        '露天、地面', '碎石', NULL, '60kg/m', '9号', '专线7583', '', '正常', 'daocha2.jpg', '12', '131', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1653, '010101', '01号线', '莘庄', '维护一部', '轨旁一组', '1#', '交叉渡线', 'ZDJ9-C/D', '三级', '左', '',
        '双机', '', '内锁闭', '基础角钢', 'STB-GJ-030525-300', '', '', '五线制', '单动双机串联', '2018-01-31',
        '2033-01-31', '5+760.07S', '露天、地面', '碎石', NULL, '60kg/m', '9号', 'STB-GJ-030535', '', '正常',
        'daocha7.jpg', '282', '131', 'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1654, '010103', '01号线', '莘庄', '维护一部', '轨旁一组', '3#', '交叉渡线', 'ZDJ9-C/D', '三级', '右开', '2、4',
        '双机', '', '内锁闭', '大小角钢', 'G09-118-2', '', '', '五线制', '单独', '2012-11-24', '2022-11-23', '',
        '露天、地面', '碎石', NULL, '60kg/m', '9号', '专线7583', '', '正常', 'daocha4.jpg', '95', '131', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1655, '010105', '01号线', '莘庄', '维护一部', '轨旁一组', '5#', '交叉渡线', 'ZDJ9-C/D', '三级', '右', '1、3',
        '双机', '', '内锁闭', '基础角钢', 'STB-GJ-030525-300', '', '', '五线制', '单动双机串联', '2018-01-31',
        '2033-01-31', '5+830.15S', '露天、地面', '碎石', NULL, '60kg/m', '9号', 'STB-GJ-030535', '', '正常',
        'daocha8.jpg', '200', '55', 'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1656, '010107', '01号线', '莘庄', '维护一部', '轨旁一组', '7#', '交叉渡线', 'ZDJ9-C/D', '三级', '右开', '2、4',
        '双机', '', '内锁闭', '大小角钢', 'G09-118-2', '', '', '五线制', '单独', '2012-11-24', '2022-11-23', '',
        '露天、地面', '碎石', NULL, '60kg/m', '9号', '专线7583', '', '正常', 'daocha4.jpg', '12', '55', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1657, '010111', '01号线', '莘庄', '维护一部', '轨旁一组', '11#', '单独单开', 'ZDJ9-C/D', '三级', '左', '',
        '双机', '', '内锁闭', '基础角钢', 'STB-GJ-030525-300', '', '', '五线制', '单动双机串联', '2018-01-31',
        '2033-01-31', '5+865.96S', '露天、地面', '碎石', NULL, '60kg/m', '9号', 'STB-GJ-030525', '', '正常',
        'daocha6.jpg', '164', '55', 'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1658, '010402', '01号线', '锦江乐园', '维护一部', '轨旁一组', '2#', '交叉渡线', 'ZD6-D', '三级', '左开', '1、3',
        '单机', '第一动', '内锁闭', '大小角钢', '电号9086', '', '', '', '串联', '2011-06-01', '2016-06-30', '',
        '露天、地面', '碎石', NULL, '60kg/m', '9号', '专线7578', '', '正常', 'daocha2.jpg', '532', '55', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1659, '010404', '01号线', '锦江乐园', '维护一部', '轨旁一组', '4#', '交叉渡线', 'ZD6-D', '三级', '左开', '1、3',
        '单机', '第二动', '内锁闭', '大小角钢', '电号9086', '', '', '', '串联', '2011-06-01', '2016-06-30', '',
        '露天、地面', '碎石', NULL, '60kg/m', '9号', '专线7578', '', '正常', 'daocha2.jpg', '455', '131', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1660, '010406', '01号线', '锦江乐园', '维护一部', '轨旁一组', '6#', '交叉渡线', 'ZD6-D', '三级', '右开', '2、4',
        '单机', '第一动', '内锁闭', '大小角钢', '电号9086', '', '', '', '串联', '2011-06-01', '2016-06-30', '',
        '露天、地面', '碎石', NULL, '60kg/m', '9号', '专线7578', '', '正常', 'daocha4.jpg', '532', '131', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1661, '010408', '01号线', '锦江乐园', '维护一部', '轨旁一组', '8#', '交叉渡线', 'ZD6-D', '三级', '右开', '2、4',
        '单机', '第二动', '内锁闭', '大小角钢', '电号9086', '', '', '', '串联', '2011-06-01', '2016-06-30', '',
        '露天、地面', '碎石', NULL, '60kg/m', '9号', '专线7578', '', '正常', 'daocha4.jpg', '455', '55', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1662, '010410', '01号线', '锦江乐园', '维护一部', '轨旁一组', '10#', '单独单开', 'ZD6-D', '三级', '左开', '2、4',
        '单机', '', '内锁闭', '大小角钢', '电号9086', '', '', '四线制', '单独', '2015-06-01', '2016-06-30', '',
        '露天、地面', '碎石', NULL, '60kg/m', '9号', '专线7578', '', '正常', 'daocha3.jpg', '432', '131', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1663, '010412', '01号线', '锦江乐园', '维护一部', '轨旁一组', '12#', '单渡线', 'ZD6-D', '三级', '右开', '2、4',
        '单机', '第一动', '内锁闭', '大小角钢', '电号9086', '', '', '四线制', '串联', '2015-06-01', '2016-06-30', '',
        '露天、地面', '碎石', NULL, '60kg/m', '9号', '专线7578', '', '正常', 'daocha4.jpg', '415', '131', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1664, '010414', '01号线', '锦江乐园', '维护一部', '轨旁一组', '14#', '单渡线', 'ZD6-D', '三级', '右开', '2、4',
        '单机', '第二动', '内锁闭', '大小角钢', '电号9086', '', '', '四线制', '串联', '2015-06-01', '2016-06-30', '',
        '露天、地面', '碎石', NULL, '60kg/m', '9号', '专线7578', '', '正常', 'daocha4.jpg', '410', '55', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1665, '010502', '01号线', '上海南站', '维护一部', '轨旁一组', '2#', '单独单开', 'ZD6-E/J', '三级', '左开',
        '2、4', '双机', '', '内锁闭', '大小角钢', '001－XH/02', '', '', '四线制', '单独', '2015-02-01', '2016-02-29', '',
        '洞下', '整体', NULL, '60kg/m', '9号', '地岔211', '', '正常', 'daocha8.jpg', '747', '116', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1666, '010504', '01号线', '上海南站', '维护一部', '轨旁一组', '4#', '单独单开', 'ZD6-E/J', '三级', '右开',
        '1、3', '双机', '', '内锁闭', '大小角钢', '001－XH/02', '', '', '四线制', '单独', '2014-02-01', '2017-02-28', '',
        '洞下', '整体', NULL, '60kg/m', '9号', '地岔211', '', '正常', 'daocha6.jpg', '747', '70', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1667, '010506', '01号线', '上海南站', '维护一部', '轨旁一组', '6#', '交叉渡线', 'ZD6-E/J', '三级', '右开',
        '1、3', '双机', '第一动', '内锁闭', '大小角钢', '001－XH/02', '', '', '四线制', '串联', '2014-02-01',
        '2017-02-28', '', '洞下', '整体', NULL, '60kg/m', '9号', '地岔232', '', '正常', 'daocha7.jpg', '710', '116',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1668, '010508', '01号线', '上海南站', '维护一部', '轨旁一组', '8#', '交叉渡线', 'ZD6-E/J', '三级', '左开',
        '2、4', '双机', '第二动', '内锁闭', '大小角钢', '001－XH/02', '', '', '四线制', '串联', '2014-02-01',
        '2017-02-28', '', '洞下', '整体', NULL, '60kg/m', '9号', '地岔232', '', '正常', 'daocha5.jpg', '648', '85',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1669, '010510', '01号线', '上海南站', '维护一部', '轨旁一组', '10#', '交叉渡线', 'ZD6-E/J', '三级', '左开',
        '2、4', '双机', '第一动', '内锁闭', '大小角钢', '001－XH/02', '', '', '四线制', '串联', '2014-02-01',
        '2017-02-28', '', '洞下', '整体', NULL, '60kg/m', '9号', '地岔232', '', '正常', 'daocha8.jpg', '710', '70',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1670, '010512', '01号线', '上海南站', '维护一部', '轨旁一组', '12#', '交叉渡线', 'ZD6-E/J', '三级', '右开',
        '1、3', '双机', '第二动', '内锁闭', '大小角钢', '001－XH/02', '', '', '四线制', '串联', '2014-02-01',
        '2017-02-28', '', '洞下', '整体', NULL, '60kg/m', '9号', '地岔232', '', '正常', 'daocha6.jpg', '648', '101',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1671, '022405', '02号线', '创新中路', '维护一部', '轨旁二组', '2#', '单渡线', 'ZDJ9-A/B', '三级', '右', '1、3',
        '双机', '', '外锁闭', '大小角钢', 'STB-GJ-030501-1000（S0885）', 'STB-GJ-030501-1000（S0884）', '/', '五线制',
        '串联', '2010-12-06', NULL, 'SK11+773.154', '洞下', '整体', NULL, '60kg/m', '9号', 'STB-GJ-030501', '', '正常',
        'daocha5.jpg', '417', '490', 'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1672, '022406', '02号线', '创新中路', '维护一部', '轨旁二组', '6#', '单渡线', 'ZDJ9-A/B', '三级', '左', '1、3',
        '双机', '', '外锁闭', '大小角钢', 'STB-GJ-030501-1000（S0885）', 'STB-GJ-030501-1000（S0884）', '/', '五线制',
        '串联', '2010-12-06', NULL, 'SK11+448.454', '洞下', '整体', NULL, '60kg/m', '9号', 'STB-GJ-030501', '', '正常',
        'daocha7.jpg', '315', '490', 'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1673, '022407', '02号线', '创新中路', '维护一部', '轨旁二组', '8#', '单渡线', 'ZYJ7三开', '三级', '右', '2、4',
        '双机', '', '外锁闭', '大小角钢', 'STB-GJ-030502-700（S0686）', '/', 'JM-A型', '五线制', '串联', '2010-12-06',
        NULL, 'SK11+711.848', '洞下', '整体', NULL, '60kg/m', '9号', '申通轨道002-1', '', '正常', 'daocha14.jpg', '391',
        '445', 'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1674, '022408', '02号线', '创新中路', '维护一部', '轨旁二组', '7#', '单渡线', 'ZYJ7三开', '三级', '左', '1、3',
        '双机', '', '外锁闭', '大小角钢', 'STB-GJ-030502-700（S0686）', '/', 'JM-A型', '五线制', '串联', '2010-12-06',
        NULL, 'SK11+509.761', '洞下', '整体', NULL, '60kg/m', '9号', '申通轨道002-1', '', '正常', 'daocha14.jpg', '326',
        '445', 'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1675, '022702', '02号线', '凌空路', '维护一部', '轨旁二组', '2#', '单渡线', 'ZDJ9-A/B', '三级', '右伸', '2、4',
        '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'XK18+932.202', '洞下', '整体', NULL, '60kg/m', '9号', '', '', '正常', 'daocha7.jpg', '606', '415', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1676, '022704', '02号线', '凌空路', '维护一部', '轨旁二组', '4#', '单渡线', 'ZDJ9-A/B', '三级', '右伸', '2、4',
        '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'SK19+000.552', '洞下', '整体', NULL, '60kg/m', '9号', '', '', '正常', 'daocha7.jpg', '648', '490', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1677, '022801', '02号线', '远东大道', '维护一部', '轨旁二组', '1#', '单渡线', 'ZDJ9-A/B', '三级', '左伸', '2、4',
        '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'SK22+371.860', '高架、露天', '整体', NULL, '60kg/m', '9号', '', '', '正常', 'daocha8.jpg', '824', '445',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1678, '022803', '02号线', '远东大道', '维护一部', '轨旁二组', '3#', '单渡线', 'ZDJ9-A/B', '三级', '左伸', '2、4',
        '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'XK22+289.860', '高架、露天', '整体', NULL, '60kg/m', '9号', '', '', '正常', 'daocha8.jpg', '794', '432',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1679, '022805', '02号线', '远东大道', '维护一部', '轨旁二组', '5#', '单独单开', 'ZDJ9-A/B', '三级', '右伸',
        '1、3', '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'XK22+324.418', '高架、露天', '整体', NULL, '60kg/m', '9号', '', '', '正常', 'daocha6.jpg', '811', '415',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1680, '022807', '02号线', '远东大道', '维护一部', '轨旁二组', '7#', '单独单开', 'ZDJ9-A/B', '三级', '右伸',
        '1、3', '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'SK22+267.475', '高架、露天', '整体', NULL, '60kg/m', '9号', '', '', '正常', '', '786', '474', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1681, '022902', '02号线', '海天三路', '维护一部', '轨旁二组', '2#', '单渡线', 'ZDJ9-A/B', '三级', '左伸', '2、4',
        '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'SK25+565.923', '高架、露天', '整体', NULL, '60kg/m', '9号', '', '', '正常', 'daocha6.jpg', '918', '461',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1682, '022904', '02号线', '海天三路', '维护一部', '轨旁二组', '4#', '单渡线', 'ZDJ9-A/B', '三级', '左伸', '2、4',
        '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'SK25+659.623', '高架、露天', '整体', NULL, '60kg/m', '9号', '', '', '正常', 'daocha8.jpg', '949', '474',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1683, '022906', '02号线', '海天三路', '维护一部', '轨旁二组', '6#', '单独单开', 'ZDJ9-A/B', '三级', '右伸',
        '1、3', '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'XK25+659.450', '高架、露天', '整体', NULL, '60kg/m', '9号', '', '', '正常', 'daocha6.jpg', '958', '432',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1684, '023001', '02号线', '浦东机场', '维护一部', '轨旁二组', '1#', '交叉渡线', 'ZDJ9-A/B', '三级', '右伸',
        '1、3', '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'XK28+219.995', '高架、露天', '整体', NULL, '60kg/m', '9号', '', '', '正常', 'daocha6.jpg', '1171', '432',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1685, '023003', '02号线', '浦东机场', '维护一部', '轨旁二组', '3#', '交叉渡线', 'ZDJ9-A/B', '三级', '右伸',
        '1、3', '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'SK28+149.792', '高架、露天', '整体', NULL, '60kg/m', '9号', '', '', '正常', 'daocha6.jpg', '1130', '474',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1686, '023005', '02号线', '浦东机场', '维护一部', '轨旁二组', '5#', '交叉渡线', 'ZDJ9-A/B', '二级', '左伸',
        '2、4', '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'SK28+219.192', '高架、露天', '整体', NULL, '60kg/m', '9号', '', '', '正常', 'daocha8.jpg', '1171', '474',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1687, '023007', '02号线', '浦东机场', '维护一部', '轨旁二组', '7#', '交叉渡线', 'ZDJ9-A/B', '二级', '左伸',
        '2、4', '双机', '', '外锁闭', '大小角钢', 'GJ-030501-1000', '', '', '五线制', '串联', '2010-12-06', NULL,
        'XK28+150.595', '高架、露天', '整体', NULL, '60kg/m', '9号', '', '', '正常', 'daocha8.jpg', '1130', '432',
        'admin', '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1688, '030102', '03号线', '上海南站', '维护三部', '轨旁二组', '2#', '单渡线', 'ZD6-E/J', '二级', '右', '2,4',
        '双机', '', '内锁闭', '大小角钢', 'S9831B', '', '', '六线制', '单独', '1905-07-07', NULL, '0-175.1',
        '地面，雨棚', '碎石', NULL, '60KG/M', '9号', '专线9953', '', '正常', 'daocha8.jpg', '33', '87', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1689, '030104', '03号线', '上海南站', '维护三部', '轨旁二组', '4#', '单渡线', 'ZD6-E/J', '二级', '右', '2,4',
        '双机', '', '内锁闭', '大小角钢', 'S9831B', '', '', '六线制', '单独', '1905-07-07', NULL, '0-117.1',
        '地面，雨棚', '碎石', NULL, '60KG/M', '9号', '专线9953', '', '正常', 'daocha7.jpg', '56', '148', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1690, '030106', '03号线', '上海南站', '维护三部', '轨旁二组', '6#', '单渡线', 'ZD6-E/J', '三级', '左', '1,3',
        '双机', '', '内锁闭', '大小角钢', 'S9831B', '', '', '六线制', '单独', '1905-07-07', NULL, '0-110.9',
        '地面，雨棚', '碎石', NULL, '60KG/M', '9号', '专线9953', '', '正常', 'daocha5.jpg', '102', '148', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1691, '030108', '03号线', '上海南站', '维护三部', '轨旁二组', '8#', '单渡线', 'ZD6-E/J', '三级', '左', '1,3',
        '双机', '', '内锁闭', '大小角钢', 'S9831B', '', '', '六线制', '单独', '1905-07-07', NULL, '0-017.5',
        '地面，雨棚', '碎石', NULL, '60KG/M', '9号', '专线9953', '', '正常', 'daocha6.jpg', '123', '87', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1692, '030202', '03号线', '石龙路', '维护三部', '轨旁二组', '2#', '单独', 'ZD6-E/J', '二级', '左', '1,3',
        '双机', '', '内锁闭', '大小角钢', 'S9831B', '', '', '六线制', '单独', '1905-07-07', NULL, '1+174', '地面，露天',
        '碎石', NULL, '60KG/M', '9号', '专线9953', '', '正常', 'daocha6.jpg', '306', '148', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1693, '030204', '03号线', '石龙路', '维护三部', '轨旁二组', '4#', '单渡线', 'ZD6-E/J', '三级', '左', '1,3',
        '双机', '第二动', '内锁闭', '大小角钢', 'S9831B', '', '', '六线制', '多动串联', '1905-07-07', NULL, '1+190.4',
        '地面，露天', '碎石', NULL, '60KG/M', '9号', '专线9953', '', '正常', 'daocha5.jpg', '331', '148', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1694, '030206', '03号线', '石龙路', '维护三部', '轨旁二组', '6#', '单渡线', 'ZD6-E/J', '三级', '左', '1,3',
        '双机', '第一动', '内锁闭', '大小角钢', 'S9831B', '', '', '六线制', '多动串联', '1905-07-07', NULL, '1+248.4',
        '地面，露天', '碎石', NULL, '60KG/M', '9号', '专线9953', '', '正常', 'daocha5.jpg', '390', '73', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1695, '030208', '03号线', '石龙路', '维护三部', '轨旁二组', '8#', '单渡线', 'ZD6-D', '三级', '左', '1,3',
        '单机', '第二动', '内锁闭', '大小角钢', 'S9832', '', '', '六线制', '多动串联', '1905-07-07', NULL, '1+116',
        '地面，露天', '碎石', NULL, '50KG/M', '7号', '专线9931', '', '正常', 'daocha2.jpg', '354', '174', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1696, '030210', '03号线', '石龙路', '维护三部', '轨旁二组', '10#', '单渡线', 'ZD6-E/J', '三级', '左', '1,3',
        '双机', '第一动', '内锁闭', '大小角钢', 'S9831B', '', '', '六线制', '多动串联', '1905-07-07', NULL, '1+257.6',
        '地面，露天', '碎石', NULL, '60KG/M', '9号', '专线9953', '', '正常', 'daocha6.jpg', '400', '148', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1697, '030212', '03号线', '石龙路', '维护三部', '轨旁二组', '12#', '单渡线', 'ZD6-E/J', '三级', '右', '2,4',
        '双机', '第一动', '内锁闭', '大小角钢', 'S9831B', '', '', '六线制', '多动串联', '1905-07-04', NULL, '1+215',
        '地面，露天', '碎石', NULL, '60KG/M', '9号', '专线9953', '', '正常', 'daocha8.jpg', '354', '73', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1698, '030214', '03号线', '石龙路', '维护三部', '轨旁二组', '14#', '单渡线', 'ZD6-D', '三级', '右', '2,4',
        '单机', '第二动', '内锁闭', '大小角钢', 'S9832', '', '', '六线制', '多动串联', '1905-07-04', NULL, '',
        '地面，露天', '碎石', NULL, '50KG/M', '7号', '专线4185', '', '正常', 'daocha4.jpg', '324', '70', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1699, '030216', '03号线', '石龙路', '维护三部', '轨旁二组', '16#', '单独', 'ZD6-D', '三级', '右', '2,4', '单机',
        '', '内锁闭', '大小角钢', 'S9832', '', '', '四线制', '单独', '1905-07-04', NULL, '', '地面，露天', '碎石', NULL,
        '50KG/M', '7号', '专线4185', '', '正常', 'daocha3.jpg', '308', '57', 'admin', '2021-12-07 18:55:30', NULL,
        NULL);
INSERT INTO `repair_place_info`
VALUES (1700, '030218', '03号线', '石龙路', '维护三部', '轨旁二组', '18#', '单独', 'ZD6-D', '三级', '右', '2,4', '单机',
        '', '内锁闭', '大小角钢', 'S9832', '', '', '四线制', '单独', '1905-07-04', NULL, '', '地面，露天', '碎石', NULL,
        '50KG/M', '7号', '专线4185', '', '正常', 'daocha4.jpg', '304', '28', 'admin', '2021-12-07 18:55:30', NULL,
        NULL);
INSERT INTO `repair_place_info`
VALUES (1701, '030501', '03号线', '宜山路', '维护三部', '轨旁二组', '1#', '单渡线', 'ZD6-E/J', '三级', '左', '1,3',
        '双机', '第二动', '内锁闭', '槽钢', 'G13-217-2', '', '', '六线制', '多动串联', '1905-07-07', NULL, '5+578',
        '地面，露天', '整体', NULL, '60KG/M', '9号', '专线9950', '', '正常', 'daocha6.jpg', '867', '87', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);
INSERT INTO `repair_place_info`
VALUES (1702, '030503', '03号线', '宜山路', '维护三部', '轨旁二组', '3#', '单渡线', 'ZD6-E/J', '三级', '左', '1,3',
        '双机', '第一动', '内锁闭', '槽钢', 'G13-217-2', '', '', '六线制', '多动串联', '1905-07-07', NULL, '5+520',
        '地面，露天', '整体', NULL, '60KG/M', '9号', '专线9950', '', '正常', 'daocha6.jpg', '801', '133', 'admin',
        '2021-12-07 18:55:30', NULL, NULL);

-- ----------------------------
-- Table structure for repair_record
-- ----------------------------
DROP TABLE IF EXISTS `repair_record`;
CREATE TABLE `repair_record`
(
    `id`          bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `route_id`    bigint(20)                                              NULL     DEFAULT NULL COMMENT '线路id',
    `station_id`  bigint(20)                                              NULL     DEFAULT NULL COMMENT '车站id',
    `switch_id`   bigint(20)                                              NULL     DEFAULT NULL COMMENT '道岔号id',
    `type`        varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL     DEFAULT NULL COMMENT '类型',
    `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '描述',
    `file1`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '\r\n文件1',
    `file2`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '文件2',
    `file3`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '文件3',
    `file4`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '文件4',
    `create_by`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL     DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(0)                                             NULL     DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL     DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(0)                                             NULL     DEFAULT NULL COMMENT '更新时间',
    `del_flag`    char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL DEFAULT '0' COMMENT '是否有效 0：有效 1：失效',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `index_prem_pid` (`route_id`) USING BTREE,
    INDEX `index_station_id` (`station_id`) USING BTREE,
    INDEX `index_switch_id` (`switch_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 155
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '检修记录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair_record
-- ----------------------------
INSERT INTO `repair_record`
VALUES (141, 163887453010243, 163887453010433, 163887453010453, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/ae9ffae8751a43f5a2e8b6055bd80d70.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/a306f0502bd3472c9dff3f67f347ba46.jpg', NULL,
        NULL, 'admin', '2021-11-04 18:56:13', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (142, 163887453010503, 163887453010593, 163887453010603, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/0f99506485da4950b7bb50a3de01ae3f.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/a4ee465235e24554bfe32dbfd87939b5.jpg', NULL,
        NULL, 'admin', '2021-12-09 18:56:31', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (143, 163887453010243, 163887453010253, 163887453010263, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/559655ab3cb64154a36782d3107b0ba8.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/d07a2cbbcf6949c2855c8b39ae70d933.jpg', NULL,
        NULL, 'admin', '2021-12-09 18:56:48', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (144, 163887453010243, 163887453010433, 163887453010453, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/76c3db3b7ba249b8867aae10653e2a04.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/0bb867aadd6a430a858150c27e698073.jpg', NULL,
        NULL, 'admin', '2021-12-10 19:24:08', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (145, 163887453010243, 163887453010353, 163887453010373, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/4ceef5ae0265447b9344f841f5b68ddf.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/f80c841a5bc24cd89692919f713c6080.jpg', NULL,
        NULL, 'admin', '2021-12-10 19:24:24', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (146, 163887453010733, 163887453010783, 163887453010793, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/45419cac7a9d45b28b4c2f19d612129f.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/6b357a0353064e239758583c76a837a5.jpg', NULL,
        NULL, 'admin', '2021-12-10 19:24:40', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (147, 163887453010733, 163887453010883, 163887453010903, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/5703db51f6ad4fc3a3abdb6e1970de04.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/b8d9ccc110bd4484980ea2c18f31b93c.jpg', NULL,
        NULL, 'admin', '2021-12-10 19:24:57', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (148, 163887453010503, 163887453010593, 163887453010603, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/ff4d6258cfe2441ba3f8111bb9a235f3.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/f69372fc5b234f3680802efb06f5b39c.jpg', NULL,
        NULL, 'admin', '2021-12-02 19:25:14', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (149, 163887453010503, 163887453010643, 163887453010663, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/48238209c18d473ead4a66e3a9b3b772.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/b7ac02cf47e7414ca08e7850a37e4bde.jpg', NULL,
        NULL, 'admin', '2021-12-02 19:25:32', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (150, 163887453010503, 163887453010683, 163887453010713, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/ad66f52e3b984ab5981e809a1087fb2c.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/69ed748738f74e7faa8c1009010624ce.jpg', NULL,
        NULL, 'admin', '2021-12-02 19:25:48', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (151, 163887453010503, 163887453010513, 163887453010543, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/5229bde02f3d41ad90156fd2f3ca10fa.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/8049131f0ccb41aea80c5de1a53f9445.jpg', NULL,
        NULL, 'admin', '2021-12-07 19:26:04', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (152, 163887453010503, 163887453010563, 163887453010583, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/c6faeb9dbabe4958b9bd726747f1c6cb.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/811d5fab64314ccbb46a44900c88fe11.jpg', NULL,
        NULL, 'admin', '2021-12-07 19:26:20', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (153, 163887453010243, 163887453010433, 163887453010453, '1', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211208/9feb58cb44a64e128416aa0a53f02f47.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211208/1239e14c3231442e9709caf3d4f22fef.jpg', NULL,
        NULL, 'admin', '2021-12-08 18:01:04', NULL, NULL, '0');
INSERT INTO `repair_record`
VALUES (154, 163887453010243, 163887453010253, 163887453010303, '0', NULL,
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211208/99bac887d58d459f9ee52eb4922de0bd.jpg',
        'https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211208/d947aac5a2894d17a0e78322e0fc4192.png', NULL,
        NULL, 'admin', '2021-12-08 18:02:44', NULL, NULL, '0');

-- ----------------------------
-- Table structure for repair_table
-- ----------------------------
DROP TABLE IF EXISTS `repair_table`;
CREATE TABLE `repair_table`
(
    `id`          bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `label`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '检修内容',
    `sort_no`     int(8)                                                  NULL     DEFAULT NULL COMMENT '排序',
    `status`      varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL     DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(0)                                             NULL     DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL     DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(0)                                             NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '检测表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair_table
-- ----------------------------
INSERT INTO `repair_table`
VALUES (5, 'CCC', 3, '', 'admin', '2021-11-19 11:44:32', NULL, NULL);
INSERT INTO `repair_table`
VALUES (6, 'DDD', 5, '', 'admin', '2021-11-19 11:47:36', NULL, NULL);
INSERT INTO `repair_table`
VALUES (7, 'EEE', 4, '', 'admin', '2021-11-19 11:47:47', NULL, NULL);
INSERT INTO `repair_table`
VALUES (8, 'AAA', 1, '', 'admin', '2021-11-25 23:12:59', NULL, NULL);

-- ----------------------------
-- Table structure for repair_test
-- ----------------------------
DROP TABLE IF EXISTS `repair_test`;
CREATE TABLE `repair_test`
(
    `id`        bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `record_id` bigint(20)                                              NULL     DEFAULT NULL COMMENT '检修记录id',
    `label`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '检修内容',
    `status`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL     DEFAULT NULL COMMENT '状态',
    `sort_no`   int(8)                                                  NULL     DEFAULT NULL COMMENT '排序',
    `is_delete` tinyint(4)                                              NOT NULL DEFAULT 0 COMMENT '是否有效 0：有效 1：失效',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `index_record_id` (`record_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 282
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '检修记录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair_test
-- ----------------------------
INSERT INTO `repair_test`
VALUES (160, 124, 'AAA', '2', 1, 0);
INSERT INTO `repair_test`
VALUES (161, 124, 'BBB', '2', 1, 0);
INSERT INTO `repair_test`
VALUES (162, 124, 'CCC', '2', 1, 0);
INSERT INTO `repair_test`
VALUES (163, 125, 'AAA', '2', 1, 0);
INSERT INTO `repair_test`
VALUES (164, 125, 'BBB', '2', 1, 0);
INSERT INTO `repair_test`
VALUES (165, 125, 'CCC', '2', 1, 0);
INSERT INTO `repair_test`
VALUES (166, 126, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (167, 126, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (168, 126, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (169, 126, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (170, 127, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (171, 127, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (172, 127, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (173, 127, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (174, 128, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (175, 128, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (176, 128, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (177, 128, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (178, 129, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (179, 129, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (180, 129, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (181, 129, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (182, 130, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (183, 130, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (184, 130, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (185, 130, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (186, 131, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (187, 131, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (188, 131, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (189, 131, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (190, 132, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (191, 132, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (192, 132, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (193, 132, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (194, 133, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (195, 133, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (196, 133, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (197, 133, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (198, 134, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (199, 134, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (200, 134, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (201, 134, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (202, 135, 'AAA', '1', 1, 0);
INSERT INTO `repair_test`
VALUES (203, 135, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (204, 135, 'EEE', '2', 4, 0);
INSERT INTO `repair_test`
VALUES (205, 135, 'DDD', '1', 5, 0);
INSERT INTO `repair_test`
VALUES (206, 136, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (207, 136, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (208, 136, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (209, 136, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (210, 137, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (211, 137, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (212, 137, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (213, 137, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (214, 138, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (215, 138, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (216, 138, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (217, 138, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (218, 139, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (219, 139, 'CCC', '2', 3, 0);
INSERT INTO `repair_test`
VALUES (220, 139, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (221, 139, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (222, 140, 'AAA', '1', 1, 0);
INSERT INTO `repair_test`
VALUES (223, 140, 'CCC', '0', 3, 0);
INSERT INTO `repair_test`
VALUES (224, 140, 'EEE', '2', 4, 0);
INSERT INTO `repair_test`
VALUES (225, 140, 'DDD', '1', 5, 0);
INSERT INTO `repair_test`
VALUES (226, 141, 'AAA', '1', 1, 0);
INSERT INTO `repair_test`
VALUES (227, 141, 'CCC', '0', 3, 0);
INSERT INTO `repair_test`
VALUES (228, 141, 'EEE', '2', 4, 0);
INSERT INTO `repair_test`
VALUES (229, 141, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (230, 142, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (231, 142, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (232, 142, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (233, 142, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (234, 143, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (235, 143, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (236, 143, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (237, 143, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (238, 144, 'AAA', '1', 1, 0);
INSERT INTO `repair_test`
VALUES (239, 144, 'CCC', '0', 3, 0);
INSERT INTO `repair_test`
VALUES (240, 144, 'EEE', '2', 4, 0);
INSERT INTO `repair_test`
VALUES (241, 144, 'DDD', '0', 5, 0);
INSERT INTO `repair_test`
VALUES (242, 145, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (243, 145, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (244, 145, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (245, 145, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (246, 146, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (247, 146, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (248, 146, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (249, 146, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (250, 147, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (251, 147, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (252, 147, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (253, 147, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (254, 148, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (255, 148, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (256, 148, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (257, 148, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (258, 149, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (259, 149, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (260, 149, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (261, 149, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (262, 150, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (263, 150, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (264, 150, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (265, 150, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (266, 151, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (267, 151, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (268, 151, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (269, 151, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (270, 152, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (271, 152, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (272, 152, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (273, 152, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (274, 153, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (275, 153, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (276, 153, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (277, 153, 'DDD', '2', 5, 0);
INSERT INTO `repair_test`
VALUES (278, 154, 'AAA', '0', 1, 0);
INSERT INTO `repair_test`
VALUES (279, 154, 'CCC', '1', 3, 0);
INSERT INTO `repair_test`
VALUES (280, 154, 'EEE', '0', 4, 0);
INSERT INTO `repair_test`
VALUES (281, 154, 'DDD', '2', 5, 0);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `config_id`    int(5)                                                        NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
    `create_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`  datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`  datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '参数配置表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config`
VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-11-18 14:34:32', '',
        NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config`
VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-11-18 14:34:32', '', NULL,
        '初始化密码 123456');
INSERT INTO `sys_config`
VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-11-18 14:34:32', 'admin',
        '2021-11-18 16:44:13', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config`
VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2021-11-18 14:34:32', '', NULL,
        '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config`
VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-11-18 14:34:32',
        '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint(20)                                                   NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id`   bigint(20)                                                   NULL DEFAULT 0 COMMENT '父部门id',
    `ancestors`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '祖级列表',
    `dept_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
    `order_num`   int(4)                                                       NULL DEFAULT 0 COMMENT '显示顺序',
    `leader`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime(0)                                                  NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime(0)                                                  NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 114
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '部门表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept`
VALUES (100, 0, '0', '轨道交通总公司', 0, 'GuoGeaa', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2021-11-18 14:34:32', 'admin', '2022-02-17 15:50:53');
INSERT INTO `sys_dept`
VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-11-18 14:34:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-11-18 14:34:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (103, 100, '0,100', '维修部门', 1, 'GuoGe', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-11-18 14:34:32',
        'admin', '2021-12-08 16:04:38');
INSERT INTO `sys_dept`
VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-11-18 14:34:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-11-18 14:34:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-11-18 14:34:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-11-18 14:34:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-11-18 14:34:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-11-18 14:34:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (110, 105, '0,100,101,105', 'AAA', 1, 'aaa', '13645678911', '1016241535@qq.com', '0', '2', 'admin',
        '2021-11-19 11:39:29', '', NULL);
INSERT INTO `sys_dept`
VALUES (111, 103, '0,100,103', '维修二组', 2, '李三天', '17805250021', NULL, '0', '0', 'admin', '2021-12-07 17:21:31',
        'admin', '2021-12-08 16:03:45');
INSERT INTO `sys_dept`
VALUES (112, 103, '0,100,103', '维修一组', 1, NULL, NULL, NULL, '0', '0', 'admin', '2021-12-08 16:03:36', 'admin',
        '2021-12-08 16:03:52');
INSERT INTO `sys_dept`
VALUES (113, 103, '0,100,103', '维修三组', 3, NULL, NULL, NULL, '0', '0', 'admin', '2021-12-08 16:04:05', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int(4)                                                        NULL DEFAULT 0 COMMENT '字典排序',
    `dict_label`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 42
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '字典数据表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '性别男');
INSERT INTO `sys_dict_data`
VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '性别女');
INSERT INTO `sys_dict_data`
VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '性别未知');
INSERT INTO `sys_dict_data`
VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '显示菜单');
INSERT INTO `sys_dict_data`
VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '隐藏菜单');
INSERT INTO `sys_dict_data`
VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '默认分组');
INSERT INTO `sys_dict_data`
VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '系统分组');
INSERT INTO `sys_dict_data`
VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '系统默认是');
INSERT INTO `sys_dict_data`
VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data`
VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '通知');
INSERT INTO `sys_dict_data`
VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '公告');
INSERT INTO `sys_dict_data`
VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '关闭状态');
INSERT INTO `sys_dict_data`
VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '新增操作');
INSERT INTO `sys_dict_data`
VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '修改操作');
INSERT INTO `sys_dict_data`
VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '删除操作');
INSERT INTO `sys_dict_data`
VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '授权操作');
INSERT INTO `sys_dict_data`
VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '导出操作');
INSERT INTO `sys_dict_data`
VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '导入操作');
INSERT INTO `sys_dict_data`
VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '强退操作');
INSERT INTO `sys_dict_data`
VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '生成操作');
INSERT INTO `sys_dict_data`
VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '清空操作');
INSERT INTO `sys_dict_data`
VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-11-18 14:34:32', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (29, 1, '路线', '0', 'repair_place_type', NULL, 'default', 'N', '0', 'admin', '2021-11-23 18:48:57', '', NULL,
        NULL);
INSERT INTO `sys_dict_data`
VALUES (30, 2, '车站', '1', 'repair_place_type', NULL, 'default', 'N', '0', 'admin', '2021-11-23 18:49:17', '', NULL,
        NULL);
INSERT INTO `sys_dict_data`
VALUES (31, 3, '道岔名称', '2', 'repair_place_type', NULL, 'default', 'N', '0', 'admin', '2021-11-23 18:49:37', '',
        NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (32, 1, '单机', '0', 'repair_action', NULL, 'default', 'N', '0', 'admin', '2021-11-23 20:24:17', 'admin',
        '2021-11-23 20:24:58', NULL);
INSERT INTO `sys_dict_data`
VALUES (33, 2, '双机', '1', 'repair_action', NULL, 'default', 'N', '0', 'admin', '2021-11-23 20:24:52', '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (34, 1, '正常', '0', 'repair_check_status', NULL, 'default', 'N', '0', 'admin', '2021-11-24 20:26:12', '', NULL,
        NULL);
INSERT INTO `sys_dict_data`
VALUES (35, 2, '调整', '1', 'repair_check_status', NULL, 'default', 'N', '0', 'admin', '2021-11-24 20:26:32', '', NULL,
        NULL);
INSERT INTO `sys_dict_data`
VALUES (36, 3, '更换', '2', 'repair_check_status', NULL, 'default', 'N', '0', 'admin', '2021-11-24 20:26:45', '', NULL,
        NULL);
INSERT INTO `sys_dict_data`
VALUES (37, 1, '前机', '0', 'repair_machine_type', '前机', 'default', 'N', '0', 'admin', '2021-11-29 19:48:00', 'admin',
        '2021-11-29 19:48:32', NULL);
INSERT INTO `sys_dict_data`
VALUES (38, 2, '后机', '1', 'repair_machine_type', NULL, 'default', 'N', '0', 'admin', '2021-11-29 19:48:13', '', NULL,
        NULL);
INSERT INTO `sys_dict_data`
VALUES (39, 1, '正常', '0', 'repair_file_status', NULL, 'default', 'N', '0', 'admin', '2021-12-03 18:56:26', '', NULL,
        NULL);
INSERT INTO `sys_dict_data`
VALUES (40, 2, '临界', '1', 'repair_file_status', 'icon', 'default', 'N', '0', 'admin', '2021-12-03 18:56:49', 'admin',
        '2021-12-07 00:33:33', NULL);
INSERT INTO `sys_dict_data`
VALUES (41, 3, '故障', '2', 'repair_file_status', NULL, 'default', 'N', '0', 'admin', '2021-12-07 00:33:54', '', NULL,
        NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_id`) USING BTREE,
    UNIQUE INDEX `dict_type` (`dict_type`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type`
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type`
VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type`
VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type`
VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type`
VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type`
VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type`
VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type`
VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type`
VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type`
VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type`
VALUES (11, '道岔等级', 'repair_eqt_level', '0', 'admin', '2021-11-22 15:02:55', '', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (12, '动作', 'repair_action', '0', 'admin', '2021-11-22 15:04:54', '', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (13, '锁闭方式', 'repair_lock', '0', 'admin', '2021-11-22 15:05:20', '', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (14, '类型', 'repair_place_type', '0', 'admin', '2021-11-23 18:47:51', '', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (15, '检修状态', 'repair_check_status', '0', 'admin', '2021-11-24 20:25:45', '', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (16, '前后机', 'repair_machine_type', '0', 'admin', '2021-11-29 19:47:14', 'admin', '2021-11-29 19:47:33', NULL);
INSERT INTO `sys_dict_type`
VALUES (17, '检修图片状态', 'repair_file_status', '0', 'admin', '2021-12-03 18:56:05', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`
(
    `job_id`          bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    `job_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL DEFAULT '' COMMENT '任务名称',
    `job_group`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
    `invoke_target`   varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
    `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT '' COMMENT 'cron执行表达式',
    `misfire_policy`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
    `concurrent`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL     DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
    `status`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL     DEFAULT '0' COMMENT '状态（0正常 1暂停）',
    `create_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT '' COMMENT '创建者',
    `create_time`     datetime(0)                                                   NULL     DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT '' COMMENT '更新者',
    `update_time`     datetime(0)                                                   NULL     DEFAULT NULL COMMENT '更新时间',
    `remark`          varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT '' COMMENT '备注信息',
    PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job`
VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin',
        '2021-11-18 14:34:32', '', '2022-03-03 19:44:33', '');
INSERT INTO `sys_job`
VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_job`
VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?',
        '3', '1', '1', 'admin', '2021-11-18 14:34:32', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`
(
    `job_log_id`     bigint(20)                                                     NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
    `job_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '任务名称',
    `job_group`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '任务组名',
    `invoke_target`  varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '调用目标字符串',
    `job_message`    varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '日志信息',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci       NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
    `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '异常信息',
    `create_time`    datetime(0)                                                    NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度日志表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`
(
    `info_id`        bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '访问ID',
    `user_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '用户账号',
    `ipaddr`         varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
    `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录地点',
    `browser`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '浏览器类型',
    `os`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '操作系统',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
    `msg`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '提示消息',
    `login_time`     datetime(0)                                                   NULL DEFAULT NULL COMMENT '访问时间',
    PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 483
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '系统访问记录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor`
VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 15:21:57');
INSERT INTO `sys_logininfor`
VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-18 17:04:21');
INSERT INTO `sys_logininfor`
VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 17:04:49');
INSERT INTO `sys_logininfor`
VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-18 17:11:45');
INSERT INTO `sys_logininfor`
VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 17:11:57');
INSERT INTO `sys_logininfor`
VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-18 17:20:23');
INSERT INTO `sys_logininfor`
VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 17:20:31');
INSERT INTO `sys_logininfor`
VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-18 17:22:24');
INSERT INTO `sys_logininfor`
VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-18 17:22:32');
INSERT INTO `sys_logininfor`
VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-18 17:22:41');
INSERT INTO `sys_logininfor`
VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-18 17:45:53');
INSERT INTO `sys_logininfor`
VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-18 17:46:13');
INSERT INTO `sys_logininfor`
VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2021-11-18 17:48:08');
INSERT INTO `sys_logininfor`
VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 17:48:15');
INSERT INTO `sys_logininfor`
VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 18:34:02');
INSERT INTO `sys_logininfor`
VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-18 18:35:10');
INSERT INTO `sys_logininfor`
VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-18 18:36:02');
INSERT INTO `sys_logininfor`
VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-18 18:37:31');
INSERT INTO `sys_logininfor`
VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-18 18:37:39');
INSERT INTO `sys_logininfor`
VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 18:37:47');
INSERT INTO `sys_logininfor`
VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-18 18:42:26');
INSERT INTO `sys_logininfor`
VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-18 18:43:50');
INSERT INTO `sys_logininfor`
VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-18 21:27:06');
INSERT INTO `sys_logininfor`
VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 21:27:33');
INSERT INTO `sys_logininfor`
VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-18 21:31:32');
INSERT INTO `sys_logininfor`
VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2021-11-18 21:32:03');
INSERT INTO `sys_logininfor`
VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-18 21:32:31');
INSERT INTO `sys_logininfor`
VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 21:32:40');
INSERT INTO `sys_logininfor`
VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2021-11-18 21:33:11');
INSERT INTO `sys_logininfor`
VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-18 21:48:01');
INSERT INTO `sys_logininfor`
VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 21:48:10');
INSERT INTO `sys_logininfor`
VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-18 21:48:33');
INSERT INTO `sys_logininfor`
VALUES (132, 'wz+', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-18 21:50:38');
INSERT INTO `sys_logininfor`
VALUES (133, 'wzg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 21:51:00');
INSERT INTO `sys_logininfor`
VALUES (134, 'wzg', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2021-11-18 21:51:48');
INSERT INTO `sys_logininfor`
VALUES (135, 'wzg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-18 21:54:35');
INSERT INTO `sys_logininfor`
VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 21:54:42');
INSERT INTO `sys_logininfor`
VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-18 22:26:19');
INSERT INTO `sys_logininfor`
VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 22:26:29');
INSERT INTO `sys_logininfor`
VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-18 22:54:47');
INSERT INTO `sys_logininfor`
VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 22:55:05');
INSERT INTO `sys_logininfor`
VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-18 23:02:48');
INSERT INTO `sys_logininfor`
VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 09:54:02');
INSERT INTO `sys_logininfor`
VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-19 10:16:59');
INSERT INTO `sys_logininfor`
VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 10:17:05');
INSERT INTO `sys_logininfor`
VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 10:32:30');
INSERT INTO `sys_logininfor`
VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-19 10:37:09');
INSERT INTO `sys_logininfor`
VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-19 10:37:17');
INSERT INTO `sys_logininfor`
VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 10:37:23');
INSERT INTO `sys_logininfor`
VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 10:37:54');
INSERT INTO `sys_logininfor`
VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 14:42:05');
INSERT INTO `sys_logininfor`
VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 15:04:33');
INSERT INTO `sys_logininfor`
VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-19 15:29:05');
INSERT INTO `sys_logininfor`
VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 15:29:10');
INSERT INTO `sys_logininfor`
VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 15:40:14');
INSERT INTO `sys_logininfor`
VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 15:53:24');
INSERT INTO `sys_logininfor`
VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 15:54:30');
INSERT INTO `sys_logininfor`
VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 16:43:56');
INSERT INTO `sys_logininfor`
VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 16:46:04');
INSERT INTO `sys_logininfor`
VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-19 17:51:28');
INSERT INTO `sys_logininfor`
VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-20 15:44:10');
INSERT INTO `sys_logininfor`
VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-20 17:10:41');
INSERT INTO `sys_logininfor`
VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-20 17:17:17');
INSERT INTO `sys_logininfor`
VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-20 17:17:25');
INSERT INTO `sys_logininfor`
VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 11:38:45');
INSERT INTO `sys_logininfor`
VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 12:14:38');
INSERT INTO `sys_logininfor`
VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 13:15:06');
INSERT INTO `sys_logininfor`
VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 13:18:36');
INSERT INTO `sys_logininfor`
VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 13:53:44');
INSERT INTO `sys_logininfor`
VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 14:19:41');
INSERT INTO `sys_logininfor`
VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 14:21:34');
INSERT INTO `sys_logininfor`
VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-22 14:23:52');
INSERT INTO `sys_logininfor`
VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 14:23:56');
INSERT INTO `sys_logininfor`
VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 16:00:16');
INSERT INTO `sys_logininfor`
VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 16:48:02');
INSERT INTO `sys_logininfor`
VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-22 18:56:28');
INSERT INTO `sys_logininfor`
VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 18:56:34');
INSERT INTO `sys_logininfor`
VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-22 19:48:20');
INSERT INTO `sys_logininfor`
VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-22 19:48:23');
INSERT INTO `sys_logininfor`
VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 19:48:26');
INSERT INTO `sys_logininfor`
VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 22:39:21');
INSERT INTO `sys_logininfor`
VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-22 22:58:19');
INSERT INTO `sys_logininfor`
VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 22:58:23');
INSERT INTO `sys_logininfor`
VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-22 23:03:52');
INSERT INTO `sys_logininfor`
VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-22 23:17:28');
INSERT INTO `sys_logininfor`
VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2021-11-23 09:40:58');
INSERT INTO `sys_logininfor`
VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 09:41:01');
INSERT INTO `sys_logininfor`
VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2021-11-23 09:41:01');
INSERT INTO `sys_logininfor`
VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 10:16:09');
INSERT INTO `sys_logininfor`
VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 12:01:52');
INSERT INTO `sys_logininfor`
VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 12:31:23');
INSERT INTO `sys_logininfor`
VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 13:16:35');
INSERT INTO `sys_logininfor`
VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 15:01:22');
INSERT INTO `sys_logininfor`
VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 18:44:32');
INSERT INTO `sys_logininfor`
VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-23 18:49:53');
INSERT INTO `sys_logininfor`
VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 18:49:57');
INSERT INTO `sys_logininfor`
VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 18:54:02');
INSERT INTO `sys_logininfor`
VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 19:20:44');
INSERT INTO `sys_logininfor`
VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 19:48:16');
INSERT INTO `sys_logininfor`
VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-23 20:20:45');
INSERT INTO `sys_logininfor`
VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-23 20:20:46');
INSERT INTO `sys_logininfor`
VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-23 20:20:53');
INSERT INTO `sys_logininfor`
VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-23 20:20:56');
INSERT INTO `sys_logininfor`
VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 20:21:00');
INSERT INTO `sys_logininfor`
VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-23 20:21:07');
INSERT INTO `sys_logininfor`
VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-23 20:42:04');
INSERT INTO `sys_logininfor`
VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 09:19:42');
INSERT INTO `sys_logininfor`
VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 09:34:06');
INSERT INTO `sys_logininfor`
VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 10:19:05');
INSERT INTO `sys_logininfor`
VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 11:21:18');
INSERT INTO `sys_logininfor`
VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-24 12:17:26');
INSERT INTO `sys_logininfor`
VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 12:17:29');
INSERT INTO `sys_logininfor`
VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 13:17:56');
INSERT INTO `sys_logininfor`
VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 16:36:42');
INSERT INTO `sys_logininfor`
VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-24 18:52:52');
INSERT INTO `sys_logininfor`
VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 18:52:56');
INSERT INTO `sys_logininfor`
VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-24 19:40:09');
INSERT INTO `sys_logininfor`
VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 19:40:14');
INSERT INTO `sys_logininfor`
VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 20:23:54');
INSERT INTO `sys_logininfor`
VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 20:26:58');
INSERT INTO `sys_logininfor`
VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 20:54:37');
INSERT INTO `sys_logininfor`
VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-24 22:39:05');
INSERT INTO `sys_logininfor`
VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 22:39:12');
INSERT INTO `sys_logininfor`
VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-24 23:16:02');
INSERT INTO `sys_logininfor`
VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-25 09:36:42');
INSERT INTO `sys_logininfor`
VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-25 11:23:32');
INSERT INTO `sys_logininfor`
VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-25 13:21:08');
INSERT INTO `sys_logininfor`
VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-25 15:35:04');
INSERT INTO `sys_logininfor`
VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-25 17:26:04');
INSERT INTO `sys_logininfor`
VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-25 18:07:07');
INSERT INTO `sys_logininfor`
VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-25 18:12:26');
INSERT INTO `sys_logininfor`
VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-25 18:58:00');
INSERT INTO `sys_logininfor`
VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-25 19:46:30');
INSERT INTO `sys_logininfor`
VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-25 23:12:40');
INSERT INTO `sys_logininfor`
VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-26 09:49:14');
INSERT INTO `sys_logininfor`
VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-26 14:07:43');
INSERT INTO `sys_logininfor`
VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-26 14:07:47');
INSERT INTO `sys_logininfor`
VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-26 14:50:19');
INSERT INTO `sys_logininfor`
VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-26 14:50:19');
INSERT INTO `sys_logininfor`
VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-26 14:50:31');
INSERT INTO `sys_logininfor`
VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-26 14:50:37');
INSERT INTO `sys_logininfor`
VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-26 15:31:14');
INSERT INTO `sys_logininfor`
VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-26 16:27:55');
INSERT INTO `sys_logininfor`
VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-26 17:34:49');
INSERT INTO `sys_logininfor`
VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-27 08:02:26');
INSERT INTO `sys_logininfor`
VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-27 08:56:26');
INSERT INTO `sys_logininfor`
VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-27 09:58:02');
INSERT INTO `sys_logininfor`
VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-27 10:00:21');
INSERT INTO `sys_logininfor`
VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-11-27 10:00:33');
INSERT INTO `sys_logininfor`
VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2021-11-27 16:04:06');
INSERT INTO `sys_logininfor`
VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-27 16:04:10');
INSERT INTO `sys_logininfor`
VALUES (251, 'wzg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-27 16:27:13');
INSERT INTO `sys_logininfor`
VALUES (252, 'wzg', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2021-11-27 16:29:28');
INSERT INTO `sys_logininfor`
VALUES (253, 'wzg', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2021-11-27 16:29:35');
INSERT INTO `sys_logininfor`
VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-27 19:35:37');
INSERT INTO `sys_logininfor`
VALUES (255, 'wzg', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2021-11-27 19:37:53');
INSERT INTO `sys_logininfor`
VALUES (256, 'wzg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-27 20:14:57');
INSERT INTO `sys_logininfor`
VALUES (257, 'wzg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-27 20:15:06');
INSERT INTO `sys_logininfor`
VALUES (258, 'wzg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-27 20:15:14');
INSERT INTO `sys_logininfor`
VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-27 20:16:04');
INSERT INTO `sys_logininfor`
VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-27 20:16:08');
INSERT INTO `sys_logininfor`
VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-27 20:16:14');
INSERT INTO `sys_logininfor`
VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-27 20:16:30');
INSERT INTO `sys_logininfor`
VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-27 20:16:34');
INSERT INTO `sys_logininfor`
VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-27 20:16:42');
INSERT INTO `sys_logininfor`
VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2021-11-27 21:07:31');
INSERT INTO `sys_logininfor`
VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-27 21:07:35');
INSERT INTO `sys_logininfor`
VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-27 22:40:38');
INSERT INTO `sys_logininfor`
VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2021-11-28 12:13:03');
INSERT INTO `sys_logininfor`
VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:13:07');
INSERT INTO `sys_logininfor`
VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:13:17');
INSERT INTO `sys_logininfor`
VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:13:23');
INSERT INTO `sys_logininfor`
VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:14:09');
INSERT INTO `sys_logininfor`
VALUES (273, 'wzg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:16:10');
INSERT INTO `sys_logininfor`
VALUES (274, 'wzg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:16:25');
INSERT INTO `sys_logininfor`
VALUES (275, 'wzg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 12:16:37');
INSERT INTO `sys_logininfor`
VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:17:12');
INSERT INTO `sys_logininfor`
VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:17:23');
INSERT INTO `sys_logininfor`
VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:17:32');
INSERT INTO `sys_logininfor`
VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-28 12:17:39');
INSERT INTO `sys_logininfor`
VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:17:44');
INSERT INTO `sys_logininfor`
VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:17:50');
INSERT INTO `sys_logininfor`
VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:17:59');
INSERT INTO `sys_logininfor`
VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2021-11-28 12:20:07');
INSERT INTO `sys_logininfor`
VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:20:17');
INSERT INTO `sys_logininfor`
VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-28 12:21:22');
INSERT INTO `sys_logininfor`
VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-28 12:21:26');
INSERT INTO `sys_logininfor`
VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:21:32');
INSERT INTO `sys_logininfor`
VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:21:43');
INSERT INTO `sys_logininfor`
VALUES (289, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:22:05');
INSERT INTO `sys_logininfor`
VALUES (290, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:22:15');
INSERT INTO `sys_logininfor`
VALUES (291, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-28 12:22:21');
INSERT INTO `sys_logininfor`
VALUES (292, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-11-28 12:22:29');
INSERT INTO `sys_logininfor`
VALUES (293, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-28 12:22:40');
INSERT INTO `sys_logininfor`
VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 12:23:07');
INSERT INTO `sys_logininfor`
VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 12:25:26');
INSERT INTO `sys_logininfor`
VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 12:25:51');
INSERT INTO `sys_logininfor`
VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 12:27:47');
INSERT INTO `sys_logininfor`
VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 12:52:20');
INSERT INTO `sys_logininfor`
VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 12:54:28');
INSERT INTO `sys_logininfor`
VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 12:59:11');
INSERT INTO `sys_logininfor`
VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-28 13:12:48');
INSERT INTO `sys_logininfor`
VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 13:12:52');
INSERT INTO `sys_logininfor`
VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2021-11-28 13:18:10');
INSERT INTO `sys_logininfor`
VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 13:18:13');
INSERT INTO `sys_logininfor`
VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 13:23:33');
INSERT INTO `sys_logininfor`
VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2021-11-28 13:23:44');
INSERT INTO `sys_logininfor`
VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 13:23:49');
INSERT INTO `sys_logininfor`
VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-28 13:25:00');
INSERT INTO `sys_logininfor`
VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 13:25:05');
INSERT INTO `sys_logininfor`
VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 13:44:13');
INSERT INTO `sys_logininfor`
VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-28 13:44:27');
INSERT INTO `sys_logininfor`
VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 13:44:31');
INSERT INTO `sys_logininfor`
VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 13:52:24');
INSERT INTO `sys_logininfor`
VALUES (314, 'admin', '192.168.31.45', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:01:06');
INSERT INTO `sys_logininfor`
VALUES (315, 'admin', '192.168.31.45', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-28 14:01:12');
INSERT INTO `sys_logininfor`
VALUES (316, 'admin', '192.168.31.45', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2021-11-28 14:08:39');
INSERT INTO `sys_logininfor`
VALUES (317, 'admin', '192.168.31.45', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:08:44');
INSERT INTO `sys_logininfor`
VALUES (318, 'admin', '192.168.31.45', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-28 14:08:50');
INSERT INTO `sys_logininfor`
VALUES (319, 'admin', '192.168.31.45', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:10:40');
INSERT INTO `sys_logininfor`
VALUES (320, 'admin', '192.168.31.45', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:11:07');
INSERT INTO `sys_logininfor`
VALUES (321, 'admin', '192.168.31.45', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:11:31');
INSERT INTO `sys_logininfor`
VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:13:23');
INSERT INTO `sys_logininfor`
VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-28 14:13:31');
INSERT INTO `sys_logininfor`
VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-28 14:13:40');
INSERT INTO `sys_logininfor`
VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:13:44');
INSERT INTO `sys_logininfor`
VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-28 14:13:50');
INSERT INTO `sys_logininfor`
VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:14:34');
INSERT INTO `sys_logininfor`
VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:15:45');
INSERT INTO `sys_logininfor`
VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-28 14:15:51');
INSERT INTO `sys_logininfor`
VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:17:15');
INSERT INTO `sys_logininfor`
VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-28 14:17:20');
INSERT INTO `sys_logininfor`
VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-28 14:17:37');
INSERT INTO `sys_logininfor`
VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:17:43');
INSERT INTO `sys_logininfor`
VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-28 14:17:51');
INSERT INTO `sys_logininfor`
VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:18:15');
INSERT INTO `sys_logininfor`
VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '退出成功', '2021-11-28 14:18:40');
INSERT INTO `sys_logininfor`
VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:24:17');
INSERT INTO `sys_logininfor`
VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:28:07');
INSERT INTO `sys_logininfor`
VALUES (339, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-28 14:28:12');
INSERT INTO `sys_logininfor`
VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:51:09');
INSERT INTO `sys_logininfor`
VALUES (341, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-28 14:51:17');
INSERT INTO `sys_logininfor`
VALUES (342, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 14:51:22');
INSERT INTO `sys_logininfor`
VALUES (343, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '退出成功', '2021-11-28 14:56:09');
INSERT INTO `sys_logininfor`
VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 15:13:29');
INSERT INTO `sys_logininfor`
VALUES (345, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-28 15:50:38');
INSERT INTO `sys_logininfor`
VALUES (346, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-28 15:50:43');
INSERT INTO `sys_logininfor`
VALUES (347, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 15:50:48');
INSERT INTO `sys_logininfor`
VALUES (348, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-28 15:56:15');
INSERT INTO `sys_logininfor`
VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 15:56:22');
INSERT INTO `sys_logininfor`
VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 23:02:58');
INSERT INTO `sys_logininfor`
VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-28 23:05:39');
INSERT INTO `sys_logininfor`
VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-29 11:19:38');
INSERT INTO `sys_logininfor`
VALUES (353, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-29 11:21:47');
INSERT INTO `sys_logininfor`
VALUES (354, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-29 11:21:51');
INSERT INTO `sys_logininfor`
VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-29 13:26:40');
INSERT INTO `sys_logininfor`
VALUES (356, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-29 15:10:44');
INSERT INTO `sys_logininfor`
VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-29 19:11:47');
INSERT INTO `sys_logininfor`
VALUES (358, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-29 21:21:16');
INSERT INTO `sys_logininfor`
VALUES (359, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-11-29 21:21:18');
INSERT INTO `sys_logininfor`
VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-29 21:21:23');
INSERT INTO `sys_logininfor`
VALUES (361, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-29 21:39:44');
INSERT INTO `sys_logininfor`
VALUES (362, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-30 11:21:28');
INSERT INTO `sys_logininfor`
VALUES (363, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-30 11:28:54');
INSERT INTO `sys_logininfor`
VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-30 11:29:02');
INSERT INTO `sys_logininfor`
VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-30 13:05:32');
INSERT INTO `sys_logininfor`
VALUES (366, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-30 13:09:22');
INSERT INTO `sys_logininfor`
VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-30 13:52:08');
INSERT INTO `sys_logininfor`
VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-30 16:20:46');
INSERT INTO `sys_logininfor`
VALUES (369, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-30 18:32:24');
INSERT INTO `sys_logininfor`
VALUES (370, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-11-30 19:12:14');
INSERT INTO `sys_logininfor`
VALUES (371, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-11-30 19:12:20');
INSERT INTO `sys_logininfor`
VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2021-12-01 09:55:32');
INSERT INTO `sys_logininfor`
VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-12-01 09:56:19');
INSERT INTO `sys_logininfor`
VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-01 09:56:22');
INSERT INTO `sys_logininfor`
VALUES (375, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-01 14:07:48');
INSERT INTO `sys_logininfor`
VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-12-01 15:03:01');
INSERT INTO `sys_logininfor`
VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-12-01 15:03:06');
INSERT INTO `sys_logininfor`
VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-12-01 15:03:13');
INSERT INTO `sys_logininfor`
VALUES (379, 'wzg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-12-01 15:03:21');
INSERT INTO `sys_logininfor`
VALUES (380, 'wzg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-12-01 15:03:26');
INSERT INTO `sys_logininfor`
VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-12-01 15:03:38');
INSERT INTO `sys_logininfor`
VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-12-01 15:03:40');
INSERT INTO `sys_logininfor`
VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-12-01 15:03:41');
INSERT INTO `sys_logininfor`
VALUES (384, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2021-12-01 15:03:51');
INSERT INTO `sys_logininfor`
VALUES (385, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-12-01 15:03:57');
INSERT INTO `sys_logininfor`
VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-01 15:04:13');
INSERT INTO `sys_logininfor`
VALUES (387, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-03 14:10:07');
INSERT INTO `sys_logininfor`
VALUES (388, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-03 14:27:26');
INSERT INTO `sys_logininfor`
VALUES (389, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-03 16:31:14');
INSERT INTO `sys_logininfor`
VALUES (390, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-03 18:21:31');
INSERT INTO `sys_logininfor`
VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-12-03 18:47:00');
INSERT INTO `sys_logininfor`
VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-03 18:47:02');
INSERT INTO `sys_logininfor`
VALUES (393, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-03 19:00:50');
INSERT INTO `sys_logininfor`
VALUES (394, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-03 20:53:10');
INSERT INTO `sys_logininfor`
VALUES (395, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 13:48:07');
INSERT INTO `sys_logininfor`
VALUES (396, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-05 13:48:20');
INSERT INTO `sys_logininfor`
VALUES (397, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 13:48:28');
INSERT INTO `sys_logininfor`
VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 14:27:52');
INSERT INTO `sys_logininfor`
VALUES (399, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-05 14:57:28');
INSERT INTO `sys_logininfor`
VALUES (400, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-12-05 14:57:40');
INSERT INTO `sys_logininfor`
VALUES (401, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 14:57:49');
INSERT INTO `sys_logininfor`
VALUES (402, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-12-05 17:17:39');
INSERT INTO `sys_logininfor`
VALUES (403, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 17:17:42');
INSERT INTO `sys_logininfor`
VALUES (404, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 17:31:57');
INSERT INTO `sys_logininfor`
VALUES (405, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 18:40:19');
INSERT INTO `sys_logininfor`
VALUES (406, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 19:41:27');
INSERT INTO `sys_logininfor`
VALUES (407, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 21:04:27');
INSERT INTO `sys_logininfor`
VALUES (408, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-05 21:16:34');
INSERT INTO `sys_logininfor`
VALUES (409, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 21:16:40');
INSERT INTO `sys_logininfor`
VALUES (410, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-05 21:21:25');
INSERT INTO `sys_logininfor`
VALUES (411, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-12-05 21:54:33');
INSERT INTO `sys_logininfor`
VALUES (412, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 21:54:38');
INSERT INTO `sys_logininfor`
VALUES (413, 'admin', '192.168.31.145', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 23:21:33');
INSERT INTO `sys_logininfor`
VALUES (414, 'admin', '192.168.31.145', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-05 23:28:48');
INSERT INTO `sys_logininfor`
VALUES (415, 'admin', '192.168.31.145', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 23:28:54');
INSERT INTO `sys_logininfor`
VALUES (416, 'admin', '192.168.31.145', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 23:29:26');
INSERT INTO `sys_logininfor`
VALUES (417, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 23:34:10');
INSERT INTO `sys_logininfor`
VALUES (418, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-05 23:37:08');
INSERT INTO `sys_logininfor`
VALUES (419, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 23:37:11');
INSERT INTO `sys_logininfor`
VALUES (420, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-05 23:37:28');
INSERT INTO `sys_logininfor`
VALUES (421, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 23:37:33');
INSERT INTO `sys_logininfor`
VALUES (422, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-05 23:44:31');
INSERT INTO `sys_logininfor`
VALUES (423, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-05 23:44:34');
INSERT INTO `sys_logininfor`
VALUES (424, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-06 13:21:29');
INSERT INTO `sys_logininfor`
VALUES (425, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-06 16:38:18');
INSERT INTO `sys_logininfor`
VALUES (426, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-06 17:11:35');
INSERT INTO `sys_logininfor`
VALUES (427, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-06 17:44:01');
INSERT INTO `sys_logininfor`
VALUES (428, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-06 20:08:25');
INSERT INTO `sys_logininfor`
VALUES (429, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-06 20:13:52');
INSERT INTO `sys_logininfor`
VALUES (430, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-06 20:38:22');
INSERT INTO `sys_logininfor`
VALUES (431, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-06 23:12:34');
INSERT INTO `sys_logininfor`
VALUES (432, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-06 23:52:48');
INSERT INTO `sys_logininfor`
VALUES (433, 'admin', '192.168.31.145', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-06 23:53:01');
INSERT INTO `sys_logininfor`
VALUES (434, 'admin', '192.168.31.145', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-07 00:01:35');
INSERT INTO `sys_logininfor`
VALUES (435, 'admin', '192.168.31.145', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-07 00:01:39');
INSERT INTO `sys_logininfor`
VALUES (436, 'admin', '192.168.31.145', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-07 00:33:16');
INSERT INTO `sys_logininfor`
VALUES (437, 'admin', '192.168.31.145', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-07 00:44:02');
INSERT INTO `sys_logininfor`
VALUES (438, 'admin', '192.168.31.145', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-07 00:44:10');
INSERT INTO `sys_logininfor`
VALUES (439, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-07 09:38:46');
INSERT INTO `sys_logininfor`
VALUES (440, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-07 10:42:25');
INSERT INTO `sys_logininfor`
VALUES (441, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-07 10:42:30');
INSERT INTO `sys_logininfor`
VALUES (442, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-12-07 14:38:10');
INSERT INTO `sys_logininfor`
VALUES (443, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-07 14:38:13');
INSERT INTO `sys_logininfor`
VALUES (444, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-07 16:22:03');
INSERT INTO `sys_logininfor`
VALUES (445, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-07 17:16:25');
INSERT INTO `sys_logininfor`
VALUES (446, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2021-12-07 19:55:53');
INSERT INTO `sys_logininfor`
VALUES (447, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-07 19:58:02');
INSERT INTO `sys_logininfor`
VALUES (448, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-12-08 11:01:31');
INSERT INTO `sys_logininfor`
VALUES (449, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-08 11:01:33');
INSERT INTO `sys_logininfor`
VALUES (450, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-08 15:07:00');
INSERT INTO `sys_logininfor`
VALUES (451, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-08 15:37:47');
INSERT INTO `sys_logininfor`
VALUES (452, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-12-08 18:45:27');
INSERT INTO `sys_logininfor`
VALUES (453, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-01-01 17:49:09');
INSERT INTO `sys_logininfor`
VALUES (454, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-01-01 20:28:11');
INSERT INTO `sys_logininfor`
VALUES (455, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-01-01 21:05:29');
INSERT INTO `sys_logininfor`
VALUES (456, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-01-02 10:19:17');
INSERT INTO `sys_logininfor`
VALUES (457, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-01-02 13:12:52');
INSERT INTO `sys_logininfor`
VALUES (458, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-01-02 15:14:16');
INSERT INTO `sys_logininfor`
VALUES (459, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-01-02 15:58:10');
INSERT INTO `sys_logininfor`
VALUES (460, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-02-15 15:26:21');
INSERT INTO `sys_logininfor`
VALUES (461, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-02-16 16:06:56');
INSERT INTO `sys_logininfor`
VALUES (462, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-02-17 15:49:39');
INSERT INTO `sys_logininfor`
VALUES (463, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2022-03-01 14:49:22');
INSERT INTO `sys_logininfor`
VALUES (464, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-03-01 14:49:25');
INSERT INTO `sys_logininfor`
VALUES (465, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-03-01 14:54:48');
INSERT INTO `sys_logininfor`
VALUES (466, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-03-01 15:55:30');
INSERT INTO `sys_logininfor`
VALUES (467, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2022-03-01 16:56:40');
INSERT INTO `sys_logininfor`
VALUES (468, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-03-01 16:56:42');
INSERT INTO `sys_logininfor`
VALUES (469, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-03-03 19:16:03');
INSERT INTO `sys_logininfor`
VALUES (470, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-03-07 13:43:14');
INSERT INTO `sys_logininfor`
VALUES (471, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-03-09 11:22:41');
INSERT INTO `sys_logininfor`
VALUES (472, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-03-18 09:17:36');
INSERT INTO `sys_logininfor`
VALUES (473, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-05-13 09:46:05');
INSERT INTO `sys_logininfor`
VALUES (474, 'admin', '192.168.31.145', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-05-15 13:09:44');
INSERT INTO `sys_logininfor`
VALUES (475, 'admin', '172.17.1.69', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-05-24 15:35:41');
INSERT INTO `sys_logininfor`
VALUES (476, 'admin', '172.17.1.69', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-05-25 11:30:20');
INSERT INTO `sys_logininfor`
VALUES (477, 'admin', '172.17.1.69', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-05-25 19:34:55');
INSERT INTO `sys_logininfor`
VALUES (478, 'admin', '172.17.1.69', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-05-26 15:33:06');
INSERT INTO `sys_logininfor`
VALUES (479, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-05-31 15:54:11');
INSERT INTO `sys_logininfor`
VALUES (480, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-06-20 10:34:54');
INSERT INTO `sys_logininfor`
VALUES (481, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-06-30 23:33:41');
INSERT INTO `sys_logininfor`
VALUES (482, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-10-25 11:13:06');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '菜单名称',
    `parent_id`   bigint(20)                                                    NULL DEFAULT 0 COMMENT '父菜单ID',
    `order_num`   int(4)                                                        NULL DEFAULT 0 COMMENT '显示顺序',
    `path`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '路由地址',
    `component`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
    `query`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由参数',
    `is_frame`    int(1)                                                        NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
    `is_cache`    int(1)                                                        NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
    `menu_type`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
    `perms`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '#' COMMENT '菜单图标',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1105
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-11-18 14:34:32',
        'admin', '2021-11-18 21:59:51', '系统管理目录');
INSERT INTO `sys_menu`
VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-11-18 14:34:32',
        'admin', '2021-11-18 23:03:27', '系统监控目录');
INSERT INTO `sys_menu`
VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-11-18 14:34:32', 'admin',
        '2021-11-18 23:03:38', '系统工具目录');
INSERT INTO `sys_menu`
VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user',
        'admin', '2021-11-18 14:34:32', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu`
VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples',
        'admin', '2021-11-18 14:34:32', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu`
VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table',
        'admin', '2021-11-18 14:34:32', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu`
VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree',
        'admin', '2021-11-18 14:34:32', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu`
VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post',
        'admin', '2021-11-18 14:34:32', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu`
VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict',
        'admin', '2021-11-18 14:34:32', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu`
VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit',
        'admin', '2021-11-18 14:34:32', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu`
VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list',
        'message', 'admin', '2021-11-18 14:34:32', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu`
VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-11-18 14:34:32', '', NULL,
        '日志管理菜单');
INSERT INTO `sys_menu`
VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list',
        'online', 'admin', '2021-11-18 14:34:32', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu`
VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin',
        '2021-11-18 14:34:32', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu`
VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid',
        'admin', '2021-11-18 14:34:32', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu`
VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list',
        'server', 'admin', '2021-11-18 14:34:32', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu`
VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis',
        'admin', '2021-11-18 14:34:32', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu`
VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build',
        'admin', '2021-11-18 14:34:32', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu`
VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin',
        '2021-11-18 14:34:32', 'admin', '2021-12-03 14:27:15', '代码生成菜单');
INSERT INTO `sys_menu`
VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger',
        'admin', '2021-11-18 14:34:32', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu`
VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list',
        'form', 'admin', '2021-11-18 14:34:32', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu`
VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0',
        'monitor:logininfor:list', 'logininfor', 'admin', '2021-11-18 14:34:32', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu`
VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin',
        '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1061, '固件检测', 0, 2, 'repair', NULL, NULL, 1, 0, 'M', '0', '0', '', 'bug', 'admin', '2021-11-18 22:57:20',
        'admin', '2021-11-18 22:58:15', '');
INSERT INTO `sys_menu`
VALUES (1062, '测试记录内容', 1061, 1, 'table', 'repair/table/index', NULL, 1, 0, 'C', '0', '0', 'repair:table:list',
        'table', 'admin', '2021-11-18 23:01:41', 'admin', '2021-11-29 11:20:10', '');
INSERT INTO `sys_menu`
VALUES (1065, '检测查询', 1062, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:table:query', '#', 'admin',
        '2021-11-18 23:09:31', 'admin', '2021-11-18 23:10:07', '');
INSERT INTO `sys_menu`
VALUES (1066, '检测新增', 1062, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:table:add', '#', 'admin',
        '2021-11-18 23:09:31', 'admin', '2021-11-18 23:10:18', '');
INSERT INTO `sys_menu`
VALUES (1067, '检测修改', 1062, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:table:edit', '#', 'admin',
        '2021-11-18 23:09:31', 'admin', '2021-11-18 23:10:28', '');
INSERT INTO `sys_menu`
VALUES (1068, '检测删除', 1062, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:table:remove', '#', 'admin',
        '2021-11-18 23:09:31', 'admin', '2021-11-18 23:10:35', '');
INSERT INTO `sys_menu`
VALUES (1069, '检测导出', 1062, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:table:export', '#', 'admin',
        '2021-11-18 23:09:31', 'admin', '2021-11-18 23:10:41', '');
INSERT INTO `sys_menu`
VALUES (1070, '道岔信息', 1061, 1, 'info', 'repair/info/index', NULL, 1, 0, 'C', '0', '0', 'repair:info:list', 'form',
        'admin', '2021-11-19 14:56:15', 'admin', '2021-11-19 14:57:38', '道岔信息菜单');
INSERT INTO `sys_menu`
VALUES (1071, '道岔信息查询', 1070, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:info:query', '#', 'admin',
        '2021-11-19 14:56:15', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1072, '道岔信息新增', 1070, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:info:add', '#', 'admin',
        '2021-11-19 14:56:15', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1073, '道岔信息修改', 1070, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:info:edit', '#', 'admin',
        '2021-11-19 14:56:15', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1074, '道岔信息删除', 1070, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:info:remove', '#', 'admin',
        '2021-11-19 14:56:15', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1075, '道岔信息导出', 1070, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:info:export', '#', 'admin',
        '2021-11-19 14:56:15', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1076, '道岔列表', 1061, 3, 'place', 'repair/place/index', NULL, 1, 0, 'C', '0', '0', 'repair:place:list',
        'list', 'admin', '2021-11-22 13:18:11', 'admin', '2021-11-22 14:21:23', '');
INSERT INTO `sys_menu`
VALUES (1077, '道岔列表查询', 1076, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'repair:place:list', '#', 'admin',
        '2021-11-22 13:44:37', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1078, '道岔信息导入', 1070, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'repair:info:import', '#', 'admin',
        '2021-11-23 12:27:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1092, '检修记录', 1061, 4, 'record', 'repair/record/index', NULL, 1, 0, 'C', '0', '0', 'repair:record:list',
        'edit', 'admin', '2021-11-23 20:46:08', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1093, '检修记录查询', 1092, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:record:query', '#', 'admin',
        '2021-11-23 20:46:30', 'admin', '2021-11-23 20:46:57', '');
INSERT INTO `sys_menu`
VALUES (1094, '检修记录新增', 1092, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:record:add', '#', 'admin',
        '2021-11-23 20:46:30', 'admin', '2021-11-23 20:47:05', '');
INSERT INTO `sys_menu`
VALUES (1095, '检修记录修改', 1092, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:record:edit', '#', 'admin',
        '2021-11-23 20:46:30', 'admin', '2021-11-23 20:47:13', '');
INSERT INTO `sys_menu`
VALUES (1096, '检修记录删除', 1092, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:record:remove', '#', 'admin',
        '2021-11-23 20:46:30', 'admin', '2021-11-23 20:47:19', '');
INSERT INTO `sys_menu`
VALUES (1097, '检修记录导出', 1092, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'repair:record:export', '#', 'admin',
        '2021-11-23 20:46:30', 'admin', '2021-11-23 20:47:25', '');
INSERT INTO `sys_menu`
VALUES (1099, '测试内容列表', 1092, 11, '', NULL, NULL, 1, 0, 'F', '0', '0', 'repair:test:list', '#', 'admin',
        '2021-11-24 20:51:21', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1100, '测试内容新增', 1092, 12, '', NULL, NULL, 1, 0, 'F', '0', '0', 'repair:test:add', '#', 'admin',
        '2021-11-24 20:52:35', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1101, '测试内容编辑', 1092, 13, '', NULL, NULL, 1, 0, 'F', '0', '0', 'repair:test:edit', '#', 'admin',
        '2021-11-24 20:53:21', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1102, '测试内容查询', 1092, 14, '', NULL, NULL, 1, 0, 'F', '0', '0', 'repair:test:query', '#', 'admin',
        '2021-11-24 20:53:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1103, '测试内容删除', 1092, 15, '', NULL, NULL, 1, 0, 'F', '0', '0', 'repair:test:remove', '#', 'admin',
        '2021-11-24 20:54:15', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1104, '文件上传', 3, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'file:upload:list', '#', 'admin',
        '2021-11-25 18:10:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`
(
    `notice_id`      int(4)                                                        NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `notice_title`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '公告标题',
    `notice_type`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NOT NULL COMMENT '公告类型（1通知 2公告）',
    `notice_content` longblob                                                      NULL COMMENT '公告内容',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '通知公告表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice`
VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin',
        '2021-11-18 14:34:32', '', NULL, '管理员');
INSERT INTO `sys_notice`
VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-11-18 14:34:32',
        '', NULL, '管理员');
INSERT INTO `sys_notice`
VALUES (3, '全体成员扩大会议', '1',
        0x3C703EE59198E5B7A5E4BC9AE8AEAEEFBC9AE585A8E4BD93E68890E59198E7ACACE4B880E6ACA1E689A9E5A4A7E4BC9AE8AEAE3C2F703E,
        '0', 'admin', '2021-12-07 09:50:32', 'admin', '2021-12-07 09:50:54', NULL);
INSERT INTO `sys_notice`
VALUES (4, '欢庆新春', '1', 0x3C703EE5AE89E59089E7A791E68A80E4BB8AE5B9B4E696B0E698A5E4B88DE8BF87E4BA863C2F703E, '0',
        'admin', '2021-12-08 16:51:32', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`
(
    `oper_id`        bigint(20)                                                     NOT NULL AUTO_INCREMENT COMMENT '日志主键',
    `title`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT '' COMMENT '模块标题',
    `business_type`  int(2)                                                         NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
    `method`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '方法名称',
    `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT '' COMMENT '请求方式',
    `operator_type`  int(1)                                                         NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
    `oper_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT '' COMMENT '操作人员',
    `dept_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT '' COMMENT '部门名称',
    `oper_url`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '请求URL',
    `oper_ip`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '主机地址',
    `oper_location`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '操作地点',
    `oper_param`     varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求参数',
    `json_result`    varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '返回参数',
    `status`         int(1)                                                         NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
    `error_msg`      varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '错误消息',
    `oper_time`      datetime(0)                                                    NULL DEFAULT NULL COMMENT '操作时间',
    PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 731
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志记录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log`
VALUES (100, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL,
        '/system/user/importData', '127.0.0.1', '内网IP', 'false', NULL, 1,
        '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 wzg 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,       email,             phonenumber,       sex,       password,             create_by,            create_time    )values(      ?,             ?,       ?,       ?,             ?,       ?,       ?,             ?,            sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n; Duplicate entry \'1\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'',
        '2021-11-18 15:27:55');
INSERT INTO `sys_oper_log`
VALUES (101, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"deptId\":101,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2021-11-18 15:28:01');
INSERT INTO `sys_oper_log`
VALUES (102, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL,
        '/system/user/importData', '127.0.0.1', '内网IP', 'false', NULL, 1,
        '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 wzg 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(      ?,             ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n; Duplicate entry \'1\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'',
        '2021-11-18 15:28:45');
INSERT INTO `sys_oper_log`
VALUES (103, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL,
        '/system/user/importData', '127.0.0.1', '内网IP', 'false', NULL, 1,
        '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 wzg 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(      ?,             ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n; Duplicate entry \'1\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'',
        '2021-11-18 15:29:25');
INSERT INTO `sys_oper_log`
VALUES (104, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL,
        '/system/user/importData', '127.0.0.1', '内网IP', 'false',
        '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 wzg 导入成功\",\"code\":200}', 0, NULL,
        '2021-11-18 15:29:51');
INSERT INTO `sys_oper_log`
VALUES (105, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"roles\":[],\"phonenumber\":\"17805250021\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"1016241535@qq.com\",\"nickName\":\"吴正国\",\"sex\":\"0\",\"deptId\":104,\"avatar\":\"\",\"params\":{},\"userName\":\"wzg\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1637220591000,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 15:30:17');
INSERT INTO `sys_oper_log`
VALUES (106, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"phonenumber\":\"17805250021\",\"admin\":false,\"password\":\"123456\",\"postIds\":[1],\"email\":\"1016241535@qq.com\",\"nickName\":\"小三\",\"sex\":\"0\",\"deptId\":103,\"params\":{},\"userName\":\"吴正国\",\"roleIds\":[2],\"status\":\"0\"}',
        '{\"msg\":\"新增用户\'吴正国\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2021-11-18 15:32:01');
INSERT INTO `sys_oper_log`
VALUES (107, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"phonenumber\":\"18625106880\",\"admin\":false,\"password\":\"123456\",\"postIds\":[1],\"email\":\"1016241535@qq.com\",\"nickName\":\"小三\",\"sex\":\"0\",\"deptId\":103,\"params\":{},\"userName\":\"吴正国\",\"roleIds\":[2],\"status\":\"0\"}',
        '{\"msg\":\"新增用户\'吴正国\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2021-11-18 15:32:09');
INSERT INTO `sys_oper_log`
VALUES (108, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"phonenumber\":\"18625106880\",\"admin\":false,\"password\":\"$2a$10$13y78LxOApnBbNB8sHL1z.EWzp2Q6oGlxdJXRTey8Ynog2dZ7ail2\",\"postIds\":[1],\"email\":\"yam!3631006@qq.com\",\"nickName\":\"全球小二哥\",\"sex\":\"0\",\"deptId\":103,\"params\":{},\"userName\":\"user01\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 15:33:31');
INSERT INTO `sys_oper_log`
VALUES (109, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL,
        '/system/user/changeStatus', '127.0.0.1', '内网IP',
        '{\"admin\":true,\"params\":{},\"userId\":1,\"status\":\"1\"}', NULL, 1, '不允许操作超级管理员用户',
        '2021-11-18 15:33:39');
INSERT INTO `sys_oper_log`
VALUES (110, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_dept', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-18 16:25:51');
INSERT INTO `sys_oper_log`
VALUES (111, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-18 16:26:07');
INSERT INTO `sys_oper_log`
VALUES (112, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/config', '127.0.0.1', '内网IP',
        '{\"configName\":\"主框架页-侧边栏主题\",\"configKey\":\"sys.index.sideTheme\",\"createBy\":\"admin\",\"createTime\":1637217272000,\"updateBy\":\"admin\",\"configId\":3,\"remark\":\"深色主题theme-dark，浅色主题theme-light\",\"configType\":\"Y\",\"configValue\":\"theme-light\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 16:43:54');
INSERT INTO `sys_oper_log`
VALUES (113, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/config', '127.0.0.1', '内网IP',
        '{\"configName\":\"主框架页-侧边栏主题\",\"configKey\":\"sys.index.sideTheme\",\"createBy\":\"admin\",\"createTime\":1637217272000,\"updateBy\":\"admin\",\"configId\":3,\"remark\":\"深色主题theme-dark，浅色主题theme-light\",\"updateTime\":1637225034000,\"configType\":\"Y\",\"configValue\":\"theme-dark\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 16:44:13');
INSERT INTO `sys_oper_log`
VALUES (114, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin',
        NULL, '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2021-11-18 16:44:20');
INSERT INTO `sys_oper_log`
VALUES (115, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP',
        'repair_test,repair_table,repair_record,repair_place_info,repair_place,repair_file_response',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 16:56:07');
INSERT INTO `sys_oper_log`
VALUES (116, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-18 16:56:23');
INSERT INTO `sys_oper_log`
VALUES (117, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"system\",\"orderNum\":\"1\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1637217272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 21:59:51');
INSERT INTO `sys_oper_log`
VALUES (118, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-18 22:26:44');
INSERT INTO `sys_oper_log`
VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键Id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637225767000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"RecordId\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"recordId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"测试记录id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"record_id\"},{\"capJavaField\":\"MachineType\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"machineType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"转辙机类型\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"machine_type\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"附件标题\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 22:28:57');
INSERT INTO `sys_oper_log`
VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":25,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637225767000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ParentId\",\"usableColumn\":true,\"columnId\":26,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"parent_id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":27,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名称\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":28,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(8)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":163722576700',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 22:29:46');
INSERT INTO `sys_oper_log`
VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":92,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637225767000,\"tableId\":6,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Label\",\"usableColumn\":false,\"columnId\":93,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"label\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"检修内容\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"label\"},{\"capJavaField\":\"SortNo\",\"usableColumn\":false,\"columnId\":94,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sortNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"排序\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(8)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"sort_no\"},{\"capJavaField\":\"CreateBy\",\"usableColumn\":false,\"columnId\":95,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"createBy\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"创建人\",\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"tableId\":6,\"pk\":',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 22:42:10');
INSERT INTO `sys_oper_log`
VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":100,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637225767000,\"tableId\":7,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"RecordId\",\"usableColumn\":false,\"columnId\":101,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"recordId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"检修记录id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"record_id\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":102,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"类型(0前机,1后机)\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"type\"},{\"capJavaField\":\"Label\",\"usableColumn\":false,\"columnId\":103,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"label\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"检修内容\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 22:42:26');
INSERT INTO `sys_oper_log`
VALUES (123, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":77,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637225767000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"RouteId\",\"usableColumn\":false,\"columnId\":78,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"routeId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"线路id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"route_id\"},{\"capJavaField\":\"StationId\",\"usableColumn\":false,\"columnId\":79,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"stationId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"车站id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"station_id\"},{\"capJavaField\":\"SwitchId\",\"usableColumn\":false,\"columnId\":80,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"switchId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"道岔号id\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 22:43:27');
INSERT INTO `sys_oper_log`
VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637225767000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"SwitchNo\",\"usableColumn\":false,\"columnId\":37,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"switchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"道岔编号\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"switch_no\"},{\"capJavaField\":\"Route\",\"usableColumn\":false,\"columnId\":38,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"route\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"线路\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"route\"},{\"capJavaField\":\"Station\",\"usableColumn\":false,\"columnId\":39,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"station\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"车站\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 22:43:39');
INSERT INTO `sys_oper_log`
VALUES (125, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"guoge\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":100,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"updateTime\":1637246546000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637225767000,\"tableId\":7,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"RecordId\",\"usableColumn\":false,\"columnId\":101,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"recordId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"检修记录id\",\"isQuery\":\"1\",\"updateTime\":1637246546000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"record_id\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":102,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"类型(0前机,1后机)\",\"isQuery\":\"1\",\"updateTime\":1637246546000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"type\"},{\"capJavaField\":\"Label\",\"usableColumn\":false,\"columnId\":103,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"label\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"检修内容\",\"isQuery\":\"1\",\"updateTime\":1637246546000,\"sort\":4,\"list\":true,',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 22:45:15');
INSERT INTO `sys_oper_log`
VALUES (126, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"guoge\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"updateTime\":1637246619000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637225767000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"SwitchNo\",\"usableColumn\":false,\"columnId\":37,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"switchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"道岔编号\",\"isQuery\":\"1\",\"updateTime\":1637246619000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"switch_no\"},{\"capJavaField\":\"Route\",\"usableColumn\":false,\"columnId\":38,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"route\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"线路\",\"isQuery\":\"1\",\"updateTime\":1637246619000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"route\"},{\"capJavaField\":\"Station\",\"usableColumn\":false,\"columnId\":39,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"station\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"车站\",\"isQuery\":\"1\",\"updateTime\":1637246619000,\"sort\":4,\"list\":true,\"params\":{}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 22:45:56');
INSERT INTO `sys_oper_log`
VALUES (127, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"guoge\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":25,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"updateTime\":1637245786000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637225767000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ParentId\",\"usableColumn\":true,\"columnId\":26,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父id\",\"isQuery\":\"1\",\"updateTime\":1637245786000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"parent_id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":27,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名称\",\"isQuery\":\"1\",\"updateTime\":1637245786000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":28,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"类型\",\"isQuery\":\"1\",\"updateTime\":1637245786000,\"sort\":4,\"list\":true,\"params\":{},\"javaTy',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 22:46:25');
INSERT INTO `sys_oper_log`
VALUES (128, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-18 22:48:58');
INSERT INTO `sys_oper_log`
VALUES (129, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":\"2\",\"menuName\":\"固件检测\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"repair\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 22:57:20');
INSERT INTO `sys_oper_log`
VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"2\",\"menuName\":\"固件检测\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"repair\",\"children\":[],\"createTime\":1637247440000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1061,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 22:58:15');
INSERT INTO `sys_oper_log`
VALUES (131, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":\"1\",\"menuName\":\"测试表格\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"table\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 23:01:41');
INSERT INTO `sys_oper_log`
VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"monitor\",\"orderNum\":\"3\",\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1637217272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 23:03:27');
INSERT INTO `sys_oper_log`
VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":\"4\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1637217272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 23:03:38');
INSERT INTO `sys_oper_log`
VALUES (134, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"表格查询\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"repair:table:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 23:05:38');
INSERT INTO `sys_oper_log`
VALUES (135, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"表格新增\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"repair:table:add\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 23:06:55');
INSERT INTO `sys_oper_log`
VALUES (136, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"检测查询\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1637248171000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1065,\"menuType\":\"F\",\"perms\":\"repair:table:query\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 23:10:07');
INSERT INTO `sys_oper_log`
VALUES (137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"检测新增\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1637248171000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1066,\"menuType\":\"F\",\"perms\":\"repair:table:add\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 23:10:18');
INSERT INTO `sys_oper_log`
VALUES (138, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"检测修改\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1637248171000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1067,\"menuType\":\"F\",\"perms\":\"repair:table:edit\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 23:10:28');
INSERT INTO `sys_oper_log`
VALUES (139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"4\",\"menuName\":\"检测删除\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1637248171000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1068,\"menuType\":\"F\",\"perms\":\"repair:table:remove\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 23:10:35');
INSERT INTO `sys_oper_log`
VALUES (140, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"5\",\"menuName\":\"检测导出\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1637248171000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1069,\"menuType\":\"F\",\"perms\":\"repair:table:export\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-18 23:10:41');
INSERT INTO `sys_oper_log`
VALUES (141, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":\"1\",\"menuName\":\"测试表格\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"table\",\"component\":\"repair/table/index\",\"children\":[],\"createTime\":1637247701000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1062,\"menuType\":\"C\",\"perms\":\"repair:table:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 10:32:13');
INSERT INTO `sys_oper_log`
VALUES (142, '检测', 1, 'com.ruoyi.web.controller.repair.RepairTableController.add()', 'POST', 1, 'admin', NULL,
        '/repair/table', '127.0.0.1', '内网IP',
        '{\"sortNo\":1,\"createTime\":1637289549573,\"label\":\"测试这一条内容\",\"params\":{}}', NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairTableMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairTableMapper.insertRepairTable-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_table          ( label,             sort_no,                          create_time )           values ( ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value',
        '2021-11-19 10:39:09');
INSERT INTO `sys_oper_log`
VALUES (143, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', NULL,
        '/system/post', '127.0.0.1', '内网IP',
        '{\"postSort\":\"5\",\"flag\":false,\"postId\":5,\"params\":{},\"createBy\":\"admin\",\"postName\":\"嗷嗷嗷\",\"postCode\":\"AVC\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 10:44:23');
INSERT INTO `sys_oper_log`
VALUES (144, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', NULL,
        '/system/post', '127.0.0.1', '内网IP',
        '{\"postSort\":\"6\",\"flag\":false,\"postId\":6,\"params\":{},\"createBy\":\"admin\",\"postName\":\"AD\",\"postCode\":\"ASC\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 10:44:38');
INSERT INTO `sys_oper_log`
VALUES (145, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/post/5,6', '127.0.0.1', '内网IP', '{postIds=5,6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-19 10:49:36');
INSERT INTO `sys_oper_log`
VALUES (146, '检测', 1, 'com.ruoyi.web.controller.repair.RepairTableController.add()', 'POST', 1, 'admin', NULL,
        '/repair/table', '127.0.0.1', '内网IP',
        '{\"sortNo\":1,\"createTime\":1637290202952,\"label\":\"检查前机1-2是否正常\",\"params\":{}}', NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairTableMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairTableMapper.insertRepairTable-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_table          ( label,             sort_no,                          create_time )           values ( ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value',
        '2021-11-19 10:50:03');
INSERT INTO `sys_oper_log`
VALUES (147, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', NULL,
        '/system/post', '127.0.0.1', '内网IP',
        '{\"postSort\":\"5\",\"flag\":false,\"postId\":7,\"params\":{},\"createBy\":\"admin\",\"postName\":\"AAAI\",\"postCode\":\"AA\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 10:57:40');
INSERT INTO `sys_oper_log`
VALUES (148, '检测', 1, 'com.ruoyi.web.controller.repair.RepairTableController.add()', 'POST', 1, 'admin', NULL,
        '/repair/table', '127.0.0.1', '内网IP',
        '{\"sortNo\":1,\"createTime\":1637290727623,\"label\":\"AAA\",\"params\":{}}', NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairTableMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairTableMapper.insertRepairTable-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_table          ( label,             sort_no,                          create_time )           values ( ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value',
        '2021-11-19 10:58:47');
INSERT INTO `sys_oper_log`
VALUES (149, '检测', 1, 'com.ruoyi.web.controller.repair.RepairTableController.add()', 'POST', 1, 'admin', NULL,
        '/repair/table', '127.0.0.1', '内网IP',
        '{\"sortNo\":1,\"createTime\":1637290884276,\"label\":\"AAA\",\"params\":{}}', NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairTableMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairTableMapper.insertRepairTable-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_table          ( label,             sort_no,                          create_time )           values ( ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value',
        '2021-11-19 11:01:24');
INSERT INTO `sys_oper_log`
VALUES (150, '检测', 1, 'com.ruoyi.web.controller.repair.RepairTableController.add()', 'POST', 1, 'admin', NULL,
        '/repair/table', '127.0.0.1', '内网IP',
        '{\"sortNo\":1,\"createTime\":1637291684240,\"id\":1,\"label\":\"AAA\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 11:14:44');
INSERT INTO `sys_oper_log`
VALUES (151, '检测', 1, 'com.ruoyi.web.controller.repair.RepairTableController.add()', 'POST', 1, 'admin', NULL,
        '/repair/table', '127.0.0.1', '内网IP',
        '{\"sortNo\":2,\"createTime\":1637291693620,\"id\":2,\"label\":\"BBB\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 11:14:53');
INSERT INTO `sys_oper_log`
VALUES (152, '检测', 1, 'com.ruoyi.web.controller.repair.RepairTableController.add()', 'POST', 1, 'admin', NULL,
        '/repair/table', '127.0.0.1', '内网IP',
        '{\"sortNo\":5,\"createTime\":1637291706155,\"id\":3,\"label\":\"CCC\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 11:15:06');
INSERT INTO `sys_oper_log`
VALUES (153, '检测', 1, 'com.ruoyi.web.controller.repair.RepairTableController.add()', 'POST', 1, 'admin', NULL,
        '/repair/table', '127.0.0.1', '内网IP',
        '{\"sortNo\":3,\"createTime\":1637291712995,\"id\":4,\"label\":\"DDD\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 11:15:13');
INSERT INTO `sys_oper_log`
VALUES (154, '检测', 3, 'com.ruoyi.web.controller.repair.RepairTableController.remove()', 'DELETE', 1, 'admin', NULL,
        '/repair/table/4', '127.0.0.1', '内网IP', '{ids=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-19 11:28:52');
INSERT INTO `sys_oper_log`
VALUES (155, '检测', 3, 'com.ruoyi.web.controller.repair.RepairTableController.remove()', 'DELETE', 1, 'admin', NULL,
        '/repair/table/3', '127.0.0.1', '内网IP', '{ids=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-19 11:38:04');
INSERT INTO `sys_oper_log`
VALUES (156, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"AAA\",\"leader\":\"aaa\",\"orderNum\":\"1\",\"params\":{},\"parentId\":105,\"createBy\":\"admin\",\"children\":[],\"phone\":\"13645678911\",\"ancestors\":\"0,100,101,105\",\"email\":\"1016241535@qq.com\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 11:39:29');
INSERT INTO `sys_oper_log`
VALUES (157, '检测', 1, 'com.ruoyi.web.controller.repair.RepairTableController.add()', 'POST', 1, 'admin', NULL,
        '/repair/table', '127.0.0.1', '内网IP',
        '{\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472600,\"id\":5,\"label\":\"CCC\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 11:44:32');
INSERT INTO `sys_oper_log`
VALUES (158, '检测', 1, 'com.ruoyi.web.controller.repair.RepairTableController.add()', 'POST', 1, 'admin', NULL,
        '/repair/table', '127.0.0.1', '内网IP',
        '{\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656582,\"id\":6,\"label\":\"DDD\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 11:47:36');
INSERT INTO `sys_oper_log`
VALUES (159, '检测', 1, 'com.ruoyi.web.controller.repair.RepairTableController.add()', 'POST', 1, 'admin', NULL,
        '/repair/table', '127.0.0.1', '内网IP',
        '{\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667486,\"id\":7,\"label\":\"EEE\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 11:47:47');
INSERT INTO `sys_oper_log`
VALUES (160, '检测', 5, 'com.ruoyi.web.controller.repair.RepairTableController.export()', 'POST', 1, 'admin', NULL,
        '/repair/table/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2021-11-19 11:48:03');
INSERT INTO `sys_oper_log`
VALUES (161, '检测', 3, 'com.ruoyi.web.controller.repair.RepairTableController.remove()', 'DELETE', 1, 'admin', NULL,
        '/repair/table/1,2', '127.0.0.1', '内网IP', '{ids=1,2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-19 11:48:43');
INSERT INTO `sys_oper_log`
VALUES (162, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL,
        '/tool/gen/synchDb/repair_place_info', '127.0.0.1', '内网IP', '{tableName=repair_place_info}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:42:34');
INSERT INTO `sys_oper_log`
VALUES (163, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"guoge\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"updateTime\":1637246756000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637225767000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"SwitchNo\",\"usableColumn\":false,\"columnId\":37,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"switchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"道岔编号\",\"isQuery\":\"1\",\"updateTime\":1637246756000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"switch_no\"},{\"capJavaField\":\"Route\",\"usableColumn\":false,\"columnId\":38,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"route\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"线路\",\"isQuery\":\"1\",\"updateTime\":1637246756000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"route\"},{\"capJavaField\":\"Station\",\"usableColumn\":false,\"columnId\":39,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"station\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"车站\",\"isQuery\":\"1\",\"updateTime\":1637246756000,\"sort\":4,\"list\":true,\"params\":{}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:43:02');
INSERT INTO `sys_oper_log`
VALUES (164, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-19 14:43:59');
INSERT INTO `sys_oper_log`
VALUES (165, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"1\",\"menuName\":\"道岔信息\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"info\",\"component\":\"repair/info/index\",\"children\":[],\"createTime\":1637304975000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1070,\"menuType\":\"C\",\"perms\":\"repair:info:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:57:38');
INSERT INTO `sys_oper_log`
VALUES (166, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"unloadingDate\":2022249600000,\"dep\":\"维护一部\",\"lineCoordinates\":\"5+760078\",\"eqtType\":\"ZDJ9\",\"installDate\":1517328000000,\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"lock\":\"正常\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB\",\"lockMode\":\"内闭锁\",\"org\":\"维护一组\",\"lineEnviroment\":\"露天,地面\",\"params\":{},\"sortNo\":1,\"coordinateY\":\"55\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637305930764,\"name\":\"2#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ\",\"switchNo\":\"010102\"}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'lock,\n            pic,\n            coordinate_x,\n            coordinate_y,\n     \' at line 32\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairPlaceInfoMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairPlaceInfoMapper.insertRepairPlaceInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_place_info          ( switch_no,             route,             station,             name,             dep,             org,             eqt_type,             eqt_mode,             eqt_level,             admit_location,                          action,                          lock_mode,             installation_mode,             installation_drawing_no,                                       circuit_standard,             express,             install_date,             unloading_date,             line_coordinates,             line_enviroment,                                                    switch_num,             drawing_num,                          lock,             pic,             coordinate_x,             coordinate_y,             sort_no,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,                          ?,             ?,             ?,                                       ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,             ?,                          ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You ',
        '2021-11-19 15:12:10');
INSERT INTO `sys_oper_log`
VALUES (167, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"unloadingDate\":2022249600000,\"dep\":\"维护一部\",\"lineCoordinates\":\"5+760078\",\"eqtType\":\"ZDJ9\",\"installDate\":1517328000000,\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"lock\":\"正常\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB\",\"lockMode\":\"内闭锁\",\"org\":\"维护一组\",\"lineEnviroment\":\"露天,地面\",\"params\":{},\"sortNo\":1,\"coordinateY\":\"55\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637306232007,\"name\":\"2#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ\",\"switchNo\":\"010102\"}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'lock,\n            pic,\n            coordinate_x,\n            coordinate_y,\n     \' at line 32\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairPlaceInfoMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairPlaceInfoMapper.insertRepairPlaceInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_place_info          ( switch_no,             route,             station,             name,             dep,             org,             eqt_type,             eqt_mode,             eqt_level,             admit_location,                          action,                          lock_mode,             installation_mode,             installation_drawing_no,                                       circuit_standard,             express,             install_date,             unloading_date,             line_coordinates,             line_enviroment,                                                    switch_num,             drawing_num,                          lock,             pic,             coordinate_x,             coordinate_y,             sort_no,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,                          ?,             ?,             ?,                                       ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,             ?,                          ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You ',
        '2021-11-19 15:17:12');
INSERT INTO `sys_oper_log`
VALUES (168, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"unloadingDate\":2022249600000,\"dep\":\"维护一部\",\"lineCoordinates\":\"5+760078\",\"eqtType\":\"ZDJ9\",\"installDate\":1517328000000,\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB\",\"lockMode\":\"内闭锁\",\"org\":\"维护一组\",\"lineEnviroment\":\"露天,地面\",\"params\":{},\"sortNo\":1,\"coordinateY\":\"55\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637306622250,\"name\":\"2#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ\",\"switchNo\":\"010102\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:23:42');
INSERT INTO `sys_oper_log`
VALUES (169, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"unloadingDate\":2022249600000,\"dep\":\"维护一部\",\"lineCoordinates\":\"5+760078\",\"eqtType\":\"ZDJ9\",\"installDate\":1517328000000,\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":\"1\",\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB\",\"lockMode\":\"内闭锁\",\"org\":\"维护一组\",\"lineEnviroment\":\"露天,地面\",\"updateTime\":1637306912220,\"params\":{},\"sortNo\":1,\"coordinateY\":\"55\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637306622000,\"name\":\"2#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ\",\"switchNo\":\"010102\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:28:32');
INSERT INTO `sys_oper_log`
VALUES (170, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"unloadingDate\":2022249600000,\"dep\":\"维护一部\",\"lineCoordinates\":\"5+760078\",\"eqtType\":\"ZDJ9\",\"installDate\":1517328000000,\"responsible\":\"ABC\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":\"1\",\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB\",\"lockMode\":\"内闭锁\",\"org\":\"维护一组\",\"lineEnviroment\":\"露天,地面\",\"updateTime\":1637307399689,\"params\":{},\"sortNo\":1,\"coordinateY\":\"55\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637306622000,\"name\":\"2#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ\",\"switchNo\":\"010102\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:36:39');
INSERT INTO `sys_oper_log`
VALUES (171, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"unloadingDate\":2022249600000,\"dep\":\"维护一部\",\"lineCoordinates\":\"5+760078\",\"eqtType\":\"ZDJ9\",\"installDate\":1517328000000,\"responsible\":\"ABC\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":\"1\",\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB\",\"lockMode\":\"内闭锁\",\"org\":\"维护一组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天,地面\",\"updateTime\":1637307676121,\"params\":{},\"sortNo\":1,\"coordinateY\":\"55\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637306622000,\"name\":\"2#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ\",\"switchNo\":\"010102\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:41:16');
INSERT INTO `sys_oper_log`
VALUES (172, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"待填写\",\"unloadingDate\":2022249600000,\"dep\":\"维护一部\",\"lineCoordinates\":\"5+760078\",\"eqtType\":\"ZDJ9\",\"externalLockingDevice\":\"待填写\",\"installDate\":1517328000000,\"responsible\":\"ABC\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":\"1\",\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB\",\"lockMode\":\"内闭锁\",\"positionColsed\":\"1.3\",\"org\":\"维护一组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天,地面\",\"updateTime\":1637307756598,\"params\":{},\"sortNo\":1,\"sequence\":\"第一动\",\"coordinateY\":\"55\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637306622000,\"name\":\"2#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ\",\"switchNo\":\"010102\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:42:36');
INSERT INTO `sys_oper_log`
VALUES (173, '道岔信息', 5, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.export()', 'POST', 1, 'admin',
        NULL, '/repair/info/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2021-11-19 15:42:43');
INSERT INTO `sys_oper_log`
VALUES (174, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-19 16:48:23');
INSERT INTO `sys_oper_log`
VALUES (175, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-19 17:08:56');
INSERT INTO `sys_oper_log`
VALUES (176, '道岔信息', 5, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.export()', 'POST', 1, 'admin',
        NULL, '/repair/info/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2021-11-19 17:51:50');
INSERT INTO `sys_oper_log`
VALUES (177, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-19 17:52:18');
INSERT INTO `sys_oper_log`
VALUES (178, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"phonenumber\":\"13761420163\",\"admin\":false,\"password\":\"$2a$10$TwU6RJpw8x7TZec91lNpFeEUpJ8BW6uGOmHjubOgW73AZ5Jl30MaW\",\"postIds\":[1],\"nickName\":\"123\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"1234\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-20 15:45:47');
INSERT INTO `sys_oper_log`
VALUES (179, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/user/101', '127.0.0.1', '内网IP', '{userIds=101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-20 15:46:00');
INSERT INTO `sys_oper_log`
VALUES (180, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-20 17:10:56');
INSERT INTO `sys_oper_log`
VALUES (181, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-20 17:18:31');
INSERT INTO `sys_oper_log`
VALUES (182, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-20 17:21:20');
INSERT INTO `sys_oper_log`
VALUES (183, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-20 17:21:57');
INSERT INTO `sys_oper_log`
VALUES (184, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-20 17:22:55');
INSERT INTO `sys_oper_log`
VALUES (185, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-20 17:23:43');
INSERT INTO `sys_oper_log`
VALUES (186, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"待填写\",\"unloadingDate\":2022249600000,\"dep\":\"维护二部\",\"lineCoordinates\":\"5+760078\",\"eqtType\":\"ZDJ9\",\"externalLockingDevice\":\"待填写\",\"installDate\":1517328000000,\"responsible\":\"ABC\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":\"1\",\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB\",\"lockMode\":\"内闭锁\",\"positionColsed\":\"1.3\",\"org\":\"维护一组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天,地面\",\"updateTime\":1637400423216,\"params\":{},\"sequence\":\"第一动\",\"coordinateY\":\"55\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637306622000,\"name\":\"2#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ\",\"switchNo\":\"010102\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-20 17:27:03');
INSERT INTO `sys_oper_log`
VALUES (187, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-20 17:28:22');
INSERT INTO `sys_oper_log`
VALUES (188, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-20 17:36:25');
INSERT INTO `sys_oper_log`
VALUES (189, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-20 17:37:28');
INSERT INTO `sys_oper_log`
VALUES (190, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-20 17:39:42');
INSERT INTO `sys_oper_log`
VALUES (191, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-20 17:40:54');
INSERT INTO `sys_oper_log`
VALUES (192, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-20 17:44:00');
INSERT INTO `sys_oper_log`
VALUES (193, '道岔信息', 3, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/info/1,2,3,4,5,6,7,8,9,10', '127.0.0.1', '内网IP', '{ids=1,2,3,4,5,6,7,8,9,10}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 11:39:47');
INSERT INTO `sys_oper_log`
VALUES (194, '道岔信息', 3, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/info/11,12,13,14,15,16,17,18,19,20', '127.0.0.1', '内网IP',
        '{ids=11,12,13,14,15,16,17,18,19,20}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 11:39:51');
INSERT INTO `sys_oper_log`
VALUES (195, '道岔信息', 3, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/info/21,22,23,24,25,26,27,28,29,30', '127.0.0.1', '内网IP',
        '{ids=21,22,23,24,25,26,27,28,29,30}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 11:39:54');
INSERT INTO `sys_oper_log`
VALUES (196, '道岔信息', 3, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/info/31,32,33,34,35,36,37,38,39,40', '127.0.0.1', '内网IP',
        '{ids=31,32,33,34,35,36,37,38,39,40}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 11:40:00');
INSERT INTO `sys_oper_log`
VALUES (197, '道岔信息', 3, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/info/41,42,43,44,45,46,47,48,49,50', '127.0.0.1', '内网IP',
        '{ids=41,42,43,44,45,46,47,48,49,50}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 11:40:27');
INSERT INTO `sys_oper_log`
VALUES (198, '道岔信息', 3, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/info/51,52,53,54', '127.0.0.1', '内网IP', '{ids=51,52,53,54}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 11:40:30');
INSERT INTO `sys_oper_log`
VALUES (199, '道岔信息', 5, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.export()', 'POST', 1, 'admin',
        NULL, '/repair/info/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2021-11-22 11:44:18');
INSERT INTO `sys_oper_log`
VALUES (200, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, '', '2021-11-22 11:45:56');
INSERT INTO `sys_oper_log`
VALUES (201, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, '', '2021-11-22 11:47:54');
INSERT INTO `sys_oper_log`
VALUES (202, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, '', '2021-11-22 11:48:37');
INSERT INTO `sys_oper_log`
VALUES (203, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, '', '2021-11-22 11:49:21');
INSERT INTO `sys_oper_log`
VALUES (204, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, '', '2021-11-22 11:50:19');
INSERT INTO `sys_oper_log`
VALUES (205, '道岔信息', 5, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.export()', 'POST', 1, 'admin',
        NULL, '/repair/info/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2021-11-22 11:51:06');
INSERT INTO `sys_oper_log`
VALUES (206, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-22 11:51:28');
INSERT INTO `sys_oper_log`
VALUES (207, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-22 11:52:55');
INSERT INTO `sys_oper_log`
VALUES (208, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-22 12:14:32');
INSERT INTO `sys_oper_log`
VALUES (209, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-22 12:14:51');
INSERT INTO `sys_oper_log`
VALUES (210, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-22 12:18:33');
INSERT INTO `sys_oper_log`
VALUES (211, '道岔信息', 5, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.export()', 'POST', 1, 'admin',
        NULL, '/repair/info/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2021-11-22 12:19:42');
INSERT INTO `sys_oper_log`
VALUES (212, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-22 12:21:38');
INSERT INTO `sys_oper_log`
VALUES (213, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"\",\"unloadingDate\":1990713600000,\"dep\":\"维护一部\",\"lineCoordinates\":\"5+760.07S\",\"eqtType\":\"ZDJ9\",\"externalLockingDevice\":\"\",\"installDate\":1517328000000,\"updateBy\":\"admin\",\"responsible\":\"\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":\"55\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB-GJ-030535\",\"lockMode\":\"内锁闭\",\"positionColsed\":\"\",\"org\":\"轨旁一组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天、地面\",\"updateTime\":1637554919851,\"params\":{},\"sequence\":\"\",\"coordinateY\":\"55\",\"createBy\":\"admin\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637553088000,\"name\":\"2#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ-030525-300\",\"switchNo\":\"010102\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 12:21:59');
INSERT INTO `sys_oper_log`
VALUES (214, '用户管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-22 12:27:26');
INSERT INTO `sys_oper_log`
VALUES (215, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":\"3\",\"menuName\":\"道岔列表\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"table\",\"component\":\"repair/info/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"system:table:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 13:18:11');
INSERT INTO `sys_oper_log`
VALUES (216, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":\"3\",\"menuName\":\"道岔列表\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"place\",\"component\":\"repair/place/index\",\"children\":[],\"createTime\":1637558291000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1076,\"menuType\":\"C\",\"perms\":\"system:place:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 13:41:48');
INSERT INTO `sys_oper_log`
VALUES (217, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"道岔列表查询\",\"params\":{},\"parentId\":1076,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"repair:place:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 13:44:37');
INSERT INTO `sys_oper_log`
VALUES (218, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"guoge\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":25,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"updateTime\":1637246785000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637225767000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ParentId\",\"usableColumn\":true,\"columnId\":26,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父id\",\"isQuery\":\"1\",\"updateTime\":1637246785000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"parent_id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":27,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名称\",\"isQuery\":\"1\",\"updateTime\":1637246785000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637225767000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":28,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"类型\",\"isQuery\":\"1\",\"updateTime\":1637246785000,\"sort\":4,\"list\":true,\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 13:47:52');
INSERT INTO `sys_oper_log`
VALUES (219, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-22 13:48:01');
INSERT INTO `sys_oper_log`
VALUES (220, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":\"3\",\"menuName\":\"道岔列表\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"place\",\"component\":\"repair/place/index\",\"children\":[],\"createTime\":1637558291000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1076,\"menuType\":\"C\",\"perms\":\"repair:place:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 14:21:23');
INSERT INTO `sys_oper_log`
VALUES (221, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL,
        '/tool/gen/synchDb/repair_place', '127.0.0.1', '内网IP', '{tableName=repair_place}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 14:38:14');
INSERT INTO `sys_oper_log`
VALUES (222, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-22 14:39:55');
INSERT INTO `sys_oper_log`
VALUES (223, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"道岔等级\",\"params\":{},\"dictType\":\"repair_eqt_level\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 15:02:56');
INSERT INTO `sys_oper_log`
VALUES (224, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"动作\",\"params\":{},\"dictType\":\"repair_action\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 15:04:55');
INSERT INTO `sys_oper_log`
VALUES (225, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"锁闭方式\",\"params\":{},\"dictType\":\"repair_lock\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 15:05:20');
INSERT INTO `sys_oper_log`
VALUES (226, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修18部\",\"station\":\"莘庄\",\"org\":\"维修18组\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637565418868,\"name\":\"#113\",\"switchNo\":\"001002003\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 15:16:58');
INSERT INTO `sys_oper_log`
VALUES (227, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"龙华中路\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637566523327,\"name\":\"#003\",\"switchNo\":\"002003\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 15:35:42');
INSERT INTO `sys_oper_log`
VALUES (228, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"龙华中路\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637566551281,\"name\":\"#003\",\"switchNo\":\"002003\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 15:35:57');
INSERT INTO `sys_oper_log`
VALUES (229, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"switchNo\":2003}',
        '{\"msg\":\"该编号存在,不允许使用相同编号\",\"code\":500}', 0, NULL, '2021-11-22 16:00:35');
INSERT INTO `sys_oper_log`
VALUES (230, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"switchNo\":2003}',
        '{\"msg\":\"该编号存在,不允许使用相同编号\",\"code\":500}', 0, NULL, '2021-11-22 16:01:26');
INSERT INTO `sys_oper_log`
VALUES (231, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"createTime\":1637569394784,\"switchNo\":2004}', NULL,
        1,
        'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 5',
        '2021-11-22 16:23:41');
INSERT INTO `sys_oper_log`
VALUES (232, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"switchNo\":2004}',
        '{\"msg\":\"该编号已存在,不允许使用相同编号\",\"code\":500}', 0, NULL, '2021-11-22 16:24:18');
INSERT INTO `sys_oper_log`
VALUES (233, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"createTime\":1637569467096,\"switchNo\":2005}', NULL,
        1,
        'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 5',
        '2021-11-22 16:24:27');
INSERT INTO `sys_oper_log`
VALUES (234, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"createTime\":1637569623325,\"switchNo\":2006}', NULL,
        1,
        'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 5',
        '2021-11-22 16:27:03');
INSERT INTO `sys_oper_log`
VALUES (235, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"createTime\":1637569774709,\"switchNo\":2007}', NULL,
        1,
        'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 5',
        '2021-11-22 16:29:34');
INSERT INTO `sys_oper_log`
VALUES (236, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"switchNo\":2007}',
        '{\"msg\":\"该编号已存在,不允许使用相同编号\",\"code\":500}', 0, NULL, '2021-11-22 16:30:11');
INSERT INTO `sys_oper_log`
VALUES (237, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"createTime\":1637569818783,\"switchNo\":2008}', NULL,
        1,
        'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 5',
        '2021-11-22 16:30:18');
INSERT INTO `sys_oper_log`
VALUES (238, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"createTime\":1637570904665,\"switchNo\":2036}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 16:48:45');
INSERT INTO `sys_oper_log`
VALUES (239, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"createTime\":1637572834307,\"switchNo\":20369}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 17:20:50');
INSERT INTO `sys_oper_log`
VALUES (240, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"莘庄\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637572939886,\"switchNo\":203612}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 17:22:28');
INSERT INTO `sys_oper_log`
VALUES (241, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"params\":{},\"route\":\"04号线\",\"createTime\":1637578688235,\"switchNo\":2003641}', NULL, 1, '',
        '2021-11-22 18:58:08');
INSERT INTO `sys_oper_log`
VALUES (242, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"route\":\"04号线\",\"switchNo\":2003641}',
        '{\"msg\":\"该编号已存在,不允许使用相同编号\",\"code\":500}', 0, NULL, '2021-11-22 18:58:15');
INSERT INTO `sys_oper_log`
VALUES (243, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"params\":{},\"route\":\"04号线\",\"createTime\":1637578724749,\"switchNo\":20036412}', NULL, 1, '',
        '2021-11-22 18:58:44');
INSERT INTO `sys_oper_log`
VALUES (244, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"params\":{},\"route\":\"04号线\",\"createTime\":1637578744508,\"switchNo\":200364123}', NULL, 1, '',
        '2021-11-22 18:59:04');
INSERT INTO `sys_oper_log`
VALUES (245, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"params\":{},\"route\":\"04号线\",\"createTime\":1637578812233,\"switchNo\":2003641234}', NULL, 1,
        'nested exception is org.apache.ibatis.reflection.ReflectionException: Error instantiating class com.ruoyi.repair.domain.RepairPlace with invalid types (Builder) or values (1). Cause: java.lang.IllegalArgumentException: argument type mismatch',
        '2021-11-22 19:00:23');
INSERT INTO `sys_oper_log`
VALUES (246, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP', '{\"params\":{},\"route\":\"04号线\",\"switchNo\":2003641}',
        '{\"msg\":\"该编号已存在,不允许使用相同编号\",\"code\":500}', 0, NULL, '2021-11-22 19:04:18');
INSERT INTO `sys_oper_log`
VALUES (247, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"params\":{},\"route\":\"04号线\",\"createTime\":1637579064959,\"switchNo\":2003642}', NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'id\' at row 1\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairPlaceMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairPlaceMapper.insertRepairPlace-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_place          ( id,                          name )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'id\' at row 1\n; Data truncated for column \'id\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'id\' at row 1',
        '2021-11-22 19:04:43');
INSERT INTO `sys_oper_log`
VALUES (248, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"params\":{},\"route\":\"04号线\",\"createTime\":1637579365999,\"switchNo\":2003643}', NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'id\' at row 1\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairPlaceMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairPlaceMapper.insertRepairPlace-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_place          ( id,                          name )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Data truncated for column \'id\' at row 1\n; Data truncated for column \'id\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'id\' at row 1',
        '2021-11-22 19:09:31');
INSERT INTO `sys_oper_log`
VALUES (249, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"params\":{},\"route\":\"04号线\",\"createTime\":1637579603402,\"switchNo\":2003644}', NULL, 1,
        'For input string: \"78fbdbbf-863a-4b4f-a01b-32d3aaad654d\"', '2021-11-22 19:13:23');
INSERT INTO `sys_oper_log`
VALUES (250, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"params\":{},\"route\":\"04号线\",\"createTime\":1637579680836,\"switchNo\":2003645}', NULL, 1,
        'For input string: \"5e2de06acc694ea08b4d84d382ebb935\"', '2021-11-22 19:14:40');
INSERT INTO `sys_oper_log`
VALUES (251, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"params\":{},\"route\":\"金尚路\",\"createTime\":1637581733192,\"switchNo\":236210}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 19:48:53');
INSERT INTO `sys_oper_log`
VALUES (252, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"南门站\",\"params\":{},\"route\":\"2号线\",\"createTime\":1637582320246,\"name\":\"3#\",\"switchNo\":23156}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 19:58:40');
INSERT INTO `sys_oper_log`
VALUES (253, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"金鼎站\",\"params\":{},\"route\":\"01号线\",\"name\":\"#3\",\"switchNo\":1002003}',
        '{\"msg\":\"该编号已存在,不允许使用相同编号\",\"code\":500}', 0, NULL, '2021-11-22 20:11:49');
INSERT INTO `sys_oper_log`
VALUES (254, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"金鼎站\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637583116509,\"name\":\"#3\",\"switchNo\":1002004}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 20:11:56');
INSERT INTO `sys_oper_log`
VALUES (255, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"金秋站\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637583273996,\"name\":\"#3\",\"switchNo\":1002005}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 20:14:34');
INSERT INTO `sys_oper_log`
VALUES (256, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"响当当\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637583370487,\"name\":\"#4\",\"switchNo\":102312}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 20:17:19');
INSERT INTO `sys_oper_log`
VALUES (257, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"响当当\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637583466373,\"name\":\"#4\",\"switchNo\":102313}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 20:17:46');
INSERT INTO `sys_oper_log`
VALUES (258, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"水暖站\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637584238610,\"name\":\"#36\",\"switchNo\":10203}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'728757479764267009\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairPlaceMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairPlaceMapper.insertRepairPlace-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_place          ( id,             parent_id,             name )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'728757479764267009\' for key \'PRIMARY\'\n; Duplicate entry \'728757479764267009\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'728757479764267009\' for key \'PRIMARY\'',
        '2021-11-22 20:30:38');
INSERT INTO `sys_oper_log`
VALUES (259, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"水暖站\",\"params\":{},\"route\":\"01号线\",\"name\":\"#36\",\"switchNo\":10203}',
        '{\"msg\":\"该编号已存在,不允许使用相同编号\",\"code\":500}', 0, NULL, '2021-11-22 20:32:15');
INSERT INTO `sys_oper_log`
VALUES (260, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"水暖站\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637584342091,\"name\":\"#36\",\"switchNo\":10204}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'728757479764267009\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairPlaceMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairPlaceMapper.insertRepairPlace-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_place          ( id,             parent_id,             name )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'728757479764267009\' for key \'PRIMARY\'\n; Duplicate entry \'728757479764267009\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'728757479764267009\' for key \'PRIMARY\'',
        '2021-11-22 20:32:41');
INSERT INTO `sys_oper_log`
VALUES (261, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"水暖站\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637584396993,\"name\":\"#36\",\"switchNo\":10205}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 20:34:18');
INSERT INTO `sys_oper_log`
VALUES (262, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"今天\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637592041440,\"name\":\"#3\",\"switchNo\":2103}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairPlaceMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairPlaceMapper.insertRepairPlace-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_place          ( id,             parent_id,             name )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n; Duplicate entry \'1\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'',
        '2021-11-22 22:52:55');
INSERT INTO `sys_oper_log`
VALUES (263, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"station\":\"今天\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637593004858,\"name\":\"#3\",\"switchNo\":2104}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 22:56:44');
INSERT INTO `sys_oper_log`
VALUES (264, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"\",\"unloadingDate\":1990713600000,\"dep\":\"维护一部\",\"lineCoordinates\":\"5+760.07S\",\"eqtType\":\"ZDJ9\",\"externalLockingDevice\":\"\",\"installDate\":1517328000000,\"updateBy\":\"admin\",\"responsible\":\"\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":\"55\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB-GJ-030535\",\"lockMode\":\"内锁闭\",\"positionColsed\":\"\",\"org\":\"轨旁一组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天、地面\",\"updateTime\":1637594598987,\"params\":{},\"sequence\":\"\",\"coordinateY\":\"55\",\"createBy\":\"admin\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637553088000,\"name\":\"2#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ-030525-300\",\"switchNo\":10102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-22 23:23:19');
INSERT INTO `sys_oper_log`
VALUES (265, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"JDZ9\",\"station\":\"天赋站\",\"action\":\"单机\",\"eqtLevel\":\"三级\",\"org\":\"维护一组\",\"params\":{},\"route\":\"04号线\",\"createTime\":1637631733559,\"name\":\"#10\",\"switchNo\":12326}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 09:42:13');
INSERT INTO `sys_oper_log`
VALUES (266, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"JDZ9\",\"station\":\"大胸站\",\"action\":\"单机\",\"eqtLevel\":\"三级\",\"id\":\"140\",\"org\":\"维护一组\",\"updateTime\":1637632134031,\"params\":{},\"route\":\"05号线\",\"createTime\":1637631734000,\"name\":\"#10\",\"switchNo\":12326}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 09:48:54');
INSERT INTO `sys_oper_log`
VALUES (267, '道岔信息', 3, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/info/135,136,137,138,139,140', '127.0.0.1', '内网IP', '{ids=135,136,137,138,139,140}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 10:16:26');
INSERT INTO `sys_oper_log`
VALUES (268, '道岔信息', 3, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/info/125,126,127,128,129,130,131,132,133,134', '127.0.0.1', '内网IP',
        '{ids=125,126,127,128,129,130,131,132,133,134}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-23 10:16:34');
INSERT INTO `sys_oper_log`
VALUES (269, '道岔信息', 3, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/info/115,116,117,118,119,120,121,122,123,124', '127.0.0.1', '内网IP',
        '{ids=115,116,117,118,119,120,121,122,123,124}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-23 10:16:40');
INSERT INTO `sys_oper_log`
VALUES (270, '道岔信息', 3, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/info/109,110,111,112,113,114', '127.0.0.1', '内网IP', '{ids=109,110,111,112,113,114}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 10:16:49');
INSERT INTO `sys_oper_log`
VALUES (271, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"ZDJ9\",\"station\":\"莘庄\",\"action\":\"单机\",\"eqtLevel\":\"三级\",\"org\":\"维护一组\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637633897286,\"name\":\"3#\",\"switchNo\":1010101}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 10:18:17');
INSERT INTO `sys_oper_log`
VALUES (272, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"ZDJ9\",\"station\":\"莘庄\",\"action\":\"单机\",\"eqtLevel\":\"三级\",\"org\":\"维护一组\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637634082683,\"name\":\"3#\",\"switchNo\":1010102}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'eqt_level\' at row 1\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairPlaceMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairPlaceMapper.insertRepairPlace-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_place          ( id,             parent_id,             name,             type,             switch_no,                                                                 eqt_type,                                                    eqt_level,                          action )           values ( ?,             ?,             ?,             ?,             ?,                                                                 ?,                                                    ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'eqt_level\' at row 1\n; Data truncation: Data too long for column \'eqt_level\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'eqt_level\' at row 1',
        '2021-11-23 10:21:22');
INSERT INTO `sys_oper_log`
VALUES (273, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"ZDJ9\",\"station\":\"莘庄\",\"action\":\"单机\",\"eqtLevel\":\"三级\",\"org\":\"维护一组\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637634152986,\"name\":\"3#\",\"switchNo\":1010102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 10:22:33');
INSERT INTO `sys_oper_log`
VALUES (274, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"ZDJ9\",\"station\":\"莘庄\",\"action\":\"单机\",\"eqtLevel\":\"三级\",\"id\":\"143\",\"org\":\"维护一组\",\"updateTime\":1637634316745,\"params\":{},\"route\":\"01号线\",\"createTime\":1637634153000,\"name\":\"3#\",\"switchNo\":1010102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 10:25:16');
INSERT INTO `sys_oper_log`
VALUES (275, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"JDZ9\",\"station\":\"锦江乐园\",\"action\":\"单机\",\"eqtLevel\":\"三级\",\"org\":\"维护一组\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637634457195,\"name\":\"1#\",\"switchNo\":1010104}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 10:27:37');
INSERT INTO `sys_oper_log`
VALUES (276, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"ZDJ9\",\"station\":\"临空路\",\"action\":\"单机\",\"eqtLevel\":\"三级\",\"lockMode\":\"内闭锁\",\"org\":\"维修二组\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637635054461,\"name\":\"4#\",\"eqtMode\":\"ZDJ9/6\",\"switchNo\":1020101}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 10:37:34');
INSERT INTO `sys_oper_log`
VALUES (277, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"lockMode\":\"内闭锁\",\"org\":\"维修一组\",\"params\":{},\"route\":\"02号线\",\"createTime\":1637635341546,\"name\":\"1#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020304}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 10:42:21');
INSERT INTO `sys_oper_log`
VALUES (278, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"lockMode\":\"内闭锁\",\"org\":\"维修一组\",\"params\":{},\"route\":\"02号线\",\"name\":\"1#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020304}',
        '{\"msg\":\"该编号已存在,不允许使用相同编号\",\"code\":500}', 0, NULL, '2021-11-23 10:46:49');
INSERT INTO `sys_oper_log`
VALUES (279, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"lockMode\":\"内闭锁\",\"org\":\"维修一组\",\"params\":{},\"route\":\"02号线\",\"name\":\"1#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020304}',
        '{\"msg\":\"该编号已存在,不允许使用相同编号\",\"code\":500}', 0, NULL, '2021-11-23 11:17:43');
INSERT INTO `sys_oper_log`
VALUES (280, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"lockMode\":\"内闭锁\",\"org\":\"维修一组\",\"params\":{},\"route\":\"02号线\",\"name\":\"1#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020304}',
        '{\"msg\":\"该编号已存在,不允许使用相同编号\",\"code\":500}', 0, NULL, '2021-11-23 11:17:55');
INSERT INTO `sys_oper_log`
VALUES (281, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"lockMode\":\"内闭锁\",\"org\":\"维修一组\",\"params\":{},\"route\":\"02号线\",\"createTime\":1637637487779,\"name\":\"1#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020305}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 11:21:28');
INSERT INTO `sys_oper_log`
VALUES (282, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"lockMode\":\"内闭锁\",\"org\":\"维修一组\",\"params\":{},\"route\":\"02号线\",\"createTime\":1637640134735,\"name\":\"2#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020306}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:02:14');
INSERT INTO `sys_oper_log`
VALUES (283, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":\"148\",\"lockMode\":\"内闭锁\",\"org\":\"维修二组\",\"updateTime\":1637640172304,\"params\":{},\"route\":\"02号线\",\"createTime\":1637640135000,\"name\":\"2#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020306}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:02:52');
INSERT INTO `sys_oper_log`
VALUES (284, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":\"148\",\"lockMode\":\"内闭锁\",\"org\":\"维修三组\",\"updateTime\":1637640268267,\"params\":{},\"route\":\"02号线\",\"createTime\":1637640135000,\"name\":\"2#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020306}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:04:47');
INSERT INTO `sys_oper_log`
VALUES (285, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":\"148\",\"lockMode\":\"内闭锁\",\"org\":\"维修三组\",\"updateTime\":1637640418175,\"params\":{},\"route\":\"02号线\",\"createTime\":1637640135000,\"name\":\"2#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020306}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:09:15');
INSERT INTO `sys_oper_log`
VALUES (286, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":\"148\",\"lockMode\":\"内闭锁\",\"org\":\"维修三组\",\"updateTime\":1637640578076,\"params\":{},\"route\":\"02号线\",\"createTime\":1637640135000,\"name\":\"2#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020306}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:09:38');
INSERT INTO `sys_oper_log`
VALUES (287, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":\"148\",\"lockMode\":\"内闭锁\",\"org\":\"维修四组\",\"updateTime\":1637640598895,\"params\":{},\"route\":\"02号线\",\"createTime\":1637640135000,\"name\":\"2#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020306}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:09:58');
INSERT INTO `sys_oper_log`
VALUES (288, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":\"148\",\"lockMode\":\"内闭锁\",\"org\":\"维修五组\",\"updateTime\":1637640826669,\"params\":{},\"route\":\"02号线\",\"createTime\":1637640135000,\"name\":\"2#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020306}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:13:46');
INSERT INTO `sys_oper_log`
VALUES (289, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"dep\":\"维修一部\",\"eqtType\":\"ZD6\",\"station\":\"远东大道\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":\"148\",\"lockMode\":\"内闭锁\",\"org\":\"维修六组\",\"updateTime\":1637641092418,\"params\":{},\"route\":\"02号线\",\"createTime\":1637640135000,\"name\":\"2#\",\"eqtMode\":\"ZD6-D\",\"switchNo\":1020306}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:18:12');
INSERT INTO `sys_oper_log`
VALUES (290, '道岔信息管理', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 12:22:19');
INSERT INTO `sys_oper_log`
VALUES (291, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"orderNum\":\"6\",\"menuName\":\"道岔信息导入\",\"params\":{},\"parentId\":1070,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"repair:info:import\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:27:44');
INSERT INTO `sys_oper_log`
VALUES (292, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 12:34:26');
INSERT INTO `sys_oper_log`
VALUES (293, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL,
        '/tool/gen/synchDb/repair_place_info', '127.0.0.1', '内网IP', '{tableName=repair_place_info}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:37:40');
INSERT INTO `sys_oper_log`
VALUES (294, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-23 12:37:42');
INSERT INTO `sys_oper_log`
VALUES (295, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL,
        '/tool/gen/synchDb/repair_place_info', '127.0.0.1', '内网IP', '{tableName=repair_place_info}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:39:57');
INSERT INTO `sys_oper_log`
VALUES (296, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-23 12:39:58');
INSERT INTO `sys_oper_log`
VALUES (297, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL,
        '/tool/gen/4', '127.0.0.1', '内网IP', '{tableIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-23 12:41:01');
INSERT INTO `sys_oper_log`
VALUES (298, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP', 'repair_place_info', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2021-11-23 12:41:09');
INSERT INTO `sys_oper_log`
VALUES (299, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-23 12:41:16');
INSERT INTO `sys_oper_log`
VALUES (300, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":116,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637642469000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"SwitchNo\",\"usableColumn\":false,\"columnId\":117,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"switchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"道岔编号\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637642469000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"switch_no\"},{\"capJavaField\":\"Route\",\"usableColumn\":false,\"columnId\":118,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"route\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"线路\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637642469000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"route\"},{\"capJavaField\":\"Station\",\"usableColumn\":false,\"columnId\":119,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"station\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"车站\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":163764',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:43:07');
INSERT INTO `sys_oper_log`
VALUES (301, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":116,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"updateTime\":1637642587000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637642469000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"SwitchNo\",\"usableColumn\":false,\"columnId\":117,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"switchNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"道岔编号\",\"isQuery\":\"1\",\"updateTime\":1637642587000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637642469000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"switch_no\"},{\"capJavaField\":\"Route\",\"usableColumn\":false,\"columnId\":118,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"route\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"线路\",\"isQuery\":\"1\",\"updateTime\":1637642587000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637642469000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"route\"},{\"capJavaField\":\"Station\",\"usableColumn\":false,\"columnId\":119,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"station\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"车站\",\"isQuery\":\"1\",\"updateTime\":1637642587000,\"sort\":4,\"list\":true,\"params\":{},\"java',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 12:43:46');
INSERT INTO `sys_oper_log`
VALUES (302, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-23 12:43:50');
INSERT INTO `sys_oper_log`
VALUES (303, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 12:49:01');
INSERT INTO `sys_oper_log`
VALUES (304, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 12:53:20');
INSERT INTO `sys_oper_log`
VALUES (305, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 12:59:51');
INSERT INTO `sys_oper_log`
VALUES (306, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 13:00:21');
INSERT INTO `sys_oper_log`
VALUES (307, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 13:10:11');
INSERT INTO `sys_oper_log`
VALUES (308, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 13:17:09');
INSERT INTO `sys_oper_log`
VALUES (309, '道岔信息', 5, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.export()', 'POST', 1, 'admin',
        NULL, '/repair/info/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2021-11-23 13:19:34');
INSERT INTO `sys_oper_log`
VALUES (310, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 13:21:51');
INSERT INTO `sys_oper_log`
VALUES (311, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 13:25:20');
INSERT INTO `sys_oper_log`
VALUES (312, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 13:30:59');
INSERT INTO `sys_oper_log`
VALUES (313, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, '导入用户数据不能为空！',
        '2021-11-23 13:36:19');
INSERT INTO `sys_oper_log`
VALUES (314, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 13:36:48');
INSERT INTO `sys_oper_log`
VALUES (315, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 13:48:15');
INSERT INTO `sys_oper_log`
VALUES (316, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 13:53:12');
INSERT INTO `sys_oper_log`
VALUES (317, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 13:54:29');
INSERT INTO `sys_oper_log`
VALUES (318, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 13:55:10');
INSERT INTO `sys_oper_log`
VALUES (319, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 13:59:52');
INSERT INTO `sys_oper_log`
VALUES (320, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 14:02:10');
INSERT INTO `sys_oper_log`
VALUES (321, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"zdj9\",\"station\":\"金沙站\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":797,\"lockMode\":\"内闭锁\",\"org\":\"维护一组\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637650942211,\"name\":\"3#\",\"eqtMode\":\"zdj9-d\",\"switchNo\":10203}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:02:22');
INSERT INTO `sys_oper_log`
VALUES (322, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"zd6c\",\"station\":\"金敏站\",\"action\":\"双机\",\"eqtLevel\":\"三级\",\"id\":798,\"lockMode\":\"外币所\",\"org\":\"维修二组\",\"params\":{},\"route\":\"02号线\",\"createTime\":1637651014656,\"name\":\"4#\",\"eqtMode\":\"zd6c12\",\"switchNo\":20103}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:03:34');
INSERT INTO `sys_oper_log`
VALUES (323, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"1234\",\"station\":\"水务站\",\"action\":\"单机\",\"eqtLevel\":\"一级\",\"id\":799,\"lockMode\":\"内闭锁\",\"org\":\"维护九组\",\"params\":{},\"route\":\"02号线\",\"createTime\":1637651211380,\"name\":\"3#\",\"eqtMode\":\"1234-11\",\"switchNo\":102365}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:06:51');
INSERT INTO `sys_oper_log`
VALUES (324, '道岔信息', 1, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.add()', 'POST', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"123-11\",\"station\":\"库基站\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":800,\"lockMode\":\"内闭锁\",\"org\":\"维修六组\",\"params\":{},\"route\":\"01号线\",\"createTime\":1637651287684,\"name\":\"3#\",\"eqtMode\":\"123-11\",\"switchNo\":30102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:08:07');
INSERT INTO `sys_oper_log`
VALUES (325, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"zdj9\",\"station\":\"金沙站\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":797,\"lockMode\":\"内闭锁\",\"org\":\"维护六组\",\"updateTime\":1637651460807,\"params\":{},\"route\":\"01号线\",\"createTime\":1637650942000,\"name\":\"3#\",\"eqtMode\":\"zdj9-d\",\"switchNo\":10203}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:11:00');
INSERT INTO `sys_oper_log`
VALUES (326, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"123-11\",\"station\":\"库基站\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":800,\"lockMode\":\"内闭锁\",\"org\":\"维修十八组\",\"updateTime\":1637651486423,\"params\":{},\"route\":\"01号线\",\"createTime\":1637651288000,\"name\":\"3#\",\"eqtMode\":\"123-11\",\"switchNo\":30102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:11:26');
INSERT INTO `sys_oper_log`
VALUES (327, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"123-11\",\"station\":\"水牛站\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":800,\"lockMode\":\"内闭锁\",\"org\":\"维修十八组\",\"updateTime\":1637651509398,\"params\":{},\"route\":\"01号线\",\"createTime\":1637651288000,\"name\":\"3#\",\"eqtMode\":\"123-11\",\"switchNo\":30102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:11:49');
INSERT INTO `sys_oper_log`
VALUES (328, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"eqtType\":\"123-11\",\"station\":\"水牛站\",\"action\":\"单机\",\"eqtLevel\":\"二级\",\"id\":800,\"lockMode\":\"内闭锁\",\"org\":\"维修十八组\",\"updateTime\":1637651541339,\"params\":{},\"route\":\"01号线\",\"createTime\":1637651288000,\"name\":\"12#\",\"eqtMode\":\"123-11\",\"switchNo\":30102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:12:21');
INSERT INTO `sys_oper_log`
VALUES (329, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 15:14:05');
INSERT INTO `sys_oper_log`
VALUES (330, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 15:15:01');
INSERT INTO `sys_oper_log`
VALUES (331, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 15:15:40');
INSERT INTO `sys_oper_log`
VALUES (332, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 15:23:36');
INSERT INTO `sys_oper_log`
VALUES (333, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 15:45:11');
INSERT INTO `sys_oper_log`
VALUES (334, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 15:45:46');
INSERT INTO `sys_oper_log`
VALUES (335, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"\",\"unloadingDate\":1990713600000,\"dep\":\"维护十八部\",\"lineCoordinates\":\"5+760.07S\",\"externalLockingDevice\":\"\",\"installDate\":1517328000000,\"updateBy\":\"admin\",\"responsible\":\"\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":908,\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB-GJ-030535\",\"lockMode\":\"内锁闭\",\"positionColsed\":\"\",\"org\":\"轨旁一组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天、地面\",\"updateTime\":1637653602812,\"params\":{},\"sequence\":\"\",\"coordinateY\":\"55\",\"createBy\":\"admin\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637653509000,\"name\":\"4#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ-030525-300\",\"switchNo\":10102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:46:42');
INSERT INTO `sys_oper_log`
VALUES (336, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"\",\"unloadingDate\":1990713600000,\"dep\":\"维护十八部\",\"lineCoordinates\":\"5+760.07S\",\"externalLockingDevice\":\"\",\"installDate\":1517328000000,\"updateBy\":\"admin\",\"responsible\":\"\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":908,\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB-GJ-030535\",\"lockMode\":\"内锁闭\",\"positionColsed\":\"\",\"org\":\"轨旁一组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天、地面\",\"updateTime\":1637653650735,\"params\":{},\"sequence\":\"\",\"coordinateY\":\"55\",\"createBy\":\"admin\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637653509000,\"name\":\"14#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ-030525-300\",\"switchNo\":10102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:47:30');
INSERT INTO `sys_oper_log`
VALUES (337, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"\",\"unloadingDate\":1990713600000,\"dep\":\"维护十八部\",\"lineCoordinates\":\"5+760.07S\",\"externalLockingDevice\":\"\",\"installDate\":1517328000000,\"updateBy\":\"admin\",\"responsible\":\"\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":908,\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB-GJ-030535\",\"lockMode\":\"内锁闭\",\"positionColsed\":\"\",\"org\":\"轨旁十八组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天、地面\",\"updateTime\":1637654943182,\"params\":{},\"sequence\":\"\",\"coordinateY\":\"55\",\"createBy\":\"admin\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637653509000,\"name\":\"14#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ-030525-300\",\"switchNo\":10102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 16:09:03');
INSERT INTO `sys_oper_log`
VALUES (338, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"\",\"unloadingDate\":1990713600000,\"dep\":\"维护二十八部\",\"lineCoordinates\":\"5+760.07S\",\"externalLockingDevice\":\"\",\"installDate\":1517328000000,\"updateBy\":\"admin\",\"responsible\":\"\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":908,\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB-GJ-030535\",\"lockMode\":\"内锁闭\",\"positionColsed\":\"\",\"org\":\"轨旁十八组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天、地面\",\"updateTime\":1637654999279,\"params\":{},\"sequence\":\"\",\"coordinateY\":\"55\",\"createBy\":\"admin\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637653509000,\"name\":\"14#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ-030525-300\",\"switchNo\":10102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 16:09:59');
INSERT INTO `sys_oper_log`
VALUES (339, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"\",\"unloadingDate\":1990713600000,\"dep\":\"维护二十八八部\",\"lineCoordinates\":\"5+760.07S\",\"externalLockingDevice\":\"\",\"installDate\":1517328000000,\"updateBy\":\"admin\",\"responsible\":\"\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":908,\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB-GJ-030535\",\"lockMode\":\"内锁闭\",\"positionColsed\":\"\",\"org\":\"轨旁十八组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天、地面\",\"updateTime\":1637655117644,\"params\":{},\"sequence\":\"\",\"coordinateY\":\"55\",\"createBy\":\"admin\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637653509000,\"name\":\"14#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ-030525-300\",\"switchNo\":10102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 16:11:57');
INSERT INTO `sys_oper_log`
VALUES (340, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"\",\"unloadingDate\":1990713600000,\"dep\":\"维护二八部\",\"lineCoordinates\":\"5+760.07S\",\"externalLockingDevice\":\"\",\"installDate\":1517328000000,\"updateBy\":\"admin\",\"responsible\":\"\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":908,\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB-GJ-030535\",\"lockMode\":\"内锁闭\",\"positionColsed\":\"\",\"org\":\"轨旁十八组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天、地面\",\"updateTime\":1637655651317,\"params\":{},\"sequence\":\"\",\"coordinateY\":\"55\",\"createBy\":\"admin\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637653509000,\"name\":\"14#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ-030525-300\",\"switchNo\":10102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 16:20:51');
INSERT INTO `sys_oper_log`
VALUES (341, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"\",\"unloadingDate\":1990713600000,\"dep\":\"维护十六部\",\"lineCoordinates\":\"5+760.07S\",\"externalLockingDevice\":\"\",\"installDate\":1517328000000,\"updateBy\":\"admin\",\"responsible\":\"\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":908,\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB-GJ-030535\",\"lockMode\":\"内锁闭\",\"positionColsed\":\"\",\"org\":\"轨旁十八组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天、地面\",\"updateTime\":1637656397279,\"params\":{},\"sequence\":\"\",\"coordinateY\":\"55\",\"createBy\":\"admin\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637653509000,\"name\":\"14#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ-030525-300\",\"switchNo\":10102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 16:33:17');
INSERT INTO `sys_oper_log`
VALUES (342, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"\",\"unloadingDate\":1990713600000,\"dep\":\"维护一百十六部\",\"lineCoordinates\":\"5+760.07S\",\"externalLockingDevice\":\"\",\"installDate\":1517328000000,\"updateBy\":\"admin\",\"responsible\":\"\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":908,\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB-GJ-030535\",\"lockMode\":\"内锁闭\",\"positionColsed\":\"\",\"org\":\"轨旁十八组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天、地面\",\"updateTime\":1637656491138,\"params\":{},\"sequence\":\"\",\"coordinateY\":\"55\",\"createBy\":\"admin\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637653509000,\"name\":\"14#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ-030525-300\",\"switchNo\":10102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 16:34:51');
INSERT INTO `sys_oper_log`
VALUES (343, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin',
        NULL, '/system/user/profile', '127.0.0.1', '内网IP',
        '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1637644596000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"吴正国\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1637217272000,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 16:43:55');
INSERT INTO `sys_oper_log`
VALUES (344, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"\",\"unloadingDate\":1990713600000,\"dep\":\"维护百八十烦恼分\",\"lineCoordinates\":\"5+760.07S\",\"externalLockingDevice\":\"\",\"installDate\":1517328000000,\"updateBy\":\"admin\",\"responsible\":\"\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":908,\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB-GJ-030535\",\"lockMode\":\"内锁闭\",\"positionColsed\":\"\",\"org\":\"轨旁十八组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天、地面\",\"updateTime\":1637657248660,\"params\":{},\"sequence\":\"\",\"coordinateY\":\"55\",\"createBy\":\"admin\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1637653509000,\"name\":\"14#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ-030525-300\",\"switchNo\":10102}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 16:47:28');
INSERT INTO `sys_oper_log`
VALUES (345, '道岔信息', 3, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/info/908', '127.0.0.1', '内网IP', '{ids=908}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-23 16:49:43');
INSERT INTO `sys_oper_log`
VALUES (346, '道岔信息', 3, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/info/909', '127.0.0.1', '内网IP', '{ids=909}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-23 16:51:07');
INSERT INTO `sys_oper_log`
VALUES (347, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"类型\",\"params\":{},\"dictType\":\"repair_place_type\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:47:52');
INSERT INTO `sys_oper_log`
VALUES (348, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"repair_place_type\",\"dictLabel\":\"路线\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:48:57');
INSERT INTO `sys_oper_log`
VALUES (349, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"repair_place_type\",\"dictLabel\":\"车站\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:49:17');
INSERT INTO `sys_oper_log`
VALUES (350, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"repair_place_type\",\"dictLabel\":\"道岔名称\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:49:37');
INSERT INTO `sys_oper_log`
VALUES (351, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"repair_action\",\"dictLabel\":\"单机\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:24:17');
INSERT INTO `sys_oper_log`
VALUES (352, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"repair_action\",\"dictLabel\":\"双机\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:24:52');
INSERT INTO `sys_oper_log`
VALUES (353, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"repair_action\",\"dictLabel\":\"单机\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1637670257000,\"dictCode\":32,\"updateBy\":\"admin\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:24:58');
INSERT INTO `sys_oper_log`
VALUES (354, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-23 20:25:48');
INSERT INTO `sys_oper_log`
VALUES (355, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL,
        '/tool/gen/5', '127.0.0.1', '内网IP', '{tableIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-23 20:35:42');
INSERT INTO `sys_oper_log`
VALUES (356, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP', 'repair_record', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-23 20:35:55');
INSERT INTO `sys_oper_log`
VALUES (357, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":155,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637670955000,\"tableId\":9,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"RouteId\",\"usableColumn\":false,\"columnId\":156,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"routeId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"线路id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637670955000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"route_id\"},{\"capJavaField\":\"StationId\",\"usableColumn\":false,\"columnId\":157,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"stationId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"车站id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637670955000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"station_id\"},{\"capJavaField\":\"SwitchId\",\"usableColumn\":false,\"columnId\":158,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"switchId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"道岔号id\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"crea',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:37:43');
INSERT INTO `sys_oper_log`
VALUES (358, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-23 20:37:47');
INSERT INTO `sys_oper_log`
VALUES (359, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":155,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"updateTime\":1637671063000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637670955000,\"tableId\":9,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"RouteId\",\"usableColumn\":false,\"columnId\":156,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"routeId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"线路id\",\"isQuery\":\"1\",\"updateTime\":1637671063000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637670955000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"route_id\"},{\"capJavaField\":\"StationId\",\"usableColumn\":false,\"columnId\":157,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"stationId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"车站id\",\"isQuery\":\"1\",\"updateTime\":1637671063000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637670955000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"station_id\"},{\"capJavaField\":\"SwitchId\",\"usableColumn\":false,\"columnId\":158,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"switchId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"道岔号id\",\"isQuery\":\"1\",\"updateTime\":1637671063000,\"sort\":4,\"list\":true,',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:39:18');
INSERT INTO `sys_oper_log`
VALUES (360, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-23 20:40:06');
INSERT INTO `sys_oper_log`
VALUES (361, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":\"4\",\"menuName\":\"检修记录\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"record\",\"component\":\"repair/record/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"repair:record:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:46:08');
INSERT INTO `sys_oper_log`
VALUES (362, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"检修记录查询\",\"params\":{},\"parentId\":1092,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1637671590000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1093,\"menuType\":\"F\",\"perms\":\"repair:record:query\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:46:57');
INSERT INTO `sys_oper_log`
VALUES (363, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"检修记录新增\",\"params\":{},\"parentId\":1092,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1637671590000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1094,\"menuType\":\"F\",\"perms\":\"repair:record:add\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:47:05');
INSERT INTO `sys_oper_log`
VALUES (364, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"检修记录修改\",\"params\":{},\"parentId\":1092,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1637671590000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1095,\"menuType\":\"F\",\"perms\":\"repair:record:edit\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:47:13');
INSERT INTO `sys_oper_log`
VALUES (365, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"4\",\"menuName\":\"检修记录删除\",\"params\":{},\"parentId\":1092,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1637671590000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1096,\"menuType\":\"F\",\"perms\":\"repair:record:remove\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:47:19');
INSERT INTO `sys_oper_log`
VALUES (366, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"5\",\"menuName\":\"检修记录导出\",\"params\":{},\"parentId\":1092,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1637671590000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1097,\"menuType\":\"F\",\"perms\":\"repair:record:export\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:47:25');
INSERT INTO `sys_oper_log`
VALUES (367, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1091', '127.0.0.1', '内网IP', '{menuId=1091}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-23 20:48:19');
INSERT INTO `sys_oper_log`
VALUES (368, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":155,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"updateTime\":1637671158000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637670955000,\"tableId\":9,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"RouteId\",\"usableColumn\":false,\"columnId\":156,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"routeId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"线路id\",\"isQuery\":\"1\",\"updateTime\":1637671158000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637670955000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"route_id\"},{\"capJavaField\":\"StationId\",\"usableColumn\":false,\"columnId\":157,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"stationId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"车站id\",\"isQuery\":\"1\",\"updateTime\":1637671158000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637670955000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"station_id\"},{\"capJavaField\":\"SwitchId\",\"usableColumn\":false,\"columnId\":158,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"switchId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"道岔号id\",\"isQuery\":\"1\",\"updateTime\":1637671158000,\"sort\":4,\"list\":true,',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:49:00');
INSERT INTO `sys_oper_log`
VALUES (369, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-23 20:49:03');
INSERT INTO `sys_oper_log`
VALUES (370, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL,
        '/tool/gen/9', '127.0.0.1', '内网IP', '{tableIds=9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-23 20:50:38');
INSERT INTO `sys_oper_log`
VALUES (371, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP', 'repair_record', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-23 20:50:47');
INSERT INTO `sys_oper_log`
VALUES (372, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL,
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":170,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1637671847000,\"tableId\":10,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"RouteId\",\"usableColumn\":false,\"columnId\":171,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"routeId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"线路id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637671847000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"route_id\"},{\"capJavaField\":\"StationId\",\"usableColumn\":false,\"columnId\":172,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"stationId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"车站id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1637671847000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"station_id\"},{\"capJavaField\":\"SwitchId\",\"usableColumn\":false,\"columnId\":173,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"switchId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"道岔号id\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"c',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 20:51:06');
INSERT INTO `sys_oper_log`
VALUES (373, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-23 20:51:09');
INSERT INTO `sys_oper_log`
VALUES (374, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-23 21:00:26');
INSERT INTO `sys_oper_log`
VALUES (375, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":123,\"params\":{},\"routeId\":123,\"createTime\":1637720359214,\"id\":1,\"stationId\":123}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 10:19:19');
INSERT INTO `sys_oper_log`
VALUES (376, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP', '{\"params\":{},\"createTime\":1637732345326,\"id\":2}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 13:39:05');
INSERT INTO `sys_oper_log`
VALUES (377, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004862636000,\"params\":{},\"routeId\":729122004682281000,\"createTime\":1637733042444,\"stationList\":[729122004682281000,729122004854247400,729122004862636000],\"id\":3,\"stationId\":729122004854247400}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 13:50:42');
INSERT INTO `sys_oper_log`
VALUES (378, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555600,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682281000,\"createTime\":1637735738954,\"stationList\":[729122004682281000,729122004694863900,729122004774555600],\"id\":4,\"stationId\":729122004694863900}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 14:35:38');
INSERT INTO `sys_oper_log`
VALUES (379, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555600,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682281000,\"createTime\":1637738055842,\"stationList\":[729122004682281000,729122004694863900,729122004774555600],\"id\":5,\"stationId\":729122004694863900}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 15:14:15');
INSERT INTO `sys_oper_log`
VALUES (380, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555600,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682281000,\"createTime\":1637738376042,\"stationList\":[729122004682281000,729122004694863900,729122004774555600],\"id\":6,\"stationId\":729122004694863900}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 15:19:36');
INSERT INTO `sys_oper_log`
VALUES (381, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555600,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682281000,\"createTime\":1637739450658,\"stationList\":[729122004682281000,729122004694863900,729122004774555600],\"id\":7,\"stationId\":729122004694863900}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 15:37:30');
INSERT INTO `sys_oper_log`
VALUES (382, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555600,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682281000,\"createTime\":1637739483574,\"stationList\":[729122004682281000,729122004694863900,729122004774555600],\"id\":8,\"stationId\":729122004694863900}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 15:38:03');
INSERT INTO `sys_oper_log`
VALUES (383, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555649,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1637742567049,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"id\":9,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 16:29:27');
INSERT INTO `sys_oper_log`
VALUES (384, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122005063962625,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122005017825281,\"createTime\":1637744950797,\"stationList\":[729122005017825281,729122005051379713,729122005063962625],\"id\":10,\"stationId\":729122005051379713}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 17:09:10');
INSERT INTO `sys_oper_log`
VALUES (385, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004933939201,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004891996161,\"createTime\":1637744958075,\"stationList\":[729122004891996161,729122004925550593,729122004933939201],\"id\":11,\"stationId\":729122004925550593}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 17:09:18');
INSERT INTO `sys_oper_log`
VALUES (386, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122005063962625,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122005017825281,\"createTime\":1637744963561,\"stationList\":[729122005017825281,729122005051379713,729122005063962625],\"id\":12,\"stationId\":729122005051379713}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 17:09:23');
INSERT INTO `sys_oper_log`
VALUES (387, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004699058177,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1637744969012,\"stationList\":[729122004682280961,729122004694863873,729122004699058177],\"id\":13,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 17:09:29');
INSERT INTO `sys_oper_log`
VALUES (388, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555649,\"updateTime\":1637745053548,\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1637625600000,\"stationList\":[729122005017825281,729122005022019585,729122005026213889],\"id\":9,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 17:10:53');
INSERT INTO `sys_oper_log`
VALUES (389, '检修记录', 5, 'com.ruoyi.web.controller.repair.RepairRecordController.export()', 'POST', 1, 'admin', NULL,
        '/repair/record/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2021-11-24 17:13:11');
INSERT INTO `sys_oper_log`
VALUES (390, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"1\",\"orderNum\":\"11\",\"menuName\":\"转辙机-单机\",\"params\":{},\"parentId\":1092,\"isCache\":\"0\",\"path\":\"single\",\"component\":\"repair/record/single\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"repair:record:edit\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 17:24:32');
INSERT INTO `sys_oper_log`
VALUES (391, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"1\",\"icon\":\"#\",\"orderNum\":\"11\",\"menuName\":\"转辙机-单机\",\"params\":{},\"parentId\":1092,\"isCache\":\"0\",\"path\":\"single\",\"component\":\"repair/record/single\",\"children\":[],\"createTime\":1637745872000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1098,\"menuType\":\"C\",\"perms\":\"repair:record:single\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 17:24:51');
INSERT INTO `sys_oper_log`
VALUES (392, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1098', '127.0.0.1', '内网IP', '{menuId=1098}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-24 18:05:26');
INSERT INTO `sys_oper_log`
VALUES (393, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"检修状态\",\"params\":{},\"dictType\":\"repair_check_status\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 20:25:45');
INSERT INTO `sys_oper_log`
VALUES (394, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"repair_check_status\",\"dictLabel\":\"正常\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 20:26:12');
INSERT INTO `sys_oper_log`
VALUES (395, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"repair_check_status\",\"dictLabel\":\"调整\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 20:26:32');
INSERT INTO `sys_oper_log`
VALUES (396, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"repair_check_status\",\"dictLabel\":\"更换\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 20:26:45');
INSERT INTO `sys_oper_log`
VALUES (397, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL,
        '/tool/gen/6', '127.0.0.1', '内网IP', '{tableIds=6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-24 20:44:46');
INSERT INTO `sys_oper_log`
VALUES (398, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL,
        '/tool/gen/7', '127.0.0.1', '内网IP', '{tableIds=7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-24 20:44:57');
INSERT INTO `sys_oper_log`
VALUES (399, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP', 'repair_test,repair_table',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 20:45:01');
INSERT INTO `sys_oper_log`
VALUES (400, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-24 20:45:08');
INSERT INTO `sys_oper_log`
VALUES (401, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"orderNum\":\"11\",\"menuName\":\"测试内容列表\",\"params\":{},\"parentId\":1092,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"repair:test:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 20:51:21');
INSERT INTO `sys_oper_log`
VALUES (402, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"orderNum\":\"12\",\"menuName\":\"测试内容新增\",\"params\":{},\"parentId\":1092,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"repair:test:add\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 20:52:35');
INSERT INTO `sys_oper_log`
VALUES (403, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"orderNum\":\"13\",\"menuName\":\"测试内容编辑\",\"params\":{},\"parentId\":1092,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"repair:test:edit\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 20:53:21');
INSERT INTO `sys_oper_log`
VALUES (404, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"orderNum\":\"14\",\"menuName\":\"测试内容查询\",\"params\":{},\"parentId\":1092,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"repair:test:query\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 20:53:45');
INSERT INTO `sys_oper_log`
VALUES (405, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"orderNum\":\"15\",\"menuName\":\"测试内容删除\",\"params\":{},\"parentId\":1092,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"repair:test:remove\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-24 20:54:15');
INSERT INTO `sys_oper_log`
VALUES (406, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairTestMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairTestMapper.insertRepairTest-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_test\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1',
        '2021-11-24 23:19:11');
INSERT INTO `sys_oper_log`
VALUES (407, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\repair\\RepairTestMapper.xml]\r\n### The error may involve com.ruoyi.repair.mapper.RepairTestMapper.insertRepairTest-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into repair_test\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1',
        '2021-11-25 10:00:30');
INSERT INTO `sys_oper_log`
VALUES (408, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP', '{\"params\":{},\"recordId\":9,\"id\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 10:01:59');
INSERT INTO `sys_oper_log`
VALUES (409, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP', '{\"params\":{},\"recordId\":9}', NULL, 0, NULL, '2021-11-25 10:18:53');
INSERT INTO `sys_oper_log`
VALUES (410, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"1\",\"recordId\":9}', NULL, 0, NULL,
        '2021-11-25 10:19:51');
INSERT INTO `sys_oper_log`
VALUES (411, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"1\",\"recordId\":9}', NULL, 0, NULL,
        '2021-11-25 10:21:24');
INSERT INTO `sys_oper_log`
VALUES (412, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"1\",\"recordId\":9}', NULL, 0, NULL,
        '2021-11-25 10:23:41');
INSERT INTO `sys_oper_log`
VALUES (413, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"1\",\"recordId\":9}', NULL, 1, '',
        '2021-11-25 10:24:47');
INSERT INTO `sys_oper_log`
VALUES (414, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"1\",\"recordId\":9}', NULL, 1, '',
        '2021-11-25 10:25:32');
INSERT INTO `sys_oper_log`
VALUES (415, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"1\",\"recordId\":9}', NULL, 1, '',
        '2021-11-25 10:26:30');
INSERT INTO `sys_oper_log`
VALUES (416, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"1\",\"recordId\":9}', NULL, 0, NULL,
        '2021-11-25 10:27:16');
INSERT INTO `sys_oper_log`
VALUES (417, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"label\":\"CCC\",\"params\":{},\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":2,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":3,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":4,\"status\":\"0\"}],\"params\":{},\"type\":\"1\",\"recordId\":9}',
        NULL, 0, NULL, '2021-11-25 10:30:17');
INSERT INTO `sys_oper_log`
VALUES (418, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"label\":\"CCC\",\"params\":{},\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":5,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":6,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":7,\"status\":\"0\"}],\"params\":{},\"type\":\"1\",\"recordId\":9}',
        NULL, 0, NULL, '2021-11-25 10:30:44');
INSERT INTO `sys_oper_log`
VALUES (419, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":8,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":9,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":10,\"status\":\"0\"}],\"params\":{},\"type\":\"1\",\"recordId\":9}',
        NULL, 0, NULL, '2021-11-25 10:31:49');
INSERT INTO `sys_oper_log`
VALUES (420, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":3,\"id\":11,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":4,\"id\":12,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":5,\"id\":13,\"status\":\"0\"}],\"params\":{},\"type\":\"1\",\"recordId\":9}',
        NULL, 0, NULL, '2021-11-25 10:32:03');
INSERT INTO `sys_oper_log`
VALUES (421, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":14,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":15,\"status\":\"1\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":16,\"status\":\"1\"}],\"params\":{},\"type\":\"1\",\"recordId\":10}',
        NULL, 0, NULL, '2021-11-25 10:32:27');
INSERT INTO `sys_oper_log`
VALUES (422, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL,
        '/system/user/profile/avatar', '127.0.0.1', '内网IP', '',
        '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/11/25/800cb919-d497-4218-aba7-577fb496aed9.jpeg\",\"code\":200}',
        0, NULL, '2021-11-25 10:36:08');
INSERT INTO `sys_oper_log`
VALUES (423, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL,
        '/system/user/profile/avatar', '127.0.0.1', '内网IP', '',
        '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/11/25/408b4c30-bde5-4418-ab24-7494201ef514.jpeg\",\"code\":200}',
        0, NULL, '2021-11-25 10:36:29');
INSERT INTO `sys_oper_log`
VALUES (424, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL,
        '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1,
        'java.io.FileNotFoundException: C:\\Users\\1\\AppData\\Local\\Temp\\tomcat.8080.218723143880627970\\work\\Tomcat\\localhost\\ROOT\\upload_431d81e8_4235_4d92_bc12_8a19d2e6763f_00000000.tmp (系统找不到指定的文件。)',
        '2021-11-25 11:57:45');
INSERT INTO `sys_oper_log`
VALUES (425, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL,
        '/system/user/profile/avatar', '127.0.0.1', '内网IP', '',
        '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/11/25/edb7892d-693c-49a9-af01-d2e24f2eeff2.jpeg\",\"code\":200}',
        0, NULL, '2021-11-25 11:58:43');
INSERT INTO `sys_oper_log`
VALUES (426, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL,
        '/system/user/profile/avatar', '127.0.0.1', '内网IP', '',
        '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/11/25/cd729194-2ba4-4959-a9ad-87436ce551e7.jpeg\",\"code\":200}',
        0, NULL, '2021-11-25 13:24:18');
INSERT INTO `sys_oper_log`
VALUES (427, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL,
        '/system/user/profile/avatar', '127.0.0.1', '内网IP', '',
        '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/11/25/21d180e0-5cf1-47f1-b3b3-b357fd3d2c9c.jpeg\",\"code\":200}',
        0, NULL, '2021-11-25 14:33:34');
INSERT INTO `sys_oper_log`
VALUES (428, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL,
        '/system/user/profile/avatar', '127.0.0.1', '内网IP', '',
        '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/11/25/728edac7-3815-4e2f-ad5f-851a3b435831.jpeg\",\"code\":200}',
        0, NULL, '2021-11-25 15:35:18');
INSERT INTO `sys_oper_log`
VALUES (429, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL,
        '/system/user/profile/avatar', '127.0.0.1', '内网IP', '',
        '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/11/25/274cec9e-f7ad-4689-96df-6c161abaf48f.jpeg\",\"code\":200}',
        0, NULL, '2021-11-25 15:38:19');
INSERT INTO `sys_oper_log`
VALUES (430, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL,
        '/system/user/profile/avatar', '127.0.0.1', '内网IP', '',
        '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/11/25/42a726eb-4ffb-41d6-8d34-7a50a1f3f3bb.jpeg\",\"code\":200}',
        0, NULL, '2021-11-25 15:45:38');
INSERT INTO `sys_oper_log`
VALUES (431, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":3,\"id\":17,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":4,\"id\":18,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":5,\"id\":19,\"status\":\"0\"}],\"params\":{},\"type\":\"1\",\"recordId\":9}',
        NULL, 0, NULL, '2021-11-25 18:03:02');
INSERT INTO `sys_oper_log`
VALUES (432, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"文件上传\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"file:upload:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 18:10:46');
INSERT INTO `sys_oper_log`
VALUES (433, '检测', 5, 'com.ruoyi.web.controller.repair.RepairTableController.export()', 'POST', 1, 'admin', NULL,
        '/repair/table/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2021-11-25 18:15:48');
INSERT INTO `sys_oper_log`
VALUES (434, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL,
        '/system/user/profile/avatar', '127.0.0.1', '内网IP', '',
        '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/11/25/78b920cf-c9c0-4309-b4ee-9b5ad9af564e.jpeg\",\"code\":200}',
        0, NULL, '2021-11-25 18:42:37');
INSERT INTO `sys_oper_log`
VALUES (435, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL,
        '/system/user/profile/avatar', '127.0.0.1', '内网IP', '',
        '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/11/25/94f74c91-5080-4b41-8843-b9543d125c3b.jpeg\",\"code\":200}',
        0, NULL, '2021-11-25 18:45:06');
INSERT INTO `sys_oper_log`
VALUES (436, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":3,\"id\":20,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":4,\"id\":21,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":5,\"id\":22,\"status\":\"0\"}],\"params\":{},\"type\":\"1\",\"recordId\":9}',
        NULL, 0, NULL, '2021-11-25 19:05:43');
INSERT INTO `sys_oper_log`
VALUES (437, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":3,\"id\":23,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":4,\"id\":24,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":5,\"id\":25,\"status\":\"0\"}],\"params\":{},\"type\":\"1\",\"recordId\":9,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/348d2eed7f9640d19f93cd91b50ac4d7.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/b52e6b7a686448bbb920a54b0af395ec.jpg\"}',
        NULL, 0, NULL, '2021-11-25 19:26:46');
INSERT INTO `sys_oper_log`
VALUES (438, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":3,\"id\":26,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":4,\"id\":27,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":5,\"id\":28,\"status\":\"0\"}],\"params\":{},\"type\":\"1\",\"recordId\":9,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/932f23e11fed462cad3c9104fddf419c.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/f17c03f52f31431e91d119cf3053ba5f.jpg\"}',
        NULL, 0, NULL, '2021-11-25 19:28:21');
INSERT INTO `sys_oper_log`
VALUES (439, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":3,\"id\":29,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":4,\"id\":30,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":9,\"sortNo\":5,\"id\":31,\"status\":\"0\"}],\"params\":{},\"type\":\"1\",\"recordId\":9,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/c6f0950dbdf54831a3714cc3528d85c3.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/1fa3002baad5487297246bcf5b525372.jpg\"}',
        NULL, 0, NULL, '2021-11-25 19:29:25');
INSERT INTO `sys_oper_log`
VALUES (440, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":3,\"id\":32,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":4,\"id\":33,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":5,\"id\":34,\"status\":\"1\"}],\"params\":{},\"type\":\"1\",\"recordId\":10,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/bf36e42d1ba9467c8a7e9d47d2765b7c.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/a390f918d2064ae4986c2ef3aa7fbf2a.jpg\"}',
        NULL, 0, NULL, '2021-11-25 19:34:21');
INSERT INTO `sys_oper_log`
VALUES (441, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":3,\"id\":35,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":4,\"id\":36,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":5,\"id\":37,\"status\":\"1\"}],\"params\":{},\"type\":\"1\",\"recordId\":10,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/e921b0aa8ac144718b2bf8829c47b388.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/045cd3e83a6b472392f17d83b713bc67.jpg\"}',
        NULL, 0, NULL, '2021-11-25 19:35:47');
INSERT INTO `sys_oper_log`
VALUES (442, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":3,\"id\":38,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":4,\"id\":39,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":5,\"id\":40,\"status\":\"1\"}],\"params\":{},\"type\":\"1\",\"recordId\":10}',
        NULL, 0, NULL, '2021-11-25 20:01:56');
INSERT INTO `sys_oper_log`
VALUES (443, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":3,\"id\":41,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":4,\"id\":42,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":5,\"id\":43,\"status\":\"1\"}],\"params\":{},\"type\":\"1\",\"recordId\":10}',
        NULL, 0, NULL, '2021-11-25 20:02:10');
INSERT INTO `sys_oper_log`
VALUES (444, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":3,\"id\":44,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":4,\"id\":45,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":10,\"sortNo\":5,\"id\":46,\"status\":\"1\"}],\"params\":{},\"type\":\"1\",\"recordId\":10,\"file4\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/26a74aec56df42679e63f914f0922c28.jpg\"}',
        NULL, 0, NULL, '2021-11-25 20:02:58');
INSERT INTO `sys_oper_log`
VALUES (445, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122005001048065,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004891996161,\"createTime\":1637842189069,\"stationList\":[729122004891996161,729122004992659457,729122005001048065],\"id\":14,\"stationId\":729122004992659457}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 20:09:49');
INSERT INTO `sys_oper_log`
VALUES (446, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004963299329,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004891996161,\"createTime\":1637842194993,\"stationList\":[729122004891996161,729122004942327809,729122004963299329],\"id\":15,\"stationId\":729122004942327809}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 20:09:55');
INSERT INTO `sys_oper_log`
VALUES (447, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122005001048065,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004891996161,\"createTime\":1637842201700,\"stationList\":[729122004891996161,729122004992659457,729122005001048065],\"id\":16,\"stationId\":729122004992659457}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 20:10:01');
INSERT INTO `sys_oper_log`
VALUES (448, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004875218945,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1637842208955,\"stationList\":[729122004682280961,729122004854247425,729122004875218945],\"id\":17,\"stationId\":729122004854247425}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 20:10:08');
INSERT INTO `sys_oper_log`
VALUES (449, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555649,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1637842214628,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"id\":18,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 20:10:14');
INSERT INTO `sys_oper_log`
VALUES (450, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004862636033,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1637845127602,\"stationList\":[729122004682280961,729122004854247425,729122004862636033],\"id\":19,\"stationId\":729122004854247425}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 20:58:47');
INSERT INTO `sys_oper_log`
VALUES (451, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004757778433,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1637846044754,\"stationList\":[729122004682280961,729122004694863873,729122004757778433],\"id\":20,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 21:14:04');
INSERT INTO `sys_oper_log`
VALUES (452, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004862636033,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1637846822381,\"stationList\":[729122004682280961,729122004854247425,729122004862636033],\"id\":21,\"stationId\":729122004854247425}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 21:27:02');
INSERT INTO `sys_oper_log`
VALUES (453, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122005063962625,\"updateTime\":1637848933626,\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"routeId\":729122005017825281,\"createTime\":1637683200000,\"file4\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/26a74aec56df42679e63f914f0922c28.jpg\",\"stationList\":[729122005017825281,729122005051379713,729122005063962625],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/e921b0aa8ac144718b2bf8829c47b388.jpg\",\"file3\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/045cd3e83a6b472392f17d83b713bc67.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/045cd3e83a6b472392f17d83b713bc67.jpg\",\"id\":10,\"stationId\":729122005051379713}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 22:02:13');
INSERT INTO `sys_oper_log`
VALUES (454, '检修记录', 3, 'com.ruoyi.web.controller.repair.RepairRecordController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/record/10', '127.0.0.1', '内网IP', '{ids=10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-25 22:02:20');
INSERT INTO `sys_oper_log`
VALUES (455, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":11,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":47,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":11,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":48,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":11,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":49,\"status\":\"0\"}],\"params\":{},\"type\":\"1\",\"recordId\":11,\"file4\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/1a2a34bf39bc4225ba66be4da8cc1909.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/a6f641b94dcb4144a222e9bb05cc1a3d.jpg\"}',
        NULL, 0, NULL, '2021-11-25 22:02:31');
INSERT INTO `sys_oper_log`
VALUES (456, '检测', 1, 'com.ruoyi.web.controller.repair.RepairTableController.add()', 'POST', 1, 'admin', NULL,
        '/repair/table', '127.0.0.1', '内网IP',
        '{\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179618,\"id\":8,\"label\":\"AAA\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 23:12:59');
INSERT INTO `sys_oper_log`
VALUES (457, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"1\",\"recordId\":11,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":50,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":11,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":51,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":11,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":52,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":11,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":53,\"status\":\"0\"}],\"params\":{},\"type\":\"1\",\"recordId\":11,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211125/ea7447a6a85c4856a127d22cf3da5ac1.jpg\"}',
        NULL, 0, NULL, '2021-11-25 23:15:19');
INSERT INTO `sys_oper_log`
VALUES (458, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0,
        NULL, '2021-11-25 23:16:32');
INSERT INTO `sys_oper_log`
VALUES (459, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/role', '127.0.0.1', '内网IP',
        '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1637217272000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[3,1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 23:16:48');
INSERT INTO `sys_oper_log`
VALUES (460, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-25 23:17:05');
INSERT INTO `sys_oper_log`
VALUES (461, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"code\",\"orderNum\":\"2\",\"menuName\":\"代码生成\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"gen\",\"component\":\"tool/gen/index\",\"children\":[],\"createTime\":1637217272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":115,\"menuType\":\"C\",\"perms\":\"tool:gen:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-25 23:17:33');
INSERT INTO `sys_oper_log`
VALUES (462, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', NULL,
        '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 123456',
        '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2021-11-27 08:04:01');
INSERT INTO `sys_oper_log`
VALUES (463, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122005063962625,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122005017825281,\"createTime\":1638012951683,\"stationList\":[729122005017825281,729122005051379713,729122005063962625],\"id\":22,\"stationId\":729122005051379713}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 19:35:51');
INSERT INTO `sys_oper_log`
VALUES (464, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555649,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638012983782,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"id\":23,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 19:36:23');
INSERT INTO `sys_oper_log`
VALUES (465, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555649,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638018485508,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"id\":24,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 21:08:05');
INSERT INTO `sys_oper_log`
VALUES (466, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555649,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638018504988,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"id\":25,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 21:08:25');
INSERT INTO `sys_oper_log`
VALUES (467, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555649,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638018515325,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"id\":26,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 21:08:35');
INSERT INTO `sys_oper_log`
VALUES (468, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004862636033,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638018909289,\"stationList\":[729122004682280961,729122004854247425,729122004862636033],\"id\":29,\"stationId\":729122004854247425}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 21:15:09');
INSERT INTO `sys_oper_log`
VALUES (469, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004862636033,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638018909289,\"stationList\":[729122004682280961,729122004854247425,729122004862636033],\"id\":30,\"stationId\":729122004854247425}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 21:15:09');
INSERT INTO `sys_oper_log`
VALUES (470, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122005189791745,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122005017825281,\"createTime\":1638019345225,\"stationList\":[729122005017825281,729122005110099969,729122005189791745],\"id\":31,\"stationId\":729122005110099969}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 21:22:25');
INSERT INTO `sys_oper_log`
VALUES (471, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004862636033,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638019644166,\"stationList\":[729122004682280961,729122004854247425,729122004862636033],\"id\":32,\"stationId\":729122004854247425}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 21:27:24');
INSERT INTO `sys_oper_log`
VALUES (472, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004862636033,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638019707152,\"stationList\":[729122004682280961,729122004854247425,729122004862636033],\"id\":33,\"stationId\":729122004854247425}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 21:28:44');
INSERT INTO `sys_oper_log`
VALUES (473, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL,
        '/system/role', '127.0.0.1', '内网IP',
        '{\"flag\":false,\"roleId\":3,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"system\",\"roleName\":\"系统测试员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,1061,1062,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1078,1076,1077,1092,1093,1094,1095,1096,1097,1099,1100,1101,1102,1103,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116,1104],\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 21:30:54');
INSERT INTO `sys_oper_log`
VALUES (474, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004699058177,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638020411400,\"stationList\":[729122004682280961,729122004694863873,729122004699058177],\"id\":34,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 21:40:11');
INSERT INTO `sys_oper_log`
VALUES (475, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"1\",\"recordId\":34,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":54,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"1\",\"recordId\":34,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":55,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"1\",\"recordId\":34,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":56,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"1\",\"recordId\":34,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":57,\"status\":\"2\"}],\"params\":{},\"type\":\"1\",\"recordId\":34,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/3243b75003734195bfe62477b116d8ff.png\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/2e2b39b4a0a74a79ab926f9343dda2cc.png\"}',
        NULL, 0, NULL, '2021-11-27 21:40:42');
INSERT INTO `sys_oper_log`
VALUES (476, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"recordId\":34,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":58,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"recordId\":34,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":59,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"0\",\"recordId\":34,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":60,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"0\",\"recordId\":34,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":61,\"status\":\"2\"}],\"params\":{},\"type\":\"0\",\"recordId\":34}',
        NULL, 0, NULL, '2021-11-27 21:45:34');
INSERT INTO `sys_oper_log`
VALUES (477, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"recordId\":33,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":62,\"status\":\"1\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"recordId\":33,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":63,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"0\",\"recordId\":33,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":64,\"status\":\"1\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"0\",\"recordId\":33,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":65,\"status\":\"1\"}],\"params\":{},\"type\":\"0\",\"recordId\":33,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\"}',
        NULL, 0, NULL, '2021-11-27 22:06:44');
INSERT INTO `sys_oper_log`
VALUES (478, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"params\":{},\"type\":\"0\",\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\"}',
        '{\"msg\":\"新增测试记录失败\",\"code\":500}', 0, NULL, '2021-11-27 22:11:08');
INSERT INTO `sys_oper_log`
VALUES (479, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"params\":{},\"type\":\"0\",\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\"}',
        '{\"msg\":\"新增测试记录失败\",\"code\":500}', 0, NULL, '2021-11-27 22:11:30');
INSERT INTO `sys_oper_log`
VALUES (480, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"params\":{},\"type\":\"0\",\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\"}',
        '{\"msg\":\"新增测试记录失败\",\"code\":500}', 0, NULL, '2021-11-27 22:30:27');
INSERT INTO `sys_oper_log`
VALUES (481, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"params\":{},\"type\":\"0\",\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\"}',
        '{\"msg\":\"新增测试记录失败\",\"code\":500}', 0, NULL, '2021-11-27 22:30:59');
INSERT INTO `sys_oper_log`
VALUES (482, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"params\":{},\"type\":\"0\",\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\"}',
        '{\"msg\":\"新增测试记录失败\",\"code\":500}', 0, NULL, '2021-11-27 22:32:10');
INSERT INTO `sys_oper_log`
VALUES (483, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairTestController.add()', 'POST', 1, 'admin', NULL,
        '/repair/test', '127.0.0.1', '内网IP',
        '{\"backMachineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"recordId\":34,\"sortNo\":1,\"id\":66,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"recordId\":34,\"sortNo\":3,\"id\":67,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"type\":\"0\",\"recordId\":34,\"sortNo\":4,\"id\":68,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"type\":\"0\",\"recordId\":34,\"sortNo\":5,\"id\":69,\"status\":\"2\"}],\"params\":{},\"type\":\"0\",\"recordId\":34}',
        NULL, 0, NULL, '2021-11-27 22:33:12');
INSERT INTO `sys_oper_log`
VALUES (484, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"params\":{},\"type\":\"0\",\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"sortNo\":1,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"type\":\"0\",\"sortNo\":1,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"sortNo\":1,\"status\":\"2\"}]}',
        '{\"msg\":\"新增测试记录失败\",\"code\":500}', 0, NULL, '2021-11-27 22:39:53');
INSERT INTO `sys_oper_log`
VALUES (485, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555649,\"params\":{},\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638024054875,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"id\":35,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 22:40:54');
INSERT INTO `sys_oper_log`
VALUES (486, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555649,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638024254946,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"id\":36,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"recordId\":36,\"sortNo\":1,\"id\":70,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"type\":\"0\",\"recordId\":36,\"sortNo\":1,\"id\":71,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"recordId\":36,\"sortNo\":1,\"id\":72,\"status\":\"2\"}],\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 22:44:51');
INSERT INTO `sys_oper_log`
VALUES (487, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555649,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638024918587,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"id\":37,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"recordId\":37,\"sortNo\":1,\"id\":73,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"type\":\"0\",\"recordId\":37,\"sortNo\":1,\"id\":74,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"recordId\":37,\"sortNo\":1,\"id\":75,\"status\":\"2\"}],\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 22:55:18');
INSERT INTO `sys_oper_log`
VALUES (488, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":\"1\",\"menuName\":\"测试记录内容\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"table\",\"component\":\"repair/table/index\",\"children\":[],\"createTime\":1637247701000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1062,\"menuType\":\"C\",\"perms\":\"repair:table:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 11:20:10');
INSERT INTO `sys_oper_log`
VALUES (489, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210319,\"params\":{},\"type\":\"1\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638172476292,\"stationList\":[163816732210249,163816732210259,163816732210319],\"id\":38,\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 15:54:36');
INSERT INTO `sys_oper_log`
VALUES (490, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"params\":{},\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/860916e86a1e43b799845b085ef5d999.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/5411987e44ed4608b2f5f2c46671bd25.jpg\",\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":8,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":5,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":7,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":6,\"status\":\"2\"}]}',
        NULL, 1, '', '2021-11-29 17:46:43');
INSERT INTO `sys_oper_log`
VALUES (491, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"params\":{},\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/19e56e78e6eb490692e2cb29b26b89c4.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/2ee0ac82843d4cb8a0a0ef4d1e62b9de.jpg\",\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":8,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":5,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":7,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":6,\"status\":\"2\"}]}',
        NULL, 1, '', '2021-11-29 17:48:51');
INSERT INTO `sys_oper_log`
VALUES (492, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"params\":{},\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/ac920ba99a8a40fa9aa92e0a9264cf5f.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/608bfdc429ef4f90862f84eab794b3b1.jpg\",\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":8,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":5,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":7,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":6,\"status\":\"2\"}]}',
        '{\"msg\":\"新增测试记录失败\",\"code\":500}', 0, NULL, '2021-11-29 17:54:21');
INSERT INTO `sys_oper_log`
VALUES (493, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"params\":{},\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/ac920ba99a8a40fa9aa92e0a9264cf5f.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/608bfdc429ef4f90862f84eab794b3b1.jpg\",\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":8,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":5,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":7,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":6,\"status\":\"2\"}]}',
        '{\"msg\":\"新增测试记录失败\",\"code\":500}', 0, NULL, '2021-11-29 17:59:28');
INSERT INTO `sys_oper_log`
VALUES (494, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"params\":{},\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/ac920ba99a8a40fa9aa92e0a9264cf5f.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/608bfdc429ef4f90862f84eab794b3b1.jpg\",\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":8,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":5,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":7,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":6,\"status\":\"2\"}]}',
        '{\"msg\":\"新增测试记录失败\",\"code\":500}', 0, NULL, '2021-11-29 18:00:18');
INSERT INTO `sys_oper_log`
VALUES (495, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"params\":{},\"createBy\":\"admin\",\"createTime\":1638180038823,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/ac920ba99a8a40fa9aa92e0a9264cf5f.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/608bfdc429ef4f90862f84eab794b3b1.jpg\",\"id\":39,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":39,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":76,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":39,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":77,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":39,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":78,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":39,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":79,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 18:00:40');
INSERT INTO `sys_oper_log`
VALUES (496, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"params\":{},\"createBy\":\"admin\",\"createTime\":1638180456547,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/2c69a17cbeb24b329bf278eb85f659e6.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/3415f2bb2fd441c0bef9b14717c1694a.jpg\",\"id\":40,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":40,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":80,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":40,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":81,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":40,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":82,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":40,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":83,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 18:07:36');
INSERT INTO `sys_oper_log`
VALUES (497, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"params\":{},\"createBy\":\"admin\",\"createTime\":1638180564942,\"id\":41,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":41,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":84,\"status\":\"\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":41,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":85,\"status\":\"\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":41,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":86,\"status\":\"\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":41,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":87,\"status\":\"\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 18:09:24');
INSERT INTO `sys_oper_log`
VALUES (498, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"params\":{},\"createBy\":\"admin\",\"createTime\":1638180649481,\"id\":42,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":42,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":88,\"status\":\"\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":42,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":89,\"status\":\"\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":42,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":90,\"status\":\"\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":42,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":91,\"status\":\"\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 18:10:49');
INSERT INTO `sys_oper_log`
VALUES (499, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"params\":{},\"createBy\":\"admin\",\"createTime\":1638180812329,\"id\":43,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":43,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":92,\"status\":\"\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":43,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":93,\"status\":\"\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":43,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":94,\"status\":\"\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":43,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":95,\"status\":\"\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 18:13:32');
INSERT INTO `sys_oper_log`
VALUES (500, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"params\":{},\"createBy\":\"admin\",\"createTime\":1638181312211,\"stationList\":[],\"id\":44,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":44,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":96,\"status\":\"\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":44,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":97,\"status\":\"\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":44,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":98,\"status\":\"\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":44,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":99,\"status\":\"\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 18:21:52');
INSERT INTO `sys_oper_log`
VALUES (501, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638181553688,\"stationList\":[163816732210249,163816732210259,163816732210309],\"id\":45,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"recordId\":45,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":100,\"status\":\"\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"recordId\":45,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":101,\"status\":\"\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"0\",\"recordId\":45,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":102,\"status\":\"\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"0\",\"recordId\":45,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":103,\"status\":\"\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 18:25:53');
INSERT INTO `sys_oper_log`
VALUES (502, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638181704607,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/8b332f83c72d4500a019248cda0f723b.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/24d50522bfe6446e8e055db638f98422.jpg\",\"id\":46,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"recordId\":46,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":104,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"recordId\":46,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":105,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"0\",\"recordId\":46,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":106,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"0\",\"recordId\":46,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":107,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 18:28:24');
INSERT INTO `sys_oper_log`
VALUES (503, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638181812163,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/d934cf7b651f4a2299a0340d38f03211.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/82d6a19df58b4fa7a4ab74d1c051466d.jpg\",\"id\":47,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"recordId\":47,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":108,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"recordId\":47,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":109,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"0\",\"recordId\":47,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":110,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"0\",\"recordId\":47,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":111,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 18:30:12');
INSERT INTO `sys_oper_log`
VALUES (504, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638184658215,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/2c2c70728400465b82235763312b176c.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/858090273662454c84b0bccd7d81c6c5.jpg\",\"id\":48,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"recordId\":48,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":112,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"recordId\":48,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":113,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"0\",\"recordId\":48,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":114,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"0\",\"recordId\":48,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":115,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 19:17:38');
INSERT INTO `sys_oper_log`
VALUES (505, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638184701165,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/acae9f3840294be496bf03ba53921c3c.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/7504ccf2679b48c9bfe486620a6e14e5.jpg\",\"id\":49,\"fontMachineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"recordId\":49,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":116,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"recordId\":49,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":117,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"0\",\"recordId\":49,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":118,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"0\",\"recordId\":49,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":119,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 19:18:21');
INSERT INTO `sys_oper_log`
VALUES (506, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638184985413,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/20d463bf147d49a385d2770deff63a43.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/2baf13889196400a996840570bf7bb09.jpg\",\"id\":50,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"recordId\":50,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":120,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"recordId\":50,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":121,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"0\",\"recordId\":50,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":122,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"0\",\"recordId\":50,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":123,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 19:23:05');
INSERT INTO `sys_oper_log`
VALUES (507, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638185040196,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/bd6f2aeb9b514dfa8744eb57d4d10a64.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/051359406e6544bd92fecb8deab2f5cc.jpg\",\"id\":51,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"type\":\"0\",\"recordId\":51,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":124,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"type\":\"0\",\"recordId\":51,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":125,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"type\":\"0\",\"recordId\":51,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":126,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"type\":\"0\",\"recordId\":51,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":127,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 19:24:00');
INSERT INTO `sys_oper_log`
VALUES (508, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"repair_machine_type\",\"params\":{},\"dictType\":\"前后机\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 19:47:14');
INSERT INTO `sys_oper_log`
VALUES (509, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"createTime\":1638186434000,\"updateBy\":\"admin\",\"dictName\":\"前后机\",\"dictId\":16,\"params\":{},\"dictType\":\"repair_machine_type\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 19:47:33');
INSERT INTO `sys_oper_log`
VALUES (510, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"front\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"repair_machine_type\",\"dictLabel\":\"前机\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"前机\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 19:48:00');
INSERT INTO `sys_oper_log`
VALUES (511, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"repair_machine_type\",\"dictLabel\":\"后机\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 19:48:13');
INSERT INTO `sys_oper_log`
VALUES (512, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"repair_machine_type\",\"dictLabel\":\"前机\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"前机\",\"createTime\":1638186480000,\"dictCode\":37,\"updateBy\":\"admin\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 19:48:32');
INSERT INTO `sys_oper_log`
VALUES (513, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"1\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638186851494,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/22d63344c24c4d7e87cdffb175081665.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/244f4132cd0d4b48a7fb1b097aacc0b2.jpg\",\"id\":52,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":52,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":128,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":52,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":129,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":52,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":130,\"status\":\"1\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":52,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":131,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 19:54:11');
INSERT INTO `sys_oper_log`
VALUES (514, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"1\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638186972288,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/62ca0e7d4d1048bebe72ba50e3fd9473.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211129/5371bb14839b4766b924ced8a9c3ba06.jpg\",\"id\":53,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":53,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":132,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":53,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":133,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":53,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":134,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":53,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":135,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 19:56:12');
INSERT INTO `sys_oper_log`
VALUES (515, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638191128467,\"stationList\":[163816732210249,163816732210259,163816732210309],\"id\":54,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":54,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":136,\"status\":\"\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":54,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":137,\"status\":\"\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":54,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":138,\"status\":\"\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":54,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":139,\"status\":\"\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-29 21:05:28');
INSERT INTO `sys_oper_log`
VALUES (516, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638242584401,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/dd7880ce10be4dde9b3a79e74b3b12c4.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/351143afeb4245e0b428192855e949c5.jpg\",\"id\":55,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":55,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":140,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":55,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":141,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":55,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":142,\"status\":\"1\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":55,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":143,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:23:04');
INSERT INTO `sys_oper_log`
VALUES (517, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin',
        NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '3 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-30 11:23:42');
INSERT INTO `sys_oper_log`
VALUES (518, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638242776928,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/dd7880ce10be4dde9b3a79e74b3b12c4.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/351143afeb4245e0b428192855e949c5.jpg\",\"id\":56,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":56,\"sortNo\":1,\"id\":144,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":56,\"sortNo\":3,\"id\":145,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":56,\"sortNo\":4,\"id\":146,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":56,\"sortNo\":5,\"id\":147,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:26:16');
INSERT INTO `sys_oper_log`
VALUES (519, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638242798997,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/dd7880ce10be4dde9b3a79e74b3b12c4.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/351143afeb4245e0b428192855e949c5.jpg\",\"id\":57,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":57,\"sortNo\":1,\"id\":148,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":57,\"sortNo\":3,\"id\":149,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":57,\"sortNo\":4,\"id\":150,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":57,\"sortNo\":5,\"id\":151,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:26:39');
INSERT INTO `sys_oper_log`
VALUES (520, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638243012455,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/dd7880ce10be4dde9b3a79e74b3b12c4.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/351143afeb4245e0b428192855e949c5.jpg\",\"id\":58,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":58,\"sortNo\":1,\"id\":152,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":58,\"sortNo\":3,\"id\":153,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":58,\"sortNo\":4,\"id\":154,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":58,\"sortNo\":5,\"id\":155,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:30:12');
INSERT INTO `sys_oper_log`
VALUES (521, '检修记录', 3, 'com.ruoyi.web.controller.repair.RepairRecordController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/record/57,56,55', '127.0.0.1', '内网IP', '{ids=57,56,55}', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-11-30 11:33:14');
INSERT INTO `sys_oper_log`
VALUES (522, '检修记录', 3, 'com.ruoyi.web.controller.repair.RepairRecordController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/record/58', '127.0.0.1', '内网IP', '{ids=58}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-30 11:33:20');
INSERT INTO `sys_oper_log`
VALUES (523, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638243226274,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/65edcec0ac3c40b8bc49358668671513.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/e62b9a9acb75422eb2d4f5e1beceb0c2.jpg\",\"id\":59,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":59,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":156,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":59,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":157,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":59,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":158,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":59,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":159,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:33:46');
INSERT INTO `sys_oper_log`
VALUES (524, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638243423996,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/65edcec0ac3c40b8bc49358668671513.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/e62b9a9acb75422eb2d4f5e1beceb0c2.jpg\",\"id\":60,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":60,\"sortNo\":1,\"id\":160,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":60,\"sortNo\":3,\"id\":161,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":60,\"sortNo\":4,\"id\":162,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":60,\"sortNo\":5,\"id\":163,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:37:04');
INSERT INTO `sys_oper_log`
VALUES (525, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638243770862,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/65edcec0ac3c40b8bc49358668671513.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/e62b9a9acb75422eb2d4f5e1beceb0c2.jpg\",\"id\":61,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":61,\"sortNo\":1,\"id\":164,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":61,\"sortNo\":3,\"id\":165,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":61,\"sortNo\":4,\"id\":166,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":61,\"sortNo\":5,\"id\":167,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:42:50');
INSERT INTO `sys_oper_log`
VALUES (526, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638243899934,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/dd601da9dc1546d483e0010fecfa0013.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/1a90ec21931743efa5c9f1b1b6c1f410.jpg\",\"id\":62,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":62,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":168,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":62,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":169,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":62,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":170,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":62,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":171,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:44:59');
INSERT INTO `sys_oper_log`
VALUES (527, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638243926002,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/dd601da9dc1546d483e0010fecfa0013.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/1a90ec21931743efa5c9f1b1b6c1f410.jpg\",\"id\":63,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":63,\"sortNo\":1,\"id\":172,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":63,\"sortNo\":3,\"id\":173,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":63,\"sortNo\":4,\"id\":174,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":63,\"sortNo\":5,\"id\":175,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:45:26');
INSERT INTO `sys_oper_log`
VALUES (528, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638244077741,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/83ed88c47e194f138a7b4e4212fd027a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/6eecb33f29634320b491be08fe4e6bea.jpg\",\"id\":64,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":64,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":176,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":64,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":177,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":64,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":178,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":64,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":179,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:47:57');
INSERT INTO `sys_oper_log`
VALUES (529, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638244089372,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/83ed88c47e194f138a7b4e4212fd027a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/6eecb33f29634320b491be08fe4e6bea.jpg\",\"id\":65,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":65,\"sortNo\":1,\"id\":180,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":65,\"sortNo\":3,\"id\":181,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":65,\"sortNo\":4,\"id\":182,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":65,\"sortNo\":5,\"id\":183,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:48:09');
INSERT INTO `sys_oper_log`
VALUES (530, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638244148459,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/b79ecba94f4b49259b52de949c570421.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/28f51b355d98418f9696b7a181b43a8b.jpg\",\"id\":66,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":66,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":184,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":66,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":185,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":66,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":186,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":66,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":187,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:49:08');
INSERT INTO `sys_oper_log`
VALUES (531, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638244159939,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/b79ecba94f4b49259b52de949c570421.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/28f51b355d98418f9696b7a181b43a8b.jpg\",\"id\":67,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":67,\"sortNo\":1,\"id\":188,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":67,\"sortNo\":3,\"id\":189,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":67,\"sortNo\":4,\"id\":190,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":67,\"sortNo\":5,\"id\":191,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:49:19');
INSERT INTO `sys_oper_log`
VALUES (532, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638244263570,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/8c9fa66d032e475ba11306bf626911a4.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/b9833aa0e6e04ded87a9ab369972f80d.jpg\",\"id\":68,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":68,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":192,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":68,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":193,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":68,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":194,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":68,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":195,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:51:03');
INSERT INTO `sys_oper_log`
VALUES (533, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638244277004,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/8c9fa66d032e475ba11306bf626911a4.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/b9833aa0e6e04ded87a9ab369972f80d.jpg\",\"id\":69,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":69,\"sortNo\":1,\"id\":196,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":69,\"sortNo\":3,\"id\":197,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":69,\"sortNo\":4,\"id\":198,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":69,\"sortNo\":5,\"id\":199,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:51:17');
INSERT INTO `sys_oper_log`
VALUES (534, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638244330828,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/121f9e1f97ee4784b22238f1baecd183.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/5fa77fb56c864421b05893467ff7bec8.jpg\",\"id\":70,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":70,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":200,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":70,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":201,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":70,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":202,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":70,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":203,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:52:10');
INSERT INTO `sys_oper_log`
VALUES (535, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638244343443,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/121f9e1f97ee4784b22238f1baecd183.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/5fa77fb56c864421b05893467ff7bec8.jpg\",\"id\":71,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":71,\"sortNo\":1,\"id\":204,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":71,\"sortNo\":3,\"id\":205,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":71,\"sortNo\":4,\"id\":206,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":71,\"sortNo\":5,\"id\":207,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:52:23');
INSERT INTO `sys_oper_log`
VALUES (536, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638244580879,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/c6d1090a44e048f6b173eb4d839af979.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/48b9d9873c1546579fd578cbf9aa024f.jpg\",\"id\":72,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":72,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":208,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":72,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":209,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":72,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":210,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":72,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":211,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:56:20');
INSERT INTO `sys_oper_log`
VALUES (537, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"updateTime\":1638244591252,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638244591252,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/c6d1090a44e048f6b173eb4d839af979.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/48b9d9873c1546579fd578cbf9aa024f.jpg\",\"id\":72,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":72,\"sortNo\":1,\"id\":212,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":72,\"sortNo\":3,\"id\":213,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":72,\"sortNo\":4,\"id\":214,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":72,\"sortNo\":5,\"id\":215,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:56:31');
INSERT INTO `sys_oper_log`
VALUES (538, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638244743808,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/7ec2f516555d42abb325e255f3ce4869.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/7ba95569a61d43dd8f1e44066b98b84c.jpg\",\"id\":73,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":73,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":216,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":73,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":217,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":73,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":218,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":73,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":219,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 11:59:03');
INSERT INTO `sys_oper_log`
VALUES (539, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"updateTime\":1638244805646,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638244805646,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/7ec2f516555d42abb325e255f3ce4869.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/7ba95569a61d43dd8f1e44066b98b84c.jpg\",\"id\":73,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":73,\"sortNo\":1,\"id\":220,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":73,\"sortNo\":3,\"id\":221,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":73,\"sortNo\":4,\"id\":222,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":73,\"sortNo\":5,\"id\":223,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 12:00:13');
INSERT INTO `sys_oper_log`
VALUES (540, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"1\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638248884483,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/fe98ea5ff3e0400c96c170ce14f809ce.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/7a4c5a01629a45b8adc391a28c130683.jpg\",\"id\":74,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":74,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":224,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":74,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":225,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":74,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":226,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":74,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":227,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:08:04');
INSERT INTO `sys_oper_log`
VALUES (541, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"updateTime\":1638248896120,\"delFlag\":\"0\",\"params\":{},\"type\":\"1\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638248896120,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/fe98ea5ff3e0400c96c170ce14f809ce.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/7a4c5a01629a45b8adc391a28c130683.jpg\",\"id\":74,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":74,\"sortNo\":1,\"id\":228,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":74,\"sortNo\":3,\"id\":229,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":74,\"sortNo\":4,\"id\":230,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":74,\"sortNo\":5,\"id\":231,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:08:16');
INSERT INTO `sys_oper_log`
VALUES (542, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638249078752,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/c932e08a9da84fba8a8f95d025590747.png\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/e5741729fc984f6b8226094ecff7e001.png\",\"id\":75,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":75,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":232,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":75,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":233,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":75,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":234,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":75,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":235,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:11:18');
INSERT INTO `sys_oper_log`
VALUES (543, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"updateTime\":1638249089481,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638249089481,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/c932e08a9da84fba8a8f95d025590747.png\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/e5741729fc984f6b8226094ecff7e001.png\",\"id\":75,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":75,\"sortNo\":1,\"id\":236,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":75,\"sortNo\":3,\"id\":237,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":75,\"sortNo\":4,\"id\":238,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":75,\"sortNo\":5,\"id\":239,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:11:29');
INSERT INTO `sys_oper_log`
VALUES (544, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"updateTime\":1638249112015,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638249112015,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/eec48e03dbcb44ab9f89937332376f37.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/9b2e8555ab894670a87d200b6bd18715.jpg\",\"id\":75,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":75,\"sortNo\":1,\"id\":240,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":75,\"sortNo\":3,\"id\":241,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":75,\"sortNo\":4,\"id\":242,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":75,\"sortNo\":5,\"id\":243,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:11:52');
INSERT INTO `sys_oper_log`
VALUES (545, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"updateTime\":1638249562263,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638249562263,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/eec48e03dbcb44ab9f89937332376f37.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/9b2e8555ab894670a87d200b6bd18715.jpg\",\"id\":75,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":75,\"sortNo\":1,\"id\":244,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":75,\"sortNo\":3,\"id\":245,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":75,\"sortNo\":4,\"id\":246,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":75,\"sortNo\":5,\"id\":247,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:19:22');
INSERT INTO `sys_oper_log`
VALUES (546, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210819,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210739,\"createTime\":1638249906212,\"stationList\":[163816732210739,163816732210799,163816732210819],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/7b26ce2c2ac54975854fd03498fbade0.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/b7a02eae45104f4bbbb9741ed94c6570.jpg\",\"id\":76,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":76,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":248,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":76,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":249,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":76,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":250,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":76,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":251,\"status\":\"2\"}],\"stationId\":163816732210799}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:25:06');
INSERT INTO `sys_oper_log`
VALUES (547, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"1\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638250211916,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/8a731c8e0e484038b9503482e2deeade.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/c97944338bfa42fcacdabe5284db8fdc.jpg\",\"id\":77,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":77,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":252,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":77,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":253,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":77,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":254,\"status\":\"1\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":77,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":255,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:30:11');
INSERT INTO `sys_oper_log`
VALUES (548, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"roles\":[{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"system\",\"roleName\":\"系统测试员\",\"status\":\"0\"}],\"phonenumber\":\"17805250021\",\"admin\":false,\"loginDate\":1638072997000,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"1016241535@qq.com\",\"nickName\":\"吴正国\",\"sex\":\"0\",\"deptId\":104,\"avatar\":\"\",\"dept\":{\"deptName\":\"市场部门\",\"leader\":\"若依\",\"deptId\":104,\"orderNum\":\"2\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"wzg\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":1637220591000,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:30:37');
INSERT INTO `sys_oper_log`
VALUES (549, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin',
        NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '2 [2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-11-30 13:30:49');
INSERT INTO `sys_oper_log`
VALUES (550, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210549,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210509,\"createTime\":1638250954408,\"stationList\":[163816732210509,163816732210519,163816732210549],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/1f5245a111404db887a3ffec5ba84ab9.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/2c396a81e2e24b25ade6683cb9df522e.jpg\",\"id\":78,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":78,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":256,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":78,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":257,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":78,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":258,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":78,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":259,\"status\":\"2\"}],\"stationId\":163816732210519}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:42:34');
INSERT INTO `sys_oper_log`
VALUES (551, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"1\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638251554735,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/3295c85cfcc64b279f3cf9b4a538d95f.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/4c3e393ca0d844f8b192a16a6540054b.jpg\",\"id\":79,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":79,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":260,\"status\":\"1\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":79,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":261,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":79,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":262,\"status\":\"1\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":79,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":263,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:52:34');
INSERT INTO `sys_oper_log`
VALUES (552, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638251745906,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/3ea1d709d4f74c0eb62d24b387aafc38.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/06083493a4bb47f188598951af1f5571.jpg\",\"id\":80,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":80,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":264,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":80,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":265,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":80,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":266,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":80,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":267,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:55:45');
INSERT INTO `sys_oper_log`
VALUES (553, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638251856809,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/15ebd0cae06e44f690413bb55f2c531e.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/03e1b630f5c345ba8ddb15afa7390fed.jpg\",\"id\":81,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":81,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":268,\"status\":\"1\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":81,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":269,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":81,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":270,\"status\":\"1\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":81,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":271,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:57:36');
INSERT INTO `sys_oper_log`
VALUES (554, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638251956411,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/091930a7cae940a7968924d3415cc0e9.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/8c573c285e234f7a93826cd868203421.jpg\",\"id\":82,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":82,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":272,\"status\":\"1\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":82,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":273,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":82,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":274,\"status\":\"1\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":82,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":275,\"status\":\"1\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 13:59:16');
INSERT INTO `sys_oper_log`
VALUES (555, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210549,\"params\":{},\"type\":\"1\",\"createBy\":\"admin\",\"routeId\":163816732210509,\"createTime\":1638260484614,\"stationList\":[163816732210509,163816732210519,163816732210549],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/f03e4823db5c49e1b72467ba78a9efa4.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/70a8dba5c85844bcaf381c49a0fe79bf.jpg\",\"id\":83,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":83,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":1,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":83,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":2,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":83,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":3,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":83,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":4,\"status\":\"2\"}],\"stationId\":163816732210519}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 16:21:24');
INSERT INTO `sys_oper_log`
VALUES (556, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210549,\"updateTime\":1638260508290,\"delFlag\":\"0\",\"params\":{},\"type\":\"1\",\"createBy\":\"admin\",\"routeId\":163816732210509,\"createTime\":1638260508290,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/f03e4823db5c49e1b72467ba78a9efa4.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/70a8dba5c85844bcaf381c49a0fe79bf.jpg\",\"id\":83,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":83,\"sortNo\":1,\"id\":5,\"status\":\"2\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":83,\"sortNo\":3,\"id\":6,\"status\":\"1\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":83,\"sortNo\":4,\"id\":7,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":83,\"sortNo\":5,\"id\":8,\"status\":\"2\"}],\"stationId\":163816732210519}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 16:21:48');
INSERT INTO `sys_oper_log`
VALUES (557, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638260668383,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/e7869bfb45794813bc7cf9b752cc8ea6.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/e02f727dc4f3456fb5a675f5b1c5ce2e.jpg\",\"id\":84,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":84,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":9,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":84,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":10,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":84,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":11,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":84,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":12,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 16:24:28');
INSERT INTO `sys_oper_log`
VALUES (558, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638268521748,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/e8499cd476ba4e598215cc25ec688da5.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211130/9cb3a23ad30e418fbde502b1ec29080f.jpg\",\"id\":85,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":85,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":13,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":85,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":14,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":85,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":15,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":85,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":16,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 18:35:21');
INSERT INTO `sys_oper_log`
VALUES (559, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638330614822,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211201/85d3ab77e24b4aeba3abc32a65b4e80d.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211201/a78f58a6daa14cd49830545e6bcca6c1.jpg\",\"id\":86,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":86,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":17,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":86,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":18,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":86,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":19,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":86,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":20,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:50:14');
INSERT INTO `sys_oper_log`
VALUES (560, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"1\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638330932616,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211201/6f4a25aa1a2b426e9c0bf91715a2c816.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211201/18ff747f480149978f868413be616389.jpg\",\"id\":87,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":87,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":21,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":87,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":22,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":87,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":23,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":87,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":24,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:55:32');
INSERT INTO `sys_oper_log`
VALUES (561, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210659,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210509,\"createTime\":1638330984681,\"stationList\":[163816732210509,163816732210649,163816732210659],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211201/0a7d7f1ed1784b4a89f4d44b1271af02.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211201/a517c171ee8340e0ab8bdb76c6910700.jpg\",\"id\":88,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":88,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":25,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":88,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":26,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":88,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":27,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":88,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":28,\"status\":\"2\"}],\"stationId\":163816732210649}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:56:24');
INSERT INTO `sys_oper_log`
VALUES (562, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210919,\"updateTime\":1638339080152,\"delFlag\":\"0\",\"params\":{},\"type\":\"1\",\"createBy\":\"admin\",\"routeId\":163816732210739,\"createTime\":1638339080152,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211201/0a7d7f1ed1784b4a89f4d44b1271af02.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211201/a517c171ee8340e0ab8bdb76c6910700.jpg\",\"id\":88,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":88,\"sortNo\":1,\"id\":29,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":88,\"sortNo\":3,\"id\":30,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":88,\"sortNo\":4,\"id\":31,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":88,\"sortNo\":5,\"id\":32,\"status\":\"0\"}],\"stationId\":163816732210899}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 14:11:20');
INSERT INTO `sys_oper_log`
VALUES (563, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210269,\"updateTime\":1638339121793,\"delFlag\":\"0\",\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638339121793,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211201/0a7d7f1ed1784b4a89f4d44b1271af02.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211201/a517c171ee8340e0ab8bdb76c6910700.jpg\",\"id\":88,\"machineList\":[{\"isDelete\":0,\"label\":\"AAA\",\"params\":{},\"recordId\":88,\"sortNo\":1,\"id\":33,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"CCC\",\"params\":{},\"recordId\":88,\"sortNo\":3,\"id\":34,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"EEE\",\"params\":{},\"recordId\":88,\"sortNo\":4,\"id\":35,\"status\":\"0\"},{\"isDelete\":0,\"label\":\"DDD\",\"params\":{},\"recordId\":88,\"sortNo\":5,\"id\":36,\"status\":\"0\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 14:12:01');
INSERT INTO `sys_oper_log`
VALUES (564, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210309,\"params\":{},\"type\":\"1\",\"createBy\":\"admin\",\"routeId\":163816732210249,\"createTime\":1638344651095,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211201/9d753858ddd2455daff3220877815388.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211201/c9e0a0c092ac4923b5952b2de84bc3f6.jpg\",\"id\":89,\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":89,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":37,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":89,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":38,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":89,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":39,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":89,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":40,\"status\":\"2\"}],\"stationId\":163816732210259}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 15:44:11');
INSERT INTO `sys_oper_log`
VALUES (565, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"code\",\"orderNum\":\"2\",\"menuName\":\"代码生成\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"gen\",\"component\":\"tool/gen/index\",\"children\":[],\"createTime\":1637217272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":115,\"menuType\":\"C\",\"perms\":\"tool:gen:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 14:27:15');
INSERT INTO `sys_oper_log`
VALUES (566, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP', 'repair_file_res', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2021-12-03 14:28:25');
INSERT INTO `sys_oper_log`
VALUES (567, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL,
        '/tool/gen/synchDb/repair_file_res', '127.0.0.1', '内网IP', '{tableName=repair_file_res}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 14:28:31');
INSERT INTO `sys_oper_log`
VALUES (568, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-12-03 14:28:35');
INSERT INTO `sys_oper_log`
VALUES (569, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555649,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638514385078,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"id\":90,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 14:53:05');
INSERT INTO `sys_oper_log`
VALUES (570, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"switchId\":729122004774555649,\"params\":{},\"type\":\"0\",\"createBy\":\"admin\",\"routeId\":729122004682280961,\"createTime\":1638514756329,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"id\":91,\"stationId\":729122004694863873}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 14:59:35');
INSERT INTO `sys_oper_log`
VALUES (571, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"flag\":\"1\",\"paramOne\":\"2.34\",\"params\":{},\"paramTwo\":\"3.45\",\"rowType\":\"\",\"depth\":\"1.23\",\"paramThree\":\"4.56\"},\"switchId\":729122004774555649,\"type\":\"0\",\"routeId\":729122004682280961,\"id\":92,\"stationId\":729122004694863873,\"params\":{},\"rowOneTwo\":{\"flag\":\"0\",\"paramOne\":\"2.34\",\"params\":{},\"paramTwo\":\"3.45\",\"rowType\":\"\",\"depth\":\"1.23\",\"paramThree\":\"4.56\"},\"createBy\":\"admin\",\"createTime\":1638514879206,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 15:02:11');
INSERT INTO `sys_oper_log`
VALUES (572, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":93,\"rowType\":\"0\",\"depth\":\"1.23\",\"flag\":\"1\",\"paramThree\":\"4.56\",\"id\":2,\"paramOne\":\"2.34\",\"paramTwo\":\"3.45\"},\"switchId\":729122004774555649,\"type\":\"0\",\"routeId\":729122004682280961,\"id\":93,\"stationId\":729122004694863873,\"params\":{},\"rowOneTwo\":{\"recordId\":93,\"rowType\":\"0\",\"depth\":\"1.23\",\"flag\":\"0\",\"paramThree\":\"4.56\",\"id\":1,\"paramOne\":\"2.34\",\"paramTwo\":\"3.45\"},\"createBy\":\"admin\",\"createTime\":1638515623988,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 15:13:44');
INSERT INTO `sys_oper_log`
VALUES (573, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":94,\"rowType\":\"0\",\"depth\":\"1.23\",\"flag\":\"1\",\"paramThree\":\"4.56\",\"id\":4,\"paramOne\":\"2.34\",\"paramTwo\":\"3.45\"},\"switchId\":729122004774555649,\"type\":\"0\",\"routeId\":729122004682280961,\"id\":94,\"stationId\":729122004694863873,\"params\":{},\"rowOneTwo\":{\"recordId\":94,\"rowType\":\"1\",\"depth\":\"1.23\",\"flag\":\"0\",\"paramThree\":\"4.56\",\"id\":3,\"paramOne\":\"2.34\",\"paramTwo\":\"3.45\"},\"createBy\":\"admin\",\"createTime\":1638515663768,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 15:14:23');
INSERT INTO `sys_oper_log`
VALUES (574, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":95,\"rowType\":\"0\",\"depth\":\"1.23\",\"flag\":\"1\",\"paramThree\":\"4.56\",\"id\":6,\"paramOne\":\"2.34\",\"paramTwo\":\"3.45\"},\"switchId\":729122004774555649,\"type\":\"0\",\"routeId\":729122004682280961,\"id\":95,\"stationId\":729122004694863873,\"params\":{},\"rowOneTwo\":{\"recordId\":95,\"rowType\":\"1\",\"depth\":\"1.23\",\"flag\":\"0\",\"paramThree\":\"4.56\",\"id\":5,\"paramOne\":\"2.34\",\"paramTwo\":\"3.45\"},\"createBy\":\"admin\",\"createTime\":1638517301903,\"stationList\":[729122004682280961,729122004694863873,729122004774555649],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 15:41:41');
INSERT INTO `sys_oper_log`
VALUES (575, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"rowType\":\"0\",\"depth\":\"1.23\",\"flag\":\"1\",\"paramThree\":\"4.56\",\"id\":95,\"paramOne\":\"2.34\",\"paramTwo\":\"3.45\"},\"switchId\":729122004774555600,\"delFlag\":\"0\",\"type\":\"0\",\"routeId\":729122004682281000,\"id\":95,\"stationId\":729122004694863900,\"updateTime\":1638524534591,\"params\":{},\"rowOneTwo\":{\"rowType\":\"0\",\"depth\":\"1.23\",\"flag\":\"1\",\"paramThree\":\"4.56\",\"id\":95,\"paramOne\":\"2.34\",\"paramTwo\":\"3.45\"},\"createBy\":\"admin\",\"createTime\":1638524534591,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"params\":{},\"recordId\":95,\"id\":41}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 17:42:14');
INSERT INTO `sys_oper_log`
VALUES (576, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"检修图片状态\",\"params\":{},\"dictType\":\"repair_file_status\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 18:56:05');
INSERT INTO `sys_oper_log`
VALUES (577, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"repair_file_status\",\"dictLabel\":\"正常\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 18:56:26');
INSERT INTO `sys_oper_log`
VALUES (578, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"repair_file_status\",\"dictLabel\":\"异常\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"icon\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 18:56:49');
INSERT INTO `sys_oper_log`
VALUES (579, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":96,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":8,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163816732210309,\"type\":\"0\",\"routeId\":163816732210249,\"id\":96,\"stationId\":163816732210259,\"params\":{},\"rowOneTwo\":{\"recordId\":96,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":7,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638529804062,\"stationList\":[163816732210249,163816732210259,163816732210309],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/bc9de267051440c392f20241027b1e1c.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/d39e0f63bad546dfb2e1b529131376cc.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":96,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":42,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":96,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":43,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":96,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":44,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":96,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":45,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 19:10:04');
INSERT INTO `sys_oper_log`
VALUES (580, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":97,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":10,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163816732210269,\"type\":\"0\",\"routeId\":163816732210249,\"id\":97,\"stationId\":163816732210259,\"params\":{},\"rowOneTwo\":{\"recordId\":97,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":9,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638529839722,\"stationList\":[163816732210249,163816732210259,163816732210269],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/14da10976a2d4e18b7eaa738b56a8d92.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/ec29393f1e46406eb519dba2543a5d95.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":97,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":46,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":97,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":47,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":97,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":48,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":97,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":49,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 19:10:39');
INSERT INTO `sys_oper_log`
VALUES (581, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":98,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":12,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163816732210319,\"type\":\"0\",\"routeId\":163816732210249,\"id\":98,\"stationId\":163816732210259,\"params\":{},\"rowOneTwo\":{\"recordId\":98,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":11,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638529860814,\"stationList\":[163816732210249,163816732210259,163816732210319],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/a4a252e0258c4482b33e0dc5a0686a6d.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/7218113ca9c7488191923c9c9a3685d6.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":98,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":50,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":98,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":51,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":98,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":52,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":98,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":53,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 19:11:00');
INSERT INTO `sys_oper_log`
VALUES (582, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":99,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":14,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163816732210279,\"type\":\"0\",\"routeId\":163816732210249,\"id\":99,\"stationId\":163816732210259,\"params\":{},\"rowOneTwo\":{\"recordId\":99,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":13,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638529879625,\"stationList\":[163816732210249,163816732210259,163816732210279],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/cb2dcaee723f417a9c06067bcaa7e17e.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/38e4eef7200849a7ba1fa3671ea67dfd.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":99,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":54,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":99,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":55,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":99,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":56,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":99,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":57,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 19:11:19');
INSERT INTO `sys_oper_log`
VALUES (583, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":100,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":16,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163816732210329,\"type\":\"0\",\"routeId\":163816732210249,\"id\":100,\"stationId\":163816732210259,\"params\":{},\"rowOneTwo\":{\"recordId\":100,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":15,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638529901040,\"stationList\":[163816732210249,163816732210259,163816732210329],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/f61f2fd0c84a480f9baf112097a31ae5.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/39ea23d7e24b418981da1a13c0f2407d.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":100,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":58,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":100,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":59,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":100,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":60,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":100,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":61,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 19:11:41');
INSERT INTO `sys_oper_log`
VALUES (584, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":101,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":18,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163816732210339,\"type\":\"0\",\"routeId\":163816732210249,\"id\":101,\"stationId\":163816732210259,\"params\":{},\"rowOneTwo\":{\"recordId\":101,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":17,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638529918583,\"stationList\":[163816732210249,163816732210259,163816732210339],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/a23cd13282e941018a8da8b6d5e9bd39.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/081e39539e5048fca61c2c7e4025fe07.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":101,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":62,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":101,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":63,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":101,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":64,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":101,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":65,\"status\":\"0\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 19:11:58');
INSERT INTO `sys_oper_log`
VALUES (585, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":102,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":20,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163816732210299,\"type\":\"0\",\"routeId\":163816732210249,\"id\":102,\"stationId\":163816732210259,\"params\":{},\"rowOneTwo\":{\"recordId\":102,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":19,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638529937101,\"stationList\":[163816732210249,163816732210259,163816732210299],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/a4ad632f74ad485bbd621536bb2f21a6.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/c2570a7614974f7c90763ee5468caba0.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":102,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":66,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":102,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":67,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":102,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":68,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":102,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":69,\"status\":\"1\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 19:12:17');
INSERT INTO `sys_oper_log`
VALUES (586, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":102,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":102,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163816732210299,\"delFlag\":\"0\",\"type\":\"0\",\"routeId\":163816732210249,\"id\":102,\"stationId\":163816732210259,\"updateTime\":1638529964649,\"params\":{},\"rowOneTwo\":{\"recordId\":102,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":102,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638529964649,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/a4ad632f74ad485bbd621536bb2f21a6.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211203/8fd9af24296840a2a6ba8856d33f19f7.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":102,\"sortNo\":1,\"id\":70,\"status\":\"1\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":102,\"sortNo\":3,\"id\":71,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":102,\"sortNo\":4,\"id\":72,\"status\":\"1\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":102,\"sortNo\":5,\"id\":73,\"status\":\"1\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-03 19:12:44');
INSERT INTO `sys_oper_log`
VALUES (587, '道岔信息', 5, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.export()', 'POST', 1, 'admin',
        NULL, '/repair/info/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2021-12-05 19:41:33');
INSERT INTO `sys_oper_log`
VALUES (588, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-05 19:43:45');
INSERT INTO `sys_oper_log`
VALUES (589, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-05 19:50:15');
INSERT INTO `sys_oper_log`
VALUES (590, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-05 19:56:30');
INSERT INTO `sys_oper_log`
VALUES (591, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-05 19:56:30');
INSERT INTO `sys_oper_log`
VALUES (592, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-05 20:01:40');
INSERT INTO `sys_oper_log`
VALUES (593, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-05 20:09:43');
INSERT INTO `sys_oper_log`
VALUES (594, '道岔信息', 5, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.export()', 'POST', 1, 'admin',
        NULL, '/repair/info/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2021-12-05 20:11:28');
INSERT INTO `sys_oper_log`
VALUES (595, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-05 20:13:54');
INSERT INTO `sys_oper_log`
VALUES (596, '道岔信息', 2, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/info', '127.0.0.1', '内网IP',
        '{\"switchType\":\"交叉渡线\",\"ballastBedType\":\"碎石\",\"express\":\"单动双机串联\",\"pic\":\"daocha5.jpg\",\"pasteChecker\":\"\",\"unloadingDate\":1990713600000,\"dep\":\"维护一百零八部\",\"lineCoordinates\":\"5+760.07S\",\"eqtType\":\"ZDJ9\",\"externalLockingDevice\":\"\",\"installDate\":1517328000000,\"responsible\":\"\",\"station\":\"莘庄\",\"action\":\"单机\",\"installationMode\":\"基础角钢\",\"circuitStandard\":\"五线制\",\"eqtLevel\":\"二级\",\"id\":1325,\"locked\":\"正常\",\"admitLocation\":\"右\",\"switchNum\":\"9号\",\"drawingNum\":\"STB-GJ-030535\",\"lockMode\":\"内锁闭\",\"positionColsed\":\"\",\"org\":\"轨旁一组\",\"railType\":\"60kg/m\",\"lineEnviroment\":\"露天、地面\",\"updateTime\":1638706544600,\"params\":{},\"sequence\":\"\",\"coordinateY\":\"55\",\"createBy\":\"admin\",\"coordinateX\":\"282\",\"route\":\"01号线\",\"createTime\":1638706434000,\"name\":\"2#\",\"eqtMode\":\"ZDJ9-170/4K\",\"installationDrawingNo\":\"STB-GJ-030525-300\",\"switchNo\":\"010102\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 20:15:44');
INSERT INTO `sys_oper_log`
VALUES (597, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-05 20:17:46');
INSERT INTO `sys_oper_log`
VALUES (598, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-05 20:18:34');
INSERT INTO `sys_oper_log`
VALUES (599, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":103,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":22,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410307,\"type\":\"0\",\"routeId\":163870671410247,\"id\":103,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":103,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":21,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638709494554,\"stationList\":[163870671410247,163870671410257,163870671410307],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211205/28504030861744e29e1580c10270d3d0.png\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211205/3fe77a9ded9d40dea0efef6da5ae1ea7.png\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":103,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":74,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":103,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":75,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":103,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":76,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":103,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":77,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 21:04:54');
INSERT INTO `sys_oper_log`
VALUES (600, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '192.168.31.145', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":104,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":24,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410657,\"type\":\"1\",\"routeId\":163870671410507,\"id\":104,\"stationId\":163870671410647,\"params\":{},\"rowOneTwo\":{\"recordId\":104,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":23,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638717733237,\"stationList\":[163870671410507,163870671410647,163870671410657],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211205/5c2ac9e9f0e647878b2d5b17dabf9ec4.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211205/6d26bc7454734409b84836be0c0e2658.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":104,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":78,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":104,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":79,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":104,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":80,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":104,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":81,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 23:22:13');
INSERT INTO `sys_oper_log`
VALUES (601, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '192.168.31.145', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":104,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":26,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410657,\"delFlag\":\"0\",\"type\":\"1\",\"routeId\":163870671410507,\"id\":104,\"stationId\":163870671410647,\"updateTime\":1638717747769,\"params\":{},\"rowOneTwo\":{\"recordId\":104,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":25,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638717747769,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211205/e70138bab02b4a98807fe16c3fd93a2d.png\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211205/569db2b40b33458081ffef18afa3f8f0.png\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":104,\"sortNo\":1,\"id\":82,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":104,\"sortNo\":3,\"id\":83,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":104,\"sortNo\":4,\"id\":84,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":104,\"sortNo\":5,\"id\":85,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 23:22:27');
INSERT INTO `sys_oper_log`
VALUES (602, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '192.168.31.145', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":104,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":28,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410657,\"delFlag\":\"0\",\"type\":\"1\",\"routeId\":163870671410507,\"id\":104,\"stationId\":163870671410647,\"updateTime\":1638717804444,\"params\":{},\"rowOneTwo\":{\"recordId\":104,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":27,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638717804444,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211205/71d10a9d066f4e67bbafce6c9cb5126e.png\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211205/9297c5269a724c9aac9b1066cfadb19d.png\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":104,\"sortNo\":1,\"id\":86,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":104,\"sortNo\":3,\"id\":87,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":104,\"sortNo\":4,\"id\":88,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":104,\"sortNo\":5,\"id\":89,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 23:23:24');
INSERT INTO `sys_oper_log`
VALUES (603, '检修记录', 2, 'com.ruoyi.web.controller.repair.RepairRecordController.edit()', 'PUT', 1, 'admin', NULL,
        '/repair/record', '192.168.31.145', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":104,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":30,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410277,\"delFlag\":\"0\",\"type\":\"0\",\"routeId\":163870671410247,\"id\":104,\"stationId\":163870671410257,\"updateTime\":1638717818298,\"params\":{},\"rowOneTwo\":{\"recordId\":104,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":29,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638717818298,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211205/71d10a9d066f4e67bbafce6c9cb5126e.png\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211205/9297c5269a724c9aac9b1066cfadb19d.png\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":104,\"sortNo\":1,\"id\":90,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":104,\"sortNo\":3,\"id\":91,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":104,\"sortNo\":4,\"id\":92,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":104,\"sortNo\":5,\"id\":93,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 23:23:38');
INSERT INTO `sys_oper_log`
VALUES (604, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":105,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":32,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410307,\"type\":\"0\",\"routeId\":163870671410247,\"id\":105,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":105,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":31,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638780005228,\"stationList\":[163870671410247,163870671410257,163870671410307],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/5d1db914de0844fbaadadb75dfcd043c.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/b1031f150f554a1e9496675c729acb8e.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":105,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":94,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":105,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":95,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":105,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":96,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":105,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":97,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 16:40:05');
INSERT INTO `sys_oper_log`
VALUES (605, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":106,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":34,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410307,\"type\":\"0\",\"routeId\":163870671410247,\"id\":106,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":106,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":33,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638780025627,\"stationList\":[163870671410247,163870671410257,163870671410307],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/f224d5101c6840bbab2ae8b24d739a3b.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/95bdb12359b044e5877f9b4481006997.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":106,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":98,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":106,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":99,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":106,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":100,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":106,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":101,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 16:40:25');
INSERT INTO `sys_oper_log`
VALUES (606, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":107,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":36,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410307,\"type\":\"0\",\"routeId\":163870671410247,\"id\":107,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":107,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":35,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638780025851,\"stationList\":[163870671410247,163870671410257,163870671410307],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/f224d5101c6840bbab2ae8b24d739a3b.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/95bdb12359b044e5877f9b4481006997.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":107,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":102,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":107,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":103,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":107,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":104,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":107,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":105,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 16:40:25');
INSERT INTO `sys_oper_log`
VALUES (607, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":108,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":38,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410307,\"type\":\"1\",\"routeId\":163870671410247,\"id\":108,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":108,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":37,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638780050741,\"stationList\":[163870671410247,163870671410257,163870671410307],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/9af6d12d9d1042588c496b164a888516.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/84d6d26b38d14222930d46742b382a97.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":108,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":106,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":108,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":107,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":108,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":108,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":108,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":109,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 16:40:50');
INSERT INTO `sys_oper_log`
VALUES (608, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":109,\"rowType\":\"0\",\"flag\":\"0\",\"id\":40},\"switchId\":163870671410307,\"type\":\"0\",\"routeId\":163870671410247,\"id\":109,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":109,\"rowType\":\"1\",\"flag\":\"0\",\"id\":39},\"createBy\":\"admin\",\"createTime\":1638780096658,\"stationList\":[163870671410247,163870671410257,163870671410307],\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":109,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":110,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":109,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":111,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":109,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":112,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":109,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":113,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 16:41:36');
INSERT INTO `sys_oper_log`
VALUES (609, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":110,\"rowType\":\"0\",\"flag\":\"0\",\"id\":42},\"switchId\":163870671410267,\"type\":\"0\",\"routeId\":163870671410247,\"id\":110,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":110,\"rowType\":\"1\",\"flag\":\"0\",\"id\":41},\"createBy\":\"admin\",\"createTime\":1638780121062,\"stationList\":[163870671410247,163870671410257,163870671410267],\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":110,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":114,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":110,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":115,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":110,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":116,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":110,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":117,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 16:42:01');
INSERT INTO `sys_oper_log`
VALUES (610, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":111,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":44,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410317,\"type\":\"0\",\"routeId\":163870671410247,\"id\":111,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":111,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":43,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638780149672,\"stationList\":[163870671410247,163870671410257,163870671410317],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/c5f1a4d961a940fc868dd9371ae0d452.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/a10cb4d65ae2420187e05186c9750ee2.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":111,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":118,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":111,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":119,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":111,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":120,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":111,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":121,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 16:42:29');
INSERT INTO `sys_oper_log`
VALUES (611, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":112,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":46,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410757,\"type\":\"0\",\"routeId\":163870671410737,\"id\":112,\"stationId\":163870671410747,\"params\":{},\"rowOneTwo\":{\"recordId\":112,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":45,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638780227850,\"stationList\":[163870671410737,163870671410747,163870671410757],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/9d59c1b73cce4029aa746b1b0de70233.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/d9ce6af47bd04f9281ce52211a6ff016.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":112,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":122,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":112,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":123,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":112,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":124,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":112,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":125,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 16:43:47');
INSERT INTO `sys_oper_log`
VALUES (612, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":113,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":48,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410367,\"type\":\"0\",\"routeId\":163870671410247,\"id\":113,\"stationId\":163870671410357,\"params\":{},\"rowOneTwo\":{\"recordId\":113,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":47,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638780305280,\"stationList\":[163870671410247,163870671410357,163870671410367],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/ef3fa5ae38da44cf963163f12b2021f2.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/0af11c9fd570448cafbc6fc6075eb2a4.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":113,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":126,\"status\":\"1\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":113,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":127,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":113,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":128,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":113,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":129,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 16:45:05');
INSERT INTO `sys_oper_log`
VALUES (613, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210249,\"routeId\":163816732210249,\"stationId\":163816732210249,\"params\":{},\"machines\":[{\"rowThreeFour\":{\"recordId\":114,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":50,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"type\":\"0\",\"id\":114,\"params\":{},\"rowOneTwo\":{\"recordId\":114,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":49,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638803638281,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":114,\"sortNo\":1,\"id\":130,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"recordId\":114,\"sortNo\":1,\"id\":131,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":114,\"sortNo\":1,\"id\":132,\"status\":\"2\"}]},{\"rowThreeFour\":{\"recordId\":115,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":52,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"type\":\"1\",\"id\":115,\"params\":{},\"rowOneTwo\":{\"recordId\":115,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":51,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638803638326,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":115,\"sortNo\":1,\"id\":133,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"recordId\":115,\"sortNo\":1,\"id\":134,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":115,\"sortNo\":1,\"id\":135,\"status\":\"2\"}]}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:13:58');
INSERT INTO `sys_oper_log`
VALUES (614, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210249,\"routeId\":163816732210249,\"stationId\":163816732210249,\"params\":{},\"machines\":[{\"rowThreeFour\":{\"recordId\":116,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":54,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"type\":\"0\",\"id\":116,\"params\":{},\"rowOneTwo\":{\"recordId\":116,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":53,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638803807954,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":116,\"sortNo\":1,\"id\":136,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"recordId\":116,\"sortNo\":1,\"id\":137,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":116,\"sortNo\":1,\"id\":138,\"status\":\"2\"}]},{\"rowThreeFour\":{\"recordId\":117,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":56,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"type\":\"1\",\"id\":117,\"params\":{},\"rowOneTwo\":{\"recordId\":117,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":55,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638803807993,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":117,\"sortNo\":1,\"id\":139,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"recordId\":117,\"sortNo\":1,\"id\":140,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":117,\"sortNo\":1,\"id\":141,\"status\":\"2\"}]}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:16:48');
INSERT INTO `sys_oper_log`
VALUES (615, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210249,\"routeId\":163816732210249,\"stationId\":163816732210249,\"params\":{},\"machines\":[{\"rowThreeFour\":{\"recordId\":118,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":58,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"type\":\"0\",\"id\":118,\"params\":{},\"rowOneTwo\":{\"recordId\":118,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":57,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638803831570,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":118,\"sortNo\":1,\"id\":142,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"recordId\":118,\"sortNo\":1,\"id\":143,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":118,\"sortNo\":1,\"id\":144,\"status\":\"2\"}]},{\"rowThreeFour\":{\"recordId\":119,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":60,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"type\":\"1\",\"id\":119,\"params\":{},\"rowOneTwo\":{\"recordId\":119,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":59,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638803831617,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":119,\"sortNo\":1,\"id\":145,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"recordId\":119,\"sortNo\":1,\"id\":146,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":119,\"sortNo\":1,\"id\":147,\"status\":\"2\"}]}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:17:11');
INSERT INTO `sys_oper_log`
VALUES (616, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210249,\"routeId\":163816732210249,\"stationId\":163816732210249,\"params\":{},\"machines\":[{\"rowThreeFour\":{\"recordId\":120,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":62,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"type\":\"0\",\"id\":120,\"params\":{},\"rowOneTwo\":{\"recordId\":120,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":61,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638803980402,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":120,\"sortNo\":1,\"id\":148,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"recordId\":120,\"sortNo\":1,\"id\":149,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":120,\"sortNo\":1,\"id\":150,\"status\":\"2\"}]},{\"rowThreeFour\":{\"recordId\":121,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":64,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"type\":\"1\",\"id\":121,\"params\":{},\"rowOneTwo\":{\"recordId\":121,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":63,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638803980435,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":121,\"sortNo\":1,\"id\":151,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"recordId\":121,\"sortNo\":1,\"id\":152,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":121,\"sortNo\":1,\"id\":153,\"status\":\"2\"}]}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:19:40');
INSERT INTO `sys_oper_log`
VALUES (617, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210249,\"routeId\":163816732210249,\"stationId\":163816732210249,\"params\":{},\"machines\":[{\"rowThreeFour\":{\"recordId\":122,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":66,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163816732210249,\"type\":\"0\",\"routeId\":163816732210249,\"id\":122,\"stationId\":163816732210249,\"params\":{},\"rowOneTwo\":{\"recordId\":122,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":65,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638804458752,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":122,\"sortNo\":1,\"id\":154,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"recordId\":122,\"sortNo\":1,\"id\":155,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":122,\"sortNo\":1,\"id\":156,\"status\":\"2\"}]},{\"rowThreeFour\":{\"recordId\":123,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":68,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163816732210249,\"type\":\"1\",\"routeId\":163816732210249,\"id\":123,\"stationId\":163816732210249,\"params\":{},\"rowOneTwo\":{\"recordId\":123,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":67,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638804458792,\"file4\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file3\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":123,\"sortNo\":1,\"id\":157,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"recordId\":123,\"sortNo\":1,\"id\":158,\"status\":\"2\"},',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:27:38');
INSERT INTO `sys_oper_log`
VALUES (618, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.appAdd()', 'POST', 1, 'admin', NULL,
        '/repair/record/add', '127.0.0.1', '内网IP',
        '{\"switchId\":163816732210249,\"routeId\":163816732210249,\"stationId\":163816732210249,\"params\":{},\"machines\":[{\"rowThreeFour\":{\"recordId\":124,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":70,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163816732210249,\"type\":\"0\",\"routeId\":163816732210249,\"id\":124,\"stationId\":163816732210249,\"params\":{},\"rowOneTwo\":{\"recordId\":124,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":69,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638804565996,\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":124,\"sortNo\":1,\"id\":160,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"recordId\":124,\"sortNo\":1,\"id\":161,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":124,\"sortNo\":1,\"id\":162,\"status\":\"2\"}]},{\"rowThreeFour\":{\"recordId\":125,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":72,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163816732210249,\"type\":\"1\",\"routeId\":163816732210249,\"id\":125,\"stationId\":163816732210249,\"params\":{},\"rowOneTwo\":{\"recordId\":125,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":71,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638804566031,\"file4\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/c3bc16d0a7024dfa86bc210da742cb9a.jpg\",\"file3\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211127/0adbf100010c43c1acb68e730f5cab4b.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":125,\"sortNo\":1,\"id\":163,\"status\":\"2\"},{\"label\":\"BBB\",\"params\":{},\"recordId\":125,\"sortNo\":1,\"id\":164,\"status\":\"2\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":125,\"sortNo\":1,\"id\":165,\"status\":\"2\"}]}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:29:26');
INSERT INTO `sys_oper_log`
VALUES (619, '检修记录', 3, 'com.ruoyi.web.controller.repair.RepairRecordController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/record/124', '127.0.0.1', '内网IP', '{ids=124}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-06 23:41:50');
INSERT INTO `sys_oper_log`
VALUES (620, '检修记录', 3, 'com.ruoyi.web.controller.repair.RepairRecordController.remove()', 'DELETE', 1, 'admin',
        NULL, '/repair/record/125', '127.0.0.1', '内网IP', '{ids=125}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-06 23:41:52');
INSERT INTO `sys_oper_log`
VALUES (621, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":126,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":74,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410307,\"type\":\"0\",\"routeId\":163870671410247,\"id\":126,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":126,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":73,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638805336846,\"stationList\":[163870671410247,163870671410257,163870671410307],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/13ff3559596444a5b92a3a1bf0c25638.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/e2dde153a0214e309ffc0f89d445d7a5.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":126,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":166,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":126,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":167,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":126,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":168,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":126,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":169,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:42:16');
INSERT INTO `sys_oper_log`
VALUES (622, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":127,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":76,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410457,\"type\":\"0\",\"routeId\":163870671410247,\"id\":127,\"stationId\":163870671410437,\"params\":{},\"rowOneTwo\":{\"recordId\":127,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":75,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638805363244,\"stationList\":[163870671410247,163870671410437,163870671410457],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/9bcf7df75c75474fa3b51f0e1f44f1b0.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/ed2714d022774b72bd6235229f1c2474.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":127,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":170,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":127,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":171,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":127,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":172,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":127,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":173,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:42:43');
INSERT INTO `sys_oper_log`
VALUES (623, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":128,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":78,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410267,\"type\":\"0\",\"routeId\":163870671410247,\"id\":128,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":128,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":77,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638805384921,\"stationList\":[163870671410247,163870671410257,163870671410267],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/003d32142b4446179bafb21bb789c75a.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/38ba55a7bae544439f83714b11e3f23d.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":128,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":174,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":128,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":175,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":128,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":176,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":128,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":177,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:43:04');
INSERT INTO `sys_oper_log`
VALUES (624, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":129,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":80,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410457,\"type\":\"0\",\"routeId\":163870671410247,\"id\":129,\"stationId\":163870671410437,\"params\":{},\"rowOneTwo\":{\"recordId\":129,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":79,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638805407547,\"stationList\":[163870671410247,163870671410437,163870671410457],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/4911e7d6eb004c9e86744884a73a82f5.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/6ff326c0882d4f90b22a84acd5d97e7c.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":129,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":178,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":129,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":179,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":129,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":180,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":129,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":181,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:43:27');
INSERT INTO `sys_oper_log`
VALUES (625, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":130,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":82,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410657,\"type\":\"0\",\"routeId\":163870671410507,\"id\":130,\"stationId\":163870671410647,\"params\":{},\"rowOneTwo\":{\"recordId\":130,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":81,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638805425679,\"stationList\":[163870671410507,163870671410647,163870671410657],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/8d9e910b8ad147e2b288c2d1204d6e60.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/abc170d936334d28b6cc65d2ac93b308.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":130,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":182,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":130,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":183,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":130,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":184,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":130,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":185,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:43:45');
INSERT INTO `sys_oper_log`
VALUES (626, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":131,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":84,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410707,\"type\":\"0\",\"routeId\":163870671410507,\"id\":131,\"stationId\":163870671410687,\"params\":{},\"rowOneTwo\":{\"recordId\":131,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":83,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638805475128,\"stationList\":[163870671410507,163870671410687,163870671410707],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/dd1171d5ecf247218310a17357ee9124.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/e675d95c22d8434598179692d2d5e61e.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":131,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":186,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":131,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":187,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":131,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":188,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":131,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":189,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:44:35');
INSERT INTO `sys_oper_log`
VALUES (627, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":132,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":86,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410767,\"type\":\"0\",\"routeId\":163870671410737,\"id\":132,\"stationId\":163870671410747,\"params\":{},\"rowOneTwo\":{\"recordId\":132,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":85,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638805502730,\"stationList\":[163870671410737,163870671410747,163870671410767],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/373c855b910140aabf8f5693036b4375.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211206/9d6a971a6c76416eb167d666553f2187.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":132,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":190,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":132,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":191,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":132,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":192,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":132,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":193,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-06 23:45:02');
INSERT INTO `sys_oper_log`
VALUES (628, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dict/data', '192.168.31.145', '内网IP',
        '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"repair_file_status\",\"dictLabel\":\"临界\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"icon\",\"createTime\":1638529009000,\"dictCode\":40,\"updateBy\":\"admin\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 00:33:33');
INSERT INTO `sys_oper_log`
VALUES (629, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '192.168.31.145', '内网IP',
        '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"repair_file_status\",\"dictLabel\":\"故障\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 00:33:54');
INSERT INTO `sys_oper_log`
VALUES (630, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL,
        '/system/notice', '127.0.0.1', '内网IP',
        '{\"noticeContent\":\"<p>全体成员第一次扩大会议</p>\",\"createBy\":\"admin\",\"noticeType\":\"1\",\"params\":{},\"noticeTitle\":\"全体成员扩大会议\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 09:50:32');
INSERT INTO `sys_oper_log`
VALUES (631, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/notice', '127.0.0.1', '内网IP',
        '{\"noticeContent\":\"<p>员工会议：全体成员第一次扩大会议</p>\",\"createBy\":\"admin\",\"createTime\":1638841832000,\"updateBy\":\"admin\",\"noticeType\":\"1\",\"params\":{},\"noticeId\":3,\"noticeTitle\":\"全体成员扩大会议\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 09:50:54');
INSERT INTO `sys_oper_log`
VALUES (632, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":133,\"rowType\":\"0\",\"flag\":\"0\",\"id\":88},\"switchId\":163870671410267,\"type\":\"0\",\"routeId\":163870671410247,\"id\":133,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":133,\"rowType\":\"1\",\"flag\":\"0\",\"id\":87},\"createBy\":\"admin\",\"createTime\":1638859879580,\"stationList\":[163870671410247,163870671410257,163870671410267],\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":133,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":194,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":133,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":195,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":133,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":196,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":133,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":197,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 14:51:19');
INSERT INTO `sys_oper_log`
VALUES (633, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":134,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":90,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410377,\"type\":\"0\",\"routeId\":163870671410247,\"id\":134,\"stationId\":163870671410357,\"params\":{},\"rowOneTwo\":{\"recordId\":134,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":89,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638859896510,\"stationList\":[163870671410247,163870671410357,163870671410377],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/778dd9174040467d9832c940e7f0bb80.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/b21ae96180b647a6b7f83239f198c52d.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":134,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":198,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":134,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":199,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":134,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":200,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":134,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":201,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 14:51:36');
INSERT INTO `sys_oper_log`
VALUES (634, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":135,\"rowType\":\"0\",\"flag\":\"0\",\"id\":92},\"switchId\":163870671410387,\"type\":\"0\",\"routeId\":163870671410247,\"id\":135,\"stationId\":163870671410357,\"params\":{},\"rowOneTwo\":{\"recordId\":135,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":91,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638859914272,\"stationList\":[163870671410247,163870671410357,163870671410387],\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/65afe518ecfb4692a10e3c41b1aa1a64.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":135,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":202,\"status\":\"1\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":135,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":203,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":135,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":204,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":135,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":205,\"status\":\"1\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 14:51:54');
INSERT INTO `sys_oper_log`
VALUES (635, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":136,\"rowType\":\"0\",\"flag\":\"0\",\"id\":94},\"switchId\":163870671410267,\"type\":\"0\",\"routeId\":163870671410247,\"id\":136,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":136,\"rowType\":\"1\",\"flag\":\"0\",\"id\":93},\"createBy\":\"admin\",\"createTime\":1638860555974,\"stationList\":[163870671410247,163870671410257,163870671410267],\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":136,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":206,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":136,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":207,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":136,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":208,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":136,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":209,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 15:02:36');
INSERT INTO `sys_oper_log`
VALUES (636, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":137,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":96,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410457,\"type\":\"0\",\"routeId\":163870671410247,\"id\":137,\"stationId\":163870671410437,\"params\":{},\"rowOneTwo\":{\"recordId\":137,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":95,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638860573391,\"stationList\":[163870671410247,163870671410437,163870671410457],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/9cc7ff5cd2d14cd7b7f1a6d3e14a7fe0.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/1eae1915be3d4f208630cfdb47a28d10.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":137,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":210,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":137,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":211,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":137,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":212,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":137,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":213,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 15:02:53');
INSERT INTO `sys_oper_log`
VALUES (637, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":138,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":98,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410467,\"type\":\"0\",\"routeId\":163870671410247,\"id\":138,\"stationId\":163870671410437,\"params\":{},\"rowOneTwo\":{\"recordId\":138,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":97,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638860589221,\"stationList\":[163870671410247,163870671410437,163870671410467],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/f05bd59854114171910ccb670bb267a4.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/e1635d9f2b8346b083ba6b46d247bc35.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":138,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":214,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":138,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":215,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":138,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":216,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":138,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":217,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 15:03:09');
INSERT INTO `sys_oper_log`
VALUES (638, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":139,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":100,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410317,\"type\":\"1\",\"routeId\":163870671410247,\"id\":139,\"stationId\":163870671410257,\"params\":{},\"rowOneTwo\":{\"recordId\":139,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":99,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638860614003,\"stationList\":[163870671410247,163870671410257,163870671410317],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/97a24a700c354725a4c6eb59314d3b99.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/f0f44d6e0c134844ae9c86e58577e16c.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":139,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":218,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":139,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":219,\"status\":\"2\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":139,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":220,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":139,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":221,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 15:03:34');
INSERT INTO `sys_oper_log`
VALUES (639, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":140,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":102,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163870671410757,\"type\":\"0\",\"routeId\":163870671410737,\"id\":140,\"stationId\":163870671410747,\"params\":{},\"rowOneTwo\":{\"recordId\":140,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":101,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638860640124,\"stationList\":[163870671410737,163870671410747,163870671410757],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/98ca74f0cb2a42009bbe122954cc16c7.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/5f66dca9618b48f587583f5a50883de0.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":140,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":222,\"status\":\"1\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":140,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":223,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":140,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":224,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":140,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":225,\"status\":\"1\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 15:04:00');
INSERT INTO `sys_oper_log`
VALUES (640, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"phonenumber\":\"17805250022\",\"admin\":false,\"password\":\"$2a$10$w4ahJEfAVz9Zuih.YTFaweMo5UQgY7pXOGKBZ./SMXWOs57gbAnAq\",\"postIds\":[1],\"email\":\"100200300@163.com\",\"nickName\":\"工号\",\"sex\":\"0\",\"deptId\":110,\"params\":{},\"userName\":\"A001\",\"userId\":102,\"createBy\":\"admin\",\"roleIds\":[3],\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 16:54:07');
INSERT INTO `sys_oper_log`
VALUES (641, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"轨交二组\",\"leader\":\"李三天\",\"orderNum\":\"1\",\"params\":{},\"parentId\":103,\"createBy\":\"admin\",\"children\":[],\"phone\":\"17805250021\",\"ancestors\":\"0,100,101,103\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 17:21:31');
INSERT INTO `sys_oper_log`
VALUES (642, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"phonenumber\":\"17805250022\",\"admin\":false,\"password\":\"123456\",\"postIds\":[1],\"email\":\"1015351535@163.com\",\"nickName\":\"小二子\",\"sex\":\"0\",\"deptId\":111,\"params\":{},\"userName\":\"A002\",\"roleIds\":[3],\"status\":\"0\"}',
        '{\"msg\":\"新增用户\'A002\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2021-12-07 17:23:44');
INSERT INTO `sys_oper_log`
VALUES (643, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"phonenumber\":\"17805250023\",\"admin\":false,\"password\":\"$2a$10$pWELMDeYhgQm0VwXpUd2cut/BCIBaUF84uWWzS4wLxhPwGf58KHSK\",\"postIds\":[1],\"email\":\"1015351535@163.com\",\"nickName\":\"小二子\",\"sex\":\"0\",\"deptId\":111,\"params\":{},\"userName\":\"A002\",\"userId\":103,\"createBy\":\"admin\",\"roleIds\":[3],\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 17:23:50');
INSERT INTO `sys_oper_log`
VALUES (644, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"deptId\":111,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2021-12-07 17:23:54');
INSERT INTO `sys_oper_log`
VALUES (645, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL,
        '/system/user/importData', '127.0.0.1', '内网IP', 'false',
        '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 A003 导入成功\",\"code\":200}', 0, NULL,
        '2021-12-07 17:26:53');
INSERT INTO `sys_oper_log`
VALUES (646, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL,
        '/system/user/importData', '127.0.0.1', '内网IP', 'true', NULL, 1,
        '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 A004 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'12\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\workfile\\example\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(      ?,             ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'12\' for key \'PRIMARY\'\n; Duplicate entry \'12\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'12\' for key \'PRIMARY\'',
        '2021-12-07 17:32:04');
INSERT INTO `sys_oper_log`
VALUES (647, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL,
        '/system/user/importData', '127.0.0.1', '内网IP', 'true',
        '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 A004 导入成功\",\"code\":200}', 0, NULL,
        '2021-12-07 17:32:31');
INSERT INTO `sys_oper_log`
VALUES (648, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-07 18:36:58');
INSERT INTO `sys_oper_log`
VALUES (649, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-07 18:38:07');
INSERT INTO `sys_oper_log`
VALUES (650, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-07 18:46:46');
INSERT INTO `sys_oper_log`
VALUES (651, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-07 18:48:39');
INSERT INTO `sys_oper_log`
VALUES (652, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-07 18:53:35');
INSERT INTO `sys_oper_log`
VALUES (653, '导入道岔信息列表', 6, 'com.ruoyi.web.controller.repair.RepairPlaceInfoController.importData()', 'POST', 1,
        'admin', NULL, '/repair/info/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2021-12-07 18:55:29');
INSERT INTO `sys_oper_log`
VALUES (654, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":141,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":104,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010453,\"type\":\"0\",\"routeId\":163887453010243,\"id\":141,\"stationId\":163887453010433,\"params\":{},\"rowOneTwo\":{\"recordId\":141,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":103,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638874572872,\"stationList\":[163887453010243,163887453010433,163887453010453],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/a306f0502bd3472c9dff3f67f347ba46.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/ae9ffae8751a43f5a2e8b6055bd80d70.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":141,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":226,\"status\":\"1\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":141,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":227,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":141,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":228,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":141,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":229,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 18:56:12');
INSERT INTO `sys_oper_log`
VALUES (655, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":142,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":106,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010603,\"type\":\"0\",\"routeId\":163887453010503,\"id\":142,\"stationId\":163887453010593,\"params\":{},\"rowOneTwo\":{\"recordId\":142,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":105,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638874591050,\"stationList\":[163887453010503,163887453010593,163887453010603],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/a4ee465235e24554bfe32dbfd87939b5.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/0f99506485da4950b7bb50a3de01ae3f.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":142,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":230,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":142,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":231,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":142,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":232,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":142,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":233,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 18:56:31');
INSERT INTO `sys_oper_log`
VALUES (656, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":143,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":108,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010263,\"type\":\"0\",\"routeId\":163887453010243,\"id\":143,\"stationId\":163887453010253,\"params\":{},\"rowOneTwo\":{\"recordId\":143,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":107,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638874607701,\"stationList\":[163887453010243,163887453010253,163887453010263],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/d07a2cbbcf6949c2855c8b39ae70d933.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/559655ab3cb64154a36782d3107b0ba8.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":143,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":234,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":143,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":235,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":143,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":236,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":143,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":237,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 18:56:47');
INSERT INTO `sys_oper_log`
VALUES (657, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":144,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":110,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010453,\"type\":\"0\",\"routeId\":163887453010243,\"id\":144,\"stationId\":163887453010433,\"params\":{},\"rowOneTwo\":{\"recordId\":144,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":109,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638876247785,\"stationList\":[163887453010243,163887453010433,163887453010453],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/0bb867aadd6a430a858150c27e698073.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/76c3db3b7ba249b8867aae10653e2a04.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":144,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":238,\"status\":\"1\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":144,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":239,\"status\":\"0\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":144,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":240,\"status\":\"2\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":144,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":241,\"status\":\"0\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 19:24:07');
INSERT INTO `sys_oper_log`
VALUES (658, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":145,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":112,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010373,\"type\":\"0\",\"routeId\":163887453010243,\"id\":145,\"stationId\":163887453010353,\"params\":{},\"rowOneTwo\":{\"recordId\":145,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":111,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638876263776,\"stationList\":[163887453010243,163887453010353,163887453010373],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/f80c841a5bc24cd89692919f713c6080.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/4ceef5ae0265447b9344f841f5b68ddf.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":145,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":242,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":145,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":243,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":145,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":244,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":145,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":245,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 19:24:23');
INSERT INTO `sys_oper_log`
VALUES (659, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":146,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":114,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010793,\"type\":\"0\",\"routeId\":163887453010733,\"id\":146,\"stationId\":163887453010783,\"params\":{},\"rowOneTwo\":{\"recordId\":146,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":113,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638876280372,\"stationList\":[163887453010733,163887453010783,163887453010793],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/6b357a0353064e239758583c76a837a5.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/45419cac7a9d45b28b4c2f19d612129f.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":146,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":246,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":146,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":247,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":146,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":248,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":146,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":249,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 19:24:40');
INSERT INTO `sys_oper_log`
VALUES (660, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":147,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":116,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010903,\"type\":\"0\",\"routeId\":163887453010733,\"id\":147,\"stationId\":163887453010883,\"params\":{},\"rowOneTwo\":{\"recordId\":147,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":115,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638876296536,\"stationList\":[163887453010733,163887453010883,163887453010903],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/b8d9ccc110bd4484980ea2c18f31b93c.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/5703db51f6ad4fc3a3abdb6e1970de04.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":147,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":250,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":147,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":251,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":147,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":252,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":147,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":253,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 19:24:56');
INSERT INTO `sys_oper_log`
VALUES (661, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":148,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":118,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010603,\"type\":\"0\",\"routeId\":163887453010503,\"id\":148,\"stationId\":163887453010593,\"params\":{},\"rowOneTwo\":{\"recordId\":148,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":117,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638876314149,\"stationList\":[163887453010503,163887453010593,163887453010603],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/f69372fc5b234f3680802efb06f5b39c.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/ff4d6258cfe2441ba3f8111bb9a235f3.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":148,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":254,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":148,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":255,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":148,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":256,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":148,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":257,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 19:25:14');
INSERT INTO `sys_oper_log`
VALUES (662, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":149,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":120,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010663,\"type\":\"0\",\"routeId\":163887453010503,\"id\":149,\"stationId\":163887453010643,\"params\":{},\"rowOneTwo\":{\"recordId\":149,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":119,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638876331586,\"stationList\":[163887453010503,163887453010643,163887453010663],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/b7ac02cf47e7414ca08e7850a37e4bde.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/48238209c18d473ead4a66e3a9b3b772.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":149,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":258,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":149,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":259,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":149,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":260,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":149,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":261,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 19:25:31');
INSERT INTO `sys_oper_log`
VALUES (663, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":150,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":122,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010713,\"type\":\"0\",\"routeId\":163887453010503,\"id\":150,\"stationId\":163887453010683,\"params\":{},\"rowOneTwo\":{\"recordId\":150,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":121,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638876348060,\"stationList\":[163887453010503,163887453010683,163887453010713],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/69ed748738f74e7faa8c1009010624ce.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/ad66f52e3b984ab5981e809a1087fb2c.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":150,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":262,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":150,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":263,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":150,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":264,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":150,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":265,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 19:25:48');
INSERT INTO `sys_oper_log`
VALUES (664, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":151,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":124,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010543,\"type\":\"0\",\"routeId\":163887453010503,\"id\":151,\"stationId\":163887453010513,\"params\":{},\"rowOneTwo\":{\"recordId\":151,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":123,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638876363661,\"stationList\":[163887453010503,163887453010513,163887453010543],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/8049131f0ccb41aea80c5de1a53f9445.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/5229bde02f3d41ad90156fd2f3ca10fa.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":151,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":266,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":151,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":267,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":151,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":268,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":151,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":269,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 19:26:03');
INSERT INTO `sys_oper_log`
VALUES (665, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":152,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":126,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010583,\"type\":\"0\",\"routeId\":163887453010503,\"id\":152,\"stationId\":163887453010563,\"params\":{},\"rowOneTwo\":{\"recordId\":152,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":125,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638876380175,\"stationList\":[163887453010503,163887453010563,163887453010583],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/811d5fab64314ccbb46a44900c88fe11.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211207/c6faeb9dbabe4958b9bd726747f1c6cb.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":152,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":270,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":152,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":271,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":152,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":272,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":152,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":273,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 19:26:20');
INSERT INTO `sys_oper_log`
VALUES (666, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/user/13', '127.0.0.1', '内网IP', '{userIds=13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-07 19:49:14');
INSERT INTO `sys_oper_log`
VALUES (667, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/user/12', '127.0.0.1', '内网IP', '{userIds=12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-07 19:49:16');
INSERT INTO `sys_oper_log`
VALUES (668, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/101', '127.0.0.1', '内网IP', '{deptId=101}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}',
        0, NULL, '2021-12-08 15:09:47');
INSERT INTO `sys_oper_log`
VALUES (669, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/102', '127.0.0.1', '内网IP', '{deptId=102}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}',
        0, NULL, '2021-12-08 15:09:58');
INSERT INTO `sys_oper_log`
VALUES (670, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/109', '127.0.0.1', '内网IP', '{deptId=109}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-08 15:10:00');
INSERT INTO `sys_oper_log`
VALUES (671, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/108', '127.0.0.1', '内网IP', '{deptId=108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-08 15:10:02');
INSERT INTO `sys_oper_log`
VALUES (672, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/102', '127.0.0.1', '内网IP', '{deptId=102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-08 15:10:05');
INSERT INTO `sys_oper_log`
VALUES (673, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/107', '127.0.0.1', '内网IP', '{deptId=107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-08 15:10:11');
INSERT INTO `sys_oper_log`
VALUES (674, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/106', '127.0.0.1', '内网IP', '{deptId=106}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-08 15:10:18');
INSERT INTO `sys_oper_log`
VALUES (675, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/110', '127.0.0.1', '内网IP', '{deptId=110}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}',
        0, NULL, '2021-12-08 15:10:20');
INSERT INTO `sys_oper_log`
VALUES (676, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/110', '127.0.0.1', '内网IP', '{deptId=110}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}',
        0, NULL, '2021-12-08 15:10:24');
INSERT INTO `sys_oper_log`
VALUES (677, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/104', '127.0.0.1', '内网IP', '{deptId=104}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}',
        0, NULL, '2021-12-08 15:10:36');
INSERT INTO `sys_oper_log`
VALUES (678, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/111', '127.0.0.1', '内网IP', '{deptId=111}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}',
        0, NULL, '2021-12-08 15:10:40');
INSERT INTO `sys_oper_log`
VALUES (679, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1637217272000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":111,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1637217272000,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:00:58');
INSERT INTO `sys_oper_log`
VALUES (680, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"roles\":[{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"system\",\"roleName\":\"系统测试员\",\"status\":\"0\"}],\"phonenumber\":\"17805250021\",\"admin\":false,\"loginDate\":1638072997000,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"1016241535@qq.com\",\"nickName\":\"吴正国\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"\",\"dept\":{\"deptName\":\"市场部门\",\"leader\":\"若依\",\"deptId\":104,\"orderNum\":\"2\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"wzg\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":1637220591000,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:01:07');
INSERT INTO `sys_oper_log`
VALUES (681, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"18625106880\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[1],\"loginIp\":\"\",\"email\":\"yam!3631006@qq.com\",\"nickName\":\"全球小二哥\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"user01\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1637220811000,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:01:12');
INSERT INTO `sys_oper_log`
VALUES (682, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/user', '127.0.0.1', '内网IP',
        '{\"roles\":[{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"system\",\"roleName\":\"系统测试员\",\"status\":\"0\"}],\"phonenumber\":\"17805250022\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[1],\"loginIp\":\"\",\"email\":\"100200300@163.com\",\"nickName\":\"工号\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"\",\"dept\":{\"deptName\":\"AAA\",\"leader\":\"aaa\",\"deptId\":110,\"orderNum\":\"1\",\"params\":{},\"parentId\":105,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"A001\",\"userId\":102,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":1638867247000,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:01:18');
INSERT INTO `sys_oper_log`
VALUES (683, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/110', '127.0.0.1', '内网IP', '{deptId=110}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-08 16:01:33');
INSERT INTO `sys_oper_log`
VALUES (684, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-08 16:01:35');
INSERT INTO `sys_oper_log`
VALUES (685, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/104', '127.0.0.1', '内网IP', '{deptId=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-08 16:01:38');
INSERT INTO `sys_oper_log`
VALUES (686, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"轨道交通总公司\",\"leader\":\"GuoGe\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1637217272000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:02:22');
INSERT INTO `sys_oper_log`
VALUES (687, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"轨交二组\",\"leader\":\"李三天\",\"deptId\":111,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1638868891000,\"phone\":\"17805250021\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:02:42');
INSERT INTO `sys_oper_log`
VALUES (688, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"轨交二组\",\"leader\":\"李三天\",\"deptId\":111,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":103,\"createBy\":\"admin\",\"children\":[],\"createTime\":1638868891000,\"phone\":\"17805250021\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101,103\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:02:53');
INSERT INTO `sys_oper_log`
VALUES (689, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1637217272000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:03:00');
INSERT INTO `sys_oper_log`
VALUES (690, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/dept/101', '127.0.0.1', '内网IP', '{deptId=101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2021-12-08 16:03:03');
INSERT INTO `sys_oper_log`
VALUES (691, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"维修二组\",\"leader\":\"李三天\",\"deptId\":111,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":103,\"createBy\":\"admin\",\"children\":[],\"createTime\":1638868891000,\"phone\":\"17805250021\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,103\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:03:20');
INSERT INTO `sys_oper_log`
VALUES (692, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"维修一组\",\"orderNum\":\"2\",\"params\":{},\"parentId\":103,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,103\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:03:36');
INSERT INTO `sys_oper_log`
VALUES (693, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"维修二组\",\"leader\":\"李三天\",\"deptId\":111,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":103,\"createBy\":\"admin\",\"children\":[],\"createTime\":1638868891000,\"phone\":\"17805250021\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,103\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:03:45');
INSERT INTO `sys_oper_log`
VALUES (694, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"维修一组\",\"deptId\":112,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":103,\"createBy\":\"admin\",\"children\":[],\"createTime\":1638950616000,\"updateBy\":\"admin\",\"ancestors\":\"0,100,103\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:03:52');
INSERT INTO `sys_oper_log`
VALUES (695, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"维修三组\",\"orderNum\":\"3\",\"params\":{},\"parentId\":103,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,103\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:04:05');
INSERT INTO `sys_oper_log`
VALUES (696, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"维修部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1637217272000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:04:30');
INSERT INTO `sys_oper_log`
VALUES (697, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"维修部门\",\"leader\":\"GuoGe\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1637217272000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:04:38');
INSERT INTO `sys_oper_log`
VALUES (698, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2021-12-08 16:07:01');
INSERT INTO `sys_oper_log`
VALUES (699, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL,
        '/system/user/importData', '127.0.0.1', '内网IP', 'false',
        '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 A005 导入成功\",\"code\":200}', 0, NULL,
        '2021-12-08 16:09:45');
INSERT INTO `sys_oper_log`
VALUES (700, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL,
        '/system/user/importData', '127.0.0.1', '内网IP', 'false', NULL, 1,
        '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 A005 已存在', '2021-12-08 16:14:11');
INSERT INTO `sys_oper_log`
VALUES (701, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL,
        '/system/user/importData', '127.0.0.1', '内网IP', 'false',
        '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 A006 导入成功\",\"code\":200}', 0, NULL,
        '2021-12-08 16:14:51');
INSERT INTO `sys_oper_log`
VALUES (702, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL,
        '/system/notice', '127.0.0.1', '内网IP',
        '{\"noticeContent\":\"<p>安吉科技今年新春不过了</p>\",\"createBy\":\"admin\",\"noticeType\":\"1\",\"params\":{},\"noticeTitle\":\"欢庆新春\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 16:51:32');
INSERT INTO `sys_oper_log`
VALUES (703, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":153,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":128,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010453,\"type\":\"1\",\"routeId\":163887453010243,\"id\":153,\"stationId\":163887453010433,\"params\":{},\"rowOneTwo\":{\"recordId\":153,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":127,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638957663684,\"stationList\":[163887453010243,163887453010433,163887453010453],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211208/1239e14c3231442e9709caf3d4f22fef.jpg\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211208/9feb58cb44a64e128416aa0a53f02f47.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":153,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":274,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":153,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":275,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":153,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":276,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":153,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":277,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 18:01:03');
INSERT INTO `sys_oper_log`
VALUES (704, '检修记录', 1, 'com.ruoyi.web.controller.repair.RepairRecordController.add()', 'POST', 1, 'admin', NULL,
        '/repair/record', '127.0.0.1', '内网IP',
        '{\"rowThreeFour\":{\"recordId\":154,\"rowType\":\"0\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":130,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"switchId\":163887453010303,\"type\":\"0\",\"routeId\":163887453010243,\"id\":154,\"stationId\":163887453010253,\"params\":{},\"rowOneTwo\":{\"recordId\":154,\"rowType\":\"1\",\"depth\":\"2\",\"flag\":\"1\",\"paramThree\":\"5\",\"id\":129,\"paramOne\":\"3\",\"paramTwo\":\"4\"},\"createBy\":\"admin\",\"createTime\":1638957764320,\"stationList\":[163887453010243,163887453010253,163887453010303],\"file2\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211208/d947aac5a2894d17a0e78322e0fc4192.png\",\"file1\":\"https://repair-files.oss-cn-beijing.aliyuncs.com/repair/20211208/99bac887d58d459f9ee52eb4922de0bd.jpg\",\"machineList\":[{\"label\":\"AAA\",\"params\":{},\"recordId\":154,\"sortNo\":1,\"createBy\":\"admin\",\"createTime\":1637853179000,\"id\":278,\"status\":\"0\"},{\"label\":\"CCC\",\"params\":{},\"recordId\":154,\"sortNo\":3,\"createBy\":\"admin\",\"createTime\":1637293472000,\"id\":279,\"status\":\"1\"},{\"label\":\"EEE\",\"params\":{},\"recordId\":154,\"sortNo\":4,\"createBy\":\"admin\",\"createTime\":1637293667000,\"id\":280,\"status\":\"0\"},{\"label\":\"DDD\",\"params\":{},\"recordId\":154,\"sortNo\":5,\"createBy\":\"admin\",\"createTime\":1637293656000,\"id\":281,\"status\":\"2\"}]}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-08 18:02:44');
INSERT INTO `sys_oper_log`
VALUES (705, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"deptName\":\"轨道交通总公司\",\"leader\":\"GuoGeaa\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1637217272000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-17 15:50:53');
INSERT INTO `sys_oper_log`
VALUES (706, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP', 'angeek_trusted_system,angeek_trusted_apply',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-01 14:54:59');
INSERT INTO `sys_oper_log`
VALUES (707, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-01 14:55:06');
INSERT INTO `sys_oper_log`
VALUES (708, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL,
        '/monitor/job/changeStatus', '127.0.0.1', '内网IP',
        '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2022-03-03 19:17:56');
INSERT INTO `sys_oper_log`
VALUES (709, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL,
        '/monitor/job/changeStatus', '127.0.0.1', '内网IP',
        '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2022-03-03 19:44:33');
INSERT INTO `sys_oper_log`
VALUES (710, '调度日志', 9, 'com.ruoyi.quartz.controller.SysJobLogController.clean()', 'DELETE', 1, 'admin', NULL,
        '/monitor/jobLog/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2022-03-03 19:44:44');
INSERT INTO `sys_oper_log`
VALUES (711, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP', 'angeek__statistics_apply,angeek__statistics',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-07 13:43:25');
INSERT INTO `sys_oper_log`
VALUES (712, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-07 13:43:37');
INSERT INTO `sys_oper_log`
VALUES (713, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-13 09:46:16');
INSERT INTO `sys_oper_log`
VALUES (714, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-13 09:49:56');
INSERT INTO `sys_oper_log`
VALUES (715, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-13 09:53:45');
INSERT INTO `sys_oper_log`
VALUES (716, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-24 15:35:52');
INSERT INTO `sys_oper_log`
VALUES (717, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-24 15:40:46');
INSERT INTO `sys_oper_log`
VALUES (718, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-24 15:47:55');
INSERT INTO `sys_oper_log`
VALUES (719, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-24 15:48:11');
INSERT INTO `sys_oper_log`
VALUES (720, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-25 11:39:03');
INSERT INTO `sys_oper_log`
VALUES (721, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-25 11:44:57');
INSERT INTO `sys_oper_log`
VALUES (722, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-25 19:35:04');
INSERT INTO `sys_oper_log`
VALUES (723, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-25 19:35:47');
INSERT INTO `sys_oper_log`
VALUES (724, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-26 15:33:18');
INSERT INTO `sys_oper_log`
VALUES (725, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-26 15:39:10');
INSERT INTO `sys_oper_log`
VALUES (726, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-26 15:39:35');
INSERT INTO `sys_oper_log`
VALUES (727, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-26 15:40:35');
INSERT INTO `sys_oper_log`
VALUES (728, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL,
        '/system/user/export', '172.17.1.69', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0,
        NULL, '2022-05-26 15:57:38');
INSERT INTO `sys_oper_log`
VALUES (729, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP', 'angeek_authority_revoke,angeek_authority_revoke_history',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 15:54:26');
INSERT INTO `sys_oper_log`
VALUES (730, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-05-31 15:54:41');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`
(
    `post_id`     bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
    `post_code`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '岗位编码',
    `post_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '岗位名称',
    `post_sort`   int(4)                                                        NOT NULL COMMENT '显示顺序',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NOT NULL COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post`
VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_post`
VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_post`
VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_post`
VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-11-18 14:34:32', '', NULL, '');
INSERT INTO `sys_post`
VALUES (7, 'AA', 'AAAI', 5, '0', 'admin', '2021-11-19 10:57:40', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`             bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_name`           varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '角色名称',
    `role_key`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
    `role_sort`           int(4)                                                        NOT NULL COMMENT '显示顺序',
    `data_scope`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    `menu_check_strictly` tinyint(1)                                                    NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
    `dept_check_strictly` tinyint(1)                                                    NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
    `status`              char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NOT NULL COMMENT '角色状态（0正常 1停用）',
    `del_flag`            char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`         datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`         datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    `remark`              varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-11-18 14:34:32', '', NULL, '超级管理员');
INSERT INTO `sys_role`
VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-11-18 14:34:32', 'admin', '2021-11-25 23:16:48',
        '普通角色');
INSERT INTO `sys_role`
VALUES (3, '系统测试员', 'system', 0, '1', 1, 1, '0', '0', 'admin', '2021-11-27 21:30:54', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`
(
    `role_id` bigint(20) NOT NULL COMMENT '角色ID',
    `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '角色和部门关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept`
VALUES (2, 100);
INSERT INTO `sys_role_dept`
VALUES (2, 101);
INSERT INTO `sys_role_dept`
VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `role_id` bigint(20) NOT NULL COMMENT '角色ID',
    `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu`
VALUES (2, 1);
INSERT INTO `sys_role_menu`
VALUES (2, 2);
INSERT INTO `sys_role_menu`
VALUES (2, 3);
INSERT INTO `sys_role_menu`
VALUES (2, 100);
INSERT INTO `sys_role_menu`
VALUES (2, 101);
INSERT INTO `sys_role_menu`
VALUES (2, 102);
INSERT INTO `sys_role_menu`
VALUES (2, 103);
INSERT INTO `sys_role_menu`
VALUES (2, 104);
INSERT INTO `sys_role_menu`
VALUES (2, 105);
INSERT INTO `sys_role_menu`
VALUES (2, 106);
INSERT INTO `sys_role_menu`
VALUES (2, 107);
INSERT INTO `sys_role_menu`
VALUES (2, 108);
INSERT INTO `sys_role_menu`
VALUES (2, 109);
INSERT INTO `sys_role_menu`
VALUES (2, 110);
INSERT INTO `sys_role_menu`
VALUES (2, 111);
INSERT INTO `sys_role_menu`
VALUES (2, 112);
INSERT INTO `sys_role_menu`
VALUES (2, 113);
INSERT INTO `sys_role_menu`
VALUES (2, 114);
INSERT INTO `sys_role_menu`
VALUES (2, 115);
INSERT INTO `sys_role_menu`
VALUES (2, 116);
INSERT INTO `sys_role_menu`
VALUES (2, 500);
INSERT INTO `sys_role_menu`
VALUES (2, 501);
INSERT INTO `sys_role_menu`
VALUES (2, 1001);
INSERT INTO `sys_role_menu`
VALUES (2, 1002);
INSERT INTO `sys_role_menu`
VALUES (2, 1003);
INSERT INTO `sys_role_menu`
VALUES (2, 1004);
INSERT INTO `sys_role_menu`
VALUES (2, 1005);
INSERT INTO `sys_role_menu`
VALUES (2, 1006);
INSERT INTO `sys_role_menu`
VALUES (2, 1007);
INSERT INTO `sys_role_menu`
VALUES (2, 1008);
INSERT INTO `sys_role_menu`
VALUES (2, 1009);
INSERT INTO `sys_role_menu`
VALUES (2, 1010);
INSERT INTO `sys_role_menu`
VALUES (2, 1011);
INSERT INTO `sys_role_menu`
VALUES (2, 1012);
INSERT INTO `sys_role_menu`
VALUES (2, 1013);
INSERT INTO `sys_role_menu`
VALUES (2, 1014);
INSERT INTO `sys_role_menu`
VALUES (2, 1015);
INSERT INTO `sys_role_menu`
VALUES (2, 1016);
INSERT INTO `sys_role_menu`
VALUES (2, 1017);
INSERT INTO `sys_role_menu`
VALUES (2, 1018);
INSERT INTO `sys_role_menu`
VALUES (2, 1019);
INSERT INTO `sys_role_menu`
VALUES (2, 1020);
INSERT INTO `sys_role_menu`
VALUES (2, 1021);
INSERT INTO `sys_role_menu`
VALUES (2, 1022);
INSERT INTO `sys_role_menu`
VALUES (2, 1023);
INSERT INTO `sys_role_menu`
VALUES (2, 1024);
INSERT INTO `sys_role_menu`
VALUES (2, 1025);
INSERT INTO `sys_role_menu`
VALUES (2, 1026);
INSERT INTO `sys_role_menu`
VALUES (2, 1027);
INSERT INTO `sys_role_menu`
VALUES (2, 1028);
INSERT INTO `sys_role_menu`
VALUES (2, 1029);
INSERT INTO `sys_role_menu`
VALUES (2, 1030);
INSERT INTO `sys_role_menu`
VALUES (2, 1031);
INSERT INTO `sys_role_menu`
VALUES (2, 1032);
INSERT INTO `sys_role_menu`
VALUES (2, 1033);
INSERT INTO `sys_role_menu`
VALUES (2, 1034);
INSERT INTO `sys_role_menu`
VALUES (2, 1035);
INSERT INTO `sys_role_menu`
VALUES (2, 1036);
INSERT INTO `sys_role_menu`
VALUES (2, 1037);
INSERT INTO `sys_role_menu`
VALUES (2, 1038);
INSERT INTO `sys_role_menu`
VALUES (2, 1039);
INSERT INTO `sys_role_menu`
VALUES (2, 1040);
INSERT INTO `sys_role_menu`
VALUES (2, 1041);
INSERT INTO `sys_role_menu`
VALUES (2, 1042);
INSERT INTO `sys_role_menu`
VALUES (2, 1043);
INSERT INTO `sys_role_menu`
VALUES (2, 1044);
INSERT INTO `sys_role_menu`
VALUES (2, 1045);
INSERT INTO `sys_role_menu`
VALUES (2, 1046);
INSERT INTO `sys_role_menu`
VALUES (2, 1047);
INSERT INTO `sys_role_menu`
VALUES (2, 1048);
INSERT INTO `sys_role_menu`
VALUES (2, 1049);
INSERT INTO `sys_role_menu`
VALUES (2, 1050);
INSERT INTO `sys_role_menu`
VALUES (2, 1051);
INSERT INTO `sys_role_menu`
VALUES (2, 1052);
INSERT INTO `sys_role_menu`
VALUES (2, 1053);
INSERT INTO `sys_role_menu`
VALUES (2, 1054);
INSERT INTO `sys_role_menu`
VALUES (2, 1055);
INSERT INTO `sys_role_menu`
VALUES (2, 1056);
INSERT INTO `sys_role_menu`
VALUES (2, 1057);
INSERT INTO `sys_role_menu`
VALUES (2, 1058);
INSERT INTO `sys_role_menu`
VALUES (2, 1059);
INSERT INTO `sys_role_menu`
VALUES (2, 1060);
INSERT INTO `sys_role_menu`
VALUES (3, 1);
INSERT INTO `sys_role_menu`
VALUES (3, 2);
INSERT INTO `sys_role_menu`
VALUES (3, 3);
INSERT INTO `sys_role_menu`
VALUES (3, 100);
INSERT INTO `sys_role_menu`
VALUES (3, 101);
INSERT INTO `sys_role_menu`
VALUES (3, 102);
INSERT INTO `sys_role_menu`
VALUES (3, 103);
INSERT INTO `sys_role_menu`
VALUES (3, 104);
INSERT INTO `sys_role_menu`
VALUES (3, 105);
INSERT INTO `sys_role_menu`
VALUES (3, 106);
INSERT INTO `sys_role_menu`
VALUES (3, 107);
INSERT INTO `sys_role_menu`
VALUES (3, 108);
INSERT INTO `sys_role_menu`
VALUES (3, 109);
INSERT INTO `sys_role_menu`
VALUES (3, 110);
INSERT INTO `sys_role_menu`
VALUES (3, 111);
INSERT INTO `sys_role_menu`
VALUES (3, 112);
INSERT INTO `sys_role_menu`
VALUES (3, 113);
INSERT INTO `sys_role_menu`
VALUES (3, 114);
INSERT INTO `sys_role_menu`
VALUES (3, 115);
INSERT INTO `sys_role_menu`
VALUES (3, 116);
INSERT INTO `sys_role_menu`
VALUES (3, 500);
INSERT INTO `sys_role_menu`
VALUES (3, 501);
INSERT INTO `sys_role_menu`
VALUES (3, 1001);
INSERT INTO `sys_role_menu`
VALUES (3, 1002);
INSERT INTO `sys_role_menu`
VALUES (3, 1003);
INSERT INTO `sys_role_menu`
VALUES (3, 1004);
INSERT INTO `sys_role_menu`
VALUES (3, 1005);
INSERT INTO `sys_role_menu`
VALUES (3, 1006);
INSERT INTO `sys_role_menu`
VALUES (3, 1007);
INSERT INTO `sys_role_menu`
VALUES (3, 1008);
INSERT INTO `sys_role_menu`
VALUES (3, 1009);
INSERT INTO `sys_role_menu`
VALUES (3, 1010);
INSERT INTO `sys_role_menu`
VALUES (3, 1011);
INSERT INTO `sys_role_menu`
VALUES (3, 1012);
INSERT INTO `sys_role_menu`
VALUES (3, 1013);
INSERT INTO `sys_role_menu`
VALUES (3, 1014);
INSERT INTO `sys_role_menu`
VALUES (3, 1015);
INSERT INTO `sys_role_menu`
VALUES (3, 1016);
INSERT INTO `sys_role_menu`
VALUES (3, 1017);
INSERT INTO `sys_role_menu`
VALUES (3, 1018);
INSERT INTO `sys_role_menu`
VALUES (3, 1019);
INSERT INTO `sys_role_menu`
VALUES (3, 1020);
INSERT INTO `sys_role_menu`
VALUES (3, 1021);
INSERT INTO `sys_role_menu`
VALUES (3, 1022);
INSERT INTO `sys_role_menu`
VALUES (3, 1023);
INSERT INTO `sys_role_menu`
VALUES (3, 1024);
INSERT INTO `sys_role_menu`
VALUES (3, 1025);
INSERT INTO `sys_role_menu`
VALUES (3, 1026);
INSERT INTO `sys_role_menu`
VALUES (3, 1027);
INSERT INTO `sys_role_menu`
VALUES (3, 1028);
INSERT INTO `sys_role_menu`
VALUES (3, 1029);
INSERT INTO `sys_role_menu`
VALUES (3, 1030);
INSERT INTO `sys_role_menu`
VALUES (3, 1031);
INSERT INTO `sys_role_menu`
VALUES (3, 1032);
INSERT INTO `sys_role_menu`
VALUES (3, 1033);
INSERT INTO `sys_role_menu`
VALUES (3, 1034);
INSERT INTO `sys_role_menu`
VALUES (3, 1035);
INSERT INTO `sys_role_menu`
VALUES (3, 1036);
INSERT INTO `sys_role_menu`
VALUES (3, 1037);
INSERT INTO `sys_role_menu`
VALUES (3, 1038);
INSERT INTO `sys_role_menu`
VALUES (3, 1039);
INSERT INTO `sys_role_menu`
VALUES (3, 1040);
INSERT INTO `sys_role_menu`
VALUES (3, 1041);
INSERT INTO `sys_role_menu`
VALUES (3, 1042);
INSERT INTO `sys_role_menu`
VALUES (3, 1043);
INSERT INTO `sys_role_menu`
VALUES (3, 1044);
INSERT INTO `sys_role_menu`
VALUES (3, 1045);
INSERT INTO `sys_role_menu`
VALUES (3, 1046);
INSERT INTO `sys_role_menu`
VALUES (3, 1047);
INSERT INTO `sys_role_menu`
VALUES (3, 1048);
INSERT INTO `sys_role_menu`
VALUES (3, 1049);
INSERT INTO `sys_role_menu`
VALUES (3, 1050);
INSERT INTO `sys_role_menu`
VALUES (3, 1051);
INSERT INTO `sys_role_menu`
VALUES (3, 1052);
INSERT INTO `sys_role_menu`
VALUES (3, 1053);
INSERT INTO `sys_role_menu`
VALUES (3, 1054);
INSERT INTO `sys_role_menu`
VALUES (3, 1055);
INSERT INTO `sys_role_menu`
VALUES (3, 1056);
INSERT INTO `sys_role_menu`
VALUES (3, 1057);
INSERT INTO `sys_role_menu`
VALUES (3, 1058);
INSERT INTO `sys_role_menu`
VALUES (3, 1059);
INSERT INTO `sys_role_menu`
VALUES (3, 1060);
INSERT INTO `sys_role_menu`
VALUES (3, 1061);
INSERT INTO `sys_role_menu`
VALUES (3, 1062);
INSERT INTO `sys_role_menu`
VALUES (3, 1065);
INSERT INTO `sys_role_menu`
VALUES (3, 1066);
INSERT INTO `sys_role_menu`
VALUES (3, 1067);
INSERT INTO `sys_role_menu`
VALUES (3, 1068);
INSERT INTO `sys_role_menu`
VALUES (3, 1069);
INSERT INTO `sys_role_menu`
VALUES (3, 1070);
INSERT INTO `sys_role_menu`
VALUES (3, 1071);
INSERT INTO `sys_role_menu`
VALUES (3, 1072);
INSERT INTO `sys_role_menu`
VALUES (3, 1073);
INSERT INTO `sys_role_menu`
VALUES (3, 1074);
INSERT INTO `sys_role_menu`
VALUES (3, 1075);
INSERT INTO `sys_role_menu`
VALUES (3, 1076);
INSERT INTO `sys_role_menu`
VALUES (3, 1077);
INSERT INTO `sys_role_menu`
VALUES (3, 1078);
INSERT INTO `sys_role_menu`
VALUES (3, 1092);
INSERT INTO `sys_role_menu`
VALUES (3, 1093);
INSERT INTO `sys_role_menu`
VALUES (3, 1094);
INSERT INTO `sys_role_menu`
VALUES (3, 1095);
INSERT INTO `sys_role_menu`
VALUES (3, 1096);
INSERT INTO `sys_role_menu`
VALUES (3, 1097);
INSERT INTO `sys_role_menu`
VALUES (3, 1099);
INSERT INTO `sys_role_menu`
VALUES (3, 1100);
INSERT INTO `sys_role_menu`
VALUES (3, 1101);
INSERT INTO `sys_role_menu`
VALUES (3, 1102);
INSERT INTO `sys_role_menu`
VALUES (3, 1103);
INSERT INTO `sys_role_menu`
VALUES (3, 1104);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`     bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `dept_id`     bigint(20)                                                    NULL DEFAULT NULL COMMENT '部门ID',
    `user_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '用户账号',
    `nick_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '用户昵称',
    `user_type`   varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '用户邮箱',
    `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '手机号码',
    `sex`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
    `avatar`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像地址',
    `password`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `login_ip`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
    `login_date`  datetime(0)                                                   NULL DEFAULT NULL COMMENT '最后登录时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 106
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 111, 'admin', '吴正国', '00', 'ry@163.com', '15888888888', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-10-25 11:13:06',
        'admin', '2021-11-18 14:34:32', '', '2022-10-25 11:13:06', '管理员');
INSERT INTO `sys_user`
VALUES (2, 111, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-11-18 14:34:32',
        'admin', '2021-11-18 14:34:32', 'admin', '2021-12-08 16:00:58', '测试员');
INSERT INTO `sys_user`
VALUES (3, 111, 'wzg', '吴正国', '00', '1016241535@qq.com', '17805250021', '0', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-11-28 12:16:37',
        'admin', '2021-11-18 15:29:51', 'admin', '2021-12-08 16:01:07', NULL);
INSERT INTO `sys_user`
VALUES (100, 111, 'user01', '全球小二哥', '00', 'yam!3631006@qq.com', '18625106880', '0', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, 'admin',
        '2021-11-18 15:33:31', 'admin', '2021-12-08 16:01:12', NULL);
INSERT INTO `sys_user`
VALUES (101, 100, '1234', '123', '00', '', '13761420163', '0', '',
        '$2a$10$TwU6RJpw8x7TZec91lNpFeEUpJ8BW6uGOmHjubOgW73AZ5Jl30MaW', '0', '2', '', NULL, 'admin',
        '2021-11-20 15:45:47', '', NULL, NULL);
INSERT INTO `sys_user`
VALUES (102, 111, 'A001', '工号', '00', '100200300@163.com', '17805250022', '0', '',
        '$2a$10$w4ahJEfAVz9Zuih.YTFaweMo5UQgY7pXOGKBZ./SMXWOs57gbAnAq', '0', '0', '', NULL, 'admin',
        '2021-12-07 16:54:07', 'admin', '2021-12-08 16:01:18', NULL);
INSERT INTO `sys_user`
VALUES (103, 111, 'A002', '小二子', '00', '1015351535@163.com', '17805250023', '0', '',
        '$2a$10$pWELMDeYhgQm0VwXpUd2cut/BCIBaUF84uWWzS4wLxhPwGf58KHSK', '0', '0', '', NULL, 'admin',
        '2021-12-07 17:23:50', '', NULL, NULL);
INSERT INTO `sys_user`
VALUES (104, 112, 'A005', '小吴', '00', '1016241535@qq.com', '17805250031', '0', '',
        '$2a$10$stXYVozEQqlz.CzQ1ofIOeW5XMNf8lbiyI2/kTTfyaDPIbHPIGKGK', '0', '0', '', NULL, 'admin',
        '2021-12-08 16:09:45', '', NULL, NULL);
INSERT INTO `sys_user`
VALUES (105, 112, 'A006', '小吴02', '00', '1016241535@qq.com', '17805250031', '0', '',
        '$2a$10$ryKp8IjUUE30V7knVno9MOVQ3qJSLyeaLZZFY0OuxAuuxDrC4WzKm', '0', '0', '', NULL, 'admin',
        '2021-12-08 16:14:51', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`
(
    `user_id` bigint(20) NOT NULL COMMENT '用户ID',
    `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
    PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户与岗位关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post`
VALUES (1, 1);
INSERT INTO `sys_user_post`
VALUES (2, 2);
INSERT INTO `sys_user_post`
VALUES (3, 1);
INSERT INTO `sys_user_post`
VALUES (100, 1);
INSERT INTO `sys_user_post`
VALUES (102, 1);
INSERT INTO `sys_user_post`
VALUES (103, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `user_id` bigint(20) NOT NULL COMMENT '用户ID',
    `role_id` bigint(20) NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户和角色关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES (1, 1);
INSERT INTO `sys_user_role`
VALUES (2, 2);
INSERT INTO `sys_user_role`
VALUES (3, 3);
INSERT INTO `sys_user_role`
VALUES (100, 2);
INSERT INTO `sys_user_role`
VALUES (102, 3);
INSERT INTO `sys_user_role`
VALUES (103, 3);

-- ----------------------------
-- Table structure for user_profile
-- ----------------------------
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile`
(
    `id`                    int(11)                                                      NOT NULL,
    `device_id`             int(11)                                                      NOT NULL,
    `gender`                varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `age`                   int(11)                                                      NULL DEFAULT NULL,
    `university`            varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `gpa`                   float                                                        NULL DEFAULT NULL,
    `active_days_within_30` int(11)                                                      NULL DEFAULT NULL,
    `question_cnt`          float                                                        NULL DEFAULT NULL,
    `answer_cnt`            float                                                        NULL DEFAULT NULL
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_profile
-- ----------------------------
INSERT INTO `user_profile`
VALUES (1, 2138, 'male', 21, '北京大学', 3.4, 7, 2, 12);
INSERT INTO `user_profile`
VALUES (2, 3214, 'male', NULL, '复旦大学', 4, 15, 5, 25);
INSERT INTO `user_profile`
VALUES (3, 6543, 'female', 20, '北京大学', 3.2, 12, 3, 30);
INSERT INTO `user_profile`
VALUES (4, 2315, 'female', 23, '浙江大学', 3.6, 5, 1, 2);
INSERT INTO `user_profile`
VALUES (5, 5432, 'male', 25, '山东大学', 3.8, 20, 15, 70);
INSERT INTO `user_profile`
VALUES (6, 2131, 'male', 28, '山东大学', 3.3, 15, 7, 13);
INSERT INTO `user_profile`
VALUES (7, 4321, 'male', 28, '复旦大学', 3.6, 9, 6, 52);

SET FOREIGN_KEY_CHECKS = 1;
