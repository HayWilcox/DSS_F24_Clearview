-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clearview
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `clearview` ;

-- -----------------------------------------------------
-- Schema clearview
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clearview` DEFAULT CHARACTER SET utf8 ;
USE `clearview` ;

-- -----------------------------------------------------
-- Table `clearview`.`rainier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`rainier` ;

CREATE TABLE IF NOT EXISTS `clearview`.`rainier` (
  `rainier_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `est_placement` VARCHAR(45) NOT NULL,
  `act_placement` VARCHAR(45) NOT NULL,
  `est_hardware_color` VARCHAR(45) NULL,
  `act_hardware_color` VARCHAR(45) NULL,
  `est_fabric_color` VARCHAR(45) NULL,
  `act_fabric_color` VARCHAR(45) NULL,
  `est_housing_series` VARCHAR(45) NULL,
  `act_housing_series` VARCHAR(45) NULL,
  `est_drive_side` VARCHAR(45) NULL,
  `act_drive_side` VARCHAR(45) NULL,
  `est_hembar` VARCHAR(45) NULL,
  `act_hembar` VARCHAR(45) NULL,
  `est_pilebrush` VARCHAR(45) NULL,
  `act_pilebrush` VARCHAR(45) NULL,
  `est_brush_location` VARCHAR(45) NULL,
  `act_brush_location` VARCHAR(45) NULL,
  `est_zipper_color` VARCHAR(45) NULL,
  `act_zipper_color` VARCHAR(45) NULL,
  `est_cord_length` VARCHAR(45) NULL,
  `act_cord_length` VARCHAR(45) NULL,
  `est_mount_type` VARCHAR(45) NULL,
  `act_mount_type` VARCHAR(45) NULL,
  `est_top_opening_width` VARCHAR(45) NULL,
  `act_top_opening_width` VARCHAR(45) NULL,
  `act_top_level` VARCHAR(45) NULL,
  `act_bottom_opening_width` VARCHAR(45) NULL,
  `act_bottom_level` VARCHAR(45) NULL,
  `act_left_opening_height` VARCHAR(45) NULL,
  `act_left_plumb` VARCHAR(45) NULL,
  `act_right_opening_height` VARCHAR(45) NULL,
  `act_right_plumb` VARCHAR(45) NULL,
  `est_left_buildout` VARCHAR(45) NULL,
  `act_left_buildout` VARCHAR(45) NULL,
  `est_right_buildout` VARCHAR(45) NULL,
  `act_right_buildout` VARCHAR(45) NULL,
  `est_add_buildout` VARCHAR(45) NULL,
  `act_add_buildout` VARCHAR(45) NULL,
  `est_left_track` VARCHAR(45) NULL,
  `act_left_track` VARCHAR(45) NULL,
  `est_right_track` VARCHAR(45) NULL,
  `act_right_track` VARCHAR(45) NULL,
  `act_starting_point` VARCHAR(45) NULL,
  PRIMARY KEY (`rainier_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
