-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Agu 2024 pada 17.52
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `annect`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` varchar(191) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
('ck9x1rp7v000001mqerfg8lck', 'Technology', '2024-08-23 12:00:00.000', '2024-08-23 12:00:00.000'),
('ck9x1rp7v000002mqebdgw9xt', 'Gaming', '2024-08-23 12:05:00.000', '2024-08-23 12:05:00.000'),
('ck9x1rp7v000003mqjlchfbvn', 'Health & Wellness', '2024-08-23 12:10:00.000', '2024-08-23 12:10:00.000'),
('cm06i1kzi0000f4ingchcehvh', 'HANDPHONE', '2024-08-23 09:18:34.113', '2024-08-23 09:18:45.321');

-- --------------------------------------------------------

--
-- Struktur dari tabel `channels`
--

CREATE TABLE `channels` (
  `id` varchar(191) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `channels`
--

INSERT INTO `channels` (`id`, `user_id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
('ck9wz8q7v000001mqcn64htz8', 'ck9wz1p7v000001mqcgjd3v29', 'Tech Talks', 'A channel for discussing the latest in technology.', 'tech_talks.jpg', '2024-08-23 11:00:00.000', '2024-08-23 11:00:00.000'),
('ck9wz8q7v000002mqcpjq6gxm', 'ck9wz1p7v000002mqy5jk7gtl', 'Gaming Hub', 'All about the latest games and gaming trends.', 'gaming_hub.jpg', '2024-08-23 11:05:00.000', '2024-08-23 11:05:00.000'),
('ck9wz8q7v000003mqa1khqvxs', 'ck9wz1p7v000003mqflht9thx', 'Healthy Living', 'Tips and discussions on maintaining a healthy lifestyle.', 'healthy_living.jpg', '2024-08-23 11:10:00.000', '2024-08-23 11:10:00.000'),
('cm06h980g00009gingr8geaqz', 'ck9wz1p7v000001mqcgjd3v29', 'delvi', 'PROPLAYER', '1724403479386-CLUB (1).jpg', '2024-08-23 08:56:30.931', '2024-08-23 08:57:59.410');

-- --------------------------------------------------------

--
-- Struktur dari tabel `chats`
--

CREATE TABLE `chats` (
  `id` varchar(191) NOT NULL,
  `discussion_room_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `discussion_rooms`
--

CREATE TABLE `discussion_rooms` (
  `id` varchar(191) NOT NULL,
  `event_id` varchar(255) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `events`
--

CREATE TABLE `events` (
  `id` varchar(191) NOT NULL,
  `channel_id` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `tag_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `tf_image` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` enum('DONE','PENDING','ONGOING') DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `events`
--

INSERT INTO `events` (`id`, `channel_id`, `category_id`, `tag_id`, `name`, `description`, `image`, `tf_image`, `location`, `is_paid`, `price`, `status`, `event_date`, `created_at`, `updated_at`) VALUES
('ck9x7vb7v000001mqabc123d', 'ck9wz8q7v000001mqcn64htz8', 'ck9x1rp7v000001mqerfg8lck', 'ck9x3sl7v000001mqjc4pqvtg', 'Tech Expo 2024', 'Explore the latest in tech innovations.', 'tech_expo.jpg', 'tech_expo_tf.jpg', 'Jakarta Convention Center', 1, 500000, 'ONGOING', '2024-09-15 10:00:00', '2024-08-23 14:00:00.000', '2024-08-23 14:00:00.000'),
('ck9x7vb7v000002mqxyz456e', 'ck9wz8q7v000002mqcpjq6gxm', 'ck9x1rp7v000002mqebdgw9xt', 'ck9x3sl7v000002mqkvrjtybg', 'Esports Tournament 2024', 'Compete with the best in the gaming world.', 'esports_tournament.jpg', 'esports_tournament_tf.jpg', 'Surabaya Convention Hall', 1, 300000, 'PENDING', '2024-10-05 09:00:00', '2024-08-23 14:05:00.000', '2024-08-23 14:05:00.000'),
('ck9x7vb7v000003mqfgh789f', 'ck9wz8q7v000003mqa1khqvxs', 'ck9x1rp7v000003mqjlchfbvn', 'ck9x3sl7v000003mq84vcxkfp', 'Wellness Workshop', 'Learn the secrets to a healthy lifestyle.', 'wellness_workshop.jpg', 'wellness_workshop_tf.jpg', 'Bali Retreat Center', 0, NULL, 'ONGOING', '2024-09-20 08:30:00', '2024-08-23 14:10:00.000', '2024-08-23 14:10:00.000'),
('ck9x7vb7v000004mqijk321g', 'ck9wz8q7v000001mqcn64htz8', 'ck9x1rp7v000001mqerfg8lck', 'ck9x3sl7v000001mqjc4pqvtg', 'AI Conference 2024', 'Join industry leaders discussing the future of AI.', 'ai_conference.jpg', 'ai_conference_tf.jpg', 'Bandung Convention Center', 1, 750000, 'PENDING', '2024-11-12 09:00:00', '2024-08-23 14:15:00.000', '2024-08-23 14:15:00.000'),
('ck9x7vb7v000005mqlmn654h', 'ck9wz8q7v000002mqcpjq6gxm', 'ck9x1rp7v000002mqebdgw9xt', 'ck9x3sl7v000002mqkvrjtybg', 'Game Dev Meetup', 'Network with game developers from across the country.', 'game_dev_meetup.jpg', 'game_dev_meetup_tf.jpg', 'Yogyakarta Tech Hub', 0, NULL, 'DONE', '2024-08-01 14:00:00', '2024-08-23 14:20:00.000', '2024-08-23 14:20:00.000'),
('ck9x7vb7v000006mqopq987i', 'ck9wz8q7v000003mqa1khqvxs', 'ck9x1rp7v000003mqjlchfbvn', 'ck9x3sl7v000003mq84vcxkfp', 'Yoga Retreat', 'Rejuvenate your mind and body with our expert instructors.', 'yoga_retreat.jpg', 'yoga_retreat_tf.jpg', 'Ubud Wellness Center', 1, 400000, 'PENDING', '2024-12-01 07:00:00', '2024-08-23 14:25:00.000', '2024-08-23 14:25:00.000'),
('ck9x7vb7v000007mqrtu543j', 'ck9wz8q7v000001mqcn64htz8', 'ck9x1rp7v000001mqerfg8lck', 'ck9x3sl7v000001mqjc4pqvtg', 'Cybersecurity Summit', 'Stay ahead of the latest threats and solutions.', 'cybersecurity_summit.jpg', 'cybersecurity_summit_tf.jpg', 'Jakarta Tech Park', 1, 650000, 'ONGOING', '2024-09-25 10:00:00', '2024-08-23 14:30:00.000', '2024-08-23 14:30:00.000'),
('ck9x7vb7v000008mqstu876k', 'ck9wz8q7v000002mqcpjq6gxm', 'ck9x1rp7v000002mqebdgw9xt', 'ck9x3sl7v000002mqkvrjtybg', 'Indie Game Fest', 'Celebrate indie game development with fellow enthusiasts.', 'indie_game_fest.jpg', 'indie_game_fest_tf.jpg', 'Bali Indie Arena', 1, 200000, 'DONE', '2024-07-15 09:00:00', '2024-08-23 14:35:00.000', '2024-08-23 14:35:00.000'),
('ck9x7vb7v000009mquvw210l', 'ck9wz8q7v000003mqa1khqvxs', 'ck9x1rp7v000003mqjlchfbvn', 'ck9x3sl7v000003mq84vcxkfp', 'Healthy Cooking Class', 'Master the art of healthy cooking.', 'healthy_cooking_class.jpg', 'healthy_cooking_class_tf.jpg', 'Jakarta Culinary School', 0, NULL, 'PENDING', '2024-10-18 10:00:00', '2024-08-23 14:40:00.000', '2024-08-23 14:40:00.000'),
('ck9x7vb7v000010mqxyz432m', 'ck9wz8q7v000001mqcn64htz8', 'ck9x1rp7v000001mqerfg8lck', 'ck9x3sl7v000001mqjc4pqvtg', 'Blockchain Summit', 'Explore the future of decentralized technologies.', 'blockchain_summit.jpg', 'blockchain_summit_tf.jpg', 'Jakarta Blockchain Hub', 1, 800000, 'ONGOING', '2024-10-22 09:30:00', '2024-08-23 14:45:00.000', '2024-08-23 14:45:00.000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `favorites`
--

CREATE TABLE `favorites` (
  `id` varchar(191) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `event_id` varchar(255) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `follows`
--

CREATE TABLE `follows` (
  `id` varchar(191) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `channel_id` varchar(255) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `follows`
--

INSERT INTO `follows` (`id`, `user_id`, `channel_id`, `created_at`, `updated_at`) VALUES
('ck9x5ua7v000001mq5xdl9kmp', 'ck9wz1p7v000002mqy5jk7gtl', 'ck9wz8q7v000001mqcn64htz8', '2024-08-23 13:00:00.000', '2024-08-23 13:00:00.000'),
('ck9x5ua7v000002mqavtxrjgr', 'ck9wz1p7v000003mqflht9thx', 'ck9wz8q7v000002mqcpjq6gxm', '2024-08-23 13:05:00.000', '2024-08-23 13:05:00.000'),
('ck9x5ua7v000003mqshftvdsj', 'ck9wz1p7v000001mqcgjd3v29', 'ck9wz8q7v000003mqa1khqvxs', '2024-08-23 13:10:00.000', '2024-08-23 13:10:00.000'),
('ck9x5ua7v000004mqkldzbcsm', 'ck9wz1p7v000003mqflht9thx', 'ck9wz8q7v000001mqcn64htz8', '2024-08-23 13:15:00.000', '2024-08-23 13:15:00.000'),
('ck9x5ua7v000005mqwdfmhbqx', 'ck9wz1p7v000002mqy5jk7gtl', 'ck9wz8q7v000003mqa1khqvxs', '2024-08-23 13:20:00.000', '2024-08-23 13:20:00.000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` varchar(191) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
('ck9x3sl7v000001mqjc4pqvtg', 'Innovation', '2024-08-23 12:30:00.000', '2024-08-23 12:30:00.000'),
('ck9x3sl7v000002mqkvrjtybg', 'Esports', '2024-08-23 12:35:00.000', '2024-08-23 12:35:00.000'),
('ck9x3sl7v000003mq84vcxkfp', 'Nutrition', '2024-08-23 12:40:00.000', '2024-08-23 12:40:00.000'),
('cm06i8u1s0000mkincse25lx3', 'JARI', '2024-08-23 09:24:12.450', '2024-08-23 09:24:28.192');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` varchar(191) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','USER') DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `image`, `role`, `created_at`, `updated_at`) VALUES
('ck9wz1p7v000001mqcgjd3v29', 'Alice Johnson', 'alice.johnson@example.com', 'alice.jpg', 'ADMIN', '2024-08-23 10:30:00.000', '2024-08-23 10:30:00.000'),
('ck9wz1p7v000002mqy5jk7gtl', 'Bob Smith', 'bob.smith@example.com', 'bob.jpg', 'USER', '2024-08-23 10:35:00.000', '2024-08-23 10:35:00.000'),
('ck9wz1p7v000003mqflht9thx', 'Charlie Brown', 'charlie.brown@example.com', 'charlie.jpg', 'USER', '2024-08-23 10:40:00.000', '2024-08-23 10:40:00.000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_events`
--

CREATE TABLE `user_events` (
  `id` varchar(191) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `event_id` varchar(255) DEFAULT NULL,
  `tf_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussion_room_id` (`discussion_room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `discussion_rooms`
--
ALTER TABLE `discussion_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indeks untuk tabel `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indeks untuk tabel `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_events`
--
ALTER TABLE `user_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `channels`
--
ALTER TABLE `channels`
  ADD CONSTRAINT `channels_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`discussion_room_id`) REFERENCES `discussion_rooms` (`id`),
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `discussion_rooms`
--
ALTER TABLE `discussion_rooms`
  ADD CONSTRAINT `discussion_rooms_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Ketidakleluasaan untuk tabel `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Ketidakleluasaan untuk tabel `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Ketidakleluasaan untuk tabel `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`);

--
-- Ketidakleluasaan untuk tabel `user_events`
--
ALTER TABLE `user_events`
  ADD CONSTRAINT `user_events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_events_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
