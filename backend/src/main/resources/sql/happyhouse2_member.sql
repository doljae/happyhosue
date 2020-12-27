-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: happyhouse2
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` varchar(30) NOT NULL,
  `pw` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `lastName` varchar(10) DEFAULT NULL,
  `firstName` varchar(10) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `rdate` date DEFAULT NULL,
  `favorite` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('ssafy1','ssafy1','ssafy1@ssafy.com','김','싸피1','김싸피별명1','경기도 성남시 분당구','01012341234','1992-11-21','2020-11-22','1168010700'),('ssafy10','ssafy10','ssafy10@ssafy.com','김','싸피10','김싸피별명10','경기도 성남시 분당구','01012341234','1992-11-21','2020-11-22','1111010100'),('ssafy2','ssafy2','ssafy2@ssafy.com','김','싸피2','김싸피별명2','경기도 성남시 분당구','01012341234','1992-11-21','2020-11-22','1111010100'),('ssafy3','ssafy3','ssafy3@ssafy.com','김','싸피3','김싸피별명3','경기도 성남시 분당구','01012341234','1992-11-21','2020-11-22','1111010100'),('ssafy4','ssafy4','ssafy4@ssafy.com','김','싸피4','김싸피별명4','경기도 성남시 분당구','01012341234','1992-11-21','2020-11-22','1111010100'),('ssafy5','ssafy5','ssafy5@ssafy.com','김','싸피5','김싸피별명5','경기도 성남시 분당구','01012341234','1992-11-21','2020-11-22','1111010100'),('ssafy6','ssafy6','ssafy6@ssafy.com','김','싸피6','김싸피별명6','경기도 성남시 분당구','01012341234','1992-11-21','2020-11-22','1111010100'),('ssafy7','ssafy7','ssafy7@ssafy.com','김','싸피7','김싸피별명7','경기도 성남시 분당구','01012341234','1992-11-21','2020-11-22','1111010100'),('ssafy8','ssafy8','ssafy8@ssafy.com','김','싸피8','김싸피별명8','경기도 성남시 분당구','01012341234','1992-11-21','2020-11-22','1111010100'),('ssafy9','ssafy9','ssafy9@ssafy.com','김','싸피9','김싸피별명9','경기도 성남시 분당구','01012341234','1992-11-21','2020-11-22','1111010100'),('testtest1','testtest1','testtest1@ssafy.com','김','테스트','테스트닉','경기 성남시 분당구 금곡로 298','010-2345-2345','2000-11-21','2020-11-23','1111010100'),('testtest2','phone','testtest2@ssafy.com','김','테스트2','김테스트2','서울 강남구 테헤란로1길 10','010-1234-1234','2000-11-21','2020-11-23','1111010100');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23 20:25:01
