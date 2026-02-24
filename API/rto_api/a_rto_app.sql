-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 24, 2026 at 10:51 AM
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
-- Database: `a_rto_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `a_categories`
--

CREATE TABLE `a_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a_categories`
--

INSERT INTO `a_categories` (`category_id`, `category_name`, `description`) VALUES
(1, 'Traffic Signs', 'Questions related to road and traffic signs'),
(2, 'Traffic Signs', 'Updated description'),
(4, 'Vehicle Documents', 'RC, Insurance, PUC and other documents'),
(5, 'Driving License', 'Driving license rules and procedures'),
(6, 'Penalties & Fines', 'Traffic violations and penalties'),
(7, 'Signals & Markings', 'Road signals and lane markings'),
(8, 'Accident & Emergency', 'Emergency situations and accident handling'),
(9, 'Traffic Rules', 'General traffic rule questions');

-- --------------------------------------------------------

--
-- Table structure for table `a_questions`
--

CREATE TABLE `a_questions` (
  `question_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `question_text` varchar(255) NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `correct_option` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a_questions`
--

INSERT INTO `a_questions` (`question_id`, `category_id`, `question_text`, `option_a`, `option_b`, `option_c`, `correct_option`) VALUES
(1, 1, 'What does a red traffic light mean?', 'Stop', 'Go', 'Speed up', 'A'),
(2, 1, 'What does a triangular sign indicate?', 'Warning', 'Mandatory', 'Information', 'A'),
(3, 2, 'Is seat belt compulsory while driving?', 'Yes', 'No', 'Optional', 'A'),
(4, 2, 'What is the legal age for LMV driving license in India?', '16 years', '18 years', '21 years', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `a_rto_offices`
--

CREATE TABLE `a_rto_offices` (
  `office_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `office_code` varchar(255) NOT NULL,
  `office_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a_rto_offices`
--

INSERT INTO `a_rto_offices` (`office_id`, `state_name`, `office_code`, `office_name`, `address`, `website`, `contact_number`) VALUES
(1, 'Gujarat', 'GJ-03', 'Rajkot RTO Office', 'Near Race Course Ring Road, Rajkot', 'https://rtogujarat.gov.in', '0281-1234567'),
(3, 'Gujarat', 'GJ03', 'Rajkot RTO', 'https://rto.gujarat.gov.in', '', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `a_statistics`
--

CREATE TABLE `a_statistics` (
  `stat_id` int(11) NOT NULL,
  `year` varchar(255) NOT NULL,
  `transport_vehicles` int(11) NOT NULL,
  `non_transport_vehicles` int(11) NOT NULL,
  `total_vehicles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a_statistics`
--

INSERT INTO `a_statistics` (`stat_id`, `year`, `transport_vehicles`, `non_transport_vehicles`, `total_vehicles`) VALUES
(1, '2019', 4, 3, 7),
(2, '2020', 4, 5, 9),
(3, '2021', 5, 3, 8),
(4, '2022', 2, 3, 5),
(5, '2023', 6, 4, 10),
(6, '2024', 7, 5, 12);

-- --------------------------------------------------------

--
-- Table structure for table `a_tests`
--

CREATE TABLE `a_tests` (
  `test_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `test_type` varchar(255) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `total_correct` int(11) NOT NULL,
  `total_wrong` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `test_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a_tests`
--

INSERT INTO `a_tests` (`test_id`, `user_id`, `test_type`, `total_questions`, `total_correct`, `total_wrong`, `score`, `test_date`) VALUES
(1, 1, 'Practice Test', 4, 3, 1, 3, '2026-02-23 17:34:03'),
(2, 2, 'Mock Test', 4, 4, 0, 4, '2026-02-23 17:34:03'),
(3, 4, 'mock', 5, 4, 1, 4, '2026-02-24 09:22:09'),
(4, 4, 'mock', 5, 0, 0, 0, '2026-02-24 09:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `a_test_answers`
--

CREATE TABLE `a_test_answers` (
  `answer_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option` char(1) DEFAULT NULL,
  `is_correct` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a_test_answers`
--

INSERT INTO `a_test_answers` (`answer_id`, `test_id`, `question_id`, `selected_option`, `is_correct`) VALUES
(1, 1, 1, 'A', '1'),
(2, 1, 2, 'A', '1'),
(3, 1, 3, 'A', '1'),
(4, 1, 4, 'A', '0'),
(5, 2, 1, 'A', '1'),
(6, 2, 2, 'A', '1'),
(7, 2, 3, 'A', '1'),
(8, 2, 4, 'B', '1'),
(9, 12, 5, 'A', '0');

-- --------------------------------------------------------

--
-- Table structure for table `a_users`
--

CREATE TABLE `a_users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a_users`
--

INSERT INTO `a_users` (`user_id`, `name`, `email`, `password`) VALUES
(4, 'a', 'a@gmail.com', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a_categories`
--
ALTER TABLE `a_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `a_questions`
--
ALTER TABLE `a_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `a_rto_offices`
--
ALTER TABLE `a_rto_offices`
  ADD PRIMARY KEY (`office_id`);

--
-- Indexes for table `a_statistics`
--
ALTER TABLE `a_statistics`
  ADD PRIMARY KEY (`stat_id`);

--
-- Indexes for table `a_tests`
--
ALTER TABLE `a_tests`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `a_test_answers`
--
ALTER TABLE `a_test_answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `a_users`
--
ALTER TABLE `a_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a_categories`
--
ALTER TABLE `a_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `a_questions`
--
ALTER TABLE `a_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `a_rto_offices`
--
ALTER TABLE `a_rto_offices`
  MODIFY `office_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `a_statistics`
--
ALTER TABLE `a_statistics`
  MODIFY `stat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `a_tests`
--
ALTER TABLE `a_tests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `a_test_answers`
--
ALTER TABLE `a_test_answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `a_users`
--
ALTER TABLE `a_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
