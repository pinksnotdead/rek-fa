-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: symfony
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230314163825','2023-03-14 16:39:25',743),('DoctrineMigrations\\Version20230315200652','2023-03-15 20:14:54',71);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symfony_demo_comment`
--

DROP TABLE IF EXISTS `symfony_demo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symfony_demo_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `author_id` int NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_53AD8F834B89032C` (`post_id`),
  KEY `IDX_53AD8F83F675F31B` (`author_id`),
  CONSTRAINT `FK_53AD8F834B89032C` FOREIGN KEY (`post_id`) REFERENCES `symfony_demo_post` (`id`),
  CONSTRAINT `FK_53AD8F83F675F31B` FOREIGN KEY (`author_id`) REFERENCES `symfony_demo_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symfony_demo_comment`
--

LOCK TABLES `symfony_demo_comment` WRITE;
/*!40000 ALTER TABLE `symfony_demo_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `symfony_demo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symfony_demo_post`
--

DROP TABLE IF EXISTS `symfony_demo_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symfony_demo_post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_58A92E65F675F31B` (`author_id`),
  CONSTRAINT `FK_58A92E65F675F31B` FOREIGN KEY (`author_id`) REFERENCES `symfony_demo_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symfony_demo_post`
--

LOCK TABLES `symfony_demo_post` WRITE;
/*!40000 ALTER TABLE `symfony_demo_post` DISABLE KEYS */;
INSERT INTO `symfony_demo_post` VALUES (1,1,'Test1','test1','test podsumowanie','test treść','2023-03-15 19:31:36');
/*!40000 ALTER TABLE `symfony_demo_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symfony_demo_post_tag`
--

DROP TABLE IF EXISTS `symfony_demo_post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symfony_demo_post_tag` (
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `IDX_6ABC1CC44B89032C` (`post_id`),
  KEY `IDX_6ABC1CC4BAD26311` (`tag_id`),
  CONSTRAINT `FK_6ABC1CC44B89032C` FOREIGN KEY (`post_id`) REFERENCES `symfony_demo_post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6ABC1CC4BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `symfony_demo_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symfony_demo_post_tag`
--

LOCK TABLES `symfony_demo_post_tag` WRITE;
/*!40000 ALTER TABLE `symfony_demo_post_tag` DISABLE KEYS */;
INSERT INTO `symfony_demo_post_tag` VALUES (1,1);
/*!40000 ALTER TABLE `symfony_demo_post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symfony_demo_tag`
--

DROP TABLE IF EXISTS `symfony_demo_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symfony_demo_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4D5855405E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symfony_demo_tag`
--

LOCK TABLES `symfony_demo_tag` WRITE;
/*!40000 ALTER TABLE `symfony_demo_tag` DISABLE KEYS */;
INSERT INTO `symfony_demo_tag` VALUES (1,'test pierwszy');
/*!40000 ALTER TABLE `symfony_demo_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symfony_demo_user`
--

DROP TABLE IF EXISTS `symfony_demo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symfony_demo_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `pricing_plan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8FB094A1F85E0677` (`username`),
  UNIQUE KEY `UNIQ_8FB094A1E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symfony_demo_user`
--

LOCK TABLES `symfony_demo_user` WRITE;
/*!40000 ALTER TABLE `symfony_demo_user` DISABLE KEYS */;
INSERT INTO `symfony_demo_user` VALUES (1,'Jane Admin','jane_admin','jane_admin@example.com','$2y$13$MRy8FFdI52fW7dixenp/euahjxQ0m.z3lOn7ufHEijRdOqm1rGS4e','[\"ROLE_USER\", \"ROLE_ADMIN\"]','default'),(2,'John User','john_user','john_admin@example.com','$2y$13$ZBsAemcl4JRgKqpeZNsP9.Y1u/aU7Voz.MONYg7D7dLTX9xtnzQPW','[\"ROLE_USER\"]','default'),(3,'Jan Kowalski','jankowalski','jankowalski@gmail.com','abc','[]','default'),(4,'Jan Kowalskia','jankowalski2','jankowalski2@gmail.com','abc','[]','default'),(5,'Jan KowalskiB','jankowalski3','jankowalski3@gmail.com','$2y$13$OrWQjOVAXI3C8Of4Qm0hWebbDytfio4e2noeISBO7zznSJidEqkZi','[]','default'),(6,'Jan Kowalski','jankowalski4','jankowalski4@gmail.com','$2y$13$6V1Xf4zSPmUgqMuN0yw6lOaY8ZosxokMfIsaiKeky9KrKTftn1S7G','[\"ROLE_USER\"]','default');
/*!40000 ALTER TABLE `symfony_demo_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'symfony'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-16 11:46:23
