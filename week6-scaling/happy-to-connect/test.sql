-- Sample data
-- These INSERT statements reproduce the sample data
-- provided by the problem specification.

INSERT INTO `users`
(`first_name`, `last_name`, `username`, `password`)
VALUES
('Claudine', 'Gay', 'claudine', 'password'),
('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO `schools`
(`name`, `type`, `location`, `founded`)
VALUES
('Harvard University', 'Higher Education',
 'Cambridge, Massachusetts', 1636);

INSERT INTO `companies`
(`name`, `industry`, `location`)
VALUES
('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO `education`
(`user_id`, `school_id`, `start_date`, `end_date`, `degree`)
VALUES
(1, 1, '1993-01-01', '1998-12-31', 'PhD');

INSERT INTO `employment`
(`user_id`, `company_id`, `start_date`, `end_date`, `title`)
VALUES
(2, 1, '2003-01-01', '2007-02-01', 'CEO and Chairman');

INSERT INTO `connections`
(`user_id`, `connection_id`)
VALUES
(1, 2);

-- Basic SELECT tests
-- Verify that the sample data was inserted correctly.

SELECT * FROM `users`;
SELECT * FROM `schools`;
SELECT * FROM `companies`;
SELECT * FROM `education`;
SELECT * FROM `employment`;
SELECT * FROM `connections`;

-- JOIN test
-- Verify the relationship between users and their education.

SELECT
    `users`.`first_name`,
    `users`.`last_name`,
    `schools`.`name`,
    `education`.`degree`,
    `education`.`start_date`,
    `education`.`end_date`
FROM `education`
JOIN `users`
    ON `education`.`user_id` = `users`.`id`
JOIN `schools`
    ON `education`.`school_id` = `schools`.`id`;

-- JOIN test
-- Verify the relationship between users and their employment.

SELECT
    `users`.`first_name`,
    `users`.`last_name`,
    `companies`.`name`,
    `employment`.`title`,
    `employment`.`start_date`,
    `employment`.`end_date`
FROM `employment`
JOIN `users`
    ON `employment`.`user_id` = `users`.`id`
JOIN `companies`
    ON `employment`.`company_id` = `companies`.`id`;

-- Self-JOIN test
-- Verify the mutual connection between two users.

SELECT
    `u1`.`first_name` AS `user_first_name`,
    `u1`.`last_name` AS `user_last_name`,
    `u2`.`first_name` AS `connection_first_name`,
    `u2`.`last_name` AS `connection_last_name`
FROM `connections`
JOIN `users` AS `u1`
    ON `connections`.`user_id` = `u1`.`id`
JOIN `users` AS `u2`
    ON `connections`.`connection_id` = `u2`.`id`;

-- Constraint test: UNIQUE
-- This should fail because the username "claudine"
-- already exists.

INSERT INTO `users`
(`first_name`, `last_name`, `username`, `password`)
VALUES
('Test', 'User', 'claudine', 'password');

-- Constraint test: CHECK
-- This should fail because user_id must be smaller
-- than connection_id.

INSERT INTO `connections`
(`user_id`, `connection_id`)
VALUES
(2, 1);

-- Constraint test: PRIMARY KEY
-- This should fail because the connection (1, 2)
-- already exists.

INSERT INTO `connections`
(`user_id`, `connection_id`)
VALUES
(1, 2);

-- Constraint test: FOREIGN KEY
-- This should fail because user_id 999 does not exist.

INSERT INTO `education`
(`user_id`, `school_id`, `start_date`, `end_date`, `degree`)
VALUES
(999, 1, '2020-01-01', NULL, 'PhD');

-- Constraint test: FOREIGN KEY
-- This should fail because school_id 999 does not exist.

INSERT INTO `education`
(`user_id`, `school_id`, `start_date`, `end_date`, `degree`)
VALUES
(1, 999, '2020-01-01', NULL, 'PhD');
