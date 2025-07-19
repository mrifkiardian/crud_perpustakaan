-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Waktu pembuatan: 19 Jul 2025 pada 13.20
-- Versi server: 8.0.40
-- Versi PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `authors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isbn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `title`, `description`, `authors`, `isbn`, `created_at`, `updated_at`, `deleted_at`) VALUES
(26, 'Dilan 1990', 'ini cerita Dilan', 'Padi Baiq', '978-602-7870-91-8', '2025-07-17 21:13:53', '2025-07-17 21:18:46', NULL),
(27, 'Bumi Manusia', 'Novel Bumi Manusia', 'Pramoedya Ananta Toer', '978-979-97312-2-2', '2025-07-17 21:16:44', '2025-07-17 21:16:44', NULL),
(28, 'Laskar Pelangi', 'Novel Laskar Pelangi', 'Andrea Hirata', '978-979-3062-79-7', '2025-07-17 21:17:20', '2025-07-17 21:17:20', NULL),
(29, 'Pendidikan untuk Pembangunan', 'ini buku Pendidikan untuk Pembangunan', 'Darmaningtyas', '978-979-8184-68-5', '2025-07-17 21:17:51', '2025-07-17 21:17:51', NULL),
(30, 'Clean Code', 'ini Buku Clean Code', 'Robert C. Martin', '978-0132350884', '2025-07-17 21:18:23', '2025-07-17 21:18:23', NULL),
(31, 'Deep Learning', 'ini Buku Deep Learning', 'Ian Goodfellow, Yoshua Bengio, Aaron Courville', '978-0262035613', '2025-07-19 05:36:05', '2025-07-19 05:36:05', NULL),
(32, 'Pedagogy of the Oppressed', 'ini buku Pedagogy of the Oppressed', 'Paulo Freire', '978-0826412768', '2025-07-19 05:45:37', '2025-07-19 05:45:37', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `book_categories`
--

CREATE TABLE `book_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `book_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `book_categories`
--

INSERT INTO `book_categories` (`id`, `book_id`, `category_id`, `created_at`, `updated_at`) VALUES
(46, 26, 1, NULL, NULL),
(47, 27, 1, NULL, NULL),
(48, 28, 1, NULL, NULL),
(49, 29, 2, NULL, NULL),
(50, 30, 3, NULL, NULL),
(53, 31, 3, NULL, NULL),
(54, 32, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-budi@gmail.com|127.0.0.1', 'i:2;', 1752915401),
('laravel-cache-budi@gmail.com|127.0.0.1:timer', 'i:1752915401;', 1752915401);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Novel', '2025-07-17 01:58:16', '2025-07-17 01:58:16', NULL),
(2, 'Education', '2025-07-17 01:58:16', '2025-07-17 01:58:16', NULL),
(3, 'Technology', '2025-07-17 01:58:16', '2025-07-17 01:58:16', NULL),
(4, 'History', '2025-07-17 01:58:16', '2025-07-17 01:58:16', NULL),
(5, 'Science', '2025-07-17 01:58:16', '2025-07-17 01:58:16', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `loans`
--

CREATE TABLE `loans` (
  `id` bigint UNSIGNED NOT NULL,
  `book_id` bigint UNSIGNED NOT NULL,
  `librarian_id` bigint UNSIGNED NOT NULL,
  `member_id` bigint UNSIGNED NOT NULL,
  `loan_at` datetime NOT NULL,
  `returned_at` datetime DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `loans`
--

INSERT INTO `loans` (`id`, `book_id`, `librarian_id`, `member_id`, `loan_at`, `returned_at`, `note`, `created_at`, `updated_at`) VALUES
(24, 26, 37, 24, '2025-07-19 17:10:00', '2025-07-26 17:10:00', 'PInjam Ya', '2025-07-19 03:10:23', '2025-07-19 03:10:23'),
(25, 26, 37, 39, '2025-07-19 19:11:00', '2025-07-26 19:11:00', 'Mau Pinjam ini yaaa!', '2025-07-19 05:11:27', '2025-07-19 05:11:27'),
(26, 29, 37, 39, '2025-07-20 20:48:00', '2025-07-31 19:47:00', 'Mau Pinjem ini', '2025-07-19 05:48:14', '2025-07-19 05:48:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_07_17_083312_create_users_table', 1),
(2, '2025_07_17_083708_create_books_table', 1),
(3, '2025_07_17_084014_create_categories_table', 1),
(4, '2025_07_17_084611_create_book_categories_table', 1),
(5, '2025_07_17_084816_create_loans_table', 1),
(6, '2025_07_19_022836_add_password_to_users_table', 2),
(7, '2025_07_19_024250_create_cache_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('librarian','member','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `role`, `created_at`, `updated_at`, `deleted_at`, `password`, `remember_token`) VALUES
(24, 'Andi Pratama', 'andi@gmail.com', '0812-3456-7890', 'Jl. Merdeka No. 10, Jakarta', 'member', '2025-07-17 21:20:11', '2025-07-17 21:20:11', NULL, NULL, NULL),
(26, 'Budi Santoso', 'Budi@gmail.com', '0857-6543-2109', 'Jl. Ahmad Yani No. 20, Surabaya', 'member', '2025-07-17 21:21:08', '2025-07-17 21:21:08', NULL, NULL, NULL),
(36, 'Administrator', 'admin@example.com', '081234567890', 'Alamat admin', 'admin', '2025-07-18 19:48:00', '2025-07-19 05:10:49', NULL, '$2y$12$ZLRSxDOzyouN9o9I/7NiUeOmL1vRoXDAgnoZOOY3MIdHVe576lGdy', NULL),
(37, 'Librarian', 'librarian@example.com', '081234567891', 'Alamat librarian', 'librarian', '2025-07-19 00:56:14', '2025-07-19 05:10:49', NULL, '$2y$12$LquLs7YX6.BxDA7TwffNfeiwvaccGcs36DzNuTYsuVAjKUTLOuFDO', NULL),
(39, 'Test', 'member@example.com', '08123456781', 'Member Address 1', 'member', '2025-07-19 04:51:49', '2025-07-19 05:10:50', NULL, '$2y$12$aa0l4TuyiBB4Xy//fQuplOLSuvgh00FWAKXqHDKR2kTBTSkgiKNsa', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `book_categories`
--
ALTER TABLE `book_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_categories_book_id_category_id_unique` (`book_id`,`category_id`),
  ADD KEY `book_categories_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loans_book_id_foreign` (`book_id`),
  ADD KEY `loans_librarian_id_foreign` (`librarian_id`),
  ADD KEY `loans_member_id_foreign` (`member_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `book_categories`
--
ALTER TABLE `book_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `book_categories`
--
ALTER TABLE `book_categories`
  ADD CONSTRAINT `book_categories_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `loans_librarian_id_foreign` FOREIGN KEY (`librarian_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `loans_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
