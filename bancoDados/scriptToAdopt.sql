-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idUsuario` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `sobrenome` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telCel` CHAR(11) NULL,
  `senha` CHAR(8) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`adocao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`adocao` (
  `idAdocao` INT NOT NULL,
  `nomeAnimal` VARCHAR(45) NULL,
  `especie` CHAR(6) NULL,
  `sexo` CHAR(5) NULL,
  `porte` CHAR(7) NULL,
  `fkUsuario` INT NOT NULL,
  PRIMARY KEY (`idAdocao`),
  INDEX `fk_adocao_usuario1_idx` (`fkUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_adocao_usuario1`
    FOREIGN KEY (`fkUsuario`)
    REFERENCES `mydb`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`respostaQuiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`respostaQuiz` (
  `idQuiz` INT NOT NULL,
  `resposta` CHAR(2) NULL,
  `fkUsuario` INT NOT NULL,
  PRIMARY KEY (`idQuiz`),
  INDEX `fk_respostaQuiz_usuario1_idx` (`fkUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_respostaQuiz_usuario1`
    FOREIGN KEY (`fkUsuario`)
    REFERENCES `mydb`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comentario` (
  `idComentario` INT NOT NULL,
  `titulo` VARCHAR(100) NULL,
  `descricao` VARCHAR(200) NULL,
  `fkUsuario` INT NOT NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `fk_comentario_usuario_idx` (`fkUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_comentario_usuario`
    FOREIGN KEY (`fkUsuario`)
    REFERENCES `mydb`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
