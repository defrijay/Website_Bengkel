/*
Navicat MySQL Data Transfer

Source Server         : bebas
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_bengkel

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2023-06-12 09:38:57
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_motor`
-- ----------------------------
DROP TABLE IF EXISTS `t_motor`;
CREATE TABLE `t_motor` (
  `id_motor` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_motor` varchar(255) DEFAULT NULL,
  `merk_motor` varchar(255) DEFAULT '',
  `id_pelanggan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_motor`),
  KEY `fk_motor_pelanggan` (`id_pelanggan`),
  CONSTRAINT `fk_motor_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `t_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_motor
-- ----------------------------
INSERT INTO `t_motor` VALUES ('1', 'Sekuter Matik', 'Vespa', '1');

-- ----------------------------
-- Table structure for `t_paket`
-- ----------------------------
DROP TABLE IF EXISTS `t_paket`;
CREATE TABLE `t_paket` (
  `id_paket` int(11) NOT NULL AUTO_INCREMENT,
  `nama_paket` varchar(255) DEFAULT NULL,
  `harga` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_paket`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_paket
-- ----------------------------
INSERT INTO `t_paket` VALUES ('1', 'Paket Service Super Bahagia', '450.000');
INSERT INTO `t_paket` VALUES ('2', 'Paket Service Bahagia', '300.000');
INSERT INTO `t_paket` VALUES ('3', 'Paket Service Tune-Up', '200.000');
INSERT INTO `t_paket` VALUES ('4', 'Paket Service Ban Bahagia', '150.000');
INSERT INTO `t_paket` VALUES ('5', 'Paket Service Rem Bahagia', '150.000');

-- ----------------------------
-- Table structure for `t_pelanggan`
-- ----------------------------
DROP TABLE IF EXISTS `t_pelanggan`;
CREATE TABLE `t_pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(255) DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `alamat_pelanggan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_pelanggan
-- ----------------------------
INSERT INTO `t_pelanggan` VALUES ('1', 'Defrijay', '08212345678', 'Terminal Kuningan');

-- ----------------------------
-- Table structure for `t_pemesanan`
-- ----------------------------
DROP TABLE IF EXISTS `t_pemesanan`;
CREATE TABLE `t_pemesanan` (
  `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT,
  `jadwal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_motor` int(11) DEFAULT NULL,
  `id_paket` int(11) DEFAULT NULL,
  `stnk` varchar(255) DEFAULT NULL,
  `keluhan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pemesanan`),
  KEY `fk_pelanggan` (`id_pelanggan`),
  KEY `fk_motor` (`id_motor`),
  KEY `fk_paket` (`id_paket`),
  CONSTRAINT `fk_motor` FOREIGN KEY (`id_motor`) REFERENCES `t_motor` (`id_motor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paket` FOREIGN KEY (`id_paket`) REFERENCES `t_paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `t_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_pemesanan
-- ----------------------------
INSERT INTO `t_pemesanan` VALUES ('1', '2023-06-12', '09:37:56', '1', '1', '1', null, 'sering mogok');

-- ----------------------------
-- Table structure for `t_pesan`
-- ----------------------------
DROP TABLE IF EXISTS `t_pesan`;
CREATE TABLE `t_pesan` (
  `id_pesan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pengirim` varchar(255) DEFAULT NULL,
  `email_pengirim` varchar(255) DEFAULT NULL,
  `pesan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pesan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_pesan
-- ----------------------------
INSERT INTO `t_pesan` VALUES ('1', 'Defrijay', 'defrijay@gmail.com', 'pelayanan bintang 5!');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `authority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', '1');
INSERT INTO `t_user` VALUES ('2', 'defrijay', 'defrijay', '0');
