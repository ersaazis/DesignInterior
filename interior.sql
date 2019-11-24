-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2019 at 10:06 PM
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
(1, 25, 0.255624),
(2, 27, 0.576397),
(3, 28, 0.11724),
(4, 26, 0.0507388);

-- --------------------------------------------------------

--
-- Table structure for table `criteria_fahp`
--

CREATE TABLE `criteria_fahp` (
  `id` int(11) NOT NULL,
  `id_criteria` int(11) NOT NULL,
  `score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `criteria_fahp`
--

INSERT INTO `criteria_fahp` (`id`, `id_criteria`, `score`) VALUES
(1, 25, 0.258998),
(2, 26, 0.0513357),
(3, 27, 0.573026),
(4, 28, 0.11664);

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
(708, 25, 26, 0.277778),
(709, 27, 25, 0.661765),
(710, 25, 28, 0.321429),
(711, 27, 26, 0.5),
(712, 28, 26, 0.166667),
(713, 27, 28, 0.535714),
(714, 26, 25, 0.0441176),
(715, 25, 27, 0.202703),
(716, 28, 25, 0.0735294),
(717, 26, 27, 0.0675676),
(718, 26, 28, 0.0357143),
(719, 28, 27, 0.121622),
(720, 25, 25, 0.220588),
(721, 26, 26, 0.0555556),
(722, 27, 27, 0.608108),
(723, 28, 28, 0.107143);

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
(3361, 25, 38, 39, 0.6),
(3362, 25, 38, 40, 0.555556),
(3363, 25, 39, 40, 0.333333),
(3364, 25, 39, 38, 0.294118),
(3365, 25, 40, 38, 0.117647),
(3366, 25, 40, 39, 0.1),
(3367, 25, 38, 38, 0.588235),
(3368, 25, 39, 39, 0.3),
(3369, 25, 40, 40, 0.111111),
(3370, 26, 42, 41, 0.75),
(3371, 26, 41, 42, 0.25),
(3372, 26, 41, 41, 0.25),
(3373, 26, 42, 42, 0.75),
(3374, 27, 43, 44, 0.6),
(3375, 27, 43, 45, 0.555556),
(3376, 27, 44, 45, 0.333333),
(3377, 27, 44, 43, 0.294118),
(3378, 27, 45, 43, 0.117647),
(3379, 27, 45, 44, 0.1),
(3380, 27, 43, 43, 0.588235),
(3381, 27, 44, 44, 0.3),
(3382, 27, 45, 45, 0.111111),
(3383, 28, 47, 46, 0.4375),
(3384, 28, 48, 46, 0.3125),
(3385, 28, 49, 46, 0.1875),
(3386, 28, 47, 48, 0.661765),
(3387, 28, 47, 49, 0.535714),
(3388, 28, 48, 49, 0.321429),
(3389, 28, 46, 47, 0.0852273),
(3390, 28, 46, 48, 0.0441176),
(3391, 28, 46, 49, 0.0357143),
(3392, 28, 48, 47, 0.198864),
(3393, 28, 49, 47, 0.119318),
(3394, 28, 49, 48, 0.0735294),
(3395, 28, 46, 46, 0.0625),
(3396, 28, 47, 47, 0.596591),
(3397, 28, 48, 48, 0.220588),
(3398, 28, 49, 49, 0.107143);

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
('memUsageAhp', '2250256'),
('memUsageFahp', '2263920'),
('SmemUsageAhp', '2324736'),
('SmemUsageFahp', '2368352'),
('spesialcriteria', '28'),
('SwaktuAHP', '0.000065088272094727'),
('SwaktuFAHP', '0.00036382675170898'),
('waktuAHP', '0.000017166137695312'),
('waktuFAHP', '0.00024104118347168');

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
(1, 25, 38, 0.581264),
(2, 25, 39, 0.30915),
(3, 25, 40, 0.109586),
(4, 26, 42, 0.75),
(5, 26, 41, 0.25),
(6, 27, 43, 0.581264),
(7, 27, 44, 0.30915),
(8, 27, 45, 0.109586),
(9, 28, 47, 0.557893),
(10, 28, 48, 0.263345),
(11, 28, 49, 0.121873),
(12, 28, 46, 0.0568898);

-- --------------------------------------------------------

--
-- Table structure for table `subcriteria_fahp`
--

CREATE TABLE `subcriteria_fahp` (
  `id` int(11) NOT NULL,
  `id_criteria` int(11) NOT NULL,
  `id_subcriteria` int(11) NOT NULL,
  `score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcriteria_fahp`
--

INSERT INTO `subcriteria_fahp` (`id`, `id_criteria`, `id_subcriteria`, `score`) VALUES
(1, 25, 39, 0.323816),
(2, 25, 38, 0.565844),
(3, 25, 40, 0.110341),
(4, 26, 41, 0.257614),
(5, 26, 42, 0.742386),
(6, 27, 44, 0.323816),
(7, 27, 43, 0.565844),
(8, 27, 45, 0.110341),
(9, 28, 46, 0.056056),
(10, 28, 47, 0.557076),
(11, 28, 48, 0.266739),
(12, 28, 49, 0.120129);

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
(22, 9, '{\"role\":\"2\",\"roleText\":\"Admin\",\"name\":\"Admin\"}', '::1', 'Chrome 78.0.3904.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Windows 10', '2019-11-25 03:21:52');

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
(141, 25, 26, 5, 1),
(142, 27, 25, 3, 1),
(143, 25, 28, 3, 1),
(144, 27, 26, 9, 1),
(145, 28, 26, 3, 1),
(146, 27, 28, 5, 1),
(147, 26, 25, 0.2, 0),
(148, 25, 27, 0.333333, 0),
(149, 28, 25, 0.333333, 0),
(150, 26, 27, 0.111111, 0),
(151, 26, 28, 0.333333, 0),
(152, 28, 27, 0.2, 0),
(153, 25, 25, 1, 0),
(154, 26, 26, 1, 0),
(155, 27, 27, 1, 0),
(156, 28, 28, 1, 0);

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
(759, 25, 38, 39, 2, 1),
(760, 25, 38, 40, 5, 1),
(761, 25, 39, 40, 3, 1),
(762, 26, 42, 41, 3, 1),
(763, 27, 43, 44, 2, 1),
(764, 27, 43, 45, 5, 1),
(765, 27, 44, 45, 3, 1),
(766, 28, 47, 46, 7, 1),
(767, 28, 48, 46, 5, 1),
(768, 28, 49, 46, 3, 1),
(769, 28, 47, 48, 3, 1),
(770, 28, 47, 49, 5, 1),
(771, 28, 48, 49, 3, 1),
(772, 25, 39, 38, 0.5, 0),
(773, 25, 40, 38, 0.2, 0),
(774, 25, 40, 39, 0.333333, 0),
(775, 26, 41, 42, 0.333333, 0),
(776, 27, 44, 43, 0.5, 0),
(777, 27, 45, 43, 0.2, 0),
(778, 27, 45, 44, 0.333333, 0),
(779, 28, 46, 47, 0.142857, 0),
(780, 28, 46, 48, 0.2, 0),
(781, 28, 46, 49, 0.333333, 0),
(782, 28, 48, 47, 0.333333, 0),
(783, 28, 49, 47, 0.2, 0),
(784, 28, 49, 48, 0.333333, 0),
(785, 25, 38, 38, 1, 0),
(786, 25, 39, 39, 1, 0),
(787, 25, 40, 40, 1, 0),
(788, 26, 41, 41, 1, 0),
(789, 26, 42, 42, 1, 0),
(790, 27, 43, 43, 1, 0),
(791, 27, 44, 44, 1, 0),
(792, 27, 45, 45, 1, 0),
(793, 28, 46, 46, 1, 0),
(794, 28, 47, 47, 1, 0),
(795, 28, 48, 48, 1, 0),
(796, 28, 49, 49, 1, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `criteria_fahp`
--
ALTER TABLE `criteria_fahp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `normalize_weight_criteria`
--
ALTER TABLE `normalize_weight_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=724;

--
-- AUTO_INCREMENT for table `normalize_weight_subcriteria`
--
ALTER TABLE `normalize_weight_subcriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3399;

--
-- AUTO_INCREMENT for table `subcriteria_ahp`
--
ALTER TABLE `subcriteria_ahp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subcriteria_fahp`
--
ALTER TABLE `subcriteria_fahp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `weight_subcriteria`
--
ALTER TABLE `weight_subcriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=797;

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
