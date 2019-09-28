-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Brand`
--

DROP TABLE IF EXISTS `Brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Brand` (
  `idBrand` int(11) NOT NULL AUTO_INCREMENT,
  `Supplier_dniSupplier` varchar(10) NOT NULL,
  PRIMARY KEY (`idBrand`),
  KEY `fk_Brand_Supplier` (`Supplier_dniSupplier`),
  CONSTRAINT `fk_Brand_Supplier` FOREIGN KEY (`Supplier_dniSupplier`) REFERENCES `Supplier` (`dniSupplier`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brand`
--

LOCK TABLES `Brand` WRITE;
/*!40000 ALTER TABLE `Brand` DISABLE KEYS */;
INSERT INTO `Brand` VALUES (1,'11223344E'),(2,'22222222R'),(3,'23212122E');
/*!40000 ALTER TABLE `Brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Clients` (
  `idClients` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `adress` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dateRegistration` datetime NOT NULL,
  `Clients_idClients` int(11) DEFAULT NULL,
  PRIMARY KEY (`idClients`),
  KEY `fk_Clients_Clients1` (`Clients_idClients`),
  CONSTRAINT `fk_Clients_Clients1` FOREIGN KEY (`Clients_idClients`) REFERENCES `Clients` (`idClients`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES (1,'Albert','C/ Turro, 1, 4 srt 2º','666555666','a.b@c.d','2012-03-09 00:00:00',1),(2,'Maria','C/ Casp, 1, 2on 2a','666555777','m.b@c.d','2019-01-02 00:00:00',2),(3,'Cèlia','C/ Pau Clarís, 12, 1er 1ª','677777777','c.c@c.d','2018-01-09 00:00:00',NULL);
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employs`
--

DROP TABLE IF EXISTS `Employs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Employs` (
  `idEmploys` int(11) NOT NULL,
  PRIMARY KEY (`idEmploys`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employs`
--

LOCK TABLES `Employs` WRITE;
/*!40000 ALTER TABLE `Employs` DISABLE KEYS */;
INSERT INTO `Employs` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `Employs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Glasses`
--

DROP TABLE IF EXISTS `Glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Glasses` (
  `idGlasses` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) NOT NULL,
  `graduationRight` varchar(45) NOT NULL,
  `graduationLeft` varchar(45) NOT NULL,
  `typeFrame` varchar(45) NOT NULL,
  `colourFrame` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `Brand_idBrand` int(11) NOT NULL,
  `Clients_idClients` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGlasses`),
  KEY `fk_Glasses_Brand1` (`Brand_idBrand`),
  KEY `fk_Glasses_Clients1` (`Clients_idClients`),
  CONSTRAINT `fk_Glasses_Brand1` FOREIGN KEY (`Brand_idBrand`) REFERENCES `Brand` (`idBrand`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Glasses_Clients1` FOREIGN KEY (`Clients_idClients`) REFERENCES `Clients` (`idClients`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Glasses`
--

LOCK TABLES `Glasses` WRITE;
/*!40000 ALTER TABLE `Glasses` DISABLE KEYS */;
INSERT INTO `Glasses` VALUES (1,'A','1','1.2','flotant','blau','200 euros',1,1),(2,'B','2','2,25','metàl·lica','verd','300 euros',2,NULL),(3,'C','3','4','pasta','blau','140 euros ',3,2);
/*!40000 ALTER TABLE `Glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Sales` (
  `idSales` int(11) NOT NULL AUTO_INCREMENT,
  `Clients_idClients` int(11) NOT NULL,
  `Employs_idEmploys` int(11) NOT NULL,
  PRIMARY KEY (`idSales`),
  KEY `fk_table1_Clients1` (`Clients_idClients`),
  KEY `fk_table1_Employs1` (`Employs_idEmploys`),
  CONSTRAINT `fk_table1_Clients1` FOREIGN KEY (`Clients_idClients`) REFERENCES `Clients` (`idClients`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_Employs1` FOREIGN KEY (`Employs_idEmploys`) REFERENCES `Employs` (`idEmploys`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
INSERT INTO `Sales` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Supplier` (
  `dniSupplier` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `fax` varchar(45) NOT NULL,
  PRIMARY KEY (`dniSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES ('11223344E','Pau','C/ València, nº 300, 3er 1ª','600777888','94000000000'),('22222222R','Dana','C/ Metro, nº 44,  3er 3ª','666555444','94111222111'),('23212122E','Rut','C/ Marina, nº 4, 2 on 2ª','666555777','94111222111');
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-29  0:33:35
