-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: softbarv4
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `canchas`
--

DROP TABLE IF EXISTS `canchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canchas` (
  `id_cancha` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_cancha` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_cancha`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canchas`
--

LOCK TABLES `canchas` WRITE;
/*!40000 ALTER TABLE `canchas` DISABLE KEYS */;
INSERT INTO `canchas` VALUES (1,'Cancha 1 '),(2,'Cancha 2');
/*!40000 ALTER TABLE `canchas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id_categoria` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Licor'),(2,'Pasabocas');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `id_compra` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `id_proveedor_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `FKh4dbhn3hjbanm17aecpj12b0y` (`id_proveedor_fk`),
  CONSTRAINT `FKh4dbhn3hjbanm17aecpj12b0y` FOREIGN KEY (`id_proveedor_fk`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_compra` (
  `id_producto` bigint(20) NOT NULL,
  `id_compra` bigint(20) NOT NULL,
  KEY `FK24e1stplndaucn3dao9chwo8p` (`id_compra`),
  KEY `FKssv9q9wdop1s864p7y43e6no1` (`id_producto`),
  CONSTRAINT `FK24e1stplndaucn3dao9chwo8p` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`),
  CONSTRAINT `FKssv9q9wdop1s864p7y43e6no1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domicilios`
--

DROP TABLE IF EXISTS `domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domicilios` (
  `id_domicilio` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` varchar(255) DEFAULT NULL,
  `id_pedido_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_domicilio`),
  KEY `FKjs0ys2g3tktvibssheyb91yv2` (`id_pedido_fk`),
  CONSTRAINT `FKjs0ys2g3tktvibssheyb91yv2` FOREIGN KEY (`id_pedido_fk`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilios`
--

LOCK TABLES `domicilios` WRITE;
/*!40000 ALTER TABLE `domicilios` DISABLE KEYS */;
INSERT INTO `domicilios` VALUES (1,'En camino','2023-03-23','22:18',1);
/*!40000 ALTER TABLE `domicilios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formas_pago`
--

DROP TABLE IF EXISTS `formas_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formas_pago` (
  `id_forma_pago` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_formas` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formas_pago`
--

LOCK TABLES `formas_pago` WRITE;
/*!40000 ALTER TABLE `formas_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `formas_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventarios`
--

DROP TABLE IF EXISTS `inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventarios` (
  `id_inventario` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad_existente` int(11) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  `id_producto_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `FKdt2jwewqm60dsf0pvvjtx80j0` (`id_producto_fk`),
  CONSTRAINT `FKdt2jwewqm60dsf0pvvjtx80j0` FOREIGN KEY (`id_producto_fk`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventarios`
--

LOCK TABLES `inventarios` WRITE;
/*!40000 ALTER TABLE `inventarios` DISABLE KEYS */;
INSERT INTO `inventarios` VALUES (1,190,'2023-03-21','2023-03-23','Activo',4),(2,200,'2023-03-23','2023-03-24','Proximo a vencer ',8),(3,50,'2024-12-30','2023-03-23','Activo',8);
/*!40000 ALTER TABLE `inventarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id_pedido` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `id_productos_fk` bigint(20) DEFAULT NULL,
  `id_usuario_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FKog14tnl5wab758s60hso6cgkx` (`id_productos_fk`),
  KEY `FKn79oy8ejnkifirm8wqbpaf33u` (`id_usuario_fk`),
  CONSTRAINT `FKn79oy8ejnkifirm8wqbpaf33u` FOREIGN KEY (`id_usuario_fk`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `FKog14tnl5wab758s60hso6cgkx` FOREIGN KEY (`id_productos_fk`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,20,3500,75000,6,1),(2,12,25000,5,4,1),(3,18,50000,600000,2,1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id_producto` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre_producto` varchar(255) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `id_categoria` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `FKdtoa37luoxhhvbicrfiu5ygbj` (`id_categoria`),
  CONSTRAINT `FKdtoa37luoxhhvbicrfiu5ygbj` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,0,'Cerveza Aguila','Cerveza Aguila',3000,1),(2,0,'Aguardiente 1L','Aguardiente nectar',50000,1),(3,0,'Whisky','Whisky',70000,1),(4,0,'Vodka','Smirnoof',38000,1),(5,0,'Six pack cerveza corona 250ml','Cerveza Corona',20000,1),(6,0,'Six pack cerveza costeñita 350ml','Cerveza Costeñita',16000,1),(7,0,'Paquete super ricas sabor a pollo','Super ricas ',3000,2),(8,0,'Ron viejo de caldas 750ml','Ron viejo de caldas',92000,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id_proveedor` bigint(20) NOT NULL AUTO_INCREMENT,
  `articulo` varchar(100) DEFAULT NULL,
  `nombre_proveedor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservas` (
  `id_reserva` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` varchar(255) DEFAULT NULL,
  `numero_personas` int(11) DEFAULT NULL,
  `id_cancha` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `FK72uf8hrj1c62yfpu49kwlniel` (`id_cancha`),
  KEY `FKhjryje6u1cr0d4dubad1jja6` (`id_usuario`),
  CONSTRAINT `FK72uf8hrj1c62yfpu49kwlniel` FOREIGN KEY (`id_cancha`) REFERENCES `canchas` (`id_cancha`),
  CONSTRAINT `FKhjryje6u1cr0d4dubad1jja6` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2023-03-12','18:00',4,1,1);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Empleado'),(3,'Cliente');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(20) DEFAULT NULL,
  `contrasena` varchar(10) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `identificacion` varchar(11) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `FK3kl77pehgupicftwfreqnjkll` (`id_rol`),
  CONSTRAINT `FK3kl77pehgupicftwfreqnjkll` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Mor','23469EJ','andresfel2108@gmail.com','calle 27 norte #46-64',18,'2023-03-24','12345','Andres','32015688',3),(2,'Barragan','1294323u','andresfel2108@gmail.com','calle 27 norte #46-64',19,'2003-08-19','15795322','Andres','32015688',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_domicilios`
--

DROP TABLE IF EXISTS `venta_domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_domicilios` (
  `id_venta_domicilio` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor_total` int(11) DEFAULT NULL,
  `id_domicilio_fk` bigint(20) DEFAULT NULL,
  `id_forma_pago` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_venta_domicilio`),
  KEY `FKpiosl3mb5o99bk5nl48idpwxb` (`id_domicilio_fk`),
  KEY `FKcokvbxlnxtwk2lpodu1apm58y` (`id_forma_pago`),
  CONSTRAINT `FKcokvbxlnxtwk2lpodu1apm58y` FOREIGN KEY (`id_forma_pago`) REFERENCES `formas_pago` (`id_forma_pago`),
  CONSTRAINT `FKpiosl3mb5o99bk5nl48idpwxb` FOREIGN KEY (`id_domicilio_fk`) REFERENCES `domicilios` (`id_domicilio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_domicilios`
--

LOCK TABLES `venta_domicilios` WRITE;
/*!40000 ALTER TABLE `venta_domicilios` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_domicilios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_reservas`
--

DROP TABLE IF EXISTS `venta_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_reservas` (
  `id_venta_reserva` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor_total` int(11) DEFAULT NULL,
  `id_forma_pago` bigint(20) DEFAULT NULL,
  `id_reserva` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_venta_reserva`),
  KEY `FKrmusjc69kl0igj2j5hxsm5scx` (`id_forma_pago`),
  KEY `FKq9797trkua12gdusi9tmmbc1y` (`id_reserva`),
  CONSTRAINT `FKq9797trkua12gdusi9tmmbc1y` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`),
  CONSTRAINT `FKrmusjc69kl0igj2j5hxsm5scx` FOREIGN KEY (`id_forma_pago`) REFERENCES `formas_pago` (`id_forma_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_reservas`
--

LOCK TABLES `venta_reservas` WRITE;
/*!40000 ALTER TABLE `venta_reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_reservas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-25 11:44:01
