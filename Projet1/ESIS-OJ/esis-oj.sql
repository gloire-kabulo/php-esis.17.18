-- MySQL Script generated by MySQL Workbench
-- 04/04/18 05:30:19
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema esis_open_journal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema esis_open_journal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esis_open_journal` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `esis_open_journal` ;

-- -----------------------------------------------------
-- Table `esis_open_journal`.`Etudiant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esis_open_journal`.`Etudiant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `matricule` VARCHAR(255) NOT NULL,
  `pwd` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `matricule_UNIQUE` (`matricule` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esis_open_journal`.`Publication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esis_open_journal`.`Publication` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idEtudiant` INT NOT NULL,
  `contenu` TEXT NOT NULL,
  `date` DATETIME NOT NULL,
  `nblike` INT NOT NULL,
  `nbdislike` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_Publication_Etudiant_idx` (`idEtudiant` ASC),
  CONSTRAINT `fk_Publication_Etudiant`
    FOREIGN KEY (`idEtudiant`)
    REFERENCES `esis_open_journal`.`Etudiant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esis_open_journal`.`Commentaire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esis_open_journal`.`Commentaire` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idEtudiant` INT NOT NULL,
  `idPublication` INT NOT NULL,
  `contenu` TEXT NOT NULL,
  `date` DATETIME NOT NULL,
  `nblike` INT NOT NULL,
  `nbdislike` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_Commentaire_Etudiant1_idx` (`idEtudiant` ASC),
  INDEX `fk_Commentaire_Publication1_idx` (`idPublication` ASC),
  CONSTRAINT `fk_Commentaire_Etudiant1`
    FOREIGN KEY (`idEtudiant`)
    REFERENCES `esis_open_journal`.`Etudiant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commentaire_Publication1`
    FOREIGN KEY (`idPublication`)
    REFERENCES `esis_open_journal`.`Publication` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
