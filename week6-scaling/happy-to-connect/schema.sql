DROP TABLE IF EXISTS `connections`;
DROP TABLE IF EXISTS `education`;
DROP TABLE IF EXISTS `employment`;
DROP TABLE IF EXISTS `schools`;
DROP TABLE IF EXISTS `companies`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `type` ENUM ('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    `founded` SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `industry` ENUM ('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `connections` (
    `user_id` INT UNSIGNED NOT NULL,
    `connection_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`user_id`, `connection_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`connection_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    CHECK (`user_id` < `connection_id`)
);

CREATE TABLE `education` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `school_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`) ON DELETE RESTRICT
);

CREATE TABLE `employment` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `company_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `title` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`) ON DELETE RESTRICT
);
