CREATE DATABASE IF NOT EXISTS `Internet_Shop` DEFAULT CHARACTER SET utf8 ;
USE `Internet_Shop` ;

CREATE TABLE IF NOT EXISTS `Internet_Shop`.`Category` (
  `idCategory` INT NOT NULL AUTO_INCREMENT,
  `Category_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategory`));

CREATE TABLE IF NOT EXISTS `Internet_Shop`.`Product` (
  `idProduct` INT NOT NULL AUTO_INCREMENT,
  `idCategory` VARCHAR(45) NOT NULL,
  `Product_Name` VARCHAR(45) NOT NULL,
  `idProducer` VARCHAR(45) NOT NULL,
  `Price` VARCHAR(45) NOT NULL,
  `Category_idCategory` INT NOT NULL,
  PRIMARY KEY (`idProduct`),
  CONSTRAINT `Product_Category_Fkey`
    FOREIGN KEY (`Category_idCategory`)
    REFERENCES `Internet_Shop`.`Category` (`idCategory`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
    ALTER TABLE Product
    DROP COLUMN `Price`;

CREATE TABLE IF NOT EXISTS `Internet_Shop`.`Producer` (
  `idProducer` INT NOT NULL AUTO_INCREMENT,
  `Producer_Name` VARCHAR(45) NOT NULL,
  `Producer_Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProducer`));

CREATE TABLE IF NOT EXISTS `Internet_Shop`.`Product_Producer` (
`id` INT NOT NULL,
`Product_idProduct` INT NOT NULL,
`Producer_idProducer` INT NOT NULL,
`Price` INT NOT NULL,
PRIMARY KEY (`Product_idProduct`, `Producer_idProducer`, `id`),
Unique index `id_idx2`(`id` ASC) VISIBLE,
CONSTRAINT `Producer_idProducer_idProducer_Fkey`
FOREIGN KEY (`Producer_idProducer`)
REFERENCES `Internet_Shop`.`Producer`(`idProducer`));

CREATE TABLE IF NOT EXISTS `Internet_Shop`.`Orders` (
  `idOrders` INT NOT NULL,
  `idProduct` INT NOT NULL,
  `Numbers` VARCHAR(45) NOT NULL,
  `idBusket` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idOrders`, `idProduct`),
  INDEX `idProduct_fk_idx` (`idProduct` ASC) VISIBLE,
  CONSTRAINT `idproduct_fk`
  FOREIGN KEY (`idProduct`)
  REFERENCES `Internet_Shop`.`Product_Producer`(`id`));
  
  

CREATE TABLE IF NOT EXISTS `Internet_Shop`.`Busket` (
  `idBusket` INT NOT NULL AUTO_INCREMENT,
  `Order_time` VARCHAR(45) NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `idUser` VARCHAR(45) NOT NULL,
  `Orders_idOrders` INT NOT NULL,
  PRIMARY KEY (`idBusket`, `Orders_idOrders`),
  CONSTRAINT `Busket_Orders_Fkey`
    FOREIGN KEY (`Orders_idOrders`)
    REFERENCES `Internet_Shop`.`Orders` (`idOrders`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
    
CREATE TABLE IF NOT EXISTS `Internet_Shop`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `Login` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Profile` VARCHAR(45) NOT NULL,
  `Online` TINYINT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Busket_idBusket` INT NULL,
  PRIMARY KEY (`idUser`),
  CONSTRAINT `User_Busket_Fkey`
    FOREIGN KEY (`Busket_idBusket`)
    REFERENCES `Internet_Shop`.`Busket` (`idBusket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `Internet_Shop`.`Session` (
  `idSession` INT NOT NULL AUTO_INCREMENT,
  `Session_info` VARCHAR(45) NOT NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idSession`, `User_idUser`),
  CONSTRAINT `Session_User_Fkey`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `Internet_Shop`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `Internet_Shop`.`Comment` (
  `idComment` INT NOT NULL AUTO_INCREMENT,
  `idUser` VARCHAR(45) NOT NULL,
  `Text` VARCHAR(45) NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `idProduct` VARCHAR(45) NOT NULL,
  `Product_idProduct` INT NOT NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idComment`),
  CONSTRAINT `Comment_Product_Fkey`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `Internet_Shop`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Comment_User_Fkey`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `Internet_Shop`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
