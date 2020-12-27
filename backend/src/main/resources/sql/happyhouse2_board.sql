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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `no` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `count` varchar(45) DEFAULT '0',
  `category` varchar(45) DEFAULT NULL,
  `wdate` date DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'글제목1','글내용1','dog','0','잡담','2020-11-22'),(2,'글제목2','글내용1','dog','0','질문','2020-11-22'),(3,'글제목3','글내용1','dog','0','잡담','2020-11-22'),(4,'글제목4','글내용1','dog','0','질문','2020-11-22'),(5,'글제목5','글내용1','dog','0','잡담','2020-11-22'),(6,'글제목2','글내용2','dog','0','질문','2020-11-22'),(7,'글제목3','글내용2','dog','0','질문','2020-11-22'),(8,'글제목4','글내용2','dog','0','잡담','2020-11-22'),(9,'글제목5','글내용2','dog','0','잡담','2020-11-22'),(10,'글제목6','글내용2','dog','0','잡담','2020-11-22'),(11,'글제목3','글내용3','dog','0','잡담','2020-11-22'),(12,'글제목4','글내용3','dog','0','잡담','2020-11-22'),(13,'글제목5','글내용3','dog','0','잡담','2020-11-22'),(14,'글제목6','글내용3','dog','0','잡담','2020-11-22'),(15,'글제목7','글내용3','dog','0','잡담','2020-11-22'),(16,'글제목4','글내용4','dog','0','잡담','2020-11-22'),(17,'글제목5','글내용4','dog','0','잡담','2020-11-22'),(18,'글제목6','글내용4','dog','0','잡담','2020-11-22'),(19,'글제목7','글내용4','dog','0','잡담','2020-11-22'),(20,'글제목8','글내용4','dog','0','잡담','2020-11-22'),(21,'글제목5','글내용5','dog','0','잡담','2020-11-22'),(22,'글제목6','글내용5','dog','0','잡담','2020-11-22'),(23,'글제목7','글내용5','dog','0','잡담','2020-11-22'),(24,'글제목8','글내용5','dog','0','잡담','2020-11-22'),(25,'글제목9','글내용5','dog','0','잡담','2020-11-22'),(26,'글제목6','글내용6','dog','0','잡담','2020-11-22'),(27,'글제목7','글내용6','dog','0','잡담','2020-11-22'),(28,'글제목8','글내용6','dog','0','잡담','2020-11-22'),(29,'글제목9','글내용6','dog','0','잡담','2020-11-22'),(30,'글제목10','글내용6','dog','0','잡담','2020-11-22'),(31,'글제목7','글내용7','dog','0','잡담','2020-11-22'),(32,'글제목8','글내용7','dog','0','잡담','2020-11-22'),(33,'글제목91','글내용7','dog','4','잡담','2020-11-22'),(34,'글제목10','글내용7','dog','0','잡담','2020-11-22'),(35,'글제목11','글내용7','dog','0','잡담','2020-11-22'),(36,'글제목8','글내용8','dog','0','질문','2020-11-22'),(37,'글제목9','글내용8','dog','0','질문','2020-11-22'),(38,'글제목10','글내용8','dog','0','질문','2020-11-22'),(39,'글제목11','글내용8','dog','0','질문','2020-11-22'),(40,'글제목12','글내용8','dog','0','질문','2020-11-22'),(41,'글제목9','글내용9','dog','0','질문','2020-11-22'),(42,'글제목10','글내용9','dog','0','질문','2020-11-22'),(43,'글제목11','글내용9','dog','12','질문','2020-11-22'),(44,'글제목12','글내용9','dog','12','질문','2020-11-22'),(46,'글제목10','글내용10','dog','3','잡담','2020-11-22'),(47,'글제목11','글내용10','dog','15','잡담','2020-11-22'),(51,'새로운글1123','와우','seokjae','33','잡담','2020-11-23'),(52,'새로운글1123','새로운글1123새로운글1123새로운글1123새로운글1123새로운글1123','seokjae','0','잡담','2020-11-23'),(53,'새로운 글제목입니다','새로운 내용새로운 내용새로운 내용새로운 내용새로운 내용새로운 내용새로운 내용새로운 내용새로운 내용','seokjae','1','잡담','2020-11-23'),(54,'123123','sdfsdfsdf','seokjae','1','질문','2020-11-23'),(55,'4123214523','asdasdsadsad','seokjae','1','질문','2020-11-23');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23 20:25:02
