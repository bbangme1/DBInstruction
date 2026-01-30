CREATE TABLE `movie` (
  `id` bigint PRIMARY KEY,
  `movie_title` varchar(100)
);

CREATE TABLE `customer` (
  `id` bigint PRIMARY KEY,
  `name` varchar(100)
);

CREATE TABLE `screen` (
  `id` bigint PRIMARY KEY,
  `screen_name` varchar(100)
);

CREATE TABLE `movie_screening` (
  `id` bigint PRIMARY KEY,
  `movie_id` bigint,
  `screen_id` bigint,
  `show_time` integer
);

CREATE TABLE `reserve` (
  `id` bigint PRIMARY KEY,
  `price_by_seat` bigint,
  `customer_id` bigint,
  `movie_screening_id` bigint
);

CREATE TABLE `price_by_seat` (
  `id` bigint PRIMARY KEY,
  `prices_id` bigint,
  `seats` varchar(100)
);

CREATE TABLE `prices` (
  `id` bigint PRIMARY KEY,
  `prices` integer
);

ALTER TABLE `movie_screening` ADD FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

ALTER TABLE `movie_screening` ADD FOREIGN KEY (`screen_id`) REFERENCES `screen` (`id`);

ALTER TABLE `reserve` ADD FOREIGN KEY (`movie_screening_id`) REFERENCES `movie_screening` (`id`);

ALTER TABLE `reserve` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

ALTER TABLE `reserve` ADD FOREIGN KEY (`price_by_seat`) REFERENCES `price_by_seat` (`id`);

ALTER TABLE `price_by_seat` ADD FOREIGN KEY (`prices_id`) REFERENCES `prices` (`id`);
