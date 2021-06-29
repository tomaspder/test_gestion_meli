-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2021 at 04:53 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `logistica`
--

-- --------------------------------------------------------

--
-- Table structure for table `cantidad_envios`
--

CREATE TABLE `cantidad_envios` (
  `zona` varchar(100) NOT NULL,
  `mes` int(2) NOT NULL,
  `cant_envios` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cantidad_envios`
--

INSERT INTO `cantidad_envios` (`zona`, `mes`, `cant_envios`) VALUES
('AMBA', 1, 40000),
('BS AS', 1, 50000),
('Resto', 1, 60000);

-- --------------------------------------------------------

--
-- Table structure for table `carrier`
--

CREATE TABLE `carrier` (
  `carrier_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carrier`
--

INSERT INTO `carrier` (`carrier_id`, `name`, `capacity`) VALUES
(1, 'Carrier A', 10000),
(2, 'Carrier B', 10000),
(3, 'Carrier C', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `costos`
--

CREATE TABLE `costos` (
  `carrier_id` int(10) NOT NULL,
  `zona` varchar(100) NOT NULL,
  `costo` int(10) NOT NULL,
  `tiempo_entrega` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `costos`
--

INSERT INTO `costos` (`carrier_id`, `zona`, `costo`, `tiempo_entrega`) VALUES
(1, 'AMBA', 10, 3),
(1, 'BS AS', 20, 5),
(1, 'Resto', 50, 7),
(2, 'AMBA', 15, 2),
(2, 'BS AS', 19, 4),
(2, 'Resto', 55, 6),
(3, 'AMBA', 20, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`carrier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `carrier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
