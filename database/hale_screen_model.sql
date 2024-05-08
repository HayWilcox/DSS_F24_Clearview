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
-- Table `mydb`.`hale_screen_model`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`hale_screen_model` ;

CREATE TABLE IF NOT EXISTS `mydb`.`hale_screen_model` (
  `hale_screen_model_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_size` VARCHAR(45) NOT NULL,
  `model_color` VARCHAR(45) NOT NULL,
  `model_thickness` VARCHAR(45) NOT NULL,
  `model_has_flap` CHAR(2) NOT NULL,
  `model_placement` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hale_screen_model_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
