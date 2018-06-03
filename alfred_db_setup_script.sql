-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema alfred
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema alfred
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `alfred` DEFAULT CHARACTER SET latin1 ;
USE `alfred` ;

-- -----------------------------------------------------
-- Table `alfred`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alfred`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_initial` VARCHAR(2) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `password_hash` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `iduser_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `alfred`.`access_auth`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alfred`.`access_auth` (
  `id` INT(11) NOT NULL,
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NULL,
  INDEX `fk_access_auth_user_idx` (`id` ASC),
  UNIQUE INDEX `role_name_UNIQUE` (`role_name` ASC),
  UNIQUE INDEX `role_id_UNIQUE` (`role_id` ASC),
  PRIMARY KEY (`role_id`),
  CONSTRAINT `fk_access_auth_user`
    FOREIGN KEY (`id`)
    REFERENCES `alfred`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alfred`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alfred`.`patient` (
  `id` INT(11) NOT NULL,
  `dob` DATE NOT NULL,
  `ssn` VARCHAR(9) NOT NULL,
  `sex` VARCHAR(1) NOT NULL,
  INDEX `fk_patient_user1_idx` (`id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_patient_user1`
    FOREIGN KEY (`id`)
    REFERENCES `alfred`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alfred`.`visit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alfred`.`visit` (
  `patient_id` INT(11) NOT NULL,
  `visit_id` INT(11) NOT NULL,
  `InOut` TINYINT(1) NULL,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  `symptoms` TEXT NULL,
  PRIMARY KEY (`visit_id`),
  UNIQUE INDEX `visit_id_UNIQUE` (`visit_id` ASC),
  CONSTRAINT `fk_visit_patient1`
    FOREIGN KEY (`patient_id`)
    REFERENCES `alfred`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
