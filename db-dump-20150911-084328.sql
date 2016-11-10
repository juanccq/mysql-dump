CREATE DATABASE control2;

USE control2;

SET FOREIGN_KEY_CHECKS = 0;

#--CREATING TABLE cargo
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_tipo_cargo_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO cargo
INSERT INTO cargo VALUES ('1','Arquitecto','','2014-11-04 05:18:41','');
INSERT INTO cargo VALUES ('2','','','2014-11-08 17:07:47','');
INSERT INTO cargo VALUES ('3','Abogado','','2014-11-25 20:15:24','');
INSERT INTO cargo VALUES ('4','Contador','','2014-11-25 20:15:32','');
INSERT INTO cargo VALUES ('5','Secretaria','','2014-11-25 20:15:59','');
INSERT INTO cargo VALUES ('6','Administrador','','2014-11-25 20:34:55','');
INSERT INTO cargo VALUES ('7','Marketing y publicidad','Marketing y publicidad','2014-12-02 21:58:18','');
INSERT INTO cargo VALUES ('8','Administrador de Base de Datos','Administrador de Base de Datos','2014-12-04 04:34:34','');



#--CREATING TABLE ciudad
CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fid_departamento_provincia` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_ciudad_UNIQUE` (`id`),
  KEY `fk_ciudad_departamento_provincia1_idx` (`fid_departamento_provincia`),
  CONSTRAINT `fk_ciudad_departamento_provincia1` FOREIGN KEY (`fid_departamento_provincia`) REFERENCES `departamento_provincia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO ciudad



#--CREATING TABLE cliente
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `rubro` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nit` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_cliente_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO cliente
INSERT INTO cliente VALUES ('1','Internet Rosa','Rosa','Marquez','Calle Suarez #87 Av. Naciones Unidas','23987177','76512453','rosa874_c@hotmail.com','Internet y Servicios','984-89-58887','2014-11-16 17:18:52','');
INSERT INTO cliente VALUES ('2','Orica','Marcelo','Pinto','Calle Suarez #87 Av. Naciones Unidas','23987177','','info@orica.com','Mineria y Metalurgia','9433-22-1343','2014-11-26 04:38:10','');
INSERT INTO cliente VALUES ('3','Camara Alemana de Comercio','Mario','Sanchez','Av. Montenegro #23 Z. Irpavi','2237654','','msanchez@kas.com','Relaciones comerciales internacionales','487887989898','2014-12-15 21:08:18','');
INSERT INTO cliente VALUES ('4','OIKOCREDIT','Rodrigo','Orihuela','Av. Sanches Lima Ed. el Rosario Piso 5','2316985','','info@oikocredit.com','Agencia despachante de aduana','588749634','','');



#--CREATING TABLE cliente_bk
CREATE TABLE `cliente_bk` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_cliente_bk` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `rubro` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nit` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `accion` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_accion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO cliente_bk
INSERT INTO cliente_bk VALUES ('00000000001','1','Interneta','asjl','aa','a','9','99','test@test.com','desarrollo de software','12','insert','2014-11-16 17:18:52');
INSERT INTO cliente_bk VALUES ('00000000002','1','Interneta','asjl','aa','a','9','99','test@test.com','desarrollo de software','12','update','2014-11-25 20:24:37');
INSERT INTO cliente_bk VALUES ('00000000003','2','Orica','Marcelo','Pinto','Calle Suarez #87 Av. Naciones Unidas','23987177','','info@orica.com','Mineria y Metalurgia','9433-22-1343','insert','2014-11-26 04:38:10');
INSERT INTO cliente_bk VALUES ('00000000004','3','Camara Alemana de Comercio','Mario','Sanchez','Av. Montenegro #23 Z. Irpavi','2237654','','msanchez@kas.com','Relaciones comerciales internacionales','487887989898','insert','2014-12-15 21:08:18');



#--CREATING TABLE departamento_provincia
CREATE TABLE `departamento_provincia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fid_pais` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_departamento_provincia_UNIQUE` (`id`),
  KEY `fk_departamento_provincia_pais1_idx` (`fid_pais`),
  CONSTRAINT `fk_departamento_provincia_pais1` FOREIGN KEY (`fid_pais`) REFERENCES `pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO departamento_provincia



#--CREATING TABLE equipo
CREATE TABLE `equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fid_tipo_equipo` int(10) unsigned NOT NULL,
  `observaciones` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `fid_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_equipo_UNIQUE` (`id`),
  KEY `fk_equipo_tipo_equipo1_idx` (`fid_tipo_equipo`),
  KEY `fid_usuario` (`fid_usuario`),
  CONSTRAINT `fk_equipo_tipo_equipo1` FOREIGN KEY (`fid_tipo_equipo`) REFERENCES `tipo_equipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_equipo_usuario` FOREIGN KEY (`fid_usuario`) REFERENCES `usuario` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO equipo
INSERT INTO equipo VALUES ('1','C001-E001','2','Pc para navegacion en Internet','2014-09-10','2014-11-26 04:41:48','','13');
INSERT INTO equipo VALUES ('2','C002-E001','3','Laptop Marca Toshiba Modelo Satellite','2014-04-01','2014-11-29 16:48:33','','16');
INSERT INTO equipo VALUES ('3','C002-E014','4','Impresora Cannon Laser Jet 1500xs','2013-08-08','2014-11-30 09:57:15','','16');
INSERT INTO equipo VALUES ('4','C002-E002','2','Core I3 3.1 GHZ','2012-02-10','2014-12-04 04:44:35','','14');
INSERT INTO equipo VALUES ('5','C002-E003','2','Core 2 Duo 2.9 GHz','2011-06-27','2014-12-04 04:50:41','','17');
INSERT INTO equipo VALUES ('6','C002-E004','2','Dual Core 2.5 GHz','2011-08-08','2014-12-04 07:04:07','','18');
INSERT INTO equipo VALUES ('7','C001-E002','2','Dual Core 2.0 GHz','2011-03-04','2014-12-15 19:31:12','','13');
INSERT INTO equipo VALUES ('8','C001-E003','2','Core i3 3.2 GHz','2012-12-01','2014-12-15 19:41:40','','13');
INSERT INTO equipo VALUES ('9','C001-E004','2','Pentium 4 1.7 GHz','2010-01-15','2014-12-15 19:50:40','','13');
INSERT INTO equipo VALUES ('10','C001-E005','2','Core 2 Duo 2.2 GHz','2012-01-04','2014-12-15 20:35:31','','13');
INSERT INTO equipo VALUES ('11','C001-E006','2','Dual Core 2.7 GHz','2011-04-12','2014-12-15 20:45:41','','13');
INSERT INTO equipo VALUES ('12','C003-E001','3','Sony Core i3 3.0 GHz','2014-05-09','2014-12-15 21:18:35','','26');
INSERT INTO equipo VALUES ('13','C003-E002','2','HP intel Core i5 3.0 GHz','2014-08-13','2014-12-15 21:20:50','','27');
INSERT INTO equipo VALUES ('14','C002-E005','2','Dual Core 2.7 GHz','2013-01-25','2014-12-17 04:06:48','','20');
INSERT INTO equipo VALUES ('15','C004-E001','3','Core i5 3.0 MHz','2014-04-16','','','29');



#--CREATING TABLE fos_user
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_spanish_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `telefono` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` text COLLATE utf8_spanish_ci,
  `tipo_usuario` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E6C4F9A392FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_E6C4F9A3A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO fos_user



#--CREATING TABLE mantenimiento
CREATE TABLE `mantenimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `problemas` text COLLATE utf8_spanish_ci,
  `fid_tecnico` int(11) DEFAULT NULL,
  `fid_equipo` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `fid_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mantenimiento_tecnico1_idx` (`fid_tecnico`),
  KEY `fk_mantenimiento_equipo1_idx` (`fid_equipo`),
  KEY `fid_usuario` (`fid_usuario`),
  CONSTRAINT `fk_mantenimiento_equipo1` FOREIGN KEY (`fid_equipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_mantenimiento_tecnico1` FOREIGN KEY (`fid_tecnico`) REFERENCES `personal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mantenimiento_usuario` FOREIGN KEY (`fid_usuario`) REFERENCES `usuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO mantenimiento
INSERT INTO mantenimiento VALUES ('1','2014-11-27','Posibles problemas','','1','1','2014-11-26 08:24:02','','15');
INSERT INTO mantenimiento VALUES ('2','2013-06-11','El teclado dejo de funcionar repentinamente.','','1','1','2014-11-29 17:29:56','','15');
INSERT INTO mantenimiento VALUES ('3','2014-03-24','El equipo no enciente, no pasa de la pantalla de cargado.','','2','1','2014-11-29 22:06:52','','22');
INSERT INTO mantenimiento VALUES ('4','2014-10-14','El equipo presenta lentitud en el inicio del sistema','','5','1','2014-12-04 15:05:26','','23');
INSERT INTO mantenimiento VALUES ('5','2014-08-14','Problemas al encender el equipo,','','2','1','2014-12-04 15:16:38','','21');
INSERT INTO mantenimiento VALUES ('6','','Problema con el lector de DVD','','2','5','2014-12-12 03:07:52','','');
INSERT INTO mantenimiento VALUES ('7','2014-12-12','Las hojas de papel se quedan estancadas en la impresora','','3','5','2014-12-12 03:19:00','','15');
INSERT INTO mantenimiento VALUES ('8','2014-12-12','Teclado no funciona la tecla espacio','','2','5','2014-12-12 03:40:55','','');
INSERT INTO mantenimiento VALUES ('10','2014-12-12','Teclado no funciona la tecla espacio','','2','5','2014-12-14 14:13:43','','');
INSERT INTO mantenimiento VALUES ('11','2014-12-12','Teclado no funciona la tecla espacio','','2','5','2014-12-14 14:13:44','','');
INSERT INTO mantenimiento VALUES ('12','2014-12-12','Teclado no funciona la tecla espacio','','2','5','2014-12-14 14:13:44','','');
INSERT INTO mantenimiento VALUES ('13','2014-12-17','adf','','14','5','2014-12-17 04:15:04','','');



#--CREATING TABLE mantenimiento_bk
CREATE TABLE `mantenimiento_bk` (
  `id_mantenimiento_bk` int(11) NOT NULL AUTO_INCREMENT,
  `mantenimiento_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `problemas` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `soluciones` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tiempo` float DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `equipo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliente` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tecnico` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_eliminado` datetime DEFAULT NULL,
  PRIMARY KEY (`id_mantenimiento_bk`),
  UNIQUE KEY `id_mantenimiento_bk_UNIQUE` (`id_mantenimiento_bk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO mantenimiento_bk
INSERT INTO mantenimiento_bk VALUES ('2','3','2014-11-13','asd','s | ','0','','PC001 | 2 | Pc1','','','','2014-11-23 12:31:39');
INSERT INTO mantenimiento_bk VALUES ('3','4','2014-11-16','a','as | ','0','','pc004 | 2 | pc004','','','','2014-11-23 12:31:50');
INSERT INTO mantenimiento_bk VALUES ('4','9','2014-12-12','El equipo no enciende','','','5','C002-E001 | 3 | Laptop Marca Toshiba Modelo Satellite','','','','2014-12-14 12:56:30');
INSERT INTO mantenimiento_bk VALUES ('5','16','2014-12-12','Teclado no funciona la tecla espacio','','','5','C002-E001 | 3 | Laptop Marca Toshiba Modelo Satellite','Orica | Marcelo','','','2014-12-14 14:13:57');
INSERT INTO mantenimiento_bk VALUES ('6','15','2014-12-12','Teclado no funciona la tecla espacio','','','5','C002-E001 | 3 | Laptop Marca Toshiba Modelo Satellite','Orica | Marcelo','Mario Quispe','','2014-12-14 14:15:20');
INSERT INTO mantenimiento_bk VALUES ('7','14','2014-12-12','Teclado no funciona la tecla espacio','','','5','C002-E001 | 3 | Laptop Marca Toshiba Modelo Satellite','Orica | Marcelo','Mario Quispe','','2014-12-14 14:17:35');
INSERT INTO mantenimiento_bk VALUES ('8','13','2014-12-12','Teclado no funciona la tecla espacio','','','5','C002-E001 | 3 | Laptop Marca Toshiba Modelo Satellite','Orica | Marcelo','Mario Quispe','Dario Medina Marquez','2014-12-14 14:18:22');



#--CREATING TABLE pais
CREATE TABLE `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id?pais_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO pais



#--CREATING TABLE parte_equipo
CREATE TABLE `parte_equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid_tipo_parte` int(11) NOT NULL,
  `caracteristicas` text COLLATE utf8_spanish_ci,
  `fecha_compra` date DEFAULT NULL,
  `observaciones` text COLLATE utf8_spanish_ci,
  `fid_equipo` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_partes_equipo_UNIQUE` (`id`),
  KEY `fk_partes_equipo_equipo1_idx` (`fid_equipo`),
  KEY `fk_partes_equipo_tipo_parte1_idx` (`fid_tipo_parte`),
  CONSTRAINT `fk_partes_equipo_equipo1` FOREIGN KEY (`fid_equipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_partes_equipo_tipo_parte1` FOREIGN KEY (`fid_tipo_parte`) REFERENCES `tipo_parte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO parte_equipo
INSERT INTO parte_equipo VALUES ('1','2','Genius','','','1','2014-11-26 04:41:48','');
INSERT INTO parte_equipo VALUES ('2','8','Delux','','','1','2014-11-26 04:41:48','');
INSERT INTO parte_equipo VALUES ('3','5','15\' LG','','','1','2014-11-26 04:41:48','');
INSERT INTO parte_equipo VALUES ('4','7','Delux negro','','','1','2014-11-26 04:41:48','');
INSERT INTO parte_equipo VALUES ('5','7','Core i5 2.6 GHz, 4 Gb RAM, DVD-R','','','2','2014-11-29 16:48:33','');
INSERT INTO parte_equipo VALUES ('6','7','Core i3 de 3.1 GHZ','','','4','2014-12-04 04:44:35','');
INSERT INTO parte_equipo VALUES ('7','8','Delux','','','4','2014-12-04 04:44:35','');
INSERT INTO parte_equipo VALUES ('8','7','Core 2 Duo 2.9 GHz','','','5','2014-12-04 04:50:42','');
INSERT INTO parte_equipo VALUES ('9','8','Delux','','','5','2014-12-04 04:50:42','');
INSERT INTO parte_equipo VALUES ('10','7','Dual Core 2.5 GHz','','','6','2014-12-04 07:04:07','');
INSERT INTO parte_equipo VALUES ('11','6','Samsung 19\&quot;','','','6','2014-12-04 07:04:07','');
INSERT INTO parte_equipo VALUES ('12','2','Delux','','','7','2014-12-15 19:36:06','');
INSERT INTO parte_equipo VALUES ('13','8','Delux','','','7','2014-12-15 19:36:06','');
INSERT INTO parte_equipo VALUES ('14','7','Intel Dual Core 2.0 GHz','','','7','2014-12-15 19:37:50','');
INSERT INTO parte_equipo VALUES ('15','6','Samsung 20\&quot;','','','7','2014-12-15 19:37:50','');
INSERT INTO parte_equipo VALUES ('16','2','Genius','','','8','2014-12-15 19:41:40','');
INSERT INTO parte_equipo VALUES ('17','5','LG 20\&quot;','','','8','2014-12-15 19:41:40','');
INSERT INTO parte_equipo VALUES ('18','2','Genius','','','9','2014-12-15 19:50:40','');
INSERT INTO parte_equipo VALUES ('19','7','Intel Pentium 4 1.7 GHz','','','9','2014-12-15 19:50:40','');
INSERT INTO parte_equipo VALUES ('20','2','Delux','','','10','2014-12-15 20:35:31','');
INSERT INTO parte_equipo VALUES ('21','7','Intel Core2Duo 2.2 GHz','','','10','2014-12-15 20:35:31','');
INSERT INTO parte_equipo VALUES ('22','2','Genius','','','11','2014-12-15 20:45:41','');
INSERT INTO parte_equipo VALUES ('23','9','Hitachi 250 Gb','','','11','2014-12-15 20:45:41','');
INSERT INTO parte_equipo VALUES ('24','2','Genius inalambrico','','','12','2014-12-15 21:18:35','');
INSERT INTO parte_equipo VALUES ('25','7','Intel Core i3 3.0 GHz','','','12','2014-12-15 21:18:35','');
INSERT INTO parte_equipo VALUES ('26','2','HP','','','13','2014-12-15 21:20:50','');
INSERT INTO parte_equipo VALUES ('27','9','Samsung 500 Gb','','','13','2014-12-15 21:20:50','');
INSERT INTO parte_equipo VALUES ('28','2','','','','14','2014-12-17 04:06:48','');
INSERT INTO parte_equipo VALUES ('29','13','Deluxe','','','14','2014-12-17 04:06:48','');
INSERT INTO parte_equipo VALUES ('30','2','Genius','','','15','','');
INSERT INTO parte_equipo VALUES ('31','10','Toshiba 1 Tb','','','15','','');



#--CREATING TABLE permiso
CREATE TABLE `permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fid_seccion` int(11) NOT NULL,
  `ver` tinyint(1) DEFAULT NULL,
  `adicionar` tinyint(1) DEFAULT NULL,
  `editar` tinyint(1) DEFAULT NULL,
  `eliminar` tinyint(1) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_permisos_UNIQUE` (`id`),
  KEY `fk_permiso_seccion1_idx` (`fid_seccion`),
  CONSTRAINT `fk_permiso_seccion1` FOREIGN KEY (`fid_seccion`) REFERENCES `seccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO permiso
INSERT INTO permiso VALUES ('1','Mantenimiento - administrador','1','1','1','1','1','2014-11-04 05:20:42','');
INSERT INTO permiso VALUES ('2','Cliente - administrador','2','1','1','1','1','2014-11-06 08:11:57','');
INSERT INTO permiso VALUES ('3','Tipo de equipo - Administrador','4','1','1','1','1','2014-11-25 20:47:47','');
INSERT INTO permiso VALUES ('4','Tipo de parte - Administrador','5','1','1','1','1','2014-11-25 20:49:07','');
INSERT INTO permiso VALUES ('5','Cliente Usuario - administrador','6','1','1','1','1','2014-11-25 20:49:34','');
INSERT INTO permiso VALUES ('6','Equipo - Administrador','3','1','1','1','1','2014-11-25 20:49:56','');
INSERT INTO permiso VALUES ('7','Personal - Administrador','8','1','1','1','1','2014-11-25 20:50:39','');
INSERT INTO permiso VALUES ('8','Roles - Administrador','9','1','1','1','1','2014-11-25 21:35:15','');
INSERT INTO permiso VALUES ('9','Cargos - Administrador','8','1','1','1','1','2014-11-25 21:35:35','');
INSERT INTO permiso VALUES ('10','Permisos - Administrador','7','1','1','1','1','2014-11-25 21:35:58','');
INSERT INTO permiso VALUES ('11','Clientes - registro','2','1','1','0','0','2014-12-04 15:45:31','');
INSERT INTO permiso VALUES ('12','Reporte contenidos','11','1','0','0','0','2014-12-12 02:50:07','');
INSERT INTO permiso VALUES ('13','Mantenimiento - contenidos','1','1','1','0','0','2014-12-13 20:36:57','');
INSERT INTO permiso VALUES ('14','Tipo de equipo - contenidos','4','1','1','0','0','2014-12-13 22:32:52','');
INSERT INTO permiso VALUES ('15','Tipo parte - Contenidos','5','1','0','1','0','2014-12-14 09:03:09','');
INSERT INTO permiso VALUES ('16','Equipo - Contenidos','3','1','1','0','0','2014-12-14 09:10:11','');
INSERT INTO permiso VALUES ('17','Cliente - contenido','2','1','1','0','0','2014-12-14 09:15:37','');
INSERT INTO permiso VALUES ('18','Cliente Usuario - contenidos','6','1','0','1','0','2014-12-14 09:34:38','');
INSERT INTO permiso VALUES ('19','Personal - Contenidos','10','1','0','0','1','2014-12-14 09:40:41','');
INSERT INTO permiso VALUES ('20','Cargos - Contenido','8','1','0','1','0','2014-12-14 09:43:25','');
INSERT INTO permiso VALUES ('21','Roles  - Contenidos','9','1','0','0','1','2014-12-14 09:53:11','');
INSERT INTO permiso VALUES ('22','Permisos - Contenidos','7','1','0','0','0','2014-12-14 09:54:44','');
INSERT INTO permiso VALUES ('23','Reportes Contenidos','11','1','0','0','0','2014-12-14 12:41:19','');



#--CREATING TABLE personal
CREATE TABLE `personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `especialidad` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `profesion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fid_cargo` int(11) NOT NULL,
  `fid_ciudad_origen` int(11) NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `referencia_personal` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telf_referencia_personal` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `username_canonical` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_canonical` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `expired` tinyint(1) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_spanish_ci,
  `credentials_expired` tinyint(1) DEFAULT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_tecnico_UNIQUE` (`id`),
  KEY `fk_personal_tipo_cargo1_idx` (`fid_cargo`),
  KEY `fk_personal_ciudad1_idx` (`fid_ciudad_origen`),
  CONSTRAINT `fk_personal_ciudad1` FOREIGN KEY (`fid_ciudad_origen`) REFERENCES `ciudad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personal_tipo_cargo1` FOREIGN KEY (`fid_cargo`) REFERENCES `cargo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO personal



#--CREATING TABLE personal_rol
CREATE TABLE `personal_rol` (
  `fid_rol` int(11) NOT NULL,
  `fid_personal` int(11) NOT NULL,
  PRIMARY KEY (`fid_personal`,`fid_rol`),
  KEY `fk_personal_rol_rol1_idx` (`fid_rol`),
  KEY `fk_personal_rol_personal1_idx` (`fid_personal`),
  CONSTRAINT `fk_personal_rol_personal1` FOREIGN KEY (`fid_personal`) REFERENCES `personal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personal_rol_rol1` FOREIGN KEY (`fid_rol`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO personal_rol



#--CREATING TABLE rol
CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_roles_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO rol
INSERT INTO rol VALUES ('1','Administrador','Administrador','2014-11-06 08:17:22','');
INSERT INTO rol VALUES ('2','Soporte','Soporte','2014-11-06 08:19:54','');
INSERT INTO rol VALUES ('3','Cliente','Cliente','2014-11-25 21:36:39','');



#--CREATING TABLE rol_permiso
CREATE TABLE `rol_permiso` (
  `fid_permiso` int(11) NOT NULL,
  `fid_rol` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`fid_permiso`,`fid_rol`),
  KEY `fk_rol-permiso_permiso1_idx` (`fid_permiso`),
  KEY `fk_rol-permiso_rol1_idx` (`fid_rol`),
  CONSTRAINT `fk_rol-permiso_permiso1` FOREIGN KEY (`fid_permiso`) REFERENCES `permiso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol-permiso_rol1` FOREIGN KEY (`fid_rol`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO rol_permiso
INSERT INTO rol_permiso VALUES ('1','2','2014-12-14 14:50:16','');
INSERT INTO rol_permiso VALUES ('1','3','2014-11-29 10:48:02','');
INSERT INTO rol_permiso VALUES ('12','3','2014-12-12 02:50:17','');
INSERT INTO rol_permiso VALUES ('13','2','2014-12-13 20:37:15','');
INSERT INTO rol_permiso VALUES ('14','2','2014-12-13 22:33:03','');
INSERT INTO rol_permiso VALUES ('15','2','2014-12-14 09:03:33','');



#--CREATING TABLE seccion
CREATE TABLE `seccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_seccion_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO seccion
INSERT INTO seccion VALUES ('1','Mantenimiento','','2014-10-24 17:04:08','');
INSERT INTO seccion VALUES ('2','Cliente','','2014-10-24 17:04:15','');
INSERT INTO seccion VALUES ('3','Equipos','','2014-11-25 20:39:05','');
INSERT INTO seccion VALUES ('4','Tipo de equipo','','2014-11-25 20:39:22','');
INSERT INTO seccion VALUES ('5','Tipo de parte','','2014-11-25 20:39:32','');
INSERT INTO seccion VALUES ('6','Cliente usuario','','2014-11-25 20:39:44','');
INSERT INTO seccion VALUES ('7','Permisos','','2014-11-25 20:39:56','');
INSERT INTO seccion VALUES ('8','Cargos','','2014-11-25 20:40:05','');
INSERT INTO seccion VALUES ('9','Roles','','2014-11-25 20:40:28','');
INSERT INTO seccion VALUES ('10','Personal','','2014-11-25 20:51:41','');
INSERT INTO seccion VALUES ('11','Reporte','','2014-12-01 04:56:37','');



#--CREATING TABLE tipo_equipo
CREATE TABLE `tipo_equipo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tiempo_vida_util` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO tipo_equipo
INSERT INTO tipo_equipo VALUES ('2','PC de escritorio','Pc de escritorio','4','2014-10-20 18:17:21','');
INSERT INTO tipo_equipo VALUES ('3','Laptop','Latop','4','2014-10-20 18:26:45','');
INSERT INTO tipo_equipo VALUES ('4','Impresora','Impresora','4','2014-11-30 09:56:02','');
INSERT INTO tipo_equipo VALUES ('5','Scanner','Scanner','7','2014-11-30 09:56:15','');



#--CREATING TABLE tipo_parte
CREATE TABLE `tipo_parte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tiempo_vida_util` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_tipo_parte_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO tipo_parte
INSERT INTO tipo_parte VALUES ('2','Mouse','Mouse Genius','3','2014-10-20 15:01:27','');
INSERT INTO tipo_parte VALUES ('3','Impresora','Impresora Cannon','5','2014-10-20 15:30:38','');
INSERT INTO tipo_parte VALUES ('4','Scanner','Scanner Cannon','4','2014-10-20 15:31:56','');
INSERT INTO tipo_parte VALUES ('5','Monitor LED','Monitor LED','7','2014-11-25 20:29:01','');
INSERT INTO tipo_parte VALUES ('6','Monitor LCD','Monitor LCD','6','2014-11-25 20:29:12','');
INSERT INTO tipo_parte VALUES ('7','CPU','CPU','5','2014-11-25 20:29:28','2014-12-15 21:21:07');
INSERT INTO tipo_parte VALUES ('8','Teclado','Teclado','5','2014-11-25 20:29:46','');
INSERT INTO tipo_parte VALUES ('9','Disco Duro - Interno','Disco Duro - Interno','5','2014-12-04 04:45:16','');
INSERT INTO tipo_parte VALUES ('10','Disco Duro - Externo','Disco Duro - Externo','6','2014-12-04 04:45:42','');
INSERT INTO tipo_parte VALUES ('11','Lector CD/DVD','Lector CD/DVD','4','2014-12-04 04:45:59','');
INSERT INTO tipo_parte VALUES ('12','Audifonos','Audifonos','4','2014-12-04 07:04:31','');
INSERT INTO tipo_parte VALUES ('13','Parlantes multimedia','Parlantes multimedia','7','2014-12-04 07:05:17','');
INSERT INTO tipo_parte VALUES ('14','','','10','2014-12-04 07:05:49','');
INSERT INTO tipo_parte VALUES ('15','Monitor TRC','Monitor TC','12','2014-12-15 19:38:16','');
INSERT INTO tipo_parte VALUES ('16','Grabador externo DVD','Grabador externo DVD USB 2.0','5','2015-09-08 21:47:52','');



#--CREATING TABLE usuario
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_spanish_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `telefono` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` text COLLATE utf8_spanish_ci,
  `tipo_usuario` tinyint(4) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `especialidad` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `referencia_personal` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telf_ref_personal` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fid_cargo` int(11) DEFAULT NULL,
  `profesion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fid_cliente` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `departamento` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E6C4F9A392FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_E6C4F9A3A0D96FBF` (`email_canonical`),
  KEY `FK_usuario_cargo` (`fid_cargo`),
  KEY `fid_cliente` (`fid_cliente`),
  CONSTRAINT `FK_usuario_cargo` FOREIGN KEY (`fid_cargo`) REFERENCES `cargo` (`id`),
  CONSTRAINT `FK_usuario_cliente1` FOREIGN KEY (`fid_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO usuario
INSERT INTO usuario VALUES ('1','super','super','super@test.com','super@test.com','1','eribtptnndw0swoso0w4gk0osg4csos','W6zIw4abGRirIYPY4IaPNx6nB3kBIbriWJVzudicUpp13eEz1PfNPVjNRGKueXz4WRiYv+3ES1qser39MK52xQ==','2015-09-10 20:22:04','0','0','','XWSydBA-yyjiEe5eLteWTPZ8i46ugI5w6T1P21O3cu4','2014-11-11 08:10:05','a:1:{i:0;s:10:\&quot;ROLE_ADMIN\&quot;;}','0','','','','','super','super','1','s','1','2','test','','2014-11-12 04:12:45','');
INSERT INTO usuario VALUES ('13','rosa','rosa','rosa874_c@hotmail.com','rosa874_c@hotmail.com','1','2324yzwhyw4k08w0o4s8ccwwgsgccgs','+3xBW1Qb0kNhbYrLjG7Cj4Ph40RQUjIHeSt6VNix51Zsy168bgx9pWU8u2nVXr37dfXa44oViQ2C05Chf0EheQ==','2014-11-29 21:57:33','0','0','','','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','1','Rosa Marquez','Administrador','76554632','','','1','Ing. de Sistemas','1','2014-11-25 20:35:48','');
INSERT INTO usuario VALUES ('14','ruben','ruben','rdias@orica.com','rdias@orica.com','1','gmzgrzuqro8ccw4so0ksowggkw888sw','HcCoO1sl+vaFQwYpN+7BQFMiwzolEDS9YWYfzHQ6bo7GadLCC2/z00vqzcay+3bM6sU6lvFjfGLA4o21+1Kyew==','2014-11-30 09:21:15','0','0','','','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','1','','Auditoria financiera','75643322','','','4','','2','2014-11-26 04:39:48','Contabilidad');
INSERT INTO usuario VALUES ('15','rgutierrez','rgutierrez','juan@enbolivia.com','juan@enbolivia.com','1','2qrryrsphyyowcs4wg4g040owk4wckw','6FsUKgSo3D7Glz4keQQjGSHLysHFKuIEP4azBry2v5b8FRSlwOfeWunErp/YQXO7GWQGJKjDdnwxoTeZsFa6bw==','2014-11-29 10:32:25','0','0','','cGF_vVb7nc8HomDB8fyRsvl0LNfWr210vp_DbuK9Boo','2014-12-15 16:35:47','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','2','Roberto Gutierrez','Mantenimiento de Monitores','76566443','Maria Gutierrez','76534822','2','Ing. de Sistemas','','2014-11-26 20:56:30','');
INSERT INTO usuario VALUES ('16','mquispe','mquispe','mquispe@orica.com','mquispe@orica.com','1','puuh7hobipwko8ssswcwk80c48ww8o8','sQc5c4MfYLT5GGXOqv/Kq0VsKIDpinu5Yk5Fq0fZTNq+dz/TsFXfUE9bgrkdZrF2subY7DGr20rwlLC1sbdUqg==','2014-12-12 02:50:30','0','0','','','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','1','Mario Quispe','Desarrollo de Sistemas','75498723','','','2','','2','2014-11-29 16:30:46','');
INSERT INTO usuario VALUES ('17','lmamani','lmamani','lili291_mamani@hotmail.com','lili291_mamani@hotmail.com','1','lq1cv78zgtcksokwwscsgko4cksw80w','D2USI6xe8a2XnE3vpy9ymsyIaK7o4IXht0knyYd0mvfPYRqXHqeKz5oFRFEPYxycUe7pULF9z1LgMrjoznEspQ==','','0','0','','','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','1','Liliana Marcela Mamani','Contabilidad y Auditoria','7659988','','','4','','2','2014-12-02 21:56:04','Contabilidad');
INSERT INTO usuario VALUES ('18','mquenta','mquenta','mrosario2933@gmail.com','mrosario2933@gmail.com','1','s9xncy1p9w0cgso88g4g0c4440ckk4c','LB4kMzus07mJeG4kQcp3TZOzIduMskP0uQvWfmfgP/sei/KzqntZ6hb6Cwn2MtgYnTeYxBpKMAVBV+fP7pSGCg==','','0','0','','','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','1','Maria Rosario Quenta','Marketing y Publicidad','76521988','','','6','','2','2014-12-02 21:57:54','');
INSERT INTO usuario VALUES ('19','gquispe','gquispe','gquispe@orica.com','gquispe@orica.com','1','kgjp9wlfdlw0wsc4o0w4gwkck88808k','EqkwkhInRj+krg6iS4djBeo6Yx/tdc6EMrC6utLSvvhWGJEisWVLmg0oKU2PJw57bA24DqvYAV9ftuF8A6Mw0g==','','0','0','','','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','1','Gustavo Quispe Calani','Administrador de Bases de datos','77287622','','','8','Ing. de Sistemas','2','2014-12-04 04:34:02','Sistemas');
INSERT INTO usuario VALUES ('20','cmamani','cmamani','juan.c.c.q@gmail.com','juan.c.c.q@gmail.com','1','178p4esalxk0g0swkks0ooos4ssg8oo','dGbkfbLt22//HTLMXcPiTkiM3jF79Nan4yhoiNvK7lfl0xZvRqr2pWjycdGl9XsjZnl79PTB8oASwR9y4T6CEw==','2014-12-17 05:55:37','0','0','','RnUcQ_mSqw6czM5IP4032HkYGHZZLUGCyy_zHY0NIag','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','1','Cesar SImon Mamani Alvarez','Marketing y Publicidad','76970131','','','7','','2','2014-12-04 04:38:31','');
INSERT INTO usuario VALUES ('21','mhumeres','mhumeres','mhumeres@tric.com','mhumeres@tric.com','1','lbd4l4mhxa84sw0wk8gcwosck8ko0cw','QJYB9OpTCGtlOBgM5n5h6Du5UYeJkpp+GJMYF1MQC3UTFhnsFbZyilf4QL/nF10G8q+B0LLE2J4Iq8jexrQ9wA==','','0','0','','','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','2','Mario Sandro Humerez Paz','','75412909','Vania Humerez Chana','71265988','2','','','2014-12-04 14:35:49','');
INSERT INTO usuario VALUES ('22','lgabino','lgabino','juanadf.c.c.q@gmail.com','lgabino@tric.com','1','ikobx4hqrz4gkgc0ckowcs4ss84sk4c','Yy+BjOD4Gi3LAgcWwbkOITfoxs6nZgdQ64oGxZI36hoqmkGeeZhQiRPwkujD3a7YCReq9ovGYVIklVE/DiSygw==','','0','0','','','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','2','Lizeth Gabino Marquez','','76543122','','','2','Tec. Sup. en Informatica','','2014-12-04 14:37:22','');
INSERT INTO usuario VALUES ('23','mmamani','mmamani','juan.c.c.q1@gmail.com','juan.cww.c.q@gmail.com','1','3etv5mpu1nggkcco88s40k8cckowc0g','A3NuyX2W6EyhPOEe4CHnxr532w4MkIYMAL8779FKqseySU7eoM9PVtDeT//qs2RHYJB7EQ4uxgdpf/KXreA0Vw==','','0','0','','M_jE2YwnJD6ui03ClANkCCC1zxj181ZhJxCmgDnuRk0','2014-12-15 15:47:24','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','2','Manuel Mamani Santos','','76786432','Silvia Mamani','74343659','2','Ing. de Sistemas','','2014-12-04 14:44:44','');
INSERT INTO usuario VALUES ('24','dmedina','dmedina','juan.c.c.2@gmail.com','juan.c.c.2@gmail.com','1','oug38u922dc0css00848ckgcck4o00w','CehA6yEBKMZfHcCMgmqi/nZn2nPeAqOjNuAolEe2Qf6eRQoiDvDZ32PQw7EjMHhDodS7K35O7NXaBKBPTsn4rw==','2014-12-17 05:55:08','0','0','','avTG_53LlnRXMSi631_b26elNqRBE0RaiTeszDSROkU','2014-12-15 15:23:25','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','2','Dario Medina Marquez','','74532411','Leslie Torrez','76533123','2','','','2014-12-04 14:46:48','');
INSERT INTO usuario VALUES ('25','test','test','juan1@enbolivia.com','juan1@enbolivia.com','1','s5hbr9u9h68ooso0k8w00sc80kkwosk','O+c/uvc6qW68+B3mvwaSrOCGZHrCj5jQGPcd2sa6skEWBbtWAMcGVAMaeNCSpQigJqBKWR90UXj6sGX9F9FKtg==','2014-12-14 09:09:24','0','0','','H-5YwebH_ssqCzWDOaklr__SZrGjQ0UELB9J1ASX16A','2014-12-15 16:19:50','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','2','test','test','9999','888','8999','2','sd','','2014-12-14 09:08:20','');
INSERT INTO usuario VALUES ('26','msanchez','msanchez','msanchez@kas.com','msanchez@kas.com','1','1h5zwa2jor5wccwwcs8wgcgkcgwcw0s','qGK3MJojNO/SL0B05q/fOS9+iaacIVA9ezTCIm7IGElc9pwZqK7eJl8AP9SPK4pBVsahom++wmk6JZO4lqPYcA==','','0','0','','','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','1','Mario Sanchez','Administrador de empresas','','','','6','Administrador de empresas','3','2014-12-15 21:10:14','Gerencia');
INSERT INTO usuario VALUES ('27','iportugal','iportugal','iportugal@kas.com','iportugal@kas.com','1','ri7i1bmhqi8sgc4g0g4o0ccgw40kgkg','IUrtTxQLWxXNKhtfDuDd2dJzs8k6xTm9p/BbCO3ya2Gzh1nlonUXaJcfIHOrsDlZ/4S4zrt7+4U/Wlsjehf/wg==','','0','0','','','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','1','Irene Magali Portugal','Marketing y Publicidad','','','','7','','3','2014-12-15 21:11:41','Marketing');
INSERT INTO usuario VALUES ('28','skonsak','skonsak','skonsak@kas.com','skonsak@kas.com','1','h5ajeikcgy04sg4so40gksc8csscw00','7B2a+fmcXlAMDfUAC1konExnPuj614mF/3+ScvrPNSxcq0XRvAkxCUySSwutDdnvv+5cx5z06c5j0CAM50kF0g==','','0','0','','','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','1','Susan Konsak','Relaciones internacionales','','','','6','','3','2014-12-15 21:15:21','Gerencia');
INSERT INTO usuario VALUES ('29','rorihuela','rorihuela','rorihuela@oikocredit.com','rorihuela@oikocredit.com','1','ilu7v7aarfw4ck0gw04480oks84gwkg','pNsm9Zv8A1Sgk0Dr7Wt82QXSYIXy4jjKA+Mbr1TCnTeT4SlOjTmJgUv/P75UdFoCnFWaI8KslKabjFF/gj3SIA==','','0','0','','','','a:1:{i:0;s:9:\&quot;ROLE_USER\&quot;;}','0','','','','1','Rodrigo Orihuela','Comercio internacional','','','','6','','4','','Gerencia');



#--CREATING TABLE usuario_cliente
CREATE TABLE `usuario_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `profesion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `departamento` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fid_cargo` int(11) NOT NULL,
  `fid_cliente` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id`),
  KEY `fk_usuario_cliente_idx` (`fid_cliente`),
  KEY `fk_usuario_tipo_cargo1_idx` (`fid_cargo`),
  CONSTRAINT `fk_usuario_cliente` FOREIGN KEY (`fid_cliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_tipo_cargo1` FOREIGN KEY (`fid_cargo`) REFERENCES `cargo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO usuario_cliente



#--CREATING TABLE usuario_equipo
CREATE TABLE `usuario_equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `fid_usuario` int(11) NOT NULL,
  `fid_equipo` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_usuario_equipo_UNIQUE` (`id`),
  KEY `fk_usuario_equipo_usuario1_idx` (`fid_usuario`),
  KEY `fk_usuario_equipo_equipo1_idx` (`fid_equipo`),
  CONSTRAINT `fk_usuario_equipo_equipo1` FOREIGN KEY (`fid_equipo`) REFERENCES `equipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_equipo_usuario1` FOREIGN KEY (`fid_usuario`) REFERENCES `usuario_cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO usuario_equipo



#--CREATING TABLE usuario_rol
CREATE TABLE `usuario_rol` (
  `fid_usuario` int(11) NOT NULL,
  `fid_rol` int(11) NOT NULL,
  PRIMARY KEY (`fid_usuario`,`fid_rol`),
  KEY `fk_usuario_rol_usuario1_idx` (`fid_usuario`),
  KEY `fk_usuario_rol_rol1_idx` (`fid_rol`),
  CONSTRAINT `fk_usuario_rol_rol1` FOREIGN KEY (`fid_rol`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_rol_usuario1` FOREIGN KEY (`fid_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO usuario_rol
INSERT INTO usuario_rol VALUES ('13','3');
INSERT INTO usuario_rol VALUES ('14','3');
INSERT INTO usuario_rol VALUES ('15','2');
INSERT INTO usuario_rol VALUES ('16','3');
INSERT INTO usuario_rol VALUES ('17','3');
INSERT INTO usuario_rol VALUES ('18','3');
INSERT INTO usuario_rol VALUES ('19','3');
INSERT INTO usuario_rol VALUES ('20','3');
INSERT INTO usuario_rol VALUES ('21','2');
INSERT INTO usuario_rol VALUES ('22','2');
INSERT INTO usuario_rol VALUES ('23','2');
INSERT INTO usuario_rol VALUES ('24','2');
INSERT INTO usuario_rol VALUES ('26','3');
INSERT INTO usuario_rol VALUES ('27','3');
INSERT INTO usuario_rol VALUES ('28','3');
INSERT INTO usuario_rol VALUES ('29','3');



#--CREATING TABLE visita
CREATE TABLE `visita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `observaciones` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `fid_mantenimiento` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_visita_UNIQUE` (`id`),
  KEY `fk_visita_mantenimiento1_idx` (`fid_mantenimiento`),
  CONSTRAINT `fk_visita_mantenimiento1` FOREIGN KEY (`fid_mantenimiento`) REFERENCES `mantenimiento` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#--INSERTING DATA INTO visita
INSERT INTO visita VALUES ('1','Problemas con el mouse','2014-12-12','11:00:00','12:30:00','1','2014-11-26 08:24:02','');
INSERT INTO visita VALUES ('2','Se comprobo que el equipo tenia un virus','2014-10-12','11:00:00','18:00:00','4','2014-12-04 15:05:26','');
INSERT INTO visita VALUES ('3','Se compro otro mouse y se reemplazo por el defectuoso','2014-12-13','09:00:00','10:00:00','1','2014-12-14 14:51:49','');
INSERT INTO visita VALUES ('4','Se reaiizo la limpieza del teclado, se encontro residuos de migas','2013-06-12','14:30:00','15:45:00','2','','');
INSERT INTO visita VALUES ('5','Existia un problema en el MBR del equipo, se restauro el archivo','2014-03-24','15:00:00','16:00:00','3','','');
INSERT INTO visita VALUES ('6','','2015-08-14','11:00:00','11:30:00','5','','');
INSERT INTO visita VALUES ('7','Se instalo el equipo al usuarios','2014-08-18','11:30:00','12:00:00','5','','');



SET FOREIGN_KEY_CHECKS=1;

#-- THE END

