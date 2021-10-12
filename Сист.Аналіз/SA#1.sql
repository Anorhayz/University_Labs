drop database if exists SA1;
create database if not exists SA1;

CREATE SCHEMA IF NOT EXISTS `SA1` DEFAULT CHARACTER SET utf8 ;
USE `SA1` ;

CREATE TABLE IF NOT EXISTS `SA1`.`Goods_Handbook` (
  `idGoods` INT NOT NULL,
  `Goods_Name` VARCHAR(45) NOT NULL,
  `Unit` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGoods`),
  UNIQUE KEY `Goods_Name_Unique` (`Goods_Name`),
  UNIQUE INDEX `idGoods_UNIQUE` (`idGoods` ASC) VISIBLE)  
  ENGINE = InnoDB;

  
  CREATE TABLE IF NOT EXISTS `SA1`.`Syllables_List` (
  `idSyllables` INT NOT NULL,
  `Syllables_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSyllables`),
  UNIQUE KEY `Syllables_Name_Unique` (`Syllables_Name`),
  UNIQUE KEY `idSyllables` (`idSyllables`),
  UNIQUE INDEX `idSyllables_UNIQUE` (`idSyllables` ASC) VISIBLE)  
  ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `SA1`.`Goods_Movement` (
  `idMonth` INT NOT NULL,
  `idSyllables` INT NOT NULL,
  `Goods_Name` VARCHAR(45) NOT NULL,
  `Remainder` VARCHAR(45) NOT NULL,
  `Coming` VARCHAR(45) NOT NULL,
  `Breakdown` VARCHAR(45) NOT NULL,
  `Remainder_End` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMonth`),
  UNIQUE INDEX `idMonth_UNIQUE` (`idMonth` ASC) VISIBLE)
  ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `SA1`.`Log_Book` (
  `idLog` INT NOT NULL,
  `Date` VARCHAR(45) NOT NULL,
  `Syllables_Name` VARCHAR(45) NOT NULL,
  `Goods_Name` VARCHAR(45) NOT NULL,
  `Operation` VARCHAR(45) NOT NULL,
  `Goods_Numbers` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLog`),
  UNIQUE INDEX `idLog_UNIQUE` (`idLog` ASC) VISIBLE)
  ENGINE = InnoDB;
  
  INSERT INTO Goods_handbook 
  VALUES (1, 'Шпроти в олії', 'бан.'),
  (2, 'Кілька в т/с', 'бан.'),
  (3, 'Лимони', 'кг'),
  (4, 'Кава Монарх', 'уп'),
  (5, 'Кава Галка', 'уп'),
  (6, 'Шоколад Спокуса', 'шт');
  
  INSERT INTO Syllables_List
  VALUES (12, 'Бакалійний'),
  (13, 'Овочевий'),
  (14, 'Кондитерський');
  
  INSERT INTO Goods_Movement
  VALUES (2, 12,  'Шпроти в олії', 200, 300, 400, 100),
  (9, 13, 'Кава Монарх', 100, 200, 50, 250),
  (11, 14, 'Лимони', 140, 660, 730, 70);
  
  INSERT INTO Log_Book
  VALUES (25, '1.03.2019', 'Бакалійний', 'Кілька в т/с', 'Прихід', 200),
  (26, '10.03.2019', 'Кондитерський', 'Кава Монарх', 'Відпуск', 50);

alter table Log_Book add foreign key (Syllables_name) references Syllables_list(Syllables_name);
alter table Log_Book add foreign key (Goods_Name) references Goods_Handbook(Goods_Name);
alter table Goods_Movement add foreign key (Goods_Name) references Goods_Handbook(Goods_Name);
alter table Goods_Movement add foreign key (idSyllables) references Syllables_List(idSyllables);

select * from Goods_Handbook;
select * from Syllables_List;
select * from Goods_Movement;
select * from Log_Book;