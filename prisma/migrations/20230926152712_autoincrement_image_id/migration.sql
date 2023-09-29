-- CreateTable
CREATE TABLE `comment` (
    `comment_id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `image_id` INTEGER NULL,
    `comment_date` DATE NULL,
    `content` VARCHAR(255) NULL,

    INDEX `image_id`(`image_id`),
    INDEX `user_id`(`user_id`),
    PRIMARY KEY (`comment_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `image` (
    `image_id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `image_name` VARCHAR(255) NULL,
    `url` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,

    INDEX `user_id`(`user_id`),
    PRIMARY KEY (`image_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `save_image` (
    `user_id` INTEGER NOT NULL,
    `image_id` INTEGER NOT NULL,
    `save_date` DATE NULL,

    INDEX `image_id`(`image_id`),
    PRIMARY KEY (`user_id`, `image_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `user_id` INTEGER NOT NULL,
    `email` VARCHAR(255) NULL,
    `password` VARCHAR(255) NULL,
    `full_name` VARCHAR(255) NULL,
    `age` INTEGER NULL,
    `avatar` VARCHAR(255) NULL,

    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `comment` ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `comment` ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image`(`image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `image` ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `save_image` ADD CONSTRAINT `save_image_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `save_image` ADD CONSTRAINT `save_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image`(`image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
