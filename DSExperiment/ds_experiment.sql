/*
Navicat MySQL Data Transfer

Source Server         :  graduation_design
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : ds_experiment

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2016-05-15 22:22:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chapter
-- ----------------------------
INSERT INTO `chapter` VALUES ('1', '绪论', null);
INSERT INTO `chapter` VALUES ('2', '线性表', null);
INSERT INTO `chapter` VALUES ('3', '栈和队列', null);
INSERT INTO `chapter` VALUES ('4', '串', null);
INSERT INTO `chapter` VALUES ('5', '数组和广义表', null);
INSERT INTO `chapter` VALUES ('6', '树和二叉树', null);
INSERT INTO `chapter` VALUES ('7', '图', null);
INSERT INTO `chapter` VALUES ('8', '动态存储数组', null);
INSERT INTO `chapter` VALUES ('9', '查找', null);
INSERT INTO `chapter` VALUES ('10', '内部存储', null);
INSERT INTO `chapter` VALUES ('11', '外部排序', null);
INSERT INTO `chapter` VALUES ('12', '文件', null);

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '信管一班', '123');
INSERT INTO `major` VALUES ('2', '信管二班', '123');
INSERT INTO `major` VALUES ('3', '信管三班', '123');
INSERT INTO `major` VALUES ('4', '计算机一班', '123');
INSERT INTO `major` VALUES ('5', '计算机二班', '123');
INSERT INTO `major` VALUES ('6', '计算机三班', '123');
INSERT INTO `major` VALUES ('7', '网络一班', '123');
INSERT INTO `major` VALUES ('8', '物联网一班', '123');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `FK_question_chapter` (`chapter_id`),
  CONSTRAINT `FK_question_chapter` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '2', '删除单链表123', '试设计实现删除单链表中值相同的多余结点的算法。');
INSERT INTO `question` VALUES ('5', '2', '删除单链表', '试设计实现删除单链表中值相同的多余结点的算法。');
INSERT INTO `question` VALUES ('6', '2', '单链表删除第i个节点', '设计在无头结点的单链表中删除第i个结点的算法。');
INSERT INTO `question` VALUES ('7', '2', '求表长', '在单链表上实现线性表的求表长ListLength(L)运算。');
INSERT INTO `question` VALUES ('8', '2', '带表头的链表逆置', '设计将带表头的链表逆置算法');
INSERT INTO `question` VALUES ('9', '2', '结点链接', '假设有一个带表头结点的链表，表头指针为head，每个结点含三个域：data, next和prior。其中data为整型数域，next和prior均为指针域。现在所有结点已经由next域连接起来，试编一个算法，利用prior域（此域初值为NULL）把所有结点按照其值从小到大的顺序链接起来。');
INSERT INTO `question` VALUES ('10', '2', '按要求删除元素', ' 已知线性表的元素按递增顺序排列，并以带头结点的单链表作存储结构。试编写一个删除表中所有值大于min且小于max的元素（若表中存在这样的元素）的算法。');
INSERT INTO `question` VALUES ('11', '2', '按要求删除2', ' 已知线性表的元素是无序的，且以带头结点的单链表作为存储结构。设计一个删除表中所有值小于max但大于min的元素的算法。');
INSERT INTO `question` VALUES ('12', '2', '按要求删除插入', '假定用一个单循环链表来表示队列（也称为循环队列），该队列只设一个队尾指针，不设队首指针，试编写下列各种运算的算法：  （1）向循环链队列插入一个元素值为x的结点； （2）从循环链队列中删除一个结点。');
INSERT INTO `question` VALUES ('13', '2', '有序性', ' 设顺序表L是一个递减有序表，试写一算法，将x插入其后仍保持L的有序性。');
INSERT INTO `question` VALUES ('17', '2', '先行', '123123123123213额外企鹅全文完全');
INSERT INTO `question` VALUES ('19', '1', '2', '删除单链表123');
INSERT INTO `question` VALUES ('20', '5', '2', '删除单链表');
INSERT INTO `question` VALUES ('21', '6', '2', '单链表删除第i个节点');
INSERT INTO `question` VALUES ('22', '7', '2', '求表长');
INSERT INTO `question` VALUES ('23', '8', '2', '带表头的链表逆置');
INSERT INTO `question` VALUES ('24', '9', '2', '结点链接');
INSERT INTO `question` VALUES ('25', '10', '2', '按要求删除元素');
INSERT INTO `question` VALUES ('26', '11', '2', '按要求删除2');
INSERT INTO `question` VALUES ('27', '12', '2', '按要求删除插入');

-- ----------------------------
-- Table structure for sign_in
-- ----------------------------
DROP TABLE IF EXISTS `sign_in`;
CREATE TABLE `sign_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(15) NOT NULL,
  `sign_in_datetime` datetime NOT NULL,
  `sign_in_status` int(11) NOT NULL,
  `upload_time` datetime DEFAULT NULL,
  `upload_state` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_sign_in_student` (`student_id`),
  CONSTRAINT `FK_sign_in_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign_in
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `s_Id` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT '123',
  `major_id` int(10) NOT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_major_student` (`major_id`),
  CONSTRAINT `FK_major_student` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '311209030114', '符宇轩', '123', '1', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('2', '311209030101', '封禅大典', '123', '1', '18300302202', '1223522');
INSERT INTO `student` VALUES ('3', '311209030102', '战三', '123', '1', '21321312312', '1231321');
INSERT INTO `student` VALUES ('4', '311209030115', '网无比', '123', '1', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('5', '311209030116', '撒旦噶啥', '123', '1', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('6', '311209030118', '杀寇决', '123', '1', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('7', '311209030218', '大三班倒', '123', '2', '18300602215', '303062086');
INSERT INTO `student` VALUES ('8', '311209030214', '符宇轩2', '123', '2', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('9', '311209030201', '封禅大典2', '123', '2', '18300302202', '1223522');
INSERT INTO `student` VALUES ('10', '311209030202', '战三2', '123', '2', '21321312312', '1231321');
INSERT INTO `student` VALUES ('11', '311209030215', '网无比2', '123', '2', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('12', '311209030216', '撒旦噶啥2', '123', '2', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('13', '311209030220', '杀寇决2', '123', '2', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('14', '311209030502', '战三5', '123', '5', '21321312312', '1231321');
INSERT INTO `student` VALUES ('15', '311209030516', '撒旦噶啥5', '123', '5', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('16', '311209030601', '封禅大典6', '123', '6', '18300302202', '1223522');
INSERT INTO `student` VALUES ('17', '311209030602', '战三6', '123', '6', '21321312312', '1231321');
INSERT INTO `student` VALUES ('18', '311209030620', '杀寇决6', '123', '6', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('19', '311209030501', '封禅大典5', '123', '5', '18300302202', '1223522');
INSERT INTO `student` VALUES ('20', '311209030515', '网无比5', '123', '5', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('21', '311209030518', '杀寇决5', '123', '5', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('22', '311209030618', '大三班倒6', '123', '6', '18300602215', '303062086');
INSERT INTO `student` VALUES ('23', '311209030614', '符宇轩6', '123', '6', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('24', '311209030615', '网无比6', '123', '6', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('25', '311209030616', '撒旦噶啥6', '123', '6', '18300602215', '303062086@qq.com');
INSERT INTO `student` VALUES ('26', '311209030514', '符宇轩5', '123', '5', '18300602215', '303062086@qq.com');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `major_id` int(11) NOT NULL,
  `task_date` date NOT NULL,
  `add_state` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------

-- ----------------------------
-- Table structure for task_detail
-- ----------------------------
DROP TABLE IF EXISTS `task_detail`;
CREATE TABLE `task_detail` (
  `task_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`,`question_id`,`student_id`),
  KEY `FK_task_detail_question` (`question_id`),
  KEY `FK_task_detail_student` (`student_id`),
  CONSTRAINT `FK_task_detail_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `FK_task_detail_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_task_detail_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_detail
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `t_id` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT '123',
  `telephone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('2', '42209030214', '申老师', '123', '123456789', '303062086@qq.com');
INSERT INTO `teacher` VALUES ('3', '422209030201', '符老师', '123', '18300602215', '303062086@qq.com');

-- ----------------------------
-- Table structure for teacher_major
-- ----------------------------
DROP TABLE IF EXISTS `teacher_major`;
CREATE TABLE `teacher_major` (
  `teacher_id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  PRIMARY KEY (`teacher_id`,`major_id`),
  KEY `FK_major_id` (`major_id`),
  CONSTRAINT `FK_major_id` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_major
-- ----------------------------
INSERT INTO `teacher_major` VALUES ('2', '1');
INSERT INTO `teacher_major` VALUES ('2', '2');
INSERT INTO `teacher_major` VALUES ('2', '3');
INSERT INTO `teacher_major` VALUES ('2', '4');
INSERT INTO `teacher_major` VALUES ('3', '5');
INSERT INTO `teacher_major` VALUES ('3', '6');
INSERT INTO `teacher_major` VALUES ('3', '7');
INSERT INTO `teacher_major` VALUES ('3', '8');
