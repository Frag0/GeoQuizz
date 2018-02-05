-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE `niveau` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `nbr_photos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `partie`;
CREATE TABLE `partie` (
  `id` varchar(250) NOT NULL,
  `token` varchar(250) NOT NULL,
  `pseudo` varchar(250) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `statut` varchar(10) NOT NULL,
  `id_serie` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Score_Id_Serie` (`id_serie`),
  CONSTRAINT `FK_Score_Id_Serie` FOREIGN KEY (`Id_Serie`) REFERENCES `serie` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `longitude` varchar(250) NOT NULL,
  `latitude` varchar(250) NOT NULL,
  `id_ville` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Photo_Id_Ville` (`id_ville`),
  CONSTRAINT `FK_Photo_Id_Ville` FOREIGN KEY (`Id_Ville`) REFERENCES `ville` (`Id`),
  CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`id`) REFERENCES `niveau` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `serie`;
CREATE TABLE `serie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_Niveau` int(11) NOT NULL,
  `Id_Ville` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Serie_Id_Niveau` (`id_Niveau`),
  KEY `FK_Serie_Id_Ville` (`Id_Ville`),
  CONSTRAINT `FK_Serie_Id_Niveau` FOREIGN KEY (`Id_Niveau`) REFERENCES `niveau` (`Id`),
  CONSTRAINT `FK_Serie_Id_Ville` FOREIGN KEY (`Id_Ville`) REFERENCES `ville` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(250) NOT NULL,
  `identifiant` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `mail` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `ville`;
CREATE TABLE `ville` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `longitude` varchar(52) NOT NULL,
  `latitude` varchar(52) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2018-02-05 12:13:13
