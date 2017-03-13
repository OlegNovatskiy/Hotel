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
-- Table structure for table `customers_autorization`
--

DROP TABLE IF EXISTS `customers_autorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_autorization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) NOT NULL,
  `birth_date` date NOT NULL,
  `pasport_number` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `region` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `district` varchar(45) DEFAULT NULL,
  `street` varchar(45) NOT NULL,
  `build_number` varchar(8) NOT NULL,
  `flat_number` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_UNIQUE` (`id`),
  UNIQUE KEY `pasport_number_UNIQUE` (`pasport_number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_autorization`
--

LOCK TABLES `customers_autorization` WRITE;
/*!40000 ALTER TABLE `customers_autorization` DISABLE KEYS */;
INSERT INTO `customers_autorization` VALUES (1,'1','1','1','1998-01-01','1','1','1','1','1','1','1','1',1,'1','1','1','2017-02-22 01:16:31','2017-02-21 23:16:31'),(2,'????','?????????','???????????','1998-01-15','??111111','1234567890','???????','???????????','????????????','????????','???????????','10/4',415,'olegnovatskiy@gmail.com','legnovatskiy','b59c67bf196a4758191e42f76670ceba','2017-02-22 15:53:50','2017-02-22 13:53:50'),(6,'Олег','1','1','1998-01-15','11','1','1','1','1','1','1','1',1,'olegnovatskiy@gmail.com','1322','c4ca4238a0b923820dcc509a6f75849b','2017-02-22 16:40:55','2017-02-22 14:40:55'),(7,'     Дзюбак','    Владислав    ','Володимирович','1998-02-02','МО456788','1234567890','     рвілиал    ','шгрісшишм','олролиі','лоилои','лоиолвил','лотлоивq',123,'olegnovatskiy@gmail.com','vlad','c4ca4238a0b923820dcc509a6f75849b','2017-02-22 16:56:18','2017-02-22 14:56:18'),(9,'     Дзюбак','    Владислав    ','Володимирович','1998-02-02','МО4567882','1234567890','     рвілиал    ','шгрісшишм','олролиі','лоилои','лоиолвил','лотлоивq',123,'olegnovatskiy@gmail.com','vlad1','54cafa3a6d69c189cf2df3978fbdd435','2017-02-22 16:58:00','2017-02-22 14:58:00'),(10,'Олег','1','1','1998-01-15','132434','1','1','1','1','1','1','1',1,'olegnovatskiy@gmail.com','112','c4ca4238a0b923820dcc509a6f75849b','2017-02-22 18:19:16','2017-02-22 16:19:16'),(11,'1','1','1','1998-01-15','11213','1','1','1','1','1','1','1',1,'olegnovatskiy@gmail.com','ole','c4ca4238a0b923820dcc509a6f75849b','2017-02-22 22:31:14','2017-02-22 20:31:14'),(12,'askdasd1','1','1','1998-01-15','11213s','1','1','1','1','1','1','1',1,'olegnovatskiy@gmail.com','ole1','c4ca4238a0b923820dcc509a6f75849b','2017-02-22 22:34:47','2017-02-22 20:34:47');
/*!40000 ALTER TABLE `customers_autorization` ENABLE KEYS */;
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
