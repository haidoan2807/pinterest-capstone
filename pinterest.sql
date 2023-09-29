-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host:     Database: db_pinterest
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('439f0156-1205-40c4-be42-01680114b8fd','a86a17c8175b52ca16c7f8fa254597948eb9e449ee9518a772fc4798e5bdfdf7','2023-09-26 15:27:12.829','20230926152712_autoincrement_image_id',NULL,NULL,'2023-09-26 15:27:12.466',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `image_id` (`image_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'2023-08-01','This is a stunning image!'),(2,2,2,'2023-08-02','The cat looks adorable!'),(3,3,3,'2023-08-03','Impressive night view!'),(4,4,4,'2023-08-04','Mouthwatering food!'),(5,5,5,'2023-08-05','Mesmerizing sunset!'),(6,6,6,'2023-08-06','Lovely flowers!'),(7,7,7,'2023-08-07','Cute puppy!'),(8,8,8,'2023-08-08','Historical beauty!'),(9,9,9,'2023-08-09','Breathtaking mountains!'),(10,10,10,'2023-08-10','Unique artwork!'),(11,3,10,'2023-08-11','This is art!'),(12,3,10,'2023-08-11','I love this too'),(13,1,10,'2023-11-08','This is a comment for the photo'),(14,1,1,'2023-11-08','This is a comment for the photo'),(15,2,9,'2023-11-08','This is a comment for the photo number 9');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,NULL,NULL,NULL,'Some description'),(2,2,'Image 2','https://example.com/image2.jpg','Cute cat playing with a ball'),(3,3,'Image 3','https://example.com/image3.jpg','City skyline at night'),(4,4,'Image 4','https://example.com/image4.jpg','Delicious food platter'),(5,5,'Image 5','https://example.com/image5.jpg','Sunset over the beach'),(6,6,'Image 6','https://example.com/image6.jpg','Colorful flowers in a garden'),(7,7,'Image 7','https://example.com/image7.jpg','Adorable puppy with a hat'),(8,8,'Image 8','https://example.com/image8.jpg','Ancient architecture'),(9,9,'Image 9','https://example.com/image9.jpg','Snow-capped mountains'),(10,10,'Image 10','https://example.com/image10.jpg','Artistic abstract painting'),(11,1,'Image 11','https://example.com/image11.jpg','Another beautiful landscape');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `save_image`
--

DROP TABLE IF EXISTS `save_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `save_image` (
  `user_id` int NOT NULL,
  `image_id` int NOT NULL,
  `save_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`,`image_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `save_image_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `save_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `save_image`
--

LOCK TABLES `save_image` WRITE;
/*!40000 ALTER TABLE `save_image` DISABLE KEYS */;
INSERT INTO `save_image` VALUES (1,3,'2023-08-01'),(2,5,'2023-08-02'),(3,7,'2023-08-03'),(4,9,'2023-08-04'),(5,10,'2023-08-05'),(6,2,'2023-08-06'),(7,4,'2023-08-07'),(8,6,'2023-08-08'),(9,8,'2023-08-09'),(10,1,'2023-08-10');
/*!40000 ALTER TABLE `save_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'thor@gmail.com','password1','Thor',35,'thor.png'),(2,'loki@gmail.com','password2','Loki',30,'loki.png'),(3,'tony.stark@gmail.com','password3','Tony Stark',32,'iron_man.png'),(4,'steve.rogers@gmail.com','password4','Steve Roger',35,'captain_america.png'),(5,'bucky.barnes@gmail.com','password5','Bucky Barnes',35,'winter_soldier.png'),(6,'sam.wilson@gmail.com','password6','Sam Wilson',25,'falcon.png'),(7,'peter.parker@gmail.com','password7','Peter Parker',18,'spider_man.png'),(8,'natasha.romanova@gmail.com','password8','Natasha Romanova',26,'black_widow.png'),(9,'clint.barton@gmail.com','password9','Clint Barton',27,'hawkeye.png'),(10,'logan@gmail.com','password10','Logan',24,'wolverine.png'),(12,'aang@gmail.com','$2b$10$tCaFioyUqDdiqmQSZGEude8ZYm8vNwDRhWx6r9fPDBIVS/q6svmYu','Aang',30,NULL),(13,'theavatar@gmail.com','$2b$10$jLPOQnPEYrh4u0hgXc/JCu3b7XZGP7FY.JLFB9THZfULfDpRBGhWm','Aang',32,NULL),(14,'Mina@gmail.com','$2b$10$WlYxML0vxDyBjH.Q99LOpOEfieUSobtbLcRBoPU75KAVWs9tAbNG.','Mina',32,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_pinterest'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-29 22:15:57
