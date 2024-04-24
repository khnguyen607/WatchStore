CREATE DATABASE  IF NOT EXISTS `watchStore` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `watchStore`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: watchStore
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TotalPrice` int NOT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chờ duyệt',
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GuestName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GuestEmail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GuestPhone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GuestAddress` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,282,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Văn A','nguyenvana@example.com','0987654321','123 Đường ABC, Quận 1, Thành phố Hồ Chí Minh'),(2,257,'Chờ duyệt','2024-04-19 12:41:38','Trần Thị B','tranthib@example.com','0123456789','456 Đường XYZ, Quận 2, Thành phố Hà Nội'),(3,322,'Chờ duyệt','2024-04-19 12:41:38','Lê Văn C','levanc@example.com','0123456789','789 Đường DEF, Quận 3, Thành phố Đà Nẵng'),(4,290,'Chờ duyệt','2024-04-19 12:41:38','Phạm Thị D','phamthid@example.com','0987654321','101 Đường GHI, Quận 4, Thành phố Cần Thơ'),(5,137,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Văn E','nguyenvane@example.com','0987654321','111 Đường JKL, Quận 5, Thành phố Hải Phòng'),(6,110,'Chờ duyệt','2024-04-19 12:41:38','Trần Văn F','tranvanf@example.com','0123456789','222 Đường MNO, Quận 6, Thành phố Vũng Tàu'),(7,143,'Chờ duyệt','2024-04-19 12:41:38','Lê Thị G','lethig@example.com','0123456789','333 Đường PQR, Quận 7, Thành phố Nha Trang'),(8,72,'Chờ duyệt','2024-04-19 12:41:38','Phạm Văn H','phamvanh@example.com','0987654321','444 Đường STU, Quận 8, Thành phố Quy Nhơn'),(9,166,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Thị I','nguyenthii@example.com','0987654321','555 Đường VWX, Quận 9, Thành phố Hạ Long'),(10,114,'Chờ duyệt','2024-04-19 12:41:38','Trần Văn K','tranvank@example.com','0123456789','666 Đường YZ1, Quận 10, Thành phố Phú Quốc'),(11,16,'Chờ duyệt','2024-04-19 12:41:38','Lê Thị L','lethil@example.com','0987654321','777 Đường 234, Quận 11, Thành phố Tam Kỳ'),(12,72,'Chờ duyệt','2024-04-19 12:41:38','Phạm Văn M','phamvanm@example.com','0123456789','888 Đường 345, Quận 12, Thành phố Tây Ninh'),(13,112,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Thị N','nguyenthin@example.com','0123456789','999 Đường 456, Quận 13, Thành phố Bắc Ninh'),(14,295,'Chờ duyệt','2024-04-19 12:41:38','Trần Văn P','tranvanp@example.com','0987654321','1010 Đường 567, Quận 14, Thành phố Cao Lãnh'),(15,140,'Chờ duyệt','2024-04-19 12:41:38','Lê Thị Q','lethiq@example.com','0987654321','1111 Đường 678, Quận 15, Thành phố Bảo Lộc'),(16,290000,'Chờ duyệt','2024-04-19 12:41:38','Phạm Văn R','phamvanr@example.com','0123456789','1212 Đường 789, Quận 16, Thành phố Bắc Giang'),(17,68,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Thị S','nguyenthis@example.com','0987654321','1313 Đường 890, Quận 17, Thành phố Bắc Kạn'),(18,277,'Chờ duyệt','2024-04-19 12:41:38','Trần Văn T','tranvant@example.com','0123456789','1414 Đường 901, Quận 18, Thành phố Bắc Ninh'),(19,187,'Chờ duyệt','2024-04-19 12:41:38','Lê Thị U','lethiu@example.com','0123456789','1515 Đường 012, Quận 19, Thành phố Bắc Giang'),(20,169,'Chờ duyệt','2024-04-19 12:41:38','Phạm Văn V','phamvanv@example.com','0987654321','1616 Đường 123, Quận 20, Thành phố Bắc Kạn'),(21,207,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Văn A','nguyenvana@example.com','0987654321','123 Đường ABC, Quận 1, Thành phố Hồ Chí Minh'),(22,269,'Chờ duyệt','2024-04-19 12:41:38','Trần Thị B','tranthib@example.com','0123456789','456 Đường XYZ, Quận 2, Thành phố Hà Nội'),(23,64,'Chờ duyệt','2024-04-19 12:41:38','Lê Văn C','levanc@example.com','0123456789','789 Đường DEF, Quận 3, Thành phố Đà Nẵng'),(24,354,'Chờ duyệt','2024-04-19 12:41:38','Phạm Thị D','phamthid@example.com','0987654321','101 Đường GHI, Quận 4, Thành phố Cần Thơ'),(25,144,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Văn E','nguyenvane@example.com','0987654321','111 Đường JKL, Quận 5, Thành phố Hải Phòng'),(26,410000,'Chờ duyệt','2024-04-19 12:41:38','Trần Văn F','tranvanf@example.com','0123456789','222 Đường MNO, Quận 6, Thành phố Vũng Tàu'),(27,17,'Chờ duyệt','2024-04-19 12:41:38','Lê Thị G','lethig@example.com','0123456789','333 Đường PQR, Quận 7, Thành phố Nha Trang'),(28,90,'Chờ duyệt','2024-04-19 12:41:38','Phạm Văn H','phamvanh@example.com','0987654321','444 Đường STU, Quận 8, Thành phố Quy Nhơn'),(29,50,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Thị I','nguyenthii@example.com','0987654321','555 Đường VWX, Quận 9, Thành phố Hạ Long'),(30,10,'Chờ duyệt','2024-04-19 12:41:38','Trần Văn K','tranvank@example.com','0123456789','666 Đường YZ1, Quận 10, Thành phố Phú Quốc'),(31,310000,'Chờ duyệt','2024-04-19 12:41:38','Lê Thị L','lethil@example.com','0987654321','777 Đường 234, Quận 11, Thành phố Tam Kỳ'),(32,17,'Chờ duyệt','2024-04-19 12:41:38','Phạm Văn M','phamvanm@example.com','0123456789','888 Đường 345, Quận 12, Thành phố Tây Ninh'),(33,81,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Thị N','nguyenthin@example.com','0123456789','999 Đường 456, Quận 13, Thành phố Bắc Ninh'),(34,280000,'Chờ duyệt','2024-04-19 12:41:38','Trần Văn P','tranvanp@example.com','0987654321','1010 Đường 567, Quận 14, Thành phố Cao Lãnh'),(35,276,'Chờ duyệt','2024-04-19 12:41:38','Lê Thị Q','lethiq@example.com','0987654321','1111 Đường 678, Quận 15, Thành phố Bảo Lộc'),(36,77,'Chờ duyệt','2024-04-19 12:41:38','Phạm Văn R','phamvanr@example.com','0123456789','1212 Đường 789, Quận 16, Thành phố Bắc Giang'),(37,330000,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Thị S','nguyenthis@example.com','0987654321','1313 Đường 890, Quận 17, Thành phố Bắc Kạn'),(38,118,'Chờ duyệt','2024-04-19 12:41:38','Trần Văn T','tranvant@example.com','0123456789','1414 Đường 901, Quận 18, Thành phố Bắc Ninh'),(39,420,'Chờ duyệt','2024-04-19 12:41:38','Lê Thị U','lethiu@example.com','0123456789','1515 Đường 012, Quận 19, Thành phố Bắc Giang'),(40,250,'Chờ duyệt','2024-04-19 12:41:38','Phạm Văn V','phamvanv@example.com','0987654321','1616 Đường 123, Quận 20, Thành phố Bắc Kạn'),(41,101,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Văn A','nguyenvana@example.com','0987654321','123 Đường ABC, Quận 1, Thành phố Hồ Chí Minh'),(42,108,'Chờ duyệt','2024-04-19 12:41:38','Trần Thị B','tranthib@example.com','0123456789','456 Đường XYZ, Quận 2, Thành phố Hà Nội'),(43,24,'Chờ duyệt','2024-04-19 12:41:38','Lê Văn C','levanc@example.com','0123456789','789 Đường DEF, Quận 3, Thành phố Đà Nẵng'),(44,106,'Chờ duyệt','2024-04-19 12:41:38','Phạm Thị D','phamthid@example.com','0987654321','101 Đường GHI, Quận 4, Thành phố Cần Thơ'),(45,360000,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Văn E','nguyenvane@example.com','0987654321','111 Đường JKL, Quận 5, Thành phố Hải Phòng'),(46,157,'Chờ duyệt','2024-04-19 12:41:38','Trần Văn F','tranvanf@example.com','0123456789','222 Đường MNO, Quận 6, Thành phố Vũng Tàu'),(47,446,'Chờ duyệt','2024-04-19 12:41:38','Lê Thị G','lethig@example.com','0123456789','333 Đường PQR, Quận 7, Thành phố Nha Trang'),(48,128,'Chờ duyệt','2024-04-19 12:41:38','Phạm Văn H','phamvanh@example.com','0987654321','444 Đường STU, Quận 8, Thành phố Quy Nhơn'),(49,184,'Chờ duyệt','2024-04-19 12:41:38','Nguyễn Thị I','nguyenthii@example.com','0987654321','555 Đường VWX, Quận 9, Thành phố Hạ Long'),(50,183,'Chờ duyệt','2024-04-19 12:41:38','Trần Văn K','tranvank@example.com','0123456789','666 Đường YZ1, Quận 10, Thành phố Phú Quốc');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-24 12:22:09
