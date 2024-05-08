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
-- Table `mydb`.`hale_door`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`hale_door` ;

CREATE TABLE IF NOT EXISTS `mydb`.`hale_door` (
  `table_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `size` VARCHAR(45) NOT NULL,
  `flap_config` VARCHAR(45) NOT NULL,
  `door_color` VARCHAR(45) NOT NULL,
  `sec_cover_load` VARCHAR(45) NOT NULL,
  `second_ext_cover` CHAR(1) NOT NULL,
  `rain_cap` CHAR(1) NOT NULL,
  `flap` CHAR(1) NOT NULL,
  `thickness` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`table_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
