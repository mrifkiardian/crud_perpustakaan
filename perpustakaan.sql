-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Waktu pembuatan: 18 Jul 2025 pada 07.16
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
(1, 'Eaque voluptas.', 'Laudantium commodi esse vitae vero praesentium laudantium voluptatem nam. Voluptas rerum neque quod voluptas voluptas minima ut. Quis distinctio qui et quae voluptatum. Sed accusamus dicta omnis et qui.', 'Ms. Susana Paucek MD', '9791487493966', '2025-07-17 01:58:16', '2025-07-17 21:14:14', '2025-07-17 21:14:14'),
(2, 'Quasi et quasi.', 'Quibusdam rerum nisi beatae facilis. Quas sunt est est et dolorem ipsam. Sunt aut aut assumenda reiciendis nesciunt. Voluptatibus est at porro eligendi et consequatur nam.', 'Miss Kaitlyn Thompson', '9789020310306', '2025-07-17 01:58:16', '2025-07-17 21:14:32', '2025-07-17 21:14:32'),
(3, 'Labore corporis enim ut.', 'Voluptates consequatur magnam adipisci in quo minima. Qui ut officia aliquam voluptas labore modi. Harum et porro laboriosam ea iusto.', 'Mr. Kurt Schumm', '9787649675721', '2025-07-17 01:58:16', '2025-07-17 21:14:23', '2025-07-17 21:14:23'),
(4, 'Quia et maiores.', 'Ut enim ipsam fugiat optio accusamus itaque. Illum assumenda commodi ea voluptas sed est. Commodi eveniet itaque facere non.', 'Ms. Maida O\'Conner', '9796079368486', '2025-07-17 01:58:16', '2025-07-17 21:14:34', '2025-07-17 21:14:34'),
(5, 'Explicabo nam est.', 'Iste rerum qui quia aut facere odit nostrum repellat. Sed accusamus quam in officia id delectus. Consequatur aut laborum beatae et. Illum reiciendis non consequatur enim fuga fuga sed.', 'Selina Schmeler', '9780983002796', '2025-07-17 01:58:16', '2025-07-17 06:13:01', '2025-07-17 06:13:01'),
(6, 'Impedit aut quia dolores.', 'Non praesentium doloremque totam consequatur. Blanditiis dolore excepturi dicta et. Quas tempora optio dolore cupiditate eius.', 'Prof. Dawn Pacocha Sr.', '9799616205046', '2025-07-17 01:58:16', '2025-07-17 21:14:21', '2025-07-17 21:14:21'),
(7, 'Rerum cumque quis.', 'Non impedit molestiae earum voluptatibus nam voluptas sunt dolorem. Qui nihil qui modi doloremque sed fuga omnis. Eum eligendi et quia sed qui ut in eaque. Nesciunt quod facere qui voluptate repellat sed.', 'Jonathon Smitham', '9794419290145', '2025-07-17 01:58:16', '2025-07-17 21:14:36', '2025-07-17 21:14:36'),
(8, 'Saepe culpa sequi expedita.', 'Provident quia amet in sunt dolorem id autem. Exercitationem voluptatem rerum dolor eaque ullam et. Nisi id et distinctio nisi nesciunt eos sapiente quos.', 'Wanda Roob V', '9784965029719', '2025-07-17 01:58:16', '2025-07-17 21:14:39', '2025-07-17 21:14:39'),
(9, 'Voluptatem voluptatem incidunt recusandae.', 'Non nisi dolor sit sunt. Omnis eveniet nesciunt et ut ratione aliquam. Voluptatibus labore id recusandae optio error.', 'Addison Wolf', '9792008717332', '2025-07-17 01:58:16', '2025-07-17 20:14:24', '2025-07-17 20:14:24'),
(10, 'Saepe nihil architecto alias.', 'Dignissimos quia ut est. Architecto rerum odit sunt nam a.', 'Cordell Mayert', '9787986659309', '2025-07-17 01:58:16', '2025-07-17 21:14:41', '2025-07-17 21:14:41'),
(11, 'Sint quasi distinctio et.', 'Earum laborum consequatur explicabo sint nihil in inventore. Qui occaecati accusantium voluptates possimus dolorem et placeat. Eos delectus voluptates atque non in.', 'Destini Goodwin', '9789636995256', '2025-07-17 01:58:16', '2025-07-17 21:14:44', '2025-07-17 21:14:44'),
(12, 'Earum quae quam.', 'Maxime itaque molestiae alias quia quibusdam. Sed doloremque rerum occaecati in commodi. Id animi repellendus labore deserunt velit.', 'Sydni Green V', '9784867675298', '2025-07-17 01:58:16', '2025-07-17 21:14:15', '2025-07-17 21:14:15'),
(13, 'Occaecati quaerat necessitatibus.', 'Quis minima ut minima est. Consectetur qui aspernatur doloremque amet et atque et. Quia ipsa fugiat ut delectus animi earum. Consequatur possimus iure nihil.', 'Prof. Anna Spencer', '9791622175092', '2025-07-17 01:58:16', '2025-07-17 21:14:28', '2025-07-17 21:14:28'),
(14, 'Minus nulla dignissimos quasi nam.', 'Quod itaque asperiores deserunt non maiores aut. Ullam sed animi earum omnis. Tempore quod facilis facilis. Enim nobis cum laudantium animi ut veniam cupiditate velit.', 'Theodore Jenkins', '9783080461435', '2025-07-17 01:58:16', '2025-07-17 21:14:26', '2025-07-17 21:14:26'),
(15, 'Adipisci id aut quidem nisi.', 'Omnis maiores voluptas odio non. Repellendus aut blanditiis repellat.', 'Miss Lia Robel', '9783312042180', '2025-07-17 01:58:16', '2025-07-17 19:56:07', '2025-07-17 19:56:07'),
(16, 'Quas odit labore molestiae.', 'Temporibus quia quo ea et adipisci consequatur est. Alias ratione fugiat quaerat quibusdam similique pariatur aut. Quam exercitationem consequatur ea. Fugiat reiciendis omnis ea libero.', 'Prof. Darion Schamberger DVM', '9785759284543', '2025-07-17 01:58:16', '2025-07-17 21:14:30', '2025-07-17 21:14:30'),
(17, 'Excepturi dicta eum ratione quia.', 'Voluptatum accusantium debitis aut iusto veniam error est. Modi odit autem distinctio. Ad iusto aliquid quia officia enim.', 'Maggie Huels', '9781004198603', '2025-07-17 01:58:16', '2025-07-17 21:14:19', '2025-07-17 21:14:19'),
(18, 'Ducimus tenetur.', 'Magnam omnis fugit sit facere. Laudantium non eius autem officiis est. Dicta sint qui itaque veniam ut. Nesciunt provident natus sequi.', 'Prof. Yolanda Altenwerth', '9786850451247', '2025-07-17 01:58:16', '2025-07-17 19:56:13', '2025-07-17 19:56:13'),
(19, 'Nesciunt rem.', 'Iste eius voluptatum enim maiores dolor. Quod nemo cupiditate libero voluptatem quia sed. Assumenda rerum deserunt qui magni esse itaque.', 'Wilburn Hermann', '9798832020198', '2025-07-17 01:58:16', '2025-07-17 06:55:45', '2025-07-17 06:55:45'),
(20, 'Enim voluptatem excepturi.', 'Odit modi ut repellat. Eos nobis eum nihil qui. Ut facere voluptates ipsam ipsa assumenda est.', 'Lenny Kling', '9799860597218', '2025-07-17 01:58:16', '2025-07-17 21:14:17', '2025-07-17 21:14:17'),
(21, 'alex', 'buku alexander', 'alexander', '2131804713', '2025-07-17 03:46:57', '2025-07-17 19:05:00', '2025-07-17 19:05:00'),
(22, 'sangkuriang final', 'apa aja boleh banget lah', 'alexander graham', 'jos banget pokok e 12345', '2025-07-17 18:59:44', '2025-07-17 19:05:32', '2025-07-17 19:05:32'),
(23, 'efefefefef', 'eee', 'edf', 'wee', '2025-07-17 20:13:31', '2025-07-17 20:14:16', '2025-07-17 20:14:16'),
(24, 'abc', 'abcde', 'abc', 'abc', '2025-07-17 20:19:47', '2025-07-17 20:19:55', '2025-07-17 20:19:55'),
(25, 'aa', 'cac', 'aa', 'aa', '2025-07-17 20:27:01', '2025-07-17 20:27:10', '2025-07-17 20:27:10'),
(26, 'Dilan 1990', 'ini cerita Dilan', 'Padi Baiq', '978-602-7870-91-8', '2025-07-17 21:13:53', '2025-07-17 21:18:46', NULL),
(27, 'Bumi Manusia', 'Novel Bumi Manusia', 'Pramoedya Ananta Toer', '978-979-97312-2-2', '2025-07-17 21:16:44', '2025-07-17 21:16:44', NULL),
(28, 'Laskar Pelangi', 'Novel Laskar Pelangi', 'Andrea Hirata', '978-979-3062-79-7', '2025-07-17 21:17:20', '2025-07-17 21:17:20', NULL),
(29, 'Pendidikan untuk Pembangunan', 'ini buku Pendidikan untuk Pembangunan', 'Darmaningtyas', '978-979-8184-68-5', '2025-07-17 21:17:51', '2025-07-17 21:17:51', NULL),
(30, 'Clean Code', 'ini Buku Clean Code', 'Robert C. Martin', '978-0132350884', '2025-07-17 21:18:23', '2025-07-17 21:18:23', NULL);

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
(10, 5, 1, '2025-07-17 01:58:16', '2025-07-17 01:58:16'),
(11, 5, 5, '2025-07-17 01:58:16', '2025-07-17 01:58:16'),
(34, 19, 3, '2025-07-17 01:58:16', '2025-07-17 01:58:16'),
(35, 19, 4, '2025-07-17 01:58:16', '2025-07-17 01:58:16'),
(36, 19, 5, '2025-07-17 01:58:16', '2025-07-17 01:58:16'),
(46, 26, 1, NULL, NULL),
(47, 27, 1, NULL, NULL),
(48, 28, 1, NULL, NULL),
(49, 29, 2, NULL, NULL),
(50, 30, 3, NULL, NULL);

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
(5, 'Science', '2025-07-17 01:58:16', '2025-07-17 01:58:16', NULL),
(6, 'minyak', '2025-07-17 04:16:23', '2025-07-17 04:16:41', '2025-07-17 04:16:41'),
(7, 'ahah', '2025-07-17 16:04:56', '2025-07-17 21:15:38', '2025-07-17 21:15:38'),
(8, 'djdj', '2025-07-17 16:05:00', '2025-07-17 19:12:52', '2025-07-17 19:12:52'),
(9, 'adhah', '2025-07-17 16:05:03', '2025-07-17 21:15:36', '2025-07-17 21:15:36'),
(10, 'adhahd', '2025-07-17 16:05:05', '2025-07-17 21:15:34', '2025-07-17 21:15:34'),
(11, 'ajdhd', '2025-07-17 16:05:08', '2025-07-17 21:15:31', '2025-07-17 21:15:31'),
(12, 'andbcadc', '2025-07-17 16:05:14', '2025-07-17 19:13:15', '2025-07-17 19:13:15'),
(13, 'novel jawa tengah', '2025-07-17 19:16:38', '2025-07-17 19:16:53', '2025-07-17 19:16:53'),
(14, 'astronomi indonesia', '2025-07-17 20:27:30', '2025-07-17 20:27:44', '2025-07-17 20:27:44');

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
(22, 26, 27, 24, '2025-07-18 11:24:00', '2025-07-25 11:24:00', 'Pinjam Ya!', '2025-07-17 21:24:32', '2025-07-17 21:24:32');

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
(5, '2025_07_17_084816_create_loans_table', 1);

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
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin User', 'admin@example.com', '989.462.3807', '8319 Wehner Ridge Suite 401\nPort Kristin, UT 90030', 'admin', '2025-07-17 01:58:16', '2025-07-17 02:56:29', '2025-07-17 02:56:29'),
(2, 'Bailey Walsh Sr.', 'olaf68@example.org', '408-220-3132', '873 Sim Cliff Apt. 568\nSouth Constantin, DC 05048-2720', 'librarian', '2025-07-17 01:58:16', '2025-07-17 21:22:54', '2025-07-17 21:22:54'),
(3, 'Mr. Ervin Schroeder', 'shyann97@example.org', '831.672.6789', '118 McGlynn Streets Suite 755\nAyanaland, VT 91523-7062', 'librarian', '2025-07-17 01:58:16', '2025-07-17 02:56:35', '2025-07-17 02:56:35'),
(4, 'Mr. Loy Schmidt V', 'lubowitz.luna@example.net', '+1.713.478.2133', '2472 Kaycee Trace\nLake Olga, AK 82882-1898', 'librarian', '2025-07-17 01:58:16', '2025-07-17 21:23:15', '2025-07-17 21:23:15'),
(5, 'Maryam Lueilwitz', 'satterfield.eldora@example.com', '+1 (938) 823-6513', '889 Brant Plain Suite 266\nEast Abagailberg, MS 04004', 'member', '2025-07-17 01:58:16', '2025-07-17 18:13:41', '2025-07-17 18:13:41'),
(6, 'Liam Altenwerth II', 'ukessler@example.org', '(515) 757-2187', '7266 Dicki Row\nMannchester, VT 51580', 'member', '2025-07-17 01:58:16', '2025-07-17 21:23:09', '2025-07-17 21:23:09'),
(7, 'Marjory Parisian', 'wilderman.margret@example.com', '(210) 337-1417', '131 Rogers Isle\nKuphalview, TN 81181', 'member', '2025-07-17 01:58:16', '2025-07-17 21:23:13', '2025-07-17 21:23:13'),
(8, 'Destiney Gulgowski', 'claudine.schroeder@example.com', '+15596864278', '328 Darrel Lodge Apt. 953\nJaskolskiside, IL 44002', 'member', '2025-07-17 01:58:16', '2025-07-17 21:23:01', '2025-07-17 21:23:01'),
(9, 'Dr. Eldridge Gottlieb V', 'nboehm@example.org', '336.372.4769', '985 Koelpin Summit Suite 610\nNew Danefort, WI 61134-0080', 'member', '2025-07-17 01:58:16', '2025-07-17 21:23:04', '2025-07-17 21:23:04'),
(10, 'Vance Zieme II', 'runolfsdottir.burnice@example.org', '872-446-1922', '8502 Heidi Mill\nPort Mateomouth, TX 93554-2252', 'member', '2025-07-17 01:58:16', '2025-07-17 21:23:36', '2025-07-17 21:23:36'),
(11, 'Tina Bernier', 'schroeder.daisha@example.net', '+18044289003', '3586 Alec Falls\nEast Jett, AR 52956', 'member', '2025-07-17 01:58:16', '2025-07-17 21:23:32', '2025-07-17 21:23:32'),
(12, 'Cicero Boehm', 'fmetz@example.com', '+1-607-685-2898', '434 Murray Locks Apt. 088\nParisside, PA 75127-2889', 'member', '2025-07-17 01:58:16', '2025-07-17 21:23:00', '2025-07-17 21:23:00'),
(13, 'Ariane Farrell DDS', 'wshanahan@example.com', '540.927.7356', '260 Alexandrine ViaductWest Felipa, TN 42132', 'librarian', '2025-07-17 01:58:16', '2025-07-17 21:22:43', '2025-07-17 21:22:43'),
(14, 'Bart Larson', 'maia.aufderhar@example.net', '1-863-274-8401', '8648 Macejkovic Shore\nHomenickville, WA 95764-7995', 'member', '2025-07-17 01:58:16', '2025-07-17 21:22:57', '2025-07-17 21:22:57'),
(15, 'alex', 'alex@gmail.com', '0812345', 'alex house', 'member', '2025-07-17 02:34:27', '2025-07-17 02:56:39', '2025-07-17 02:56:39'),
(16, 'bagong', 'b@gmail.com', '0192383', 'jl bagong', 'member', '2025-07-17 16:04:25', '2025-07-17 21:22:50', '2025-07-17 21:22:50'),
(17, 'qsb', 'wjhsw@gmail.com', '1231313', 'swjsws', 'librarian', '2025-07-17 16:05:49', '2025-07-17 21:23:23', '2025-07-17 21:23:23'),
(18, 'asuc', 'uoead@d.com', '231239', 'eqkded', 'admin', '2025-07-17 16:06:08', '2025-07-17 21:22:46', '2025-07-17 21:22:46'),
(19, 'semar', 's@gmail.com', '1390392', 'qkjnde', 'librarian', '2025-07-17 18:11:45', '2025-07-17 21:23:26', '2025-07-17 21:23:26'),
(20, 'petrik star', 'pe@gmail.com', '0832423', 'jalan petrik', 'admin', '2025-07-17 19:23:36', '2025-07-17 19:24:09', '2025-07-17 19:24:09'),
(21, 'abc', 'a@gmail.com', '12313431', 'aa', 'member', '2025-07-17 20:26:43', '2025-07-17 20:26:47', '2025-07-17 20:26:47'),
(22, 'PERPUSTAKAAN', 'P@GMAIL.COM', '14636435', 'PERPUS', 'librarian', '2025-07-17 20:55:15', '2025-07-17 21:23:20', '2025-07-17 21:23:20'),
(23, 'ANANG', 'ANANG@gmail.com', '23904234', 'ANN', 'member', '2025-07-17 20:55:40', '2025-07-17 21:22:38', '2025-07-17 21:22:38'),
(24, 'Andi Pratama', 'andi@gmail.com', '0812-3456-7890', 'Jl. Merdeka No. 10, Jakarta', 'member', '2025-07-17 21:20:11', '2025-07-17 21:20:11', NULL),
(25, 'Siti Nurhaliza', 'Siti@gmail.com', '0821-9876-5432', 'Jl. Diponegoro No. 5, Bandung', 'member', '2025-07-17 21:20:43', '2025-07-17 21:20:43', NULL),
(26, 'Budi Santoso', 'Budi@gmail.com', '0857-6543-2109', 'Jl. Ahmad Yani No. 20, Surabaya', 'member', '2025-07-17 21:21:08', '2025-07-17 21:21:08', NULL),
(27, 'Muhammad Rizki', 'Rizky@gmail.com', '0878-1029-3847', 'Jl. Sudirman No. 8, Medan', 'librarian', '2025-07-17 21:21:39', '2025-07-17 21:21:39', NULL),
(28, 'Fitri Rahmawati', 'Fitri@gmail.com', '0813-2468-1357', 'Jl. Malioboro No. 15, Yogyakarta', 'librarian', '2025-07-17 21:22:06', '2025-07-17 21:22:06', NULL),
(29, 'Admin', 'admin@gmail.com', '08134247313', 'Jl. admin', 'admin', '2025-07-17 21:22:30', '2025-07-17 21:22:30', NULL),
(30, 'ajcdc', 'sk@gmail.com', '341414', 'fef', 'member', '2025-07-17 21:31:27', '2025-07-17 21:31:36', '2025-07-17 21:31:36'),
(31, 'ac', 'adminn@gmail.com', '13414', 'fv', 'member', '2025-07-17 21:33:17', '2025-07-17 21:33:25', '2025-07-17 21:33:25'),
(32, 'sd', 'asa@gmail.com', '121323', 'fbfb', 'member', '2025-07-17 21:38:22', '2025-07-17 21:38:47', '2025-07-17 21:38:47');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `book_categories`
--
ALTER TABLE `book_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
