/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: metroasir
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conexiones`
--

DROP TABLE IF EXISTS `conexiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conexiones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estacion_origen_id` int(10) unsigned NOT NULL,
  `estacion_destino_id` int(10) unsigned NOT NULL,
  `tiempo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estacion_origen_id` (`estacion_origen_id`),
  KEY `estacion_destino_id` (`estacion_destino_id`),
  CONSTRAINT `conexiones_ibfk_1` FOREIGN KEY (`estacion_origen_id`) REFERENCES `estaciones` (`id`),
  CONSTRAINT `conexiones_ibfk_2` FOREIGN KEY (`estacion_destino_id`) REFERENCES `estaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conexiones`
--

LOCK TABLES `conexiones` WRITE;
/*!40000 ALTER TABLE `conexiones` DISABLE KEYS */;
INSERT INTO `conexiones` VALUES
(1,1,2,2),
(2,2,3,2),
(3,3,4,2),
(4,4,5,2),
(5,5,6,2),
(6,6,7,2),
(7,7,8,2),
(8,8,9,2),
(9,9,10,2),
(10,10,11,2),
(11,11,12,2),
(12,12,13,2),
(13,13,14,2),
(14,14,15,2),
(15,15,16,2),
(16,16,17,2),
(17,17,18,2),
(18,18,19,2),
(19,19,20,2),
(20,20,21,2),
(21,21,22,2),
(22,22,23,2);
/*!40000 ALTER TABLE `conexiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estaciones`
--

DROP TABLE IF EXISTS `estaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `estaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `adaptada` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estaciones`
--

LOCK TABLES `estaciones` WRITE;
/*!40000 ALTER TABLE `estaciones` DISABLE KEYS */;
INSERT INTO `estaciones` VALUES
(1,'Argüelles',1),
(2,'San Bernardo',1),
(3,'Bilbao',1),
(4,'Alonso Martínez',1),
(5,'Colón',1),
(6,'Serrano',1),
(7,'Velázquez',1),
(8,'Goya',1),
(9,'Lista',1),
(10,'Diego de León',1),
(11,'Avenida de América',1),
(12,'Prosperidad',1),
(13,'Alfonso XIII',1),
(14,'Avenida de la Paz',1),
(15,'Arturo Soria',1),
(16,'Esperanza',0),
(17,'Canillas',1),
(18,'Mar de Cristal',1),
(19,'San Lorenzo',0),
(20,'Parque de Santa María',0),
(21,'Hortaleza',0),
(22,'Manoteras',1),
(23,'Pinar de Chamartín',1);
/*!40000 ALTER TABLE `estaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-17 16:12:32
