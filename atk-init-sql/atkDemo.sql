/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : atkDemo

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 04/08/2021 16:24:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_access_rights
-- ----------------------------
DROP TABLE IF EXISTS `auth_access_rights`;
CREATE TABLE `auth_access_rights` (
  `node` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `group_id` char(5) NOT NULL,
  PRIMARY KEY (`node`,`action`,`group_id`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_access_rights
-- ----------------------------
BEGIN;
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'add', 'AZ');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'admin', 'AZ');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'delete', 'AZ');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'edit', 'AZ');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'export', 'AZ');
INSERT INTO `auth_access_rights` VALUES ('app.demo_relation', 'admin', 'AZ');
INSERT INTO `auth_access_rights` VALUES ('auth.groups', 'add', 'AZ');
INSERT INTO `auth_access_rights` VALUES ('auth.users', 'admin', 'AZ');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'add', 'dddd');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'admin', 'dddd');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'delete', 'dddd');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'edit', 'dddd');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'export', 'dddd');
INSERT INTO `auth_access_rights` VALUES ('app.demo_relation', 'add', 'dddd');
INSERT INTO `auth_access_rights` VALUES ('app.demo_relation', 'admin', 'dddd');
INSERT INTO `auth_access_rights` VALUES ('app.demo_relation', 'delete', 'dddd');
INSERT INTO `auth_access_rights` VALUES ('app.demo_relation', 'edit', 'dddd');
INSERT INTO `auth_access_rights` VALUES ('auth.groups', 'add', 'dddd');
INSERT INTO `auth_access_rights` VALUES ('auth.groups', 'admin', 'dddd');
INSERT INTO `auth_access_rights` VALUES ('auth.users', 'delete', 'dddd');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'add', 'SG');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'admin', 'SG');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'delete', 'SG');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'edit', 'SG');
INSERT INTO `auth_access_rights` VALUES ('app.demo_node', 'export', 'SG');
INSERT INTO `auth_access_rights` VALUES ('app.demo_relation', 'add', 'SG');
INSERT INTO `auth_access_rights` VALUES ('app.demo_relation', 'admin', 'SG');
INSERT INTO `auth_access_rights` VALUES ('app.demo_relation', 'delete', 'SG');
INSERT INTO `auth_access_rights` VALUES ('app.demo_relation', 'edit', 'SG');
INSERT INTO `auth_access_rights` VALUES ('app.demo_relation', 'export', 'SG');
INSERT INTO `auth_access_rights` VALUES ('app.dashboard', 'monitor', 'UT');
INSERT INTO `auth_access_rights` VALUES ('app.dashboard_device', 'monitor', 'UT');
INSERT INTO `auth_access_rights` VALUES ('app.dettagli_cliente', 'monitor', 'UT');
COMMIT;

-- ----------------------------
-- Table structure for auth_gruppo
-- ----------------------------
DROP TABLE IF EXISTS `auth_gruppo`;
CREATE TABLE `auth_gruppo` (
  `id` char(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_gruppo
-- ----------------------------
BEGIN;
INSERT INTO `auth_gruppo` VALUES ('AZ', 'Amministrazione', '');
INSERT INTO `auth_gruppo` VALUES ('pv', 'Prova', 'Gruppo Prova');
INSERT INTO `auth_gruppo` VALUES ('SG', 'Segreteria', '');
INSERT INTO `auth_gruppo` VALUES ('UT', 'Utente', '');
COMMIT;

-- ----------------------------
-- Table structure for auth_rememberme
-- ----------------------------
DROP TABLE IF EXISTS `auth_rememberme`;
CREATE TABLE `auth_rememberme` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `selector` char(12) NOT NULL,
  `token` char(64) NOT NULL,
  `username` varchar(255) NOT NULL,
  `expires` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `selector` (`selector`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_rememberme
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_utente
-- ----------------------------
DROP TABLE IF EXISTS `auth_utente`;
CREATE TABLE `auth_utente` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `lingua` char(2) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `disabled` tinyint unsigned NOT NULL DEFAULT '0',
  `amministratore` tinyint NOT NULL DEFAULT '0',
  `data_creazione` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_utente
-- ----------------------------
BEGIN;
INSERT INTO `auth_utente` VALUES (1, 'sintattica', '$2y$10$GtTDrTDPvruj3DrXfkt0he5OitMjrP5/DLQXs4Gc6DoZayYZZTxHG', 'it', 'sintattica', 'sintattica', NULL, 0, 1, '2020-01-28 16:08:33');
INSERT INTO `auth_utente` VALUES (8, 'amministrazione', '$2y$10$Fz59SzSItthS8UGnldORsewm/PJd22ngcPT36bspigPrxGlUmHEDC', 'it', 'Amm', 'Ut', NULL, 0, 0, '2021-04-06 16:13:17');
INSERT INTO `auth_utente` VALUES (9, 'segreteria', '$2y$10$Gu0llR3OFkR641gWRwUbiOv7lD4ySJhONcQkQdgG7vqb4uUlnJ5Ue', 'it', 'Segreteria', 'Utente', NULL, 0, 0, '2021-04-06 16:13:51');
COMMIT;

-- ----------------------------
-- Table structure for auth_utente_gruppo
-- ----------------------------
DROP TABLE IF EXISTS `auth_utente_gruppo`;
CREATE TABLE `auth_utente_gruppo` (
  `user_id` int unsigned NOT NULL,
  `group_id` char(5) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_utente_gruppo
-- ----------------------------
BEGIN;
INSERT INTO `auth_utente_gruppo` VALUES (1, 'pv');
INSERT INTO `auth_utente_gruppo` VALUES (1, 'UT');
INSERT INTO `auth_utente_gruppo` VALUES (8, 'AZ');
INSERT INTO `auth_utente_gruppo` VALUES (9, 'SG');
COMMIT;

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attribute` varchar(255) DEFAULT NULL,
  `date_a` date DEFAULT NULL,
  `datetime_a` datetime DEFAULT NULL,
  `time_a` time DEFAULT NULL,
  `text_a` text,
  `list_a` varchar(255) DEFAULT NULL,
  `multiselectlist_a` varchar(255) DEFAULT NULL,
  `bool_a` tinyint(1) DEFAULT '0',
  `switch_a` tinyint(1) DEFAULT '0',
  `file_a` varchar(255) DEFAULT NULL,
  `ck_a` text,
  `password_a` varchar(255) DEFAULT NULL,
  `radio_a` varchar(255) DEFAULT NULL,
  `fieldset_list` varchar(255) DEFAULT NULL,
  `fieldset_attribute` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of demo
-- ----------------------------
BEGIN;
INSERT INTO `demo` VALUES (1, 'Attributo 1 ', '2021-04-08', '2020-12-24 03:03:00', '09:30:00', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard ', 'dai', NULL, 1, 1, 'atk-beyond-the-pizza-guides-1211312676462685-8.pdf', '<h3 style=\"margin-left:0px;\"><br><a href=\"https://www.ansa.it/sito/notizie/politica/2021/02/18/m5s-crimi-espulsi-15-senatori-che-hanno-votato-no-fiducia_1407d0a4-12ae-4d23-af19-1749b45ada8c.html\">Via da M5s i senatori dissidenti</a><br><a href=\"https://www.ansa.it/sito/notizie/politica/2021/02/18/m5s-crimi-espulsi-15-senatori-che-hanno-votato-no-fiducia_1407d0a4-12ae-4d23-af19-1749b45ada8c.html\">Grillo: \'L\'unità è l\'unica via\'</a></h3><p><span style=\"background-color:rgb(229,232,228);color:rgb(51,51,51);font-family:Arial, Helvetica, sans-serif;\"><i>Politica.</i></span></p><p style=\"margin-left:0px;\">Lo annuncia su Facebook il capo politico del Movimento 5 stelle. Lezzi: \'Ho preso la decisione. Mi candido a far parte del comitato direttivo del M5S (da cui non sono espulsa)\'. L\'ex senatore Crucioli: \'Sto lavorando ad un gruppo, non farò ricorso contro l\'espulsione\'</p><figure class=\"image image_resized\" style=\"width:57.53%;\"><img src=\"https://www.ansa.it/webimages/img_395x275/2021/2/10/b0c507e8bff55027ee335eaec3e5531d.jpg\" alt=\"Beppe Grillo (ANSA)\"></figure><p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', 'bellissimo', 'fieldset');
INSERT INTO `demo` VALUES (2, 'Attributo 2 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (3, 'Attributo 3', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (4, 'Attributo 3 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (5, 'Attributo 4 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (6, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (7, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (8, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (9, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (10, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (11, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (12, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (13, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (14, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (15, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (16, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (17, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (18, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (19, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (20, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (21, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (22, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (23, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (24, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (26, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (27, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (28, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (29, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (30, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (31, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (32, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (33, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (34, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (35, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (36, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (37, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (38, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (39, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (40, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (41, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (42, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (43, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (44, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (45, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (46, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (47, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (48, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (49, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (50, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (51, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (52, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (53, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (54, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (55, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (56, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (57, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (58, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (59, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (60, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (61, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (62, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (63, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (64, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (65, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (66, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (67, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (68, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (69, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (70, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (71, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (72, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (73, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (74, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (75, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (76, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (77, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (78, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (79, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (80, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
INSERT INTO `demo` VALUES (81, 'Attributo 1 ', '2020-04-04', '2020-12-24 03:03:00', '09:30:00', 'HELLO World', 'dai', NULL, 1, 1, 'Erich_Gamma,_Richard_Helm,_Ralph_Johnson,_John_M._Vlissides-Design_Patterns__Elements_of_Reusable_Object-Oriented_Software__-Addison-Wesley_Professional_(1994).pdf', '<p><i><mark class=\"marker-yellow\">Testo ciao</mark></i></p>', NULL, 'option-1', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for demo_relation
-- ----------------------------
DROP TABLE IF EXISTS `demo_relation`;
CREATE TABLE `demo_relation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `aaaa` varchar(255) DEFAULT NULL,
  `bbbb` varchar(255) DEFAULT NULL,
  `cccc` varchar(255) DEFAULT NULL,
  `dddd` varchar(255) DEFAULT NULL,
  `eeee` varchar(255) DEFAULT NULL,
  `ffff` varchar(255) DEFAULT NULL,
  `gggg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of demo_relation
-- ----------------------------
BEGIN;
INSERT INTO `demo_relation` VALUES (1, 'ciao', 1, 'ciao ciao ciao', 'lkfjalkdsjfadsk fjadklf ajlkdfa jal kdsaljk alja a a', 'dajl. lja kja ka jakl ja lka lj', 'fjadk.   ljkdkjfaljf ', 'jkldsfalk ', NULL, NULL);
INSERT INTO `demo_relation` VALUES (2, 'ciao', 1, 'ciao ciao ciao', 'lkfjalkdsjfadsk fjadklf ajlkdfa jal kdsaljk alja a a', 'dajl. lja kja ka jakl ja lka lj', 'fjadk.   ljkdkjfaljf ', 'jkldsfalk ', NULL, NULL);
INSERT INTO `demo_relation` VALUES (3, 'ciao', 1, 'ciao ciao ciao', 'lkfjalkdsjfadsk fjadklf ajlkdfa jal kdsaljk alja a a', 'dajl. lja kja ka jakl ja lka lj', 'fjadk.   ljkdkjfaljf ', 'jkldsfalk ', NULL, NULL);
INSERT INTO `demo_relation` VALUES (4, 'ciao', 1, 'ciao ciao ciao', 'lkfjalkdsjfadsk fjadklf ajlkdfa jal kdsaljk alja a a', 'dajl. lja kja ka jakl ja lka lj', 'fjadk.   ljkdkjfaljf ', 'jkldsfalk ', NULL, NULL);
INSERT INTO `demo_relation` VALUES (5, 'ciao', 1, 'ciao ciao ciao', 'lkfjalkdsjfadsk fjadklf ajlkdfa jal kdsaljk alja a a', 'dajl. lja kja ka jakl ja lka lj', 'fjadk.   ljkdkjfaljf ', 'jkldsfalk ', NULL, NULL);
INSERT INTO `demo_relation` VALUES (6, 'ciao', 1, 'ciao ciao ciao', 'lkfjalkdsjfadsk fjadklf ajlkdfa jal kdsaljk alja a a', 'dajl. lja kja ka jakl ja lka lj', 'fjadk.   ljkdkjfaljf ', 'jkldsfalk ', NULL, NULL);
COMMIT;

-- ----------------------------
-- View structure for permessi_group
-- ----------------------------
DROP VIEW IF EXISTS `permessi_group`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `permessi_group` AS select left(`auth_access_rights`.`node`,(locate('.',`auth_access_rights`.`node`) - 1)) AS `modulo`,substr(`auth_access_rights`.`node`,(locate('.',`auth_access_rights`.`node`) + 1)) AS `nodo`,`auth_access_rights`.`action` AS `action`,concat('|',group_concat(`auth_access_rights`.`group_id` separator '|'),'|') AS `profili` from `auth_access_rights` group by `auth_access_rights`.`node`,`auth_access_rights`.`action`;

SET FOREIGN_KEY_CHECKS = 1;
