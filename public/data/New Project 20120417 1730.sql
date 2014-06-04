-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema meels
--

CREATE DATABASE IF NOT EXISTS meels;
USE meels;

--
-- Definition of table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `hash` varchar(255) collate utf8_unicode_ci default NULL,
  `password` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `city_id` int(11) default NULL,
  `role_id` int(11) default NULL,
  `request_hash` varchar(255) collate utf8_unicode_ci default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`id`,`email`,`hash`,`password`,`created_at`,`updated_at`,`city_id`,`role_id`,`request_hash`,`status`) VALUES 
 (1,'superuser@superuser.com','iJXdppRiI52XsqJe','736fc7f1f4f382e79f2278817d056a0ec14b9ff5','2011-12-11 11:23:08','2011-12-11 11:23:11',NULL,4,NULL,1),
 (2,'manager@manager.com','bXOqQQnHB8OBa7a2','a6c1c055d543886fae749a2443673d938b24d50e','2011-12-11 11:26:11','2011-12-11 11:26:11',1,3,NULL,1),
 (3,'admin@admin.com','bXOqQQnHB8OBa7a2','a6c1c055d543886fae749a2443673d938b24d50e','2011-12-11 12:04:05','2011-12-11 12:04:05',1,2,NULL,1),
 (4,'owner1@owner.com','XgEQCfh2HeZNnGCV','dc1fac1912be66b11df51dbf9575bba2345dba8f','2011-12-14 09:05:04','2011-12-14 11:32:32',1,0,'HyHY6rUaj8VmyVul7nJQwUr8xFg53UdUC1aYnm4lBjF1zN7KrAd2zeCb8G5VJzQq',1),
 (5,'owner2@owner.com',NULL,NULL,'2011-12-14 09:06:34','2011-12-14 09:06:34',1,0,NULL,0),
 (6,'owner3@owner.com',NULL,NULL,'2011-12-14 09:06:54','2011-12-14 09:06:54',1,0,NULL,0),
 (7,'copywriter@copywriter.com','Ik5scBmsjQpYQzaF','2f1191808ea066291d1c35ae94692dd6d7f3c1e1','2011-12-14 09:47:33','2011-12-14 09:47:33',1,1,NULL,1);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;


--
-- Definition of table `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `points` text collate utf8_unicode_ci,
  `parent_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `areas`
--

/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;


--
-- Definition of table `careers`
--

DROP TABLE IF EXISTS `careers`;
CREATE TABLE `careers` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `file` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `careers`
--

/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;


--
-- Definition of table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `lat` float default NULL,
  `lng` float default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`id`,`name`,`lat`,`lng`,`created_at`,`updated_at`) VALUES 
 (1,'Dubai',NULL,NULL,'2011-12-11 11:25:33','2011-12-11 11:25:33'),
 (2,'Abu Dhabi',NULL,NULL,'2011-12-11 11:25:38','2011-12-11 11:25:38'),
 (3,'San Francisco',NULL,NULL,'2011-12-11 11:25:43','2011-12-11 11:25:43'),
 (4,'New York',NULL,NULL,'2011-12-11 11:25:47','2011-12-11 11:25:47');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;


--
-- Definition of table `clusters`
--

DROP TABLE IF EXISTS `clusters`;
CREATE TABLE `clusters` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `points` text collate utf8_unicode_ci,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clusters`
--

/*!40000 ALTER TABLE `clusters` DISABLE KEYS */;
INSERT INTO `clusters` (`id`,`name`,`description`,`points`,`created_at`,`updated_at`) VALUES 
 (1,'Jumeirah','Jumeirah','25.117999999999995,55.16820715332028|25.242279311602108,55.265024169921844|25.228614793998148,55.28768347167966|25.20314500481376,55.267770751953094|25.165241065879414,55.234811767578094|25.145973891349808,55.22588537597653|25.12794700650117,55.212839111328094|25.104943325286033,55.17850683593747|25.111160963351818,55.16408728027341','2011-12-11 11:26:54','2011-12-11 11:26:54'),
 (2,'New Dubai','KV, DIC, DMC, Marina, JLT, Barsha, Tecom','25.03652845308773,55.14211462402341|25.039639048829393,55.11876867675778|25.039639048829393,55.10709570312497|25.06265500500872,55.12975500488278|25.06949675309134,55.12014196777341|25.085666638387835,55.13456152343747|25.091263408765293,55.133188232421844|25.091263408765293,55.144174560546844|25.096238100870657,55.141427978515594|25.094372615035006,55.11327551269528|25.106808649904355,55.102975830078094|25.126082004466078,55.10709570312497|25.14162281799214,55.12700842285153|25.142865997633944,55.146921142578094|25.134785103684685,55.15722082519528|25.10867394606745,55.160654052734344|25.114269663809726,55.16546057128903|25.13354184176384,55.18331335449216|25.11053921377374,55.221078857421844|25.099347180714872,55.23137854003903|25.074472329855013,55.20940588378903|25.061411009760384,55.19567297363278|25.053324732808736,55.19429968261716|25.04337165958683,55.19498632812497|25.03092918197829,55.174386962890594|25.019729873206572,55.157907470703094','2011-12-11 11:28:11','2011-12-11 11:28:11'),
 (3,'Jebel Ali','JAFZA, Green Community','24.912040017807062,54.89560888671872|24.96185050759028,54.954660400390594|24.969320343898957,54.987619384765594|24.99048241724116,54.94779394531247|25.02035208383656,54.954660400390594|25.03901693599187,54.973886474609344|25.03652845308773,55.01096533203122|25.012885348146447,55.031564697265594|24.986748198327955,55.023324951171844|24.9979505147495,55.04117773437497|25.019107659422875,55.042551025390594|25.02408528138613,55.072763427734344|25.05892298137402,55.10984228515622|25.020974291312836,55.16202734374997|24.986748198327955,55.21421240234372|24.958737941985152,55.19979284667966|24.97181018857138,55.141427978515594|24.92698527866645,55.11602209472653|24.882766970729385,55.04598425292966|24.8516178144819,55.00615881347653|24.8933558954117,54.93337438964841','2011-12-11 11:29:25','2011-12-11 11:29:25');
/*!40000 ALTER TABLE `clusters` ENABLE KEYS */;


--
-- Definition of table `credit_cards`
--

DROP TABLE IF EXISTS `credit_cards`;
CREATE TABLE `credit_cards` (
  `id` int(11) NOT NULL auto_increment,
  `number` text collate utf8_unicode_ci,
  `ccv` int(11) default NULL,
  `expiry_month` int(11) default NULL,
  `expiry_year` int(11) default NULL,
  `user_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `amount` float default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `credit_cards`
--

/*!40000 ALTER TABLE `credit_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_cards` ENABLE KEYS */;


--
-- Definition of table `cuisines`
--

DROP TABLE IF EXISTS `cuisines`;
CREATE TABLE `cuisines` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cuisines`
--

/*!40000 ALTER TABLE `cuisines` DISABLE KEYS */;
INSERT INTO `cuisines` (`id`,`name`,`created_at`,`updated_at`) VALUES 
 (2,'Arabic','2011-12-14 09:03:37','2011-12-14 09:03:37'),
 (3,'Asian','2011-12-14 09:03:40','2011-12-14 09:03:40'),
 (4,'Indian','2011-12-14 09:03:46','2011-12-14 09:03:46'),
 (5,'Continental','2011-12-14 09:03:55','2011-12-14 09:03:55'),
 (6,'American','2011-12-14 09:04:06','2011-12-14 09:04:06'),
 (7,'Other','2011-12-14 09:04:18','2011-12-14 09:04:18');
/*!40000 ALTER TABLE `cuisines` ENABLE KEYS */;


--
-- Definition of table `cuisines_users`
--

DROP TABLE IF EXISTS `cuisines_users`;
CREATE TABLE `cuisines_users` (
  `user_id` int(11) default NULL,
  `cuisine_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cuisines_users`
--

/*!40000 ALTER TABLE `cuisines_users` DISABLE KEYS */;
INSERT INTO `cuisines_users` (`user_id`,`cuisine_id`) VALUES 
 (66,2),
 (66,3),
 (66,6),
 (43,3),
 (43,5),
 (43,6),
 (66,2),
 (66,3),
 (66,6),
 (43,3),
 (43,5),
 (43,6);
/*!40000 ALTER TABLE `cuisines_users` ENABLE KEYS */;


--
-- Definition of table `d_meals`
--

DROP TABLE IF EXISTS `d_meals`;
CREATE TABLE `d_meals` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `restaurant_id` int(11) default NULL,
  `cuisine_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `meal_id` int(11) default NULL,
  `photo_file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `photo_content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `photo_file_size` int(11) default NULL,
  `photo_updated_at` datetime default NULL,
  `status` int(11) default NULL,
  `owner_id` int(11) default NULL,
  `vegetarian` tinyint(1) default NULL,
  `meal_info` text collate utf8_unicode_ci,
  `nutr_calories` text collate utf8_unicode_ci,
  `nutr_protein` text collate utf8_unicode_ci,
  `nutr_carbs` text collate utf8_unicode_ci,
  `nutr_cholesterol` text collate utf8_unicode_ci,
  `nutr_fats` text collate utf8_unicode_ci,
  `nutr_sodium` text collate utf8_unicode_ci,
  `price` float default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `d_meals`
--

/*!40000 ALTER TABLE `d_meals` DISABLE KEYS */;
INSERT INTO `d_meals` (`id`,`name`,`description`,`restaurant_id`,`cuisine_id`,`created_at`,`updated_at`,`meal_id`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`,`status`,`owner_id`,`vegetarian`,`meal_info`,`nutr_calories`,`nutr_protein`,`nutr_carbs`,`nutr_cholesterol`,`nutr_fats`,`nutr_sodium`,`price`) VALUES 
 (1,'sandeep d_meals name 1','this is d_meal description',1,1,'2012-02-07 08:10:25','2012-02-07 08:10:26',1,'2.jpg','image/jpeg',40575,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (2,'sandeep d_meals name 2','this is d_meal description',2,2,'2012-02-07 08:10:25','2012-02-07 08:10:26',2,'5.jpg','image/jpeg',36248,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',26),
 (3,'sandeep d_meals name 3','this is d_meal description',3,3,'2012-02-07 08:10:25','2012-02-07 08:10:26',3,'2.jpg','image/jpeg',40575,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (4,'sandeep d_meals name 4','this is d_meal description',4,4,'2012-02-07 08:10:25','2012-02-07 08:10:26',4,'5.jpg','image/jpeg',36248,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (5,'sandeep d_meals name 5','this is d_meal description',5,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',5,'1.jpg','image/jpeg',53861,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (6,'sandeep d_meals name 6','this is d_meal description',6,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',6,'2.jpg','image/jpeg',40575,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (7,'sandeep d_meals name 7','this is d_meal description',7,1,'2012-02-07 08:10:25','2012-02-07 08:10:26',7,'3.jpg','image/jpeg',45112,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (8,'sandeep d_meals name 8','this is d_meal description',8,2,'2012-02-07 08:10:25','2012-02-07 08:10:26',8,'4.jpg','image/jpeg',65954,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (9,'sandeep d_meals name 9','this is d_meal description',9,3,'2012-02-07 08:10:25','2012-02-07 08:10:26',9,'6.jpg','image/jpeg',48635,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (10,'sandeep d_meals name 10','this is d_meal description',10,4,'2012-02-07 08:10:25','2012-02-07 08:10:26',10,'7.jpg','image/jpeg',179305,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (11,'sandeep d_meals name 11','this is d_meal description',11,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',11,'2.jpg','image/jpeg',40575,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (12,'sandeep d_meals name 12','this is d_meal description',12,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',12,'6.jpg','image/jpeg',48635,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (13,'sandeep d_meals name 13','this is d_meal description',13,1,'2012-02-07 08:10:25','2012-02-07 08:10:26',13,'6.jpg','image/jpeg',48635,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (14,'sandeep d_meals name 14','this is d_meal description',14,2,'2012-02-07 08:10:25','2012-02-07 08:10:26',14,'10.jpg','image/jpeg',142665,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (15,'sandeep d_meals name 15','this is d_meal description',15,3,'2012-02-07 08:10:25','2012-02-07 08:10:26',15,'3.jpg','image/jpeg',45112,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (16,'sandeep d_meals name 16','this is d_meal description',16,4,'2012-02-07 08:10:25','2012-02-07 08:10:26',16,'7.jpg','image/jpeg',179305,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (17,'sandeep d_meals name 17','this is d_meal description',17,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',17,'6.jpg','image/jpeg',48635,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (18,'sandeep d_meals name 18','this is d_meal description',18,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',18,'2.jpg','image/jpeg',40575,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (19,'sandeep d_meals name 19','this is d_meal description',1,3,'2012-02-07 08:10:25','2012-02-07 08:10:26',19,'5.jpg','image/jpeg',36248,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (20,'sandeep d_meals name 20','this is d_meal description',2,3,'2012-02-07 08:10:25','2012-02-07 08:10:26',5,'8.jpg','image/jpeg',132516,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (21,'sandeep d_meals name 21','this is d_meal description',2,4,'2012-02-07 08:10:25','2012-02-07 08:10:26',21,'5.jpg','image/jpeg',36248,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',74),
 (22,'sandeep d_meals name 22','this is d_meal description',2,1,'2012-02-07 08:10:25','2012-02-07 08:10:26',22,'8.jpg','image/jpeg',132516,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',85),
 (23,'sandeep d_meals name 23','this is d_meal description',3,4,'2012-02-07 08:10:25','2012-02-07 08:10:26',23,'1.jpg','image/jpeg',53861,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',185),
 (24,'sandeep d_meals name 24','this is d_meal description',4,1,'2012-02-07 08:10:25','2012-02-07 08:10:26',24,'4.jpg','image/jpeg',65954,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',745),
 (25,'sandeep d_meals name 25','this is d_meal description',4,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',25,'8.jpg','image/jpeg',132516,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',111),
 (26,'sandeep d_meals name 26','this is d_meal description',2,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',26,'2.jpg','image/jpeg',40575,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',457),
 (27,'sandeep d_meals name 27','this is d_meal description',3,2,'2012-02-07 08:10:25','2012-02-07 08:10:26',27,'6.jpg','image/jpeg',48635,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',748),
 (28,'Chicken Biryani','this is description for meeal',5,4,'2012-02-07 08:10:25','2012-02-07 08:10:26',43,'chicken-biryani.jpg','image/jpeg',50102,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (29,'Lamb Roganrosh','this is description for meeal',5,4,'2012-02-07 08:10:25','2012-02-07 08:10:26',44,'11.jpg','image/jpeg',1167178,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (30,'Beef Vindaloo','this is description for meeal',5,4,'2012-02-07 08:10:25','2012-02-07 08:10:26',45,'BeefVindaloo.jpg','image/jpeg',3854367,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (31,'Prawn Curry with Rice','this is description for meeal',5,4,'2012-02-07 08:10:25','2012-02-07 08:10:26',46,'Country-Captain-Chicken.jpg','image/jpeg',101225,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (32,'Palak Paneer + Veg Pulao','this is description for meeal',5,4,'2012-02-07 08:10:25','2012-02-07 08:10:26',47,'palak.jpg','image/jpeg',814141,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (33,'Chicken Kabsaa','this is description for meeal',6,2,'2012-02-07 08:10:25','2012-02-07 08:10:26',48,'IMG_0493.JPG','image/jpeg',941541,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (34,'Lamb Shawarma','this is description for meeal',6,2,'2012-02-07 08:10:25','2012-02-07 08:10:26',49,'capture-20120409-130500.png','image/jpeg',879162,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (35,'Kofta Lebanese','this is description for meeal',6,2,'2012-02-07 08:10:25','2012-02-07 08:10:26',50,'Grilled Fish Kofta in Spicy Sauce Recipe.jpg','image/jpeg',27157,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (36,'Spicy Grilled Hammour','this is description for meeal',6,2,'2012-02-07 08:10:25','2012-02-07 08:10:26',51,'images.jpg','image/jpeg',9199,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (37,'Fatoush Salad','this is description for meeal',6,2,'2012-02-07 08:10:25','2012-02-07 08:10:26',52,'fattoush-1.jpg','image/jpeg',300688,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (38,'Chicken Terriyaki + Jasmine Rice','this is description for meeal',7,3,'2012-02-07 08:10:25','2012-02-07 08:10:26',53,'dsc_0321.jpg','image/jpeg',1590005,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (39,'Sauteed Lamb with Garlic Rice','this is description for meeal',7,3,'2012-02-07 08:10:25','2012-02-07 08:10:26',54,'Sauteed lamb chops.jpg','image/jpeg',322300,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (40,'Beef Hot Basil','this is description for meeal',7,3,'2012-02-07 08:10:25','2012-02-07 08:10:26',55,'Harvest Stew 1.JPG','image/jpeg',136273,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (41,'Fish in Cashew Nuts with Haka Noodles','this is description for meeal',7,3,'2012-02-07 08:10:25','2012-02-07 08:10:26',56,'dad outing...SD 005.JPG','image/jpeg',56934,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (42,'Vegetables in Oyster Sauce + Singapore Noodles','this is description for meeal',7,3,'2012-02-07 08:10:25','2012-02-07 08:10:26',57,'1 IMG_0258.JPG','image/jpeg',66942,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (43,'Cheesy Egg Chicken Pita Combo','this is description for meeal',8,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',58,'Spinach and Feta Stuffed Chicken with Pan Sauce on Spanakorizo (Greek Spinach Rice) 1 500.jpg','image/jpeg',57818,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (44,'Lamb Burger','this is description for meeal',8,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',59,'burger.jpg','image/jpeg',57818,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (45,'Chilli Con Carne','this is description for meeal',8,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',60,'chili.jpg','image/jpeg',31064,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (46,'Seefood Paella','this is description for meeal',8,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',61,'seafood-paella-1.jpg','image/jpeg',64003,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (47,'Greeek Salad','this is description for meeal',8,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',62,'greek-salad-oregano (5).jpg','image/jpeg',126958,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (48,'Classic Fried Chicken Burger','this is description for meeal',9,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',63,'mcrice-burger.jpg','image/jpeg',54218,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (49,'Grilled Lamb Chops with BBQ sauce','this is description for meeal',9,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',64,'IMG_0888.jpg','image/jpeg',58082,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (50,'Route 66 Burger','this is description for meeal',9,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',65,'32.jpg','image/jpeg',30252,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (51,'Seafood Pizza','this is description for meeal',9,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',66,'1280030399-ZLXF7HE.jpg','image/jpeg',488899,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (52,'Aubergine & Goat\'s Cheese Burger','this is description for meeal',9,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',67,'aubergine-goats-cheese-stack.jpg','image/jpeg',657894,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (53,'Ginataang Pinakbet','this is description for meeal',10,7,'2012-02-07 08:10:25','2012-02-07 08:10:26',68,'Ginataan_i209.jpg','image/jpeg',24533,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (54,'Lamb Manti','this is description for meeal',10,7,'2012-02-07 08:10:25','2012-02-07 08:10:26',69,'manti.jpg','image/jpeg',99847,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (55,'Beef Roulette','this is description for meeal',10,7,'2012-02-07 08:10:25','2012-02-07 08:10:26',70,'images1211.jpg','image/jpeg',9697,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (56,'Grilled Squids with vegetables','this is description for meeal',10,7,'2012-02-07 08:10:25','2012-02-07 08:10:26',71,'images.jpg','image/jpeg',10516,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (57,'Laing','this is description for meeal',10,7,'2012-02-07 08:10:25','2012-02-07 08:10:26',72,'images11.jpg','image/jpeg',13806,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (58,'Cheesy Egg Chicken Pita Combo','this is description for meeal',11,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',73,'iStock_000008784128Small3.jpg','image/jpeg',448020,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (59,'Lamb Burger','this is description for meeal',11,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',74,'27368_lamb_burger.jpg','image/jpeg',51487,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (60,'Chilli Con Carne','this is description for meeal',11,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',75,'chiliconcarne_n_lg.jpg','image/jpeg',19159,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (61,'Seefood Paella','this is description for meeal',11,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',76,'ACA_Seafood_Paella.jpg','image/jpeg',121963,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (62,'Greeek Salad','this is description for meeal',11,5,'2012-02-07 08:10:25','2012-02-07 08:10:26',77,'Greek-salad-Recipe_(8).jpg','image/jpeg',24542,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (63,'Classic Fried Chicken Burger','this is description for meeal',12,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',78,'olio_classic_roast_chicken_sandwich.jpg','image/jpeg',69614,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (64,'Grilled Lamb Chops with BBQ sauce','this is description for meeal',12,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',79,'lamb-chops-middle-eastern-tomato-sauce-opr0311-lg.jpg','image/jpeg',21854,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (65,'Route 66 Burger','this is description for meeal',12,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',80,'32.jpg','image/jpeg',30252,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (66,'Seafood Pizza','this is description for meeal',12,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',81,'seafood-gulai-nenas-pizza1-300x200.jpg','image/jpeg',28473,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (67,'Aubergine & Goat\'s Cheese Burger','this is description for meeal',12,6,'2012-02-07 08:10:25','2012-02-07 08:10:26',82,'Veggie-burger-with-goat-cheese.jpg','image/jpeg',76232,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (68,'Ginataang Pinakbet','this is description for meeal',13,7,'2012-02-07 08:10:25','2012-02-07 08:10:26',83,'lutong-pinoy-pinakbet-i6.jpg','image/jpeg',78663,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (69,'Lamb Manti','this is description for meeal',13,7,'2012-02-07 08:10:25','2012-02-07 08:10:26',84,'manti_buzz.png','image/jpeg',400168,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (70,'Beef Roulette','this is description for meeal',13,7,'2012-02-07 08:10:25','2012-02-07 08:10:26',85,'images1211.jpg','image/jpeg',9697,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (71,'Grilled Squids with vegetables','this is description for meeal',13,7,'2012-02-07 08:10:25','2012-02-07 08:10:26',86,'786786.jpg','image/jpeg',7108,'2012-03-27 09:28:18',1,4,0,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25),
 (72,'Laing','this is description for meeal',13,7,'2012-02-07 08:10:25','2012-02-07 08:10:26',87,'images11.jpg','image/jpeg',13806,'2012-03-27 09:28:18',1,4,1,'This d_meal info','calori 1','protien 2','carbs 3','cholestrol 4','fats 5','sodium 6',25);
/*!40000 ALTER TABLE `d_meals` ENABLE KEYS */;


--
-- Definition of table `d_restaurants`
--

DROP TABLE IF EXISTS `d_restaurants`;
CREATE TABLE `d_restaurants` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `lat` float default NULL,
  `lng` float default NULL,
  `admin_id` int(11) default NULL,
  `status` int(11) default NULL,
  `cuisine_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `restaurant_id` int(11) default NULL,
  `owner_id` int(11) default NULL,
  `cluster_id` int(11) default NULL,
  `phone` varchar(255) collate utf8_unicode_ci default NULL,
  `url` varchar(255) collate utf8_unicode_ci default NULL,
  `address` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `d_restaurants`
--

/*!40000 ALTER TABLE `d_restaurants` DISABLE KEYS */;
INSERT INTO `d_restaurants` (`id`,`name`,`description`,`lat`,`lng`,`admin_id`,`status`,`cuisine_id`,`created_at`,`updated_at`,`restaurant_id`,`owner_id`,`cluster_id`,`phone`,`url`,`address`) VALUES 
 (1,'d_restaurent sandeep restaurent','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,1,'2012-03-28 06:21:22','2012-03-28 06:30:46',1,4,1,'9999999999','www.newtechfusion.com','located in indore'),
 (2,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,2,'2012-03-28 06:21:22','2012-03-28 06:30:46',4,4,1,'9999999999','www.newtechfusion.com','located in indore'),
 (3,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,4,'2012-03-28 06:21:22','2012-03-28 06:30:46',5,4,1,'9999999999','www.newtechfusion.com','located in indore'),
 (4,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,2,'2012-03-28 06:21:22','2012-03-28 06:30:46',6,4,1,'9999999999','www.newtechfusion.com','located in indore'),
 (5,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,3,'2012-03-28 06:21:22','2012-03-28 06:30:46',7,4,1,'9999999999','www.newtechfusion.com','located in indore'),
 (6,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,5,'2012-03-28 06:21:22','2012-03-28 06:30:46',8,4,2,'9999999999','www.newtechfusion.com','located in indore'),
 (7,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,6,'2012-03-28 06:21:22','2012-03-28 06:30:46',9,4,2,'9999999999','www.newtechfusion.com','located in indore'),
 (8,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,7,'2012-03-28 06:21:22','2012-03-28 06:30:46',10,4,3,'9999999999','www.newtechfusion.com','located in indore'),
 (9,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,5,'2012-03-28 06:21:22','2012-03-28 06:30:46',11,4,1,'9999999999','www.newtechfusion.com','located in indore'),
 (10,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,6,'2012-03-28 06:21:22','2012-03-28 06:30:46',12,4,1,'9999999999','www.newtechfusion.com','located in indore'),
 (11,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,7,'2012-03-28 06:21:22','2012-03-28 06:30:46',13,4,1,'9999999999','www.newtechfusion.com','located in indore'),
 (12,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,6,'2012-03-28 06:21:22','2012-03-28 06:30:46',14,4,2,'9999999999','www.newtechfusion.com','located in indore'),
 (13,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,1,'2012-03-28 06:21:22','2012-03-28 06:30:46',15,4,3,'9999999999','www.newtechfusion.com','located in indore'),
 (14,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,2,'2012-03-28 06:21:22','2012-03-28 06:30:46',16,4,3,'9999999999','www.newtechfusion.com','located in indore'),
 (15,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,3,'2012-03-28 06:21:22','2012-03-28 06:30:46',17,4,3,'9999999999','www.newtechfusion.com','located in indore'),
 (16,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,4,'2012-03-28 06:21:22','2012-03-28 06:30:46',18,4,3,'9999999999','www.newtechfusion.com','located in indore'),
 (17,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,5,'2012-03-28 06:21:22','2012-03-28 06:30:46',19,4,3,'9999999999','www.newtechfusion.com','located in indore'),
 (18,'d_restaurent sandeep restaurent 5','d_restaurent this is very good restaurent added by sandeep',24.9675,55.2382,4,1,6,'2012-03-28 06:21:22','2012-03-28 06:30:46',20,4,3,'9999999999','www.newtechfusion.com','located in indore');
/*!40000 ALTER TABLE `d_restaurants` ENABLE KEYS */;


--
-- Definition of table `deals`
--

DROP TABLE IF EXISTS `deals`;
CREATE TABLE `deals` (
  `id` int(11) NOT NULL auto_increment,
  `d_meal_id` int(11) default NULL,
  `d_restaurant_id` int(11) default NULL,
  `threshold` int(11) default NULL,
  `range` int(11) default NULL,
  `owner_id` int(11) default NULL,
  `admin_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `deals`
--

/*!40000 ALTER TABLE `deals` DISABLE KEYS */;
INSERT INTO `deals` (`id`,`d_meal_id`,`d_restaurant_id`,`threshold`,`range`,`owner_id`,`admin_id`,`created_at`,`updated_at`) VALUES 
 (1,28,3,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (2,29,3,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (3,30,3,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (4,31,3,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (5,32,3,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (6,33,4,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (7,34,4,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (8,35,4,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (9,36,4,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (10,37,4,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (11,38,5,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (12,39,5,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (13,40,5,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (14,41,5,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (15,42,5,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (16,43,6,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (17,44,6,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (18,45,6,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (19,46,6,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (20,47,6,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (21,48,7,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (22,49,7,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (23,50,7,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (24,51,7,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (25,52,7,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (26,53,8,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (27,54,8,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (28,55,8,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (29,56,8,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (30,57,8,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (31,58,9,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (32,59,9,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (33,60,9,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (34,61,9,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (35,62,9,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (36,63,10,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (37,64,10,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (38,65,10,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (39,66,10,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (40,67,10,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (41,68,11,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (42,69,11,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (43,70,11,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (44,71,11,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40'),
 (45,72,11,NULL,NULL,NULL,4,'2012-03-27 11:54:40','2012-03-27 11:54:40');
/*!40000 ALTER TABLE `deals` ENABLE KEYS */;


--
-- Definition of table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL,
  `service` int(11) default NULL,
  `food` int(11) default NULL,
  `courtesy` int(11) default NULL,
  `cleanliness` int(11) default NULL,
  `value_for_money` int(11) default NULL,
  `comments` text collate utf8_unicode_ci,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `feedbacks`
--

/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;


--
-- Definition of table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `cluster_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `first_name` varchar(255) collate utf8_unicode_ci default NULL,
  `last_name` varchar(255) collate utf8_unicode_ci default NULL,
  `address_line1` varchar(255) collate utf8_unicode_ci default NULL,
  `address_line2` varchar(255) collate utf8_unicode_ci default NULL,
  `city` varchar(255) collate utf8_unicode_ci default NULL,
  `state` varchar(255) collate utf8_unicode_ci default NULL,
  `zipcode` int(11) default NULL,
  `phone` varchar(255) collate utf8_unicode_ci default NULL,
  `address_tagged_as` varchar(255) collate utf8_unicode_ci default NULL,
  `primary_address` tinyint(1) default NULL,
  `po` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`id`,`user_id`,`cluster_id`,`created_at`,`updated_at`,`first_name`,`last_name`,`address_line1`,`address_line2`,`city`,`state`,`zipcode`,`phone`,`address_tagged_as`,`primary_address`,`po`) VALUES 
 (1,43,2,NULL,NULL,'Sandeep','sharma','Alkapuri','Musakhedi','Indore','Madhya Pradesh',452001,'2147483647','Home',1,NULL),
 (2,43,2,NULL,NULL,'Rajesh','sharma',' 102 Sheetal complex','Vijay nagar','Indore','Madhya Pradesh',452001,'9999999999','Office',0,NULL),
 (3,47,NULL,'2012-04-12 14:40:44','2012-04-12 14:40:44',NULL,NULL,'sssssss','ppppppp',NULL,NULL,452001,'99999999',NULL,NULL,452001),
 (4,48,NULL,'2012-04-12 14:46:14','2012-04-12 14:46:14',NULL,NULL,'ddddd','dddd',NULL,NULL,4565,'464646',NULL,NULL,4663),
 (5,49,NULL,'2012-04-12 14:51:24','2012-04-12 14:51:24',NULL,NULL,'hgfdhf','ghfhgfhgfdhf',NULL,NULL,153546,'464646',NULL,NULL,4646),
 (6,50,NULL,'2012-04-12 14:54:10','2012-04-12 14:54:10',NULL,NULL,'asdasd','dasdas',NULL,NULL,123456,'123456',NULL,NULL,123456),
 (7,51,NULL,'2012-04-12 15:00:39','2012-04-12 15:00:39',NULL,NULL,'sffdsf','dfsfsad',NULL,NULL,123456,'123456',NULL,NULL,123456),
 (8,53,NULL,'2012-04-12 15:08:18','2012-04-12 15:08:18',NULL,NULL,'sdadas','dsada',NULL,NULL,4646,'4646',NULL,NULL,4664),
 (9,55,NULL,'2012-04-12 15:24:31','2012-04-12 15:24:31',NULL,NULL,'dsfdas','fdsfaf',NULL,NULL,123456,'123456',NULL,NULL,123456),
 (10,56,NULL,'2012-04-12 15:29:58','2012-04-12 15:29:58',NULL,NULL,'adsdad','dasdsa',NULL,NULL,123456,'123456',NULL,NULL,123456),
 (11,57,2,'2012-04-12 15:33:59','2012-04-12 15:33:59',NULL,NULL,'dsada','asda',NULL,NULL,2,'123456',NULL,NULL,2),
 (12,58,2,'2012-04-12 15:45:10','2012-04-12 15:45:10',NULL,NULL,'vxcvxz','vxczvcxzvxz',NULL,NULL,2,'123456',NULL,NULL,2),
 (13,60,NULL,'2012-04-13 08:08:09','2012-04-13 08:08:09',NULL,NULL,'adsdad','asda',NULL,NULL,123456,'123456',NULL,NULL,123456),
 (14,61,NULL,'2012-04-13 08:11:18','2012-04-13 08:11:18',NULL,NULL,'adsdad','adas',NULL,NULL,123456,'123456',NULL,NULL,4664),
 (15,62,2,'2012-04-13 08:16:21','2012-04-13 08:16:21',NULL,NULL,'adsdad','adas',NULL,NULL,12,'123456',NULL,NULL,12),
 (16,63,2,'2012-04-13 08:20:26','2012-04-13 08:20:26',NULL,NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,12),
 (17,64,2,'2012-04-13 08:24:23','2012-04-13 08:24:23',NULL,NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,12);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;


--
-- Definition of table `meals`
--

DROP TABLE IF EXISTS `meals`;
CREATE TABLE `meals` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `restaurant_id` int(11) default NULL,
  `fp_vegetarian` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `picture_file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `picture_content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `picture_file_size` int(11) default NULL,
  `picture_updated_at` datetime default NULL,
  `cuisine_id` int(11) default NULL,
  `vegetarian` tinyint(1) default NULL,
  `meal_info` text collate utf8_unicode_ci,
  `price` float default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `meals`
--

/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` (`id`,`name`,`description`,`restaurant_id`,`fp_vegetarian`,`created_at`,`updated_at`,`picture_file_name`,`picture_content_type`,`picture_file_size`,`picture_updated_at`,`cuisine_id`,`vegetarian`,`meal_info`,`price`) VALUES 
 (1,'Cheeseburger Combo','Cheese and fine agnus beef burgers',4,NULL,'2012-02-07 08:09:41','2012-02-07 08:09:41','2.jpg','image/jpeg',40575,'2012-02-07 08:09:40',6,NULL,'burger, fries, coke',20),
 (2,'Mini Bacon Burgers','Bacom.. hmmmm',4,NULL,'2012-02-07 08:10:25','2012-02-07 08:10:26','1.jpg','image/jpeg',53861,'2012-02-07 08:10:25',6,NULL,'4 mini bacon burgers\r\ncoke\r\nfries',34),
 (3,'sandeep meel','This is a very good meel',4,NULL,'2012-03-27 09:28:19','2012-03-27 09:28:19','2.jpg','image/jpeg',40575,'2012-03-27 09:28:18',3,NULL,'it contains all good things',23),
 (4,'sandeep new meel','This is also a very good meeel',4,NULL,'2012-03-27 09:31:12','2012-03-27 09:31:12','5.jpg','image/jpeg',36248,'2012-03-27 09:31:12',4,NULL,'This is also contains very good items',24),
 (7,'new meel 1','this is the description for meel.',1,NULL,'2012-04-02 11:31:20','2012-04-02 11:31:20','1.jpg','image/jpeg',53861,'2012-04-02 11:31:19',6,NULL,'this is meel info.',12),
 (8,'new meel 2','this is meel description.',1,NULL,'2012-04-02 11:32:23','2012-04-02 11:32:23','2.jpg','image/jpeg',40575,'2012-04-02 11:32:23',2,NULL,'\r\nthis is meel info.',12),
 (9,'new meel 3','this is meel description.',1,NULL,'2012-04-02 11:33:06','2012-04-02 11:33:06','3.jpg','image/jpeg',45112,'2012-04-02 11:33:06',3,NULL,'this is meel info.',13),
 (10,'new meel 4','this is meel description.',5,NULL,'2012-04-02 11:33:54','2012-04-02 11:33:54','4.jpg','image/jpeg',65954,'2012-04-02 11:33:54',5,NULL,'this is meel info.',14),
 (11,'new meel 5','this is meel description.\r\n',5,NULL,'2012-04-02 11:34:43','2012-04-02 11:34:43','6.jpg','image/jpeg',48635,'2012-04-02 11:34:42',4,NULL,'this is meel info.',12),
 (12,'new meel 6','this is meel description.',5,NULL,'2012-04-02 11:35:15','2012-04-02 11:35:16','7.jpg','image/jpeg',179305,'2012-04-02 11:35:15',3,NULL,'this is meel info.',12),
 (13,'new meel 7','this is meel description.',6,NULL,'2012-04-02 11:36:20','2012-04-02 11:36:20','2.jpg','image/jpeg',40575,'2012-04-02 11:36:19',7,NULL,'this is meel info.',14),
 (14,'new meel 9','this is meel description.',6,NULL,'2012-04-02 11:36:55','2012-04-02 11:36:55','6.jpg','image/jpeg',48635,'2012-04-02 11:36:55',3,NULL,'this is meel info.',13),
 (15,'new meel 4','this is meel description.',7,NULL,'2012-04-02 11:37:31','2012-04-02 11:37:31','6.jpg','image/jpeg',48635,'2012-04-02 11:37:31',5,NULL,'this is meel info.',17),
 (16,'new meel 5','this is meel description.',7,NULL,'2012-04-02 11:38:18','2012-04-02 11:38:18','10.jpg','image/jpeg',142665,'2012-04-02 11:38:18',4,NULL,'this is meel info.',16),
 (17,'new meel 1','this is meel description.',8,NULL,'2012-04-02 11:38:54','2012-04-02 11:38:54','3.jpg','image/jpeg',45112,'2012-04-02 11:38:54',2,NULL,'this is meel info.',85),
 (18,'new meel 9','this is meel description.',8,NULL,'2012-04-02 11:39:36','2012-04-02 11:39:36','7.jpg','image/jpeg',179305,'2012-04-02 11:39:36',5,NULL,'this is meel info.',74),
 (19,'new meel 45','this is meel description.',9,NULL,'2012-04-02 11:40:08','2012-04-02 11:40:08','6.jpg','image/jpeg',48635,'2012-04-02 11:40:08',6,NULL,'this is meel info.',45),
 (20,'new meel 74','this is meel description.',9,NULL,'2012-04-02 11:40:36','2012-04-02 11:40:36','2.jpg','image/jpeg',40575,'2012-04-02 11:40:36',3,NULL,'this is meel info.',189),
 (21,'new meel 1','this is meel description.',10,NULL,'2012-04-02 11:41:19','2012-04-02 11:41:19','5.jpg','image/jpeg',36248,'2012-04-02 11:41:19',2,NULL,'this is meel info.',18),
 (22,'new meel 47','this is meel description.',10,NULL,'2012-04-02 11:41:53','2012-04-02 11:41:53','8.jpg','image/jpeg',132516,'2012-04-02 11:41:52',4,NULL,'this is meel description info.',122),
 (23,'new meel 44','this is meel description.',11,NULL,'2012-04-02 11:42:34','2012-04-02 11:42:34','1.jpg','image/jpeg',53861,'2012-04-02 11:42:34',2,NULL,'this is meel description info.',125),
 (24,'new meel 5','this is meel description.',11,NULL,'2012-04-02 11:43:12','2012-04-02 11:43:12','4.jpg','image/jpeg',65954,'2012-04-02 11:43:12',3,NULL,'this is meel description info.',135),
 (25,'new meel 5','this is meel description.',12,NULL,'2012-04-02 11:43:53','2012-04-02 11:43:53','8.jpg','image/jpeg',132516,'2012-04-02 11:43:52',4,NULL,'this is meel description info.',12),
 (26,'new meel 55','this is meel description.',12,NULL,'2012-04-02 11:44:26','2012-04-02 11:44:26','2.jpg','image/jpeg',40575,'2012-04-02 11:44:25',6,NULL,'this is meel description info.',123),
 (27,'new meel 48','this is meel description.',13,NULL,'2012-04-02 11:44:55','2012-04-02 11:44:55','6.jpg','image/jpeg',48635,'2012-04-02 11:44:54',3,NULL,'this is meel description. info',1277),
 (28,'new meel 344','this is meel description.',13,NULL,'2012-04-02 11:45:32','2012-04-02 11:45:32','1.jpg','image/jpeg',53861,'2012-04-02 11:45:31',5,NULL,'this is meel description info.',124),
 (29,'new meel 11','this is meel description.',14,NULL,'2012-04-02 11:46:41','2012-04-02 11:46:41','7.jpg','image/jpeg',179305,'2012-04-02 11:46:41',6,NULL,'this is meel description. info',1244),
 (30,'new meel 19','this is meel description.',14,NULL,'2012-04-02 11:47:20','2012-04-02 11:47:20','10.jpg','image/jpeg',142665,'2012-04-02 11:47:20',6,NULL,'this is meel description.info',45),
 (31,'new meel 55','this is meel description.',15,NULL,'2012-04-02 11:47:50','2012-04-02 11:47:50','2.jpg','image/jpeg',40575,'2012-04-02 11:47:49',2,NULL,'this is meel description. info',789),
 (32,'new meel 56','this is meel description.',15,NULL,'2012-04-02 11:48:26','2012-04-02 11:48:26','3.jpg','image/jpeg',45112,'2012-04-02 11:48:26',4,NULL,'this is meel description.',1222),
 (33,'new meel 74','this is meel description.',16,NULL,'2012-04-02 11:49:05','2012-04-02 11:49:05','8.jpg','image/jpeg',132516,'2012-04-02 11:49:05',5,NULL,'this is meel description. info',456),
 (34,'new meel 46','this is meel description.',16,NULL,'2012-04-02 11:49:33','2012-04-02 11:49:33','3.jpg','image/jpeg',45112,'2012-04-02 11:49:33',7,NULL,'this is meel description. info',123),
 (35,'new meel 5','this is meel description.',17,NULL,'2012-04-02 11:50:10','2012-04-02 11:50:10','6.jpg','image/jpeg',48635,'2012-04-02 11:50:10',2,NULL,'this is meel description. info',133),
 (36,'new meel 54','this is meel description.',17,NULL,'2012-04-02 11:50:44','2012-04-02 11:50:44','4.jpg','image/jpeg',65954,'2012-04-02 11:50:44',6,NULL,'this is meel description. info',478),
 (37,'new meel 9','this is meel description.',18,NULL,'2012-04-02 11:51:27','2012-04-02 11:51:28','8.jpg','image/jpeg',132516,'2012-04-02 11:51:27',2,NULL,'this is meel description. info',789),
 (38,'new meel 456','this is meel description.',18,NULL,'2012-04-02 11:52:24','2012-04-02 11:52:24','6.jpg','image/jpeg',48635,'2012-04-02 11:52:23',6,NULL,'this is meel description. info',782),
 (39,'new meel 74','this is meel description.',19,NULL,'2012-04-02 11:53:04','2012-04-02 11:53:04','2.jpg','image/jpeg',40575,'2012-04-02 11:53:04',5,NULL,'this is meel description. info',144),
 (40,'new meel 77','this is meel description.',19,NULL,'2012-04-02 11:53:44','2012-04-02 11:53:44','1.jpg','image/jpeg',53861,'2012-04-02 11:53:44',7,NULL,'this is meel description. info',145),
 (41,'new meel 96','this is meel description.',20,NULL,'2012-04-02 11:54:15','2012-04-02 11:54:15','5.jpg','image/jpeg',36248,'2012-04-02 11:54:15',4,NULL,'this is meel description. info',789),
 (42,'new meel 111','this is meel description.',20,NULL,'2012-04-02 11:55:09','2012-04-02 11:55:09','9.jpg','image/jpeg',128887,'2012-04-02 11:55:09',2,NULL,'this is meel description. info',12),
 (43,'Chicken Biryani ','This is the Description for Chicken Biryani.',5,NULL,'2012-04-09 09:06:59','2012-04-09 09:07:00','chicken-biryani.jpg','image/jpeg',50102,'2012-04-09 09:06:59',4,0,'This is the Meel info for Chicken Biryani.',21),
 (44,'Lamb Roganrosh','This is the Description for Lamb Roganrosh.',5,NULL,'2012-04-09 09:13:08','2012-04-09 09:13:09','11.jpg','image/jpeg',1167178,'2012-04-09 09:13:07',4,0,'This is the Meal Info for Lamb Roganrosh.',22),
 (45,'Beef Vindaloo','This is the Description for Chicken Biryani.',5,NULL,'2012-04-09 09:15:15','2012-04-09 09:15:15','BeefVindaloo.jpg','image/jpeg',3854367,'2012-04-09 09:15:11',4,0,'This is the Meal Info for Chicken Biryani.',45),
 (46,'Prawn Curry with Rice','This is the Description for Chicken Biryani.',5,NULL,'2012-04-09 09:21:38','2012-04-09 09:21:39','Country-Captain-Chicken.jpg','image/jpeg',101225,'2012-04-09 09:21:38',4,0,'This is the Meal Info for Chicken Biryani.',56),
 (47,'Palak Paneer + Veg Pulao','This is the Description for Chicken Biryani.',5,NULL,'2012-04-09 09:23:30','2012-04-09 09:23:30','palak.jpg','image/jpeg',814141,'2012-04-09 09:23:28',4,1,'This is the Meal Info for Chicken Biryani.',78),
 (48,'Chicken Kabsaa','This is the Description for Chicken Biryani.',6,NULL,'2012-04-09 09:27:37','2012-04-09 09:27:37','IMG_0493.JPG','image/jpeg',941541,'2012-04-09 09:27:36',2,0,'This is the Meal Info for Chicken Biryani.',75),
 (49,'Lamb Shawarma','This is the Description for Chicken Biryani.',6,NULL,'2012-04-09 09:29:29','2012-04-09 09:29:29','capture-20120409-130500.png','image/png',879162,'2012-04-09 09:29:28',2,0,'This is the Meal Info for Chicken Biryani.',45),
 (50,'Kofta Lebanese','This is the Description for Chicken Biryani.',6,NULL,'2012-04-09 09:30:42','2012-04-09 09:30:42','Grilled Fish Kofta in Spicy Sauce Recipe.jpg','image/jpeg',27157,'2012-04-09 09:30:41',2,0,'This is the Meal Info  for Chicken Biryani.',78),
 (51,'Spicy Grilled Hammour','This is the Description for Chicken Biryani.',6,NULL,'2012-04-09 09:32:29','2012-04-09 09:32:29','images.jpg','image/jpeg',9199,'2012-04-09 09:32:29',2,0,'This is the Meal Info for Chicken Biryani.',79),
 (52,'Fatoush Salad','This is the Description for Chicken Biryani.',6,NULL,'2012-04-09 09:34:19','2012-04-09 09:34:20','fattoush-1.jpg','image/jpeg',300688,'2012-04-09 09:34:19',2,1,'This is the Meal Info for Chicken Biryani.',20),
 (53,'Chicken Terriyaki + Jasmine Rice','This is the Description for Chicken Biryani.',7,NULL,'2012-04-09 09:38:12','2012-04-09 09:38:12','dsc_0321.jpg','image/jpeg',1590005,'2012-04-09 09:38:10',3,0,'This is the Meal Info for Chicken Biryani.',45),
 (54,'Sauteed Lamb with Garlic Rice','This is the Description for Meel.',7,NULL,'2012-04-09 09:39:59','2012-04-09 09:39:59','Sauteed lamb chops.jpg','image/jpeg',322300,'2012-04-09 09:39:58',3,0,'This is the Meal Info for Meel.',85),
 (55,'Beef Hot Basil','This is the Description for Meel.',7,NULL,'2012-04-09 09:41:26','2012-04-09 09:41:26','Harvest Stew 1.JPG','image/jpeg',136273,'2012-04-09 09:41:25',3,0,'This is the Meal Info for Meel.',42),
 (56,'Fish in Cashew Nuts with Haka Noodles','This is the Description for Meel.',7,NULL,'2012-04-09 09:42:55','2012-04-09 09:42:55','dad outing...SD 005.JPG','image/jpeg',56934,'2012-04-09 09:42:54',3,0,'This is the Meal Info for Meel.',56),
 (57,'Vegetables in Oyster Sauce + Singapore Noodles','This is the Description for Meel.',7,NULL,'2012-04-09 09:44:27','2012-04-09 09:44:27','1 IMG_0258.JPG','image/jpeg',66942,'2012-04-09 09:44:27',3,1,'This is the Meal Info  for Meel.',45),
 (58,'Cheesy Egg Chicken Pita Combo','This is the Description for Meel.',8,NULL,'2012-04-09 09:51:15','2012-04-09 09:51:15','Spinach and Feta Stuffed Chicken with Pan Sauce on Spanakorizo (Greek Spinach Rice) 1 500.jpg','image/jpeg',57818,'2012-04-09 09:51:14',5,0,'This is the Meal Info for Meel.',78),
 (59,'Lamb Burger','This is the Description for Meel.',8,NULL,'2012-04-09 09:52:45','2012-04-09 09:52:45','burger.jpg','image/jpeg',491606,'2012-04-09 09:52:44',5,0,'This is the Description for Meel.',89),
 (60,'Chilli Con Carne','This is the Description for Meel.',8,NULL,'2012-04-09 09:54:05','2012-04-09 09:54:05','chili.jpg','image/jpeg',31064,'2012-04-09 09:54:04',5,0,'This is the Meal Info for Meel.',78),
 (61,'Seefood Paella','This is the Description for Meel.',8,NULL,'2012-04-09 09:55:21','2012-04-09 09:55:21','seafood-paella-1.jpg','image/jpeg',64003,'2012-04-09 09:55:21',5,0,'This is the Meal Info for Meel.',56),
 (62,'Greeek Salad','This is the Description for Meel.',8,NULL,'2012-04-09 09:58:21','2012-04-09 09:58:21','greek-salad-oregano (5).jpg','image/jpeg',126958,'2012-04-09 09:58:20',5,1,'This is the Meal Info for Meel.',47),
 (63,'Classic Fried Chicken Burger','This is the Description for Meel.',9,NULL,'2012-04-09 10:01:14','2012-04-09 10:01:14','mcrice-burger.jpg','image/jpeg',54218,'2012-04-09 10:01:14',6,0,'This is the Meal Info for Meel.',65),
 (64,'Grilled Lamb Chops with BBQ sauce','This is the Description for Meel.',9,NULL,'2012-04-09 10:02:40','2012-04-09 10:02:41','IMG_0888.jpg','image/jpeg',58082,'2012-04-09 10:02:40',6,0,'This is the Meal Info for Meel.',56),
 (65,'Route 66 Burger','This is the Description for Meel.',9,NULL,'2012-04-09 10:04:19','2012-04-09 10:04:19','32.jpg','image/jpeg',30252,'2012-04-09 10:04:18',6,0,'This is the Meal Info for Meel.',89),
 (66,'Seafood Pizza','This is the Description for Meel.',9,NULL,'2012-04-09 10:05:28','2012-04-09 10:05:28','1280030399-ZLXF7HE.jpg','image/jpeg',488899,'2012-04-09 10:05:27',6,0,'This is the Meal Info for Meel.',45),
 (67,'Aubergine & Goat\'s Cheese Burger','This is the Description for Meel.',9,NULL,'2012-04-09 10:07:02','2012-04-09 10:07:02','aubergine-goats-cheese-stack.jpg','image/jpeg',657894,'2012-04-09 10:07:01',6,1,'This is the Meal Info for Meel.',76),
 (68,'Ginataang Pinakbet','This is the Description for Meel.',10,NULL,'2012-04-09 10:08:29','2012-04-09 10:08:30','Ginataan_i209.jpg','image/jpeg',24533,'2012-04-09 10:08:29',7,0,'This is the Meal Info for Meel.',56),
 (69,'Lamb Manti','This is the Description for Meel.',10,NULL,'2012-04-09 10:09:33','2012-04-09 10:09:33','manti.jpg','image/jpeg',99847,'2012-04-09 10:09:33',7,0,'This is the Meal Info for Meel.',23),
 (70,'Beef Roulette','This is the Description for Meel.',10,NULL,'2012-04-09 10:10:12','2012-04-09 10:10:12','images1211.jpg','image/jpeg',9697,'2012-04-09 10:10:12',7,0,'This is the Description for Meel.',23),
 (71,'Grilled Squids with vegetables','This is the Description for Meel.',10,NULL,'2012-04-09 10:11:20','2012-04-09 10:11:21','images.jpg','image/jpeg',10516,'2012-04-09 10:11:20',7,0,'This is the Meal Info for Meel.',78),
 (72,'Laing','This is the Description for Meel.',10,NULL,'2012-04-09 10:12:01','2012-04-09 10:12:02','images11.jpg','image/jpeg',13806,'2012-04-09 10:12:01',7,1,'This is the Description for Meel.',54),
 (73,'Cheesy Egg Chicken Pita Combo','This is the Description for Cheesy Egg Chicken Pita Combo',11,NULL,'2012-04-14 13:09:53','2012-04-14 13:09:53','iStock_000008784128Small3.jpg','image/jpeg',448020,'2012-04-14 13:09:52',5,0,'This is the Meal info for Cheesy Egg Chicken Pita Combo',45),
 (74,'Lamb Burger','This is the Description for Lamb Burger',11,NULL,'2012-04-14 13:11:47','2012-04-14 13:11:47','27368_lamb_burger.jpg','image/jpeg',51487,'2012-04-14 13:11:47',5,0,'This is the Meal info for Lamb Burger',65),
 (75,'Chilli Con Carne','This is the Description for Chilli Con Carne',11,NULL,'2012-04-14 13:13:36','2012-04-14 13:13:36','chiliconcarne_n_lg.jpg','image/jpeg',19159,'2012-04-14 13:13:36',5,0,'This is the Meal info for Chilli Con Carne',78),
 (76,'Seefood Paella','This is the Description for Lamb Burger.\r\n',11,NULL,'2012-04-14 13:15:04','2012-04-14 13:15:04','ACA_Seafood_Paella.jpg','image/jpeg',121963,'2012-04-14 13:15:04',5,0,'This is the Meal info for Lamb Burger.\r\n',45),
 (77,'Greeek Salad','This is the Description for Greeek Salad.\r\n',11,NULL,'2012-04-14 13:16:24','2012-04-14 13:16:24','Greek-salad-Recipe_(8).jpg','image/jpeg',24542,'2012-04-14 13:16:24',5,1,'This is the Meal info for Greeek Salad.\r\n',56),
 (78,'Classic Fried Chicken Burger','This is the Description for Classic Fried Chicken Burger.',12,NULL,'2012-04-14 13:20:31','2012-04-14 13:20:31','olio_classic_roast_chicken_sandwich.jpg','image/jpeg',69614,'2012-04-14 13:20:30',6,0,'This is the Meal info for Classic Fried Chicken Burger.',45),
 (79,'Grilled Lamb Chops with BBQ sauce','This is the Description for Grilled Lamb Chops with BBQ sauce',12,NULL,'2012-04-14 13:22:06','2012-04-14 13:22:06','lamb-chops-middle-eastern-tomato-sauce-opr0311-lg.jpg','image/jpeg',21854,'2012-04-14 13:22:06',6,0,'This is the Meal info for Grilled Lamb Chops with BBQ sauce',54),
 (80,'Route 66 Burger','This is the Description for Route 66 Burger.',12,NULL,'2012-04-14 13:30:07','2012-04-14 13:30:07','32.jpg','image/jpeg',30252,'2012-04-14 13:30:06',6,0,'This is the Meal info for Route 66 Burger.',45),
 (81,'Seafood Pizza','This is the Description for Seafood Pizza.\r\n',12,NULL,'2012-04-14 13:32:19','2012-04-14 13:32:19','seafood-gulai-nenas-pizza1-300x200.jpg','image/jpeg',28473,'2012-04-14 13:32:18',6,0,'This is the Meal info for Seafood Pizza.\r\n',45),
 (82,'Aubergine & Goat\'s Cheese Burger','This is the Description for Aubergine & Goat\'s Cheese Burger.',12,NULL,'2012-04-14 13:33:39','2012-04-14 13:33:39','Veggie-burger-with-goat-cheese.jpg','image/jpeg',76232,'2012-04-14 13:33:39',6,1,'This is the meal info for Aubergine & Goat\'s Cheese Burger.',54),
 (83,'Ginataang Pinakbet','This is the Description for Ginataang Pinakbet.',13,NULL,'2012-04-14 13:35:45','2012-04-14 13:35:45','lutong-pinoy-pinakbet-i6.jpg','image/jpeg',78663,'2012-04-14 13:35:44',7,0,'This is the Description for Ginataang Pinakbet.',45),
 (84,'Lamb Manti','This is the Description for Lamb Manti.',13,NULL,'2012-04-14 13:37:14','2012-04-14 13:37:15','manti_buzz.png','image/png',400168,'2012-04-14 13:37:14',7,0,'This is the  Meal info for Lamb Manti.',45),
 (85,'Beef Roulette','This is the Description for Beef Roulette.',13,NULL,'2012-04-14 13:38:35','2012-04-14 13:38:35','images1211.jpg','image/jpeg',9697,'2012-04-14 13:38:34',7,0,'This is the Meal info for Beef Roulette.',45),
 (86,'Grilled Squids with vegetables','This is the Description for Grilled Squids with vegetables.\r\n',13,NULL,'2012-04-14 13:40:00','2012-04-14 13:40:00','786786.jpg','image/jpeg',7108,'2012-04-14 13:39:59',7,0,'This is the Meal info for Grilled Squids with vegetables.\r\n',54),
 (87,'Laing','This is the Description for Laing.',13,NULL,'2012-04-14 13:41:28','2012-04-14 13:41:28','images11.jpg','image/jpeg',13806,'2012-04-14 13:41:28',7,1,'This is the Meal info for Laing.',54);
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;


--
-- Definition of table `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL auto_increment,
  `deal_id` int(11) default NULL,
  `maximum_order` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `status` int(11) default NULL,
  `yday` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `offers`
--

/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` (`id`,`deal_id`,`maximum_order`,`created_at`,`updated_at`,`status`,`yday`) VALUES 
 (1,1,8,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (2,2,12,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (3,3,12,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (4,4,8,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (5,5,12,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (6,6,20,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (7,7,12,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (8,8,25,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (9,9,30,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (10,10,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (11,11,20,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (12,12,20,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (13,13,8,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (14,14,15,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (15,15,5,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (16,16,3,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (17,17,80,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (18,18,30,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (19,19,18,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (20,20,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (21,21,8,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (22,22,11,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (23,23,20,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (24,24,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (25,25,15,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (26,26,9,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (27,27,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (28,28,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (29,29,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (30,30,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (31,31,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (32,32,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (33,33,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (34,34,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (35,35,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (36,36,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (37,37,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (38,38,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (39,39,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (40,40,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (41,41,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (42,42,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (43,43,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (44,44,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104),
 (45,45,14,'2012-02-07 08:09:41','2012-02-07 08:09:41',2,104);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;


--
-- Definition of table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `offer_id` int(11) default NULL,
  `status` int(11) default NULL,
  `amount` int(11) default NULL,
  `extra_info` text collate utf8_unicode_ci,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


--
-- Definition of table `owners`
--

DROP TABLE IF EXISTS `owners`;
CREATE TABLE `owners` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `owners`
--

/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;


--
-- Definition of table `request_locations`
--

DROP TABLE IF EXISTS `request_locations`;
CREATE TABLE `request_locations` (
  `id` int(11) NOT NULL auto_increment,
  `r_name` varchar(255) collate utf8_unicode_ci default NULL,
  `r_email` varchar(255) collate utf8_unicode_ci default NULL,
  `r_location` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `request_locations`
--

/*!40000 ALTER TABLE `request_locations` DISABLE KEYS */;
INSERT INTO `request_locations` (`id`,`r_name`,`r_email`,`r_location`,`created_at`,`updated_at`) VALUES 
 (1,'Sandeep','ersandeep0610@gmail.com','Indore','2012-03-31 08:42:00','2012-03-31 08:42:00');
/*!40000 ALTER TABLE `request_locations` ENABLE KEYS */;


--
-- Definition of table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `lat` float default NULL,
  `lng` float default NULL,
  `admin_id` int(11) default NULL,
  `your_name` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `address2` varchar(255) collate utf8_unicode_ci default NULL,
  `zip_code` varchar(255) collate utf8_unicode_ci default NULL,
  `website` varchar(255) collate utf8_unicode_ci default NULL,
  `delivery_name` varchar(255) collate utf8_unicode_ci default NULL,
  `delivery_staff` varchar(255) collate utf8_unicode_ci default NULL,
  `order_day` varchar(255) collate utf8_unicode_ci default NULL,
  `primary_cusine` varchar(255) collate utf8_unicode_ci default NULL,
  `combo_meals` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `city_id` int(11) default NULL,
  `status` int(11) default NULL,
  `cuisine_id` int(11) default NULL,
  `cluster_id` int(11) default NULL,
  `phone` varchar(255) collate utf8_unicode_ci default NULL,
  `url` varchar(255) collate utf8_unicode_ci default NULL,
  `address` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurants`
--

/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;


--
-- Definition of table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Definition of table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) collate utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`) VALUES 
 ('20111014181558'),
 ('20111014185337'),
 ('20111014190737'),
 ('20111016184017'),
 ('20111016185016'),
 ('20111016192325'),
 ('20111017000618'),
 ('20111018212306'),
 ('20111018212709'),
 ('20111022093832'),
 ('20111022100117'),
 ('20111022100131'),
 ('20111022100212'),
 ('20111022101037'),
 ('20111022144414'),
 ('20111029192442'),
 ('20111102114450'),
 ('20111102203353'),
 ('20111102203830'),
 ('20111102210315'),
 ('20111106082541'),
 ('20111106082622'),
 ('20111109071649'),
 ('20111109135554'),
 ('20111109135650'),
 ('20111109142339'),
 ('20111109163317'),
 ('20111109163406'),
 ('20111109163729'),
 ('20111113061718'),
 ('20111113074443'),
 ('20111115070133'),
 ('20111115070235'),
 ('20111117065813'),
 ('20111117065907'),
 ('20111117085550'),
 ('20111120090538'),
 ('20111120111003'),
 ('20111120123300'),
 ('20111121105937'),
 ('20111121110351'),
 ('20111121115906'),
 ('20111122093207'),
 ('20111204101840'),
 ('20111204105007'),
 ('20111204105059'),
 ('20111204105411'),
 ('20111214081357'),
 ('20111214093641'),
 ('20120108014807'),
 ('20120108023759'),
 ('20120124063028'),
 ('20120124063215'),
 ('20120124094825'),
 ('20120202072226'),
 ('20120202081319'),
 ('20120202081426'),
 ('20120205095641'),
 ('20120205101054'),
 ('20120205105135'),
 ('20120206064230'),
 ('20120206064515'),
 ('20120206082746'),
 ('20120206083717'),
 ('20120207052110'),
 ('20120331081116'),
 ('20120331094856'),
 ('20120411135413'),
 ('20120411135442'),
 ('20120412114555'),
 ('20120412135623'),
 ('20120417053612'),
 ('20120417053720');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;


--
-- Definition of table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `taggable_id` int(11) default NULL,
  `taggable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `tagger_id` int(11) default NULL,
  `tagger_type` varchar(255) collate utf8_unicode_ci default NULL,
  `context` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taggings`
--

/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`tagger_id`,`tagger_type`,`context`,`created_at`) VALUES 
 (7,4,3,'Meal',NULL,NULL,'tags','2012-02-07 08:09:41'),
 (8,5,3,'Meal',NULL,NULL,'tags','2012-02-07 08:09:41'),
 (9,6,3,'Meal',NULL,NULL,'tags','2012-02-07 08:09:41'),
 (10,4,5,'Meal',NULL,NULL,'tags','2012-03-27 09:28:19'),
 (11,7,5,'Meal',NULL,NULL,'tags','2012-03-27 09:28:19'),
 (12,8,5,'Meal',NULL,NULL,'tags','2012-03-27 09:28:19'),
 (13,4,6,'Meal',NULL,NULL,'tags','2012-03-27 09:31:12'),
 (14,7,6,'Meal',NULL,NULL,'tags','2012-03-27 09:31:12'),
 (15,9,6,'Meal',NULL,NULL,'tags','2012-03-27 09:31:12'),
 (16,2,7,'Meal',NULL,NULL,'tags','2012-04-02 11:31:20'),
 (17,5,7,'Meal',NULL,NULL,'tags','2012-04-02 11:31:20'),
 (18,10,7,'Meal',NULL,NULL,'tags','2012-04-02 11:31:20'),
 (19,2,8,'Meal',NULL,NULL,'tags','2012-04-02 11:32:23'),
 (20,5,8,'Meal',NULL,NULL,'tags','2012-04-02 11:32:23'),
 (21,10,8,'Meal',NULL,NULL,'tags','2012-04-02 11:32:23'),
 (22,2,9,'Meal',NULL,NULL,'tags','2012-04-02 11:33:06'),
 (23,5,9,'Meal',NULL,NULL,'tags','2012-04-02 11:33:06'),
 (24,10,9,'Meal',NULL,NULL,'tags','2012-04-02 11:33:06'),
 (25,2,10,'Meal',NULL,NULL,'tags','2012-04-02 11:33:54'),
 (26,5,10,'Meal',NULL,NULL,'tags','2012-04-02 11:33:54'),
 (27,10,10,'Meal',NULL,NULL,'tags','2012-04-02 11:33:54'),
 (28,2,11,'Meal',NULL,NULL,'tags','2012-04-02 11:34:43'),
 (29,5,11,'Meal',NULL,NULL,'tags','2012-04-02 11:34:43'),
 (30,10,11,'Meal',NULL,NULL,'tags','2012-04-02 11:34:43'),
 (31,2,12,'Meal',NULL,NULL,'tags','2012-04-02 11:35:15'),
 (32,5,12,'Meal',NULL,NULL,'tags','2012-04-02 11:35:15'),
 (33,10,12,'Meal',NULL,NULL,'tags','2012-04-02 11:35:15'),
 (34,2,13,'Meal',NULL,NULL,'tags','2012-04-02 11:36:20'),
 (35,5,13,'Meal',NULL,NULL,'tags','2012-04-02 11:36:20'),
 (36,10,13,'Meal',NULL,NULL,'tags','2012-04-02 11:36:20'),
 (37,2,14,'Meal',NULL,NULL,'tags','2012-04-02 11:36:55'),
 (38,5,14,'Meal',NULL,NULL,'tags','2012-04-02 11:36:55'),
 (39,10,14,'Meal',NULL,NULL,'tags','2012-04-02 11:36:55'),
 (40,2,15,'Meal',NULL,NULL,'tags','2012-04-02 11:37:31'),
 (41,5,15,'Meal',NULL,NULL,'tags','2012-04-02 11:37:31'),
 (42,10,15,'Meal',NULL,NULL,'tags','2012-04-02 11:37:31'),
 (43,2,16,'Meal',NULL,NULL,'tags','2012-04-02 11:38:18'),
 (44,5,16,'Meal',NULL,NULL,'tags','2012-04-02 11:38:18'),
 (45,10,16,'Meal',NULL,NULL,'tags','2012-04-02 11:38:18'),
 (46,2,17,'Meal',NULL,NULL,'tags','2012-04-02 11:38:54'),
 (47,5,17,'Meal',NULL,NULL,'tags','2012-04-02 11:38:54'),
 (48,10,17,'Meal',NULL,NULL,'tags','2012-04-02 11:38:54'),
 (49,2,18,'Meal',NULL,NULL,'tags','2012-04-02 11:39:36'),
 (50,5,18,'Meal',NULL,NULL,'tags','2012-04-02 11:39:36'),
 (51,10,18,'Meal',NULL,NULL,'tags','2012-04-02 11:39:36'),
 (52,2,19,'Meal',NULL,NULL,'tags','2012-04-02 11:40:08'),
 (53,5,19,'Meal',NULL,NULL,'tags','2012-04-02 11:40:08'),
 (54,10,19,'Meal',NULL,NULL,'tags','2012-04-02 11:40:08'),
 (55,2,20,'Meal',NULL,NULL,'tags','2012-04-02 11:40:36'),
 (56,5,20,'Meal',NULL,NULL,'tags','2012-04-02 11:40:36'),
 (57,10,20,'Meal',NULL,NULL,'tags','2012-04-02 11:40:36'),
 (58,2,22,'Meal',NULL,NULL,'tags','2012-04-02 11:41:53'),
 (59,5,22,'Meal',NULL,NULL,'tags','2012-04-02 11:41:53'),
 (60,10,22,'Meal',NULL,NULL,'tags','2012-04-02 11:41:53'),
 (61,2,24,'Meal',NULL,NULL,'tags','2012-04-02 11:43:12'),
 (62,5,24,'Meal',NULL,NULL,'tags','2012-04-02 11:43:12'),
 (63,10,24,'Meal',NULL,NULL,'tags','2012-04-02 11:43:12'),
 (64,2,25,'Meal',NULL,NULL,'tags','2012-04-02 11:43:53'),
 (65,5,25,'Meal',NULL,NULL,'tags','2012-04-02 11:43:53'),
 (66,10,25,'Meal',NULL,NULL,'tags','2012-04-02 11:43:53'),
 (67,2,26,'Meal',NULL,NULL,'tags','2012-04-02 11:44:26'),
 (68,5,26,'Meal',NULL,NULL,'tags','2012-04-02 11:44:26'),
 (69,10,26,'Meal',NULL,NULL,'tags','2012-04-02 11:44:26'),
 (70,2,27,'Meal',NULL,NULL,'tags','2012-04-02 11:44:55'),
 (71,5,27,'Meal',NULL,NULL,'tags','2012-04-02 11:44:55'),
 (72,10,27,'Meal',NULL,NULL,'tags','2012-04-02 11:44:55'),
 (73,2,28,'Meal',NULL,NULL,'tags','2012-04-02 11:45:32'),
 (74,5,28,'Meal',NULL,NULL,'tags','2012-04-02 11:45:32'),
 (75,10,28,'Meal',NULL,NULL,'tags','2012-04-02 11:45:32'),
 (76,2,29,'Meal',NULL,NULL,'tags','2012-04-02 11:46:41'),
 (77,5,29,'Meal',NULL,NULL,'tags','2012-04-02 11:46:41'),
 (78,10,29,'Meal',NULL,NULL,'tags','2012-04-02 11:46:41'),
 (79,2,30,'Meal',NULL,NULL,'tags','2012-04-02 11:47:20'),
 (80,5,30,'Meal',NULL,NULL,'tags','2012-04-02 11:47:20'),
 (81,10,30,'Meal',NULL,NULL,'tags','2012-04-02 11:47:20'),
 (82,2,31,'Meal',NULL,NULL,'tags','2012-04-02 11:47:50'),
 (83,5,31,'Meal',NULL,NULL,'tags','2012-04-02 11:47:50'),
 (84,10,31,'Meal',NULL,NULL,'tags','2012-04-02 11:47:50'),
 (85,2,32,'Meal',NULL,NULL,'tags','2012-04-02 11:48:26'),
 (86,5,32,'Meal',NULL,NULL,'tags','2012-04-02 11:48:26'),
 (87,10,32,'Meal',NULL,NULL,'tags','2012-04-02 11:48:26'),
 (88,2,33,'Meal',NULL,NULL,'tags','2012-04-02 11:49:05'),
 (89,5,33,'Meal',NULL,NULL,'tags','2012-04-02 11:49:05'),
 (90,10,33,'Meal',NULL,NULL,'tags','2012-04-02 11:49:05'),
 (91,2,34,'Meal',NULL,NULL,'tags','2012-04-02 11:49:33'),
 (92,5,34,'Meal',NULL,NULL,'tags','2012-04-02 11:49:33'),
 (93,10,34,'Meal',NULL,NULL,'tags','2012-04-02 11:49:33'),
 (94,2,35,'Meal',NULL,NULL,'tags','2012-04-02 11:50:10'),
 (95,5,35,'Meal',NULL,NULL,'tags','2012-04-02 11:50:10'),
 (96,10,35,'Meal',NULL,NULL,'tags','2012-04-02 11:50:10'),
 (97,2,36,'Meal',NULL,NULL,'tags','2012-04-02 11:50:44'),
 (98,5,36,'Meal',NULL,NULL,'tags','2012-04-02 11:50:44'),
 (99,10,36,'Meal',NULL,NULL,'tags','2012-04-02 11:50:44'),
 (100,2,37,'Meal',NULL,NULL,'tags','2012-04-02 11:51:27'),
 (101,5,37,'Meal',NULL,NULL,'tags','2012-04-02 11:51:27'),
 (102,10,37,'Meal',NULL,NULL,'tags','2012-04-02 11:51:27'),
 (103,2,38,'Meal',NULL,NULL,'tags','2012-04-02 11:52:24'),
 (104,5,38,'Meal',NULL,NULL,'tags','2012-04-02 11:52:24'),
 (105,10,38,'Meal',NULL,NULL,'tags','2012-04-02 11:52:24'),
 (106,2,39,'Meal',NULL,NULL,'tags','2012-04-02 11:53:04'),
 (107,5,39,'Meal',NULL,NULL,'tags','2012-04-02 11:53:04'),
 (108,10,39,'Meal',NULL,NULL,'tags','2012-04-02 11:53:04'),
 (109,2,40,'Meal',NULL,NULL,'tags','2012-04-02 11:53:44'),
 (110,5,40,'Meal',NULL,NULL,'tags','2012-04-02 11:53:44'),
 (111,10,40,'Meal',NULL,NULL,'tags','2012-04-02 11:53:44'),
 (112,2,41,'Meal',NULL,NULL,'tags','2012-04-02 11:54:15'),
 (113,5,41,'Meal',NULL,NULL,'tags','2012-04-02 11:54:15'),
 (114,10,41,'Meal',NULL,NULL,'tags','2012-04-02 11:54:15'),
 (115,2,42,'Meal',NULL,NULL,'tags','2012-04-02 11:55:09'),
 (116,5,42,'Meal',NULL,NULL,'tags','2012-04-02 11:55:09'),
 (117,10,42,'Meal',NULL,NULL,'tags','2012-04-02 11:55:09'),
 (118,2,43,'Meal',NULL,NULL,'tags','2012-04-09 09:07:00'),
 (119,11,43,'Meal',NULL,NULL,'tags','2012-04-09 09:07:00'),
 (120,12,43,'Meal',NULL,NULL,'tags','2012-04-09 09:07:00'),
 (121,13,43,'Meal',NULL,NULL,'tags','2012-04-09 09:07:00'),
 (122,13,44,'Meal',NULL,NULL,'tags','2012-04-09 09:13:08'),
 (123,14,44,'Meal',NULL,NULL,'tags','2012-04-09 09:13:08'),
 (124,15,44,'Meal',NULL,NULL,'tags','2012-04-09 09:13:08'),
 (125,16,44,'Meal',NULL,NULL,'tags','2012-04-09 09:13:08'),
 (126,5,45,'Meal',NULL,NULL,'tags','2012-04-09 09:15:15'),
 (127,16,45,'Meal',NULL,NULL,'tags','2012-04-09 09:15:15'),
 (128,17,45,'Meal',NULL,NULL,'tags','2012-04-09 09:15:15'),
 (129,18,45,'Meal',NULL,NULL,'tags','2012-04-09 09:15:15'),
 (130,11,46,'Meal',NULL,NULL,'tags','2012-04-09 09:21:38'),
 (131,18,46,'Meal',NULL,NULL,'tags','2012-04-09 09:21:38'),
 (132,19,46,'Meal',NULL,NULL,'tags','2012-04-09 09:21:38'),
 (133,20,46,'Meal',NULL,NULL,'tags','2012-04-09 09:21:38'),
 (134,21,46,'Meal',NULL,NULL,'tags','2012-04-09 09:21:38'),
 (135,22,46,'Meal',NULL,NULL,'tags','2012-04-09 09:21:38'),
 (136,6,47,'Meal',NULL,NULL,'tags','2012-04-09 09:23:30'),
 (137,11,47,'Meal',NULL,NULL,'tags','2012-04-09 09:23:30'),
 (138,20,47,'Meal',NULL,NULL,'tags','2012-04-09 09:23:30'),
 (139,23,47,'Meal',NULL,NULL,'tags','2012-04-09 09:23:30'),
 (140,24,47,'Meal',NULL,NULL,'tags','2012-04-09 09:23:30'),
 (141,2,48,'Meal',NULL,NULL,'tags','2012-04-09 09:27:37'),
 (142,11,48,'Meal',NULL,NULL,'tags','2012-04-09 09:27:37'),
 (143,13,48,'Meal',NULL,NULL,'tags','2012-04-09 09:27:37'),
 (144,25,48,'Meal',NULL,NULL,'tags','2012-04-09 09:27:37'),
 (145,26,48,'Meal',NULL,NULL,'tags','2012-04-09 09:27:37'),
 (146,11,49,'Meal',NULL,NULL,'tags','2012-04-09 09:29:29'),
 (147,13,49,'Meal',NULL,NULL,'tags','2012-04-09 09:29:29'),
 (148,14,49,'Meal',NULL,NULL,'tags','2012-04-09 09:29:29'),
 (149,24,49,'Meal',NULL,NULL,'tags','2012-04-09 09:29:29'),
 (150,5,50,'Meal',NULL,NULL,'tags','2012-04-09 09:30:42'),
 (151,11,50,'Meal',NULL,NULL,'tags','2012-04-09 09:30:42'),
 (152,13,50,'Meal',NULL,NULL,'tags','2012-04-09 09:30:42'),
 (153,25,50,'Meal',NULL,NULL,'tags','2012-04-09 09:30:42'),
 (154,13,51,'Meal',NULL,NULL,'tags','2012-04-09 09:32:29'),
 (155,16,51,'Meal',NULL,NULL,'tags','2012-04-09 09:32:29'),
 (156,19,51,'Meal',NULL,NULL,'tags','2012-04-09 09:32:29'),
 (157,24,51,'Meal',NULL,NULL,'tags','2012-04-09 09:32:29'),
 (158,27,51,'Meal',NULL,NULL,'tags','2012-04-09 09:32:29'),
 (159,13,52,'Meal',NULL,NULL,'tags','2012-04-09 09:34:19'),
 (160,16,52,'Meal',NULL,NULL,'tags','2012-04-09 09:34:19'),
 (161,24,52,'Meal',NULL,NULL,'tags','2012-04-09 09:34:19'),
 (162,28,52,'Meal',NULL,NULL,'tags','2012-04-09 09:34:19'),
 (163,29,52,'Meal',NULL,NULL,'tags','2012-04-09 09:34:19'),
 (164,2,53,'Meal',NULL,NULL,'tags','2012-04-09 09:38:12'),
 (165,11,53,'Meal',NULL,NULL,'tags','2012-04-09 09:38:12'),
 (166,23,53,'Meal',NULL,NULL,'tags','2012-04-09 09:38:12'),
 (167,30,53,'Meal',NULL,NULL,'tags','2012-04-09 09:38:12'),
 (168,11,54,'Meal',NULL,NULL,'tags','2012-04-09 09:39:59'),
 (169,14,54,'Meal',NULL,NULL,'tags','2012-04-09 09:39:59'),
 (170,31,54,'Meal',NULL,NULL,'tags','2012-04-09 09:39:59'),
 (171,3,55,'Meal',NULL,NULL,'tags','2012-04-09 09:41:26'),
 (172,5,55,'Meal',NULL,NULL,'tags','2012-04-09 09:41:26'),
 (173,11,55,'Meal',NULL,NULL,'tags','2012-04-09 09:41:26'),
 (174,19,56,'Meal',NULL,NULL,'tags','2012-04-09 09:42:55'),
 (175,32,56,'Meal',NULL,NULL,'tags','2012-04-09 09:42:55'),
 (176,33,56,'Meal',NULL,NULL,'tags','2012-04-09 09:42:55'),
 (177,34,57,'Meal',NULL,NULL,'tags','2012-04-09 09:44:27'),
 (178,35,57,'Meal',NULL,NULL,'tags','2012-04-09 09:44:27'),
 (179,36,57,'Meal',NULL,NULL,'tags','2012-04-09 09:44:27'),
 (180,2,58,'Meal',NULL,NULL,'tags','2012-04-09 09:51:15'),
 (181,6,58,'Meal',NULL,NULL,'tags','2012-04-09 09:51:15'),
 (182,37,58,'Meal',NULL,NULL,'tags','2012-04-09 09:51:15'),
 (183,14,59,'Meal',NULL,NULL,'tags','2012-04-09 09:52:45'),
 (184,16,59,'Meal',NULL,NULL,'tags','2012-04-09 09:52:45'),
 (185,24,59,'Meal',NULL,NULL,'tags','2012-04-09 09:52:45'),
 (186,38,59,'Meal',NULL,NULL,'tags','2012-04-09 09:52:45'),
 (187,5,60,'Meal',NULL,NULL,'tags','2012-04-09 09:54:05'),
 (188,11,60,'Meal',NULL,NULL,'tags','2012-04-09 09:54:05'),
 (189,24,60,'Meal',NULL,NULL,'tags','2012-04-09 09:54:05'),
 (190,39,60,'Meal',NULL,NULL,'tags','2012-04-09 09:54:05'),
 (191,11,61,'Meal',NULL,NULL,'tags','2012-04-09 09:55:21'),
 (192,19,61,'Meal',NULL,NULL,'tags','2012-04-09 09:55:21'),
 (193,31,61,'Meal',NULL,NULL,'tags','2012-04-09 09:55:21'),
 (194,13,62,'Meal',NULL,NULL,'tags','2012-04-09 09:58:21'),
 (195,16,62,'Meal',NULL,NULL,'tags','2012-04-09 09:58:21'),
 (196,24,62,'Meal',NULL,NULL,'tags','2012-04-09 09:58:21'),
 (197,28,62,'Meal',NULL,NULL,'tags','2012-04-09 09:58:21'),
 (198,29,62,'Meal',NULL,NULL,'tags','2012-04-09 09:58:21'),
 (199,2,63,'Meal',NULL,NULL,'tags','2012-04-09 10:01:14'),
 (200,18,63,'Meal',NULL,NULL,'tags','2012-04-09 10:01:14'),
 (201,24,63,'Meal',NULL,NULL,'tags','2012-04-09 10:01:14'),
 (202,31,63,'Meal',NULL,NULL,'tags','2012-04-09 10:01:14'),
 (203,10,64,'Meal',NULL,NULL,'tags','2012-04-09 10:02:41'),
 (204,14,64,'Meal',NULL,NULL,'tags','2012-04-09 10:02:41'),
 (205,24,64,'Meal',NULL,NULL,'tags','2012-04-09 10:02:41'),
 (206,5,65,'Meal',NULL,NULL,'tags','2012-04-09 10:04:19'),
 (207,13,65,'Meal',NULL,NULL,'tags','2012-04-09 10:04:19'),
 (208,18,65,'Meal',NULL,NULL,'tags','2012-04-09 10:04:19'),
 (209,24,65,'Meal',NULL,NULL,'tags','2012-04-09 10:04:19'),
 (210,18,66,'Meal',NULL,NULL,'tags','2012-04-09 10:05:28'),
 (211,19,66,'Meal',NULL,NULL,'tags','2012-04-09 10:05:28'),
 (212,24,66,'Meal',NULL,NULL,'tags','2012-04-09 10:05:28'),
 (213,24,67,'Meal',NULL,NULL,'tags','2012-04-09 10:07:02'),
 (214,31,67,'Meal',NULL,NULL,'tags','2012-04-09 10:07:02'),
 (215,38,67,'Meal',NULL,NULL,'tags','2012-04-09 10:07:02'),
 (216,2,68,'Meal',NULL,NULL,'tags','2012-04-09 10:08:29'),
 (217,11,68,'Meal',NULL,NULL,'tags','2012-04-09 10:08:29'),
 (218,13,68,'Meal',NULL,NULL,'tags','2012-04-09 10:08:29'),
 (219,25,68,'Meal',NULL,NULL,'tags','2012-04-09 10:08:29'),
 (220,26,68,'Meal',NULL,NULL,'tags','2012-04-09 10:08:29'),
 (221,14,69,'Meal',NULL,NULL,'tags','2012-04-09 10:09:33'),
 (222,18,69,'Meal',NULL,NULL,'tags','2012-04-09 10:09:33'),
 (223,24,69,'Meal',NULL,NULL,'tags','2012-04-09 10:09:33'),
 (224,13,70,'Meal',NULL,NULL,'tags','2012-04-09 10:10:12'),
 (225,16,70,'Meal',NULL,NULL,'tags','2012-04-09 10:10:12'),
 (226,24,70,'Meal',NULL,NULL,'tags','2012-04-09 10:10:12'),
 (227,28,70,'Meal',NULL,NULL,'tags','2012-04-09 10:10:12'),
 (228,29,70,'Meal',NULL,NULL,'tags','2012-04-09 10:10:12'),
 (229,13,71,'Meal',NULL,NULL,'tags','2012-04-09 10:11:21'),
 (230,16,71,'Meal',NULL,NULL,'tags','2012-04-09 10:11:21'),
 (231,24,71,'Meal',NULL,NULL,'tags','2012-04-09 10:11:21'),
 (232,28,71,'Meal',NULL,NULL,'tags','2012-04-09 10:11:21'),
 (233,29,71,'Meal',NULL,NULL,'tags','2012-04-09 10:11:21'),
 (234,2,72,'Meal',NULL,NULL,'tags','2012-04-09 10:12:01'),
 (235,11,72,'Meal',NULL,NULL,'tags','2012-04-09 10:12:01'),
 (236,13,72,'Meal',NULL,NULL,'tags','2012-04-09 10:12:01'),
 (237,25,72,'Meal',NULL,NULL,'tags','2012-04-09 10:12:01'),
 (238,26,72,'Meal',NULL,NULL,'tags','2012-04-09 10:12:01'),
 (239,2,73,'Meal',NULL,NULL,'tags','2012-04-14 13:09:53'),
 (240,16,73,'Meal',NULL,NULL,'tags','2012-04-14 13:09:53'),
 (241,37,73,'Meal',NULL,NULL,'tags','2012-04-14 13:09:53'),
 (242,40,73,'Meal',NULL,NULL,'tags','2012-04-14 13:09:53'),
 (243,14,74,'Meal',NULL,NULL,'tags','2012-04-14 13:11:47'),
 (244,16,74,'Meal',NULL,NULL,'tags','2012-04-14 13:11:47'),
 (245,24,74,'Meal',NULL,NULL,'tags','2012-04-14 13:11:47'),
 (246,5,75,'Meal',NULL,NULL,'tags','2012-04-14 13:13:36'),
 (247,11,75,'Meal',NULL,NULL,'tags','2012-04-14 13:13:36'),
 (248,23,75,'Meal',NULL,NULL,'tags','2012-04-14 13:13:36'),
 (249,24,75,'Meal',NULL,NULL,'tags','2012-04-14 13:13:36'),
 (250,11,76,'Meal',NULL,NULL,'tags','2012-04-14 13:15:04'),
 (251,23,76,'Meal',NULL,NULL,'tags','2012-04-14 13:15:04'),
 (252,41,76,'Meal',NULL,NULL,'tags','2012-04-14 13:15:04'),
 (253,13,77,'Meal',NULL,NULL,'tags','2012-04-14 13:16:24'),
 (254,24,77,'Meal',NULL,NULL,'tags','2012-04-14 13:16:24'),
 (255,28,77,'Meal',NULL,NULL,'tags','2012-04-14 13:16:24'),
 (256,7,78,'Meal',NULL,NULL,'tags','2012-04-14 13:20:31'),
 (257,18,78,'Meal',NULL,NULL,'tags','2012-04-14 13:20:31'),
 (258,23,78,'Meal',NULL,NULL,'tags','2012-04-14 13:20:31'),
 (259,24,78,'Meal',NULL,NULL,'tags','2012-04-14 13:20:31'),
 (260,10,79,'Meal',NULL,NULL,'tags','2012-04-14 13:22:06'),
 (261,14,79,'Meal',NULL,NULL,'tags','2012-04-14 13:22:06'),
 (262,24,79,'Meal',NULL,NULL,'tags','2012-04-14 13:22:06'),
 (263,5,80,'Meal',NULL,NULL,'tags','2012-04-14 13:30:07'),
 (264,18,80,'Meal',NULL,NULL,'tags','2012-04-14 13:30:07'),
 (265,24,80,'Meal',NULL,NULL,'tags','2012-04-14 13:30:07'),
 (266,18,81,'Meal',NULL,NULL,'tags','2012-04-14 13:32:19'),
 (267,19,81,'Meal',NULL,NULL,'tags','2012-04-14 13:32:19'),
 (268,24,81,'Meal',NULL,NULL,'tags','2012-04-14 13:32:19'),
 (269,18,82,'Meal',NULL,NULL,'tags','2012-04-14 13:33:39'),
 (270,24,82,'Meal',NULL,NULL,'tags','2012-04-14 13:33:39'),
 (271,28,82,'Meal',NULL,NULL,'tags','2012-04-14 13:33:39'),
 (272,2,83,'Meal',NULL,NULL,'tags','2012-04-14 13:35:45'),
 (273,18,83,'Meal',NULL,NULL,'tags','2012-04-14 13:35:45'),
 (274,24,83,'Meal',NULL,NULL,'tags','2012-04-14 13:35:45'),
 (275,14,84,'Meal',NULL,NULL,'tags','2012-04-14 13:37:14'),
 (276,18,84,'Meal',NULL,NULL,'tags','2012-04-14 13:37:14'),
 (277,24,84,'Meal',NULL,NULL,'tags','2012-04-14 13:37:14'),
 (278,5,85,'Meal',NULL,NULL,'tags','2012-04-14 13:38:35'),
 (279,18,85,'Meal',NULL,NULL,'tags','2012-04-14 13:38:35'),
 (280,24,85,'Meal',NULL,NULL,'tags','2012-04-14 13:38:35'),
 (281,42,85,'Meal',NULL,NULL,'tags','2012-04-14 13:38:35'),
 (282,23,86,'Meal',NULL,NULL,'tags','2012-04-14 13:40:00'),
 (283,24,86,'Meal',NULL,NULL,'tags','2012-04-14 13:40:00'),
 (284,41,86,'Meal',NULL,NULL,'tags','2012-04-14 13:40:00'),
 (285,3,87,'Meal',NULL,NULL,'tags','2012-04-14 13:41:28'),
 (286,11,87,'Meal',NULL,NULL,'tags','2012-04-14 13:41:28'),
 (287,28,87,'Meal',NULL,NULL,'tags','2012-04-14 13:41:28');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;


--
-- Definition of table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tags`
--

/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`,`name`) VALUES 
 (1,'onion'),
 (2,'chicken'),
 (3,'spicy'),
 (4,'burger'),
 (5,'beef'),
 (6,'cheese'),
 (7,'chiken'),
 (8,'bhatoore'),
 (9,'chhole'),
 (10,'pizza'),
 (11,'Rice'),
 (12,'Riata'),
 (13,'salad'),
 (14,'Lamb'),
 (15,'Curry/Gravy'),
 (16,'Bread'),
 (17,'South indian'),
 (18,'starter'),
 (19,'Seafood'),
 (20,'Raita'),
 (21,'pickel'),
 (22,'Thi'),
 (23,'Vegetables'),
 (24,'Drink'),
 (25,'Soup'),
 (26,'Moroccan'),
 (27,'Iranian'),
 (28,'Vegetable'),
 (29,'Labanese'),
 (30,'Japanese'),
 (31,'Vagetables'),
 (32,'Nuts'),
 (33,'Vagetabls'),
 (34,'Vagetable'),
 (35,'chinese'),
 (36,'Noodles'),
 (37,'Egg'),
 (38,'sarter'),
 (39,'Vagatables'),
 (40,'Cheeze'),
 (41,'Seefood'),
 (42,'Russian');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;


--
-- Definition of table `targets`
--

DROP TABLE IF EXISTS `targets`;
CREATE TABLE `targets` (
  `id` int(11) NOT NULL auto_increment,
  `amount` int(11) default NULL,
  `yday` int(11) default NULL,
  `cuisine_id` int(11) default NULL,
  `cluster_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `frozen` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `targets`
--

/*!40000 ALTER TABLE `targets` DISABLE KEYS */;
INSERT INTO `targets` (`id`,`amount`,`yday`,`cuisine_id`,`cluster_id`,`created_at`,`updated_at`,`frozen`) VALUES 
 (67,10,353,6,3,'2011-12-19 09:25:01','2011-12-19 09:27:11',NULL),
 (68,10,353,2,3,'2011-12-19 09:25:01','2011-12-19 09:27:12',NULL),
 (69,10,353,3,3,'2011-12-19 09:25:01','2011-12-19 09:27:13',NULL),
 (70,10,353,5,3,'2011-12-19 09:25:01','2011-12-19 09:27:14',NULL),
 (71,10,353,4,3,'2011-12-19 09:25:01','2011-12-19 09:27:15',NULL),
 (72,10,353,7,3,'2011-12-19 09:25:01','2011-12-19 09:27:15',NULL),
 (73,10,353,6,1,'2011-12-19 09:25:01','2011-12-19 09:27:43',NULL),
 (74,10,353,2,1,'2011-12-19 09:25:01','2011-12-19 09:27:48',NULL),
 (75,10,353,3,1,'2011-12-19 09:25:01','2011-12-19 09:27:49',NULL),
 (76,10,353,5,1,'2011-12-19 09:25:01','2011-12-19 09:27:49',NULL),
 (77,10,353,4,1,'2011-12-19 09:25:01','2011-12-19 09:27:50',NULL),
 (78,10,353,7,1,'2011-12-19 09:25:01','2011-12-19 09:27:51',NULL),
 (79,10,353,6,2,'2011-12-19 09:25:01','2011-12-19 09:27:51',NULL),
 (80,20,353,2,2,'2011-12-19 09:25:01','2011-12-19 09:27:52',NULL),
 (81,20,353,3,2,'2011-12-19 09:25:01','2011-12-19 09:27:52',NULL),
 (82,20,353,5,2,'2011-12-19 09:25:01','2011-12-19 09:27:53',NULL),
 (83,20,353,4,2,'2011-12-19 09:25:01','2011-12-19 11:36:35',NULL),
 (84,29,353,7,2,'2011-12-19 09:25:01','2011-12-19 09:27:54',NULL),
 (85,NULL,354,6,3,'2011-12-19 09:29:02','2011-12-19 09:29:02',NULL),
 (86,NULL,354,2,3,'2011-12-19 09:29:02','2011-12-19 09:29:02',NULL),
 (87,NULL,354,3,3,'2011-12-19 09:29:02','2011-12-19 09:29:02',NULL),
 (88,NULL,354,5,3,'2011-12-19 09:29:02','2011-12-19 09:29:02',NULL),
 (89,NULL,354,4,3,'2011-12-19 09:29:02','2011-12-19 09:29:02',NULL),
 (90,NULL,354,7,3,'2011-12-19 09:29:02','2011-12-19 09:29:02',NULL),
 (91,NULL,354,6,1,'2011-12-19 09:29:02','2011-12-19 09:29:02',NULL),
 (92,NULL,354,2,1,'2011-12-19 09:29:02','2011-12-19 09:29:02',NULL),
 (93,NULL,354,3,1,'2011-12-19 09:29:02','2011-12-19 09:29:02',NULL),
 (94,NULL,354,5,1,'2011-12-19 09:29:02','2011-12-19 09:29:02',NULL),
 (95,NULL,354,4,1,'2011-12-19 09:29:02','2011-12-19 09:29:02',NULL),
 (96,NULL,354,7,1,'2011-12-19 09:29:02','2011-12-19 09:29:02',NULL),
 (97,33,354,6,2,'2011-12-19 09:29:02','2011-12-19 09:29:06',NULL),
 (98,22,354,2,2,'2011-12-19 09:29:02','2011-12-19 09:29:14',NULL),
 (99,25,354,3,2,'2011-12-19 09:29:02','2011-12-19 09:29:12',NULL),
 (100,22,354,5,2,'2011-12-19 09:29:03','2011-12-19 09:29:10',NULL),
 (101,39,354,4,2,'2011-12-19 09:29:03','2011-12-19 09:29:08',NULL),
 (102,10,354,7,2,'2011-12-19 09:29:03','2011-12-19 09:29:16',NULL),
 (103,NULL,355,6,3,'2011-12-19 09:29:18','2011-12-19 09:29:18',NULL),
 (104,NULL,355,2,3,'2011-12-19 09:29:18','2011-12-19 09:29:18',NULL),
 (105,NULL,355,3,3,'2011-12-19 09:29:18','2011-12-19 09:29:18',NULL),
 (106,NULL,355,5,3,'2011-12-19 09:29:18','2011-12-19 09:29:18',NULL),
 (107,NULL,355,4,3,'2011-12-19 09:29:18','2011-12-19 09:29:18',NULL),
 (108,NULL,355,7,3,'2011-12-19 09:29:18','2011-12-19 09:29:18',NULL),
 (109,NULL,355,6,1,'2011-12-19 09:29:18','2011-12-19 09:29:18',NULL),
 (110,NULL,355,2,1,'2011-12-19 09:29:18','2011-12-19 09:29:18',NULL),
 (111,NULL,355,3,1,'2011-12-19 09:29:18','2011-12-19 09:29:18',NULL),
 (112,NULL,355,5,1,'2011-12-19 09:29:18','2011-12-19 09:29:18',NULL),
 (113,NULL,355,4,1,'2011-12-19 09:29:18','2011-12-19 09:29:18',NULL),
 (114,NULL,355,7,1,'2011-12-19 09:29:18','2011-12-19 09:29:18',NULL),
 (115,10,355,6,2,'2011-12-19 09:29:18','2011-12-19 09:29:22',NULL),
 (116,10,355,2,2,'2011-12-19 09:29:18','2011-12-19 09:29:23',NULL),
 (117,20,355,3,2,'2011-12-19 09:29:18','2011-12-19 09:29:25',NULL),
 (118,30,355,5,2,'2011-12-19 09:29:18','2011-12-19 09:29:27',NULL),
 (119,40,355,4,2,'2011-12-19 09:29:18','2011-12-19 09:29:28',NULL),
 (120,20,355,7,2,'2011-12-19 09:29:18','2011-12-19 09:29:30',NULL),
 (121,NULL,356,6,3,'2011-12-19 11:37:29','2011-12-19 11:37:29',NULL),
 (122,NULL,356,2,3,'2011-12-19 11:37:29','2011-12-19 11:37:29',NULL),
 (123,NULL,356,3,3,'2011-12-19 11:37:29','2011-12-19 11:37:29',NULL),
 (124,NULL,356,5,3,'2011-12-19 11:37:29','2011-12-19 11:37:29',NULL),
 (125,NULL,356,4,3,'2011-12-19 11:37:29','2011-12-19 11:37:29',NULL),
 (126,NULL,356,7,3,'2011-12-19 11:37:29','2011-12-19 11:37:29',NULL),
 (127,NULL,356,6,1,'2011-12-19 11:37:29','2011-12-19 11:37:29',NULL),
 (128,NULL,356,2,1,'2011-12-19 11:37:29','2011-12-19 11:37:29',NULL),
 (129,NULL,356,3,1,'2011-12-19 11:37:29','2011-12-19 11:37:29',NULL),
 (130,NULL,356,5,1,'2011-12-19 11:37:29','2011-12-19 11:37:29',NULL),
 (131,NULL,356,4,1,'2011-12-19 11:37:29','2011-12-19 11:37:29',NULL),
 (132,NULL,356,7,1,'2011-12-19 11:37:29','2011-12-19 11:37:29',NULL),
 (133,15,356,6,2,'2011-12-19 11:37:29','2011-12-19 11:48:44',NULL),
 (134,15,356,2,2,'2011-12-19 11:37:29','2011-12-19 11:48:45',NULL),
 (135,12,356,3,2,'2011-12-19 11:37:29','2011-12-19 11:48:46',NULL),
 (136,20,356,5,2,'2011-12-19 11:37:29','2011-12-19 11:48:47',NULL),
 (137,10,356,4,2,'2011-12-19 11:37:29','2011-12-19 11:48:41',NULL),
 (138,15,356,7,2,'2011-12-19 11:37:29','2011-12-19 11:48:49',NULL),
 (139,NULL,357,6,3,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (140,NULL,357,2,3,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (141,NULL,357,3,3,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (142,NULL,357,5,3,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (143,NULL,357,4,3,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (144,NULL,357,7,3,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (145,NULL,357,6,1,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (146,NULL,357,2,1,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (147,NULL,357,3,1,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (148,NULL,357,5,1,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (149,NULL,357,4,1,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (150,NULL,357,7,1,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (151,NULL,357,6,2,'2011-12-22 19:27:38','2011-12-22 19:27:38',NULL),
 (152,NULL,357,2,2,'2011-12-22 19:27:39','2011-12-22 19:27:39',NULL),
 (153,NULL,357,3,2,'2011-12-22 19:27:39','2011-12-22 19:27:39',NULL),
 (154,NULL,357,5,2,'2011-12-22 19:27:39','2011-12-22 19:27:39',NULL),
 (155,NULL,357,4,2,'2011-12-22 19:27:39','2011-12-22 19:27:39',NULL),
 (156,NULL,357,7,2,'2011-12-22 19:27:39','2011-12-22 19:27:39',NULL),
 (157,NULL,358,6,3,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (158,NULL,358,2,3,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (159,NULL,358,3,3,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (160,NULL,358,5,3,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (161,NULL,358,4,3,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (162,NULL,358,7,3,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (163,NULL,358,6,1,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (164,NULL,358,2,1,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (165,NULL,358,3,1,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (166,NULL,358,5,1,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (167,NULL,358,4,1,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (168,NULL,358,7,1,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (169,NULL,358,6,2,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (170,NULL,358,2,2,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (171,NULL,358,3,2,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (172,NULL,358,5,2,'2011-12-22 19:27:48','2011-12-22 19:27:48',NULL),
 (173,NULL,358,4,2,'2011-12-22 19:27:49','2011-12-22 19:27:49',NULL),
 (174,NULL,358,7,2,'2011-12-22 19:27:49','2011-12-22 19:27:49',NULL),
 (175,10,361,6,3,'2011-12-27 02:47:22','2011-12-27 03:20:49',NULL),
 (176,20,361,2,3,'2011-12-27 02:47:22','2011-12-27 03:21:01',NULL),
 (177,30,361,3,3,'2011-12-27 02:47:22','2011-12-27 03:21:04',NULL),
 (178,25,361,5,3,'2011-12-27 02:47:22','2011-12-27 03:21:06',NULL),
 (179,22,361,4,3,'2011-12-27 02:47:22','2011-12-27 03:21:09',NULL),
 (180,12,361,7,3,'2011-12-27 02:47:22','2011-12-27 03:21:11',NULL),
 (181,11,361,6,1,'2011-12-27 02:47:22','2011-12-27 03:21:13',NULL),
 (182,12,361,2,1,'2011-12-27 02:47:22','2011-12-27 03:21:15',NULL),
 (183,20,361,3,1,'2011-12-27 02:47:22','2011-12-27 03:21:16',NULL),
 (184,20,361,5,1,'2011-12-27 02:47:22','2011-12-27 03:21:18',NULL),
 (185,20,361,4,1,'2011-12-27 02:47:22','2011-12-27 03:21:19',NULL),
 (186,20,361,7,1,'2011-12-27 02:47:22','2011-12-27 03:21:20',NULL),
 (187,20,361,6,2,'2011-12-27 02:47:22','2011-12-27 03:21:22',NULL),
 (188,11,361,2,2,'2011-12-27 02:47:22','2011-12-27 03:21:23',NULL),
 (189,13,361,3,2,'2011-12-27 02:47:23','2011-12-27 03:21:25',NULL),
 (190,15,361,5,2,'2011-12-27 02:47:23','2011-12-27 03:21:27',NULL),
 (191,14,361,4,2,'2011-12-27 02:47:23','2011-12-27 03:21:28',NULL),
 (192,15,361,7,2,'2011-12-27 02:47:23','2011-12-27 03:21:30',NULL),
 (193,NULL,7,6,3,'2011-12-27 02:47:36','2011-12-27 02:47:36',NULL),
 (194,NULL,7,2,3,'2011-12-27 02:47:36','2011-12-27 02:47:36',NULL),
 (195,NULL,7,3,3,'2011-12-27 02:47:36','2011-12-27 02:47:36',NULL),
 (196,NULL,7,5,3,'2011-12-27 02:47:36','2011-12-27 02:47:36',NULL),
 (197,NULL,7,4,3,'2011-12-27 02:47:36','2011-12-27 02:47:36',NULL),
 (198,NULL,7,7,3,'2011-12-27 02:47:36','2011-12-27 02:47:36',NULL),
 (199,NULL,7,6,1,'2011-12-27 02:47:36','2011-12-27 02:47:36',NULL),
 (200,NULL,7,2,1,'2011-12-27 02:47:36','2011-12-27 02:47:36',NULL),
 (201,NULL,7,3,1,'2011-12-27 02:47:36','2011-12-27 02:47:36',NULL),
 (202,NULL,7,5,1,'2011-12-27 02:47:37','2011-12-27 02:47:37',NULL),
 (203,NULL,7,4,1,'2011-12-27 02:47:37','2011-12-27 02:47:37',NULL),
 (204,NULL,7,7,1,'2011-12-27 02:47:37','2011-12-27 02:47:37',NULL),
 (205,NULL,7,6,2,'2011-12-27 02:47:37','2011-12-27 02:47:37',NULL),
 (206,NULL,7,2,2,'2011-12-27 02:47:37','2011-12-27 02:47:37',NULL),
 (207,NULL,7,3,2,'2011-12-27 02:47:37','2011-12-27 02:47:37',NULL),
 (208,NULL,7,5,2,'2011-12-27 02:47:37','2011-12-27 02:47:37',NULL),
 (209,NULL,7,4,2,'2011-12-27 02:47:37','2011-12-27 02:47:37',NULL),
 (210,NULL,7,7,2,'2011-12-27 02:47:37','2011-12-27 02:47:37',NULL),
 (212,10,1,6,NULL,'2011-12-27 03:22:43','2011-12-27 03:22:43',NULL),
 (213,10,1,6,3,'2011-12-27 03:26:17','2011-12-27 03:26:17',NULL),
 (214,10,1,6,2,'2011-12-27 03:26:42','2011-12-27 03:26:42',NULL),
 (215,12,1,2,2,'2011-12-27 03:26:44','2011-12-27 03:26:44',NULL),
 (216,12,1,3,2,'2011-12-27 03:26:45','2011-12-27 03:26:45',NULL),
 (217,21,1,5,2,'2011-12-27 03:26:46','2011-12-27 03:26:46',NULL),
 (218,12,1,4,2,'2011-12-27 03:26:47','2011-12-27 03:26:47',NULL),
 (219,12,1,7,2,'2011-12-27 03:26:49','2011-12-27 03:26:49',NULL),
 (220,10,362,6,3,'2011-12-28 08:29:23','2011-12-28 08:29:23',NULL),
 (221,10,362,2,3,'2011-12-28 08:29:24','2011-12-28 08:29:24',NULL),
 (222,10,362,3,3,'2011-12-28 08:29:25','2011-12-28 08:29:25',NULL),
 (223,10,362,5,3,'2011-12-28 08:29:26','2011-12-28 08:29:26',NULL),
 (224,10,362,4,3,'2011-12-28 08:29:28','2011-12-28 08:29:28',NULL),
 (225,10,362,7,3,'2011-12-28 08:29:28','2011-12-28 08:29:28',NULL),
 (226,10,362,6,1,'2011-12-28 08:29:31','2011-12-28 08:29:31',NULL),
 (227,10,362,2,1,'2011-12-28 08:29:32','2011-12-28 08:29:32',NULL),
 (228,10,362,3,1,'2011-12-28 08:29:33','2011-12-28 08:29:33',NULL),
 (229,10,362,5,1,'2011-12-28 08:29:34','2011-12-28 08:29:34',NULL),
 (230,10,362,4,1,'2011-12-28 08:29:35','2011-12-28 08:29:35',NULL),
 (231,10,362,7,1,'2011-12-28 08:29:36','2011-12-28 08:29:36',NULL),
 (232,10,362,6,2,'2011-12-28 08:29:37','2011-12-28 08:29:37',NULL),
 (233,10,362,2,2,'2011-12-28 08:29:38','2011-12-28 08:29:38',NULL),
 (234,10,362,3,2,'2011-12-28 08:29:39','2011-12-28 08:29:39',NULL),
 (235,10,362,5,2,'2011-12-28 08:29:41','2011-12-28 08:29:41',NULL),
 (236,10,362,4,2,'2011-12-28 08:29:42','2011-12-28 08:29:42',NULL),
 (237,10,362,7,2,'2011-12-28 08:29:43','2011-12-28 08:29:43',NULL),
 (238,10,8,6,3,'2012-01-08 02:33:21','2012-01-08 02:33:21',NULL),
 (239,10,8,2,3,'2012-01-08 02:33:23','2012-01-08 02:33:23',NULL),
 (240,10,8,3,3,'2012-01-08 02:33:24','2012-01-08 02:33:24',NULL),
 (241,10,8,5,3,'2012-01-08 02:33:25','2012-01-08 02:33:25',NULL),
 (242,10,8,4,3,'2012-01-08 02:33:25','2012-01-08 02:33:25',NULL),
 (243,10,8,7,3,'2012-01-08 02:33:26','2012-01-08 02:33:26',NULL),
 (244,20,8,6,1,'2012-01-08 02:33:31','2012-01-08 02:33:31',NULL),
 (245,20,8,2,1,'2012-01-08 02:33:32','2012-01-08 02:33:32',NULL),
 (246,20,8,3,1,'2012-01-08 02:33:33','2012-01-08 02:33:33',NULL),
 (247,20,8,5,1,'2012-01-08 02:33:34','2012-01-08 02:33:34',NULL),
 (248,20,8,4,1,'2012-01-08 02:33:35','2012-01-08 02:33:35',NULL),
 (249,20,8,7,1,'2012-01-08 02:33:36','2012-01-08 02:33:36',NULL),
 (250,10,8,6,2,'2012-01-08 02:33:39','2012-01-08 02:33:39',NULL),
 (251,10,8,2,2,'2012-01-08 02:33:40','2012-01-08 02:33:40',NULL),
 (252,10,8,3,2,'2012-01-08 02:33:40','2012-01-08 02:33:40',NULL),
 (253,10,8,5,2,'2012-01-08 02:33:41','2012-01-08 02:33:41',NULL),
 (254,10,8,4,2,'2012-01-08 02:33:42','2012-01-08 03:00:07',1),
 (255,10,8,7,2,'2012-01-08 02:33:43','2012-01-08 02:33:43',NULL),
 (256,10,13,6,3,'2012-01-13 09:30:06','2012-01-13 09:30:06',NULL),
 (257,10,13,6,3,'2012-01-13 09:30:09','2012-01-13 09:30:09',NULL),
 (258,20,13,2,3,'2012-01-13 09:30:13','2012-01-13 09:30:13',NULL),
 (259,10,13,3,3,'2012-01-13 09:30:16','2012-01-13 09:30:16',NULL),
 (260,10,13,6,2,'2012-01-13 09:30:28','2012-01-13 09:30:28',NULL),
 (261,10,13,2,2,'2012-01-13 09:30:32','2012-01-13 09:30:32',NULL),
 (262,20,13,3,2,'2012-01-13 09:30:33','2012-01-13 09:30:33',NULL),
 (263,20,13,5,2,'2012-01-13 09:30:35','2012-01-13 09:30:35',NULL),
 (264,20,13,4,2,'2012-01-13 09:30:38','2012-01-13 09:33:50',1),
 (265,30,13,7,2,'2012-01-13 09:30:41','2012-01-13 09:30:41',NULL),
 (266,10,15,6,2,'2012-01-15 06:56:23','2012-01-15 06:56:23',NULL),
 (267,10,15,2,2,'2012-01-15 06:56:24','2012-01-15 06:56:24',NULL),
 (268,10,15,3,2,'2012-01-15 06:56:25','2012-01-15 06:56:25',NULL),
 (269,10,15,5,2,'2012-01-15 06:56:26','2012-01-15 06:56:26',NULL),
 (270,10,15,4,2,'2012-01-15 06:56:26','2012-01-15 06:57:25',1),
 (271,10,15,7,2,'2012-01-15 06:56:27','2012-01-15 06:56:27',NULL),
 (272,10,25,6,3,'2012-01-25 08:48:50','2012-01-25 08:48:50',NULL),
 (273,10,25,2,3,'2012-01-25 08:51:19','2012-01-25 08:51:19',NULL),
 (274,10,25,5,3,'2012-01-25 08:51:19','2012-01-25 08:51:19',NULL),
 (275,10,25,4,3,'2012-01-25 08:51:19','2012-01-25 08:51:19',NULL),
 (276,10,25,7,3,'2012-01-25 08:51:19','2012-01-25 08:51:19',NULL),
 (277,10,25,3,3,'2012-01-25 08:51:20','2012-01-25 08:51:20',NULL),
 (278,10,25,6,1,'2012-01-25 08:51:20','2012-01-25 08:51:20',NULL),
 (279,10,25,2,1,'2012-01-25 08:51:20','2012-01-25 08:51:20',NULL),
 (280,10,25,3,1,'2012-01-25 08:51:20','2012-01-25 08:51:20',NULL),
 (281,10,25,5,1,'2012-01-25 08:51:20','2012-01-25 08:51:20',NULL),
 (282,10,25,4,1,'2012-01-25 08:51:20','2012-01-25 08:51:20',NULL),
 (283,10,25,7,1,'2012-01-25 08:51:21','2012-01-25 08:51:21',NULL),
 (284,10,25,6,2,'2012-01-25 08:51:21','2012-01-25 08:51:21',NULL),
 (285,10,25,2,2,'2012-01-25 08:51:21','2012-01-25 08:51:21',NULL),
 (286,10,25,3,2,'2012-01-25 08:51:21','2012-01-25 08:51:21',NULL),
 (287,10,25,5,2,'2012-01-25 08:51:21','2012-01-25 08:51:21',NULL),
 (288,10,25,4,2,'2012-01-25 08:51:21','2012-01-25 08:52:39',1),
 (289,10,25,7,2,'2012-01-25 08:51:21','2012-01-25 08:51:21',NULL),
 (290,15,26,6,3,'2012-01-25 08:51:34','2012-01-25 08:51:34',NULL),
 (291,15,26,2,3,'2012-01-25 08:51:34','2012-01-25 08:51:34',NULL),
 (292,15,26,7,3,'2012-01-25 08:51:34','2012-01-25 08:51:34',NULL),
 (293,15,26,3,3,'2012-01-25 08:51:34','2012-01-25 08:51:34',NULL),
 (294,15,26,4,3,'2012-01-25 08:51:35','2012-01-25 08:51:35',NULL),
 (295,15,26,5,3,'2012-01-25 08:51:35','2012-01-25 08:51:35',NULL),
 (296,15,26,6,1,'2012-01-25 08:51:35','2012-01-25 08:51:35',NULL),
 (297,15,26,2,1,'2012-01-25 08:51:35','2012-01-25 08:51:35',NULL),
 (298,15,26,3,1,'2012-01-25 08:51:35','2012-01-25 08:51:35',NULL),
 (299,15,26,5,1,'2012-01-25 08:51:35','2012-01-25 08:51:35',NULL),
 (300,15,26,4,1,'2012-01-25 08:51:35','2012-01-25 08:51:35',NULL),
 (301,15,26,7,1,'2012-01-25 08:51:36','2012-01-25 08:51:36',NULL),
 (302,15,26,6,2,'2012-01-25 08:51:36','2012-01-25 08:51:36',NULL),
 (303,15,26,2,2,'2012-01-25 08:51:36','2012-01-25 08:51:36',NULL),
 (304,15,26,3,2,'2012-01-25 08:51:36','2012-01-25 08:51:36',NULL),
 (305,15,26,5,2,'2012-01-25 08:51:36','2012-01-25 08:51:36',NULL),
 (306,15,26,4,2,'2012-01-25 08:51:36','2012-01-25 08:52:48',1),
 (307,15,26,7,2,'2012-01-25 08:51:36','2012-01-25 08:51:36',NULL),
 (308,15,29,6,3,'2012-01-29 12:58:33','2012-01-29 12:58:33',NULL),
 (309,15,29,4,3,'2012-01-29 12:58:33','2012-01-29 12:58:33',NULL),
 (310,15,29,5,3,'2012-01-29 12:58:33','2012-01-29 12:58:33',NULL),
 (311,15,29,3,3,'2012-01-29 12:58:33','2012-01-29 12:58:33',NULL),
 (312,15,29,2,3,'2012-01-29 12:58:34','2012-01-29 12:58:34',NULL),
 (313,15,29,7,3,'2012-01-29 12:58:34','2012-01-29 12:58:34',NULL),
 (314,15,29,6,1,'2012-01-29 12:58:34','2012-01-29 12:58:34',NULL),
 (315,15,29,2,1,'2012-01-29 12:58:34','2012-01-29 12:58:34',NULL),
 (316,15,29,3,1,'2012-01-29 12:58:34','2012-01-29 12:58:34',NULL),
 (317,15,29,5,1,'2012-01-29 12:58:34','2012-01-29 12:58:34',NULL),
 (318,15,29,4,1,'2012-01-29 12:58:34','2012-01-29 12:58:34',NULL),
 (319,15,29,7,1,'2012-01-29 12:58:35','2012-01-29 12:58:35',NULL),
 (320,15,29,6,2,'2012-01-29 12:58:35','2012-01-29 12:58:35',NULL),
 (321,15,29,2,2,'2012-01-29 12:58:35','2012-01-29 12:58:35',NULL),
 (322,15,29,3,2,'2012-01-29 12:58:35','2012-01-29 12:58:35',NULL),
 (323,15,29,5,2,'2012-01-29 12:58:35','2012-01-29 12:58:35',NULL),
 (324,15,29,4,2,'2012-01-29 12:58:35','2012-01-29 12:59:40',1),
 (325,15,29,7,2,'2012-01-29 12:58:35','2012-01-29 12:58:35',NULL),
 (326,20,30,6,3,'2012-01-29 12:58:42','2012-01-29 12:58:42',NULL),
 (327,20,30,3,3,'2012-01-29 12:58:42','2012-01-29 12:58:42',NULL),
 (328,20,30,4,3,'2012-01-29 12:58:42','2012-01-29 12:58:42',NULL),
 (329,20,30,2,3,'2012-01-29 12:58:43','2012-01-29 12:58:43',NULL),
 (330,20,30,5,3,'2012-01-29 12:58:43','2012-01-29 12:58:43',NULL),
 (331,20,30,7,3,'2012-01-29 12:58:43','2012-01-29 12:58:43',NULL),
 (332,20,30,6,1,'2012-01-29 12:58:43','2012-01-29 12:58:43',NULL),
 (333,20,30,2,1,'2012-01-29 12:58:43','2012-01-29 12:58:43',NULL),
 (334,20,30,3,1,'2012-01-29 12:58:43','2012-01-29 12:58:43',NULL),
 (335,20,30,5,1,'2012-01-29 12:58:43','2012-01-29 12:58:43',NULL),
 (336,20,30,4,1,'2012-01-29 12:58:44','2012-01-29 12:58:44',NULL),
 (337,20,30,7,1,'2012-01-29 12:58:44','2012-01-29 12:58:44',NULL),
 (338,20,30,6,2,'2012-01-29 12:58:44','2012-01-29 12:58:44',NULL),
 (339,20,30,2,2,'2012-01-29 12:58:44','2012-01-29 12:58:44',NULL),
 (340,20,30,3,2,'2012-01-29 12:58:44','2012-01-29 12:58:44',NULL),
 (341,20,30,5,2,'2012-01-29 12:58:44','2012-01-29 12:58:44',NULL),
 (342,20,30,4,2,'2012-01-29 12:58:44','2012-01-29 12:58:44',NULL),
 (343,20,30,7,2,'2012-01-29 12:58:44','2012-01-29 12:58:44',NULL);
/*!40000 ALTER TABLE `targets` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `password` varchar(255) collate utf8_unicode_ci default NULL,
  `hash` varchar(255) collate utf8_unicode_ci default NULL,
  `pwreset` varchar(255) collate utf8_unicode_ci default NULL,
  `street` varchar(255) collate utf8_unicode_ci default NULL,
  `zipcode` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `fp_vegetarian` tinyint(1) default NULL,
  `fp_vegan` tinyint(1) default NULL,
  `fp_glutenfree` tinyint(1) default NULL,
  `lat` float default NULL,
  `lng` float default NULL,
  `cluster_id` int(11) default NULL,
  `points` int(11) default NULL,
  `current_location` int(11) default NULL,
  `phone` text collate utf8_unicode_ci,
  `cuisines` varchar(255) collate utf8_unicode_ci default NULL,
  `po` int(11) default NULL,
  `address` varchar(255) collate utf8_unicode_ci default NULL,
  `is_veg` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`name`,`email`,`password`,`hash`,`pwreset`,`street`,`zipcode`,`created_at`,`updated_at`,`fp_vegetarian`,`fp_vegan`,`fp_glutenfree`,`lat`,`lng`,`cluster_id`,`points`,`current_location`,`phone`,`cuisines`,`po`,`address`,`is_veg`) VALUES 
 (1,NULL,'yogeshwaghmare0@gmail.com','220439615ebf5bbab7be8a2bba3179ae63ee8bd2','YemOoLuP7MZtlvym',NULL,'7','','2012-04-17 07:16:29','2012-04-17 07:16:29',NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,'',NULL,NULL,'',0),
 (2,NULL,'yogeshwaghmare00@gmail.com','f4d4fb515514f89e8e2469ab9253f68436a30850','dhJ5LU7wcdPbVyMr',NULL,'7','452010','2012-04-17 10:00:32','2012-04-17 10:00:32',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'8109481001',NULL,145201,'98714',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
