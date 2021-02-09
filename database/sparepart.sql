-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 10 jan 2019 pada 12.38
-- Versi Server: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sparepart`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE IF NOT EXISTS `detail_pesanan` (
`id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `pesanan_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id`, `produk_id`, `qty`, `pesanan_id`) VALUES
(1, 9, 1, 1),
(2, 8, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `info_pembayaran`
--

CREATE TABLE IF NOT EXISTS `info_pembayaran` (
`id` int(11) NOT NULL,
  `info` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `info_pembayaran`
--

INSERT INTO `info_pembayaran` (`id`, `info`) VALUES
(1, 'Transaksi pembayaran bisa di bayar DP 50% dulu sebelum hari H.\r\n Atau langsung lunas. jika tidak maka transaksi akan di batalkan .\r\n\r\nPembayaran Transaksi Bisa Melalui Rekening Di Bawah Ini\r\nBCA => 6729912484 a/n Teguh Virgy\r\n\r\nkemudian konfirmasi pembayaran bisa di menu pembayaran');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_produk`
--

CREATE TABLE IF NOT EXISTS `kategori_produk` (
`id` int(3) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_produk`
--

INSERT INTO `kategori_produk` (`id`, `nama`, `deskripsi`) VALUES
(9, 'Sparepart', 'sparepart motor');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak`
--

CREATE TABLE IF NOT EXISTS `kontak` (
`id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subjek` varchar(200) NOT NULL,
  `pesan` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kontak`
--

INSERT INTO `kontak` (`id`, `nama`, `email`, `subjek`, `pesan`) VALUES
(15, '', 'meryayu@gmail.com', '', ''),
(16, '', 'mhmmddeni8@gmail.com', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
`id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kota`
--

INSERT INTO `kota` (`id`, `nama`, `ongkir`) VALUES
(2, 'jakarta barat', 15000),
(3, 'jakarta timur', 15000),
(4, 'jakarta selatan', 15000),
(5, 'bekasi', 10000),
(6, 'jakarta utara', 15000),
(7, 'bogor', 18000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
`id` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `status` enum('pending','verified','','') NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `id_pesanan`, `id_user`, `file`, `total`, `status`, `keterangan`, `created_at`) VALUES
(4, 1, 6, '49eb6a44db57cba8d66b3404fa9f0ad41130817_12bb07c5-eb1b-4e0a-9836-ffba6a72a300.jpg', 280000, 'verified', '', '2019-01-19 04:26:40'),
(6, 2, 6, '49eb6a44db57cba8d66b3404fa9f0ad4bcaa.jpg', 225000, 'verified', '', '2019-01-19 04:30:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE IF NOT EXISTS `pesanan` (
`id` int(5) NOT NULL,
  `tanggal_pesan` datetime NOT NULL,
  `tanggal_digunakan` datetime NOT NULL,
  `user_id` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `read` enum('0','1') NOT NULL,
  `status` enum('lunas','belum lunas','','') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `tanggal_pesan`, `tanggal_digunakan`, `user_id`, `nama`, `alamat`, `kota`, `ongkir`, `telephone`, `read`, `status`) VALUES
(1, '2019-01-19 13:18:41', '2018-09-13 00:00:00', 6, 'muhammad deni', 'jl jakarta timur rt 12 / rw 06 no 24', 'Semarang', 40000, '083870201566', '1', 'lunas'),
(2, '2019-01-19 13:27:44', '2018-09-13 00:00:00', 6, 'muhammad deni', 'jl jakarta timur rt 12 / rw 06 no 24', 'jakarta timur', 15000, '083870201566', '1', 'lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
`id` int(4) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `kategori_produk_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `deskripsi`, `gambar`, `harga`, `kategori_produk_id`) VALUES
(4, 'cakram', 'Barang Original ', '49eb6a44db57cba8d66b3404fa9f0ad41547093648123.jpg', '150000', 9),
(5, 'shok becker belakang', 'Barang Original', '49eb6a44db57cba8d66b3404fa9f0ad41547093645976.jpg', '160000', 9),
(6, 'Spakbor Depan', 'Produk asli dan original', '49eb6a44db57cba8d66b3404fa9f0ad41547093640080.jpg', '130000', 9),
(7, 'paketan seher', 'barang jamin ori 100% dan asli ', '49eb6a44db57cba8d66b3404fa9f0ad41547093638508.jpg', '170000', 9),
(8, 'karet tangki', 'karet tangki ini asli ori dan barang bagus', '49eb6a44db57cba8d66b3404fa9f0ad41547093637140.jpg', '210000', 9),
(9, 'Rx King Original', 'barang bagus 100% original', '49eb6a44db57cba8d66b3404fa9f0ad41547093641635.jpg', '240000', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` enum('user','admin') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `telephone`, `alamat`, `password`, `status`) VALUES
(1, 'Administrator', 'admin@gmail.com', '08985432330', 'Semarang Ajah', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(6, 'muhammad deni', 'mhmmddeni8@gmail.com', '083870201566', 'jl jakarta timur rt 12 / rw 06 no 24', '57b48b56ba5f84e4c1667963026fb808', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
 ADD PRIMARY KEY (`id`,`produk_id`,`pesanan_id`), ADD KEY `pesanan_id` (`pesanan_id`), ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `info_pembayaran`
--
ALTER TABLE `info_pembayaran`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kontak`
--
ALTER TABLE `kontak`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
 ADD PRIMARY KEY (`id`,`user_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
 ADD PRIMARY KEY (`id`,`kategori_produk_id`), ADD KEY `kategori_produk_id` (`kategori_produk_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `info_pembayaran`
--
ALTER TABLE `info_pembayaran`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `kontak`
--
ALTER TABLE `kontak`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
ADD CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `detail_pesanan_ibfk_3` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_produk_id`) REFERENCES `kategori_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
