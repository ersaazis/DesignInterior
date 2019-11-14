-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2019 at 08:37 PM
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
  `id_subcriteria` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alternative`
--

INSERT INTO `alternative` (`id`, `id_subcriteria`, `name`) VALUES
(13, 47, 'Minimalis'),
(14, 49, 'Modern'),
(15, 49, 'Skandinavia'),
(16, 46, 'Klasik'),
(17, 48, 'Tradisional'),
(18, 49, 'Industrial');

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
(25, 'Usia'),
(26, 'Jenis Kelamin'),
(27, 'Penghasilan'),
(28, 'Kepribadian');

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
(4, 25, 0.255624),
(5, 27, 0.576397),
(6, 28, 0.11724),
(7, 26, 0.0507388);

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
(46, 25, 26, 0.277778),
(47, 27, 25, 0.661765),
(48, 25, 28, 0.321429),
(49, 27, 26, 0.5),
(50, 28, 26, 0.166667),
(51, 27, 28, 0.535714),
(52, 26, 25, 0.0441176),
(53, 25, 27, 0.202703),
(54, 28, 25, 0.0735294),
(55, 26, 27, 0.0675676),
(56, 26, 28, 0.0357143),
(57, 28, 27, 0.121622),
(58, 25, 25, 0.220588),
(59, 26, 26, 0.0555556),
(60, 27, 27, 0.608108),
(61, 28, 28, 0.107143);

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

--
-- Dumping data for table `normalize_weight_subcriteria`
--

INSERT INTO `normalize_weight_subcriteria` (`id`, `id_criteria`, `id_subcriteria1`, `id_subcriteria2`, `weight`) VALUES
(293, 25, 38, 39, 0.6),
(294, 25, 38, 40, 0.555556),
(295, 25, 39, 40, 0.333333),
(296, 25, 39, 38, 0.294118),
(297, 25, 40, 38, 0.117647),
(298, 25, 40, 39, 0.1),
(299, 25, 38, 38, 0.588235),
(300, 25, 39, 39, 0.3),
(301, 25, 40, 40, 0.111111),
(302, 26, 42, 41, 0.75),
(303, 26, 41, 42, 0.25),
(304, 26, 41, 41, 0.25),
(305, 26, 42, 42, 0.75),
(306, 27, 43, 44, 0.6),
(307, 27, 43, 45, 0.555556),
(308, 27, 44, 45, 0.333333),
(309, 27, 44, 43, 0.294118),
(310, 27, 45, 43, 0.117647),
(311, 27, 45, 44, 0.1),
(312, 27, 43, 43, 0.588235),
(313, 27, 44, 44, 0.3),
(314, 27, 45, 45, 0.111111),
(315, 28, 47, 46, 0.4375),
(316, 28, 48, 46, 0.3125),
(317, 28, 49, 46, 0.1875),
(318, 28, 47, 48, 0.661765),
(319, 28, 47, 49, 0.535714),
(320, 28, 48, 49, 0.321429),
(321, 28, 46, 47, 0.0852273),
(322, 28, 46, 48, 0.0441176),
(323, 28, 46, 49, 0.0357143),
(324, 28, 48, 47, 0.198864),
(325, 28, 49, 47, 0.119318),
(326, 28, 49, 48, 0.0735294),
(327, 28, 46, 46, 0.0625),
(328, 28, 47, 47, 0.596591),
(329, 28, 48, 48, 0.220588),
(330, 28, 49, 49, 0.107143);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`key`, `value`) VALUES
('spesialcriteria', '28');

-- --------------------------------------------------------

--
-- Table structure for table `subcriteria_ahp`
--

CREATE TABLE `subcriteria_ahp` (
  `id` int(11) NOT NULL,
  `id_criteria` int(11) NOT NULL,
  `id_subcriteria` int(11) NOT NULL,
  `score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcriteria_ahp`
--

INSERT INTO `subcriteria_ahp` (`id`, `id_criteria`, `id_subcriteria`, `score`) VALUES
(34, 25, 38, 0.581264),
(35, 25, 39, 0.30915),
(36, 25, 40, 0.109586),
(37, 26, 42, 0.75),
(38, 26, 41, 0.25),
(39, 27, 43, 0.581264),
(40, 27, 44, 0.30915),
(41, 27, 45, 0.109586),
(42, 28, 47, 0.557893),
(43, 28, 48, 0.263345),
(44, 28, 49, 0.121873),
(45, 28, 46, 0.0568898);

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
(38, '25-35 Thn', 25),
(39, '36-45 Thn', 25),
(40, '>45 Thn', 25),
(41, 'Laki-laki', 26),
(42, 'Perempuan', 26),
(43, '>10 Jt Perbulan', 27),
(44, '3-10 Jt Perbulan', 27),
(45, '&lt;3 Jt Perbulan', 27),
(46, 'Koleris', 28),
(47, 'Melankolis', 28),
(48, 'Plegmatis', 28),
(49, 'Sanguinis', 28);

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
(18, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', 'Windows 10', '2019-11-13 22:41:17'),
(19, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', 'Windows 10', '2019-11-14 08:03:49'),
(20, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', 'Windows 10', '2019-11-14 22:08:58');

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
(109, 25, 26, 5, 1),
(110, 27, 25, 3, 1),
(111, 25, 28, 3, 1),
(112, 27, 26, 9, 1),
(113, 28, 26, 3, 1),
(114, 27, 28, 5, 1),
(115, 26, 25, 0.2, 0),
(116, 25, 27, 0.333333, 0),
(117, 28, 25, 0.333333, 0),
(118, 26, 27, 0.111111, 0),
(119, 26, 28, 0.333333, 0),
(120, 28, 27, 0.2, 0),
(121, 25, 25, 1, 0),
(122, 26, 26, 1, 0),
(123, 27, 27, 1, 0),
(124, 28, 28, 1, 0);

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
(569, 25, 38, 39, 2, 1),
(570, 25, 38, 40, 5, 1),
(571, 25, 39, 40, 3, 1),
(572, 26, 42, 41, 3, 1),
(573, 27, 43, 44, 2, 1),
(574, 27, 43, 45, 5, 1),
(575, 27, 44, 45, 3, 1),
(576, 28, 47, 46, 7, 1),
(577, 28, 48, 46, 5, 1),
(578, 28, 49, 46, 3, 1),
(579, 28, 47, 48, 3, 1),
(580, 28, 47, 49, 5, 1),
(581, 28, 48, 49, 3, 1),
(582, 25, 39, 38, 0.5, 0),
(583, 25, 40, 38, 0.2, 0),
(584, 25, 40, 39, 0.333333, 0),
(585, 26, 41, 42, 0.333333, 0),
(586, 27, 44, 43, 0.5, 0),
(587, 27, 45, 43, 0.2, 0),
(588, 27, 45, 44, 0.333333, 0),
(589, 28, 46, 47, 0.142857, 0),
(590, 28, 46, 48, 0.2, 0),
(591, 28, 46, 49, 0.333333, 0),
(592, 28, 48, 47, 0.333333, 0),
(593, 28, 49, 47, 0.2, 0),
(594, 28, 49, 48, 0.333333, 0),
(595, 25, 38, 38, 1, 0),
(596, 25, 39, 39, 1, 0),
(597, 25, 40, 40, 1, 0),
(598, 26, 41, 41, 1, 0),
(599, 26, 42, 42, 1, 0),
(600, 27, 43, 43, 1, 0),
(601, 27, 44, 44, 1, 0),
(602, 27, 45, 45, 1, 0),
(603, 28, 46, 46, 1, 0),
(604, 28, 47, 47, 1, 0),
(605, 28, 48, 48, 1, 0),
(606, 28, 49, 49, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternative`
--
ALTER TABLE `alternative`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_subcriteria` (`id_subcriteria`);

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
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `subcriteria_ahp`
--
ALTER TABLE `subcriteria_ahp`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `criteria_ahp`
--
ALTER TABLE `criteria_ahp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `normalize_weight_criteria`
--
ALTER TABLE `normalize_weight_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `normalize_weight_subcriteria`
--
ALTER TABLE `normalize_weight_subcriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `subcriteria_ahp`
--
ALTER TABLE `subcriteria_ahp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `weight_subcriteria`
--
ALTER TABLE `weight_subcriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=607;

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
