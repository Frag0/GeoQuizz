-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `partie`;
CREATE TABLE `partie` (
  `id` varchar(250) NOT NULL,
  `token` varchar(2500) NOT NULL,
  `pseudo` varchar(250) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `statut` tinyint(4) NOT NULL,
  `id_serie` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Score_Id_Serie` (`id_serie`),
  CONSTRAINT `partie_ibfk_1` FOREIGN KEY (`id_serie`) REFERENCES `serie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `partie` (`id`, `token`, `pseudo`, `score`, `statut`, `id_serie`) VALUES
('b4284cf0-f552-4fa0-b7e2-ba1c63a340fa',	'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJodHRwOlwvXC9hcGkuZ2VvcXVpenoubG9jYWw6MTAxMDFcL3BhcnRpZXNcL2I0Mjg0Y2YwLWY1NTItNGZhMC1iN2UyLWJhMWM2M2EzNDBmYSIsImF1ZCI6Imh0dHA6XC9cL2FwaS5nZW9xdWl6ei5sb2NhbDoxMDEwMVwvIiwiaWF0IjoxNTE4MDk5MjU2LCJleHAiOjE1MTgxMDI4NTYsImlkIjoiYjQyODRjZjAtZjU1Mi00ZmEwLWI3ZTItYmExYzYzYTM0MGZhIn0.f6qpHd_Zli69C0mmxqb0i-JvrCqf2XXrsGcFOCQg0R3E8jUEmnsxTSr535yyVcJKTDkIYyo8H8bzZYK-PFe1bA',	'fragolo',	NULL,	0,	'94bf03a0-1996-4fd3-b7ea-94bfa87b9a67'),
('dd9ee16a-94d1-40b1-9a3b-74a078b1ad04',	'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJodHRwOlwvXC9hcGkuZ2VvcXVpenoubG9jYWw6MTAxMDFcL3BhcnRpZXNcL2RkOWVlMTZhLTk0ZDEtNDBiMS05YTNiLTc0YTA3OGIxYWQwNCIsImF1ZCI6Imh0dHA6XC9cL2FwaS5nZW9xdWl6ei5sb2NhbDoxMDEwMVwvIiwiaWF0IjoxNTE4MTAwMTcxLCJleHAiOjE1MTgxMDM3NzEsImlkIjoiZGQ5ZWUxNmEtOTRkMS00MGIxLTlhM2ItNzRhMDc4YjFhZDA0In0.dduG-jDU8pqIEPRckSsyyiqozTmKCHDC5U-RZGgu8u6SQjHlPKR7DDmiN2_eCvaMmgx56BA175EArE5Uiex-Iw',	'frago',	NULL,	0,	'94bf03a0-1996-4fd3-b7ea-94bfa87b9a67');

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
(5,	'http://www.nancy-tourisme.fr/fileadmin/nancy_tourisme/documents/Decouvrir/Histoire_et_patrimoine/unesco/place_stan_jour_bandeau.jpg',	'6.1832588911057',	'48.693550683299',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(6,	'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Nancy_Cathedral_BW_2015-07-18_16-31-28.jpg/280px-Nancy_Cathedral_BW_2015-07-18_16-31-28.jpg',	'6.1859625577927',	'48.691185254124',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(7,	'https://upload.wikimedia.org/wikipedia/commons/5/59/Nancy_-_Musee_des_Beaux_Arts.jpg',	'6.182057261467',	'48.693515273502',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(8,	'https://www.theatre-manufacture.fr/wp-content/themes/wp-theatre_manufacture/assets/images/la_manufacture/cdn.jpg',	'6.1717683076859',	'48.696241755006',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(9,	'https://files1.structurae.de/files/350high/64/nancy/dscf0641.jpg',	'6.1753383278847',	'48.691030328799',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(10,	'http://www.monumentum.fr/photo/54/pa54000065.jpg',	'6.1803567409515',	'48.680346414021',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(11,	'https://www.lexpress.fr/medias/20/l-autre-canal_47.jpg',	'6.1985474824905',	'48.694308446987',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(12,	'http://www.info-stades.fr/uploads/stades/nancy-zenith6.jpg',	'6.1392223834991',	'48.710117965341',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(13,	'http://www.asnl.net/upload/cache/pages/club/histoire/stade/stade6_w500_h500_r3_q75.jpg',	'6.2114489078522',	'48.69608418964',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(14,	'http://www.monumentum.fr/photo/54/pa00106110.jpg',	'6.18098706007',	'48.689047242548',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(15,	'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Gare_de_Nancy_-_place_Thiers_02.jpg/1200px-Gare_de_Nancy_-_place_Thiers_02.jpg',	'6.1750996112823',	'48.690000727248',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(16,	'https://france3-regions.francetvinfo.fr/grand-est/sites/regions_france3/files/styles/top_big/public/assets/images/2015/01/03/iut_charlemagne.jpg?itok=dz-YvtdV',	'6.1615490913391',	'48.683186943372',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(17,	'http://cdn-s-www.estrepublicain.fr/images/277443AB-F3D5-41B4-AD5C-3972F5A5C3FD/LER_22/title-1500324423.jpg',	'6.1803352832794',	'48.685425252646',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(18,	'https://static.panoramio.com.storage.googleapis.com/photos/large/77412183.jpg',	'6.1768698692322',	'48.69420221912',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(19,	'https://upload.wikimedia.org/wikipedia/commons/f/f1/Nancy_Place_Stanislas_Arc_H%C3%A9r%C3%A9_5.jpg',	'6.1826366186142',	'48.694443001964',	'b1568118-bc4a-425a-a40e-b1432167f604'),
(20,	'https://www.repstatic.it/content/localirep/img/rep-roma/2018/01/06/141830722-abfac3d8-04bf-4108-a0fc-082bfde8c222.jpg',	'12.492334842682',	'41.890289963005',	'94bf03a0-1996-4fd3-b7ea-94bfa87b9a67'),
(21,	'https://www.desti-nations.com/wp-content/uploads/2016/08/St-Peter-basilica-Vatican-Rome2000.jpg',	'12.457273006439',	'41.902257077681',	'94bf03a0-1996-4fd3-b7ea-94bfa87b9a67'),
(22,	'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Rome_Pantheon_front.jpg/1200px-Rome_Pantheon_front.jpg',	'12.476810216904',	'41.89858372745',	'94bf03a0-1996-4fd3-b7ea-94bfa87b9a67'),
(23,	'https://francoiscazaud.files.wordpress.com/2011/03/chateau-saint-ange-c-chocoborama-flickr1.jpg',	'12.466295957565',	'41.903031648469',	'94bf03a0-1996-4fd3-b7ea-94bfa87b9a67'),
(24,	'http://www.museivaticani.va/content/dam/museivaticani/immagini/collezioni/musei/cappella_sistina/00_00_Cappella_Sistina.png/_jcr_content/renditions/cq5dam.web.1280.1280.png',	'12.454526424408',	'41.903071574544',	'94bf03a0-1996-4fd3-b7ea-94bfa87b9a67'),
(25,	'http://www.stendhalhotelrome.it/img/trevi01.jpg',	'12.483311891556',	'41.900941483598',	'94bf03a0-1996-4fd3-b7ea-94bfa87b9a67'),
(26,	'http://dreamguides.edreams.fr/wp-content/uploads/sites/23/2011/03/forum-romain-750x400.jpg',	'12.486670017242',	'41.891627739792',	'94bf03a0-1996-4fd3-b7ea-94bfa87b9a67'),
(27,	'https://i.ytimg.com/vi/AepIsJZDiOM/maxresdefault.jpg',	'12.482727169991',	'41.895323452133',	'94bf03a0-1996-4fd3-b7ea-94bfa87b9a67'),
(28,	'https://www.cityzeum.com/images/lieu/wk_382667.jpg',	'12.482936382294',	'41.893274963766',	'94bf03a0-1996-4fd3-b7ea-94bfa87b9a67'),
(29,	'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Ac_titus_face_est.jpg/1200px-Ac_titus_face_est.jpg',	'12.488708496094',	'41.890876990896',	'94bf03a0-1996-4fd3-b7ea-94bfa87b9a67'),
(30,	'http://ekladata.com/9kUWxjklyX88iP0wJWMDhuxQRO0.jpg',	'2.2943830490112',	'48.858284648397',	'736ff054-945a-4b5e-8789-9cd121f8f45a'),
(31,	'https://grandhoteldechampaigne.com/wp-content/uploads/2017/03/pyramide-louvre.jpg',	'2.3358178138733',	'48.861012783133',	'736ff054-945a-4b5e-8789-9cd121f8f45a'),
(32,	'https://www.challenges.fr/assets/img/2016/02/16/cover-r4x3w1000-578e4ee2016e7-le-palais-de-l-elysee.jpg',	'2.3165380954742',	'48.870117253506',	'736ff054-945a-4b5e-8789-9cd121f8f45a'),
(33,	'https://www.hoteldelaloire-paris.com/sites/www.hoteldelaloire-paris.com/files/styles/scale_1140/public/place_photos/shutterstock_86473111.jpg?itok=0eyl7Guq',	'2.3499584197998',	'48.852947944616',	'736ff054-945a-4b5e-8789-9cd121f8f45a'),
(34,	'http://www.cheminsdememoire.gouv.fr/sites/default/files/styles/diaporama_fiche/public/Lieux_ArcTriomphe36.jpg?itok=TuO6IZGT',	'2.2950267791748',	'48.873733879855',	'736ff054-945a-4b5e-8789-9cd121f8f45a'),
(35,	'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Paris_Pont_des_Arts.jpg/638px-Paris_Pont_des_Arts.jpg',	'2.3375558853149',	'48.858478763802',	'736ff054-945a-4b5e-8789-9cd121f8f45a'),
(36,	'https://www.jardindevilliers.com/images/activites-tourisme/montmartre-hotel-jardin-villiers-paris.jpg',	'2.342973947525',	'48.886818590082',	'736ff054-945a-4b5e-8789-9cd121f8f45a'),
(37,	'https://www.parisinfo.com/var/otcp/sites/images/node_43/node_51/node_77884/node_77888/jardin-du-luxembourg-vue-sur-le-palais-%7C-630x405-%7C-%C2%A9-fotolia-thomas-launois/11885002-1-fre-FR/Jardin-du-Luxembourg-Vue-sur-le-Palais-%7C-630x405-%7C-%C2%A9-Fotolia-Thomas-Launois.jpg',	'2.3359680175781',	'48.846812856082',	'736ff054-945a-4b5e-8789-9cd121f8f45a'),
(38,	'http://cityguide.paris-is-beautiful.com/wp-content/uploads/2014/03/305D_JARDINDESTUILERIES.jpg',	'2.3256683349609',	'48.864093667244',	'736ff054-945a-4b5e-8789-9cd121f8f45a');

DROP TABLE IF EXISTS `serie`;
CREATE TABLE `serie` (
  `id` varchar(250) NOT NULL,
  `ville` varchar(25) NOT NULL,
  `longitude` varchar(52) NOT NULL,
  `latitude` varchar(52) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `serie` (`id`, `ville`, `longitude`, `latitude`) VALUES
('736ff054-945a-4b5e-8789-9cd121f8f45a',	'Paris',	'2.3455810546875',	'48.854098631238'),
('94bf03a0-1996-4fd3-b7ea-94bfa87b9a67',	'Rome',	'12.482743263245',	'41.89334883827'),
('b1568118-bc4a-425a-a40e-b1432167f604',	'Nancy',	'6.1841011047363',	'48.692716775966'),
('d04a64c8-11c8-4873-88a7-f303a967cd80',	'Loisey',	'5.28472',	'48.7644'),
('e8724b30-1c7b-44b3-a144-3602e542add0',	'New York',	'-73.9772',	'40.7808'),
('f6d031a0-7263-4915-8d4a-ffd32c542b8f',	'Saint-Remy-en-Bouzemont',	'4.65',	'48.6333');

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
('a6c9bb06-3c54-47b7-9f2b-d770fb372578',	'leo',	'$2y$10$e2szG2j2AxkKTGNOaTvvKuVyhXuXSVDRg4gbmX9N6tKRt3ovfYMi6',	'leo@leo.fr'),
('adf1975e-1c5d-4ea3-a528-a24940e5f346',	'leo',	'$2y$10$nnzd6wwKwQ4z18kfmrNuLuj2UzVo4oW9oeKJIuSTYvXASYErRJdIe',	''),
('ba331462-5b92-4d09-bb40-61a56df19793',	'Frago',	'$2y$10$AfodnS1tyCoObo4Hmk60r.Uag6M/oJtLaNO9lAcb4.JxNuu4fbW1S',	''),
('f2828f50-5569-4074-9c9e-eb4a44867ff4',	'Greite',	'$2y$10$D1X5.bfyIoxI7q/6O3.WYO04Tx2WApxFDfTN/.7cVsw.iWxBLC1VO',	'greite@greite.fr');

-- 2018-02-08 15:27:27
