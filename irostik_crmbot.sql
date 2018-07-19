/*
 Navicat Premium Data Transfer

 Source Server         : club_crm_bot
 Source Server Type    : MySQL
 Source Server Version : 50639
 Source Host           : localhost:3306
 Source Schema         : irostik_crmbot

 Target Server Type    : MySQL
 Target Server Version : 50639
 File Encoding         : 65001

 Date: 19/07/2018 18:12:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for a_city
-- ----------------------------
DROP TABLE IF EXISTS `a_city`;
CREATE TABLE `a_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `translit` varchar(255) DEFAULT NULL,
  `idregion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_city
-- ----------------------------
BEGIN;
INSERT INTO `a_city` VALUES (1, 'Краснодар', NULL, 1);
INSERT INTO `a_city` VALUES (2, 'Анапа', NULL, 1);
INSERT INTO `a_city` VALUES (3, 'Кропоткин', NULL, 1);
INSERT INTO `a_city` VALUES (4, 'Новороссийск', NULL, 1);
INSERT INTO `a_city` VALUES (5, 'Сочи', NULL, 1);
INSERT INTO `a_city` VALUES (6, 'Ставрополь', NULL, 2);
INSERT INTO `a_city` VALUES (7, ' Пятигорск', NULL, 2);
INSERT INTO `a_city` VALUES (8, 'Майкоп', NULL, 3);
INSERT INTO `a_city` VALUES (9, 'Адыгейск', NULL, 3);
COMMIT;

-- ----------------------------
-- Table structure for a_depart
-- ----------------------------
DROP TABLE IF EXISTS `a_depart`;
CREATE TABLE `a_depart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `translit` varchar(255) DEFAULT NULL,
  `idcity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_depart
-- ----------------------------
BEGIN;
INSERT INTO `a_depart` VALUES (1, 'Центр', NULL, 1);
INSERT INTO `a_depart` VALUES (2, 'ФМР', NULL, 1);
INSERT INTO `a_depart` VALUES (3, 'Гидрострой', NULL, 1);
INSERT INTO `a_depart` VALUES (4, 'КМР', NULL, 1);
INSERT INTO `a_depart` VALUES (5, 'Юбилейный', NULL, 1);
INSERT INTO `a_depart` VALUES (6, 'Центр', NULL, 6);
INSERT INTO `a_depart` VALUES (7, 'Юго-Западный', NULL, 6);
INSERT INTO `a_depart` VALUES (8, 'Северо-Западный', NULL, 6);
INSERT INTO `a_depart` VALUES (9, 'Ботаника', NULL, 6);
INSERT INTO `a_depart` VALUES (10, 'Осетинка', NULL, 6);
COMMIT;

-- ----------------------------
-- Table structure for a_region
-- ----------------------------
DROP TABLE IF EXISTS `a_region`;
CREATE TABLE `a_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `translit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_region
-- ----------------------------
BEGIN;
INSERT INTO `a_region` VALUES (1, 'Краснодарский край', NULL);
INSERT INTO `a_region` VALUES (2, 'Ставропольский край', NULL);
INSERT INTO `a_region` VALUES (3, 'Адыгея', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
