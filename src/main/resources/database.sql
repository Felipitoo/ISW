-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external`
--

DROP TABLE IF EXISTS `external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `external` (
  `name` varchar(100) NOT NULL,
  `rut` varchar(100) NOT NULL,
  `id_external` int(11) NOT NULL,
  PRIMARY KEY (`id_external`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external`
--

LOCK TABLES `external` WRITE;
/*!40000 ALTER TABLE `external` DISABLE KEYS */;
INSERT INTO `external` VALUES ('Enrico Pucci','11111111-1',0),('Diavolo','11111111-2',1);
/*!40000 ALTER TABLE `external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `group` (
  `id_group` int(11) NOT NULL,
  `name_group` varchar(100) NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (0,'Encargados'),(1,'Stardust Crusaders'),(2,'Vento Aureo'),(3,'Stone Ocean');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `loan` (
  `external_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `loan_number` int(11) NOT NULL,
  `loan_date` date NOT NULL,
  PRIMARY KEY (`loan_number`),
  KEY `external_id_idx` (`external_id`),
  KEY `tool_id_idx` (`tool_id`),
  CONSTRAINT `external_id` FOREIGN KEY (`external_id`) REFERENCES `external` (`id_external`),
  CONSTRAINT `tool_id` FOREIGN KEY (`tool_id`) REFERENCES `tool` (`id_tool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Asosiacion de prestamo, external - tool';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (0,2,354354,'2019-10-20');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `machine` (
  `id_machine` int(11) NOT NULL,
  `usage_time` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `availability` tinyint(4) NOT NULL,
  `used_by` int(11) NOT NULL,
  PRIMARY KEY (`id_machine`),
  KEY `used_by_idx` (`used_by`),
  CONSTRAINT `used_by` FOREIGN KEY (`used_by`) REFERENCES `group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
INSERT INTO `machine` VALUES (0,2,'bulldozer',1,1),(1,0,'Piedra Roja de Aja',1,0);
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nota` (
  `id2` bigint(20) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id2`),
  KEY `FKnntty3x04q5r49da0fum6ft58` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `storage` (
  `id_storage` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `group_in_charge` int(11) NOT NULL,
  PRIMARY KEY (`id_storage`),
  KEY `group_in_charge_idx` (`group_in_charge`),
  CONSTRAINT `group_in_charge` FOREIGN KEY (`group_in_charge`) REFERENCES `group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (0,NULL,0),(1,'2019-07-18',2),(2,'2019-07-18',3),(3,NULL,0);
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_external`
--

DROP TABLE IF EXISTS `tbl_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_external` (
  `id_external` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rut` varchar(255) DEFAULT NULL,
  `loan_loan_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_external`),
  KEY `FKaqpnr0ifr3n1xplmbkvuhy5pf` (`loan_loan_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_external`
--

LOCK TABLES `tbl_external` WRITE;
/*!40000 ALTER TABLE `tbl_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_group`
--

DROP TABLE IF EXISTS `tbl_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_group` (
  `id_group` int(11) NOT NULL,
  `name_group` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_group`
--

LOCK TABLES `tbl_group` WRITE;
/*!40000 ALTER TABLE `tbl_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_loan`
--

DROP TABLE IF EXISTS `tbl_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_loan` (
  `loan_number` int(11) NOT NULL,
  `loan_date` datetime DEFAULT NULL,
  PRIMARY KEY (`loan_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_loan`
--

LOCK TABLES `tbl_loan` WRITE;
/*!40000 ALTER TABLE `tbl_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_loan_external`
--

DROP TABLE IF EXISTS `tbl_loan_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_loan_external` (
  `loan_loan_number` int(11) NOT NULL,
  `external_id_external` int(11) NOT NULL,
  PRIMARY KEY (`loan_loan_number`,`external_id_external`),
  UNIQUE KEY `UK_d1xkiwqldi8s1bteudepa3wsr` (`external_id_external`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_loan_external`
--

LOCK TABLES `tbl_loan_external` WRITE;
/*!40000 ALTER TABLE `tbl_loan_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_loan_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_loan_tool`
--

DROP TABLE IF EXISTS `tbl_loan_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_loan_tool` (
  `loan_loan_number` int(11) NOT NULL,
  `tool_id_tool` int(11) NOT NULL,
  PRIMARY KEY (`loan_loan_number`,`tool_id_tool`),
  UNIQUE KEY `UK_5qgj1rkxvsygw3s2wuuuevma9` (`tool_id_tool`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_loan_tool`
--

LOCK TABLES `tbl_loan_tool` WRITE;
/*!40000 ALTER TABLE `tbl_loan_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_loan_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_machine`
--

DROP TABLE IF EXISTS `tbl_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_machine` (
  `id_machine` int(11) NOT NULL,
  `availability` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `usage_time` int(11) DEFAULT NULL,
  `group_id_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_machine`),
  KEY `FK5pjh6w2bvjuliy8egochw1vv7` (`group_id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_machine`
--

LOCK TABLES `tbl_machine` WRITE;
/*!40000 ALTER TABLE `tbl_machine` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_storage`
--

DROP TABLE IF EXISTS `tbl_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_storage` (
  `id_storage` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `group_id_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_storage`),
  KEY `FK5cfiu9yv1l0mnrmsojmvh7jdq` (`group_id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_storage`
--

LOCK TABLES `tbl_storage` WRITE;
/*!40000 ALTER TABLE `tbl_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tool`
--

DROP TABLE IF EXISTS `tbl_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_tool` (
  `id_tool` int(11) NOT NULL,
  `availability` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `loan_loan_number` int(11) DEFAULT NULL,
  `storage_id_storage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tool`),
  KEY `FKrs2vw1blpyyy8miit2q219v5a` (`loan_loan_number`),
  KEY `FKhstqx49o5mqiubg18uxyxr1t8` (`storage_id_storage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tool`
--

LOCK TABLES `tbl_tool` WRITE;
/*!40000 ALTER TABLE `tbl_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_type_user`
--

DROP TABLE IF EXISTS `tbl_type_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_type_user` (
  `id_type_user` int(11) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_type_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_type_user`
--

LOCK TABLES `tbl_type_user` WRITE;
/*!40000 ALTER TABLE `tbl_type_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_type_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `group_id_group` int(11) DEFAULT NULL,
  `type_user_id_type_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `FKp0wwi3wylq0w6fpivh1xrtotb` (`group_id_group`),
  KEY `FKn9sihjvoes5t11aum8tbici71` (`type_user_id_type_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tool` (
  `id_tool` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `availability` tinyint(4) NOT NULL,
  `saved_in_id` int(11) NOT NULL,
  PRIMARY KEY (`id_tool`),
  KEY `saved_in_id_idx` (`saved_in_id`),
  CONSTRAINT `saved_in_id` FOREIGN KEY (`saved_in_id`) REFERENCES `group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
INSERT INTO `tool` VALUES (0,'Stand Arrow',1,2),(1,'Jotaro Memories',0,3),(2,'Speedwagon Hat',1,0);
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_user`
--

DROP TABLE IF EXISTS `type_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type_user` (
  `id_type_user` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_type_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_user`
--

LOCK TABLES `type_user` WRITE;
/*!40000 ALTER TABLE `type_user` DISABLE KEYS */;
INSERT INTO `type_user` VALUES (0,'Encargado'),(1,'Integrante');
/*!40000 ALTER TABLE `type_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `type_idx` (`type`),
  KEY `group_id_idx` (`group_id`),
  CONSTRAINT `group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id_group`),
  CONSTRAINT `type` FOREIGN KEY (`type`) REFERENCES `type_user` (`id_type_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'Jotaro Kujoh','JotaroKujoh@email.com','Jotaro','123456789',0,0),(1,'Dio Brando','DioBrando@email.com','Dio','123456789',0,0),(2,'Jean Pierre Polnareff','JeanPolnareff@email.com','Jean','123456789',1,1),(3,'Muhammad Avdol','MuhammadAvdol@email.com','Muhammad','123456789',1,1),(4,'Noriaki Kakyoin','NoriakiKakyoin@email.com','Noriaki','123456789',1,1),(5,'Giorno Giovanna','GiornoGiovanna@email.com','Giorno','123456789',1,2),(6,'Guido Mista','GuidoMista@email.com','Guido','123456789',1,2),(7,'Narancia Ghirga','NaranciaGhirga@email.com','Narancia','123456789',1,2),(8,'Jolyne Kujoh','JolyneKujoh@email.com','Jolyne','123456789',1,3),(9,'Foo Fighters','FooFighters@email.com','Foo','123456789',1,3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-19 15:28:46
