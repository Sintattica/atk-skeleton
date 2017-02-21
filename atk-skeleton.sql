SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `app_testnode`
-- ----------------------------
DROP TABLE IF EXISTS `app_testnode`;
CREATE TABLE `app_testnode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_accessrights`
-- ----------------------------
DROP TABLE IF EXISTS `auth_accessrights`;
CREATE TABLE `auth_accessrights` (
  `node` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`node`,`action`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_groups`;
CREATE TABLE `auth_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_rememberme`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rememberme`;
CREATE TABLE `auth_rememberme` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` char(12) NOT NULL,
  `token` char(64) NOT NULL,
  `username` varchar(30) NOT NULL,
  `expires` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector` (`selector`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_u2f`
-- ----------------------------
DROP TABLE IF EXISTS `auth_u2f`;
CREATE TABLE `auth_u2f` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `keyHandle` varchar(255) NOT NULL,
  `publicKey` varchar(255) NOT NULL,
  `certificate` text NOT NULL,
  `counter` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_users`
-- ----------------------------
DROP TABLE IF EXISTS `auth_users`;
CREATE TABLE `auth_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `isDisabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isAdmin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isU2FEnabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_users_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_users_groups`;
CREATE TABLE `auth_users_groups` (
  `user_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
