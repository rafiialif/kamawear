-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table clothing.detail_pesanan
CREATE TABLE IF NOT EXISTS `detail_pesanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produk_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `pesanan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`produk_id`,`pesanan_id`),
  KEY `pesanan_id` (`pesanan_id`),
  KEY `produk_id` (`produk_id`),
  CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_pesanan_ibfk_3` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table clothing.detail_pesanan: ~2 rows (approximately)
/*!40000 ALTER TABLE `detail_pesanan` DISABLE KEYS */;
INSERT INTO `detail_pesanan` (`id`, `produk_id`, `qty`, `pesanan_id`) VALUES
	(1, 9, 1, 1),
	(2, 8, 1, 2);
/*!40000 ALTER TABLE `detail_pesanan` ENABLE KEYS */;

-- Dumping structure for table clothing.info_pembayaran
CREATE TABLE IF NOT EXISTS `info_pembayaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table clothing.info_pembayaran: ~0 rows (approximately)
/*!40000 ALTER TABLE `info_pembayaran` DISABLE KEYS */;
INSERT INTO `info_pembayaran` (`id`, `info`) VALUES
	(1, 'Transaksi pembayaran bisa di bayar DP 50% dulu sebelum hari H.\r\n Atau langsung lunas. jika tidak maka transaksi akan di batalkan .\r\n\r\nPembayaran Transaksi Bisa Melalui Rekening Di Bawah Ini\r\nBCA => 6729912484 a/n Teguh Virgy\r\n\r\nkemudian konfirmasi pembayaran bisa di menu pembayaran');
/*!40000 ALTER TABLE `info_pembayaran` ENABLE KEYS */;

-- Dumping structure for table clothing.kategori_produk
CREATE TABLE IF NOT EXISTS `kategori_produk` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table clothing.kategori_produk: ~2 rows (approximately)
/*!40000 ALTER TABLE `kategori_produk` DISABLE KEYS */;
INSERT INTO `kategori_produk` (`id`, `nama`, `deskripsi`) VALUES
	(9, 'Shirt', 'Shirt Keren'),
	(10, 'T-Shirt', 'T-Shirt Keren');
/*!40000 ALTER TABLE `kategori_produk` ENABLE KEYS */;

-- Dumping structure for table clothing.kontak
CREATE TABLE IF NOT EXISTS `kontak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subjek` varchar(200) NOT NULL,
  `pesan` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table clothing.kontak: ~2 rows (approximately)
/*!40000 ALTER TABLE `kontak` DISABLE KEYS */;
INSERT INTO `kontak` (`id`, `nama`, `email`, `subjek`, `pesan`) VALUES
	(15, '', 'meryayu@gmail.com', '', ''),
	(16, '', 'mhmmddeni8@gmail.com', '', '');
/*!40000 ALTER TABLE `kontak` ENABLE KEYS */;

-- Dumping structure for table clothing.kota
CREATE TABLE IF NOT EXISTS `kota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table clothing.kota: ~6 rows (approximately)
/*!40000 ALTER TABLE `kota` DISABLE KEYS */;
INSERT INTO `kota` (`id`, `nama`, `ongkir`) VALUES
	(2, 'jakarta barat', 15000),
	(3, 'jakarta timur', 15000),
	(4, 'jakarta selatan', 15000),
	(5, 'bekasi', 10000),
	(6, 'jakarta utara', 15000),
	(7, 'bogor', 18000);
/*!40000 ALTER TABLE `kota` ENABLE KEYS */;

-- Dumping structure for table clothing.pembayaran
CREATE TABLE IF NOT EXISTS `pembayaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesanan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `status` enum('pending','verified','','') NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table clothing.pembayaran: ~2 rows (approximately)
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
INSERT INTO `pembayaran` (`id`, `id_pesanan`, `id_user`, `file`, `total`, `status`, `keterangan`, `created_at`) VALUES
	(4, 1, 6, '49eb6a44db57cba8d66b3404fa9f0ad41130817_12bb07c5-eb1b-4e0a-9836-ffba6a72a300.jpg', 280000, 'verified', '', '2019-01-19 04:26:40'),
	(6, 2, 6, '49eb6a44db57cba8d66b3404fa9f0ad4bcaa.jpg', 225000, 'verified', '', '2019-01-19 04:30:26');
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;

-- Dumping structure for table clothing.pesanan
CREATE TABLE IF NOT EXISTS `pesanan` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tanggal_pesan` datetime NOT NULL,
  `tanggal_digunakan` datetime NOT NULL,
  `user_id` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `read` enum('0','1') NOT NULL,
  `status` enum('lunas','belum lunas','','') NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table clothing.pesanan: ~2 rows (approximately)
/*!40000 ALTER TABLE `pesanan` DISABLE KEYS */;
INSERT INTO `pesanan` (`id`, `tanggal_pesan`, `tanggal_digunakan`, `user_id`, `nama`, `alamat`, `kota`, `ongkir`, `telephone`, `read`, `status`) VALUES
	(1, '2019-01-19 13:18:41', '2018-09-13 00:00:00', 6, 'muhammad deni', 'jl jakarta timur rt 12 / rw 06 no 24', 'Semarang', 40000, '083870201566', '1', 'lunas'),
	(2, '2019-01-19 13:27:44', '2018-09-13 00:00:00', 6, 'muhammad deni', 'jl jakarta timur rt 12 / rw 06 no 24', 'jakarta timur', 15000, '083870201566', '1', 'lunas');
/*!40000 ALTER TABLE `pesanan` ENABLE KEYS */;

-- Dumping structure for table clothing.produk
CREATE TABLE IF NOT EXISTS `produk` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `kategori_produk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`kategori_produk_id`),
  KEY `kategori_produk_id` (`kategori_produk_id`),
  CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_produk_id`) REFERENCES `kategori_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table clothing.produk: ~6 rows (approximately)
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` (`id`, `nama`, `deskripsi`, `gambar`, `harga`, `kategori_produk_id`) VALUES
	(4, 'Bloom 1', 'Barang Original ', '49eb6a44db57cba8d66b3404fa9f0ad4bloom black.jpg', 150000, 10),
	(5, 'Bloom 2', 'Barang Original', '49eb6a44db57cba8d66b3404fa9f0ad4bloom depan (1).jpg', 150000, 10),
	(6, 'Bloom 3', 'Barang Original', '49eb6a44db57cba8d66b3404fa9f0ad4bloom belakang.jpg', 150000, 10),
	(7, 'Melt 1', 'Barang Original', '49eb6a44db57cba8d66b3404fa9f0ad4melt black.jpg', 150000, 10),
	(8, 'Melt 2', 'Barang Original', '49eb6a44db57cba8d66b3404fa9f0ad4melt belakang hitam.jpg', 150000, 10),
	(9, 'Melt 3', 'Barang Original', '49eb6a44db57cba8d66b3404fa9f0ad4melt depan hitam.jpg', 150000, 10);
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;

-- Dumping structure for table clothing.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` enum('user','admin') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table clothing.user: ~3 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `nama`, `email`, `telephone`, `alamat`, `password`, `status`) VALUES
	(1, 'Administrator', 'admin@gmail.com', '08985432330', 'Semarang Ajah', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
	(6, 'muhammad deni', 'mhmmddeni8@gmail.com', '083870201566', 'jl jakarta timur rt 12 / rw 06 no 24', '57b48b56ba5f84e4c1667963026fb808', 'user'),
	(9, 'pandu', 'krisnamurtipandu2516@gmail.com', '085773194893', 'komplek dolog jaya no 211 rt003 rw016', 'bad4240fed135304cfa9a5b56537ad7b', 'user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
