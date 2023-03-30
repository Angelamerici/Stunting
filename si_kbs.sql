-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2023 at 11:56 AM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_kbs`
--

-- --------------------------------------------------------

--
-- Table structure for table `kbs`
--

CREATE TABLE `kbs` (
  `id` int(11) NOT NULL,
  `keluarga_id` int(11) NOT NULL,
  `sasaran_id` int(11) NOT NULL,
  `bantuan` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kbs`
--

INSERT INTO `kbs` (`id`, `keluarga_id`, `sasaran_id`, `bantuan`) VALUES
(1, 2, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `keluarga`
--

CREATE TABLE `keluarga` (
  `id` int(11) NOT NULL,
  `nkk` varchar(16) NOT NULL,
  `suami` varchar(128) NOT NULL,
  `istri` varchar(128) NOT NULL,
  `rt` varchar(2) NOT NULL,
  `dusun` varchar(2) NOT NULL,
  `desa` varchar(128) NOT NULL,
  `baduta` enum('Ya','Tidak') NOT NULL,
  `balita` enum('Ya','Tidak') NOT NULL,
  `pus` enum('Ya','Tidak') NOT NULL,
  `pushamil` enum('Ya','Tidak') NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keluarga`
--

INSERT INTO `keluarga` (`id`, `nkk`, `suami`, `istri`, `rt`, `dusun`, `desa`, `baduta`, `balita`, `pus`, `pushamil`, `date_created`) VALUES
(1, '7686767890', 'Fajar ', 'Bunga', '02', '8', 'Terbanggi Subing', 'Ya', 'Ya', 'Ya', 'Tidak', 1680153562),
(2, '637963291', 'Setiawan', 'Indah', '2', '3', 'Gunung Sugih Raya', 'Ya', 'Tidak', 'Ya', 'Ya', 0),
(3, '76868', 'soro', 'sri', '3', '5', 'gunung', 'Tidak', 'Ya', 'Tidak', 'Tidak', 0),
(4, '686998', 'jil', 'sara', '9', '4', 'Gunung Sugih', 'Tidak', 'Tidak', 'Tidak', 'Tidak', 1680169465),
(5, '4354', 'yoyo', 'eni', '8', '9', 'gr', 'Ya', 'Tidak', 'Ya', 'Tidak', 0),
(7, '787878', 'gaga', 'gina', '22', '2', 'Bangun Rejo', 'Ya', 'Ya', 'Ya', 'Tidak', 1680146062);

-- --------------------------------------------------------

--
-- Table structure for table `sasaran`
--

CREATE TABLE `sasaran` (
  `id` int(11) NOT NULL,
  `keluarga_id` int(11) NOT NULL,
  `air` enum('Ya','Tidak') NOT NULL,
  `jamban` enum('Ya','Tidak') NOT NULL,
  `muda` enum('Ya','Tidak') NOT NULL,
  `tua` enum('Ya','Tidak') NOT NULL,
  `dekat` enum('Ya','Tidak') NOT NULL,
  `banyak` enum('Ya','Tidak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(4, 'alda', 'alda@gmail.com', 'default.jpg', '$2y$10$zdS4upiW31x9M1PoLTVo1u/KXi014.uQJPqBWD.buvRYzdrr5EEv.', 1, 1, 1676696669),
(5, 'ani', 'ani@gmail.com', 'default.jpg', '$2y$10$mEl4pSCdD1gwjPL9xe3uVeFCzWUkRHHwTb1lnbmh3g1xMii5LFJaG', 2, 1, 1676702400);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(7, 1, 3),
(9, 2, 2),
(10, 1, 4),
(17, 2, 4),
(18, 1, 5),
(19, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(4, 'Keluarga'),
(5, 'Sasaran'),
(6, 'KBS');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'TPK');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `judul` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `judul`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user', 1),
(3, 3, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(4, 3, 'Submenu Management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(5, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(6, 4, 'Keluarga Terdata', 'keluarga', 'fas fa-fw fa-people-roof', 1),
(7, 5, 'Keluarga Sasaran', 'sasaran', 'fas fa-fw fa-people-roof', 1),
(8, 6, 'Keluarga Beresiko Stunting', 'kbs', 'fas fa-fw fa-people-roof', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kbs`
--
ALTER TABLE `kbs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keluarga`
--
ALTER TABLE `keluarga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sasaran`
--
ALTER TABLE `sasaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kbs`
--
ALTER TABLE `kbs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `keluarga`
--
ALTER TABLE `keluarga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sasaran`
--
ALTER TABLE `sasaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
