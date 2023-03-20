-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2023 at 03:01 AM
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
-- Database: `dbpengaduan_masyarakat`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletetanggapan` (IN `id_tang` CHAR(10))   delete from tanggapan where id_tanggapan = id_tang$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertmasyarakat` (IN `nik_masy` VARCHAR(16), IN `nama_masy` VARCHAR(35), IN `username_masy` VARCHAR(25), IN `password_masy` VARCHAR(255), IN `telp_masy` VARCHAR(13))   insert into masyarakat (nik, nama, username, password, telp) values (nik_masy, nama_masy, username_masy, password_masy, telp_masy)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_petugas` (IN `id_ptgs` INT(11), IN `nama_ptgs` VARCHAR(35), IN `username_ptgs` VARCHAR(25), IN `password_ptgs` VARCHAR(32), IN `telp_ptgs` VARCHAR(13), IN `level_ptgs` ENUM('petugas','admin'))   INSERT INTO petugas(id_petugas,nama_petugas,username,password,telp_petugas,level) values (id_ptgs,nama_ptgs,
 username_ptgs ,password_ptgs,telp_ptgs,level_ptgs)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECTmasyarakat` ()   BEGIN
SELECT nik, nama FROM masyarakat;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatemasyarakat` (IN `nik_mas` VARCHAR(16), IN `user_masy` VARCHAR(35))   update masyarakat set username = user_masy where nik = nik_mas$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatepengaduan` (IN `id_peng` INT(11), IN `tgl_peng` DATE)   update pengaduan set tgl_pengaduan = tgl_peng where id_pengaduan = id_peng$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `data_pengaduan`
-- (See below for the actual view)
--
CREATE TABLE `data_pengaduan` (
`nik` varchar(16)
,`nama` varchar(35)
,`tgl_pengaduan` date
,`isi_laporan` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `detail_pengaduan`
-- (See below for the actual view)
--
CREATE TABLE `detail_pengaduan` (
`nik` varchar(16)
,`nama` varchar(35)
,`isi_tanggapan` text
,`nama_petugas` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` varchar(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama`, `username`, `password`, `telp`) VALUES
('122', 'Ina', 'ina', '202cb962ac59075b964b07152d234b70', '0847465'),
('202110065003', 'Ananda', 'ananda', '202cb962ac59075b964b07152d234b70', '085647463'),
('202110065017', 'Imas', 'imas', '202cb962ac59075b964b07152d234b70', '08453627'),
('202110065020', 'Mara', 'mara', '202cb962ac59075b964b07152d234b70', '08536488633'),
('202110065021', 'Mila', 'mila', '202cb962ac59075b964b07152d234b70', '08264769779'),
('202110065027', 'Rahma', 'rahma', '202cb962ac59075b964b07152d234b70', '085264757858'),
('202110065031', 'Risella', 'risella', '202cb962ac59075b964b07152d234b70', '084639487'),
('202110065032', 'Sopi', 'sopi', '202cb962ac59075b964b07152d234b70', '085694576'),
('320111', 'Fitri', 'fitri', '202cb962ac59075b964b07152d234b70', '08365767'),
('320113', 'Ikhsan', 'ikhsan', '202cb962ac59075b964b07152d234b70', '08536727474');

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(5) NOT NULL,
  `tgl_pengaduan` date NOT NULL,
  `nik` varchar(16) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('proses','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `isi_laporan`, `foto`, `status`) VALUES
(1, '2023-03-02', '202110065032', 'hi', '', 'selesai'),
(41, '2023-03-04', '202110065031', 'hdjhe', '1608460659649.jpg', 'proses'),
(44, '2023-03-13', '202110065017', 'Selamat Datang', '1607295510656.jpg', 'selesai'),
(45, '2023-03-13', '122', 'hello', '1602562340579.jpg', 'proses'),
(48, '2023-03-16', '202110065003', 'Tolong', '1602562349248.jpg', 'proses'),
(49, '2023-03-16', '320113', 'Sampah Kotor', 'Sampah.jpeg', 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(5) NOT NULL,
  `nama_petugas` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp_petugas` varchar(13) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp_petugas`, `level`) VALUES
(1, 'Admin', 'admin', '202cb962ac59075b964b07152d234b70', '0876567675', 'admin'),
(2, 'Nova', 'nova', '202cb962ac59075b964b07152d234b70', '05857478', 'petugas'),
(3, 'Sopia Turrohmah', 'Sopi', '202cb962ac59075b964b07152d234b70', '06857648', 'admin'),
(4, 'Petugas', 'petugas', '202cb962ac59075b964b07152d234b70', '087654890', 'petugas'),
(114, 'raudhatun aulya', 'Aulya', '202cb962ac59075b964b07152d234b70', '0854637', 'petugas'),
(115, 'Fitri Fadilah', 'Fitri', '202cb962ac59075b964b07152d234b70', '0846353473', 'admin'),
(116, 'adi', 'Adi', '202cb962ac59075b964b07152d234b70', '0857463648335', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(5) NOT NULL,
  `id_pengaduan` int(5) NOT NULL,
  `tgl_tanggapan` date NOT NULL,
  `isi_tanggapan` text NOT NULL,
  `id_petugas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `isi_tanggapan`, `id_petugas`) VALUES
(17, 1, '2023-03-02', 'hello', 1),
(18, 41, '2023-03-04', 'hfkjgt', 1),
(19, 44, '2023-03-13', 'hfkdhjfrjo', 1),
(20, 45, '2023-03-13', 'hai', 1),
(21, 48, '2023-03-16', 'menolong', 1),
(22, 49, '2023-03-16', 'Bersihkan', 1);

-- --------------------------------------------------------

--
-- Structure for view `data_pengaduan`
--
DROP TABLE IF EXISTS `data_pengaduan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_pengaduan`  AS   (select `masyarakat`.`nik` AS `nik`,`masyarakat`.`nama` AS `nama`,`pengaduan`.`tgl_pengaduan` AS `tgl_pengaduan`,`pengaduan`.`isi_laporan` AS `isi_laporan` from (`masyarakat` join `pengaduan`) where `masyarakat`.`nik` = `pengaduan`.`nik`)  ;

-- --------------------------------------------------------

--
-- Structure for view `detail_pengaduan`
--
DROP TABLE IF EXISTS `detail_pengaduan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_pengaduan`  AS   (select `pengaduan`.`nik` AS `nik`,`masyarakat`.`nama` AS `nama`,`tanggapan`.`isi_tanggapan` AS `isi_tanggapan`,`petugas`.`nama_petugas` AS `nama_petugas` from (((`pengaduan` join `masyarakat`) join `tanggapan`) join `petugas`) where `masyarakat`.`nik` = `pengaduan`.`nik` and `pengaduan`.`id_pengaduan` = `tanggapan`.`id_pengaduan` and `petugas`.`id_petugas` = `tanggapan`.`id_petugas`)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`),
  ADD KEY `id_pengaduan` (`id_pengaduan`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `masyarakat` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `tanggapan_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tanggapan_ibfk_2` FOREIGN KEY (`id_pengaduan`) REFERENCES `pengaduan` (`id_pengaduan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
