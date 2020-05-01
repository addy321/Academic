/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.27 : Database - academic
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`academic` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `academic`;

/*Table structure for table `achievement` */

DROP TABLE IF EXISTS `achievement`;

CREATE TABLE `achievement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `subject` varchar(25) NOT NULL,
  `fraction` int(2) NOT NULL,
  `studentid` int(10) NOT NULL,
  `EntryTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `achievement` */

insert  into `achievement`(`id`,`subject`,`fraction`,`studentid`,`EntryTime`) values (1,'数学',100,1,'2020-04-05 14:10:57'),(2,'语文',90,1,'2020-04-05 19:19:56'),(3,'语文',50,2,'2020-04-05 21:37:28'),(4,'数学',2222,2,'2020-04-07 13:17:33'),(5,'C#',111,1,'2020-04-07 13:34:54'),(6,'C#',1000,1,'2020-04-30 19:39:44');

/*Table structure for table `announcement` */

DROP TABLE IF EXISTS `announcement`;

CREATE TABLE `announcement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `releaseTime` datetime NOT NULL,
  `title` varchar(30) NOT NULL,
  `frequency` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `announcement` */

insert  into `announcement`(`id`,`content`,`releaseTime`,`title`,`frequency`) values (1,'心情澎湃','2020-03-31 16:46:16','第一次发布',0),(2,'2+2=?','2020-03-31 18:58:08','第二次发布',0),(3,'3+a','2020-03-31 18:58:18','第3次发布',0),(4,'dadsada','2020-03-31 18:58:25','第4次发布',0),(5,'dasdad','2020-03-31 18:58:31','第5次发布',0),(6,'-1顶起顶起大撒','2020-03-31 00:00:00','测试1',0),(7,'大撒大撒大','2020-03-31 00:00:00','测试2',0),(8,'dasdaa','2020-03-31 00:00:00','测试3',0),(9,'dsadsaasdada','2020-03-31 00:00:00','dasda',0),(10,'dasdsad','2020-03-31 00:00:00','qdqwdwq',0),(11,'加油加油加油','2020-04-05 00:00:00','准备高考',0),(12,'dadadadada','2020-04-05 00:00:00','dadad',0),(13,'今天心情么么哒','2020-04-30 00:00:00','测试公告',0);

/*Table structure for table `answer` */

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `questionid` int(10) NOT NULL,
  `answertime` datetime NOT NULL,
  `teacherName` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `answer` */

insert  into `answer`(`id`,`content`,`questionid`,`answertime`,`teacherName`) values (1,'等于三',2,'2020-04-05 00:22:07','峡谷蔡文姬'),(2,'等于六',1,'2020-04-05 12:01:21','峡谷蔡文姬'),(3,'好像等于七',1,'2020-04-05 12:02:46','峡谷蔡文姬'),(4,'等于九吧',1,'2020-04-05 12:03:00','峡谷蔡文姬'),(5,'等于十应该',1,'2020-04-05 12:04:04','峡谷蔡文姬'),(6,'等于二十吧',1,'2020-04-05 12:04:42','峡谷蔡文姬'),(7,'六月一号',3,'2020-04-05 12:06:19','峡谷蔡文姬'),(8,'跑',4,'2020-04-05 21:54:51','峡谷蔡文姬'),(9,'等于六',2,'2020-04-05 23:38:06','峡谷蔡文姬'),(10,'大大苏打大',2,'2020-04-05 23:40:40','王小二'),(11,'大撒旦',1,'2020-04-05 23:40:46','王小二'),(12,'快点跑',4,'2020-04-30 19:40:17','王小二'),(13,'等于十',5,'2020-04-30 19:40:26','王小二');

/*Table structure for table `classroom` */

DROP TABLE IF EXISTS `classroom`;

CREATE TABLE `classroom` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `className` varchar(25) NOT NULL,
  `status` int(2) NOT NULL,
  `Types` int(2) NOT NULL,
  `size` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `classroom` */

insert  into `classroom`(`id`,`className`,`status`,`Types`,`size`) values (1,'C123q',1,0,0),(3,'C4345q',1,0,0),(4,'Cqdqq1',1,0,0),(5,'Cdqwq',1,0,0),(6,'C3431',1,0,0),(7,'Cdafq1',1,0,0),(8,'cd12',1,0,0),(9,'dasda',0,0,0),(10,'dasdada',1,0,0),(11,'Cdsada',0,0,0),(12,'Casda',0,0,1),(13,'Csdada',0,0,0);

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Uploadtime` datetime NOT NULL,
  `courseName` varchar(50) NOT NULL,
  `courseStatus` int(2) NOT NULL,
  `classroomId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`id`,`Uploadtime`,`courseName`,`courseStatus`,`classroomId`) values (9,'2020-04-02 20:45:23','数据来结构讲解',1,'C123q'),(10,'2020-04-03 15:22:34','SSM框架整合',1,'Cqdqq1'),(11,'2020-04-03 15:23:08','微服务分布式',1,'C4345q'),(12,'2020-04-05 19:21:06','C语言教程',1,'Cdafq1'),(13,'2020-04-05 21:35:52','语文',1,'C3431'),(14,'2020-04-09 19:14:42','1asfaf',1,'Cdqwq'),(15,'2020-04-09 19:14:49','dadsad',1,'cd12'),(16,'2020-04-30 19:38:12','数学',1,'dasdada');

/*Table structure for table `curriculum` */

DROP TABLE IF EXISTS `curriculum`;

CREATE TABLE `curriculum` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `courseId` int(10) NOT NULL,
  `classTime` datetime NOT NULL,
  `teacherId` varchar(20) NOT NULL,
  `studentIds` varchar(255) NOT NULL,
  `teachername` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `curriculum` */

insert  into `curriculum`(`id`,`courseId`,`classTime`,`teacherId`,`studentIds`,`teachername`) values (7,11,'2020-01-01 00:00:00','test1','[]',''),(8,10,'2020-02-02 00:00:00','test1','[]',''),(9,9,'2020-02-02 00:00:00','test3','[]',''),(10,12,'2020-02-03 00:00:00','test1','[1]','峡谷蔡文姬'),(11,13,'2020-02-01 00:00:00','test3','[]','峡谷蔡文姬'),(12,15,'2020-02-02 00:00:00','test1','[]','王小二'),(13,15,'2020-02-02 17:55:29','test1','[]','王小二'),(14,14,'2020-04-11 10:53:05','test1','[]','王小二'),(15,16,'2020-02-02 00:00:00','test1','[1]','王小二');

/*Table structure for table `mustbedone` */

DROP TABLE IF EXISTS `mustbedone`;

CREATE TABLE `mustbedone` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(30) NOT NULL,
  `classroomId` varchar(30) NOT NULL,
  `classTime` datetime NOT NULL,
  `teacherId` varchar(30) NOT NULL,
  `grade` int(1) NOT NULL,
  `className` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mustbedone` */

/*Table structure for table `office` */

DROP TABLE IF EXISTS `office`;

CREATE TABLE `office` (
  `officeId` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  PRIMARY KEY (`officeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `office` */

insert  into `office`(`officeId`,`password`) values ('test1','1234');

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `studentId` varchar(20) NOT NULL,
  `problem` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `question` */

insert  into `question`(`id`,`studentId`,`problem`,`time`) values (1,'test2','1+1+1等于几？','2020-03-30 16:29:47'),(2,'test3','1+1到底等于几？','2020-03-30 16:31:44'),(3,'test2','学校多久放假','2020-04-05 12:05:28'),(4,'test2','嫖娼被抓怎么办？','2020-04-05 21:38:08'),(5,'test3','三加四是不是等于九？','2020-04-05 21:52:18'),(6,'test2','三生三世十里桃花','2020-04-05 21:53:57'),(7,'1','1+1=2？','2020-04-30 19:41:45'),(8,'test2','测试','2020-04-30 23:29:19');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `studentID` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(10) NOT NULL,
  `gender` int(2) NOT NULL,
  `grade` int(1) NOT NULL,
  `classname` varchar(10) NOT NULL,
  PRIMARY KEY (`id`,`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`studentID`,`password`,`name`,`gender`,`grade`,`classname`) values (1,'test2','1234','菜前坤',0,2,'C1vhjb'),(2,'test3','1234','峡谷蔡文姬',1,2,'C1231q');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `teacherID` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(10) NOT NULL,
  `gender` int(1) NOT NULL,
  `age` int(3) NOT NULL,
  `grade` int(1) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `courseName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`,`teacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`teacherID`,`password`,`name`,`gender`,`age`,`grade`,`phone`,`courseName`) values (1,'test3','1234','英雄王二小',1,20,2,'19976618070','Java'),(2,'test1','1234','王小二',0,12,2,'19976618070','C#');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
