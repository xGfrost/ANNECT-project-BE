CREATE TABLE `users` (
  `id` varchar(255) PRIMARY KEY,
  `name` varchar(255),
  `email` varchar(255),
  `image` varchar(255),
  `role` ENUM ('ADMIN', 'USER'),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `channels` (
  `id` varchar(255) PRIMARY KEY,
  `user_id` varchar(255),
  `name` varchar(255),
  `description` varchar(255),
  `image` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `events` (
  `id` varchar(255) PRIMARY KEY,
  `channel_id` varchar(255),
  `category_id` varchar(255),
  `tag_id` varchar(255),
  `name` varchar(255),
  `description` varchar(255),
  `image` varchar(255),
  `tf_image` varchar(255),
  `location` varchar(255),
  `is_paid` boolean,
  `price` double,
  `status` ENUM ('DONE', 'PENDING', 'ONGOING'),
  `event_date` datetime,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `user_events` (
  `id` varchar(255) PRIMARY KEY,
  `user_id` varchar(255),
  `event_id` varchar(255),
  `tf_image` varchar(255),
  `status` boolean,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `discussion_rooms` (
  `id` varchar(255) PRIMARY KEY,
  `event_id` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `chats` (
  `id` varchar(255) PRIMARY KEY,
  `discussion_room_id` varchar(255),
  `user_id` varchar(255),
  `message` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `categories` (
  `id` varchar(255) PRIMARY KEY,
  `name` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `tags` (
  `id` varchar(255) PRIMARY KEY,
  `name` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `favorites` (
  `id` varchar(255) PRIMARY KEY,
  `user_id` varchar(255),
  `event_id` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

ALTER TABLE `channels` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `events` ADD FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`);

ALTER TABLE `events` ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

ALTER TABLE `events` ADD FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

ALTER TABLE `user_events` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_events` ADD FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

ALTER TABLE `discussion_rooms` ADD FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

ALTER TABLE `chats` ADD FOREIGN KEY (`discussion_room_id`) REFERENCES `discussion_rooms` (`id`);

ALTER TABLE `chats` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `favorites` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `favorites` ADD FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);
