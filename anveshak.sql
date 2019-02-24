-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for anveshak
CREATE DATABASE IF NOT EXISTS `anveshak` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `anveshak`;

-- Dumping structure for table anveshak.corp_auth
CREATE TABLE IF NOT EXISTS `corp_auth` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification for corporates',
  `login_id` varchar(30) DEFAULT NULL COMMENT 'login id of corporates  ',
  `password` varchar(30) DEFAULT NULL COMMENT 'password for corporate login',
  PRIMARY KEY (`corp_id`),
  UNIQUE KEY `corp_id` (`corp_id`),
  UNIQUE KEY `login_id` (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table will be used for authorization at the time for corporate login and contains details for the same.';

-- Data exporting was unselected.
-- Dumping structure for table anveshak.corp_contact
CREATE TABLE IF NOT EXISTS `corp_contact` (
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

-- Data exporting was unselected.
-- Dumping structure for table anveshak.corp_detail
CREATE TABLE IF NOT EXISTS `corp_detail` (
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

-- Data exporting was unselected.
-- Dumping structure for table anveshak.corp_reg
CREATE TABLE IF NOT EXISTS `corp_reg` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table will save the details provided at the corporate registration time. After authenication by admin side its details will be used to create further tables. ';

-- Data exporting was unselected.
-- Dumping structure for table anveshak.corp_tech
CREATE TABLE IF NOT EXISTS `corp_tech` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporate',
  `tech_id` int(11) NOT NULL COMMENT 'unique identification of particular technology',
  PRIMARY KEY (`corp_id`),
  UNIQUE KEY `corp_id` (`corp_id`),
  KEY `FK_corp_tech_technology` (`tech_id`),
  CONSTRAINT `FK_corp_tech_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_corp_tech_technology` FOREIGN KEY (`tech_id`) REFERENCES `technology` (`tech_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table stores the technology details a particular corporate is interested in or is working on.';

-- Data exporting was unselected.
-- Dumping structure for table anveshak.corp_vertical
CREATE TABLE IF NOT EXISTS `corp_vertical` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporates',
  `vertical_id` int(11) DEFAULT NULL COMMENT 'unique identification of verticals',
  PRIMARY KEY (`corp_id`),
  UNIQUE KEY `corp_id` (`corp_id`),
  KEY `FK_corp_vertical_vertical` (`vertical_id`),
  CONSTRAINT `FK_corp_vertical_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_corp_vertical_vertical` FOREIGN KEY (`vertical_id`) REFERENCES `vertical` (`vertical_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table stores verticals a particular corporate is working on or is interested in.';

-- Data exporting was unselected.
-- Dumping structure for table anveshak.corp_vision
CREATE TABLE IF NOT EXISTS `corp_vision` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporates',
  `corp_vision_file` text COMMENT 'path of corporate vision file',
  `corp_desc` text COMMENT 'short description about corporates',
  PRIMARY KEY (`corp_id`),
  UNIQUE KEY `corp_id` (`corp_id`),
  CONSTRAINT `FK_corp_vision_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table stores vision and short description of a particular corporate. Both are optional for corporates. Description will be text stored in the DB itself. And vision will be stored in a separate file whose path will be stored in the table.';

-- Data exporting was unselected.
-- Dumping structure for table anveshak.startup_auth
CREATE TABLE IF NOT EXISTS `startup_auth` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `login_id` varchar(30) NOT NULL COMMENT 'login id of startup',
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`startup_id`),
  UNIQUE KEY `startup_id` (`startup_id`),
  UNIQUE KEY `login_id` (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table will be used for authorization at the time of startup login and contains the details for the same.';

-- Data exporting was unselected.
-- Dumping structure for table anveshak.startup_contact
CREATE TABLE IF NOT EXISTS `startup_contact` (
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

-- Data exporting was unselected.
-- Dumping structure for table anveshak.startup_corp_partner
CREATE TABLE IF NOT EXISTS `startup_corp_partner` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporate',
  PRIMARY KEY (`startup_id`),
  UNIQUE KEY `startup_id` (`startup_id`),
  KEY `FK_startup_corp_partner_corp_auth` (`corp_id`),
  CONSTRAINT `FK_startup_corp_partner_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_startup_corp_partner_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table provide details of the corporates with which a startup has worked or is presently working on.';

-- Data exporting was unselected.
-- Dumping structure for table anveshak.startup_detail
CREATE TABLE IF NOT EXISTS `startup_detail` (
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

-- Data exporting was unselected.
-- Dumping structure for table anveshak.startup_reg
CREATE TABLE IF NOT EXISTS `startup_reg` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the details provided at the time of startup registration. These details will be used for creating further tables.';

-- Data exporting was unselected.
-- Dumping structure for table anveshak.startup_tech
CREATE TABLE IF NOT EXISTS `startup_tech` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique indentification of startup',
  `tech_id` int(11) NOT NULL COMMENT 'unique identification of technology',
  PRIMARY KEY (`startup_id`),
  UNIQUE KEY `startup_id` (`startup_id`),
  KEY `FK_startup_tech_technology` (`tech_id`),
  CONSTRAINT `FK_startup_tech_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_startup_tech_technology` FOREIGN KEY (`tech_id`) REFERENCES `technology` (`tech_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table list the technologies a particular startup is working on.';

-- Data exporting was unselected.
-- Dumping structure for table anveshak.startup_verticals
CREATE TABLE IF NOT EXISTS `startup_verticals` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `vertical_id` int(11) NOT NULL COMMENT 'unique identification of verticals',
  PRIMARY KEY (`startup_id`),
  UNIQUE KEY `startup_id` (`startup_id`),
  KEY `FK_startup_verticals_vertical` (`vertical_id`),
  CONSTRAINT `FK_startup_verticals_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_startup_verticals_vertical` FOREIGN KEY (`vertical_id`) REFERENCES `vertical` (`vertical_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table list the verticals a particular startup is working on.';

-- Data exporting was unselected.
-- Dumping structure for table anveshak.startup_vision
CREATE TABLE IF NOT EXISTS `startup_vision` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `vision_file_id` text COMMENT 'path of vision file',
  `short_desc` text COMMENT 'short description text',
  `no_of_emp` int(11) DEFAULT NULL COMMENT 'number of employes ',
  PRIMARY KEY (`startup_id`),
  UNIQUE KEY `startup_id` (`startup_id`),
  CONSTRAINT `FK_startup_vision_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the details of vision and short description about the startup.  Short description will be text and vision will be stored in a file whose path will be stored in the database.';

-- Data exporting was unselected.
-- Dumping structure for table anveshak.technology
CREATE TABLE IF NOT EXISTS `technology` (
  `tech_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identification of technology',
  `tech_name` varchar(100) DEFAULT NULL COMMENT 'technology name',
  `tech_logo` text COMMENT 'path of the logo representiong technology',
  PRIMARY KEY (`tech_id`),
  UNIQUE KEY `tech_id` (`tech_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the list of various technologies. These technologies will be like big data, cloud computiong, AI etc.';

-- Data exporting was unselected.
-- Dumping structure for table anveshak.vertical
CREATE TABLE IF NOT EXISTS `vertical` (
  `vertical_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identification of vertical',
  `vertical_name` varchar(200) DEFAULT NULL COMMENT 'name of vertical',
  `vertical_logo` text COMMENT 'path of the logo of vertical',
  `vertical_desc` text COMMENT 'short description of the vertical',
  PRIMARY KEY (`vertical_id`),
  UNIQUE KEY `vertical_id` (`vertical_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table lists all the verticles. Here verticals means domains like biotechnology, e-commerce, food delivery etc.';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
