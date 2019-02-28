-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: anveshak
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.10.2

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
-- Table structure for table `corp_auth`
--

DROP TABLE IF EXISTS `corp_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corp_auth` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification for corporates',
  `login_id` varchar(30) DEFAULT NULL COMMENT 'login id of corporates  ',
  `password` varchar(40) DEFAULT NULL COMMENT 'password for corporate login',
  `corp_name` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`corp_id`),
  UNIQUE KEY `corp_id` (`corp_id`),
  UNIQUE KEY `login_id` (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table will be used for authorization at the time for corporate login and contains details for the same.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corp_auth`
--

LOCK TABLES `corp_auth` WRITE;
/*!40000 ALTER TABLE `corp_auth` DISABLE KEYS */;
INSERT INTO `corp_auth` VALUES ('corp1234','regexp','61a70048f377799871d8c34872863825','Flipkart','2014-09-29 23:25:26',0);
/*!40000 ALTER TABLE `corp_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corp_contact`
--

DROP TABLE IF EXISTS `corp_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corp_contact` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporates',
  `website` varchar(100) DEFAULT NULL COMMENT 'website url',
  `email` varchar(100) DEFAULT NULL COMMENT 'email address',
  `mobile` varchar(20) DEFAULT NULL COMMENT 'mobile no',
  `phone` varchar(20) DEFAULT NULL COMMENT 'telephone no',
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of last update.',
  PRIMARY KEY (`corp_id`),
  UNIQUE KEY `corp_id` (`corp_id`),
  CONSTRAINT `FK_corp_contact_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This will contain all the contact informations of the corporates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corp_contact`
--

LOCK TABLES `corp_contact` WRITE;
/*!40000 ALTER TABLE `corp_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `corp_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corp_detail`
--

DROP TABLE IF EXISTS `corp_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corp_detail` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporate',
  `corp_name` varchar(200) DEFAULT NULL COMMENT 'corporate name',
  `cin_no` varchar(100) DEFAULT NULL COMMENT 'assigned by govt agency',
  `roc_reg_no` varchar(100) DEFAULT NULL COMMENT 'assigned by govt agency',
  `category` varchar(100) DEFAULT NULL COMMENT 'category of corporate(Holding, Subsidiary, Associate)',
  `incorporate_date` date DEFAULT NULL COMMENT 'date of incorporation',
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of updation',
  PRIMARY KEY (`corp_id`),
  UNIQUE KEY `corp_id` (`corp_id`),
  UNIQUE KEY `cin_no` (`cin_no`),
  UNIQUE KEY `roc_reg_no` (`roc_reg_no`),
  CONSTRAINT `FK_corp_detail_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='The basic details of the corporates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corp_detail`
--

LOCK TABLES `corp_detail` WRITE;
/*!40000 ALTER TABLE `corp_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `corp_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corp_reg`
--

DROP TABLE IF EXISTS `corp_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corp_reg` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identifier of registration request',
  `corp_name` varchar(200) NOT NULL DEFAULT '0' COMMENT 'corporate name',
  `cin_no` varchar(100) NOT NULL DEFAULT '0' COMMENT 'assigned by govt agency',
  `roc_reg_no` varchar(100) NOT NULL DEFAULT '0' COMMENT 'assigned by govt agency',
  `category` varchar(100) NOT NULL DEFAULT '0' COMMENT 'category of corporate (Holding, Subsidiary, Associate)',
  `incorporate_date` date DEFAULT NULL COMMENT 'date of incorporation',
  `website` varchar(100) NOT NULL DEFAULT '0' COMMENT 'website url',
  `email` varchar(100) NOT NULL DEFAULT '0' COMMENT 'email address',
  `phone` varchar(20) NOT NULL DEFAULT '0' COMMENT 'phone no',
  `mobile` varchar(20) NOT NULL DEFAULT '0' COMMENT 'mobile no',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'status of registration request( 0 - pending, 1 - granted, 2 - rejected)',
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timstamp for last update',
  PRIMARY KEY (`reg_id`),
  UNIQUE KEY `reg_id` (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='This table will save the details provided at the corporate registration time. After authenication by admin side its details will be used to create further tables. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corp_reg`
--

LOCK TABLES `corp_reg` WRITE;
/*!40000 ALTER TABLE `corp_reg` DISABLE KEYS */;
INSERT INTO `corp_reg` VALUES (1,'0','a','0','0','2019-02-19','a','a@gmail.com','a','a',0,'2019-02-24 18:13:00'),(2,'0','a','0','abc','2019-02-19','a','a@gmail.com','a','a',0,'2019-02-24 18:30:28');
/*!40000 ALTER TABLE `corp_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corp_tech`
--

DROP TABLE IF EXISTS `corp_tech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corp_tech` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporate',
  `tech_id` int(11) NOT NULL COMMENT 'unique identification of particular technology',
  PRIMARY KEY (`corp_id`),
  UNIQUE KEY `corp_id` (`corp_id`),
  KEY `FK_corp_tech_technology` (`tech_id`),
  CONSTRAINT `FK_corp_tech_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_corp_tech_technology` FOREIGN KEY (`tech_id`) REFERENCES `technology` (`tech_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table stores the technology details a particular corporate is interested in or is working on.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corp_tech`
--

LOCK TABLES `corp_tech` WRITE;
/*!40000 ALTER TABLE `corp_tech` DISABLE KEYS */;
/*!40000 ALTER TABLE `corp_tech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corp_vertical`
--

DROP TABLE IF EXISTS `corp_vertical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corp_vertical` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporates',
  `vertical_id` int(11) DEFAULT NULL COMMENT 'unique identification of verticals',
  PRIMARY KEY (`corp_id`),
  UNIQUE KEY `corp_id` (`corp_id`),
  KEY `FK_corp_vertical_vertical` (`vertical_id`),
  CONSTRAINT `FK_corp_vertical_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_corp_vertical_vertical` FOREIGN KEY (`vertical_id`) REFERENCES `vertical` (`vertical_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table stores verticals a particular corporate is working on or is interested in.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corp_vertical`
--

LOCK TABLES `corp_vertical` WRITE;
/*!40000 ALTER TABLE `corp_vertical` DISABLE KEYS */;
/*!40000 ALTER TABLE `corp_vertical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corp_vision`
--

DROP TABLE IF EXISTS `corp_vision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corp_vision` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporates',
  `corp_vision_file` text COMMENT 'path of corporate vision file',
  `corp_desc` text COMMENT 'short description about corporates',
  PRIMARY KEY (`corp_id`),
  UNIQUE KEY `corp_id` (`corp_id`),
  CONSTRAINT `FK_corp_vision_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table stores vision and short description of a particular corporate. Both are optional for corporates. Description will be text stored in the DB itself. And vision will be stored in a separate file whose path will be stored in the table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corp_vision`
--

LOCK TABLES `corp_vision` WRITE;
/*!40000 ALTER TABLE `corp_vision` DISABLE KEYS */;
/*!40000 ALTER TABLE `corp_vision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_logout_log`
--

DROP TABLE IF EXISTS `login_logout_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_logout_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `logged_in_time` datetime DEFAULT NULL,
  `logged_out_time` datetime DEFAULT NULL,
  `login_ip` varchar(20) NOT NULL,
  `logout_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_logout_log`
--

LOCK TABLES `login_logout_log` WRITE;
/*!40000 ALTER TABLE `login_logout_log` DISABLE KEYS */;
INSERT INTO `login_logout_log` VALUES (1,'corp1234','2019-02-26 01:54:50','2019-02-26 02:00:37','::1','::1'),(2,'corp1234','2019-02-26 02:00:37','2019-02-26 02:01:36','::1','::1'),(3,'corp1234','2019-02-26 02:01:36','2019-02-26 02:01:51','::1','::1'),(4,'corp1234','2019-02-26 02:01:51','2019-02-26 02:02:13','::1','::1'),(5,'corp1234','2019-02-26 02:02:13','2019-02-26 02:02:47','::1','::1'),(6,'corp1234','2019-02-26 02:02:47','2019-02-26 02:03:06','::1','::1'),(7,'corp1234','2019-02-26 02:03:06','2019-02-26 02:05:43','::1','::1'),(8,'corp1234','2019-02-26 02:05:43','2019-02-26 02:06:04','::1','::1'),(9,'corp1234','2019-02-26 02:06:04','2019-02-26 02:06:54','::1','::1'),(10,'corp1234','2019-02-26 02:06:54','2019-02-26 02:18:51','::1','::1'),(11,'startup1234','2019-02-26 02:18:25','2019-02-26 02:18:42','::1','::1'),(12,'startup1234','2019-02-26 02:18:42','2019-02-26 02:18:59','::1','::1'),(13,'corp1234','2019-02-26 02:18:51','2019-02-26 02:53:56','::1','::1'),(14,'startup1234','2019-02-26 02:18:59','2019-02-26 02:31:20','::1','::1'),(15,'startup1234','2019-02-26 02:31:20','2019-02-26 02:35:53','::1','::1'),(16,'startup1234','2019-02-26 02:35:53','2019-02-26 02:36:03','::1','::1'),(17,'startup1234','2019-02-26 02:36:03','2019-02-26 02:50:01','::1','::1'),(18,'startup1234','2019-02-26 02:50:33','2019-02-26 02:51:05','::1','::1'),(19,'startup1234','2019-02-26 02:51:26','2019-02-26 03:03:31','::1','::1'),(20,'corp1234','2019-02-26 02:53:56','2019-02-26 02:53:56','::1','::1'),(21,'corp1234','2019-02-26 02:54:36','2019-02-26 02:57:11','::1','::1'),(22,'corp1234','2019-02-26 02:57:11','2019-02-26 02:57:23','::1','::1'),(23,'corp1234','2019-02-26 02:57:23','2019-02-26 02:58:52','::1','::1'),(24,'corp1234','2019-02-26 02:58:52','2019-02-26 02:59:05','::1','::1'),(25,'corp1234','2019-02-26 02:59:05','2019-02-26 02:59:12','::1','::1'),(26,'corp1234','2019-02-26 02:59:13','2019-02-26 03:29:09','::1','::1'),(27,'startup1234','2019-02-26 03:03:31','2019-02-26 03:16:15','::1','::1'),(28,'startup1234','2019-02-26 03:18:08','2019-02-26 03:29:02','::1','::1'),(29,'corp1234','2019-02-26 03:29:09','2019-02-26 03:38:57','::1','::1'),(30,'startup1234','2019-02-26 03:32:43','2019-02-26 03:38:50','::1','::1'),(31,'corp1234','2019-02-26 03:38:57','2019-02-26 05:01:37','::1','::1'),(32,'startup1234','2019-02-26 05:12:32','2019-02-26 05:12:39','::1','::1'),(33,'startup1234','2019-02-26 11:14:30','2019-02-26 11:14:38','::1','::1'),(34,'startup1234','2019-02-26 11:48:17','2019-02-26 13:43:22','::1','::1');
/*!40000 ALTER TABLE `login_logout_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startup_auth`
--

DROP TABLE IF EXISTS `startup_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startup_auth` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `login_id` varchar(30) NOT NULL COMMENT 'login id of startup',
  `password` varchar(40) NOT NULL,
  `startup_name` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`startup_id`),
  UNIQUE KEY `startup_id` (`startup_id`),
  UNIQUE KEY `login_id` (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table will be used for authorization at the time of startup login and contains the details for the same.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup_auth`
--

LOCK TABLES `startup_auth` WRITE;
/*!40000 ALTER TABLE `startup_auth` DISABLE KEYS */;
INSERT INTO `startup_auth` VALUES ('startup1234','rubix','61a70048f377799871d8c34872863825','swiggy','2014-09-29 23:25:26',0);
/*!40000 ALTER TABLE `startup_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startup_contact`
--

DROP TABLE IF EXISTS `startup_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startup_contact` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `website` varchar(100) DEFAULT NULL COMMENT 'website url',
  `email` varchar(100) DEFAULT NULL COMMENT 'email address',
  `phone` varchar(30) DEFAULT NULL COMMENT 'phone no',
  `mobile` varchar(30) DEFAULT NULL COMMENT 'mobile no',
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of last update',
  PRIMARY KEY (`startup_id`),
  UNIQUE KEY `startup_id` (`startup_id`),
  CONSTRAINT `FK_startup_contact_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the contact informations of the startups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup_contact`
--

LOCK TABLES `startup_contact` WRITE;
/*!40000 ALTER TABLE `startup_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `startup_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startup_corp_partner`
--

DROP TABLE IF EXISTS `startup_corp_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startup_corp_partner` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporate',
  PRIMARY KEY (`startup_id`),
  UNIQUE KEY `startup_id` (`startup_id`),
  KEY `FK_startup_corp_partner_corp_auth` (`corp_id`),
  CONSTRAINT `FK_startup_corp_partner_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_startup_corp_partner_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table provide details of the corporates with which a startup has worked or is presently working on.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup_corp_partner`
--

LOCK TABLES `startup_corp_partner` WRITE;
/*!40000 ALTER TABLE `startup_corp_partner` DISABLE KEYS */;
/*!40000 ALTER TABLE `startup_corp_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startup_detail`
--

DROP TABLE IF EXISTS `startup_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startup_detail` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `startup_name` varchar(200) DEFAULT NULL COMMENT 'name of startup',
  `cin_no` varchar(100) DEFAULT NULL COMMENT 'assigned by govt',
  `roc_reg_no` varchar(100) DEFAULT NULL COMMENT 'assigned by govt',
  `recog_no` varchar(100) DEFAULT NULL COMMENT 'recognition number of the startup',
  `incorporate_date` date DEFAULT NULL COMMENT 'date of incorporation',
  PRIMARY KEY (`startup_id`),
  UNIQUE KEY `startup_id` (`startup_id`),
  UNIQUE KEY `cin_no` (`cin_no`),
  UNIQUE KEY `roc_reg_no` (`roc_reg_no`),
  CONSTRAINT `FK_startup_detail_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the basic details of the startup.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup_detail`
--

LOCK TABLES `startup_detail` WRITE;
/*!40000 ALTER TABLE `startup_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `startup_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startup_reg`
--

DROP TABLE IF EXISTS `startup_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startup_reg` (
  `reg_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'unique identifier of the registration request',
  `startup_name` varchar(200) NOT NULL DEFAULT '0' COMMENT 'name of startup',
  `cin_no` varchar(100) NOT NULL DEFAULT '0' COMMENT 'assigned by govt agency',
  `roc_reg_no` varchar(100) NOT NULL DEFAULT '0' COMMENT 'assigned by govt agency',
  `incorporate_date` date DEFAULT NULL COMMENT 'date of incorporation',
  `worth` varchar(100) NOT NULL DEFAULT '0' COMMENT 'in million rupees',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-pending,1-approved,2-rejected',
  `recog_no` varchar(100) NOT NULL DEFAULT '0' COMMENT 'startup recognition number',
  `website` varchar(100) NOT NULL DEFAULT '0' COMMENT 'wesite url',
  `email` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Mandatory',
  `mobile` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Mandatory',
  `phone` varchar(100) NOT NULL DEFAULT '0' COMMENT 'telephone no',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp of last update',
  PRIMARY KEY (`reg_id`),
  UNIQUE KEY `reg_id` (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='This table contains the details provided at the time of startup registration. These details will be used for creating further tables.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup_reg`
--

LOCK TABLES `startup_reg` WRITE;
/*!40000 ALTER TABLE `startup_reg` DISABLE KEYS */;
INSERT INTO `startup_reg` VALUES (1,'a','a','0','2019-02-04','a',0,'a','a','a@gmail.com','a','a','2019-02-24 18:08:36'),(2,'a','a','0','2019-02-04','a',0,'a','a','a@gmail.com','a','a','2019-02-24 18:09:19'),(3,'0','a','0','2019-02-19','a',0,'0','a','a@gmail.com','a','a','2019-02-24 18:11:21'),(4,'a','a','0','2019-02-04','a',0,'a','a','a@gmail.com','a','a','2019-02-24 18:23:17'),(5,'Zomato','456','0','2019-02-11','133',0,'wer','wer','w@g.com','123456','234','2019-02-25 23:43:28');
/*!40000 ALTER TABLE `startup_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startup_tech`
--

DROP TABLE IF EXISTS `startup_tech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startup_tech` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique indentification of startup',
  `tech_id` int(11) NOT NULL COMMENT 'unique identification of technology',
  PRIMARY KEY (`startup_id`),
  UNIQUE KEY `startup_id` (`startup_id`),
  KEY `FK_startup_tech_technology` (`tech_id`),
  CONSTRAINT `FK_startup_tech_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_startup_tech_technology` FOREIGN KEY (`tech_id`) REFERENCES `technology` (`tech_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table list the technologies a particular startup is working on.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup_tech`
--

LOCK TABLES `startup_tech` WRITE;
/*!40000 ALTER TABLE `startup_tech` DISABLE KEYS */;
/*!40000 ALTER TABLE `startup_tech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startup_verticals`
--

DROP TABLE IF EXISTS `startup_verticals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startup_verticals` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `vertical_id` int(11) NOT NULL COMMENT 'unique identification of verticals',
  PRIMARY KEY (`startup_id`),
  UNIQUE KEY `startup_id` (`startup_id`),
  KEY `FK_startup_verticals_vertical` (`vertical_id`),
  CONSTRAINT `FK_startup_verticals_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_startup_verticals_vertical` FOREIGN KEY (`vertical_id`) REFERENCES `vertical` (`vertical_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table list the verticals a particular startup is working on.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup_verticals`
--

LOCK TABLES `startup_verticals` WRITE;
/*!40000 ALTER TABLE `startup_verticals` DISABLE KEYS */;
/*!40000 ALTER TABLE `startup_verticals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startup_vision`
--

DROP TABLE IF EXISTS `startup_vision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startup_vision` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `vision_file_id` text COMMENT 'path of vision file',
  `short_desc` text COMMENT 'short description text',
  `no_of_emp` int(11) DEFAULT NULL COMMENT 'number of employes ',
  PRIMARY KEY (`startup_id`),
  UNIQUE KEY `startup_id` (`startup_id`),
  CONSTRAINT `FK_startup_vision_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the details of vision and short description about the startup.  Short description will be text and vision will be stored in a file whose path will be stored in the database.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup_vision`
--

LOCK TABLES `startup_vision` WRITE;
/*!40000 ALTER TABLE `startup_vision` DISABLE KEYS */;
/*!40000 ALTER TABLE `startup_vision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology`
--

DROP TABLE IF EXISTS `technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology` (
  `tech_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identification of technology',
  `tech_name` varchar(100) DEFAULT NULL COMMENT 'technology name',
  `tech_logo` text COMMENT 'path of the logo representiong technology',
  PRIMARY KEY (`tech_id`),
  UNIQUE KEY `tech_id` (`tech_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the list of various technologies. These technologies will be like big data, cloud computiong, AI etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology`
--

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_attempts`
--

DROP TABLE IF EXISTS `user_login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_attempts` (
  `id` varchar(11) NOT NULL,
  `time` datetime NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_attempts`
--

LOCK TABLES `user_login_attempts` WRITE;
/*!40000 ALTER TABLE `user_login_attempts` DISABLE KEYS */;
INSERT INTO `user_login_attempts` VALUES ('corp1234','2019-02-26 01:46:51',NULL,'success','::1'),('corp1234','2019-02-26 01:49:38',NULL,'success','::1'),('corp1234','2019-02-26 01:49:55',NULL,'success','::1'),('corp1234','2019-02-26 01:50:14',NULL,'success','::1'),('corp1234','2019-02-26 01:54:50',NULL,'success','::1'),('corp1234','2019-02-26 02:00:36',NULL,'success','::1'),('corp1234','2019-02-26 02:01:35',NULL,'success','::1'),('corp1234','2019-02-26 02:01:51',NULL,'success','::1'),('corp1234','2019-02-26 02:02:12',NULL,'success','::1'),('corp1234','2019-02-26 02:02:47',NULL,'success','::1'),('corp1234','2019-02-26 02:03:06',NULL,'success','::1'),('corp1234','2019-02-26 02:05:43',NULL,'success','::1'),('corp1234','2019-02-26 02:06:04',NULL,'success','::1'),('corp1234','2019-02-26 02:06:54',NULL,'success','::1'),('startup1234','2019-02-26 02:18:25',NULL,'success','::1'),('startup1234','2019-02-26 02:18:42',NULL,'success','::1'),('corp1234','2019-02-26 02:18:51',NULL,'success','::1'),('startup1234','2019-02-26 02:18:59',NULL,'success','::1'),('startup1234','2019-02-26 02:31:20',NULL,'success','::1'),('startup1234','2019-02-26 02:35:53',NULL,'success','::1'),('startup1234','2019-02-26 02:36:03',NULL,'success','::1'),('startup1234','2019-02-26 02:50:33',NULL,'success','::1'),('startup1234','2019-02-26 02:51:26',NULL,'success','::1'),('corp1234','2019-02-26 02:53:56',NULL,'success','::1'),('corp1234','2019-02-26 02:54:36',NULL,'success','::1'),('corp1234','2019-02-26 02:57:11',NULL,'success','::1'),('corp1234','2019-02-26 02:57:23',NULL,'success','::1'),('corp1234','2019-02-26 02:58:52',NULL,'success','::1'),('corp1234','2019-02-26 02:59:04',NULL,'success','::1'),('corp1234','2019-02-26 02:59:12',NULL,'success','::1'),('startup1234','2019-02-26 03:03:31',NULL,'success','::1'),('startup1234','2019-02-26 03:18:08',NULL,'success','::1'),('corp1234','2019-02-26 03:29:09',NULL,'success','::1'),('startup1234','2019-02-26 03:32:43',NULL,'success','::1'),('corp1234','2019-02-26 03:38:56',NULL,'success','::1'),('startup1234','2019-02-26 05:12:32',NULL,'success','::1'),('startup1234','2019-02-26 11:14:30',NULL,'success','::1'),('startup1234','2019-02-26 11:48:17',NULL,'success','::1');
/*!40000 ALTER TABLE `user_login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertical`
--

DROP TABLE IF EXISTS `vertical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vertical` (
  `vertical_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identification of vertical',
  `vertical_name` varchar(200) DEFAULT NULL COMMENT 'name of vertical',
  `vertical_logo` text COMMENT 'path of the logo of vertical',
  `vertical_desc` text COMMENT 'short description of the vertical',
  PRIMARY KEY (`vertical_id`),
  UNIQUE KEY `vertical_id` (`vertical_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table lists all the verticles. Here verticals means domains like biotechnology, e-commerce, food delivery etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertical`
--

LOCK TABLES `vertical` WRITE;
/*!40000 ALTER TABLE `vertical` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertical` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-26 13:55:20
