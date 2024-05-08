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
-- Table `mydb`.`general_retract_control`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`general_retract_control` ;

CREATE TABLE IF NOT EXISTS `mydb`.`general_retract_control` (
  `general_retract_control_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `door_type` VARCHAR(45) NOT NULL,
  `door_mount` VARCHAR(45) NOT NULL COMMENT 'In VS Surface\n',
  `opening_side` VARCHAR(45) NOT NULL,
  `fraction` VARCHAR(45) NOT NULL,
  `mesh` VARCHAR(45) NOT NULL,
  `mohair` VARCHAR(45) NOT NULL,
  `mohair_position` VARCHAR(45) NOT NULL,
  `top_adapter` VARCHAR(45) NOT NULL,
  `build_out` VARCHAR(45) NOT NULL,
  `btm_adapter` VARCHAR(45) NOT NULL,
  `btm_adapter_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`general_retract_control_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
