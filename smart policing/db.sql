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
  `date_and_time` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `case` */

insert  into `case`(`case_id`,`user_id`,`case`,`date_and_time`,`description`) values 
(1,11,'robbery','2023-03-17','a person forcefully stealed mobilephone of an old lady from manajira bipass'),
(2,11,'robbery','2023-03-17','a person forcefully stealed mobilephone of an old lady from manajira bipass'),
(3,12,'huyg','2023-03-17','gdrrt jhguy jhyguy'),
(4,12,'drug trade','2023-03-17','illegal drug trade was founded on kuttipuram'),
(5,14,'kidnapping','2023-03-17','a 2 year old child where kidnapped at kollam railway station'),
(6,14,'rd','2023-03-17 12:31:26','trdt\r\n'),
(7,13,'attempt to commit murder','2023-03-24 23:35:18','a lady attempt to commit murder her husband and her child'),
(8,13,'cheatings','2023-03-24 23:37:25','a lady where cheated by her relatives'),
(9,13,'fgfht oj nhgdf ','2023-03-25 12:53:04','fdsh 54 hgfjyfhhg');

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
  `date` varchar(50) DEFAULT NULL,
  `complaint` varchar(500) NOT NULL,
  `reply` varchar(500) NOT NULL,
  PRIMARY KEY (`comp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `complaint` */

insert  into `complaint`(`comp_id`,`user_id`,`offrid`,`date`,`complaint`,`reply`) values 
(1,13,8,'2023-03-24','no reports','pending'),
(2,13,7,'2023-03-25 23:47:57','no responses yet','pending');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `feedback` */

insert  into `feedback`(`fbid`,`offrid`,`userid`,`Feedback`,`date`) values 
(1,8,13,'detailed reports are not given yet','2023-03-24'),
(2,7,13,'investigation time exceeds','2023-03-24'),
(3,28,13,'detailed reports are not give','2023-03-24');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `login` */

insert  into `login`(`log_id`,`Username`,`Password`,`Type`) values 
(1,'admin','123','admin'),
(2,'user','456','user'),
(4,'','','officer'),
(5,'','','officer'),
(6,'','','officer'),
(7,'officer','789','blocked'),
(11,'varun','varun23','user'),
(13,'gopi','gopi23','user'),
(18,'','','officer'),
(19,'','','officer'),
(23,'54swrt','43s64rt','officer'),
(24,'54swrt','43s64rt','officer'),
(28,'kiran','kiran123','officer'),
(29,'ram','ram123','officer'),
(30,'dh','dh','officer');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `officer` */

insert  into `officer`(`offrid`,`user_id`,`name`,`age`,`gender`,`position`,`department`,`station`,`email`,`phone`) values 
(1,7,'Meena Nair T.k',45,'female','palakkad','thrikkanapuram','kuttipuram','meenu@gmail.com',7025719147),
(12,28,'Kiran.v',35,'male','ig','executive','vadakara','kiran@gmail.com',9876543259),
(13,29,'Ram.v',54,'male','dgp','local','kallai','ram@gmail.com',986754321),
(14,30,'dhhhyj',45,'male','fg','executive','hg','hg@gmail.com',987656788);

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `offrid` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `reason` varchar(300) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `report` */

insert  into `report`(`report_id`,`offrid`,`user_id`,`reason`,`date`) values 
(1,28,11,'no responce','2023-03-25'),
(2,28,13,'no responce yet','2023-03-25');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `log_id` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pin` int DEFAULT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`user_id`,`log_id`,`name`,`place`,`post`,`pin`,`gender`,`age`,`email`,`phone`) values 
(1,11,'varun','palakkad','angadi',679552,'radiobutton',32,'varun@gmail.com',9562902017),
(3,13,'gopi','trissur','trissur',679883,'Male',47,'gopi@gmail.com',9847166162);

/*Table structure for table `work` */

DROP TABLE IF EXISTS `work`;

CREATE TABLE `work` (
  `work_id` int NOT NULL AUTO_INCREMENT,
  `offrid` int DEFAULT NULL,
  `case_id` int DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `work` */

insert  into `work`(`work_id`,`offrid`,`case_id`,`status`,`date`) values 
(1,7,1,'pending','2023-03-18'),
(2,8,3,'pending','2023-03-17'),
(3,7,7,'pending','2023-03-17');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
