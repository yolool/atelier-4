-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2025 at 12:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `geo_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE `pays` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pays`
--

INSERT INTO `pays` (`id`, `nom`) VALUES
(1, 'France'),
(2, 'Maroc'),
(3, 'Canada'),
(4, 'Espagne'),
(5, 'États-Unis');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `pays_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `nom`, `pays_id`) VALUES
(1, 'Île-de-France', 1),
(2, 'Provence-Alpes-Côte d\'Azur', 1),
(3, 'Nouvelle-Aquitaine', 1),
(4, 'Auvergne-Rhône-Alpes', 1),
(5, 'Casablanca-Settat', 2),
(6, 'Rabat-Salé-Kénitra', 2),
(7, 'Marrakech-Safi', 2),
(8, 'Québec', 3),
(9, 'Ontario', 3),
(10, 'Colombie-Britannique', 3),
(11, 'Catalogne', 4),
(12, 'Andalousie', 4),
(13, 'Madrid', 4),
(14, 'Californie', 5),
(15, 'New York', 5),
(16, 'Floride', 5),
(17, 'Texas', 5);

-- --------------------------------------------------------

--
-- Table structure for table `villes`
--

CREATE TABLE `villes` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `villes`
--

INSERT INTO `villes` (`id`, `nom`, `region_id`) VALUES
(1, 'Paris', 1),
(2, 'Versailles', 1),
(3, 'Saint-Denis', 1),
(4, 'Marseille', 2),
(5, 'Nice', 2),
(6, 'Toulon', 2),
(7, 'Bordeaux', 3),
(8, 'Bayonne', 3),
(9, 'Limoges', 3),
(10, 'Lyon', 4),
(11, 'Grenoble', 4),
(12, 'Clermont-Ferrand', 4),
(13, 'Casablanca', 5),
(14, 'Mohammedia', 5),
(15, 'El Jadida', 5),
(16, 'Rabat', 6),
(17, 'Salé', 6),
(18, 'Kénitra', 6),
(19, 'Marrakech', 7),
(20, 'Safi', 7),
(21, 'Essaouira', 7),
(22, 'Montréal', 8),
(23, 'Québec', 8),
(24, 'Sherbrooke', 8),
(25, 'Toronto', 9),
(26, 'Ottawa', 9),
(27, 'Hamilton', 9),
(28, 'Vancouver', 10),
(29, 'Victoria', 10),
(30, 'Kelowna', 10),
(31, 'Barcelone', 11),
(32, 'Gérone', 11),
(33, 'Tarragone', 11),
(34, 'Séville', 12),
(35, 'Malaga', 12),
(36, 'Grenade', 12),
(37, 'Madrid', 13),
(38, 'Alcalá de Henares', 13),
(39, 'Móstoles', 13),
(40, 'Los Angeles', 14),
(41, 'San Francisco', 14),
(42, 'San Diego', 14),
(43, 'New York', 15),
(44, 'Buffalo', 15),
(45, 'Rochester', 15),
(46, 'Miami', 16),
(47, 'Orlando', 16),
(48, 'Tampa', 16),
(49, 'Houston', 17),
(50, 'Dallas', 17),
(51, 'Austin', 17);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pays_id` (`pays_id`);

--
-- Indexes for table `villes`
--
ALTER TABLE `villes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `villes`
--
ALTER TABLE `villes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_ibfk_1` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `villes`
--
ALTER TABLE `villes`
  ADD CONSTRAINT `villes_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
