-- MySQL Script generated by MySQL Workbench
-- Wed Apr 21 00:52:58 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bd_farmacia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_farmacia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_farmacia` DEFAULT CHARACTER SET utf8 ;
USE `bd_farmacia` ;

-- -----------------------------------------------------
-- Table `bd_farmacia`.`tb_marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tb_marca`;
CREATE TABLE `bd_farmacia`.`tb_marca` (
  `cod_marca` INT NOT NULL,
  `nom_marca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_marca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_farmacia`.`tb_medicamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tb_medicamento`;

CREATE TABLE `bd_farmacia`.`tb_medicamento` (
  `cod_med` INT NOT NULL AUTO_INCREMENT,
  `des_med` VARCHAR(45) NOT NULL,
  `pre_med` DOUBLE NOT NULL,
  `can_med` INT NOT NULL,
  `fecha_elab` DATE NOT NULL,
  `cod_marca` INT NOT NULL,
  PRIMARY KEY (`cod_med`),
  INDEX `fk_cod_marca_idx` (`cod_marca` ASC),
  CONSTRAINT `fk_cod_marca`
    FOREIGN KEY (`cod_marca`)
    REFERENCES `bd_farmacia`.`tb_marca` (`cod_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


SET @@auto_increment_increment=10;/*https://dev.mysql.com/doc/refman/8.0/en/replication-options-source.html#sysvar_auto_increment_increment*/  /*el incremento es en base al número que coloque*/
SET @@auto_increment_offset=10;



/*REGISTROS INICIALES PARA LA BD*/
INSERT INTO `tb_marca` VALUES (100,'Marca_01'),(200,'Marca_02'),(300,'Marca_03'),(400,'Marca_04');

INSERT INTO `tb_medicamento`(des_med,pre_med,can_med,fecha_elab,cod_marca) VALUES ('Altalgina',2.5,500,'2015-10-10',100),('Antobiotico',2.5,500,'2020-05-10',200),('Vics',1.7,50,'2021-01-11',300);
INSERT INTO `tb_medicamento`(des_med,pre_med,can_med,fecha_elab,cod_marca) VALUES ('medicina 01',2.5,500,'2017-10-10',500);
















