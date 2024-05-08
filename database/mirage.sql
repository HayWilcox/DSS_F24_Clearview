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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Mirage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Mirage` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Mirage` (
  `idMirage` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mirage build out` VARCHAR(45) NOT NULL,
  `mirage color` VARCHAR(45) NOT NULL,
  `pivot pro color` VARCHAR(45) NOT NULL,
  `mirage mesh` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMirage`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mirage 3500`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Mirage 3500` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Mirage 3500` (
  `idmirage 3500` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mirage 3500col` VARCHAR(45) NOT NULL,
  `mirage 3500 Handle` VARCHAR(45) NOT NULL,
  `mirage 3500 Mesh` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmirage 3500`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
