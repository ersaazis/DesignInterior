-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2019 at 07:39 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `interior`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternative`
--

CREATE TABLE `alternative` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alternative`
--

INSERT INTO `alternative` (`id`, `name`) VALUES
(1, 'Gaya Minimalis'),
(2, 'Gaya Kontemporer'),
(3, 'Gaya Modern'),
(4, 'Gaya Klasik'),
(5, 'Gaya Tradisional'),
(6, 'Gaya Rustik'),
(7, 'Gaya Skandinavia');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id`, `name`) VALUES
(20, 'A'),
(21, 'B'),
(22, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `criteria_ahp`
--

CREATE TABLE `criteria_ahp` (
  `id` int(11) NOT NULL,
  `id_criteria` int(11) NOT NULL,
  `score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `criteria_ahp`
--

INSERT INTO `criteria_ahp` (`id`, `id_criteria`, `score`) VALUES
(1, 20, 0.444444),
(2, 21, 0.444444),
(3, 22, 0.111111);

-- --------------------------------------------------------

--
-- Table structure for table `normalize_weight_criteria`
--

CREATE TABLE `normalize_weight_criteria` (
  `id` int(11) NOT NULL,
  `id_criteria1` int(11) NOT NULL,
  `id_criteria2` int(11) NOT NULL,
  `weight` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `normalize_weight_criteria`
--

INSERT INTO `normalize_weight_criteria` (`id`, `id_criteria1`, `id_criteria2`, `weight`) VALUES
(37, 20, 21, 0.444444),
(38, 20, 22, 0.444444),
(39, 21, 22, 0.444444),
(40, 21, 20, 0.444444),
(41, 22, 20, 0.111111),
(42, 22, 21, 0.111111),
(43, 20, 20, 0.444444),
(44, 21, 21, 0.444444),
(45, 22, 22, 0.111111);

-- --------------------------------------------------------

--
-- Table structure for table `normalize_weight_subcriteria`
--

CREATE TABLE `normalize_weight_subcriteria` (
  `id` int(11) NOT NULL,
  `id_criteria` int(11) NOT NULL,
  `id_subcriteria1` int(11) NOT NULL,
  `id_subcriteria2` int(11) NOT NULL,
  `weight` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sub_criteria`
--

CREATE TABLE `sub_criteria` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `criteria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_criteria`
--

INSERT INTO `sub_criteria` (`id`, `name`, `criteria_id`) VALUES
(29, 'A1', 20),
(30, 'A2', 20),
(31, 'A3', 20),
(32, 'B1', 21),
(33, 'B2', 21),
(34, 'B3', 21),
(35, 'C1', 22),
(36, 'C2', 22),
(37, 'C3', 22);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_last_login`
--

CREATE TABLE `tbl_last_login` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `sessionData` varchar(2048) NOT NULL,
  `machineIp` varchar(1024) NOT NULL,
  `userAgent` varchar(128) NOT NULL,
  `agentString` varchar(1024) NOT NULL,
  `platform` varchar(128) NOT NULL,
  `createdDtm` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_last_login`
--

INSERT INTO `tbl_last_login` (`id`, `userId`, `sessionData`, `machineIp`, `userAgent`, `agentString`, `platform`, `createdDtm`) VALUES
(5, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 'Windows 10', '2019-10-26 01:33:34'),
(6, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 'Windows 10', '2019-10-26 01:55:18'),
(7, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 78.0.3904.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 'Windows 10', '2019-10-26 02:03:03'),
(8, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 'Windows 10', '2019-10-26 02:06:57'),
(9, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 78.0.3904.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 'Windows 10', '2019-10-26 02:07:22'),
(10, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 'Windows 10', '2019-10-26 04:03:15'),
(11, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 'Windows 10', '2019-10-26 04:10:03'),
(12, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 'Windows 10', '2019-10-26 04:10:40'),
(13, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 78.0.3904.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 'Windows 10', '2019-10-26 04:28:32'),
(14, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 'Windows 10', '2019-10-26 15:25:20'),
(15, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', 'Windows 10', '2019-11-06 22:39:01'),
(16, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', 'Windows 10', '2019-11-11 21:28:38'),
(17, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', 'Windows 10', '2019-11-13 17:41:29'),
(18, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', 'Windows 10', '2019-11-13 22:41:17');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reset_password`
--

CREATE TABLE `tbl_reset_password` (
  `id` bigint(20) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(32) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `createdBy` bigint(20) NOT NULL DEFAULT 1,
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `roleId` tinyint(4) NOT NULL COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`roleId`, `role`) VALUES
(1, 'System Administrator'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userId` int(11) NOT NULL,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES
(1, 'admin@admin.com', '$2y$10$9J.abdnu/IhXNrAwbEOrdOdtDzAUexDMNv9avCmbVEPDkQ4p5RtSe', 'System Administrator', '089656217609', 1, 0, 0, '2015-07-01 18:56:49', 1, '2019-10-25 21:05:51'),
(9, 'ersaazis24m@gmail.com', '$2y$10$sJhCRntYYPx7bF3M5RaQg.7IoP76ROo37P5lDNHcpk3UUj1ojzQcm', 'Admin', '089656217609', 2, 0, 1, '2019-10-25 19:48:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `weight_criteria`
--

CREATE TABLE `weight_criteria` (
  `id` int(11) NOT NULL,
  `id_criteria1` int(11) NOT NULL,
  `id_criteria2` int(11) NOT NULL,
  `weight` float NOT NULL,
  `input` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `weight_criteria`
--

INSERT INTO `weight_criteria` (`id`, `id_criteria1`, `id_criteria2`, `weight`, `input`) VALUES
(100, 20, 21, 1, 1),
(101, 20, 22, 4, 1),
(102, 21, 22, 4, 1),
(103, 21, 20, 1, 0),
(104, 22, 20, 0.25, 0),
(105, 22, 21, 0.25, 0),
(106, 20, 20, 1, 0),
(107, 21, 21, 1, 0),
(108, 22, 22, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `weight_subcriteria`
--

CREATE TABLE `weight_subcriteria` (
  `id` int(11) NOT NULL,
  `id_criteria` int(11) NOT NULL,
  `id_subcriteria1` int(11) NOT NULL,
  `id_subcriteria2` int(11) NOT NULL,
  `weight` float NOT NULL,
  `input` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `weight_subcriteria`
--

INSERT INTO `weight_subcriteria` (`id`, `id_criteria`, `id_subcriteria1`, `id_subcriteria2`, `weight`, `input`) VALUES
(28, 20, 29, 30, 3, 1),
(29, 20, 29, 31, 4, 1),
(30, 20, 30, 31, 4, 1),
(31, 21, 32, 33, 3, 1),
(32, 21, 32, 34, 2, 1),
(33, 21, 33, 34, 2, 1),
(34, 22, 35, 36, 2, 1),
(35, 22, 35, 37, 3, 1),
(36, 22, 36, 37, 4, 1),
(37, 20, 30, 29, 0.333333, 0),
(38, 20, 31, 29, 0.25, 0),
(39, 20, 31, 30, 0.25, 0),
(40, 21, 33, 32, 0.333333, 0),
(41, 21, 34, 32, 0.5, 0),
(42, 21, 34, 33, 0.5, 0),
(43, 22, 36, 35, 0.5, 0),
(44, 22, 37, 35, 0.333333, 0),
(45, 22, 37, 36, 0.25, 0),
(46, 20, 29, 29, 1, 0),
(47, 20, 30, 30, 1, 0),
(48, 20, 31, 31, 1, 0),
(49, 21, 32, 32, 1, 0),
(50, 21, 33, 33, 1, 0),
(51, 21, 34, 34, 1, 0),
(52, 22, 35, 35, 1, 0),
(53, 22, 36, 36, 1, 0),
(54, 22, 37, 37, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternative`
--
ALTER TABLE `alternative`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria_ahp`
--
ALTER TABLE `criteria_ahp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `normalize_weight_criteria`
--
ALTER TABLE `normalize_weight_criteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `normalize_weight_subcriteria`
--
ALTER TABLE `normalize_weight_subcriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criteria_id` (`criteria_id`);

--
-- Indexes for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `weight_criteria`
--
ALTER TABLE `weight_criteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weight_subcriteria`
--
ALTER TABLE `weight_subcriteria`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternative`
--
ALTER TABLE `alternative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `criteria_ahp`
--
ALTER TABLE `criteria_ahp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `normalize_weight_criteria`
--
ALTER TABLE `normalize_weight_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `normalize_weight_subcriteria`
--
ALTER TABLE `normalize_weight_subcriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `weight_criteria`
--
ALTER TABLE `weight_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `weight_subcriteria`
--
ALTER TABLE `weight_subcriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  ADD CONSTRAINT `sub_criteria_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `criteria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
