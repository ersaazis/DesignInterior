-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2019 at 07:32 PM
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
  `score` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `criteria_ahp`
--

INSERT INTO `criteria_ahp` (`id`, `id_criteria`, `score`) VALUES
(53, 25, 0.25562432180079),
(54, 27, 0.57639677492619),
(55, 28, 0.11724013929896),
(56, 26, 0.050738763974058);

-- --------------------------------------------------------

--
-- Table structure for table `criteria_fahp`
--

CREATE TABLE `criteria_fahp` (
  `id` int(11) NOT NULL,
  `id_criteria` int(11) NOT NULL,
  `score` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `criteria_fahp`
--

INSERT INTO `criteria_fahp` (`id`, `id_criteria`, `score`) VALUES
(53, 25, 0.25916633798342),
(54, 26, 0.050699025444478),
(55, 27, 0.57341829195996),
(56, 28, 0.11671634461214);

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
(916, 25, 26, 0.277778),
(917, 27, 25, 0.661765),
(918, 25, 28, 0.321429),
(919, 27, 26, 0.5),
(920, 28, 26, 0.166667),
(921, 27, 28, 0.535714),
(922, 26, 25, 0.0441176),
(923, 25, 27, 0.202703),
(924, 28, 25, 0.0735294),
(925, 26, 27, 0.0675676),
(926, 26, 28, 0.0357143),
(927, 28, 27, 0.121622),
(928, 25, 25, 0.220588),
(929, 26, 26, 0.0555556),
(930, 27, 27, 0.608108),
(931, 28, 28, 0.107143);

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
(3589, 25, 38, 39, 0.6),
(3590, 25, 38, 40, 0.555556),
(3591, 25, 39, 40, 0.333333),
(3592, 25, 39, 38, 0.294118),
(3593, 25, 40, 38, 0.117647),
(3594, 25, 40, 39, 0.1),
(3595, 25, 38, 38, 0.588235),
(3596, 25, 39, 39, 0.3),
(3597, 25, 40, 40, 0.111111),
(3598, 26, 42, 41, 0.75),
(3599, 26, 41, 42, 0.25),
(3600, 26, 41, 41, 0.25),
(3601, 26, 42, 42, 0.75),
(3602, 27, 43, 44, 0.6),
(3603, 27, 43, 45, 0.555556),
(3604, 27, 44, 45, 0.333333),
(3605, 27, 44, 43, 0.294118),
(3606, 27, 45, 43, 0.117647),
(3607, 27, 45, 44, 0.1),
(3608, 27, 43, 43, 0.588235),
(3609, 27, 44, 44, 0.3),
(3610, 27, 45, 45, 0.111111),
(3611, 28, 47, 46, 0.4375),
(3612, 28, 48, 46, 0.3125),
(3613, 28, 49, 46, 0.1875),
(3614, 28, 47, 48, 0.661765),
(3615, 28, 47, 49, 0.535714),
(3616, 28, 48, 49, 0.321429),
(3617, 28, 46, 47, 0.0852273),
(3618, 28, 46, 48, 0.0441176),
(3619, 28, 46, 49, 0.0357143),
(3620, 28, 48, 47, 0.198864),
(3621, 28, 49, 47, 0.119318),
(3622, 28, 49, 48, 0.0735294),
(3623, 28, 46, 46, 0.0625),
(3624, 28, 47, 47, 0.596591),
(3625, 28, 48, 48, 0.220588),
(3626, 28, 49, 49, 0.107143);

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
('memUsageAhp', '2254552'),
('memUsageFahp', '2268216'),
('SmemUsageAhp', '2329128'),
('SmemUsageFahp', '2372744'),
('spesialcriteria', '28'),
('SwaktuAHP', '0.000047922134399414'),
('SwaktuFAHP', '0.00028800964355469'),
('waktuAHP', '0.000017166137695312'),
('waktuFAHP', '0.00025486946105957');

-- --------------------------------------------------------

--
-- Table structure for table `subcriteria_ahp`
--

CREATE TABLE `subcriteria_ahp` (
  `id` int(11) NOT NULL,
  `id_criteria` int(11) NOT NULL,
  `id_subcriteria` int(11) NOT NULL,
  `score` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcriteria_ahp`
--

INSERT INTO `subcriteria_ahp` (`id`, `id_criteria`, `id_subcriteria`, `score`) VALUES
(73, 25, 38, 0.58126361655773),
(74, 25, 39, 0.30915032679739),
(75, 25, 40, 0.10958605664488),
(76, 26, 42, 0.75),
(77, 26, 41, 0.25),
(78, 27, 43, 0.58126361655773),
(79, 27, 44, 0.30915032679739),
(80, 27, 45, 0.10958605664488),
(81, 28, 47, 0.55789247517189),
(82, 28, 48, 0.26334511077158),
(83, 28, 49, 0.12187261268144),
(84, 28, 46, 0.056889801375095);

-- --------------------------------------------------------

--
-- Table structure for table `subcriteria_fahp`
--

CREATE TABLE `subcriteria_fahp` (
  `id` int(11) NOT NULL,
  `id_criteria` int(11) NOT NULL,
  `id_subcriteria` int(11) NOT NULL,
  `score` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcriteria_fahp`
--

INSERT INTO `subcriteria_fahp` (`id`, `id_criteria`, `id_subcriteria`, `score`) VALUES
(73, 25, 39, 0.32381573282336),
(74, 25, 38, 0.56584359662861),
(75, 25, 40, 0.11034067054802),
(76, 26, 41, 0.25761440841416),
(77, 26, 42, 0.74238559158584),
(78, 27, 44, 0.32381573282336),
(79, 27, 43, 0.56584359662861),
(80, 27, 45, 0.11034067054802),
(81, 28, 46, 0.056055982579492),
(82, 28, 47, 0.55707560937243),
(83, 28, 48, 0.26673897070524),
(84, 28, 49, 0.12012943734284);

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
(20, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', 'Windows 10', '2019-11-14 22:08:58'),
(21, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Windows 10', '2019-11-25 00:05:52'),
(22, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Windows 10', '2019-11-25 03:21:52'),
(23, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 79.0.3945.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'Windows 10', '2019-12-25 16:11:02'),
(24, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 79.0.3945.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'Windows 10', '2019-12-26 01:02:51');

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
(349, 25, 26, 5, 1),
(350, 27, 25, 3, 1),
(351, 25, 28, 3, 1),
(352, 27, 26, 9, 1),
(353, 28, 26, 3, 1),
(354, 27, 28, 5, 1),
(355, 26, 25, 0.2, 0),
(356, 25, 27, 0.333333, 0),
(357, 28, 25, 0.333333, 0),
(358, 26, 27, 0.111111, 0),
(359, 26, 28, 0.333333, 0),
(360, 28, 27, 0.2, 0),
(361, 25, 25, 1, 0),
(362, 26, 26, 1, 0),
(363, 27, 27, 1, 0),
(364, 28, 28, 1, 0);

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
(1215, 25, 38, 39, 2, 1),
(1216, 25, 38, 40, 5, 1),
(1217, 25, 39, 40, 3, 1),
(1218, 26, 42, 41, 3, 1),
(1219, 27, 43, 44, 2, 1),
(1220, 27, 43, 45, 5, 1),
(1221, 27, 44, 45, 3, 1),
(1222, 28, 47, 46, 7, 1),
(1223, 28, 48, 46, 5, 1),
(1224, 28, 49, 46, 3, 1),
(1225, 28, 47, 48, 3, 1),
(1226, 28, 47, 49, 5, 1),
(1227, 28, 48, 49, 3, 1),
(1228, 25, 39, 38, 0.5, 0),
(1229, 25, 40, 38, 0.2, 0),
(1230, 25, 40, 39, 0.333333, 0),
(1231, 26, 41, 42, 0.333333, 0),
(1232, 27, 44, 43, 0.5, 0),
(1233, 27, 45, 43, 0.2, 0),
(1234, 27, 45, 44, 0.333333, 0),
(1235, 28, 46, 47, 0.142857, 0),
(1236, 28, 46, 48, 0.2, 0),
(1237, 28, 46, 49, 0.333333, 0),
(1238, 28, 48, 47, 0.333333, 0),
(1239, 28, 49, 47, 0.2, 0),
(1240, 28, 49, 48, 0.333333, 0),
(1241, 25, 38, 38, 1, 0),
(1242, 25, 39, 39, 1, 0),
(1243, 25, 40, 40, 1, 0),
(1244, 26, 41, 41, 1, 0),
(1245, 26, 42, 42, 1, 0),
(1246, 27, 43, 43, 1, 0),
(1247, 27, 44, 44, 1, 0),
(1248, 27, 45, 45, 1, 0),
(1249, 28, 46, 46, 1, 0),
(1250, 28, 47, 47, 1, 0),
(1251, 28, 48, 48, 1, 0),
(1252, 28, 49, 49, 1, 0);

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
-- Indexes for table `criteria_fahp`
--
ALTER TABLE `criteria_fahp`
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
-- Indexes for table `subcriteria_fahp`
--
ALTER TABLE `subcriteria_fahp`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `criteria_fahp`
--
ALTER TABLE `criteria_fahp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `normalize_weight_criteria`
--
ALTER TABLE `normalize_weight_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=932;

--
-- AUTO_INCREMENT for table `normalize_weight_subcriteria`
--
ALTER TABLE `normalize_weight_subcriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3627;

--
-- AUTO_INCREMENT for table `subcriteria_ahp`
--
ALTER TABLE `subcriteria_ahp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `subcriteria_fahp`
--
ALTER TABLE `subcriteria_fahp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT for table `weight_subcriteria`
--
ALTER TABLE `weight_subcriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1253;

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
