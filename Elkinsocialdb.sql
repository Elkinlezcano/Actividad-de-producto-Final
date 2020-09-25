CREATE DATABASE  IF NOT EXISTS `socialdb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `socialdb`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: socialdb
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `datosusers`
--

DROP TABLE IF EXISTS `datosusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datosusers` (
  `idDatosUsers` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuarios` int(11) NOT NULL,
  `Nombres` varchar(255) COLLATE utf8_bin NOT NULL,
  `Apellidos` varchar(255) COLLATE utf8_bin NOT NULL,
  `FechNace` date NOT NULL,
  `Genero` tinyint(4) NOT NULL,
  `Direccion` varchar(256) COLLATE utf8_bin NOT NULL,
  `Telefonos` varchar(25) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idDatosUsers`),
  KEY `fk_DatosUsers_Usuarios1_idx` (`idUsuarios`),
  CONSTRAINT `fk_DatosUsers_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla para almacenar los datos de c/u\nde los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosusers`
--

LOCK TABLES `datosusers` WRITE;
/*!40000 ALTER TABLE `datosusers` DISABLE KEYS */;
INSERT INTO `datosusers` VALUES (1,2,'Pedro','Cano','1975-03-16',0,'Clle 10','333333');
/*!40000 ALTER TABLE `datosusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detamedia`
--

DROP TABLE IF EXISTS `detamedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detamedia` (
  `idDetaMedia` int(11) NOT NULL AUTO_INCREMENT,
  `idMultimedia` int(11) NOT NULL,
  `idTipoReaccion` int(11) NOT NULL,
  `idUsuarios` int(11) NOT NULL,
  `Comentario` longtext COLLATE utf8_bin NOT NULL,
  `EstaDetalle` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idDetaMedia`),
  KEY `fk_DetaMedia_Multimedia1_idx` (`idMultimedia`),
  KEY `fk_DetaMedia_TipoReaccion1_idx` (`idTipoReaccion`),
  KEY `fk_DetaMedia_Usuarios1_idx` (`idUsuarios`),
  CONSTRAINT `fk_DetaMedia_Multimedia1` FOREIGN KEY (`idMultimedia`) REFERENCES `multimedia` (`idMultimedia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DetaMedia_TipoReaccion1` FOREIGN KEY (`idTipoReaccion`) REFERENCES `tiporeaccion` (`idTipoReaccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DetaMedia_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla para los detalles de la multimedia, comentarios, reacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detamedia`
--

LOCK TABLES `detamedia` WRITE;
/*!40000 ALTER TABLE `detamedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `detamedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimedia`
--

DROP TABLE IF EXISTS `multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multimedia` (
  `idMultimedia` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuarios` int(11) NOT NULL,
  `Nom` varchar(45) COLLATE utf8_bin NOT NULL,
  `TipoFormato` varchar(55) COLLATE utf8_bin NOT NULL,
  `Obervacion` varchar(55) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idMultimedia`),
  KEY `fk_Multimedia_Usuarios1_idx` (`idUsuarios`),
  CONSTRAINT `fk_Multimedia_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla para todo el contenido multimedia \nde la red social';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimedia`
--

LOCK TABLES `multimedia` WRITE;
/*!40000 ALTER TABLE `multimedia` DISABLE KEYS */;
INSERT INTO `multimedia` VALUES (1,2,'foto','png','Recuerdos');
/*!40000 ALTER TABLE `multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `idRoles` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuarios` int(11) NOT NULL,
  `idTipoUsers` int(11) NOT NULL,
  `FechaIni` date NOT NULL,
  `EstaRol` tinyint(4) NOT NULL,
  PRIMARY KEY (`idRoles`),
  KEY `fk_Roles_Usuarios1_idx` (`idUsuarios`),
  KEY `fk_Roles_TipoUsers1_idx` (`idTipoUsers`),
  CONSTRAINT `fk_Roles_TipoUsers1` FOREIGN KEY (`idTipoUsers`) REFERENCES `tipousers` (`idTipoUsers`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Roles_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla para asignacion de cargo de los\nprincipales actores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,2,7,'2020-01-27',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table1`
--

DROP TABLE IF EXISTS `table1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table1` (
  `idtable1` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idtable1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table1`
--

LOCK TABLES `table1` WRITE;
/*!40000 ALTER TABLE `table1` DISABLE KEYS */;
/*!40000 ALTER TABLE `table1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table2`
--

DROP TABLE IF EXISTS `table2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table2` (
  `idtable2` int(11) NOT NULL AUTO_INCREMENT,
  `idtable1` int(11) NOT NULL,
  PRIMARY KEY (`idtable2`,`idtable1`),
  KEY `fk_table2_table1_idx` (`idtable1`),
  CONSTRAINT `fk_table2_table1` FOREIGN KEY (`idtable1`) REFERENCES `table1` (`idtable1`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table2`
--

LOCK TABLES `table2` WRITE;
/*!40000 ALTER TABLE `table2` DISABLE KEYS */;
/*!40000 ALTER TABLE `table2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table3`
--

DROP TABLE IF EXISTS `table3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table3` (
  `idtable3` int(11) NOT NULL AUTO_INCREMENT,
  `idtable2` int(11) NOT NULL,
  `idtable1` int(11) NOT NULL,
  PRIMARY KEY (`idtable3`,`idtable2`,`idtable1`),
  KEY `fk_table3_table21_idx` (`idtable2`,`idtable1`),
  CONSTRAINT `fk_table3_table21` FOREIGN KEY (`idtable2`, `idtable1`) REFERENCES `table2` (`idtable2`, `idtable1`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table3`
--

LOCK TABLES `table3` WRITE;
/*!40000 ALTER TABLE `table3` DISABLE KEYS */;
/*!40000 ALTER TABLE `table3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiporeaccion`
--

DROP TABLE IF EXISTS `tiporeaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiporeaccion` (
  `idTipoReaccion` int(11) NOT NULL AUTO_INCREMENT,
  `NomTiReacc` varchar(45) COLLATE utf8_bin NOT NULL,
  `MeGusta` varchar(45) COLLATE utf8_bin NOT NULL,
  `NomeGusta` varchar(45) COLLATE utf8_bin NOT NULL,
  `Emojis` varchar(45) COLLATE utf8_bin NOT NULL,
  `Texto` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idTipoReaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla para identificar el tipo de reaccion \nde las publicaciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiporeaccion`
--

LOCK TABLES `tiporeaccion` WRITE;
/*!40000 ALTER TABLE `tiporeaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiporeaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousers`
--

DROP TABLE IF EXISTS `tipousers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousers` (
  `idTipoUsers` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Iterador de Tipo de Usuarios',
  `NombTiUs` varchar(45) COLLATE utf8_bin NOT NULL COMMENT 'Nombre de tipo de usuario:\nAdministrador\nEmpleado\nEstudiante\netc.',
  `CategoriaUs` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idTipoUsers`),
  UNIQUE KEY `NombTiUs_UNIQUE` (`NombTiUs`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla para los tipos de usuario:\nAdministrador, empleado';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousers`
--

LOCK TABLES `tipousers` WRITE;
/*!40000 ALTER TABLE `tipousers` DISABLE KEYS */;
INSERT INTO `tipousers` VALUES (6,'Luis','Nuevo'),(7,'Juan','Frecuente'),(9,'Pedro','Admin'),(10,'Elkin','Frecuente');
/*!40000 ALTER TABLE `tipousers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousers_has_usuarios`
--

DROP TABLE IF EXISTS `tipousers_has_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousers_has_usuarios` (
  `idTipoUsers` int(11) NOT NULL,
  `idUsuarios` int(11) NOT NULL,
  PRIMARY KEY (`idTipoUsers`,`idUsuarios`),
  KEY `fk_TipoUsers_has_Usuarios_Usuarios1_idx` (`idUsuarios`),
  KEY `fk_TipoUsers_has_Usuarios_TipoUsers1_idx` (`idTipoUsers`),
  CONSTRAINT `fk_TipoUsers_has_Usuarios_TipoUsers1` FOREIGN KEY (`idTipoUsers`) REFERENCES `tipousers` (`idTipoUsers`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TipoUsers_has_Usuarios_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousers_has_usuarios`
--

LOCK TABLES `tipousers_has_usuarios` WRITE;
/*!40000 ALTER TABLE `tipousers_has_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipousers_has_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(16) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Iterador de Usuarios',
  `emailUser` varchar(250) COLLATE utf8_bin NOT NULL COMMENT 'Correo electrónico del usuario',
  `PassUser` varchar(45) COLLATE utf8_bin NOT NULL COMMENT 'Contraseña del usuario se usa el método SHA',
  `EstaUser` tinyint(4) NOT NULL COMMENT 'Estado del Usuario',
  PRIMARY KEY (`idUsuarios`),
  UNIQUE KEY `emailUser_UNIQUE` (`emailUser`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla para los usuarios del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'elkincano@live.com','fff60f01629ace9c1ed3fa805cd1b30a6aaba58f',1),(4,'carlosm@gmail.com','e3982db583f918563be2d2058f08ae112c982d8e',0),(6,'marcoa@gmail.com','38464bf083d958b53580c63c01e56707fd043588',1),(8,'corre1@gmail.com','645494168360f58cd01659c2729046ed4674aa75',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'socialdb'
--

--
-- Dumping routines for database 'socialdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-24 23:37:55
