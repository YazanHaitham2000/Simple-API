-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2024 at 02:26 PM
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
-- Database: `my_ecommerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `price` varchar(50) NOT NULL,
  `rate` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `img_url`, `brand`, `price`, `rate`) VALUES
(1, 'Samsung Galaxy Note 20 Ultra', 'https://cdn0.vox-cdn.com/hermano/verge/product/image/9377/SQ_vpavic_200807_4133_0107.jpeg', 'Samsung', 'JOD 759.00', 5),
(2, 'INFINIX Zero 8', 'https://th.bing.com/th/id/OIP.56NAyM96R8xBJDGeuSPpAQAAAA?rs=1&pid=ImgDetMain', 'Infinix', 'JOD 205.00', 0),
(3, 'Apple iPhone 12 Pro', 'https://th.bing.com/th/id/OIP.UwlYKLqWk9oaHsDoFq273gHaHa?rs=1&pid=ImgDetMain', 'Apple', 'JOD 973.00', 0),
(4, 'ITEL A48', 'https://th.bing.com/th/id/OIP.6gnpb5uU7PhCz_hE-jfWigHaFj?w=1200&h=900&rs=1&pid=ImgDetMain', 'iTel', 'JOD 66.00', 0),
(5, 'Samsung Galaxy S21 Ultra', 'https://th.bing.com/th/id/OIP.bZNy1RhP_Y6LurDCEsrrVQHaFj?rs=1&pid=ImgDetMain', 'Samsung', 'JOD 799.00', 0),
(6, 'Galaxy A52', 'https://th.bing.com/th/id/OIP.At0IlwY1TYoGrQQs6rcNbQHaFj?rs=1&pid=ImgDetMain', 'Samsung', 'JOD 267.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `family_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `family_name`, `email`, `password`, `phone_number`, `role_id`, `is_admin`) VALUES
(6, 'q', 'q', 'q', 'q', 'q@q.com', '$2y$10$SQRH5yiiTwcztoCNETCXTutwjM3sd2./MqfI5ApzMVDRUmjFhxam6', '0798525908', 2, 0),
(7, 'r', 'r', 'r', 'r', 'r@r.com', '$2y$10$2dC7IJKVNCVousl50cMi8.mdfZSIcRFRwNZfJWnS5VD3cfO.PRIGS', '0798525908', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
