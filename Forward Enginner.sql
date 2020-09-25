-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema socialdb
-- -----------------------------------------------------
-- Base de datos para guardar la informacion de la red social

-- -----------------------------------------------------
-- Schema socialdb
--
-- Base de datos para guardar la informacion de la red social
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `socialdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `socialdb` ;

-- -----------------------------------------------------
-- Table `socialdb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socialdb`.`user` (
  `username` VARCHAR(16) NOT NULL COMMENT '',
  `email` VARCHAR(255) NULL COMMENT '',
  `password` VARCHAR(32) NOT NULL COMMENT '',
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '');


-- -----------------------------------------------------
-- Table `socialdb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socialdb`.`table1` (
  `idtable1` INT NOT NULL AUTO_INCREMENT COMMENT '',
  PRIMARY KEY (`idtable1`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socialdb`.`table2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socialdb`.`table2` (
  `idtable2` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idtable1` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idtable2`, `idtable1`)  COMMENT '',
  INDEX `fk_table2_table1_idx` (`idtable1` ASC)  COMMENT '',
  CONSTRAINT `fk_table2_table1`
    FOREIGN KEY (`idtable1`)
    REFERENCES `socialdb`.`table1` (`idtable1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socialdb`.`table3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socialdb`.`table3` (
  `idtable3` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idtable2` INT NOT NULL COMMENT '',
  `idtable1` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idtable3`, `idtable2`, `idtable1`)  COMMENT '',
  INDEX `fk_table3_table21_idx` (`idtable2` ASC, `idtable1` ASC)  COMMENT '',
  CONSTRAINT `fk_table3_table21`
    FOREIGN KEY (`idtable2` , `idtable1`)
    REFERENCES `socialdb`.`table2` (`idtable2` , `idtable1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socialdb`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socialdb`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT COMMENT 'Iterador de Usuarios',
  `emailUser` VARCHAR(250) NOT NULL COMMENT 'Correo electrónico del usuario',
  `PassUser` VARCHAR(45) NOT NULL COMMENT 'Contraseña del usuario se usa el método SHA',
  `EstaUser` TINYINT NOT NULL COMMENT 'Estado del Usuario',
  PRIMARY KEY (`idUsuarios`)  COMMENT '',
  UNIQUE INDEX `emailUser_UNIQUE` (`emailUser` ASC)  COMMENT '')
ENGINE = InnoDB
COMMENT = 'Tabla para los usuarios del sistema';


-- -----------------------------------------------------
-- Table `socialdb`.`TipoUsers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socialdb`.`TipoUsers` (
  `idTipoUsers` INT NOT NULL AUTO_INCREMENT COMMENT 'Iterador de Tipo de Usuarios',
  `NombTiUs` VARCHAR(45) NOT NULL COMMENT 'Nombre de tipo de usuario:\nAdministrador\nEmpleado\nEstudiante\netc.',
  `CategoriaUs` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idTipoUsers`)  COMMENT '',
  UNIQUE INDEX `NombTiUs_UNIQUE` (`NombTiUs` ASC)  COMMENT '')
ENGINE = InnoDB
COMMENT = 'Tabla para los tipos de usuario:\nAdministrador, empleado';


-- -----------------------------------------------------
-- Table `socialdb`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socialdb`.`Roles` (
  `idRoles` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idUsuarios` INT NOT NULL COMMENT '',
  `idTipoUsers` INT NOT NULL COMMENT '',
  `FechaIni` DATE NOT NULL COMMENT '',
  `EstaRol` TINYINT NOT NULL COMMENT '',
  PRIMARY KEY (`idRoles`)  COMMENT '',
  INDEX `fk_Roles_Usuarios1_idx` (`idUsuarios` ASC)  COMMENT '',
  INDEX `fk_Roles_TipoUsers1_idx` (`idTipoUsers` ASC)  COMMENT '',
  CONSTRAINT `fk_Roles_Usuarios1`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `socialdb`.`Usuarios` (`idUsuarios`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Roles_TipoUsers1`
    FOREIGN KEY (`idTipoUsers`)
    REFERENCES `socialdb`.`TipoUsers` (`idTipoUsers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'Tabla para asignacion de cargo de los\nprincipales actores';


-- -----------------------------------------------------
-- Table `socialdb`.`TipoUsers_has_Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socialdb`.`TipoUsers_has_Usuarios` (
  `idTipoUsers` INT NOT NULL COMMENT '',
  `idUsuarios` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idTipoUsers`, `idUsuarios`)  COMMENT '',
  INDEX `fk_TipoUsers_has_Usuarios_Usuarios1_idx` (`idUsuarios` ASC)  COMMENT '',
  INDEX `fk_TipoUsers_has_Usuarios_TipoUsers1_idx` (`idTipoUsers` ASC)  COMMENT '',
  CONSTRAINT `fk_TipoUsers_has_Usuarios_TipoUsers1`
    FOREIGN KEY (`idTipoUsers`)
    REFERENCES `socialdb`.`TipoUsers` (`idTipoUsers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_TipoUsers_has_Usuarios_Usuarios1`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `socialdb`.`Usuarios` (`idUsuarios`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socialdb`.`DatosUsers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socialdb`.`DatosUsers` (
  `idDatosUsers` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idUsuarios` INT NOT NULL COMMENT '',
  `Nombres` VARCHAR(255) NOT NULL COMMENT '',
  `Apellidos` VARCHAR(255) NOT NULL COMMENT '',
  `FechNace` DATE NOT NULL COMMENT '',
  `Genero` VARCHAR(1) NOT NULL COMMENT '',
  `Direccion` VARCHAR(256) NOT NULL COMMENT '',
  `Telefonos` VARCHAR(25) NOT NULL COMMENT '',
  PRIMARY KEY (`idDatosUsers`)  COMMENT '',
  INDEX `fk_DatosUsers_Usuarios1_idx` (`idUsuarios` ASC)  COMMENT '',
  CONSTRAINT `fk_DatosUsers_Usuarios1`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `socialdb`.`Usuarios` (`idUsuarios`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'Tabla para almacenar los datos de c/u\nde los usuarios';


-- -----------------------------------------------------
-- Table `socialdb`.`Multimedia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socialdb`.`Multimedia` (
  `idMultimedia` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idUsuarios` INT NOT NULL COMMENT '',
  `Nom` VARCHAR(45) NOT NULL COMMENT '',
  `TipoFormato` VARCHAR(55) NOT NULL COMMENT '',
  `Obervacion` VARCHAR(55) NOT NULL COMMENT '',
  PRIMARY KEY (`idMultimedia`)  COMMENT '',
  INDEX `fk_Multimedia_Usuarios1_idx` (`idUsuarios` ASC)  COMMENT '',
  CONSTRAINT `fk_Multimedia_Usuarios1`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `socialdb`.`Usuarios` (`idUsuarios`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'Tabla para todo el contenido multimedia \nde la red social';


-- -----------------------------------------------------
-- Table `socialdb`.`TipoReaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socialdb`.`TipoReaccion` (
  `idTipoReaccion` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `NomTiReacc` VARCHAR(45) NOT NULL COMMENT '',
  `MeGusta` VARCHAR(45) NOT NULL COMMENT '',
  `NomeGusta` VARCHAR(45) NOT NULL COMMENT '',
  `Emojis` VARCHAR(45) NOT NULL COMMENT '',
  `Texto` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idTipoReaccion`)  COMMENT '')
ENGINE = InnoDB
COMMENT = 'Tabla para identificar el tipo de reaccion \nde las publicaciones';


-- -----------------------------------------------------
-- Table `socialdb`.`DetaMedia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socialdb`.`DetaMedia` (
  `idDetaMedia` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idMultimedia` INT NOT NULL COMMENT '',
  `idTipoReaccion` INT NOT NULL COMMENT '',
  `idUsuarios` INT NOT NULL COMMENT '',
  `Comentario` LONGTEXT NOT NULL COMMENT '',
  `EstaDetalle` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idDetaMedia`)  COMMENT '',
  INDEX `fk_DetaMedia_Multimedia1_idx` (`idMultimedia` ASC)  COMMENT '',
  INDEX `fk_DetaMedia_TipoReaccion1_idx` (`idTipoReaccion` ASC)  COMMENT '',
  INDEX `fk_DetaMedia_Usuarios1_idx` (`idUsuarios` ASC)  COMMENT '',
  CONSTRAINT `fk_DetaMedia_Multimedia1`
    FOREIGN KEY (`idMultimedia`)
    REFERENCES `socialdb`.`Multimedia` (`idMultimedia`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_DetaMedia_TipoReaccion1`
    FOREIGN KEY (`idTipoReaccion`)
    REFERENCES `socialdb`.`TipoReaccion` (`idTipoReaccion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_DetaMedia_Usuarios1`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `socialdb`.`Usuarios` (`idUsuarios`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'Tabla para los detalles de la multimedia, comentarios, reacion';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
