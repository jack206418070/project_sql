-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shopmall
-- ------------------------------------------------------
-- Server version	5.7.24-log

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
-- Table structure for table `buy_list`
--

DROP TABLE IF EXISTS `buy_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buy_list` (
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`lid`),
  KEY `fk1_cid_idx` (`cid`),
  KEY `fk1_pid_idx` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_list`
--

LOCK TABLES `buy_list` WRITE;
/*!40000 ALTER TABLE `buy_list` DISABLE KEYS */;
INSERT INTO `buy_list` VALUES (1,2,'10',1),(2,3,'10',2),(3,1,'5',3);
/*!40000 ALTER TABLE `buy_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costomer`
--

DROP TABLE IF EXISTS `costomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costomer` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costomer`
--

LOCK TABLES `costomer` WRITE;
/*!40000 ALTER TABLE `costomer` DISABLE KEYS */;
INSERT INTO `costomer` VALUES (1,'張家祥','0973853620','台北市'),(2,'王小名','0912345678','台中市'),(3,'張曉華','0923456789','高雄市');
/*!40000 ALTER TABLE `costomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory`
--

DROP TABLE IF EXISTS `factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `fphone` varchar(45) NOT NULL,
  `faddress` varchar(45) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory`
--

LOCK TABLES `factory` WRITE;
/*!40000 ALTER TABLE `factory` DISABLE KEYS */;
INSERT INTO `factory` VALUES (1,'大同','27222842','台北市'),(2,'大金','27235215','台中市'),(3,'三星','22345125','高雄市');
/*!40000 ALTER TABLE `factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `pname` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk1_sid_idx` (`sid`),
  KEY `fk2_fid_idx` (`fid`),
  CONSTRAINT `fk1_sid` FOREIGN KEY (`sid`) REFERENCES `store` (`sid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk2_fid` FOREIGN KEY (`fid`) REFERENCES `factory` (`fid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'電風扇','850','30',1,2),(2,'冷氣機','25000','20',3,1),(3,'電視機','8000','15',2,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_store`
--

DROP TABLE IF EXISTS `record_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_store` (
  `fid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rid`),
  KEY `fk3_fid_idx` (`fid`),
  KEY `fk3_pid_idx` (`pid`),
  KEY `fk3_sid_idx` (`sid`),
  CONSTRAINT `fk3_fid` FOREIGN KEY (`fid`) REFERENCES `factory` (`fid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk3_pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk3_sid` FOREIGN KEY (`sid`) REFERENCES `store` (`sid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_store`
--

LOCK TABLES `record_store` WRITE;
/*!40000 ALTER TABLE `record_store` DISABLE KEYS */;
INSERT INTO `record_store` VALUES (2,1,1,'30',1),(1,2,2,'20',2),(3,3,3,'10',3);
/*!40000 ALTER TABLE `record_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(45) NOT NULL,
  `saddress` varchar(255) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'小型電器','台北市'),(2,'中型電器','台中市'),(3,'大型電器','高雄市');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-03 15:41:41
