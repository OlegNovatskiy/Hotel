-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: kerpach_hotel
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `apartments`
--

DROP TABLE IF EXISTS `apartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(5) NOT NULL,
  `people_count` int(11) NOT NULL,
  `bed_count` int(11) NOT NULL,
  `rooms_count` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `occupied` tinyint(1) DEFAULT '0',
  `description` text,
  `image` varchar(250) DEFAULT 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTQyGan7QfdKjZxx-v6q-Xt3IAHIdlSFAZJlo1X9lWcMQs-uS81',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `number_UNIQUE` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartments`
--

LOCK TABLES `apartments` WRITE;
/*!40000 ALTER TABLE `apartments` DISABLE KEYS */;
INSERT INTO `apartments` VALUES (1,'201',2,1,1,400,0,'Опис 1 ','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTQyGan7QfdKjZxx-v6q-Xt3IAHIdlSFAZJlo1X9lWcMQs-uS81'),(2,'202',2,2,1,550,0,'Опис 2','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTQyGan7QfdKjZxx-v6q-Xt3IAHIdlSFAZJlo1X9lWcMQs-uS81'),(3,'203',1,1,1,350,0,'Опис 3','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTQyGan7QfdKjZxx-v6q-Xt3IAHIdlSFAZJlo1X9lWcMQs-uS81'),(4,'204',3,2,2,600,0,'Опис 4','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTQyGan7QfdKjZxx-v6q-Xt3IAHIdlSFAZJlo1X9lWcMQs-uS81'),(6,'205',4,3,2,650,0,'Опис 6','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTQyGan7QfdKjZxx-v6q-Xt3IAHIdlSFAZJlo1X9lWcMQs-uS81'),(7,'30150',5,3,3,7,0,'Опис 5','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTQyGan7QfdKjZxx-v6q-Xt3IAHIdlSFAZJlo1X9lWcMQs-uS81');
/*!40000 ALTER TABLE `apartments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-13 10:42:11
