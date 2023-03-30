/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.31 : Database - smart_policing
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smart_policing` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `smart_policing`;

/*Table structure for table `case` */

DROP TABLE IF EXISTS `case`;

CREATE TABLE `case` (
  `case_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `case` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `case` */

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `offrid` int DEFAULT NULL,
  `message` varchar(300) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chat` */

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `comp_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `offrid` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `complaint` varchar(500) NOT NULL,
  `reply` varchar(500) NOT NULL,
  PRIMARY KEY (`comp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `complaint` */

/*Table structure for table `daily_reports` */

DROP TABLE IF EXISTS `daily_reports`;

CREATE TABLE `daily_reports` (
  `dlyrp_id` int NOT NULL AUTO_INCREMENT,
  `work_id` int DEFAULT NULL,
  `Report` varchar(300) NOT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`dlyrp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `daily_reports` */

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `fbid` int NOT NULL AUTO_INCREMENT,
  `offrid` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `Feedback` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`fbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `feedback` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `login` */

/*Table structure for table `officer` */

DROP TABLE IF EXISTS `officer`;

CREATE TABLE `officer` (
  `offrid` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(25) NOT NULL,
  `position` varchar(30) NOT NULL,
  `department` varchar(50) NOT NULL,
  `station` varchar(50) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`offrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `officer` */

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `offrid` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `reason` varchar(300) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `report` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `log_id` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `place` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

/*Table structure for table `work` */

DROP TABLE IF EXISTS `work`;

CREATE TABLE `work` (
  `work_id` int NOT NULL AUTO_INCREMENT,
  `offrid` int DEFAULT NULL,
  `case_id` int DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `work` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
