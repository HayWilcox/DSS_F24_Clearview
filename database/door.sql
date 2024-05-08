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
-- Table `mydb`.`door`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`door` ;

CREATE TABLE IF NOT EXISTS `mydb`.`door` (
  `door_id` INT NOT NULL AUTO_INCREMENT,
  `slide_type` VARCHAR(45) NOT NULL,
  `slide_color` VARCHAR(45) NOT NULL,
  `wheels_num` INT NOT NULL,
  `swing_type` VARCHAR(45) NOT NULL,
  `swing_color` VARCHAR(45) NOT NULL,
  `opening_side` CHAR(2) NOT NULL,
  `handle_style` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`door_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
