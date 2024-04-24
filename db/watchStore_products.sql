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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` int NOT NULL,
  `Subtitle` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (21,'Đồng hồ thể thao đen',3000,'Đồng hồ thể thao','<p>Đồng hồ thể thao đen có thiết kế thời trang và đa chức năng.</p>','images/products/product-1.png'),(22,'Đồng hồ cổ điển nam',4500,'Đồng hồ cổ điển','<p>Đồng hồ cổ điển nam với kiểu dáng sang trọng và đẳng cấp.</p>','images/products/product-2.png'),(23,'Đồng hồ dây da nữ',6000,'Đồng hồ dây da','<p>Đồng hồ dây da nữ với phong cách thanh lịch và đơn giản.</p>','images/products/product-3.png'),(24,'Đồng hồ thông minh đa năng',8500,'Đồng hồ thông minh','<p>Đồng hồ thông minh đa năng có thể đo nhịp tim, theo dõi vận động và thông báo cuộc gọi.</p>','images/products/product-4.png'),(25,'Đồng hồ kim loại nam',5200,'Đồng hồ kim loại','<p>Đồng hồ kim loại nam với thiết kế mạnh mẽ và bền bỉ.</p>','images/products/product-5.png'),(26,'Đồng hồ thể thao nữ',3800,'Đồng hồ thể thao','<p>Đồng hồ thể thao nữ với tính năng chống nước và đèn nền.</p>','images/products/product-6.png'),(27,'Đồng hồ đeo tay thời trang',4700,'Đồng hồ thời trang','<p>Đồng hồ đeo tay thời trang với mặt số màu trắng và dây đeo da.</p>','images/products/product-7.png'),(28,'Đồng hồ đeo tay nam',5200,'Đồng hồ thời trang','<p>Đồng hồ đeo tay nam với mặt số màu đen và dây đeo kim loại.</p>','images/products/product-8.png'),(29,'Đồng hồ dây da nam',4000,'Đồng hồ cổ điển','<p>Đồng hồ dây da nam với kiểu dáng cổ điển và mặt số tròn.</p>','images/products/product-9.png'),(30,'Đồng hồ nữ hoa lá',3000,'Đồng hồ thời trang','<p>Đồng hồ nữ hoa lá với thiết kế độc đáo và đẹp mắt.</p>','images/products/product-10.png'),(31,'Đồng hồ thông minh nữ',7500,'Đồng hồ thông minh','<p>Đồng hồ thông minh nữ với màn hình cảm ứng và tính năng đo nhịp tim.</p>','images/products/product-11.png'),(32,'Đồng hồ nam chống nước',5800,'Đồng hồ thể thao','<p>Đồng hồ nam chống nước với dây đeo silicone và mặt số màu xanh.</p>','images/products/product-12.png'),(33,'Đồng hồ nữ màu hồng',3200,'Đồng hồ thời trang','<p>Đồng hồ nữ màu hồng với dây đeo silicone và mặt số tròn.</p>','images/products/product-13.png'),(34,'Đồng hồ dây da nâu',4200,'Đồng hồ cổ điển','<p>Đồng hồ dây da nâu với mặt số màu trắng và vạch chỉ mạ vàng.</p>','images/products/product-14.png'),(35,'Đồng hồ nam dây da',5000,'Đồng hồ cổ điển','<p>Đồng hồ nam dây da với thiết kế đơn giản và sang trọng.</p>','images/products/product-15.png'),(36,'Đồng hồ đeo tay thể thao',3700,'Đồng hồ thể thao','<p>Đồng hồ đeo tay thể thao với dây đeo silicone chống nước.</p>','images/products/product-16.png'),(37,'Đồng hồ thông minh đen',6800,'Đồng hồ thông minh','<p>Đồng hồ thông minh đen với màn hình AMOLED và tính năng theo dõi giấc ngủ.</p>','images/products/product-17.png'),(38,'Đồng hồ nữ màu trắng',3400,'Đồng hồ thời trang','<p>Đồng hồ nữ màu trắng với dây đeo kim loại và mặt số màu hồng.</p>','images/products/product-18.png'),(39,'Đồng hồ nam màu xanh',4800,'Đồng hồ thời trang','<p>Đồng hồ nam màu xanh với dây đeo da và mặt số màu trắng.</p>','images/products/product-19.png'),(40,'Đồng hồ nữ kim loại',3700,'Đồng hồ thời trang','<p>Đồng hồ nữ kim loại với kiểu dáng thanh lịch và đơn giản.</p>','images/products/product-20.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
