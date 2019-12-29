/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 5.5.27 : Database - mysqldb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test`;

/*Table structure for table `t_department` */

DROP TABLE IF EXISTS `t_department`;

CREATE TABLE `t_department` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`did`),
  UNIQUE KEY `dname` (`dname`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `t_department` */

insert  into `t_department`(`did`,`dname`,`description`) values (1,'教学部','负责教学工作'),(2,'咨询部','负责咨询工作'),(3,'运营部','负责运营工作'),(4,'财务部','负责财务工作'),(5,'后勤部','负责后勤工作');

/*Table structure for table `t_employee` */

DROP TABLE IF EXISTS `t_employee`;

CREATE TABLE `t_employee` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(20) NOT NULL,
  `tel` char(11) NOT NULL,
  `gender` char(1) DEFAULT '男',
  `salary` double DEFAULT NULL,
  `commission_pct` double DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `native_place` varchar(10) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `t_employee` */

insert  into `t_employee`(`eid`,`ename`,`tel`,`gender`,`salary`,`commission_pct`,`birthday`,`hiredate`,`job_id`,`email`,`mid`,`address`,`native_place`,`did`) values (1,'孙红雷','13789098765','男',8000.46,0.4,'1980-10-08','2011-07-28',2,'shl@atguigu.com',7,'白庙村西街','浙江',1),(2,'何炅','13456732145','男',7000.67,0.32,'1984-08-03','2015-07-03',2,'hj@atguigu.com',7,'半截塔存','河北',1),(3,'邓超','18678973456','男',8000,NULL,'1985-04-09','2014-07-01',2,'dc@atguigu.com',7,'宏福苑','陕西',1),(4,'黄晓明','13609876789','男',9456,0.12,'1986-09-07','2015-08-08',11,'hxm@atguigu.com',22,'白庙村东街','黑龙江',3),(5,'陈赫','13409876545','男',8567,0.23,'1978-08-02','2015-01-01',2,'ch@atguigu.com',7,'回龙观','吉林',1),(6,'韩庚','18945678986','男',12000,0.24,'1985-04-03','2015-02-02',2,'hg@atguigu.com',7,'龙泽','内蒙古',1),(7,'贾乃亮','15490876789','男',15700,0.14,'1982-08-02','2015-03-03',1,'jnl@atguigu.com',7,'霍营','新疆',1),(8,'李晨','13587689098','男',9000,0.15,'1983-03-02','2015-01-06',3,'lc@atguigu.com',7,'东三旗','西藏',1),(9,'李易峰','13467676789','男',7897,NULL,'1984-09-01','2015-04-01',2,'lyf@atguigu.com',7,'西山旗','天津',1),(10,'鹿晗','13689876789','男',8789,NULL,'1989-04-02','2014-09-03',2,'lh@atguigu.com',7,'天通苑一区','江苏',1),(11,'黄渤','13787876565','男',15678,NULL,'1983-05-07','2014-04-04',2,'hb@atguigu.com',7,'立水桥','安徽',1),(12,'范冰冰','13576234554','女',8909,NULL,'1986-04-02','2014-02-08',2,'fbb@atguigu.com',7,'立城苑','贵州',1),(13,'李冰冰','13790909887','女',18760,NULL,'1987-04-09','2015-06-07',2,'lbb@atguigu.com',7,'王府温馨公寓','四川',1),(14,'谢娜','13234543245','女',18978,NULL,'1990-01-01','2015-09-05',4,'xn@atguigu.com',14,'园中园','成都',2),(15,'董洁','13876544333','女',8978,NULL,'1987-05-05','2015-08-04',5,'dj@atguigu.com',14,'小辛庄','云南',2),(16,'汤唯','18264578930','女',9878,NULL,'1988-03-06','2015-03-06',5,'tw@atguigu.com',14,'西二旗','宁夏',2),(17,'李诗诗','18567899098','女',9000,NULL,'1990-08-09','2013-06-09',5,'lss@atguigu.com',14,'清河','河南',2),(18,'舒淇','18654565634','女',16788,NULL,'1978-09-04','2013-04-05',6,'sq@atguigu.com',18,'名流花园','福建',4),(19,'周迅','13589893434','女',7876,NULL,'1988-06-13','2014-04-07',7,'sq@atguigu.com',18,'小汤山','广西',4),(20,'章子怡','15634238979','女',15099,NULL,'1989-12-11','2015-08-04',8,'zzy@atguigu.com',20,'望都家园','广东',5),(21,'白百何','18909876789','女',9787,NULL,'1989-09-04','2014-06-05',9,'bbh@atguigu.com',20,'西湖新村','海南',5),(22,'刘烨','18890980989','男',130990,0.1,'1990-11-09','2016-08-09',10,'ly@atguigu.com',22,'多彩公寓','北京',3),(23,'陈坤','18712345632','男',130990,0.2,'1990-02-04','2016-05-09',2,'ck@atguigu.com',2,'天通苑二区','上海',1),(24,'迪丽热巴','17290876543','女',10289,0.4,'1990-04-01','2017-02-06',7,'dlrb@atguigu.com',18,'北苑','北京',5),(25,'姚笛','18709675645','女',9087,NULL,'1989-08-01','2017-09-01',7,'yd@atguigu.com',18,'望京','北京',5);

/*Table structure for table `t_job` */

DROP TABLE IF EXISTS `t_job`;

CREATE TABLE `t_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `t_job` */

insert  into `t_job`(`job_id`,`job_name`,`description`) values (1,'教学总监','负责教学管理工作'),(2,'讲师','负责教学工作'),(3,'助教','负责辅导工作'),(4,'咨询主管','负责咨询管理工作'),(5,'咨询师','负责咨询工作'),(6,'财务主管','负责财务工作'),(7,'出纳','负责出纳工作'),(8,'后勤主管','负责后勤管理工作'),(9,'网络管理员','负责网络管理'),(10,'运营主管','负责运营管理'),(11,'运营工程师','负责运营推广');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
