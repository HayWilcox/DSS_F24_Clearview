-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`window`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`window` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`window` (
  `window_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Frame Size` VARCHAR(45) NOT NULL,
  `Frame Color` VARCHAR(45) NOT NULL,
  `Fractions` VARCHAR(45) NOT NULL,
  `Plus or Minus` CHAR(1) NOT NULL,
  `Tab/Spring` VARCHAR(45) NOT NULL,
  `Mesh` VARCHAR(45) NOT NULL,
  `Fasteners` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`window_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
