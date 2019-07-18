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
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `loan` (
  `external_id` int(11) NOT NULL,
  `ltool_id` int(11) NOT NULL,
  KEY `external_id_idx` (`external_id`),
  KEY `tool_id_idx` (`ltool_id`),
  CONSTRAINT `external_id` FOREIGN KEY (`external_id`) REFERENCES `external` (`id_external`),
  CONSTRAINT `tool_id` FOREIGN KEY (`ltool_id`) REFERENCES `tool` (`id_tool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Asosiacion de prestamo, external - tool';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (0,2);
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

-- Dump completed on 2019-07-18 19:43:40
