CREATE DATABASE  IF NOT EXISTS `watches` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `watches`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: watches
-- ------------------------------------------------------
-- Server version	5.6.36-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `бренд`
--

DROP TABLE IF EXISTS `бренд`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `бренд` (
  `id_brand` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) NOT NULL,
  PRIMARY KEY (`id_brand`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `бренд`
--

LOCK TABLES `бренд` WRITE;
/*!40000 ALTER TABLE `бренд` DISABLE KEYS */;
INSERT INTO `бренд` VALUES (1,'6MX'),(2,'Adriatica'),(3,'Anne Klein'),(4,'Armand Nicolet'),(5,'Armani Exchange'),(6,'Armin Strom'),(7,'Auguste Reymond'),(8,'Aviator'),(9,'BALL'),(10,'Balmain'),(11,'Boccia Titanium'),(12,'Bomberg'),(13,'Calvin Klein'),(14,'Candino'),(15,'Carl von Zeyten'),(16,'Casio'),(17,'Certina'),(18,'Citizen'),(19,'Continental'),(20,'Cornavin'),(21,'Corum'),(22,'Cuervo y Sobrinos'),(23,'CYSTOS'),(24,'D1 Milano'),(25,'Daniel Klein'),(26,'Daniel Wellington'),(27,'DAYOSA'),(28,'Delbana'),(29,'Delma'),(30,'Diesel'),(31,'DKNY'),(32,'Doodle'),(33,'Ducati'),(34,'Elysee'),(35,'Emporio Armani'),(36,'Epos'),(37,'Festina'),(38,'Fossil'),(39,'Freelook'),(40,'Furla'),(41,'Garmin'),(42,'Graham'),(43,'Gucci'),(44,'Guess'),(45,'Hugo Boss'),(46,'Invicta'),(47,'Jacques Lemans'),(48,'L Duchen'),(49,'Lee Cooper'),(50,'Mathey-Tissot'),(51,'Orient'),(52,'Q&Q'),(53,'Rodania'),(54,'Santa Barbara Polo & Racquet'),(55,'Seiko'),(56,'SOKOLOV'),(57,'Stuhrling'),(58,'TAG Hever'),(59,'Tommy Hilfiger'),(60,'Versace'),(61,'Vostok Europe'),(62,'Wainer'),(63,'Михаил Москвитин'),(64,'Восток'),(65,'Ника');
/*!40000 ALTER TABLE `бренд` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `часы`
--

DROP TABLE IF EXISTS `часы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `часы` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `id_sex` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_style` int(11) NOT NULL,
  `id_watchcase` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  KEY `id_sex` (`id_sex`),
  KEY `id_brand` (`id_brand`),
  KEY `id_country` (`id_country`),
  KEY `id_style` (`id_style`),
  KEY `id_watchcase` (`id_watchcase`),
  CONSTRAINT `часы_ibfk_1` FOREIGN KEY (`id_sex`) REFERENCES `пол` (`id_sex`),
  CONSTRAINT `часы_ibfk_2` FOREIGN KEY (`id_brand`) REFERENCES `бренд` (`id_brand`),
  CONSTRAINT `часы_ibfk_3` FOREIGN KEY (`id_country`) REFERENCES `страна` (`id_country`),
  CONSTRAINT `часы_ibfk_4` FOREIGN KEY (`id_style`) REFERENCES `стиль` (`id_style`),
  CONSTRAINT `часы_ibfk_5` FOREIGN KEY (`id_watchcase`) REFERENCES `корпус` (`id_watchcase`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `часы`
--

LOCK TABLES `часы` WRITE;
/*!40000 ALTER TABLE `часы` DISABLE KEYS */;
INSERT INTO `часы` VALUES (1,2,3,4,2,2,5450,'3379SVSI'),(2,1,55,2,4,2,19860,'SNKK11J1'),(3,1,24,6,4,2,18210,'UTNJ01'),(4,1,12,1,6,3,116900,'BS45CHPBA.049.3'),(5,2,65,3,2,1,40250,'0312.0.1.31H');
/*!40000 ALTER TABLE `часы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `заявка`
--

DROP TABLE IF EXISTS `заявка`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `заявка` (
  `id_request` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id_request`),
  KEY `id_client` (`id_client`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `заявка_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `клиенты` (`id_client`),
  CONSTRAINT `заявка_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `часы` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заявка`
--

LOCK TABLES `заявка` WRITE;
/*!40000 ALTER TABLE `заявка` DISABLE KEYS */;
/*!40000 ALTER TABLE `заявка` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `клиенты`
--

DROP TABLE IF EXISTS `клиенты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `клиенты` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `surname` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `patronymic` varchar(255) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `клиенты`
--

LOCK TABLES `клиенты` WRITE;
/*!40000 ALTER TABLE `клиенты` DISABLE KEYS */;
INSERT INTO `клиенты` VALUES (1,'Седов','Михаил','Юрьевич',19,'89885718415','lastgamerferrum@gmail.com');
/*!40000 ALTER TABLE `клиенты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `корпус`
--

DROP TABLE IF EXISTS `корпус`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `корпус` (
  `id_watchcase` int(11) NOT NULL AUTO_INCREMENT,
  `watchcase_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_watchcase`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `корпус`
--

LOCK TABLES `корпус` WRITE;
/*!40000 ALTER TABLE `корпус` DISABLE KEYS */;
INSERT INTO `корпус` VALUES (1,'Золото'),(2,'Серебро'),(3,'Титан'),(4,'Керамика');
/*!40000 ALTER TABLE `корпус` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `пол`
--

DROP TABLE IF EXISTS `пол`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `пол` (
  `id_sex` int(11) NOT NULL AUTO_INCREMENT,
  `sex` varchar(255) NOT NULL,
  PRIMARY KEY (`id_sex`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `пол`
--

LOCK TABLES `пол` WRITE;
/*!40000 ALTER TABLE `пол` DISABLE KEYS */;
INSERT INTO `пол` VALUES (1,'Мужской'),(2,'Женский');
/*!40000 ALTER TABLE `пол` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `стиль`
--

DROP TABLE IF EXISTS `стиль`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `стиль` (
  `id_style` int(11) NOT NULL AUTO_INCREMENT,
  `style_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_style`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `стиль`
--

LOCK TABLES `стиль` WRITE;
/*!40000 ALTER TABLE `стиль` DISABLE KEYS */;
INSERT INTO `стиль` VALUES (1,'Военные'),(2,'Дизайнерские'),(3,'Милитари'),(4,'На каждый день'),(5,'Под костюм'),(6,'Спортивные'),(7,'Пилотские');
/*!40000 ALTER TABLE `стиль` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `страна`
--

DROP TABLE IF EXISTS `страна`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `страна` (
  `id_country` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `страна`
--

LOCK TABLES `страна` WRITE;
/*!40000 ALTER TABLE `страна` DISABLE KEYS */;
INSERT INTO `страна` VALUES (1,'Швейцария'),(2,'Япония'),(3,'Россия'),(4,'США'),(5,'Германия'),(6,'Италия');
/*!40000 ALTER TABLE `страна` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-15 22:08:05
