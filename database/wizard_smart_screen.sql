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
-- Table `mydb`.`wizard_smart_screen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`wizard_smart_screen` ;

CREATE TABLE IF NOT EXISTS `mydb`.`wizard_smart_screen` (
  `wizard_smart_screen_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `location_on_house` VARCHAR(45) NOT NULL,
  `placement` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `fabric_type` VARCHAR(45) NOT NULL,
  `housing_size` VARCHAR(45) NOT NULL,
  `drive_side` VARCHAR(45) NOT NULL,
  `bottom_seal` VARCHAR(45) NOT NULL,
  `zipper_color` VARCHAR(45) NOT NULL,
  `probe_color` VARCHAR(45) NOT NULL,
  `cable_length` VARCHAR(45) NOT NULL,
  `top_opening_width` VARCHAR(45) NULL,
  `top_level` VARCHAR(45) NOT NULL,
  `bottom_opening_width` VARCHAR(45) NOT NULL,
  `bottom_level` VARCHAR(45) NOT NULL,
  `left_opening_height` VARCHAR(45) NOT NULL,
  `left_plump` VARCHAR(45) NOT NULL,
  `right_opening_height` VARCHAR(45) NOT NULL,
  `right_plump` VARCHAR(45) NOT NULL,
  `two_by_two_angle` VARCHAR(45) NOT NULL,
  `track_type` VARCHAR(45) NOT NULL,
  `track_punched` VARCHAR(45) NOT NULL,
  `starting_point` VARCHAR(45) NULL,
  `order_width` VARCHAR(45) NOT NULL,
  `order_height` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`wizard_smart_screen_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
