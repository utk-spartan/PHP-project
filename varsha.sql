-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `attends`
--

DROP TABLE IF EXISTS `attends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attends` (
  `did` varchar(10) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`,`did`),
  KEY `did` (`did`),
  CONSTRAINT `at` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`),
  CONSTRAINT `qw` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attends`
--

LOCK TABLES `attends` WRITE;
/*!40000 ALTER TABLE `attends` DISABLE KEYS */;
INSERT INTO `attends` VALUES ('ab2105',2),('ab2105',3),('aj2184',1),('aj2184',9),('aj2184',12),('am3503',4),('am3503',11),('am3503',12),('d12',3),('d12',5),('d12',13),('h78',6),('h78',10),('s45',5),('s45',7),('s45',8);
/*!40000 ALTER TABLE `attends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billed_for`
--

DROP TABLE IF EXISTS `billed_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billed_for` (
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  CONSTRAINT `bl` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billed_for`
--

LOCK TABLES `billed_for` WRITE;
/*!40000 ALTER TABLE `billed_for` DISABLE KEYS */;
INSERT INTO `billed_for` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(12),(13);
/*!40000 ALTER TABLE `billed_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkemployee`
--

DROP TABLE IF EXISTS `checkemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkemployee` (
  `id` varchar(10) NOT NULL,
  `userid` varchar(10) NOT NULL,
  `passward` varchar(20) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkemployee`
--

LOCK TABLES `checkemployee` WRITE;
/*!40000 ALTER TABLE `checkemployee` DISABLE KEYS */;
INSERT INTO `checkemployee` VALUES ('ab2105','abmf021','767ab'),('aj2184','ajmf019','1234aj'),('am3503','ammf020','4567am'),('b89','b89rid','b89548'),('dgf','dgfrid','dgf4364'),('d12','dmf022','78656d'),('fht','fhrid','fht1232'),('h78','hmf025','78506h'),('sare','sarerid','sare587'),('s45','smf024','375s');
/*!40000 ALTER TABLE `checkemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcontact`
--

DROP TABLE IF EXISTS `dcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcontact` (
  `contact` varchar(12) NOT NULL DEFAULT '',
  `did` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`contact`,`did`),
  KEY `did` (`did`),
  CONSTRAINT `wq` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcontact`
--

LOCK TABLES `dcontact` WRITE;
/*!40000 ALTER TABLE `dcontact` DISABLE KEYS */;
INSERT INTO `dcontact` VALUES ('9541876324','ab2105'),('9632145874','aj2184'),('9632148563','aj2184'),('7533241596','am3503'),('8563241596','am3503'),('7896512347','d12'),('8541236987','d12'),('7856999548','h78'),('8988856214','s45'),('9547862148','s45');
/*!40000 ALTER TABLE `dcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `did` varchar(10) NOT NULL DEFAULT '',
  `sex` char(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `qualification` varchar(30) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `specialization` varchar(100) NOT NULL,
  `type` varchar(15) NOT NULL,
  `consulting_room` varchar(5) NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('ab2105','f','Dr. Ankita Bansal','M.D,M.B.B.S',6,'Chest Disease','PERMANENT','F021'),('aj2184','m','Dr. Abhay Jain','M.D,M.B.B.S',15,'Neuropsychiatrist','PERMANENT','F019'),('am3503','m','Dr. Abhishek Manu','M.S,M.B.B.S,FNB',15,'Spine Surgery','PERMANENT','F020'),('d12','f','dfghj','M.D',14,'Skin diseases','TRAINEE','F22'),('h78','m','hjdff','M.B.B.S',4,'ENT,Head & Neck Surgery','VISITOR','F25'),('s45','m','sddfjdf','M.D,M.B.B.S',14,'Orthopaedics','TRAINEE','F24');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipments`
--

DROP TABLE IF EXISTS `equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipments` (
  `description` varchar(50) NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments`
--

LOCK TABLES `equipments` WRITE;
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;
INSERT INTO `equipments` VALUES ('dwhasjsdhj',600),('sdghsdsk',5000),('sgdfs',1200),('shtdy',4000);
/*!40000 ALTER TABLE `equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipments_for`
--

DROP TABLE IF EXISTS `equipments_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipments_for` (
  `description` varchar(50) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`description`,`pid`),
  KEY `e` (`pid`),
  CONSTRAINT `e` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`),
  CONSTRAINT `eq` FOREIGN KEY (`description`) REFERENCES `equipment` (`descripment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments_for`
--

LOCK TABLES `equipments_for` WRITE;
/*!40000 ALTER TABLE `equipments_for` DISABLE KEYS */;
INSERT INTO `equipments_for` VALUES ('dwhasjsdhj',2),('sgdfs',6),('sdghsdsk',13);
/*!40000 ALTER TABLE `equipments_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `governs`
--

DROP TABLE IF EXISTS `governs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `governs` (
  `nurse_id` varchar(5) NOT NULL DEFAULT '',
  `room_id` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`nurse_id`,`room_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `governs_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room2` (`room_id`),
  CONSTRAINT `x` FOREIGN KEY (`nurse_id`) REFERENCES `nurse` (`nurse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `governs`
--

LOCK TABLES `governs` WRITE;
/*!40000 ALTER TABLE `governs` DISABLE KEYS */;
INSERT INTO `governs` VALUES ('n01','s01'),('n02','s02'),('n03','s03'),('n04','s04');
/*!40000 ALTER TABLE `governs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintain`
--

DROP TABLE IF EXISTS `maintain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintain` (
  `rid` varchar(10) NOT NULL DEFAULT '',
  `rec_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rec_id`,`rid`),
  KEY `rid` (`rid`),
  CONSTRAINT `maintain_ibfk_1` FOREIGN KEY (`rec_id`) REFERENCES `record` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintain`
--

LOCK TABLES `maintain` WRITE;
/*!40000 ALTER TABLE `maintain` DISABLE KEYS */;
INSERT INTO `maintain` VALUES ('b89',7),('b89',8),('b89',9),('b89',13),('dgf',10),('dgf',11),('dgf',12),('fht',1),('fht',2),('fht',3),('sare',4),('sare',5),('sare',6);
/*!40000 ALTER TABLE `maintain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine` (
  `code` varchar(10) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES ('fyud',300,'sjywubds bdsh'),('jsdh',450,'sdhgs dshgdhs'),('shgd',500,'shdjuw dsydcshdjs'),('sjhd',600,'dgd shdg'),('wgde',900,'mnchxs sdh');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_for`
--

DROP TABLE IF EXISTS `medicine_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine_for` (
  `code` varchar(10) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`,`pid`),
  KEY `mf1` (`pid`),
  CONSTRAINT `mf` FOREIGN KEY (`code`) REFERENCES `medicine` (`code`),
  CONSTRAINT `mf1` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_for`
--

LOCK TABLES `medicine_for` WRITE;
/*!40000 ALTER TABLE `medicine_for` DISABLE KEYS */;
INSERT INTO `medicine_for` VALUES ('fyud',1),('jsdh',1),('fyud',2),('shgd',2),('sjhd',3),('wgde',3),('shgd',4),('jsdh',5),('sjhd',6),('fyud',8),('wgde',9),('jsdh',10),('fyud',11),('shgd',12),('jsdh',13);
/*!40000 ALTER TABLE `medicine_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ncontact`
--

DROP TABLE IF EXISTS `ncontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ncontact` (
  `contact` varchar(12) NOT NULL DEFAULT '',
  `nurse_id` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`contact`,`nurse_id`),
  KEY `nurse_id` (`nurse_id`),
  CONSTRAINT `ncontact_ibfk_1` FOREIGN KEY (`nurse_id`) REFERENCES `nurse` (`nurse_id`),
  CONSTRAINT `ncontact_ibfk_2` FOREIGN KEY (`nurse_id`) REFERENCES `nurse` (`nurse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ncontact`
--

LOCK TABLES `ncontact` WRITE;
/*!40000 ALTER TABLE `ncontact` DISABLE KEYS */;
INSERT INTO `ncontact` VALUES ('8866559548','n01'),('9856342516','n01'),('96874554896','n02'),('7569984572','n03'),('88477123212','n04');
/*!40000 ALTER TABLE `ncontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse` (
  `nurse_id` varchar(5) NOT NULL,
  `sex` char(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `qualification` varchar(30) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  PRIMARY KEY (`nurse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES ('n01','m','adfg jyugb',NULL,NULL),('n02','f','nbvuri wuyr',NULL,NULL),('n03','f','bcdhfg dhjsd','xdhf',6),('n04','m','uyrweu djf',NULL,5);
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `pid` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` char(1) NOT NULL,
  `address` varchar(30) NOT NULL,
  `date_of_admit` date DEFAULT NULL,
  `date_of_discharge` date DEFAULT NULL,
  `room_id` varchar(5) DEFAULT NULL,
  `bed_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'ABC',24,'m','Indore','2015-10-20','2015-10-26','s01',1),(2,'asdf',32,'f','silver',NULL,NULL,NULL,NULL),(3,'erty',56,'m','delhi','2009-04-02','2009-04-02',NULL,NULL),(4,'ghjk',20,'f','mhow',NULL,NULL,NULL,NULL),(5,'sdfaweyt',56,'m','nbuy jrgwui jsdhui','2013-06-25','2013-06-25','s02',1),(6,'surywerb',36,'m','waeyw ygr',NULL,NULL,NULL,NULL),(7,'dhdgje',56,'m','nhgfre yefgeui','1996-02-13','1996-03-01','s04',4),(8,'dsfrweuje',42,'f','sdsfun sufhe',NULL,NULL,NULL,NULL),(9,'pqrs',34,'f','Mumbai','2009-06-02','2009-06-06','s03',2),(10,'erifke',12,'f','weriuwern cyr',NULL,NULL,NULL,NULL),(11,'wert',45,'m','Delhi','2009-04-02','2009-04-06','s03',1),(12,'xyz',56,'m','Jharkand','2006-01-02','2006-01-26','s02',1),(13,'yuo',28,'m','palasia','2010-04-02','2010-04-02','s04',3);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcontact`
--

DROP TABLE IF EXISTS `pcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcontact` (
  `contact` varchar(12) NOT NULL DEFAULT '',
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`contact`),
  KEY `pc` (`pid`),
  CONSTRAINT `pc` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcontact`
--

LOCK TABLES `pcontact` WRITE;
/*!40000 ALTER TABLE `pcontact` DISABLE KEYS */;
INSERT INTO `pcontact` VALUES ('9236343789',2),('9236362489',3),('8236362489',4),('9856321455',5),('8547882456',6),('8544461455',7),('7547882456',8),('8233562489',9),('8544432456',10),('9236345670',11),('1236345890',12),('9236345890',12),('1236156890',13),('1236547890',13);
/*!40000 ALTER TABLE `pcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rcontact`
--

DROP TABLE IF EXISTS `rcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rcontact` (
  `contact` varchar(12) NOT NULL DEFAULT '',
  `rid` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`contact`,`rid`),
  KEY `rid` (`rid`),
  CONSTRAINT `rg` FOREIGN KEY (`rid`) REFERENCES `receptionist` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rcontact`
--

LOCK TABLES `rcontact` WRITE;
/*!40000 ALTER TABLE `rcontact` DISABLE KEYS */;
INSERT INTO `rcontact` VALUES ('9685475968','b89'),('7655998844','dgf'),('9996665554','fht'),('7558899664','sare'),('8885559994','sare');
/*!40000 ALTER TABLE `rcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receptionist` (
  `rid` varchar(10) NOT NULL DEFAULT '',
  `sex` char(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `qualification` varchar(30) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptionist`
--

LOCK TABLES `receptionist` WRITE;
/*!40000 ALTER TABLE `receptionist` DISABLE KEYS */;
INSERT INTO `receptionist` VALUES ('b89','m','hsgdrwey mfh','hdfts',6),('dgf','f','sdhfgweur','dgfs',2),('fht','m','daswqqE',NULL,2),('sare','m','xcnx',NULL,3);
/*!40000 ALTER TABLE `receptionist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `appointment` datetime DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `rec_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rec_id`),
  KEY `re` (`pid`),
  CONSTRAINT `re` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES ('2015-10-20 13:23:04',1,1),('2006-01-02 15:13:04',12,2),('2009-06-02 02:13:54',9,3),('2009-04-02 12:13:54',11,4),('2009-04-02 11:43:54',3,5),('2013-06-25 09:43:54',13,6),('1996-02-13 19:13:54',7,7),(NULL,4,8),(NULL,2,9),(NULL,8,10),(NULL,10,11),(NULL,6,12),('2013-06-25 12:20:13',5,13);
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` varchar(5) NOT NULL DEFAULT '',
  `bed_no` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`room_id`,`bed_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('s01',1),('s02',1),('s03',1),('s03',2),('s04',1),('s04',2),('s04',3),('s04',4);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room2`
--

DROP TABLE IF EXISTS `room2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room2` (
  `room_id` varchar(5) NOT NULL DEFAULT '',
  `room_type` varchar(10) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room2`
--

LOCK TABLES `room2` WRITE;
/*!40000 ALTER TABLE `room2` DISABLE KEYS */;
INSERT INTO `room2` VALUES ('s01','single'),('s02','single'),('s03','double'),('s04','multi');
/*!40000 ALTER TABLE `room2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-24  2:37:36
