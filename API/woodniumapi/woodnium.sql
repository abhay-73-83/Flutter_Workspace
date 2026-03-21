-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2026 at 05:05 AM
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

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
