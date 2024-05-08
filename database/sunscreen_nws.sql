-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clearview_diagram
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `clearview_diagram` ;

-- -----------------------------------------------------
-- Schema clearview_diagram
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clearview_diagram` DEFAULT CHARACTER SET utf8 ;
USE `clearview_diagram` ;

-- -----------------------------------------------------
-- Table `clearview_diagram`.`sunscreen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview_diagram`.`sunscreen` ;

CREATE TABLE IF NOT EXISTS `clearview_diagram`.`sunscreen` (
  `sunscreen_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cast_clip` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`sunscreen_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clearview_diagram`.`new_window_screen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview_diagram`.`new_window_screen` ;

CREATE TABLE IF NOT EXISTS `clearview_diagram`.`new_window_screen` (
  `new_window_screen_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `frame` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `width` VARCHAR(45) NOT NULL,
  `height` VARCHAR(45) NOT NULL,
  `tab` VARCHAR(45) NULL,
  `spring` VARCHAR(45) NOT NULL,
  `mesh` VARCHAR(45) NOT NULL,
  `fastener` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`new_window_screen_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
