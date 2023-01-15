CREATE TABLE `Клиенты` (
	`id_client` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`surname` VARCHAR(255) NOT NULL,
	`first_name` VARCHAR(255) NOT NULL,
	`patronymic` VARCHAR(255) NOT NULL,
	`age` INT(3),
	`number` INT(11),
	`email` VARCHAR(255)
);

CREATE TABLE `Пол` (
	`id_sex` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`sex` VARCHAR(255) NOT NULL
);

CREATE TABLE `Бренд` (
	`id_brand` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`brand` VARCHAR(255) NOT NULL
);

CREATE TABLE `Страна` (
	`id_country` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`country_name` VARCHAR(255) NOT NULL
);

CREATE TABLE `Стиль` (
	`id_style` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`style_name` VARCHAR(255) NOT NULL
);

CREATE TABLE `Корпус` (
	`id_watchcase` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`watchcase_name` VARCHAR(255) NOT NULL
);

CREATE TABLE `Часы` (
	`id_product` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`id_sex` INT NOT NULL,
	`id_brand` INT NOT NULL,
	`id_country` INT NOT NULL,
	`id_style` INT NOT NULL,
	`id_watchcase` INT NOT NULL,
	`price` INT NOT NULL,
    FOREIGN KEY(id_sex) REFERENCES Пол(id_sex),
    FOREIGN KEY(id_brand) REFERENCES Бренд(id_brand),
    FOREIGN KEY(id_country) REFERENCES Страна(id_country),
    FOREIGN KEY(id_style) REFERENCES Стиль(id_style),
    FOREIGN KEY(id_watchcase) REFERENCES Корпус(id_watchcase)
);

CREATE TABLE `Заявка` (
	`id_request` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`id_client` INT NOT NULL,
	`id_product` INT NOT NULL,
	`total` INT NOT NULL,
	`amount` INT NOT NULL,
    FOREIGN KEY(id_client) REFERENCES Клиенты(id_client),
    FOREIGN KEY(id_product) REFERENCES Часы(id_product)
);







