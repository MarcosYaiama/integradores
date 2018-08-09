-- MySQL dump 10.13  Distrib 8.0.4-rc, for Win64 (x86_64)
--
-- Host: localhost    Database: integradores
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.30-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `analise`
--

DROP TABLE IF EXISTS `analise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `analise` (
  `id_carga_fk` int(11) DEFAULT NULL,
  `umidade` int(11) DEFAULT NULL,
  `temperatura` int(11) DEFAULT NULL,
  `grao_fk` varchar(30) DEFAULT NULL,
  `hora_inicio_analise` time DEFAULT NULL,
  `data_inicio_analise` date DEFAULT NULL,
  `estado_fk` varchar(30) DEFAULT NULL,
  `resultado` varchar(35) DEFAULT NULL,
  `tempo_analise` time DEFAULT NULL,
  KEY `id_carga_fk` (`id_carga_fk`),
  KEY `grao_fk` (`grao_fk`),
  KEY `estado_fk` (`estado_fk`),
  CONSTRAINT `analise_ibfk_1` FOREIGN KEY (`id_carga_fk`) REFERENCES `info_cargas` (`id_carga`),
  CONSTRAINT `analise_ibfk_2` FOREIGN KEY (`grao_fk`) REFERENCES `info_cargas` (`grao`),
  CONSTRAINT `analise_ibfk_3` FOREIGN KEY (`estado_fk`) REFERENCES `estado_analise` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analise`
--

LOCK TABLES `analise` WRITE;
/*!40000 ALTER TABLE `analise` DISABLE KEYS */;
INSERT INTO `analise` VALUES (1,9,21,'Soja','16:14:05','2018-08-08','Analista','Indisponivel','00:00:01'),(2,9,17,'Milho','16:14:06','2018-08-08','Analista','Indisponivel','00:00:01'),(3,1,14,'Milho','16:14:07','2018-08-08','Analista','Indisponivel','00:00:01'),(4,0,16,'Soja','16:14:08','2018-08-08','Analista','Indisponivel','00:00:01'),(5,7,19,'Soja','16:14:09','2018-08-08','Analista','Indisponivel','00:00:01'),(6,5,11,'Soja','16:14:10','2018-08-08','Analista','Indisponivel','00:00:01'),(7,8,18,'Soja','16:14:11','2018-08-08','Analista','Indisponivel','00:00:01'),(8,7,15,'Milho','16:14:12','2018-08-08','Analista','Indisponivel','00:00:01'),(9,9,10,'Milho','16:14:13','2018-08-08','Analista','Indisponivel','00:00:01'),(10,0,20,'Soja','16:14:14','2018-08-08','Analista','Indisponivel','00:00:01'),(11,4,20,'Soja','16:14:15','2018-08-08','Analista','Indisponivel','00:00:01'),(12,1,18,'Soja','16:14:17','2018-08-08','Analista','Indisponivel','00:00:01'),(13,0,20,'Milho','16:14:18','2018-08-08','Analista','Indisponivel','00:00:01'),(14,7,12,'Soja','16:14:19','2018-08-08','Analista','Indisponivel','00:00:01'),(15,1,15,'Soja','16:14:20','2018-08-08','Analista','Indisponivel','00:00:01'),(16,9,10,'Soja','16:14:21','2018-08-08','Analista','Indisponivel','00:00:01'),(17,10,20,'Milho','16:14:22','2018-08-08','Analista','Indisponivel','00:00:01'),(18,5,11,'Soja','16:41:34','2018-08-08','Analista','Indisponivel','00:00:01'),(19,9,15,'Milho','21:33:20','2018-08-08','Analista','Indisponivel','00:00:01');
/*!40000 ALTER TABLE `analise` ENABLE KEYS */;
UNLOCK TABLES;
