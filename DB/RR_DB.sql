CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

USE `mydb` ;

CREATE TABLE IF NOT EXISTS `mydb`.`producer` (
  `id` INT NOT NULL,
  `Producer_Name` VARCHAR(45) NOT NULL,
  `Producer_Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `id` INT NOT NULL,
  `Category_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `id` INT NOT NULL,
  `Product_Name` VARCHAR(45) NOT NULL,
  `Num_of_Goods` VARCHAR(45) NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `mydb`.`product_producer` (
  `id` INT NOT NULL,
  `Price` FLOAT NOT NULL,
  `producer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`, `producer_id`, `product_id`),
  INDEX `fk_product_producer_producer1_idx` (`producer_id` ASC) VISIBLE,
  INDEX `fk_product_producer_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_producer_producer1`
    FOREIGN KEY (`producer_id`)
    REFERENCES `mydb`.`producer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_producer_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `id` INT NOT NULL,
  `Amount_of_Goods` VARCHAR(45) NOT NULL,
  `product_producer_id` INT NOT NULL,
  PRIMARY KEY (`id`, `product_producer_id`),
  INDEX `fk_orders_product_producer1_idx` (`product_producer_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_product_producer1`
    FOREIGN KEY (`product_producer_id`)
    REFERENCES `mydb`.`product_producer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `mydb`.`busket` (
  `id` INT NOT NULL,
  `Payment_Date` DATE NOT NULL,
  `orders_id` INT NOT NULL,
  PRIMARY KEY (`id`, `orders_id`),
  INDEX `fk_busket_orders1_idx` (`orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_busket_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `mydb`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL,
  `Login` VARCHAR(45) NOT NULL,
  `First_Name` VARCHAR(45) NOT NULL,
  `Second_Name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `busket_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Login_UNIQUE` (`Login` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  INDEX `fk_user_busket1_idx` (`busket_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_busket1`
    FOREIGN KEY (`busket_id`)
    REFERENCES `mydb`.`busket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `mydb`.`session` (
  `id` INT NOT NULL,
  `Session_Status` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_session_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_session_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `mydb`.`comment` (
  `id` INT NOT NULL,
  `Text` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_comment_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);