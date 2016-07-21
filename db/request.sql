-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2014 at 08:16 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_mylanbeauty`
--

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `skinstatus` text COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `cosused` text COLLATE utf8_unicode_ci NOT NULL,
  `coscur` text COLLATE utf8_unicode_ci NOT NULL,
  `unknownorigin` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  `datesend` datetime NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `reply` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `fullname`, `phone`, `address`, `skinstatus`, `birthday`, `cosused`, `coscur`, `unknownorigin`, `note`, `attachments`, `datesend`, `status`, `reply`) VALUES
(1, 'Ho Lu', '0908696993', '193 Tuy Ly Vuong', '', '1982-06-17', 'dfg argadrg ảg', 'drfg ảg', 1, 'ardga rgargaer ảgar', '', '0000-00-00 00:00:00', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
