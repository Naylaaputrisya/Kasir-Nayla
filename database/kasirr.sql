-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2024 at 03:38 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasirr`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `Detail_id` int(11) NOT NULL,
  `Penjualan_id` int(11) NOT NULL,
  `Produk_id` int(11) NOT NULL,
  `Jumlah_Produk` int(11) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`Detail_id`, `Penjualan_id`, `Produk_id`, `Jumlah_Produk`, `Subtotal`) VALUES
(5, 1, 111, 1, '15000.00'),
(6, 2, 111, 1, '15000.00'),
(7, 3, 111, 1, '15000.00'),
(8, 4, 111, 1, '15000.00'),
(8, 5, 222, 2, '20000.00'),
(9, 6, 333, 1, '25000.00'),
(10, 7, 333, 1, '25000.00'),
(11, 8, 333, 1, '25000.00'),
(12, 9, 111, 8, '15000.00'),
(13, 10, 222, 23, '20000.00');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `Pelanggan_id` int(11) NOT NULL,
  `Nama_Pelanggan` varchar(255) NOT NULL,
  `No_meja` int(11) NOT NULL,
  `Nomor_Pelanggan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`Pelanggan_id`, `Nama_Pelanggan`, `No_meja`, `Nomor_Pelanggan`) VALUES
(3, 'tes', 1, ''),
(4, 'tes', 1, ''),
(5, 'tes', 1, ''),
(6, 'tes', 1, ''),
(7, 'tes', 1, ''),
(8, 'tes', 1, ''),
(9, 'Nayla', 1, ''),
(10, 'nana', 2, ''),
(11, 'pap', 1, ''),
(12, 'saya', 11, ''),
(13, 'nna', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `Penjualan_id` int(11) NOT NULL,
  `Tanggal_Penjualan` date NOT NULL,
  `Total_Harga` decimal(10,2) NOT NULL,
  `Pelanggan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`Penjualan_id`, `Tanggal_Penjualan`, `Total_Harga`, `Pelanggan_id`) VALUES
(1, '2024-02-12', '0.00', 0),
(2, '2024-02-12', '0.00', 0),
(3, '2024-02-12', '0.00', 0),
(4, '2024-02-12', '0.00', 0),
(5, '2024-02-12', '0.00', 0),
(6, '2024-02-12', '0.00', 0),
(7, '2024-02-12', '0.00', 0),
(8, '2024-02-12', '0.00', 0),
(9, '2024-02-13', '0.00', 0),
(10, '2024-02-13', '0.00', 0),
(11, '2024-02-13', '0.00', 0),
(12, '2024-02-13', '0.00', 0),
(13, '2024-02-13', '0.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `Produk_id` int(11) NOT NULL,
  `Nama_Produk` varchar(255) NOT NULL,
  `Harga` decimal(10,2) NOT NULL,
  `Stok` int(11) NOT NULL,
  `Terjual` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`Produk_id`, `Nama_Produk`, `Harga`, `Stok`, `Terjual`, `foto`) VALUES
(111, 'Tanghulu', '15000.00', 90, 10, '12022024074901.jpg'),
(222, 'Kue Ikan', '20000.00', 77, 25, '12022024074957.jpg'),
(333, 'Ice chocolate ', '25000.00', 7, 3, '13022024071535.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_id` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `level` enum('Admin','Petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_id`, `Username`, `Password`, `level`) VALUES
(23, 'saya', '202cb962ac59075b964b07152d234b70', 'Petugas'),
(1111, 'admin', '202cb962ac59075b964b07152d234b70', 'Admin'),
(2222, 'petugas', '202cb962ac59075b964b07152d234b70', 'Petugas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`Penjualan_id`),
  ADD KEY `Detail_id` (`Detail_id`,`Penjualan_id`,`Produk_id`),
  ADD KEY `Produk_id` (`Produk_id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`Pelanggan_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`Penjualan_id`),
  ADD KEY `Pelanggan_id` (`Pelanggan_id`),
  ADD KEY `Penjualan_id` (`Penjualan_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`Produk_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `Penjualan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `Pelanggan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `Penjualan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
