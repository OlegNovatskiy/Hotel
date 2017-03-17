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
  `image` varchar(250) DEFAULT 'empty_photo.jpg',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `number_UNIQUE` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartments`
--

LOCK TABLES `apartments` WRITE;
/*!40000 ALTER TABLE `apartments` DISABLE KEYS */;
INSERT INTO `apartments` VALUES (1,'201',2,1,1,400,0,'Опис 1 ','fc3daa16-99bc-4bf1-82e5-381640209512.jpg'),(2,'202',2,2,1,550,0,'Опис 2','1633f1d3-8037-4b51-89d8-9817fc65044b.jpg'),(3,'203',1,1,1,350,0,'Опис 3','e66c2737-7ab9-410b-99f5-f3f1d2b0ba41.jpeg'),(4,'204',3,2,2,600,0,'Опис 4','c0347dae-019f-4d3a-929e-5517080335c3.jpg'),(6,'205',4,3,2,650,0,'Опис 6','6b294cbd-90ec-482e-bfb8-086dbc472c50.jpg'),(7,'30150',5,3,3,7,0,'Опис 5','0080f4b3-d8e7-4d8c-b4bf-5931c4b8ebda.bmp'),(8,'301',3,2,2,600,0,'опис для кімнати № 301','8c582600-12b3-4fd0-846a-12bb23560702.jpg');
/*!40000 ALTER TABLE `apartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apartments_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (18,1,8),(19,1,3),(20,1,6),(21,1,7),(22,2,3),(23,2,7),(24,2,5),(25,2,4),(26,2,8),(27,3,3),(28,3,7),(29,3,5),(30,4,3),(31,4,6),(32,4,7),(33,4,8),(34,6,3),(35,6,7),(36,6,5),(37,6,4),(38,6,8),(39,7,3),(40,7,6),(41,7,7),(42,7,5),(43,7,4),(44,7,8),(45,8,3),(46,8,7),(47,8,4),(48,9,6),(49,9,7),(50,9,5),(51,9,8),(52,10,3),(53,10,7),(54,10,4),(55,11,3),(56,12,6),(57,12,7),(58,12,5);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes_type`
--

DROP TABLE IF EXISTS `attributes_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `type` enum('BOOL','STRING','INTEGER') DEFAULT NULL,
  `endlish_title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes_type`
--

LOCK TABLES `attributes_type` WRITE;
/*!40000 ALTER TABLE `attributes_type` DISABLE KEYS */;
INSERT INTO `attributes_type` VALUES (3,'Wi-Fi','BOOL','wifi'),(4,'Кондиціонер','BOOL','condition'),(5,'Душ','BOOL','wash'),(6,'Вана','BOOL','bath'),(7,'Гаряча вода','BOOL','hot_water'),(8,'Кухня',NULL,'kitchen');
/*!40000 ALTER TABLE `attributes_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_informations`
--

DROP TABLE IF EXISTS `contact_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(250) NOT NULL,
  `phones` varchar(200) NOT NULL,
  `emails` varchar(250) NOT NULL,
  `global_information` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_informations`
--

LOCK TABLES `contact_informations` WRITE;
/*!40000 ALTER TABLE `contact_informations` DISABLE KEYS */;
INSERT INTO `contact_informations` VALUES (1,'Хмельницька область11/Шепетівський район/Село Чотирбоки11/Вулиця Карла Маркса/Будинок №34','+380978799563/+380632544889/+380922888274','olegnovatskyi@gmail.com/olegnovatskyi@ukr.net/vladzarovniy@gmail.com','<h1 style=\"text-align:center\"><strong><em><span style=\"font-size:36px\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"background-color:#ffffff\">Готель керпач1</span></span></span></em></strong></h1>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:18px\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"background-color:#ffffff\">Чотирьохзірковий Готель Україна розташований у серці Києва &ndash; на Майдані Незалежності. Це унікальне місце, де перетинаються культурне, політичне та розважальне життя української столиці. Неподалік розташовані найвідоміші київські театри, Секретаріат Президента України, Верховна Рада, Кабінет Міністрів, Національний банк, мерія, головпоштамт, нічні клуби та великі торговельні центри.</span></span></span></p>\r\n\r\n<h2 style=\"text-align:justify\"><span style=\"font-size:18px\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"background-color:#ffffff\">Опис</span></span></span></h2>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:18px\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"background-color:#ffffff\">З повним правом, готель Україна можна назвати першим &laquo;хмарочосом&raquo; Києва. У нього непроста, проте цікава історія. Більше ста років тому, у киян тільки й розмов було про найвищий у місті славнозвісний &laquo;будинок Гінзбурга&raquo;. Саме на його місці, аби підкреслити казковий природний ландшафт Києва, одразу після війни побудували висотний готель. Його будівля ніби &laquo;коронує&raquo; головну площу </span><cite><span style=\"background-color:#ffffff\">столиці України. З вікон просторих і затиш</span></cite><span style=\"background-color:#ffffff\">них номерів можна спостерігати за святковими концертами та парадами на Майдані Незалежності, динамічною панорамоюfdfds Хрещатика, пам,яткою сивої давнини Старокиївською горою. Перед вашими очима постануть перлина української духовності Софія Київська та величний</span></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:18px\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"background-color:#ffffff\">Михайлівський собор.</span></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:18px\"><span style=\"font-family:Times New Roman,Times,serif\"><img alt=\"щр\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/13_Prospekt_Svobody,_Lviv_(03).jpg/1200px-13_Prospekt_Svobody,_Lviv_(03).jpg\" style=\"height:479px; width:500px\" /></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:18px\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"background-color:#ffffff\">Готель &quot;Україна&quot; гостинно приймав чимало знаних гостей, серед яких: впливові політики, дипломати, відомі актори, видатні художники і спортсмени. Повертатися у наш готель - добра традиція, бо тут завжди раді гостям. До нас легко дістатися з будь-якої точки міста, і навпаки. Тож, якщо Ви маєте бажання ближче познайомитися зі столицею або ж запланували ділову зустріч в іншій частині міста, доїхати можна досить швидко будь-яким зручним для Вас транспортом.</span></span></span></p>\r\n');
/*!40000 ALTER TABLE `contact_informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `passport` varchar(8) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `build_number` varchar(45) DEFAULT NULL,
  `flat_number` int(11) DEFAULT NULL,
  `passport_number` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`,`phone_number`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `passport_UNIQUE` (`passport`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Новацький','Олег','Валерійович','olegnovatskiy@gmail.com','+38000000000','1998-01-15','cd4444','Україна','Хмельницька область','Хмельницький','Центр','Камянецька ','50',1,'yr1333'),(2,'Ліповуз ','Вадим','Вікторович','vadik@gmail.com','+38000000001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `use_apartments`
--

DROP TABLE IF EXISTS `use_apartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `use_apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apartment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `begin_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `status` enum('BOOKING','LIVING') NOT NULL,
  `date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `use_apartments`
--

LOCK TABLES `use_apartments` WRITE;
/*!40000 ALTER TABLE `use_apartments` DISABLE KEYS */;
INSERT INTO `use_apartments` VALUES (1,8,1,'2016-01-10','2019-01-01','BOOKING','2017-03-14 13:41:59'),(2,6,2,'2016-01-10','2016-01-19','BOOKING','2017-03-17 00:58:44');
/*!40000 ALTER TABLE `use_apartments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-17 11:22:26
