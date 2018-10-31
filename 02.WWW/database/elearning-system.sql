/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : elearning-system

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-10-31 16:38:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for backend_access_log
-- ----------------------------
DROP TABLE IF EXISTS `backend_access_log`;
CREATE TABLE `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of backend_access_log
-- ----------------------------
INSERT INTO `backend_access_log` VALUES ('1', '1', '127.0.0.1', '2018-07-13 14:53:16', '2018-07-13 14:53:16');
INSERT INTO `backend_access_log` VALUES ('2', '1', '127.0.0.1', '2018-07-28 13:38:04', '2018-07-28 13:38:04');

-- ----------------------------
-- Table structure for backend_users
-- ----------------------------
DROP TABLE IF EXISTS `backend_users`;
CREATE TABLE `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of backend_users
-- ----------------------------
INSERT INTO `backend_users` VALUES ('1', 'Sys', 'Admin', 'admin', 'admin@domain.tld', '$2y$10$SzWfph2Gd6RSXSI0XIWoKOl5MTfyzZE2Y/..lfw9otJXUF/AWgOKa', null, '$2y$10$IN3og0pAPP1YTJW94L17MOPCtK7FtmK3LSPWikPeqjSYLYEvtKNB.', null, '', '1', '2', null, '2018-07-28 13:38:03', '2018-07-13 14:53:00', '2018-07-28 13:38:03', '1');

-- ----------------------------
-- Table structure for backend_users_groups
-- ----------------------------
DROP TABLE IF EXISTS `backend_users_groups`;
CREATE TABLE `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of backend_users_groups
-- ----------------------------
INSERT INTO `backend_users_groups` VALUES ('1', '1');

-- ----------------------------
-- Table structure for backend_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `backend_user_groups`;
CREATE TABLE `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of backend_user_groups
-- ----------------------------
INSERT INTO `backend_user_groups` VALUES ('1', 'Owners', '2018-07-13 14:52:59', '2018-07-13 14:52:59', 'owners', 'Default group for website owners.', '0');

-- ----------------------------
-- Table structure for backend_user_preferences
-- ----------------------------
DROP TABLE IF EXISTS `backend_user_preferences`;
CREATE TABLE `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of backend_user_preferences
-- ----------------------------

-- ----------------------------
-- Table structure for backend_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `backend_user_roles`;
CREATE TABLE `backend_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of backend_user_roles
-- ----------------------------
INSERT INTO `backend_user_roles` VALUES ('1', 'Publisher', 'publisher', 'Site editor with access to publishing tools.', '', '1', '2018-07-13 14:52:59', '2018-07-13 14:52:59');
INSERT INTO `backend_user_roles` VALUES ('2', 'Developer', 'developer', 'Site administrator with access to developer tools.', '', '1', '2018-07-13 14:52:59', '2018-07-13 14:52:59');

-- ----------------------------
-- Table structure for backend_user_throttle
-- ----------------------------
DROP TABLE IF EXISTS `backend_user_throttle`;
CREATE TABLE `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of backend_user_throttle
-- ----------------------------
INSERT INTO `backend_user_throttle` VALUES ('1', '1', '127.0.0.1', '0', null, '0', null, '0', null);

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cache
-- ----------------------------

-- ----------------------------
-- Table structure for cms_theme_data
-- ----------------------------
DROP TABLE IF EXISTS `cms_theme_data`;
CREATE TABLE `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_theme_data
-- ----------------------------

-- ----------------------------
-- Table structure for cms_theme_logs
-- ----------------------------
DROP TABLE IF EXISTS `cms_theme_logs`;
CREATE TABLE `cms_theme_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_theme_logs
-- ----------------------------

-- ----------------------------
-- Table structure for deferred_bindings
-- ----------------------------
DROP TABLE IF EXISTS `deferred_bindings`;
CREATE TABLE `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`),
  KEY `deferred_bindings_session_key_index` (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of deferred_bindings
-- ----------------------------

-- ----------------------------
-- Table structure for elearning_system_answers
-- ----------------------------
DROP TABLE IF EXISTS `elearning_system_answers`;
CREATE TABLE `elearning_system_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `answer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` int(11) NOT NULL,
  `is_correct` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of elearning_system_answers
-- ----------------------------
INSERT INTO `elearning_system_answers` VALUES ('13', '1', '5', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('14', '2', '5', '1', null, null);
INSERT INTO `elearning_system_answers` VALUES ('15', '3', '5', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('16', '4', '5', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('17', '1', '6', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('18', '2', '6', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('19', '3', '6', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('20', '4', '6', '1', null, null);
INSERT INTO `elearning_system_answers` VALUES ('21', '3', '7', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('22', '4', '7', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('23', '5', '7', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('24', '6', '7', '1', null, null);
INSERT INTO `elearning_system_answers` VALUES ('25', '5', '8', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('26', '10', '8', '1', null, null);
INSERT INTO `elearning_system_answers` VALUES ('27', '15', '8', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('28', '20', '8', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('29', '<input type=\"list\" />', '9', '0', null, null);
INSERT INTO `elearning_system_answers` VALUES ('30', ' <select></select>', '9', '1', null, null);
INSERT INTO `elearning_system_answers` VALUES ('31', '<list></list>', '9', '1', null, null);
INSERT INTO `elearning_system_answers` VALUES ('32', '<input type=\"dropdown\" />', '9', '0', null, null);

-- ----------------------------
-- Table structure for elearning_system_courses
-- ----------------------------
DROP TABLE IF EXISTS `elearning_system_courses`;
CREATE TABLE `elearning_system_courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `publish` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `level_id` int(10) unsigned DEFAULT NULL,
  `subject_id` int(10) unsigned DEFAULT NULL,
  `rating` double NOT NULL,
  `total_student` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_highlight` int(11) NOT NULL,
  `total_lesson` int(11) NOT NULL,
  `total_time_learn` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `elearning_system_courses_name_unique` (`name`),
  KEY `elearning_system_courses_level_id_foreign` (`level_id`),
  KEY `elearning_system_courses_subject_id_foreign` (`subject_id`),
  KEY `elearning_system_courses_slug_unique` (`slug`) USING BTREE,
  CONSTRAINT `elearning_system_courses_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `elearning_system_levels` (`id`),
  CONSTRAINT `elearning_system_courses_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `elearning_system_subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of elearning_system_courses
-- ----------------------------
INSERT INTO `elearning_system_courses` VALUES ('1', 'Complete Guide to Tensor Flow for Deep', 'complete-guide-to-tensor-flow-for-deep', '1', '2018-09-06 07:05:05', '2018-09-06 14:46:52', '1', '3', '4', '10', '8', '/courses/card_mh1.jpg', '1', '30', '120', '<p class=\"bold-ders font-weight-bold\">Giới thiệu</p>\r\n\r\n<p class=\"text-ders\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquavLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>\r\n\r\n<p class=\"bold-ders font-weight-bold\">Mục tiêu môn học</p>\r\n\r\n<p class=\"text-ders\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquavLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p class=\"bold-ders font-weight-bold\">Yêu cầu</p>\r\n\r\n<p class=\"text-ders dot_start\">* Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>\r\n\r\n<p class=\"text-ders dot_start\">* Tempor incididunt ut labore et dolore magna aliquav.</p>\r\n\r\n<p class=\"text-ders dot_start\">* Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>\r\n\r\n<p class=\"text-ders dot_start\">* Tempor incididunt ut labore et dolore magna aliquav</p>\r\n\r\n<p class=\"text-ders dot_start\">* Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>\r\n\r\n<p class=\"text-ders dot_start\">* Tempor incididunt ut labore et dolore magna aliquav.</p>\r\n\r\n<p class=\"bold-ders font-weight-bold\">Nội dung chương trình</p>\r\n\r\n<p class=\"text-ders\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquavLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>\r\n\r\n<p>\r\n	<br>\r\n</p>\r\n\r\n<p class=\"text-ders\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquavLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquaLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquavLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>\r\n\r\n<p>\r\n	<br>\r\n</p>\r\n\r\n<p class=\"text-ders\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquavLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>', '<p class=\"ders_hover\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>\r\n\r\n<p class=\"dot\">Lorem ipsum dolor sit amet, cons', '699000', '499000');
INSERT INTO `elearning_system_courses` VALUES ('3', 'Complete Guide to Tensor Flow for Deep 2', 'complete-guide-to-tensor-flow-for-deep-2', '1', '2018-09-06 07:21:36', '2018-09-06 14:47:00', '2', '3', '0', '10', '8', '/courses/card_mh2.jpg', '1', '30', '120', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,</p>', '<p class=\"ders_hover\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>\r\n\r\n<p class=\"dot\">Lorem ipsum dolor sit amet, cons', '2500000', '2200000');
INSERT INTO `elearning_system_courses` VALUES ('4', 'Complete Guide to Tensor Flow for Deep 3', 'complete-guide-to-tensor-flow-for-deep-3', '1', '2018-09-06 07:22:14', '2018-09-06 14:47:09', '3', '3', '0', '10', '8', '/courses/card_mh3.jpg', '1', '30', '120', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,</p>', '<p class=\"ders_hover\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>\r\n\r\n<p class=\"dot\">Lorem ipsum dolor sit amet, cons', '3000000', '2500000');
INSERT INTO `elearning_system_courses` VALUES ('5', 'Complete Guide to Tensor Flow for Deep 4', 'complete-guide-to-tensor-flow-for-deep-4', '1', '2018-09-06 07:22:49', '2018-09-06 14:47:15', '3', '3', '0', '10', '8', '/courses/card_mh4.jpg', '1', '30', '120', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed d</p>', '<p class=\"ders_hover\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>\r\n\r\n<p class=\"dot\">Lorem ipsum dolor sit amet, cons', '3500000', '3000000');
INSERT INTO `elearning_system_courses` VALUES ('7', 'dssdsdsd', 'dssdsdsd', '1', null, null, '3', '3', '5', '333', '8', '/courses/1540217263.jpg', '0', '3333', '33333', 'fdfdfddfdfd', 'fdfdfdff', null, null);

-- ----------------------------
-- Table structure for elearning_system_course_student
-- ----------------------------
DROP TABLE IF EXISTS `elearning_system_course_student`;
CREATE TABLE `elearning_system_course_student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of elearning_system_course_student
-- ----------------------------
INSERT INTO `elearning_system_course_student` VALUES ('2', '3', '11', '1', null, null);
INSERT INTO `elearning_system_course_student` VALUES ('3', '0', '13', '1', null, null);
INSERT INTO `elearning_system_course_student` VALUES ('4', '3', '13', '1', null, null);

-- ----------------------------
-- Table structure for elearning_system_district
-- ----------------------------
DROP TABLE IF EXISTS `elearning_system_district`;
CREATE TABLE `elearning_system_district` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=974 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of elearning_system_district
-- ----------------------------
INSERT INTO `elearning_system_district` VALUES ('1', 'Quận Ba Đình', 'Quận', '1');
INSERT INTO `elearning_system_district` VALUES ('2', 'Quận Hoàn Kiếm', 'Quận', '1');
INSERT INTO `elearning_system_district` VALUES ('3', 'Quận Tây Hồ', 'Quận', '1');
INSERT INTO `elearning_system_district` VALUES ('4', 'Quận Long Biên', 'Quận', '1');
INSERT INTO `elearning_system_district` VALUES ('5', 'Quận Cầu Giấy', 'Quận', '1');
INSERT INTO `elearning_system_district` VALUES ('6', 'Quận Đống Đa', 'Quận', '1');
INSERT INTO `elearning_system_district` VALUES ('7', 'Quận Hai Bà Trưng', 'Quận', '1');
INSERT INTO `elearning_system_district` VALUES ('8', 'Quận Hoàng Mai', 'Quận', '1');
INSERT INTO `elearning_system_district` VALUES ('9', 'Quận Thanh Xuân', 'Quận', '1');
INSERT INTO `elearning_system_district` VALUES ('16', 'Huyện Sóc Sơn', 'Huyện', '1');
INSERT INTO `elearning_system_district` VALUES ('17', 'Huyện Đông Anh', 'Huyện', '1');
INSERT INTO `elearning_system_district` VALUES ('18', 'Huyện Gia Lâm', 'Huyện', '1');
INSERT INTO `elearning_system_district` VALUES ('19', 'Quận Nam Từ Liêm', 'Quận', '1');
INSERT INTO `elearning_system_district` VALUES ('20', 'Huyện Thanh Trì', 'Huyện', '1');
INSERT INTO `elearning_system_district` VALUES ('21', 'Quận Bắc Từ Liêm', 'Quận', '1');
INSERT INTO `elearning_system_district` VALUES ('24', 'Thành phố Hà Giang', 'Thành phố', '2');
INSERT INTO `elearning_system_district` VALUES ('26', 'Huyện Đồng Văn', 'Huyện', '2');
INSERT INTO `elearning_system_district` VALUES ('27', 'Huyện Mèo Vạc', 'Huyện', '2');
INSERT INTO `elearning_system_district` VALUES ('28', 'Huyện Yên Minh', 'Huyện', '2');
INSERT INTO `elearning_system_district` VALUES ('29', 'Huyện Quản Bạ', 'Huyện', '2');
INSERT INTO `elearning_system_district` VALUES ('30', 'Huyện Vị Xuyên', 'Huyện', '2');
INSERT INTO `elearning_system_district` VALUES ('31', 'Huyện Bắc Mê', 'Huyện', '2');
INSERT INTO `elearning_system_district` VALUES ('32', 'Huyện Hoàng Su Phì', 'Huyện', '2');
INSERT INTO `elearning_system_district` VALUES ('33', 'Huyện Xín Mần', 'Huyện', '2');
INSERT INTO `elearning_system_district` VALUES ('34', 'Huyện Bắc Quang', 'Huyện', '2');
INSERT INTO `elearning_system_district` VALUES ('35', 'Huyện Quang Bình', 'Huyện', '2');
INSERT INTO `elearning_system_district` VALUES ('40', 'Thành phố Cao Bằng', 'Thành phố', '4');
INSERT INTO `elearning_system_district` VALUES ('42', 'Huyện Bảo Lâm', 'Huyện', '4');
INSERT INTO `elearning_system_district` VALUES ('43', 'Huyện Bảo Lạc', 'Huyện', '4');
INSERT INTO `elearning_system_district` VALUES ('44', 'Huyện Thông Nông', 'Huyện', '4');
INSERT INTO `elearning_system_district` VALUES ('45', 'Huyện Hà Quảng', 'Huyện', '4');
INSERT INTO `elearning_system_district` VALUES ('46', 'Huyện Trà Lĩnh', 'Huyện', '4');
INSERT INTO `elearning_system_district` VALUES ('47', 'Huyện Trùng Khánh', 'Huyện', '4');
INSERT INTO `elearning_system_district` VALUES ('48', 'Huyện Hạ Lang', 'Huyện', '4');
INSERT INTO `elearning_system_district` VALUES ('49', 'Huyện Quảng Uyên', 'Huyện', '4');
INSERT INTO `elearning_system_district` VALUES ('50', 'Huyện Phục Hoà', 'Huyện', '4');
INSERT INTO `elearning_system_district` VALUES ('51', 'Huyện Hoà An', 'Huyện', '4');
INSERT INTO `elearning_system_district` VALUES ('52', 'Huyện Nguyên Bình', 'Huyện', '4');
INSERT INTO `elearning_system_district` VALUES ('53', 'Huyện Thạch An', 'Huyện', '4');
INSERT INTO `elearning_system_district` VALUES ('58', 'Thành Phố Bắc Kạn', 'Thành phố', '6');
INSERT INTO `elearning_system_district` VALUES ('60', 'Huyện Pác Nặm', 'Huyện', '6');
INSERT INTO `elearning_system_district` VALUES ('61', 'Huyện Ba Bể', 'Huyện', '6');
INSERT INTO `elearning_system_district` VALUES ('62', 'Huyện Ngân Sơn', 'Huyện', '6');
INSERT INTO `elearning_system_district` VALUES ('63', 'Huyện Bạch Thông', 'Huyện', '6');
INSERT INTO `elearning_system_district` VALUES ('64', 'Huyện Chợ Đồn', 'Huyện', '6');
INSERT INTO `elearning_system_district` VALUES ('65', 'Huyện Chợ Mới', 'Huyện', '6');
INSERT INTO `elearning_system_district` VALUES ('66', 'Huyện Na Rì', 'Huyện', '6');
INSERT INTO `elearning_system_district` VALUES ('70', 'Thành phố Tuyên Quang', 'Thành phố', '8');
INSERT INTO `elearning_system_district` VALUES ('71', 'Huyện Lâm Bình', 'Huyện', '8');
INSERT INTO `elearning_system_district` VALUES ('72', 'Huyện Nà Hang', 'Huyện', '8');
INSERT INTO `elearning_system_district` VALUES ('73', 'Huyện Chiêm Hóa', 'Huyện', '8');
INSERT INTO `elearning_system_district` VALUES ('74', 'Huyện Hàm Yên', 'Huyện', '8');
INSERT INTO `elearning_system_district` VALUES ('75', 'Huyện Yên Sơn', 'Huyện', '8');
INSERT INTO `elearning_system_district` VALUES ('76', 'Huyện Sơn Dương', 'Huyện', '8');
INSERT INTO `elearning_system_district` VALUES ('80', 'Thành phố Lào Cai', 'Thành phố', '10');
INSERT INTO `elearning_system_district` VALUES ('82', 'Huyện Bát Xát', 'Huyện', '10');
INSERT INTO `elearning_system_district` VALUES ('83', 'Huyện Mường Khương', 'Huyện', '10');
INSERT INTO `elearning_system_district` VALUES ('84', 'Huyện Si Ma Cai', 'Huyện', '10');
INSERT INTO `elearning_system_district` VALUES ('85', 'Huyện Bắc Hà', 'Huyện', '10');
INSERT INTO `elearning_system_district` VALUES ('86', 'Huyện Bảo Thắng', 'Huyện', '10');
INSERT INTO `elearning_system_district` VALUES ('87', 'Huyện Bảo Yên', 'Huyện', '10');
INSERT INTO `elearning_system_district` VALUES ('88', 'Huyện Sa Pa', 'Huyện', '10');
INSERT INTO `elearning_system_district` VALUES ('89', 'Huyện Văn Bàn', 'Huyện', '10');
INSERT INTO `elearning_system_district` VALUES ('94', 'Thành phố Điện Biên Phủ', 'Thành phố', '11');
INSERT INTO `elearning_system_district` VALUES ('95', 'Thị Xã Mường Lay', 'Thị xã', '11');
INSERT INTO `elearning_system_district` VALUES ('96', 'Huyện Mường Nhé', 'Huyện', '11');
INSERT INTO `elearning_system_district` VALUES ('97', 'Huyện Mường Chà', 'Huyện', '11');
INSERT INTO `elearning_system_district` VALUES ('98', 'Huyện Tủa Chùa', 'Huyện', '11');
INSERT INTO `elearning_system_district` VALUES ('99', 'Huyện Tuần Giáo', 'Huyện', '11');
INSERT INTO `elearning_system_district` VALUES ('100', 'Huyện Điện Biên', 'Huyện', '11');
INSERT INTO `elearning_system_district` VALUES ('101', 'Huyện Điện Biên Đông', 'Huyện', '11');
INSERT INTO `elearning_system_district` VALUES ('102', 'Huyện Mường Ảng', 'Huyện', '11');
INSERT INTO `elearning_system_district` VALUES ('103', 'Huyện Nậm Pồ', 'Huyện', '11');
INSERT INTO `elearning_system_district` VALUES ('105', 'Thành phố Lai Châu', 'Thành phố', '12');
INSERT INTO `elearning_system_district` VALUES ('106', 'Huyện Tam Đường', 'Huyện', '12');
INSERT INTO `elearning_system_district` VALUES ('107', 'Huyện Mường Tè', 'Huyện', '12');
INSERT INTO `elearning_system_district` VALUES ('108', 'Huyện Sìn Hồ', 'Huyện', '12');
INSERT INTO `elearning_system_district` VALUES ('109', 'Huyện Phong Thổ', 'Huyện', '12');
INSERT INTO `elearning_system_district` VALUES ('110', 'Huyện Than Uyên', 'Huyện', '12');
INSERT INTO `elearning_system_district` VALUES ('111', 'Huyện Tân Uyên', 'Huyện', '12');
INSERT INTO `elearning_system_district` VALUES ('112', 'Huyện Nậm Nhùn', 'Huyện', '12');
INSERT INTO `elearning_system_district` VALUES ('116', 'Thành phố Sơn La', 'Thành phố', '14');
INSERT INTO `elearning_system_district` VALUES ('118', 'Huyện Quỳnh Nhai', 'Huyện', '14');
INSERT INTO `elearning_system_district` VALUES ('119', 'Huyện Thuận Châu', 'Huyện', '14');
INSERT INTO `elearning_system_district` VALUES ('120', 'Huyện Mường La', 'Huyện', '14');
INSERT INTO `elearning_system_district` VALUES ('121', 'Huyện Bắc Yên', 'Huyện', '14');
INSERT INTO `elearning_system_district` VALUES ('122', 'Huyện Phù Yên', 'Huyện', '14');
INSERT INTO `elearning_system_district` VALUES ('123', 'Huyện Mộc Châu', 'Huyện', '14');
INSERT INTO `elearning_system_district` VALUES ('124', 'Huyện Yên Châu', 'Huyện', '14');
INSERT INTO `elearning_system_district` VALUES ('125', 'Huyện Mai Sơn', 'Huyện', '14');
INSERT INTO `elearning_system_district` VALUES ('126', 'Huyện Sông Mã', 'Huyện', '14');
INSERT INTO `elearning_system_district` VALUES ('127', 'Huyện Sốp Cộp', 'Huyện', '14');
INSERT INTO `elearning_system_district` VALUES ('128', 'Huyện Vân Hồ', 'Huyện', '14');
INSERT INTO `elearning_system_district` VALUES ('132', 'Thành phố Yên Bái', 'Thành phố', '15');
INSERT INTO `elearning_system_district` VALUES ('133', 'Thị xã Nghĩa Lộ', 'Thị xã', '15');
INSERT INTO `elearning_system_district` VALUES ('135', 'Huyện Lục Yên', 'Huyện', '15');
INSERT INTO `elearning_system_district` VALUES ('136', 'Huyện Văn Yên', 'Huyện', '15');
INSERT INTO `elearning_system_district` VALUES ('137', 'Huyện Mù Căng Chải', 'Huyện', '15');
INSERT INTO `elearning_system_district` VALUES ('138', 'Huyện Trấn Yên', 'Huyện', '15');
INSERT INTO `elearning_system_district` VALUES ('139', 'Huyện Trạm Tấu', 'Huyện', '15');
INSERT INTO `elearning_system_district` VALUES ('140', 'Huyện Văn Chấn', 'Huyện', '15');
INSERT INTO `elearning_system_district` VALUES ('141', 'Huyện Yên Bình', 'Huyện', '15');
INSERT INTO `elearning_system_district` VALUES ('148', 'Thành phố Hòa Bình', 'Thành phố', '17');
INSERT INTO `elearning_system_district` VALUES ('150', 'Huyện Đà Bắc', 'Huyện', '17');
INSERT INTO `elearning_system_district` VALUES ('151', 'Huyện Kỳ Sơn', 'Huyện', '17');
INSERT INTO `elearning_system_district` VALUES ('152', 'Huyện Lương Sơn', 'Huyện', '17');
INSERT INTO `elearning_system_district` VALUES ('153', 'Huyện Kim Bôi', 'Huyện', '17');
INSERT INTO `elearning_system_district` VALUES ('154', 'Huyện Cao Phong', 'Huyện', '17');
INSERT INTO `elearning_system_district` VALUES ('155', 'Huyện Tân Lạc', 'Huyện', '17');
INSERT INTO `elearning_system_district` VALUES ('156', 'Huyện Mai Châu', 'Huyện', '17');
INSERT INTO `elearning_system_district` VALUES ('157', 'Huyện Lạc Sơn', 'Huyện', '17');
INSERT INTO `elearning_system_district` VALUES ('158', 'Huyện Yên Thủy', 'Huyện', '17');
INSERT INTO `elearning_system_district` VALUES ('159', 'Huyện Lạc Thủy', 'Huyện', '17');
INSERT INTO `elearning_system_district` VALUES ('164', 'Thành phố Thái Nguyên', 'Thành phố', '19');
INSERT INTO `elearning_system_district` VALUES ('165', 'Thành phố Sông Công', 'Thành phố', '19');
INSERT INTO `elearning_system_district` VALUES ('167', 'Huyện Định Hóa', 'Huyện', '19');
INSERT INTO `elearning_system_district` VALUES ('168', 'Huyện Phú Lương', 'Huyện', '19');
INSERT INTO `elearning_system_district` VALUES ('169', 'Huyện Đồng Hỷ', 'Huyện', '19');
INSERT INTO `elearning_system_district` VALUES ('170', 'Huyện Võ Nhai', 'Huyện', '19');
INSERT INTO `elearning_system_district` VALUES ('171', 'Huyện Đại Từ', 'Huyện', '19');
INSERT INTO `elearning_system_district` VALUES ('172', 'Thị xã Phổ Yên', 'Thị xã', '19');
INSERT INTO `elearning_system_district` VALUES ('173', 'Huyện Phú Bình', 'Huyện', '19');
INSERT INTO `elearning_system_district` VALUES ('178', 'Thành phố Lạng Sơn', 'Thành phố', '20');
INSERT INTO `elearning_system_district` VALUES ('180', 'Huyện Tràng Định', 'Huyện', '20');
INSERT INTO `elearning_system_district` VALUES ('181', 'Huyện Bình Gia', 'Huyện', '20');
INSERT INTO `elearning_system_district` VALUES ('182', 'Huyện Văn Lãng', 'Huyện', '20');
INSERT INTO `elearning_system_district` VALUES ('183', 'Huyện Cao Lộc', 'Huyện', '20');
INSERT INTO `elearning_system_district` VALUES ('184', 'Huyện Văn Quan', 'Huyện', '20');
INSERT INTO `elearning_system_district` VALUES ('185', 'Huyện Bắc Sơn', 'Huyện', '20');
INSERT INTO `elearning_system_district` VALUES ('186', 'Huyện Hữu Lũng', 'Huyện', '20');
INSERT INTO `elearning_system_district` VALUES ('187', 'Huyện Chi Lăng', 'Huyện', '20');
INSERT INTO `elearning_system_district` VALUES ('188', 'Huyện Lộc Bình', 'Huyện', '20');
INSERT INTO `elearning_system_district` VALUES ('189', 'Huyện Đình Lập', 'Huyện', '20');
INSERT INTO `elearning_system_district` VALUES ('193', 'Thành phố Hạ Long', 'Thành phố', '22');
INSERT INTO `elearning_system_district` VALUES ('194', 'Thành phố Móng Cái', 'Thành phố', '22');
INSERT INTO `elearning_system_district` VALUES ('195', 'Thành phố Cẩm Phả', 'Thành phố', '22');
INSERT INTO `elearning_system_district` VALUES ('196', 'Thành phố Uông Bí', 'Thành phố', '22');
INSERT INTO `elearning_system_district` VALUES ('198', 'Huyện Bình Liêu', 'Huyện', '22');
INSERT INTO `elearning_system_district` VALUES ('199', 'Huyện Tiên Yên', 'Huyện', '22');
INSERT INTO `elearning_system_district` VALUES ('200', 'Huyện Đầm Hà', 'Huyện', '22');
INSERT INTO `elearning_system_district` VALUES ('201', 'Huyện Hải Hà', 'Huyện', '22');
INSERT INTO `elearning_system_district` VALUES ('202', 'Huyện Ba Chẽ', 'Huyện', '22');
INSERT INTO `elearning_system_district` VALUES ('203', 'Huyện Vân Đồn', 'Huyện', '22');
INSERT INTO `elearning_system_district` VALUES ('204', 'Huyện Hoành Bồ', 'Huyện', '22');
INSERT INTO `elearning_system_district` VALUES ('205', 'Thị xã Đông Triều', 'Thị xã', '22');
INSERT INTO `elearning_system_district` VALUES ('206', 'Thị xã Quảng Yên', 'Thị xã', '22');
INSERT INTO `elearning_system_district` VALUES ('207', 'Huyện Cô Tô', 'Huyện', '22');
INSERT INTO `elearning_system_district` VALUES ('213', 'Thành phố Bắc Giang', 'Thành phố', '24');
INSERT INTO `elearning_system_district` VALUES ('215', 'Huyện Yên Thế', 'Huyện', '24');
INSERT INTO `elearning_system_district` VALUES ('216', 'Huyện Tân Yên', 'Huyện', '24');
INSERT INTO `elearning_system_district` VALUES ('217', 'Huyện Lạng Giang', 'Huyện', '24');
INSERT INTO `elearning_system_district` VALUES ('218', 'Huyện Lục Nam', 'Huyện', '24');
INSERT INTO `elearning_system_district` VALUES ('219', 'Huyện Lục Ngạn', 'Huyện', '24');
INSERT INTO `elearning_system_district` VALUES ('220', 'Huyện Sơn Động', 'Huyện', '24');
INSERT INTO `elearning_system_district` VALUES ('221', 'Huyện Yên Dũng', 'Huyện', '24');
INSERT INTO `elearning_system_district` VALUES ('222', 'Huyện Việt Yên', 'Huyện', '24');
INSERT INTO `elearning_system_district` VALUES ('223', 'Huyện Hiệp Hòa', 'Huyện', '24');
INSERT INTO `elearning_system_district` VALUES ('227', 'Thành phố Việt Trì', 'Thành phố', '25');
INSERT INTO `elearning_system_district` VALUES ('228', 'Thị xã Phú Thọ', 'Thị xã', '25');
INSERT INTO `elearning_system_district` VALUES ('230', 'Huyện Đoan Hùng', 'Huyện', '25');
INSERT INTO `elearning_system_district` VALUES ('231', 'Huyện Hạ Hoà', 'Huyện', '25');
INSERT INTO `elearning_system_district` VALUES ('232', 'Huyện Thanh Ba', 'Huyện', '25');
INSERT INTO `elearning_system_district` VALUES ('233', 'Huyện Phù Ninh', 'Huyện', '25');
INSERT INTO `elearning_system_district` VALUES ('234', 'Huyện Yên Lập', 'Huyện', '25');
INSERT INTO `elearning_system_district` VALUES ('235', 'Huyện Cẩm Khê', 'Huyện', '25');
INSERT INTO `elearning_system_district` VALUES ('236', 'Huyện Tam Nông', 'Huyện', '25');
INSERT INTO `elearning_system_district` VALUES ('237', 'Huyện Lâm Thao', 'Huyện', '25');
INSERT INTO `elearning_system_district` VALUES ('238', 'Huyện Thanh Sơn', 'Huyện', '25');
INSERT INTO `elearning_system_district` VALUES ('239', 'Huyện Thanh Thuỷ', 'Huyện', '25');
INSERT INTO `elearning_system_district` VALUES ('240', 'Huyện Tân Sơn', 'Huyện', '25');
INSERT INTO `elearning_system_district` VALUES ('243', 'Thành phố Vĩnh Yên', 'Thành phố', '26');
INSERT INTO `elearning_system_district` VALUES ('244', 'Thị xã Phúc Yên', 'Thị xã', '26');
INSERT INTO `elearning_system_district` VALUES ('246', 'Huyện Lập Thạch', 'Huyện', '26');
INSERT INTO `elearning_system_district` VALUES ('247', 'Huyện Tam Dương', 'Huyện', '26');
INSERT INTO `elearning_system_district` VALUES ('248', 'Huyện Tam Đảo', 'Huyện', '26');
INSERT INTO `elearning_system_district` VALUES ('249', 'Huyện Bình Xuyên', 'Huyện', '26');
INSERT INTO `elearning_system_district` VALUES ('250', 'Huyện Mê Linh', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('251', 'Huyện Yên Lạc', 'Huyện', '26');
INSERT INTO `elearning_system_district` VALUES ('252', 'Huyện Vĩnh Tường', 'Huyện', '26');
INSERT INTO `elearning_system_district` VALUES ('253', 'Huyện Sông Lô', 'Huyện', '26');
INSERT INTO `elearning_system_district` VALUES ('256', 'Thành phố Bắc Ninh', 'Thành phố', '27');
INSERT INTO `elearning_system_district` VALUES ('258', 'Huyện Yên Phong', 'Huyện', '27');
INSERT INTO `elearning_system_district` VALUES ('259', 'Huyện Quế Võ', 'Huyện', '27');
INSERT INTO `elearning_system_district` VALUES ('260', 'Huyện Tiên Du', 'Huyện', '27');
INSERT INTO `elearning_system_district` VALUES ('261', 'Thị xã Từ Sơn', 'Thị xã', '27');
INSERT INTO `elearning_system_district` VALUES ('262', 'Huyện Thuận Thành', 'Huyện', '27');
INSERT INTO `elearning_system_district` VALUES ('263', 'Huyện Gia Bình', 'Huyện', '27');
INSERT INTO `elearning_system_district` VALUES ('264', 'Huyện Lương Tài', 'Huyện', '27');
INSERT INTO `elearning_system_district` VALUES ('268', 'Quận Hà Đông', 'Quận', '01');
INSERT INTO `elearning_system_district` VALUES ('269', 'Thị xã Sơn Tây', 'Thị xã', '01');
INSERT INTO `elearning_system_district` VALUES ('271', 'Huyện Ba Vì', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('272', 'Huyện Phúc Thọ', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('273', 'Huyện Đan Phượng', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('274', 'Huyện Hoài Đức', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('275', 'Huyện Quốc Oai', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('276', 'Huyện Thạch Thất', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('277', 'Huyện Chương Mỹ', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('278', 'Huyện Thanh Oai', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('279', 'Huyện Thường Tín', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('280', 'Huyện Phú Xuyên', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('281', 'Huyện Ứng Hòa', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('282', 'Huyện Mỹ Đức', 'Huyện', '01');
INSERT INTO `elearning_system_district` VALUES ('288', 'Thành phố Hải Dương', 'Thành phố', '30');
INSERT INTO `elearning_system_district` VALUES ('290', 'Thị xã Chí Linh', 'Thị xã', '30');
INSERT INTO `elearning_system_district` VALUES ('291', 'Huyện Nam Sách', 'Huyện', '30');
INSERT INTO `elearning_system_district` VALUES ('292', 'Huyện Kinh Môn', 'Huyện', '30');
INSERT INTO `elearning_system_district` VALUES ('293', 'Huyện Kim Thành', 'Huyện', '30');
INSERT INTO `elearning_system_district` VALUES ('294', 'Huyện Thanh Hà', 'Huyện', '30');
INSERT INTO `elearning_system_district` VALUES ('295', 'Huyện Cẩm Giàng', 'Huyện', '30');
INSERT INTO `elearning_system_district` VALUES ('296', 'Huyện Bình Giang', 'Huyện', '30');
INSERT INTO `elearning_system_district` VALUES ('297', 'Huyện Gia Lộc', 'Huyện', '30');
INSERT INTO `elearning_system_district` VALUES ('298', 'Huyện Tứ Kỳ', 'Huyện', '30');
INSERT INTO `elearning_system_district` VALUES ('299', 'Huyện Ninh Giang', 'Huyện', '30');
INSERT INTO `elearning_system_district` VALUES ('300', 'Huyện Thanh Miện', 'Huyện', '30');
INSERT INTO `elearning_system_district` VALUES ('303', 'Quận Hồng Bàng', 'Quận', '31');
INSERT INTO `elearning_system_district` VALUES ('304', 'Quận Ngô Quyền', 'Quận', '31');
INSERT INTO `elearning_system_district` VALUES ('305', 'Quận Lê Chân', 'Quận', '31');
INSERT INTO `elearning_system_district` VALUES ('306', 'Quận Hải An', 'Quận', '31');
INSERT INTO `elearning_system_district` VALUES ('307', 'Quận Kiến An', 'Quận', '31');
INSERT INTO `elearning_system_district` VALUES ('308', 'Quận Đồ Sơn', 'Quận', '31');
INSERT INTO `elearning_system_district` VALUES ('309', 'Quận Dương Kinh', 'Quận', '31');
INSERT INTO `elearning_system_district` VALUES ('311', 'Huyện Thuỷ Nguyên', 'Huyện', '31');
INSERT INTO `elearning_system_district` VALUES ('312', 'Huyện An Dương', 'Huyện', '31');
INSERT INTO `elearning_system_district` VALUES ('313', 'Huyện An Lão', 'Huyện', '31');
INSERT INTO `elearning_system_district` VALUES ('314', 'Huyện Kiến Thuỵ', 'Huyện', '31');
INSERT INTO `elearning_system_district` VALUES ('315', 'Huyện Tiên Lãng', 'Huyện', '31');
INSERT INTO `elearning_system_district` VALUES ('316', 'Huyện Vĩnh Bảo', 'Huyện', '31');
INSERT INTO `elearning_system_district` VALUES ('317', 'Huyện Cát Hải', 'Huyện', '31');
INSERT INTO `elearning_system_district` VALUES ('318', 'Huyện Bạch Long Vĩ', 'Huyện', '31');
INSERT INTO `elearning_system_district` VALUES ('323', 'Thành phố Hưng Yên', 'Thành phố', '33');
INSERT INTO `elearning_system_district` VALUES ('325', 'Huyện Văn Lâm', 'Huyện', '33');
INSERT INTO `elearning_system_district` VALUES ('326', 'Huyện Văn Giang', 'Huyện', '33');
INSERT INTO `elearning_system_district` VALUES ('327', 'Huyện Yên Mỹ', 'Huyện', '33');
INSERT INTO `elearning_system_district` VALUES ('328', 'Huyện Mỹ Hào', 'Huyện', '33');
INSERT INTO `elearning_system_district` VALUES ('329', 'Huyện Ân Thi', 'Huyện', '33');
INSERT INTO `elearning_system_district` VALUES ('330', 'Huyện Khoái Châu', 'Huyện', '33');
INSERT INTO `elearning_system_district` VALUES ('331', 'Huyện Kim Động', 'Huyện', '33');
INSERT INTO `elearning_system_district` VALUES ('332', 'Huyện Tiên Lữ', 'Huyện', '33');
INSERT INTO `elearning_system_district` VALUES ('333', 'Huyện Phù Cừ', 'Huyện', '33');
INSERT INTO `elearning_system_district` VALUES ('336', 'Thành phố Thái Bình', 'Thành phố', '34');
INSERT INTO `elearning_system_district` VALUES ('338', 'Huyện Quỳnh Phụ', 'Huyện', '34');
INSERT INTO `elearning_system_district` VALUES ('339', 'Huyện Hưng Hà', 'Huyện', '34');
INSERT INTO `elearning_system_district` VALUES ('340', 'Huyện Đông Hưng', 'Huyện', '34');
INSERT INTO `elearning_system_district` VALUES ('341', 'Huyện Thái Thụy', 'Huyện', '34');
INSERT INTO `elearning_system_district` VALUES ('342', 'Huyện Tiền Hải', 'Huyện', '34');
INSERT INTO `elearning_system_district` VALUES ('343', 'Huyện Kiến Xương', 'Huyện', '34');
INSERT INTO `elearning_system_district` VALUES ('344', 'Huyện Vũ Thư', 'Huyện', '34');
INSERT INTO `elearning_system_district` VALUES ('347', 'Thành phố Phủ Lý', 'Thành phố', '35');
INSERT INTO `elearning_system_district` VALUES ('349', 'Huyện Duy Tiên', 'Huyện', '35');
INSERT INTO `elearning_system_district` VALUES ('350', 'Huyện Kim Bảng', 'Huyện', '35');
INSERT INTO `elearning_system_district` VALUES ('351', 'Huyện Thanh Liêm', 'Huyện', '35');
INSERT INTO `elearning_system_district` VALUES ('352', 'Huyện Bình Lục', 'Huyện', '35');
INSERT INTO `elearning_system_district` VALUES ('353', 'Huyện Lý Nhân', 'Huyện', '35');
INSERT INTO `elearning_system_district` VALUES ('356', 'Thành phố Nam Định', 'Thành phố', '36');
INSERT INTO `elearning_system_district` VALUES ('358', 'Huyện Mỹ Lộc', 'Huyện', '36');
INSERT INTO `elearning_system_district` VALUES ('359', 'Huyện Vụ Bản', 'Huyện', '36');
INSERT INTO `elearning_system_district` VALUES ('360', 'Huyện Ý Yên', 'Huyện', '36');
INSERT INTO `elearning_system_district` VALUES ('361', 'Huyện Nghĩa Hưng', 'Huyện', '36');
INSERT INTO `elearning_system_district` VALUES ('362', 'Huyện Nam Trực', 'Huyện', '36');
INSERT INTO `elearning_system_district` VALUES ('363', 'Huyện Trực Ninh', 'Huyện', '36');
INSERT INTO `elearning_system_district` VALUES ('364', 'Huyện Xuân Trường', 'Huyện', '36');
INSERT INTO `elearning_system_district` VALUES ('365', 'Huyện Giao Thủy', 'Huyện', '36');
INSERT INTO `elearning_system_district` VALUES ('366', 'Huyện Hải Hậu', 'Huyện', '36');
INSERT INTO `elearning_system_district` VALUES ('369', 'Thành phố Ninh Bình', 'Thành phố', '37');
INSERT INTO `elearning_system_district` VALUES ('370', 'Thành phố Tam Điệp', 'Thành phố', '37');
INSERT INTO `elearning_system_district` VALUES ('372', 'Huyện Nho Quan', 'Huyện', '37');
INSERT INTO `elearning_system_district` VALUES ('373', 'Huyện Gia Viễn', 'Huyện', '37');
INSERT INTO `elearning_system_district` VALUES ('374', 'Huyện Hoa Lư', 'Huyện', '37');
INSERT INTO `elearning_system_district` VALUES ('375', 'Huyện Yên Khánh', 'Huyện', '37');
INSERT INTO `elearning_system_district` VALUES ('376', 'Huyện Kim Sơn', 'Huyện', '37');
INSERT INTO `elearning_system_district` VALUES ('377', 'Huyện Yên Mô', 'Huyện', '37');
INSERT INTO `elearning_system_district` VALUES ('380', 'Thành phố Thanh Hóa', 'Thành phố', '38');
INSERT INTO `elearning_system_district` VALUES ('381', 'Thị xã Bỉm Sơn', 'Thị xã', '38');
INSERT INTO `elearning_system_district` VALUES ('382', 'Thị xã Sầm Sơn', 'Thị xã', '38');
INSERT INTO `elearning_system_district` VALUES ('384', 'Huyện Mường Lát', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('385', 'Huyện Quan Hóa', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('386', 'Huyện Bá Thước', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('387', 'Huyện Quan Sơn', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('388', 'Huyện Lang Chánh', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('389', 'Huyện Ngọc Lặc', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('390', 'Huyện Cẩm Thủy', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('391', 'Huyện Thạch Thành', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('392', 'Huyện Hà Trung', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('393', 'Huyện Vĩnh Lộc', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('394', 'Huyện Yên Định', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('395', 'Huyện Thọ Xuân', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('396', 'Huyện Thường Xuân', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('397', 'Huyện Triệu Sơn', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('398', 'Huyện Thiệu Hóa', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('399', 'Huyện Hoằng Hóa', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('400', 'Huyện Hậu Lộc', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('401', 'Huyện Nga Sơn', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('402', 'Huyện Như Xuân', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('403', 'Huyện Như Thanh', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('404', 'Huyện Nông Cống', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('405', 'Huyện Đông Sơn', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('406', 'Huyện Quảng Xương', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('407', 'Huyện Tĩnh Gia', 'Huyện', '38');
INSERT INTO `elearning_system_district` VALUES ('412', 'Thành phố Vinh', 'Thành phố', '40');
INSERT INTO `elearning_system_district` VALUES ('413', 'Thị xã Cửa Lò', 'Thị xã', '40');
INSERT INTO `elearning_system_district` VALUES ('414', 'Thị xã Thái Hoà', 'Thị xã', '40');
INSERT INTO `elearning_system_district` VALUES ('415', 'Huyện Quế Phong', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('416', 'Huyện Quỳ Châu', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('417', 'Huyện Kỳ Sơn', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('418', 'Huyện Tương Dương', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('419', 'Huyện Nghĩa Đàn', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('420', 'Huyện Quỳ Hợp', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('421', 'Huyện Quỳnh Lưu', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('422', 'Huyện Con Cuông', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('423', 'Huyện Tân Kỳ', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('424', 'Huyện Anh Sơn', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('425', 'Huyện Diễn Châu', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('426', 'Huyện Yên Thành', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('427', 'Huyện Đô Lương', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('428', 'Huyện Thanh Chương', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('429', 'Huyện Nghi Lộc', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('430', 'Huyện Nam Đàn', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('431', 'Huyện Hưng Nguyên', 'Huyện', '40');
INSERT INTO `elearning_system_district` VALUES ('432', 'Thị xã Hoàng Mai', 'Thị xã', '40');
INSERT INTO `elearning_system_district` VALUES ('436', 'Thành phố Hà Tĩnh', 'Thành phố', '42');
INSERT INTO `elearning_system_district` VALUES ('437', 'Thị xã Hồng Lĩnh', 'Thị xã', '42');
INSERT INTO `elearning_system_district` VALUES ('439', 'Huyện Hương Sơn', 'Huyện', '42');
INSERT INTO `elearning_system_district` VALUES ('440', 'Huyện Đức Thọ', 'Huyện', '42');
INSERT INTO `elearning_system_district` VALUES ('441', 'Huyện Vũ Quang', 'Huyện', '42');
INSERT INTO `elearning_system_district` VALUES ('442', 'Huyện Nghi Xuân', 'Huyện', '42');
INSERT INTO `elearning_system_district` VALUES ('443', 'Huyện Can Lộc', 'Huyện', '42');
INSERT INTO `elearning_system_district` VALUES ('444', 'Huyện Hương Khê', 'Huyện', '42');
INSERT INTO `elearning_system_district` VALUES ('445', 'Huyện Thạch Hà', 'Huyện', '42');
INSERT INTO `elearning_system_district` VALUES ('446', 'Huyện Cẩm Xuyên', 'Huyện', '42');
INSERT INTO `elearning_system_district` VALUES ('447', 'Huyện Kỳ Anh', 'Huyện', '42');
INSERT INTO `elearning_system_district` VALUES ('448', 'Huyện Lộc Hà', 'Huyện', '42');
INSERT INTO `elearning_system_district` VALUES ('449', 'Thị xã Kỳ Anh', 'Thị xã', '42');
INSERT INTO `elearning_system_district` VALUES ('450', 'Thành Phố Đồng Hới', 'Thành phố', '44');
INSERT INTO `elearning_system_district` VALUES ('452', 'Huyện Minh Hóa', 'Huyện', '44');
INSERT INTO `elearning_system_district` VALUES ('453', 'Huyện Tuyên Hóa', 'Huyện', '44');
INSERT INTO `elearning_system_district` VALUES ('454', 'Huyện Quảng Trạch', 'Thị xã', '44');
INSERT INTO `elearning_system_district` VALUES ('455', 'Huyện Bố Trạch', 'Huyện', '44');
INSERT INTO `elearning_system_district` VALUES ('456', 'Huyện Quảng Ninh', 'Huyện', '44');
INSERT INTO `elearning_system_district` VALUES ('457', 'Huyện Lệ Thủy', 'Huyện', '44');
INSERT INTO `elearning_system_district` VALUES ('458', 'Thị xã Ba Đồn', 'Huyện', '44');
INSERT INTO `elearning_system_district` VALUES ('461', 'Thành phố Đông Hà', 'Thành phố', '45');
INSERT INTO `elearning_system_district` VALUES ('462', 'Thị xã Quảng Trị', 'Thị xã', '45');
INSERT INTO `elearning_system_district` VALUES ('464', 'Huyện Vĩnh Linh', 'Huyện', '45');
INSERT INTO `elearning_system_district` VALUES ('465', 'Huyện Hướng Hóa', 'Huyện', '45');
INSERT INTO `elearning_system_district` VALUES ('466', 'Huyện Gio Linh', 'Huyện', '45');
INSERT INTO `elearning_system_district` VALUES ('467', 'Huyện Đa Krông', 'Huyện', '45');
INSERT INTO `elearning_system_district` VALUES ('468', 'Huyện Cam Lộ', 'Huyện', '45');
INSERT INTO `elearning_system_district` VALUES ('469', 'Huyện Triệu Phong', 'Huyện', '45');
INSERT INTO `elearning_system_district` VALUES ('470', 'Huyện Hải Lăng', 'Huyện', '45');
INSERT INTO `elearning_system_district` VALUES ('471', 'Huyện Cồn Cỏ', 'Huyện', '45');
INSERT INTO `elearning_system_district` VALUES ('474', 'Thành phố Huế', 'Thành phố', '46');
INSERT INTO `elearning_system_district` VALUES ('476', 'Huyện Phong Điền', 'Huyện', '46');
INSERT INTO `elearning_system_district` VALUES ('477', 'Huyện Quảng Điền', 'Huyện', '46');
INSERT INTO `elearning_system_district` VALUES ('478', 'Huyện Phú Vang', 'Huyện', '46');
INSERT INTO `elearning_system_district` VALUES ('479', 'Thị xã Hương Thủy', 'Thị xã', '46');
INSERT INTO `elearning_system_district` VALUES ('480', 'Thị xã Hương Trà', 'Thị xã', '46');
INSERT INTO `elearning_system_district` VALUES ('481', 'Huyện A Lưới', 'Huyện', '46');
INSERT INTO `elearning_system_district` VALUES ('482', 'Huyện Phú Lộc', 'Huyện', '46');
INSERT INTO `elearning_system_district` VALUES ('483', 'Huyện Nam Đông', 'Huyện', '46');
INSERT INTO `elearning_system_district` VALUES ('490', 'Quận Liên Chiểu', 'Quận', '48');
INSERT INTO `elearning_system_district` VALUES ('491', 'Quận Thanh Khê', 'Quận', '48');
INSERT INTO `elearning_system_district` VALUES ('492', 'Quận Hải Châu', 'Quận', '48');
INSERT INTO `elearning_system_district` VALUES ('493', 'Quận Sơn Trà', 'Quận', '48');
INSERT INTO `elearning_system_district` VALUES ('494', 'Quận Ngũ Hành Sơn', 'Quận', '48');
INSERT INTO `elearning_system_district` VALUES ('495', 'Quận Cẩm Lệ', 'Quận', '48');
INSERT INTO `elearning_system_district` VALUES ('497', 'Huyện Hòa Vang', 'Huyện', '48');
INSERT INTO `elearning_system_district` VALUES ('498', 'Huyện Hoàng Sa', 'Huyện', '48');
INSERT INTO `elearning_system_district` VALUES ('502', 'Thành phố Tam Kỳ', 'Thành phố', '49');
INSERT INTO `elearning_system_district` VALUES ('503', 'Thành phố Hội An', 'Thành phố', '49');
INSERT INTO `elearning_system_district` VALUES ('504', 'Huyện Tây Giang', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('505', 'Huyện Đông Giang', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('506', 'Huyện Đại Lộc', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('507', 'Thị xã Điện Bàn', 'Thị xã', '49');
INSERT INTO `elearning_system_district` VALUES ('508', 'Huyện Duy Xuyên', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('509', 'Huyện Quế Sơn', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('510', 'Huyện Nam Giang', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('511', 'Huyện Phước Sơn', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('512', 'Huyện Hiệp Đức', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('513', 'Huyện Thăng Bình', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('514', 'Huyện Tiên Phước', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('515', 'Huyện Bắc Trà My', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('516', 'Huyện Nam Trà My', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('517', 'Huyện Núi Thành', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('518', 'Huyện Phú Ninh', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('519', 'Huyện Nông Sơn', 'Huyện', '49');
INSERT INTO `elearning_system_district` VALUES ('522', 'Thành phố Quảng Ngãi', 'Thành phố', '51');
INSERT INTO `elearning_system_district` VALUES ('524', 'Huyện Bình Sơn', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('525', 'Huyện Trà Bồng', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('526', 'Huyện Tây Trà', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('527', 'Huyện Sơn Tịnh', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('528', 'Huyện Tư Nghĩa', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('529', 'Huyện Sơn Hà', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('530', 'Huyện Sơn Tây', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('531', 'Huyện Minh Long', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('532', 'Huyện Nghĩa Hành', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('533', 'Huyện Mộ Đức', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('534', 'Huyện Đức Phổ', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('535', 'Huyện Ba Tơ', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('536', 'Huyện Lý Sơn', 'Huyện', '51');
INSERT INTO `elearning_system_district` VALUES ('540', 'Thành phố Qui Nhơn', 'Thành phố', '52');
INSERT INTO `elearning_system_district` VALUES ('542', 'Huyện An Lão', 'Huyện', '52');
INSERT INTO `elearning_system_district` VALUES ('543', 'Huyện Hoài Nhơn', 'Huyện', '52');
INSERT INTO `elearning_system_district` VALUES ('544', 'Huyện Hoài Ân', 'Huyện', '52');
INSERT INTO `elearning_system_district` VALUES ('545', 'Huyện Phù Mỹ', 'Huyện', '52');
INSERT INTO `elearning_system_district` VALUES ('546', 'Huyện Vĩnh Thạnh', 'Huyện', '52');
INSERT INTO `elearning_system_district` VALUES ('547', 'Huyện Tây Sơn', 'Huyện', '52');
INSERT INTO `elearning_system_district` VALUES ('548', 'Huyện Phù Cát', 'Huyện', '52');
INSERT INTO `elearning_system_district` VALUES ('549', 'Thị xã An Nhơn', 'Thị xã', '52');
INSERT INTO `elearning_system_district` VALUES ('550', 'Huyện Tuy Phước', 'Huyện', '52');
INSERT INTO `elearning_system_district` VALUES ('551', 'Huyện Vân Canh', 'Huyện', '52');
INSERT INTO `elearning_system_district` VALUES ('555', 'Thành phố Tuy Hoà', 'Thành phố', '54');
INSERT INTO `elearning_system_district` VALUES ('557', 'Thị xã Sông Cầu', 'Thị xã', '54');
INSERT INTO `elearning_system_district` VALUES ('558', 'Huyện Đồng Xuân', 'Huyện', '54');
INSERT INTO `elearning_system_district` VALUES ('559', 'Huyện Tuy An', 'Huyện', '54');
INSERT INTO `elearning_system_district` VALUES ('560', 'Huyện Sơn Hòa', 'Huyện', '54');
INSERT INTO `elearning_system_district` VALUES ('561', 'Huyện Sông Hinh', 'Huyện', '54');
INSERT INTO `elearning_system_district` VALUES ('562', 'Huyện Tây Hoà', 'Huyện', '54');
INSERT INTO `elearning_system_district` VALUES ('563', 'Huyện Phú Hoà', 'Huyện', '54');
INSERT INTO `elearning_system_district` VALUES ('564', 'Huyện Đông Hòa', 'Huyện', '54');
INSERT INTO `elearning_system_district` VALUES ('568', 'Thành phố Nha Trang', 'Thành phố', '56');
INSERT INTO `elearning_system_district` VALUES ('569', 'Thành phố Cam Ranh', 'Thành phố', '56');
INSERT INTO `elearning_system_district` VALUES ('570', 'Huyện Cam Lâm', 'Huyện', '56');
INSERT INTO `elearning_system_district` VALUES ('571', 'Huyện Vạn Ninh', 'Huyện', '56');
INSERT INTO `elearning_system_district` VALUES ('572', 'Thị xã Ninh Hòa', 'Thị xã', '56');
INSERT INTO `elearning_system_district` VALUES ('573', 'Huyện Khánh Vĩnh', 'Huyện', '56');
INSERT INTO `elearning_system_district` VALUES ('574', 'Huyện Diên Khánh', 'Huyện', '56');
INSERT INTO `elearning_system_district` VALUES ('575', 'Huyện Khánh Sơn', 'Huyện', '56');
INSERT INTO `elearning_system_district` VALUES ('576', 'Huyện Trường Sa', 'Huyện', '56');
INSERT INTO `elearning_system_district` VALUES ('582', 'Thành phố Phan Rang-Tháp Chàm', 'Thành phố', '58');
INSERT INTO `elearning_system_district` VALUES ('584', 'Huyện Bác Ái', 'Huyện', '58');
INSERT INTO `elearning_system_district` VALUES ('585', 'Huyện Ninh Sơn', 'Huyện', '58');
INSERT INTO `elearning_system_district` VALUES ('586', 'Huyện Ninh Hải', 'Huyện', '58');
INSERT INTO `elearning_system_district` VALUES ('587', 'Huyện Ninh Phước', 'Huyện', '58');
INSERT INTO `elearning_system_district` VALUES ('588', 'Huyện Thuận Bắc', 'Huyện', '58');
INSERT INTO `elearning_system_district` VALUES ('589', 'Huyện Thuận Nam', 'Huyện', '58');
INSERT INTO `elearning_system_district` VALUES ('593', 'Thành phố Phan Thiết', 'Thành phố', '60');
INSERT INTO `elearning_system_district` VALUES ('594', 'Thị xã La Gi', 'Thị xã', '60');
INSERT INTO `elearning_system_district` VALUES ('595', 'Huyện Tuy Phong', 'Huyện', '60');
INSERT INTO `elearning_system_district` VALUES ('596', 'Huyện Bắc Bình', 'Huyện', '60');
INSERT INTO `elearning_system_district` VALUES ('597', 'Huyện Hàm Thuận Bắc', 'Huyện', '60');
INSERT INTO `elearning_system_district` VALUES ('598', 'Huyện Hàm Thuận Nam', 'Huyện', '60');
INSERT INTO `elearning_system_district` VALUES ('599', 'Huyện Tánh Linh', 'Huyện', '60');
INSERT INTO `elearning_system_district` VALUES ('600', 'Huyện Đức Linh', 'Huyện', '60');
INSERT INTO `elearning_system_district` VALUES ('601', 'Huyện Hàm Tân', 'Huyện', '60');
INSERT INTO `elearning_system_district` VALUES ('602', 'Huyện Phú Quí', 'Huyện', '60');
INSERT INTO `elearning_system_district` VALUES ('608', 'Thành phố Kon Tum', 'Thành phố', '62');
INSERT INTO `elearning_system_district` VALUES ('610', 'Huyện Đắk Glei', 'Huyện', '62');
INSERT INTO `elearning_system_district` VALUES ('611', 'Huyện Ngọc Hồi', 'Huyện', '62');
INSERT INTO `elearning_system_district` VALUES ('612', 'Huyện Đắk Tô', 'Huyện', '62');
INSERT INTO `elearning_system_district` VALUES ('613', 'Huyện Kon Plông', 'Huyện', '62');
INSERT INTO `elearning_system_district` VALUES ('614', 'Huyện Kon Rẫy', 'Huyện', '62');
INSERT INTO `elearning_system_district` VALUES ('615', 'Huyện Đắk Hà', 'Huyện', '62');
INSERT INTO `elearning_system_district` VALUES ('616', 'Huyện Sa Thầy', 'Huyện', '62');
INSERT INTO `elearning_system_district` VALUES ('617', 'Huyện Tu Mơ Rông', 'Huyện', '62');
INSERT INTO `elearning_system_district` VALUES ('618', 'Huyện Ia H\' Drai', 'Huyện', '62');
INSERT INTO `elearning_system_district` VALUES ('622', 'Thành phố Pleiku', 'Thành phố', '64');
INSERT INTO `elearning_system_district` VALUES ('623', 'Thị xã An Khê', 'Thị xã', '64');
INSERT INTO `elearning_system_district` VALUES ('624', 'Thị xã Ayun Pa', 'Thị xã', '64');
INSERT INTO `elearning_system_district` VALUES ('625', 'Huyện KBang', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('626', 'Huyện Đăk Đoa', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('627', 'Huyện Chư Păh', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('628', 'Huyện Ia Grai', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('629', 'Huyện Mang Yang', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('630', 'Huyện Kông Chro', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('631', 'Huyện Đức Cơ', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('632', 'Huyện Chư Prông', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('633', 'Huyện Chư Sê', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('634', 'Huyện Đăk Pơ', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('635', 'Huyện Ia Pa', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('637', 'Huyện Krông Pa', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('638', 'Huyện Phú Thiện', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('639', 'Huyện Chư Pưh', 'Huyện', '64');
INSERT INTO `elearning_system_district` VALUES ('643', 'Thành phố Buôn Ma Thuột', 'Thành phố', '66');
INSERT INTO `elearning_system_district` VALUES ('644', 'Thị Xã Buôn Hồ', 'Thị xã', '66');
INSERT INTO `elearning_system_district` VALUES ('645', 'Huyện Ea H\'leo', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('646', 'Huyện Ea Súp', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('647', 'Huyện Buôn Đôn', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('648', 'Huyện Cư M\'gar', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('649', 'Huyện Krông Búk', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('650', 'Huyện Krông Năng', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('651', 'Huyện Ea Kar', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('652', 'Huyện M\'Đrắk', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('653', 'Huyện Krông Bông', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('654', 'Huyện Krông Pắc', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('655', 'Huyện Krông A Na', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('656', 'Huyện Lắk', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('657', 'Huyện Cư Kuin', 'Huyện', '66');
INSERT INTO `elearning_system_district` VALUES ('660', 'Thị xã Gia Nghĩa', 'Thị xã', '67');
INSERT INTO `elearning_system_district` VALUES ('661', 'Huyện Đăk Glong', 'Huyện', '67');
INSERT INTO `elearning_system_district` VALUES ('662', 'Huyện Cư Jút', 'Huyện', '67');
INSERT INTO `elearning_system_district` VALUES ('663', 'Huyện Đắk Mil', 'Huyện', '67');
INSERT INTO `elearning_system_district` VALUES ('664', 'Huyện Krông Nô', 'Huyện', '67');
INSERT INTO `elearning_system_district` VALUES ('665', 'Huyện Đắk Song', 'Huyện', '67');
INSERT INTO `elearning_system_district` VALUES ('666', 'Huyện Đắk R\'Lấp', 'Huyện', '67');
INSERT INTO `elearning_system_district` VALUES ('667', 'Huyện Tuy Đức', 'Huyện', '67');
INSERT INTO `elearning_system_district` VALUES ('672', 'Thành phố Đà Lạt', 'Thành phố', '68');
INSERT INTO `elearning_system_district` VALUES ('673', 'Thành phố Bảo Lộc', 'Thành phố', '68');
INSERT INTO `elearning_system_district` VALUES ('674', 'Huyện Đam Rông', 'Huyện', '68');
INSERT INTO `elearning_system_district` VALUES ('675', 'Huyện Lạc Dương', 'Huyện', '68');
INSERT INTO `elearning_system_district` VALUES ('676', 'Huyện Lâm Hà', 'Huyện', '68');
INSERT INTO `elearning_system_district` VALUES ('677', 'Huyện Đơn Dương', 'Huyện', '68');
INSERT INTO `elearning_system_district` VALUES ('678', 'Huyện Đức Trọng', 'Huyện', '68');
INSERT INTO `elearning_system_district` VALUES ('679', 'Huyện Di Linh', 'Huyện', '68');
INSERT INTO `elearning_system_district` VALUES ('680', 'Huyện Bảo Lâm', 'Huyện', '68');
INSERT INTO `elearning_system_district` VALUES ('681', 'Huyện Đạ Huoai', 'Huyện', '68');
INSERT INTO `elearning_system_district` VALUES ('682', 'Huyện Đạ Tẻh', 'Huyện', '68');
INSERT INTO `elearning_system_district` VALUES ('683', 'Huyện Cát Tiên', 'Huyện', '68');
INSERT INTO `elearning_system_district` VALUES ('688', 'Thị xã Phước Long', 'Thị xã', '70');
INSERT INTO `elearning_system_district` VALUES ('689', 'Thị xã Đồng Xoài', 'Thị xã', '70');
INSERT INTO `elearning_system_district` VALUES ('690', 'Thị xã Bình Long', 'Thị xã', '70');
INSERT INTO `elearning_system_district` VALUES ('691', 'Huyện Bù Gia Mập', 'Huyện', '70');
INSERT INTO `elearning_system_district` VALUES ('692', 'Huyện Lộc Ninh', 'Huyện', '70');
INSERT INTO `elearning_system_district` VALUES ('693', 'Huyện Bù Đốp', 'Huyện', '70');
INSERT INTO `elearning_system_district` VALUES ('694', 'Huyện Hớn Quản', 'Huyện', '70');
INSERT INTO `elearning_system_district` VALUES ('695', 'Huyện Đồng Phú', 'Huyện', '70');
INSERT INTO `elearning_system_district` VALUES ('696', 'Huyện Bù Đăng', 'Huyện', '70');
INSERT INTO `elearning_system_district` VALUES ('697', 'Huyện Chơn Thành', 'Huyện', '70');
INSERT INTO `elearning_system_district` VALUES ('698', 'Huyện Phú Riềng', 'Huyện', '70');
INSERT INTO `elearning_system_district` VALUES ('703', 'Thành phố Tây Ninh', 'Thành phố', '72');
INSERT INTO `elearning_system_district` VALUES ('705', 'Huyện Tân Biên', 'Huyện', '72');
INSERT INTO `elearning_system_district` VALUES ('706', 'Huyện Tân Châu', 'Huyện', '72');
INSERT INTO `elearning_system_district` VALUES ('707', 'Huyện Dương Minh Châu', 'Huyện', '72');
INSERT INTO `elearning_system_district` VALUES ('708', 'Huyện Châu Thành', 'Huyện', '72');
INSERT INTO `elearning_system_district` VALUES ('709', 'Huyện Hòa Thành', 'Huyện', '72');
INSERT INTO `elearning_system_district` VALUES ('710', 'Huyện Gò Dầu', 'Huyện', '72');
INSERT INTO `elearning_system_district` VALUES ('711', 'Huyện Bến Cầu', 'Huyện', '72');
INSERT INTO `elearning_system_district` VALUES ('712', 'Huyện Trảng Bàng', 'Huyện', '72');
INSERT INTO `elearning_system_district` VALUES ('718', 'Thành phố Thủ Dầu Một', 'Thành phố', '74');
INSERT INTO `elearning_system_district` VALUES ('719', 'Huyện Bàu Bàng', 'Huyện', '74');
INSERT INTO `elearning_system_district` VALUES ('720', 'Huyện Dầu Tiếng', 'Huyện', '74');
INSERT INTO `elearning_system_district` VALUES ('721', 'Thị xã Bến Cát', 'Thị xã', '74');
INSERT INTO `elearning_system_district` VALUES ('722', 'Huyện Phú Giáo', 'Huyện', '74');
INSERT INTO `elearning_system_district` VALUES ('723', 'Thị xã Tân Uyên', 'Thị xã', '74');
INSERT INTO `elearning_system_district` VALUES ('724', 'Thị xã Dĩ An', 'Thị xã', '74');
INSERT INTO `elearning_system_district` VALUES ('725', 'Thị xã Thuận An', 'Thị xã', '74');
INSERT INTO `elearning_system_district` VALUES ('726', 'Huyện Bắc Tân Uyên', 'Huyện', '74');
INSERT INTO `elearning_system_district` VALUES ('731', 'Thành phố Biên Hòa', 'Thành phố', '75');
INSERT INTO `elearning_system_district` VALUES ('732', 'Thị xã Long Khánh', 'Thị xã', '75');
INSERT INTO `elearning_system_district` VALUES ('734', 'Huyện Tân Phú', 'Huyện', '75');
INSERT INTO `elearning_system_district` VALUES ('735', 'Huyện Vĩnh Cửu', 'Huyện', '75');
INSERT INTO `elearning_system_district` VALUES ('736', 'Huyện Định Quán', 'Huyện', '75');
INSERT INTO `elearning_system_district` VALUES ('737', 'Huyện Trảng Bom', 'Huyện', '75');
INSERT INTO `elearning_system_district` VALUES ('738', 'Huyện Thống Nhất', 'Huyện', '75');
INSERT INTO `elearning_system_district` VALUES ('739', 'Huyện Cẩm Mỹ', 'Huyện', '75');
INSERT INTO `elearning_system_district` VALUES ('740', 'Huyện Long Thành', 'Huyện', '75');
INSERT INTO `elearning_system_district` VALUES ('741', 'Huyện Xuân Lộc', 'Huyện', '75');
INSERT INTO `elearning_system_district` VALUES ('742', 'Huyện Nhơn Trạch', 'Huyện', '75');
INSERT INTO `elearning_system_district` VALUES ('747', 'Thành phố Vũng Tàu', 'Thành phố', '77');
INSERT INTO `elearning_system_district` VALUES ('748', 'Thành phố Bà Rịa', 'Thành phố', '77');
INSERT INTO `elearning_system_district` VALUES ('750', 'Huyện Châu Đức', 'Huyện', '77');
INSERT INTO `elearning_system_district` VALUES ('751', 'Huyện Xuyên Mộc', 'Huyện', '77');
INSERT INTO `elearning_system_district` VALUES ('752', 'Huyện Long Điền', 'Huyện', '77');
INSERT INTO `elearning_system_district` VALUES ('753', 'Huyện Đất Đỏ', 'Huyện', '77');
INSERT INTO `elearning_system_district` VALUES ('754', 'Huyện Tân Thành', 'Huyện', '77');
INSERT INTO `elearning_system_district` VALUES ('755', 'Huyện Côn Đảo', 'Huyện', '77');
INSERT INTO `elearning_system_district` VALUES ('760', 'Quận 1', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('761', 'Quận 12', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('762', 'Quận Thủ Đức', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('763', 'Quận 9', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('764', 'Quận Gò Vấp', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('765', 'Quận Bình Thạnh', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('766', 'Quận Tân Bình', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('767', 'Quận Tân Phú', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('768', 'Quận Phú Nhuận', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('769', 'Quận 2', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('770', 'Quận 3', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('771', 'Quận 10', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('772', 'Quận 11', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('773', 'Quận 4', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('774', 'Quận 5', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('775', 'Quận 6', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('776', 'Quận 8', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('777', 'Quận Bình Tân', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('778', 'Quận 7', 'Quận', '79');
INSERT INTO `elearning_system_district` VALUES ('783', 'Huyện Củ Chi', 'Huyện', '79');
INSERT INTO `elearning_system_district` VALUES ('784', 'Huyện Hóc Môn', 'Huyện', '79');
INSERT INTO `elearning_system_district` VALUES ('785', 'Huyện Bình Chánh', 'Huyện', '79');
INSERT INTO `elearning_system_district` VALUES ('786', 'Huyện Nhà Bè', 'Huyện', '79');
INSERT INTO `elearning_system_district` VALUES ('787', 'Huyện Cần Giờ', 'Huyện', '79');
INSERT INTO `elearning_system_district` VALUES ('794', 'Thành phố Tân An', 'Thành phố', '80');
INSERT INTO `elearning_system_district` VALUES ('795', 'Thị xã Kiến Tường', 'Thị xã', '80');
INSERT INTO `elearning_system_district` VALUES ('796', 'Huyện Tân Hưng', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('797', 'Huyện Vĩnh Hưng', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('798', 'Huyện Mộc Hóa', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('799', 'Huyện Tân Thạnh', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('800', 'Huyện Thạnh Hóa', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('801', 'Huyện Đức Huệ', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('802', 'Huyện Đức Hòa', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('803', 'Huyện Bến Lức', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('804', 'Huyện Thủ Thừa', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('805', 'Huyện Tân Trụ', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('806', 'Huyện Cần Đước', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('807', 'Huyện Cần Giuộc', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('808', 'Huyện Châu Thành', 'Huyện', '80');
INSERT INTO `elearning_system_district` VALUES ('815', 'Thành phố Mỹ Tho', 'Thành phố', '82');
INSERT INTO `elearning_system_district` VALUES ('816', 'Thị xã Gò Công', 'Thị xã', '82');
INSERT INTO `elearning_system_district` VALUES ('817', 'Thị xã Cai Lậy', 'Huyện', '82');
INSERT INTO `elearning_system_district` VALUES ('818', 'Huyện Tân Phước', 'Huyện', '82');
INSERT INTO `elearning_system_district` VALUES ('819', 'Huyện Cái Bè', 'Huyện', '82');
INSERT INTO `elearning_system_district` VALUES ('820', 'Huyện Cai Lậy', 'Thị xã', '82');
INSERT INTO `elearning_system_district` VALUES ('821', 'Huyện Châu Thành', 'Huyện', '82');
INSERT INTO `elearning_system_district` VALUES ('822', 'Huyện Chợ Gạo', 'Huyện', '82');
INSERT INTO `elearning_system_district` VALUES ('823', 'Huyện Gò Công Tây', 'Huyện', '82');
INSERT INTO `elearning_system_district` VALUES ('824', 'Huyện Gò Công Đông', 'Huyện', '82');
INSERT INTO `elearning_system_district` VALUES ('825', 'Huyện Tân Phú Đông', 'Huyện', '82');
INSERT INTO `elearning_system_district` VALUES ('829', 'Thành phố Bến Tre', 'Thành phố', '83');
INSERT INTO `elearning_system_district` VALUES ('831', 'Huyện Châu Thành', 'Huyện', '83');
INSERT INTO `elearning_system_district` VALUES ('832', 'Huyện Chợ Lách', 'Huyện', '83');
INSERT INTO `elearning_system_district` VALUES ('833', 'Huyện Mỏ Cày Nam', 'Huyện', '83');
INSERT INTO `elearning_system_district` VALUES ('834', 'Huyện Giồng Trôm', 'Huyện', '83');
INSERT INTO `elearning_system_district` VALUES ('835', 'Huyện Bình Đại', 'Huyện', '83');
INSERT INTO `elearning_system_district` VALUES ('836', 'Huyện Ba Tri', 'Huyện', '83');
INSERT INTO `elearning_system_district` VALUES ('837', 'Huyện Thạnh Phú', 'Huyện', '83');
INSERT INTO `elearning_system_district` VALUES ('838', 'Huyện Mỏ Cày Bắc', 'Huyện', '83');
INSERT INTO `elearning_system_district` VALUES ('842', 'Thành phố Trà Vinh', 'Thành phố', '84');
INSERT INTO `elearning_system_district` VALUES ('844', 'Huyện Càng Long', 'Huyện', '84');
INSERT INTO `elearning_system_district` VALUES ('845', 'Huyện Cầu Kè', 'Huyện', '84');
INSERT INTO `elearning_system_district` VALUES ('846', 'Huyện Tiểu Cần', 'Huyện', '84');
INSERT INTO `elearning_system_district` VALUES ('847', 'Huyện Châu Thành', 'Huyện', '84');
INSERT INTO `elearning_system_district` VALUES ('848', 'Huyện Cầu Ngang', 'Huyện', '84');
INSERT INTO `elearning_system_district` VALUES ('849', 'Huyện Trà Cú', 'Huyện', '84');
INSERT INTO `elearning_system_district` VALUES ('850', 'Huyện Duyên Hải', 'Huyện', '84');
INSERT INTO `elearning_system_district` VALUES ('851', 'Thị xã Duyên Hải', 'Thị xã', '84');
INSERT INTO `elearning_system_district` VALUES ('855', 'Thành phố Vĩnh Long', 'Thành phố', '86');
INSERT INTO `elearning_system_district` VALUES ('857', 'Huyện Long Hồ', 'Huyện', '86');
INSERT INTO `elearning_system_district` VALUES ('858', 'Huyện Mang Thít', 'Huyện', '86');
INSERT INTO `elearning_system_district` VALUES ('859', 'Huyện  Vũng Liêm', 'Huyện', '86');
INSERT INTO `elearning_system_district` VALUES ('860', 'Huyện Tam Bình', 'Huyện', '86');
INSERT INTO `elearning_system_district` VALUES ('861', 'Thị xã Bình Minh', 'Thị xã', '86');
INSERT INTO `elearning_system_district` VALUES ('862', 'Huyện Trà Ôn', 'Huyện', '86');
INSERT INTO `elearning_system_district` VALUES ('863', 'Huyện Bình Tân', 'Huyện', '86');
INSERT INTO `elearning_system_district` VALUES ('866', 'Thành phố Cao Lãnh', 'Thành phố', '87');
INSERT INTO `elearning_system_district` VALUES ('867', 'Thành phố Sa Đéc', 'Thành phố', '87');
INSERT INTO `elearning_system_district` VALUES ('868', 'Thị xã Hồng Ngự', 'Thị xã', '87');
INSERT INTO `elearning_system_district` VALUES ('869', 'Huyện Tân Hồng', 'Huyện', '87');
INSERT INTO `elearning_system_district` VALUES ('870', 'Huyện Hồng Ngự', 'Huyện', '87');
INSERT INTO `elearning_system_district` VALUES ('871', 'Huyện Tam Nông', 'Huyện', '87');
INSERT INTO `elearning_system_district` VALUES ('872', 'Huyện Tháp Mười', 'Huyện', '87');
INSERT INTO `elearning_system_district` VALUES ('873', 'Huyện Cao Lãnh', 'Huyện', '87');
INSERT INTO `elearning_system_district` VALUES ('874', 'Huyện Thanh Bình', 'Huyện', '87');
INSERT INTO `elearning_system_district` VALUES ('875', 'Huyện Lấp Vò', 'Huyện', '87');
INSERT INTO `elearning_system_district` VALUES ('876', 'Huyện Lai Vung', 'Huyện', '87');
INSERT INTO `elearning_system_district` VALUES ('877', 'Huyện Châu Thành', 'Huyện', '87');
INSERT INTO `elearning_system_district` VALUES ('883', 'Thành phố Long Xuyên', 'Thành phố', '89');
INSERT INTO `elearning_system_district` VALUES ('884', 'Thành phố Châu Đốc', 'Thành phố', '89');
INSERT INTO `elearning_system_district` VALUES ('886', 'Huyện An Phú', 'Huyện', '89');
INSERT INTO `elearning_system_district` VALUES ('887', 'Thị xã Tân Châu', 'Thị xã', '89');
INSERT INTO `elearning_system_district` VALUES ('888', 'Huyện Phú Tân', 'Huyện', '89');
INSERT INTO `elearning_system_district` VALUES ('889', 'Huyện Châu Phú', 'Huyện', '89');
INSERT INTO `elearning_system_district` VALUES ('890', 'Huyện Tịnh Biên', 'Huyện', '89');
INSERT INTO `elearning_system_district` VALUES ('891', 'Huyện Tri Tôn', 'Huyện', '89');
INSERT INTO `elearning_system_district` VALUES ('892', 'Huyện Châu Thành', 'Huyện', '89');
INSERT INTO `elearning_system_district` VALUES ('893', 'Huyện Chợ Mới', 'Huyện', '89');
INSERT INTO `elearning_system_district` VALUES ('894', 'Huyện Thoại Sơn', 'Huyện', '89');
INSERT INTO `elearning_system_district` VALUES ('899', 'Thành phố Rạch Giá', 'Thành phố', '91');
INSERT INTO `elearning_system_district` VALUES ('900', 'Thị xã Hà Tiên', 'Thị xã', '91');
INSERT INTO `elearning_system_district` VALUES ('902', 'Huyện Kiên Lương', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('903', 'Huyện Hòn Đất', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('904', 'Huyện Tân Hiệp', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('905', 'Huyện Châu Thành', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('906', 'Huyện Giồng Riềng', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('907', 'Huyện Gò Quao', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('908', 'Huyện An Biên', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('909', 'Huyện An Minh', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('910', 'Huyện Vĩnh Thuận', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('911', 'Huyện Phú Quốc', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('912', 'Huyện Kiên Hải', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('913', 'Huyện U Minh Thượng', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('914', 'Huyện Giang Thành', 'Huyện', '91');
INSERT INTO `elearning_system_district` VALUES ('916', 'Quận Ninh Kiều', 'Quận', '92');
INSERT INTO `elearning_system_district` VALUES ('917', 'Quận Ô Môn', 'Quận', '92');
INSERT INTO `elearning_system_district` VALUES ('918', 'Quận Bình Thuỷ', 'Quận', '92');
INSERT INTO `elearning_system_district` VALUES ('919', 'Quận Cái Răng', 'Quận', '92');
INSERT INTO `elearning_system_district` VALUES ('923', 'Quận Thốt Nốt', 'Quận', '92');
INSERT INTO `elearning_system_district` VALUES ('924', 'Huyện Vĩnh Thạnh', 'Huyện', '92');
INSERT INTO `elearning_system_district` VALUES ('925', 'Huyện Cờ Đỏ', 'Huyện', '92');
INSERT INTO `elearning_system_district` VALUES ('926', 'Huyện Phong Điền', 'Huyện', '92');
INSERT INTO `elearning_system_district` VALUES ('927', 'Huyện Thới Lai', 'Huyện', '92');
INSERT INTO `elearning_system_district` VALUES ('930', 'Thành phố Vị Thanh', 'Thành phố', '93');
INSERT INTO `elearning_system_district` VALUES ('931', 'Thị xã Ngã Bảy', 'Thị xã', '93');
INSERT INTO `elearning_system_district` VALUES ('932', 'Huyện Châu Thành A', 'Huyện', '93');
INSERT INTO `elearning_system_district` VALUES ('933', 'Huyện Châu Thành', 'Huyện', '93');
INSERT INTO `elearning_system_district` VALUES ('934', 'Huyện Phụng Hiệp', 'Huyện', '93');
INSERT INTO `elearning_system_district` VALUES ('935', 'Huyện Vị Thuỷ', 'Huyện', '93');
INSERT INTO `elearning_system_district` VALUES ('936', 'Huyện Long Mỹ', 'Huyện', '93');
INSERT INTO `elearning_system_district` VALUES ('937', 'Thị xã Long Mỹ', 'Thị xã', '93');
INSERT INTO `elearning_system_district` VALUES ('941', 'Thành phố Sóc Trăng', 'Thành phố', '94');
INSERT INTO `elearning_system_district` VALUES ('942', 'Huyện Châu Thành', 'Huyện', '94');
INSERT INTO `elearning_system_district` VALUES ('943', 'Huyện Kế Sách', 'Huyện', '94');
INSERT INTO `elearning_system_district` VALUES ('944', 'Huyện Mỹ Tú', 'Huyện', '94');
INSERT INTO `elearning_system_district` VALUES ('945', 'Huyện Cù Lao Dung', 'Huyện', '94');
INSERT INTO `elearning_system_district` VALUES ('946', 'Huyện Long Phú', 'Huyện', '94');
INSERT INTO `elearning_system_district` VALUES ('947', 'Huyện Mỹ Xuyên', 'Huyện', '94');
INSERT INTO `elearning_system_district` VALUES ('948', 'Thị xã Ngã Năm', 'Thị xã', '94');
INSERT INTO `elearning_system_district` VALUES ('949', 'Huyện Thạnh Trị', 'Huyện', '94');
INSERT INTO `elearning_system_district` VALUES ('950', 'Thị xã Vĩnh Châu', 'Thị xã', '94');
INSERT INTO `elearning_system_district` VALUES ('951', 'Huyện Trần Đề', 'Huyện', '94');
INSERT INTO `elearning_system_district` VALUES ('954', 'Thành phố Bạc Liêu', 'Thành phố', '95');
INSERT INTO `elearning_system_district` VALUES ('956', 'Huyện Hồng Dân', 'Huyện', '95');
INSERT INTO `elearning_system_district` VALUES ('957', 'Huyện Phước Long', 'Huyện', '95');
INSERT INTO `elearning_system_district` VALUES ('958', 'Huyện Vĩnh Lợi', 'Huyện', '95');
INSERT INTO `elearning_system_district` VALUES ('959', 'Thị xã Giá Rai', 'Thị xã', '95');
INSERT INTO `elearning_system_district` VALUES ('960', 'Huyện Đông Hải', 'Huyện', '95');
INSERT INTO `elearning_system_district` VALUES ('961', 'Huyện Hoà Bình', 'Huyện', '95');
INSERT INTO `elearning_system_district` VALUES ('964', 'Thành phố Cà Mau', 'Thành phố', '96');
INSERT INTO `elearning_system_district` VALUES ('966', 'Huyện U Minh', 'Huyện', '96');
INSERT INTO `elearning_system_district` VALUES ('967', 'Huyện Thới Bình', 'Huyện', '96');
INSERT INTO `elearning_system_district` VALUES ('968', 'Huyện Trần Văn Thời', 'Huyện', '96');
INSERT INTO `elearning_system_district` VALUES ('969', 'Huyện Cái Nước', 'Huyện', '96');
INSERT INTO `elearning_system_district` VALUES ('970', 'Huyện Đầm Dơi', 'Huyện', '96');
INSERT INTO `elearning_system_district` VALUES ('971', 'Huyện Năm Căn', 'Huyện', '96');
INSERT INTO `elearning_system_district` VALUES ('972', 'Huyện Phú Tân', 'Huyện', '96');
INSERT INTO `elearning_system_district` VALUES ('973', 'Huyện Ngọc Hiển', 'Huyện', '96');

-- ----------------------------
-- Table structure for elearning_system_lessons
-- ----------------------------
DROP TABLE IF EXISTS `elearning_system_lessons`;
CREATE TABLE `elearning_system_lessons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `watched` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `elearning_system_lessons_topic_id_foreign` (`topic_id`),
  CONSTRAINT `elearning_system_lessons_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `elearning_system_topics` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of elearning_system_lessons
-- ----------------------------

-- ----------------------------
-- Table structure for elearning_system_levels
-- ----------------------------
DROP TABLE IF EXISTS `elearning_system_levels`;
CREATE TABLE `elearning_system_levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `elearning_system_levels_name_unique` (`name`),
  UNIQUE KEY `elearning_system_levels_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of elearning_system_levels
-- ----------------------------
INSERT INTO `elearning_system_levels` VALUES ('1', 'Mới bắt đầu', 'Mới bắt đầu', '2018-09-05 15:27:16', '2018-09-05 15:27:16');
INSERT INTO `elearning_system_levels` VALUES ('2', 'Trung cấp', 'Trung cấp', '2018-09-05 15:27:24', '2018-09-05 15:27:24');
INSERT INTO `elearning_system_levels` VALUES ('3', 'Cao cấp', 'Cao cấp', '2018-09-05 15:27:29', '2018-09-05 15:27:29');

-- ----------------------------
-- Table structure for elearning_system_media
-- ----------------------------
DROP TABLE IF EXISTS `elearning_system_media`;
CREATE TABLE `elearning_system_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `elearning_system_media_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `elearning_system_media_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `elearning_system_lessons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of elearning_system_media
-- ----------------------------

-- ----------------------------
-- Table structure for elearning_system_provice
-- ----------------------------
DROP TABLE IF EXISTS `elearning_system_provice`;
CREATE TABLE `elearning_system_provice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of elearning_system_provice
-- ----------------------------
INSERT INTO `elearning_system_provice` VALUES ('1', 'Thành phố Hà Nội', 'Thành phố Trung ương');
INSERT INTO `elearning_system_provice` VALUES ('2', 'Tỉnh Hà Giang', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('4', 'Tỉnh Cao Bằng', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('6', 'Tỉnh Bắc Kạn', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('8', 'Tỉnh Tuyên Quang', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('10', 'Tỉnh Lào Cai', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('11', 'Tỉnh Điện Biên', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('12', 'Tỉnh Lai Châu', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('14', 'Tỉnh Sơn La', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('15', 'Tỉnh Yên Bái', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('17', 'Tỉnh Hoà Bình', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('19', 'Tỉnh Thái Nguyên', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('20', 'Tỉnh Lạng Sơn', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('22', 'Tỉnh Quảng Ninh', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('24', 'Tỉnh Bắc Giang', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('25', 'Tỉnh Phú Thọ', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('26', 'Tỉnh Vĩnh Phúc', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('27', 'Tỉnh Bắc Ninh', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('30', 'Tỉnh Hải Dương', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('31', 'Thành phố Hải Phòng', 'Thành phố Trung ương');
INSERT INTO `elearning_system_provice` VALUES ('33', 'Tỉnh Hưng Yên', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('34', 'Tỉnh Thái Bình', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('35', 'Tỉnh Hà Nam', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('36', 'Tỉnh Nam Định', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('37', 'Tỉnh Ninh Bình', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('38', 'Tỉnh Thanh Hóa', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('40', 'Tỉnh Nghệ An', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('42', 'Tỉnh Hà Tĩnh', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('44', 'Tỉnh Quảng Bình', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('45', 'Tỉnh Quảng Trị', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('46', 'Tỉnh Thừa Thiên Huế', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('48', 'Thành phố Đà Nẵng', 'Thành phố Trung ương');
INSERT INTO `elearning_system_provice` VALUES ('49', 'Tỉnh Quảng Nam', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('51', 'Tỉnh Quảng Ngãi', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('52', 'Tỉnh Bình Định', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('54', 'Tỉnh Phú Yên', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('56', 'Tỉnh Khánh Hòa', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('58', 'Tỉnh Ninh Thuận', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('60', 'Tỉnh Bình Thuận', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('62', 'Tỉnh Kon Tum', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('64', 'Tỉnh Gia Lai', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('66', 'Tỉnh Đắk Lắk', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('67', 'Tỉnh Đắk Nông', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('68', 'Tỉnh Lâm Đồng', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('70', 'Tỉnh Bình Phước', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('72', 'Tỉnh Tây Ninh', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('74', 'Tỉnh Bình Dương', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('75', 'Tỉnh Đồng Nai', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('77', 'Tỉnh Bà Rịa - Vũng Tàu', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('79', 'Thành phố Hồ Chí Minh', 'Thành phố Trung ương');
INSERT INTO `elearning_system_provice` VALUES ('80', 'Tỉnh Long An', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('82', 'Tỉnh Tiền Giang', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('83', 'Tỉnh Bến Tre', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('84', 'Tỉnh Trà Vinh', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('86', 'Tỉnh Vĩnh Long', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('87', 'Tỉnh Đồng Tháp', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('89', 'Tỉnh An Giang', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('91', 'Tỉnh Kiên Giang', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('92', 'Thành phố Cần Thơ', 'Thành phố Trung ương');
INSERT INTO `elearning_system_provice` VALUES ('93', 'Tỉnh Hậu Giang', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('94', 'Tỉnh Sóc Trăng', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('95', 'Tỉnh Bạc Liêu', 'Tỉnh');
INSERT INTO `elearning_system_provice` VALUES ('96', 'Tỉnh Cà Mau', 'Tỉnh');

-- ----------------------------
-- Table structure for elearning_system_question
-- ----------------------------
DROP TABLE IF EXISTS `elearning_system_question`;
CREATE TABLE `elearning_system_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of elearning_system_question
-- ----------------------------
INSERT INTO `elearning_system_question` VALUES ('5', '1+1=?', '1', null, null, '8');
INSERT INTO `elearning_system_question` VALUES ('6', '2+2=?', '1', null, null, '8');
INSERT INTO `elearning_system_question` VALUES ('7', '3+3=?', '1', null, null, '8');
INSERT INTO `elearning_system_question` VALUES ('8', '5+5=?', '1', null, null, '8');
INSERT INTO `elearning_system_question` VALUES ('9', 'What is the correct HTML for making a drop-down list?', '1', null, null, '8');
