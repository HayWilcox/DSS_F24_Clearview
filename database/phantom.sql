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
-- Table `mydb`.`phantom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`phantom` ;

CREATE TABLE IF NOT EXISTS `mydb`.`phantom` (
  `phantom_id` INT NOT NULL AUTO_INCREMENT,
  `phantom_color` VARCHAR(45) NOT NULL,
  `phantom_build_out` VARCHAR(45) NOT NULL DEFAULT 'None',
  `meshlock` VARCHAR(45) NOT NULL,
  `meshlock` CHAR(1) NOT NULL,
  `phantom_mesh` VARCHAR(200) NOT NULL,
  `meshlock_mesh` VARCHAR(100) NOT NULL,
  `type_of_screen` VARCHAR(60) NOT NULL,
  `screen_color` VARCHAR(45) NOT NULL,
  `wood_type` VARCHAR(45) NOT NULL,
  `mount` VARCHAR(45) NOT NULL,
  `hembar` VARCHAR(45) NOT NULL,
  `tracks` VARCHAR(45) NOT NULL,
  `mesh` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`phantom_id`),
  UNIQUE INDEX `phantom_id_UNIQUE` (`phantom_id` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
