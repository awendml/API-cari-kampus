-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Okt 2022 pada 12.41
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-cari-kampus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ikuti`
--

CREATE TABLE `ikuti` (
  `id_user` int(7) NOT NULL,
  `id_kampus` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ikuti`
--

INSERT INTO `ikuti` (`id_user`, `id_kampus`) VALUES
(2, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `id_kampus` int(7) NOT NULL,
  `nama_jurusan` varchar(255) NOT NULL,
  `fakultas` varchar(200) NOT NULL,
  `yang_dipelajari` text NOT NULL,
  `prospek_kerja` text NOT NULL,
  `biaya_kuliah` decimal(60,0) NOT NULL,
  `mata_kuliah` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `id_kampus`, `nama_jurusan`, `fakultas`, `yang_dipelajari`, `prospek_kerja`, `biaya_kuliah`, `mata_kuliah`) VALUES
(1, 1, 'Sistem informasi', '-', 'Perkuliahan sistem informasi meliputi teknik  pemrograman hingga proses bisnis perusahaan, seperti pengumpulan, penyaringan, pendistribusian, dan visualisasi data hingga proyek tren, yang digunakan untuk pengambilan keputusan perusahaan.', 'Data analyst, Data scienctist, Website Developer, Sofrtware Developer.', '1850000', 'Kalkulus, Statistik deskriptif, Big data, Pemrograman berorientasi objek, Sistem operasi, Jaringan komputer.'),
(2, 1, 'Sistem Komputer', '-', 'Ilmu yang berkaitan tentang komputasi, perangkat lunak dan perangkat keras, serta pemrograman di bidang Teknologi Informasi', '\r\nProgrammer, Web/Database Administrator, Software Engineer, Game Developer, Software Tester, Konsultan IT, Tenaga Pendidik, Wiraswasta', '1850000', ', Rekayasa Perangkat Lunak, Pemrograman Sistem, Sistem Digital, Sistem Cerdas, Jaringan Komputer, Data Science and Analytics, Analisis Numerik, Desain dan Analisis Algoritma.'),
(3, 2, 'Sistem Inormasi', '-', 'Mahasiswa jrursan ini belajar bagaimana mengidentifikasi kebutuhan serta proses bisnis berdasarkan data organisasi atau perusahaan, lantas merancang sistem pengolahan data sesuai kebutuhan.', 'Programmer, Web developer, Software engineer, System analyst', '2000000', 'Basis data, Pemrograman berorientasi objek, sistem Operasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kampus`
--

CREATE TABLE `kampus` (
  `id_kampus` int(7) NOT NULL,
  `nama_kampus` varchar(255) NOT NULL,
  `jenis` varchar(60) NOT NULL,
  `status` varchar(10) NOT NULL,
  `akreditasi` char(1) NOT NULL,
  `kontak` varchar(100) NOT NULL,
  `lokasi` text NOT NULL,
  `website` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kampus`
--

INSERT INTO `kampus` (`id_kampus`, `nama_kampus`, `jenis`, `status`, `akreditasi`, `kontak`, `lokasi`, `website`) VALUES
(1, 'Stmik Bina Bangsa', 'SWASTA', 'PTS', 'C', '0822222222', '', 'www.stmik.binsa.ac.id'),
(2, 'Universitas Handayani Makassar', 'SWASTA', 'PTS', 'C', '04114673395', '', 'https://handayani.ac.id/');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(7) NOT NULL,
  `nama_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`) VALUES
(1, 'Awen\r\n'),
(2, 'Rifan Hidayat\r\n');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ikuti`
--
ALTER TABLE `ikuti`
  ADD KEY `id_kampus` (`id_kampus`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`),
  ADD KEY `id_kampus` (`id_kampus`);

--
-- Indeks untuk tabel `kampus`
--
ALTER TABLE `kampus`
  ADD PRIMARY KEY (`id_kampus`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_kampus` (`nama_user`),
  ADD KEY `nama_user` (`nama_user`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ikuti`
--
ALTER TABLE `ikuti`
  ADD CONSTRAINT `ikuti_ibfk_1` FOREIGN KEY (`id_kampus`) REFERENCES `kampus` (`id_kampus`),
  ADD CONSTRAINT `ikuti_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`id_kampus`) REFERENCES `kampus` (`id_kampus`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
