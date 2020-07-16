-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: libmanage
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `CID` char(8) NOT NULL,
  `CNAME` varchar(20) NOT NULL,
  `CSEX` enum('男','女') NOT NULL,
  `CTEL` char(11) NOT NULL,
  `CEMAIL` varchar(45) DEFAULT NULL,
  `CPWD` varchar(16) NOT NULL,
  PRIMARY KEY (`CID`),
  UNIQUE KEY `CTEL_UNIQUE` (`CTEL`),
  CONSTRAINT `check_cid` CHECK ((length(`CID`) = 8)),
  CONSTRAINT `check_cpwd` CHECK ((length(`CPWD`) >= 6)),
  CONSTRAINT `check_ctel` CHECK ((length(`CTEL`) = 11))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('00010001','Emily','女','13312345678','emily12324@gmail.com','123456'),('00010002','Eva','女','13412345678','','123456'),('00010003','Abby','女','15312345678','','123456'),('00010004','John','女','16612345678','','123456'),('00010005','Steven','男','17612345678','123456789@qq.com','123456'),('00010006','Code','女','17712345678','','123456'),('00010007','Chair','男','19912345678','','123456'),('00010008','Work','女','18812345678','work789@163.com','123456'),('00010009','Pupu','男','15512345678','','123456'),('00010010','Lalala','女','15612345678','','123456'),('00010011','Haha','男','13112345678','hh555@outlook.com','123456'),('00010012','Heng','男','13412335678','','123456'),('00010013','阿红','女','15313345678','ahong@outlook.com','123456'),('00010014','叨叨','女','16604445678','','123456'),('00010015','小橘','女','13410045678','','123456'),('00010016','大白','男','15312245678','bigwhite@outlook.com','123456'),('00010017','花花','男','16604335678','','123456'),('00010018','梅梅','女','13440305678','mmei@163.com','123456'),('00010019','苹果','女','15317065678','apple@163.com','123456'),('00010020','沈大勇','男','16680965678','dyshen@163.com','123456');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `MID` char(4) NOT NULL,
  `MNAME` varchar(20) NOT NULL,
  `MSEX` enum('男','女') NOT NULL,
  `MTEL` char(11) NOT NULL,
  `MEMAIL` varchar(45) DEFAULT NULL,
  `MPWD` varchar(16) NOT NULL,
  PRIMARY KEY (`MID`),
  UNIQUE KEY `MTEL_UNIQUE` (`MTEL`),
  CONSTRAINT `check_id` CHECK ((length(`MID`) = 4)),
  CONSTRAINT `check_pwd` CHECK ((length(`MPWD`) >= 6)),
  CONSTRAINT `check_tel` CHECK ((length(`MTEL`) = 11))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('0101','陈思宇','女','16612341234','','111111'),('0102','曹蕾','女','16612345678','','222222'),('0103','王琦梦','女','17712341234','','333333'),('0104','刘畅','女','17712345678','','666666');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `SID` char(6) NOT NULL,
  `SFLOOR` int(2) unsigned zerofill NOT NULL,
  `SZONE` char(1) NOT NULL,
  `SNUM` int(3) unsigned zerofill NOT NULL,
  PRIMARY KEY (`SID`),
  CONSTRAINT `check_sfloor` CHECK ((`SFLOOR` > 0)),
  CONSTRAINT `check_sid` CHECK ((length(`SID`) = 6)),
  CONSTRAINT `check_sid_floor` CHECK ((substr(`SID`,1,2) = `SFLOOR`)),
  CONSTRAINT `check_sid_num` CHECK ((substr(`SID`,4,3) = `SNUM`)),
  CONSTRAINT `check_sid_zone` CHECK ((substr(`SID`,3,1) = `SZONE`)),
  CONSTRAINT `check_snum` CHECK ((`SNUM` > 0)),
  CONSTRAINT `check_szone` CHECK (((`SZONE` >= _utf8mb4'A') and (`SZONE` <= _utf8mb4'Z')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES ('01A001',01,'A',001),('01A002',01,'A',002),('01A003',01,'A',003),('01A004',01,'A',004),('01A005',01,'A',005),('01A006',01,'A',006),('01A007',01,'A',007),('01A008',01,'A',008),('01A009',01,'A',009),('01A020',01,'A',020),('01B010',01,'B',010),('01B011',01,'B',011),('01B012',01,'B',012),('01B013',01,'B',013),('01B014',01,'B',014),('01B015',01,'B',015),('01B016',01,'B',016),('01B017',01,'B',017),('01B018',01,'B',018),('01B019',01,'B',019),('02A001',02,'A',001),('02A002',02,'A',002),('02A003',02,'A',003),('02A004',02,'A',004),('02A005',02,'A',005),('02A006',02,'A',006),('02A007',02,'A',007),('02A008',02,'A',008),('02A009',02,'A',009),('02A010',02,'A',010),('02A011',02,'A',011),('02A012',02,'A',012),('02A013',02,'A',013),('02A014',02,'A',014),('02A015',02,'A',015),('02C016',02,'C',016),('02C017',02,'C',017),('02C018',02,'C',018),('02C019',02,'C',019),('02C020',02,'C',020);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seatres`
--

DROP TABLE IF EXISTS `seatres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seatres` (
  `SRID` int(11) NOT NULL AUTO_INCREMENT,
  `CID` char(8) NOT NULL,
  `SID` char(6) NOT NULL,
  `SRDATE` date NOT NULL,
  `SRBEGIN` time NOT NULL,
  `SREND` time NOT NULL,
  PRIMARY KEY (`SRID`),
  UNIQUE KEY `SID` (`SID`,`SRDATE`,`SRBEGIN`,`SREND`),
  KEY `CID_idx` (`CID`),
  KEY `SID_idx` (`SID`),
  CONSTRAINT `CID` FOREIGN KEY (`CID`) REFERENCES `clients` (`CID`),
  CONSTRAINT `SID` FOREIGN KEY (`SID`) REFERENCES `seat` (`SID`),
  CONSTRAINT `check_sr_beg_end` CHECK ((`SREND` > `SRBEGIN`)),
  CONSTRAINT `check_srbeg` CHECK ((hour(`SRBEGIN`) between 8 and 21)),
  CONSTRAINT `check_srend` CHECK ((hour(`SREND`) between 9 and 22))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seatres`
--

LOCK TABLES `seatres` WRITE;
/*!40000 ALTER TABLE `seatres` DISABLE KEYS */;
INSERT INTO `seatres` VALUES (1,'00010001','01A002','2020-03-26','09:00:00','11:00:00'),(2,'00010001','01A002','2020-03-27','09:00:00','11:00:00'),(3,'00010001','01A002','2020-03-28','09:00:00','11:00:00'),(4,'00010002','01A001','2020-03-26','13:00:00','15:00:00'),(5,'00010003','01A001','2020-03-26','15:00:00','18:00:00'),(6,'00010003','01A001','2020-03-27','08:00:00','09:00:00'),(7,'00010002','01A004','2020-03-27','09:00:00','11:00:00'),(9,'00010006','01A002','2020-03-26','21:00:00','22:00:00'),(10,'00010009','01A001','2020-03-26','09:00:00','11:00:00'),(11,'00010006','01A003','2020-05-23','09:00:00','11:00:00'),(12,'00010006','01A003','2020-05-26','09:00:00','11:00:00'),(14,'00010009','01A001','2020-10-01','09:00:00','11:00:00'),(19,'00010012','01A007','2020-03-26','09:00:00','11:00:00'),(20,'00010012','01A009','2017-03-26','10:00:00','12:00:00'),(21,'00010012','01A002','2017-06-21','09:00:00','11:00:00'),(22,'00010011','02A003','2019-03-26','09:00:00','11:00:00'),(23,'00010015','02A002','2019-03-26','09:00:00','11:00:00'),(24,'00010013','02A003','2019-03-26','13:00:00','15:00:00'),(25,'00010013','02A002','2020-03-26','09:00:00','11:00:00'),(26,'00010013','02A003','2020-11-26','09:00:00','11:00:00'),(27,'00010013','02A003','2020-11-24','09:00:00','11:00:00'),(28,'00010006','01A003','2020-05-23','13:00:00','15:00:00'),(29,'00010006','01A003','2019-06-26','09:00:00','11:00:00'),(30,'00010017','01A002','2020-02-13','09:00:00','11:00:00');
/*!40000 ALTER TABLE `seatres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-16 12:06:56
