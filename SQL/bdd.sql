-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `partie`;
CREATE TABLE `partie` (
  `id` varchar(250) NOT NULL,
  `token` varchar(250) NOT NULL,
  `pseudo` varchar(250) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `statut` varchar(10) NOT NULL,
  `id_serie` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Score_Id_Serie` (`id_serie`),
  CONSTRAINT `partie_ibfk_1` FOREIGN KEY (`id_serie`) REFERENCES `serie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `longitude` varchar(250) NOT NULL,
  `latitude` varchar(250) NOT NULL,
  `id_ville` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Photo_Id_Ville` (`id_ville`),
  CONSTRAINT `photo_ibfk_2` FOREIGN KEY (`id_ville`) REFERENCES `serie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `photo` (`id`, `url`, `longitude`, `latitude`, `id_ville`) VALUES
(3,	'http://google.fr',	'48',	'6',	'd04a64c8-11c8-4873-88a7-f303a967cd80');

DROP TABLE IF EXISTS `serie`;
CREATE TABLE `serie` (
  `id` varchar(250) NOT NULL,
  `ville` varchar(25) NOT NULL,
  `longitude` varchar(52) NOT NULL,
  `latitude` varchar(52) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `serie` (`id`, `ville`, `longitude`, `latitude`) VALUES
('d04a64c8-11c8-4873-88a7-f303a967cd80',	'Test',	'48',	'6'),
('f6d031a0-7263-4915-8d4a-ffd32c542b8f',	'Nancy',	'48',	'6');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(250) NOT NULL,
  `identifiant` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `mail` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` (`id`, `identifiant`, `password`, `mail`) VALUES
('54cebb72-3624-4a3f-b2b3-4e3f59158521',	'test',	'$2y$10$6gOxvkLtgmBK5IST6SkCBe5g0zyTtvOsLm5gN.7D6M2jLREUSz6u.',	'test@test.fr'),
('970f46fc-3334-4bb1-bf5e-faa2686e7cd5',	'Test2',	'$2y$10$yumRqLCa8CAFW6SGQyIivuOJ0LkJTldReUBq7Bb1FjzYfKuDSGm9S',	'test@test.com'),
('f2828f50-5569-4074-9c9e-eb4a44867ff4',	'Greite',	'$2y$10$D1X5.bfyIoxI7q/6O3.WYO04Tx2WApxFDfTN/.7cVsw.iWxBLC1VO',	'greite@greite.fr');

-- 2018-02-06 09:16:27
