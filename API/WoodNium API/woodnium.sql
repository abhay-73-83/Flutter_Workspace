-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 09, 2026 at 09:34 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `woodnium`
--

-- --------------------------------------------------------

--
-- Table structure for table `abhay_categories`
--

CREATE TABLE `abhay_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abhay_categories`
--

INSERT INTO `abhay_categories` (`id`, `name`, `icon`, `created_at`) VALUES
(2, 'Chair', 'chair.png', '2026-04-04 07:00:37'),
(3, 'boards', 'https://localhost/woodniumapi/uploads/categories/image_4512.jpeg', '2026-04-04 08:10:23');

-- --------------------------------------------------------

--
-- Table structure for table `abhay_inquiries`
--

CREATE TABLE `abhay_inquiries` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` enum('pending','yes','cancel') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abhay_inquiries`
--

INSERT INTO `abhay_inquiries` (`id`, `user_id`, `product_id`, `seller_id`, `message`, `status`, `created_at`) VALUES
(1, 2, 1, 1, 'photo', 'yes', '2026-04-02 13:18:35'),
(2, 2, 2, 1, 'photo', 'cancel', '2026-04-04 07:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `abhay_products`
--

CREATE TABLE `abhay_products` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `video` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abhay_products`
--

INSERT INTO `abhay_products` (`id`, `seller_id`, `category_id`, `name`, `price`, `description`, `image`, `video`, `created_at`) VALUES
(1, 1, 2, 'Chair Updated', 1800, 'Wood', '[\"http://localhost/woodniumapi/uploads/products/img_69d755c97470f.png\",\"http://localhost/woodniumapi/uploads/products/img_69d755c974f44.png\"]', 'http://localhost/woodniumapi/uploads/products/video_3754_1775719783.png', '2026-04-09 07:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `abhay_product_rating`
--

CREATE TABLE `abhay_product_rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `feedback` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abhay_product_rating`
--

INSERT INTO `abhay_product_rating` (`id`, `user_id`, `product_id`, `rating`, `feedback`, `created_at`) VALUES
(1, 2, 1, 4, 'nice ', '2026-04-02 13:13:35'),
(2, 2, 2, 4, 'nice ', '2026-04-04 07:05:08');

-- --------------------------------------------------------

--
-- Table structure for table `abhay_sellers`
--

CREATE TABLE `abhay_sellers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `shop_name` varchar(150) DEFAULT NULL,
  `pincode` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abhay_sellers`
--

INSERT INTO `abhay_sellers` (`id`, `name`, `email`, `phone`, `password`, `shop_name`, `pincode`) VALUES
(1, 'ab', 'ab@gmail.com', '123456', '1234', 'ab', '360001');

-- --------------------------------------------------------

--
-- Table structure for table `abhay_users`
--

CREATE TABLE `abhay_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abhay_users`
--

INSERT INTO `abhay_users` (`id`, `name`, `email`, `phone`, `password`, `created_at`) VALUES
(2, 'a', 'a@gmail.com', 245, '5678', '2026-03-20 13:55:44');

-- --------------------------------------------------------

--
-- Table structure for table `abhay_wishlist`
--

CREATE TABLE `abhay_wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abhay_wishlist`
--

INSERT INTO `abhay_wishlist` (`id`, `user_id`, `product_id`, `created_at`) VALUES
(6, 2, 1, '2026-04-04 07:02:20'),
(7, 2, 2, '2026-04-04 07:03:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abhay_categories`
--
ALTER TABLE `abhay_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `abhay_inquiries`
--
ALTER TABLE `abhay_inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `abhay_products`
--
ALTER TABLE `abhay_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `abhay_product_rating`
--
ALTER TABLE `abhay_product_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `abhay_sellers`
--
ALTER TABLE `abhay_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `abhay_users`
--
ALTER TABLE `abhay_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `abhay_wishlist`
--
ALTER TABLE `abhay_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abhay_categories`
--
ALTER TABLE `abhay_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `abhay_inquiries`
--
ALTER TABLE `abhay_inquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `abhay_products`
--
ALTER TABLE `abhay_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `abhay_product_rating`
--
ALTER TABLE `abhay_product_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `abhay_sellers`
--
ALTER TABLE `abhay_sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `abhay_users`
--
ALTER TABLE `abhay_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `abhay_wishlist`
--
ALTER TABLE `abhay_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
