-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Nov 2021 pada 11.18
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan`
--

CREATE TABLE `bahan` (
  `idBahan` varchar(10) NOT NULL,
  `bahan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `idBarang` varchar(11) NOT NULL,
  `gambar` blob NOT NULL,
  `berat` int(11) NOT NULL,
  `idBahan` varchar(10) NOT NULL,
  `custom` enum('Bisa','Tidak Bisa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `idCustomer` varchar(10) NOT NULL,
  `gambar` blob NOT NULL,
  `namaCustomer` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `tanggalLahir` date NOT NULL,
  `jenisKelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `jalan` varchar(30) NOT NULL,
  `idKabupaten` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_barang`
--

CREATE TABLE `detail_barang` (
  `idBarang` varchar(10) NOT NULL,
  `idBahan` varchar(10) NOT NULL,
  `namaBarang` varchar(30) NOT NULL,
  `bahan` enum('Jati','Mahoni','Sengon') NOT NULL,
  `stock` int(11) NOT NULL,
  `harga` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kabupaten`
--

CREATE TABLE `kabupaten` (
  `idKabupaten` varchar(10) NOT NULL,
  `kabupaten` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan_adminitrasi`
--

CREATE TABLE `karyawan_adminitrasi` (
  `idKaryawan` varchar(10) NOT NULL,
  `gambar` blob NOT NULL,
  `namaKaryawan` varchar(30) NOT NULL,
  `tanggalLahirKaryawan` date NOT NULL,
  `idAsal` varchar(10) NOT NULL,
  `teleponKaryawan` varchar(15) NOT NULL,
  `tanggalMasukKaryawan` date NOT NULL,
  `statusKaryawan` enum('Aktif','Cuti','Pensiun') NOT NULL,
  `keterangan` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kecamatan`
--

CREATE TABLE `kecamatan` (
  `idKecamatan` varchar(10) NOT NULL,
  `kecamatan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kode_pesanan`
--

CREATE TABLE `kode_pesanan` (
  `kodePesanan` varchar(10) NOT NULL,
  `namaBarang` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `idPembayaran` varchar(10) NOT NULL,
  `kodePesanan` varchar(10) NOT NULL,
  `tanggalPembayaran` date NOT NULL,
  `metodePembayaran` varchar(30) NOT NULL,
  `statusPembayaran` varchar(30) NOT NULL,
  `totalPembayaran` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemilik usaha`
--

CREATE TABLE `pemilik usaha` (
  `idPemilikUsaha` varchar(10) NOT NULL,
  `gambar` blob NOT NULL,
  `namaUsaha` varchar(30) NOT NULL,
  `jenisUsaha` varchar(30) NOT NULL,
  `tahunBerdiri` year(4) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `teleponPerusahaan` varchar(15) NOT NULL,
  `namaPemilikUsaha` varchar(30) NOT NULL,
  `tempatLahir` varchar(30) NOT NULL,
  `tanggalLahir` date NOT NULL,
  `jalan` varchar(30) NOT NULL,
  `idKabupaten` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `idPesanan` varchar(10) NOT NULL,
  `namaBarang` varchar(30) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `idBahan` varchar(10) NOT NULL,
  `custom` enum('Ya','Tidak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review`
--

CREATE TABLE `review` (
  `idReview` varchar(10) NOT NULL,
  `idBarang` varchar(10) NOT NULL,
  `gambar` blob NOT NULL,
  `komentar` varchar(50) NOT NULL,
  `rating` enum('1','2','3','4','5') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`idBahan`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`idBarang`),
  ADD KEY `idBahan` (`idBahan`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`idCustomer`),
  ADD KEY `idKabupaten` (`idKabupaten`);

--
-- Indeks untuk tabel `detail_barang`
--
ALTER TABLE `detail_barang`
  ADD PRIMARY KEY (`idBarang`),
  ADD KEY `idBahan` (`idBahan`);

--
-- Indeks untuk tabel `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`idKabupaten`);

--
-- Indeks untuk tabel `karyawan_adminitrasi`
--
ALTER TABLE `karyawan_adminitrasi`
  ADD PRIMARY KEY (`idKaryawan`),
  ADD KEY `idAsal` (`idAsal`);

--
-- Indeks untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`idKecamatan`);

--
-- Indeks untuk tabel `kode_pesanan`
--
ALTER TABLE `kode_pesanan`
  ADD PRIMARY KEY (`kodePesanan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`idPembayaran`),
  ADD KEY `kodePesanan` (`kodePesanan`);

--
-- Indeks untuk tabel `pemilik usaha`
--
ALTER TABLE `pemilik usaha`
  ADD PRIMARY KEY (`idPemilikUsaha`),
  ADD KEY `idKabupaten` (`idKabupaten`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`idPesanan`),
  ADD KEY `idBahan` (`idBahan`);

--
-- Indeks untuk tabel `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`idReview`),
  ADD KEY `idBarang` (`idBarang`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bahan`
--
ALTER TABLE `bahan`
  ADD CONSTRAINT `bahan_ibfk_1` FOREIGN KEY (`idBahan`) REFERENCES `detail_barang` (`idBahan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`idBahan`) REFERENCES `bahan` (`idBahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`idBarang`) REFERENCES `review` (`idBarang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`idKabupaten`) REFERENCES `kabupaten` (`idKabupaten`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_barang`
--
ALTER TABLE `detail_barang`
  ADD CONSTRAINT `detail_barang_ibfk_1` FOREIGN KEY (`idBarang`) REFERENCES `barang` (`idBarang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD CONSTRAINT `kabupaten_ibfk_1` FOREIGN KEY (`idKabupaten`) REFERENCES `karyawan_adminitrasi` (`idAsal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD CONSTRAINT `kecamatan_ibfk_1` FOREIGN KEY (`idKecamatan`) REFERENCES `kabupaten` (`idKabupaten`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`kodePesanan`) REFERENCES `kode_pesanan` (`kodePesanan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pemilik usaha`
--
ALTER TABLE `pemilik usaha`
  ADD CONSTRAINT `pemilik usaha_ibfk_1` FOREIGN KEY (`idKabupaten`) REFERENCES `kabupaten` (`idKabupaten`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`idBahan`) REFERENCES `bahan` (`idBahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`idPesanan`) REFERENCES `kode_pesanan` (`kodePesanan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
