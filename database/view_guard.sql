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
-- Table `mydb`.`view_guard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view_guard` ;

CREATE TABLE IF NOT EXISTS `mydb`.`view_guard` (
  `viewguard_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `handle_color` VARCHAR(10) NULL,
  `door_type` VARCHAR(10) NULL,
  `number_of_slides` INT NULL,
  `color` VARCHAR(10) NULL,
  `handle_style` VARCHAR(45) NULL,
  `deadbolt` VARCHAR(45) NULL,
  PRIMARY KEY (`viewguard_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
