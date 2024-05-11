-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: dbms
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `allotments`
--

DROP TABLE IF EXISTS `allotments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allotments` (
  `Master_case_no` int NOT NULL,
  `Dept` int NOT NULL,
  `Department_Case_No` int DEFAULT NULL,
  `SO_Name` varchar(3) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Master_case_no`,`Dept`),
  KEY `Dept` (`Dept`),
  KEY `SO_Name` (`SO_Name`),
  CONSTRAINT `allotments_ibfk_1` FOREIGN KEY (`Dept`) REFERENCES `departments` (`ID`),
  CONSTRAINT `allotments_ibfk_2` FOREIGN KEY (`Master_case_no`) REFERENCES `cases_master` (`Case_no`),
  CONSTRAINT `allotments_ibfk_3` FOREIGN KEY (`SO_Name`) REFERENCES `employees` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allotments`
--

LOCK TABLES `allotments` WRITE;
/*!40000 ALTER TABLE `allotments` DISABLE KEYS */;
INSERT INTO `allotments` VALUES (1001,0,112,'CH','Chemistry','Physics'),(1002,0,113,'CH','Physics','Pending'),(1003,0,114,'SC','Original','Chemistry'),(1003,1,123,'CH','Biology','Pending'),(1004,0,115,'SC','Chemistry','Physics'),(1005,1,111,'DA','Original','Completed'),(1006,1,112,'VD','Biology','Physics'),(1007,1,113,'VD','Physics','Pending'),(1008,1,114,'DA','Original','Completed'),(1009,1,115,'DA','Biology','Physics'),(1010,2,111,'AB','Original','Completed'),(1011,2,112,'HD','Chemistry','Biology'),(1012,2,113,'AB','Physics','Pending'),(1013,2,114,'HD','Original','Completed'),(1014,2,115,'HD','Chemistry','Biology'),(1015,2,116,'AB','Original','Pending'),(1016,0,116,'DA','Original','Pending'),(1017,1,117,'CH','Original','Pending'),(1018,1,118,'SC','Original','Pending'),(1019,0,117,'DA','Original','Pending'),(1020,1,119,'CH','Original','Pending'),(1021,2,117,'AB','Original','Pending');
/*!40000 ALTER TABLE `allotments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_master`
--

DROP TABLE IF EXISTS `cases_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases_master` (
  `Case_no` int NOT NULL,
  `Police_station_id` int DEFAULT NULL,
  `Crime_Registration_No` int DEFAULT NULL,
  `Crime_date` date DEFAULT NULL,
  `Case_received_date` date DEFAULT NULL,
  `Department` varchar(20) DEFAULT NULL,
  `IPC_Section` varchar(10) DEFAULT NULL,
  `attributes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Case_no`),
  KEY `Police_station_id` (`Police_station_id`),
  CONSTRAINT `cases_master_ibfk_1` FOREIGN KEY (`Police_station_id`) REFERENCES `police_stations` (`PID`),
  CONSTRAINT `cases_master_ibfk_2` FOREIGN KEY (`Police_station_id`) REFERENCES `police_stations` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_master`
--

LOCK TABLES `cases_master` WRITE;
/*!40000 ALTER TABLE `cases_master` DISABLE KEYS */;
INSERT INTO `cases_master` VALUES (1000,111,1001,'2024-04-01','2024-04-02','Biology','IPC123','murder'),(1001,112,1002,'2024-04-02','2024-04-03','Biology','IPC456','rape'),(1002,111,1003,'2024-04-03','2024-04-04','Biology','IPC789','murder'),(1003,112,1004,'2024-04-04','2024-04-05','Biology','IPC321','rape'),(1004,111,1005,'2024-04-05','2024-04-06','Biology','IPC654','rape'),(1005,115,1100,'2024-03-31','2024-04-01','Chemistry','IPC376','murder'),(1006,119,1004,'2024-03-31','2024-04-01','Chemistry','IPC302','rape'),(1007,111,1006,'2024-03-31','2024-04-01','Chemistry','IPC300','rape'),(1008,113,1004,'2024-03-29','2024-04-01','Chemistry','IPC300','murder'),(1009,113,1001,'2024-03-28','2024-04-04','Chemistry','IPC366','rape'),(1010,115,1001,'2024-03-31','2024-04-01','Physics','IPC302','rape'),(1011,115,1001,'2024-03-25','2024-04-01','Physics','IPC111','rape'),(1012,119,1007,'2024-03-28','2024-04-08','Physics','IPC131','rape'),(1013,112,1008,'2024-03-28','2024-04-05','Physics','IPC283','rape'),(1014,117,1010,'2024-03-28','2024-04-02','Physics','IPC168','rape'),(1015,117,1040,'2024-03-03','2024-03-05','Physics','IPC125','murder'),(1016,111,1080,'2024-03-29','2024-03-31','Biology','IPC376','rape'),(1017,117,1004,'2024-04-22','2024-04-23','Chemistry','IPC336','rape'),(1018,117,1004,'2024-04-22','2024-04-23','Chemistry','IPC336','rape'),(1019,117,1004,'2024-04-15','2024-04-20','Biology','IPC336','murder'),(1020,117,1004,'2024-04-14','2024-04-20','Chemistry','IPC302','murder'),(1021,111,1006,'2024-04-15','2024-04-17','Physics','IPC134','theft');
/*!40000 ALTER TABLE `cases_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `Name` varchar(100) DEFAULT NULL,
  `HOD` varchar(3) DEFAULT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `HOD` (`HOD`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`HOD`) REFERENCES `employees` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('Biology','DA',0),('Chemistry','VD',1),('Physics','HD',2);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `ID` varchar(10) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Dept` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Dept` (`Dept`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`Dept`) REFERENCES `departments` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('AB','Ananya Biswas',0),('CH','Chelsi Hansaliya',1),('DA','Deekshita Athreya',0),('HD','Hardini Dalwadi',2),('SC','Soha Chauhan',2),('VD','Vashita Darji',1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `police_stations`
--

DROP TABLE IF EXISTS `police_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `police_stations` (
  `PID` int NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `District` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `police_stations`
--

LOCK TABLES `police_stations` WRITE;
/*!40000 ALTER TABLE `police_stations` DISABLE KEYS */;
INSERT INTO `police_stations` VALUES (111,'Vastrapur Police Station','Ahmedabad'),(112,'Thaltej Police Station','Ahmedabad'),(113,'Kalupur Police Station','Ahmedabad'),(114,'Vidyanagar Police Station','Anand'),(115,'Bakrol Police Station','Anand'),(116,'Karamsad Police Station','Anand'),(117,'Sayaji Police Station','Vadodra'),(118,'Ajwa Police Station','Vadodra'),(119,'Makarpura Police Station','Vadodra'),(120,'Vapi Police Station','Vapi');
/*!40000 ALTER TABLE `police_stations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-23 18:38:36
