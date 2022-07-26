CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255),
  `password` varchar(255),
  `isAdmin` int,
  `studen_code` varchar(255),
  `email` varchar(255),
  `class` varchar(255),
  `phone` varchar(255),
  `address` varchar(255),
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `deletedAt` int,
  `createdBy` int,
  `updadedBy` int,
  `deletedBy` int
);

CREATE TABLE `room` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `name` varchar(255),
  `category_id` varchar(255),
  `quantity` int,
  `price` int,
  `status` int,
  `detail` varchar(255),
  `description` varchar(255),
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `deletedAt` int,
  `createdBy` int,
  `updadedBy` int,
  `deletedBy` int
);

CREATE TABLE `item` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `name` varchar(255),
  `category_id` int,
  `price` int,
  `quantity` int,
  `status` varchar(255),
  `detail` varchar(255),
  `description` varchar(255),
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `deletedAt` int,
  `createdBy` int,
  `updadedBy` int,
  `deletedBy` int
);

CREATE TABLE `item_category` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `room_category` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `station_room_category` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `login_history` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `time` timestamp,
  `address` varchar(255)
);

CREATE TABLE `post_category` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `image` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `item_id` int,
  `path` varchar(255)
);

CREATE TABLE `order` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `item_id` int,
  `user_id` int,
  `quantity` int,
  `price` int,
  `time` timestamp,
  `station_box` int
);

CREATE TABLE `station` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `address` varchar(255)
);

CREATE TABLE `station_room` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `category_id` int,
  `station_id` int
);

CREATE TABLE `station_box` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `station_room_id` int,
  `item_id` int,
  `quantity` int,
  `createdAt` timestamp,
  `successAt` timestamp
);

CREATE TABLE `post` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `category_id` int,
  `name` varchar(255),
  `detail` varchar(255),
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `deletedAt` int,
  `createdBy` int,
  `updadedBy` int,
  `deletedBy` int
);

CREATE TABLE `notification` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `detail` varchar(255),
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `deletedAt` int,
  `createdBy` int,
  `updadedBy` int,
  `deletedBy` int
);

CREATE TABLE `chat_room` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `updatedAt` timestamp
);

CREATE TABLE `chat_message` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `chat_room` int,
  `user_id` int,
  `other_id` int,
  `content` varchar(255),
  `createdAt` timestamp
);

ALTER TABLE `post` ADD FOREIGN KEY (`category_id`) REFERENCES `post_category` (`id`);

ALTER TABLE `post` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `chat_message` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `chat_message` ADD FOREIGN KEY (`chat_room`) REFERENCES `chat_room` (`id`);

ALTER TABLE `notification` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `item` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `station_room` ADD FOREIGN KEY (`station_id`) REFERENCES `station` (`id`);

ALTER TABLE `station_room` ADD FOREIGN KEY (`category_id`) REFERENCES `station_room_category` (`id`);

ALTER TABLE `station_box` ADD FOREIGN KEY (`station_room_id`) REFERENCES `station_room` (`id`);

ALTER TABLE `user` ADD FOREIGN KEY (`id`) REFERENCES `login_history` (`user_id`);

ALTER TABLE `item` ADD FOREIGN KEY (`category_id`) REFERENCES `item_category` (`id`);

ALTER TABLE `image` ADD FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`station_box`) REFERENCES `station_box` (`id`);

ALTER TABLE `room` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `room` ADD FOREIGN KEY (`category_id`) REFERENCES `room_category` (`id`);
