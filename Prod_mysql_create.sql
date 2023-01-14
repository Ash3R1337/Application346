CREATE TABLE `Клиенты` (
	`id_client` INT NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(255) NOT NULL,
	`surname` VARCHAR(255) NOT NULL,
	`patronymic` VARCHAR(255) NOT NULL,
	`age` VARCHAR(255) NOT NULL,
	`number` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id_client`)
);

CREATE TABLE `Заявка` (
	`id_request` INT NOT NULL AUTO_INCREMENT,
	`id_client` INT NOT NULL AUTO_INCREMENT,
	`id_product` INT NOT NULL AUTO_INCREMENT,
	`total` INT NOT NULL,
	`amount` INT NOT NULL,
	PRIMARY KEY (`id_request`)
);

CREATE TABLE `Часы` (
	`id_product` INT NOT NULL AUTO_INCREMENT,
	`id_sex` INT NOT NULL AUTO_INCREMENT,
	`id_brand` INT NOT NULL AUTO_INCREMENT,
	`id_country` INT NOT NULL AUTO_INCREMENT,
	`id_style` INT NOT NULL AUTO_INCREMENT,
	`id_watchcase` INT NOT NULL AUTO_INCREMENT,
	`price` INT NOT NULL,
	PRIMARY KEY (`id_product`)
);

CREATE TABLE `Пол` (
	`id_sex` INT NOT NULL AUTO_INCREMENT,
	`sex` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id_sex`)
);

CREATE TABLE `Бренд` (
	`id_brand` INT NOT NULL AUTO_INCREMENT,
	`brand` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id_brand`)
);

CREATE TABLE `Страна` (
	`id_country` INT NOT NULL AUTO_INCREMENT,
	`country_name` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id_country`)
);

CREATE TABLE `Стиль` (
	`id_style` INT NOT NULL AUTO_INCREMENT,
	`style_name` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id_style`)
);

CREATE TABLE `Корпус` (
	`id_watchcase` INT NOT NULL AUTO_INCREMENT,
	`watchcase_name` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id_watchcase`)
);

ALTER TABLE `Заявка` ADD CONSTRAINT `Заявка_fk0` FOREIGN KEY (`id_client`) REFERENCES `Клиенты`(`id_client`);

ALTER TABLE `Заявка` ADD CONSTRAINT `Заявка_fk1` FOREIGN KEY (`id_product`) REFERENCES `Часы`(`id_product`);

ALTER TABLE `Часы` ADD CONSTRAINT `Часы_fk0` FOREIGN KEY (`id_sex`) REFERENCES `Пол`(`id_sex`);

ALTER TABLE `Часы` ADD CONSTRAINT `Часы_fk1` FOREIGN KEY (`id_brand`) REFERENCES `Бренд`(`id_brand`);

ALTER TABLE `Часы` ADD CONSTRAINT `Часы_fk2` FOREIGN KEY (`id_country`) REFERENCES `Страна`(`id_country`);

ALTER TABLE `Часы` ADD CONSTRAINT `Часы_fk3` FOREIGN KEY (`id_style`) REFERENCES `Стиль`(`id_style`);

ALTER TABLE `Часы` ADD CONSTRAINT `Часы_fk4` FOREIGN KEY (`id_watchcase`) REFERENCES `Корпус`(`id_watchcase`);









