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
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `alfred`.`access_auth`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alfred`.`access_auth` (
  `id` INT(11) NOT NULL,
  `role_id` INT(11) NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE INDEX `role_id_UNIQUE` (`role_id` ASC),
  UNIQUE INDEX `role_name_UNIQUE` (`role_name` ASC),
  INDEX `fk_access_auth_user_idx` (`id` ASC),
  CONSTRAINT `fk_access_auth_user`
    FOREIGN KEY (`id`)
    REFERENCES `alfred`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `alfred`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alfred`.`patient` (
  `id` INT(11) NOT NULL,
  `dob` DATE NOT NULL,
  `ssn` VARCHAR(9) NOT NULL,
  `sex` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_patient_user1_idx` (`id` ASC),
  CONSTRAINT `fk_patient_user1`
    FOREIGN KEY (`id`)
    REFERENCES `alfred`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `alfred`.`labs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alfred`.`labs` (
  `patient_id` INT(11) NOT NULL,
  `lab_id` INT(11) NOT NULL AUTO_INCREMENT,
  `test` VARCHAR(45) NOT NULL,
  `datetime` DATETIME NOT NULL,
  `result` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`lab_id`),
  INDEX `patient_id_idx` (`patient_id` ASC),
  CONSTRAINT `patient_id`
    FOREIGN KEY (`patient_id`)
    REFERENCES `alfred`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `alfred`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alfred`.`role` (
  `role_id` INT(11) NOT NULL,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `alfred`.`user_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alfred`.`user_roles` (
  `role_id` INT(11) NOT NULL,
  `role_member` INT(11) NOT NULL,
  PRIMARY KEY (`role_id`, `role_member`),
  INDEX `role_member_idx` (`role_member` ASC),
  CONSTRAINT `role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `alfred`.`role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `role_member`
    FOREIGN KEY (`role_member`)
    REFERENCES `alfred`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `alfred`.`visit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alfred`.`visit` (
  `patient_id` INT(11) NOT NULL,
  `visit_id` INT(11) NOT NULL,
  `InOut` TINYINT(1) NULL DEFAULT NULL,
  `start_date` DATETIME NULL DEFAULT NULL,
  `end_date` DATETIME NULL DEFAULT NULL,
  `symptoms` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`visit_id`),
  UNIQUE INDEX `visit_id_UNIQUE` (`visit_id` ASC),
  INDEX `fk_visit_patient1` (`patient_id` ASC),
  CONSTRAINT `fk_visit_patient1`
    FOREIGN KEY (`patient_id`)
    REFERENCES `alfred`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `alfred`.`bloodtests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alfred`.`bloodtests` (
  `lab_id` INT NOT NULL,
  `patient_ID` INT NOT NULL,
  `date` DATE NOT NULL,
  `performed_by` INT NULL,
  `wbc` DECIMAL(5,2) NULL,
  `rbc` DECIMAL(5,2) NULL,
  `hemoglobin` DECIMAL(5,2) NULL,
  `mcv` DECIMAL(5,2) NULL,
  `mch` DECIMAL(5,2) NULL,
  `mchc` DECIMAL(5,2) NULL,
  `rdw` DECIMAL(5,2) NULL,
  `mpv` DECIMAL(5,2) NULL,
  `platelets` DECIMAL(5,2) NULL,
  `neutrophils` DECIMAL(5,2) NULL,
  `lymphocytes` DECIMAL(5,2) NULL,
  `monocytes` DECIMAL(5,2) NULL,
  `eosinophils` DECIMAL(5,2) NULL,
  `basophils` DECIMAL(5,2) NULL,
  `abs_neutrophils` DECIMAL(5,2) NULL,
  `abs_lymphocytes` DECIMAL(5,2) NULL,
  `abs_monocytes` DECIMAL(5,2) NULL,
  `abs_eosinophils` DECIMAL(5,2) NULL,
  `abs_basophils` DECIMAL(5,2) NULL,
  `ordered_by` INT NOT NULL,
  PRIMARY KEY (`lab_id`),
  INDEX `patient_id_idx` (`patient_ID` ASC),
  INDEX `ordered_by_idx` (`ordered_by` ASC),
  CONSTRAINT `lab`
    FOREIGN KEY (`lab_id`)
    REFERENCES `alfred`.`labs` (`lab_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `patient`
    FOREIGN KEY (`patient_ID`)
    REFERENCES `alfred`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ordered_by`
    FOREIGN KEY (`ordered_by`)
    REFERENCES `alfred`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
