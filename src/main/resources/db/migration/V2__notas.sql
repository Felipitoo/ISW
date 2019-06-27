DROP TABLE IF EXISTS `notas`;

SET character_set_client = utf8mb4 ;
CREATE TABLE `nota` (
  `id2` int(6) unsigned NOT NULL,
  `status` varchar(500) NOT NULL,
  PRIMARY KEY (`id2`),
  CONSTRAINT `FK_statusID` FOREIGN KEY (`id2`) REFERENCES `blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;