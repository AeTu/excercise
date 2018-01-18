-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema example_exam
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema example_exam
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `example_exam` DEFAULT CHARACTER SET utf8 ;
USE `example_exam` ;

-- -----------------------------------------------------
-- Table `example_exam`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `example_exam`.`Patient` (
  `idPatient` INT(11) NOT NULL,
  `Name` VARCHAR(35) NULL DEFAULT NULL,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  `Phone_number` INT(14) NULL DEFAULT NULL,
  `Date_of_birth` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `example_exam`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `example_exam`.`Doctor` (
  `idDoctor` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Date_of_birth` DATE NULL DEFAULT NULL,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  `Phone_number` INT(15) NULL DEFAULT NULL,
  `salary` INT(7) NULL DEFAULT NULL,
  PRIMARY KEY (`idDoctor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `example_exam`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `example_exam`.`Payment` (
  `idPayment` INT(11) NOT NULL,
  `Details` VARCHAR(45) NULL DEFAULT NULL,
  `Method` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPayment`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `example_exam`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `example_exam`.`Appointment` (
  `idAppointment` INT(11) NOT NULL,
  `Date` DATE NULL DEFAULT NULL,
  `Time` VARCHAR(45) NULL DEFAULT NULL,
  `idDoctor` INT(11) NULL DEFAULT NULL,
  `idPatient` INT(11) NULL DEFAULT NULL,
  `Payment ID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idAppointment`),
  INDEX `fk_Appointment_2_idx` (`idDoctor` ASC),
  INDEX `fk_Appointment_1_idx` (`idPatient` ASC),
  CONSTRAINT `fk_Appointment_1`
    FOREIGN KEY (`idPatient`)
    REFERENCES `example_exam`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_2`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `example_exam`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_3`
    FOREIGN KEY (`idPatient`)
    REFERENCES `example_exam`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `example_exam`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `example_exam`.`Bill` (
  `idBill` INT(11) NOT NULL,
  `Total` INT(7) NULL DEFAULT NULL,
  PRIMARY KEY (`idBill`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `example_exam`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `example_exam`.`Medical` (
  `idMedical` INT(11) NOT NULL,
  `Overtime_rate` INT(7) NULL DEFAULT NULL,
  `Docter_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idMedical`),
  INDEX `fk_Medical_1_idx` (`Docter_id` ASC),
  CONSTRAINT `fk_Medical_1`
    FOREIGN KEY (`Docter_id`)
    REFERENCES `example_exam`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `example_exam`.`pay-bil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `example_exam`.`pay-bil` (
  `idpay-bil` INT(11) NOT NULL,
  `idPayment` INT(11) NULL DEFAULT NULL,
  `idBill` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idpay-bil`),
  INDEX `fk_pay-bil_1_idx` (`idPayment` ASC),
  INDEX `fk_pay-bil_2_idx` (`idBill` ASC),
  CONSTRAINT `fk_pay-bil_1`
    FOREIGN KEY (`idPayment`)
    REFERENCES `example_exam`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pay-bil_2`
    FOREIGN KEY (`idBill`)
    REFERENCES `example_exam`.`Bill` (`idBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `example_exam`.`specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `example_exam`.`specialist` (
  `idspecialist` INT(11) NOT NULL,
  `Field_area` VARCHAR(45) NULL DEFAULT NULL,
  `Docter_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idspecialist`),
  INDEX `Docter_idx` (`Docter_id` ASC),
  CONSTRAINT `Docter`
    FOREIGN KEY (`Docter_id`)
    REFERENCES `example_exam`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
