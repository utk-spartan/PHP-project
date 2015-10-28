-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	5.1.73

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
  `pid` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`did`,`pid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attends`
--

LOCK TABLES `attends` WRITE;
/*!40000 ALTER TABLE `attends` DISABLE KEYS */;
INSERT INTO `attends` VALUES ('a1','aj2184'),('a14','s45'),('e34','s45'),('g23','s45'),('p1','am3503'),('w2','ab2105'),('w2','d12'),('x1','am3503'),('y34','h78');
/*!40000 ALTER TABLE `attends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billed_for`
--

DROP TABLE IF EXISTS `billed_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billed_for` (
  `code` varchar(10) NOT NULL DEFAULT '',
  `id` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`code`,`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billed_for`
--

LOCK TABLES `billed_for` WRITE;
/*!40000 ALTER TABLE `billed_for` DISABLE KEYS */;
INSERT INTO `billed_for` VALUES ('acet','p1'),('acet','w2'),('amo','a1'),('amo','p1'),('amo','x1'),('ator','y34'),('met','a14'),('met','e23'),('met','g23');
/*!40000 ALTER TABLE `billed_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcontact`
--

DROP TABLE IF EXISTS `dcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcontact` (
  `contact` int(11) NOT NULL DEFAULT '0',
  `did` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`contact`,`did`),
  KEY `did` (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcontact`
--

LOCK TABLES `dcontact` WRITE;
/*!40000 ALTER TABLE `dcontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `id` varchar(10) NOT NULL,
  `sex` char(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `qualification` varchar(30) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `specialization` varchar(100) NOT NULL,
  `type` varchar(15) NOT NULL,
  `consulting_room` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('aj2184','m','Dr. Abhay Jain','M.D,M.B.B.S',15,'Neuropsychiatrist','PERMANENT','F019'),('am3503','m','Dr. Abhishek Manu','M.S,M.B.B.S,FNB',15,'Spine Surgery','PERMANENT','F020'),('ab2105','f','Dr. Ankita Bansal','M.D,M.B.B.S',6,'Chest Disease','PERMANENT','F021'),('d12','f','dfghj','M.D',14,'Skin diseases','TRAINEE','F22'),('s45','m','sddfjdf','M.D,M.B.B.S',14,'Orthopaedics','TRAINEE','F24'),('h78','m','hjdff','M.B.B.S',4,'ENT,Head & Neck Surgery','VISITOR','F25');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipments`
--

DROP TABLE IF EXISTS `equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipments` (
  `price` int(11) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `patient_id` varchar(10) DEFAULT NULL,
  KEY `patient_id` (`patient_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments`
--

LOCK TABLES `equipments` WRITE;
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;
INSERT INTO `equipments` VALUES (1200,'safasf','a1'),(1200,'safasf','e34'),(2200,'ghkj','y34'),(2200,'ghkj','a14');
/*!40000 ALTER TABLE `equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `governs`
--

DROP TABLE IF EXISTS `governs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `governs` (
  `nid` varchar(10) NOT NULL DEFAULT '',
  `room_id` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`nid`,`room_id`),
  KEY `room_id` (`room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `governs`
--

LOCK TABLES `governs` WRITE;
/*!40000 ALTER TABLE `governs` DISABLE KEYS */;
INSERT INTO `governs` VALUES ('d12','s01'),('d12','s02'),('d12','s03'),('m24','s04');
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
  `record_id` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`,`record_id`),
  KEY `record_id` (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintain`
--

LOCK TABLES `maintain` WRITE;
/*!40000 ALTER TABLE `maintain` DISABLE KEYS */;
INSERT INTO `maintain` VALUES ('fht','f23'),('fht','f24'),('fht','f25'),('fht','f26'),('fht','f27'),('sare','f28'),('sare','f29'),('sare','f30');
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
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES ('acet',100,'pain reliever and a fever redu'),('amo',105,'enicillin antibiotic'),('ator',205,' anxiety disorders'),('met',505,'diabetes medicine');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ncontact`
--

DROP TABLE IF EXISTS `ncontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ncontact` (
  `contact` int(11) NOT NULL DEFAULT '0',
  `nid` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`contact`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ncontact`
--

LOCK TABLES `ncontact` WRITE;
/*!40000 ALTER TABLE `ncontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `ncontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse` (
  `id` varchar(10) NOT NULL,
  `sex` char(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `qualification` varchar(30) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES ('d12','f','asda',NULL,5),('m34','m','jhmlk',NULL,3);
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `id` varchar(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` char(1) NOT NULL,
  `address` varchar(30) NOT NULL,
  `date_of_admit` date DEFAULT NULL,
  `date_of_discharge` date DEFAULT NULL,
  `room_id` varchar(5) DEFAULT NULL,
  `bed_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abc` (`room_id`),
  KEY `x` (`bed_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('a1','ABC',24,'m','Indore','2015-10-20','2015-10-26','s01',1),('x1','xyz',56,'m','Jharkand','2006-01-02','2006-01-26','s02',1),('p1','pqrs',34,'f','Mumbai','2009-06-02','2009-06-06','s03',2),('w2','wert',45,'m','Delhi','2009-04-02','2009-04-06','s03',1),('g23','ghjk',20,'f','mhow',NULL,NULL,NULL,NULL),('a14','asdf',32,'f','silver',NULL,NULL,NULL,NULL),('e34','erty',56,'m','delhi','2009-04-02','2009-04-02',NULL,NULL),('y34','yuo',28,'m','palasia','2010-04-02','2010-04-02','s04',3);
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
  `pid` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`contact`,`pid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcontact`
--

LOCK TABLES `pcontact` WRITE;
/*!40000 ALTER TABLE `pcontact` DISABLE KEYS */;
INSERT INTO `pcontact` VALUES ('1236156890','y34'),('1236345890','x1'),('1236547890','y34'),('8233562489','p1'),('8236362489','g23'),('9236343789','a14'),('9236345670','w2'),('9236345890','x1'),('9236362489','e34');
/*!40000 ALTER TABLE `pcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rcontact`
--

DROP TABLE IF EXISTS `rcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rcontact` (
  `contact` int(11) NOT NULL DEFAULT '0',
  `rid` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`contact`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rcontact`
--

LOCK TABLES `rcontact` WRITE;
/*!40000 ALTER TABLE `rcontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `rcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receptionist` (
  `id` varchar(10) NOT NULL,
  `sex` char(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `qualification` varchar(30) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptionist`
--

LOCK TABLES `receptionist` WRITE;
/*!40000 ALTER TABLE `receptionist` DISABLE KEYS */;
INSERT INTO `receptionist` VALUES ('fht','m','daswqqE',NULL,2),('sare','m','xcnx',NULL,3);
/*!40000 ALTER TABLE `receptionist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `record_id` varchar(6) NOT NULL,
  `appointment` datetime DEFAULT NULL,
  `patient_id` varchar(10) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES ('f23','1996-02-13 07:18:42','a1'),('f24','2006-06-13 21:45:42','g23'),('f25',NULL,'p1'),('f26',NULL,'x1'),('f27',NULL,'w2'),('f28',NULL,'a14'),('f29','2004-02-13 09:18:36','e34'),('f30',NULL,'y34');
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
  `room_type` varchar(10) NOT NULL,
  `bed_no` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`room_id`,`bed_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('s01','single',1),('s02','single',1),('s03','double',1),('s03','double',2),('s04','multi',1),('s04','multi',2),('s04','multi',3),('s04','multi',4);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-29  0:04:24
