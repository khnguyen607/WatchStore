-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th5 01, 2024 lúc 03:05 PM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `watchstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `ID` int NOT NULL,
  `userID` int NOT NULL,
  `productID` int NOT NULL,
  `Content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `ID` int NOT NULL,
  `orderID` int NOT NULL,
  `productID` int NOT NULL,
  `Quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `ID` int NOT NULL,
  `TotalPrice` int NOT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chờ duyệt',
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GuestName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GuestEmail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GuestPhone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GuestAddress` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `ID` int NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` int NOT NULL,
  `Subtitle` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`ID`, `Name`, `Price`, `Subtitle`, `Description`, `Img`) VALUES
(1, 'Đồng hồ thể thao đen', 3000, 'Đồng hồ thể thao', '<p>Đồng hồ thể thao đen có thiết kế thời trang và đa chức năng.</p>', 'images/products/product-1.png'),
(2, 'Đồng hồ cổ điển nam', 4500, 'Đồng hồ cổ điển', '<p>Đồng hồ cổ điển nam với kiểu dáng sang trọng và đẳng cấp.</p>', 'images/products/product-2.png'),
(3, 'Đồng hồ dây da nữ', 6000, 'Đồng hồ dây da', '<p>Đồng hồ dây da nữ với phong cách thanh lịch và đơn giản.</p>', 'images/products/product-3.png'),
(4, 'Đồng hồ thông minh đa năng', 8500, 'Đồng hồ thông minh', '<p>Đồng hồ thông minh đa năng có thể đo nhịp tim, theo dõi vận động và thông báo cuộc gọi.</p>', 'images/products/product-4.png'),
(5, 'Đồng hồ kim loại nam', 5200, 'Đồng hồ kim loại', '<p>Đồng hồ kim loại nam với thiết kế mạnh mẽ và bền bỉ.</p>', 'images/products/product-5.png'),
(6, 'Đồng hồ thể thao nữ', 3800, 'Đồng hồ thể thao', '<p>Đồng hồ thể thao nữ với tính năng chống nước và đèn nền.</p>', 'images/products/product-6.png'),
(7, 'Đồng hồ đeo tay thời trang', 4700, 'Đồng hồ thời trang', '<p>Đồng hồ đeo tay thời trang với mặt số màu trắng và dây đeo da.</p>', 'images/products/product-7.png'),
(8, 'Đồng hồ đeo tay nam', 5200, 'Đồng hồ thời trang', '<p>Đồng hồ đeo tay nam với mặt số màu đen và dây đeo kim loại.</p>', 'images/products/product-8.png'),
(9, 'Đồng hồ dây da nam', 4000, 'Đồng hồ cổ điển', '<p>Đồng hồ dây da nam với kiểu dáng cổ điển và mặt số tròn.</p>', 'images/products/product-9.png'),
(10, 'Đồng hồ nữ hoa lá', 3000, 'Đồng hồ thời trang', '<p>Đồng hồ nữ hoa lá với thiết kế độc đáo và đẹp mắt.</p>', 'images/products/product-10.png'),
(11, 'Đồng hồ thông minh nữ', 7500, 'Đồng hồ thông minh', '<p>Đồng hồ thông minh nữ với màn hình cảm ứng và tính năng đo nhịp tim.</p>', 'images/products/product-11.png'),
(12, 'Đồng hồ nam chống nước', 5800, 'Đồng hồ thể thao', '<p>Đồng hồ nam chống nước với dây đeo silicone và mặt số màu xanh.</p>', 'images/products/product-12.png'),
(13, 'Đồng hồ nữ màu hồng', 3200, 'Đồng hồ thời trang', '<p>Đồng hồ nữ màu hồng với dây đeo silicone và mặt số tròn.</p>', 'images/products/product-13.png'),
(14, 'Đồng hồ dây da nâu', 4200, 'Đồng hồ cổ điển', '<p>Đồng hồ dây da nâu với mặt số màu trắng và vạch chỉ mạ vàng.</p>', 'images/products/product-14.png'),
(15, 'Đồng hồ nam dây da', 5000, 'Đồng hồ cổ điển', '<p>Đồng hồ nam dây da với thiết kế đơn giản và sang trọng.</p>', 'images/products/product-15.png'),
(16, 'Đồng hồ đeo tay thể thao', 3700, 'Đồng hồ thể thao', '<p>Đồng hồ đeo tay thể thao với dây đeo silicone chống nước.</p>', 'images/products/product-16.png'),
(17, 'Đồng hồ thông minh đen', 6800, 'Đồng hồ thông minh', '<p>Đồng hồ thông minh đen với màn hình AMOLED và tính năng theo dõi giấc ngủ.</p>', 'images/products/product-17.png'),
(18, 'Đồng hồ nữ màu trắng', 3400, 'Đồng hồ thời trang', '<p>Đồng hồ nữ màu trắng với dây đeo kim loại và mặt số màu hồng.</p>', 'images/products/product-18.png'),
(19, 'Đồng hồ nam màu xanh', 4800, 'Đồng hồ thời trang', '<p>Đồng hồ nam màu xanh với dây đeo da và mặt số màu trắng.</p>', 'images/products/product-19.png'),
(20, 'Đồng hồ nữ kim loại', 3700, 'Đồng hồ thời trang', '<p>Đồng hồ nữ kim loại với kiểu dáng thanh lịch và đơn giản.</p>', 'images/products/product-20.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `syn_orders_users`
--

CREATE TABLE `syn_orders_users` (
  `ID` int NOT NULL,
  `userID` int NOT NULL,
  `orderID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `ID` int NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Role` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`ID`, `Name`, `UserName`, `Password`, `Email`, `Phone`, `Address`, `Role`) VALUES
(1, 'Khôi Nguyên', 'khnguyen', '$2y$10$Ly9nWExNLCONc2JmXucPyu0SByUBR6/QMvvib2w7dw2xhBe/A9wru', NULL, NULL, NULL, 0),
(2, 'Nhung', 'nhung', '$2y$10$DYXK08JISxLcji21yVK/B.a2JkfnWtNh1K2M.aYzDesJfKb9sna9q', NULL, NULL, NULL, 0),
(3, 'Minh Hoàng', 'hoang', '$2y$10$.0./9JuCf0Y50KVppaiQ6.fk5ekb0cDylxr6JA.v1ZXo.rkwADudy', NULL, NULL, NULL, 0),
(4, 'Khôi Nguyên', 'khnguyen123', '$2y$10$a77qWR9NwJ8vE.EzbuTXkeNOwgcSQBhr2SCu6dKxFWY20HvIo8Vf2', 'billhaiphong@gmail.com', NULL, NULL, 1),
(5, 'Khôi Nguyên', 'khnguyen1234', '$2y$10$E7euH.yJnlvNsntjBPlbgOG8xf.P6vH7b9qwewgK7uMhpjrW9BXvy', 'billhaiphong@gmail.com', NULL, NULL, 1),
(6, 'Khôi Nguyên', 'khnguyen12', '$2y$10$7jScdRoEUNfv/RYBBqBugOlchVPYx5H3tHkpvz02Hh8.55ddsvQmC', 'billhaiphong@gmail.com', NULL, NULL, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `comments_users` (`userID`),
  ADD KEY `comments_products` (`productID`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ordersdetail_oders` (`orderID`),
  ADD KEY `ordersdetail_products` (`productID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `syn_orders_users`
--
ALTER TABLE `syn_orders_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `syn_orders_users_orders` (`orderID`),
  ADD KEY `syn_orders_users_users` (`userID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `syn_orders_users`
--
ALTER TABLE `syn_orders_users`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_products` FOREIGN KEY (`productID`) REFERENCES `products` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `comments_users` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `ordersdetail_oders` FOREIGN KEY (`orderID`) REFERENCES `orders` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ordersdetail_products` FOREIGN KEY (`productID`) REFERENCES `products` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `syn_orders_users`
--
ALTER TABLE `syn_orders_users`
  ADD CONSTRAINT `syn_orders_users_orders` FOREIGN KEY (`orderID`) REFERENCES `orders` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `syn_orders_users_users` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
