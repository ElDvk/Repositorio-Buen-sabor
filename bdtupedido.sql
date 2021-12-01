-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2021 a las 00:15:11
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdtupedido`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_delete_cliente` (`c_id` INT)  begin
	delete from cliente
    where idcliente=c_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_delete_plato` (`p_id` INT)  begin
	delete from plato
    where id_plato=p_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_filtrar_id` (`id` INT(11))  begin
	select max(id_pedido) from pedido p
    where p.id_pedido = id ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_filtrar_id_cliente` (`id` INT(11))  begin
	select * from cliente p
    where p.idcliente = id ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_filtrar_plato` (`id` INT(11))  begin
	select * from plato p
    where p.id_plato = id ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insert_plato` (`p_cod` VARCHAR(255), `p_nom` VARCHAR(255), `p_pre` DOUBLE(5,2), `p_idcat` INT, `p_foto` VARCHAR(255))  begin
	insert into plato(codigo_plato,nombre_plato,precio_plato,id_categoria,foto_plato)
    values (p_cod,p_nom,p_pre,p_idcat,p_foto);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_listar_plato` ()  begin
	select * from plato order by id_plato;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_update_cliente` (`c_id` INT, `c_apem` VARCHAR(255), `c_apep` VARCHAR(255), `c_correo` VARCHAR(255), `c_dir` VARCHAR(255), `c_edad` VARCHAR(255), `c_est` VARCHAR(255), `c_fec` VARCHAR(255), `c_nom` VARCHAR(255), `c_sex` VARCHAR(255), `c_tel` VARCHAR(255))  begin
	update cliente
    set cli_apellidom=c_apem,
		cli_apellidop=c_apep,
        cli_correo=c_correo,
		cli_direccion=c_dir,
		cli_edad=c_edad,
        cli_estado=c_est,
        cli_fecha_registro=c_fec,
        cli_nombre=c_nom,
        cli_sexo=c_sex,
        cli_telefono= c_tel   
    where idcliente=c_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_update_estado_cliente` (`p_id` INT, `p_estado` VARCHAR(1))  begin
	update cliente
    set cli_estado=p_estado
	where idcliente=p_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_update_estado_pedido` (`p_id` INT, `p_estado` VARCHAR(1))  begin
	update pedido
    set estado=p_estado
	where id_pedido=p_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_update_plato` (`p_id` INT, `p_cod` VARCHAR(255), `p_nom` VARCHAR(255), `p_pre` DOUBLE(5,2), `p_idcat` INT, `p_foto` VARCHAR(255))  begin
	update plato
    set codigo_plato=p_cod,
		nombre_plato=p_nom,
        precio_plato=p_pre,
        id_categoria=p_idcat,
        foto_plato=p_foto
	where id_plato=p_id;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogue`
--

CREATE TABLE `catalogue` (
  `catabident` int(11) NOT NULL,
  `cataname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catalogue`
--

INSERT INTO `catalogue` (`catabident`, `cataname`) VALUES
(1, 'TIPO FORMA DE PAGO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cataloguedet`
--

CREATE TABLE `cataloguedet` (
  `catdbident` int(11) NOT NULL,
  `catdcode` varchar(255) DEFAULT NULL,
  `catdname` varchar(255) DEFAULT NULL,
  `catabident` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cataloguedet`
--

INSERT INTO `cataloguedet` (`catdbident`, `catdcode`, `catdname`, `catabident`) VALUES
(1, '001', 'TARJETA DE CREDITO', 1),
(2, '002', 'TARJETA DE DEBITO', 1),
(3, '003', 'EFECTIVO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `codigo_cat` varchar(255) DEFAULT NULL,
  `nombre_cat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `codigo_cat`, `nombre_cat`) VALUES
(1, 'CAT001', 'ENTRADA'),
(2, 'CAT002', 'SOPA'),
(3, 'CAT003', 'POSTRES'),
(4, 'CAT004', 'A LA CARTA'),
(5, 'CAT005', 'ECONOMICOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` bigint(20) NOT NULL,
  `cli_apellidom` varchar(255) DEFAULT NULL,
  `cli_apellidop` varchar(255) DEFAULT NULL,
  `cli_correo` varchar(255) DEFAULT NULL,
  `cli_direccion` varchar(255) DEFAULT NULL,
  `cli_edad` varchar(255) DEFAULT NULL,
  `cli_estado` varchar(255) DEFAULT NULL,
  `cli_fecha_registro` varchar(255) DEFAULT NULL,
  `cli_nombre` varchar(255) DEFAULT NULL,
  `cli_sexo` varchar(255) DEFAULT NULL,
  `cli_telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `cli_apellidom`, `cli_apellidop`, `cli_correo`, `cli_direccion`, `cli_edad`, `cli_estado`, `cli_fecha_registro`, `cli_nombre`, `cli_sexo`, `cli_telefono`) VALUES
(1, 'ANCHAYA', 'MIÑOPE', 'estminopea@uch.pe', 'AV. LAS LOMAS 123', '20', '2', '2021-11-04 01:40:18', 'ESTEFANI EMILIA', 'F', '981124120'),
(2, 'LOPEZ', 'RIQUELME', 'rlopez@hotmail.com', 'AV. HEROES DEL PERU - VES', '25', '1', '2021-11-04 01:17:29', 'CARLOS', 'M', '974919352'),
(3, 'Mori', 'Torres', 'jlTorres@outlook.com', 'AH. AÑO NUEVO - 2220', '23', '1', '2021-11-03 18:32:09', 'Julio', 'M', '998542369'),
(4, 'QUISPE', 'ORMEÑO', 'hQuispe@hotmail.com', 'AV. GRAU 123- CERCADO DE LIMA', '25', '1', '2021-11-03 18:35:38', 'HILDA', 'F', '55555555555555'),
(5, 'Pachas', 'Pablo', 'pachasLuis@uch.pe', 'AV. DEL SOL 159 - PERU', '19', '1', '2021-11-03 19:01:14', 'Luis Fernando', 'F', '9811111100'),
(6, 'HIDALGO', 'LOPEZ', 'lopezHJ@outlook.com', 'URB NOSIGLIA PASAJE 2 113 - BREÑA', '18', '1', '2021-11-03 22:31:19', 'JAIME', 'M', '9999999999');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasarelapago`
--

CREATE TABLE `pasarelapago` (
  `ppbident` int(11) NOT NULL,
  `codigo_seguridad` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `fecha_caducidad` varchar(255) DEFAULT NULL,
  `ppestado` varchar(255) DEFAULT NULL,
  `ppformapago` varchar(255) DEFAULT NULL,
  `ppnrocuenta` varchar(255) DEFAULT NULL,
  `pptotal` varchar(255) DEFAULT NULL,
  `titularcuenta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pasarelapago`
--

INSERT INTO `pasarelapago` (`ppbident`, `codigo_seguridad`, `correo`, `fecha_caducidad`, `ppestado`, `ppformapago`, `ppnrocuenta`, `pptotal`, `titularcuenta`) VALUES
(1, '300', 'luisfernandopablopachas@hotmail.com', '05/24', '1', 'TARJETA DE CREDITO', '4557880565409830', '7.5', 'Pablo Pachas Luis Fernando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `igvtotal` decimal(19,2) DEFAULT NULL,
  `numero_pedido` varchar(255) DEFAULT NULL,
  `serie_pedido` varchar(255) DEFAULT NULL,
  `subtotal` decimal(19,2) DEFAULT NULL,
  `total` decimal(19,2) DEFAULT NULL,
  `idcliente` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `estado`, `fecha`, `igvtotal`, `numero_pedido`, `serie_pedido`, `subtotal`, `total`, `idcliente`) VALUES
(50, '1', '2021-11-12', '39.81', '1', 'VT00', '221.19', '261.00', 1),
(51, '1', '2021-11-21', '0.92', '1', 'VT00', '5.08', '6.00', 4),
(52, '1', '2021-11-23', '6.10', '1', 'VT00', '33.90', '40.00', 1),
(53, '2', '2021-11-22', '1.14', '1', 'VT00', '6.36', '7.50', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidoitem`
--

CREATE TABLE `pedidoitem` (
  `id_item` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `sub_total` decimal(19,2) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_plato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidoitem`
--

INSERT INTO `pedidoitem` (`id_item`, `cantidad`, `sub_total`, `id_pedido`, `id_plato`) VALUES
(2, 9, '20.00', 50, 1),
(3, 2, '25.50', 50, 1),
(4, 2, '15.00', 50, 1),
(5, 2, '3.00', 51, 1),
(6, 2, '20.00', 52, 1),
(7, 1, '7.50', 53, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

CREATE TABLE `plato` (
  `id_plato` int(11) NOT NULL,
  `codigo_plato` varchar(255) DEFAULT NULL,
  `foto_plato` varchar(255) DEFAULT NULL,
  `nombre_plato` varchar(255) DEFAULT NULL,
  `precio_plato` double DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`id_plato`, `codigo_plato`, `foto_plato`, `nombre_plato`, `precio_plato`, `id_categoria`, `fecha`) VALUES
(1, 'PLT001', 'caldogallina.jpg', 'CALDO DE GALLINA 2', 15, 2, NULL),
(2, 'PLT002', 'ajidegallina.jpg', 'AJI GALLINA', 20, 5, NULL),
(3, 'PLT003', 'arrozconpollo.jpg', 'ARROZ CON POLLO', 25.5, 4, NULL),
(4, 'PLT004', 'arrozconpato.jpg', 'ARROZ CON PATO', 38.5, 4, NULL),
(5, 'SOPCAS', 'sopadecasa.jpg', 'Sopa de casa', 3, 2, NULL),
(6, 'SOPMIN', 'sopaalaminuta.jpg', 'Sopa a la minuta', 4, 2, NULL),
(7, 'SOPLEC', 'sopadeleche.jpg', 'Sopa de leche', 4, 2, NULL),
(8, 'SOPQUI', 'sopadequinoa.jpg', 'Sopa de Quinoa', 4, 2, NULL),
(9, 'MENEST', 'menestron.jpg', 'Menestron', 6, 2, NULL),
(10, 'MAZMOR', 'mazamorramorada.jpg', 'Mazamorra morada', 2, 3, NULL),
(11, 'ARRLEC', 'arrozconleche.jpg', 'Arroz con Leche', 4, 3, NULL),
(12, 'TORMAR', 'torta.jpg', 'Torta de maracuyá', 1.8, 3, NULL),
(13, 'LECASA', 'lecheasada.jpg', 'Leche asada', 1.5, 3, NULL),
(14, 'PIELIM', 'piedelimon.jpg', 'Pie de limón', 2.2, 3, NULL),
(15, 'LOMSAL', 'lomosaltado.jpg', 'Lomo saltado', 14, 4, NULL),
(16, 'AJIGAL', 'ajidegallina.jpg', 'Aji de gallina', 10, 4, NULL),
(17, 'CAULIM', 'causalimeña.jpg', 'Causa Limeña', 11, 4, NULL),
(18, 'ARRPOL', 'arrozconpollo.jpg', 'Arroz con Pollo', 13, 4, NULL),
(19, 'TALHUA', 'tallarines a la huancaina.jpg', 'Tallarines a la huancaina', 14, 4, NULL),
(20, 'POLOLL', 'polloalaolla.jpg', 'Pollo a la olla', 8, 5, NULL),
(21, 'CAUCAU', 'caucau.jpg', 'Cau cau', 9, 5, NULL),
(22, 'ESCPOL', 'escabechedepollo.jpg', 'Escabeche de pollo', 7.8, 5, NULL),
(23, 'POLPLA', 'polloalaplancha.jpg', 'Pollo a la plancha', 8.8, 5, NULL),
(24, 'SECPOL', 'secodepollo.png', 'Seco de pollo', 7.5, 5, NULL),
(25, 'CAPU001', 'frapuccino (1).jpg', 'FRAPUCCINO MOCCA', 15.5, 3, NULL),
(26, 'CALGAL', 'caldodegallina.jpg', 'Caldo de gallina', 7.8, 2, NULL),
(27, 'ARRPAT', 'arrozconpato.jpg', 'Arroz con pato', 14, 4, NULL),
(28, 'SELNEG', 'selvanegra.jpg', 'Selva Negra', 3.5, 3, NULL),
(29, 'PAPREL', 'paparellena.jpg', 'Para rellena', 2.5, 1, NULL),
(30, 'LENPES', 'lentejasconpescado.jpg', 'Lentejas con pescado frito', 8, 5, NULL),
(31, 'ARRZAM', 'arrozambito.jpg', 'Arroz zambito', 4.2, 3, NULL),
(32, 'CHUPEC', 'chupedecamarones.jpg', 'Chupe de camarones', 10, 2, NULL),
(33, 'SECFRE', 'secodefrejoles.jpg', 'Seco con frejoles', 7.5, 5, NULL),
(35, 'MODIFI', 'lentejaHuevo.jpg', 'LENTEJAS CON HUEVO FRITO', 25.6, 5, NULL),
(36, 'TL001', 'tartaletadefresa.jpg', 'TARTALETA DE FRESA', 15.9, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` bigint(20) NOT NULL,
  `rolname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `rolname`) VALUES
(1, 'ADMIN'),
(2, 'SUPERVISOR'),
(3, 'ESTUDIANTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_usuario`
--

CREATE TABLE `rol_usuario` (
  `iduser` bigint(20) NOT NULL,
  `idrol` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol_usuario`
--

INSERT INTO `rol_usuario` (`iduser`, `idrol`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` bigint(20) NOT NULL,
  `enabled` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `fechacreacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `enabled`, `password`, `username`, `fechacreacion`) VALUES
(1, 1, '$2a$10$P9wADJhn1p5GlF5VKnrpS.NdQyVJdD7PUzzWf7PNReWgXpSqPP0yW', 'administrador', NULL),
(2, 1, '$2a$10$qoug1tRIYpCy1.HfQ9FPauEZIDP4oxZ7lyBgo0NpRTOo7wR3JCYJ.', 'supervisor', NULL),
(3, 1, '$2a$10$z5PNX8fnq1wh.bqGSCQSeeHmGPynom9nH.z2gb4rGNr0gcEH9memu', 'estudiante', NULL),
(4, 1, '$2a$10$6g33wKCjveWJxoIl4TwJtOkrEwND0TqsMk941/geUuPmKBjdIaLVi', 'estudiante1', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catalogue`
--
ALTER TABLE `catalogue`
  ADD PRIMARY KEY (`catabident`);

--
-- Indices de la tabla `cataloguedet`
--
ALTER TABLE `cataloguedet`
  ADD PRIMARY KEY (`catdbident`),
  ADD KEY `FKcx7xvuwchhqi0kiborhyu6hmw` (`catabident`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `pasarelapago`
--
ALTER TABLE `pasarelapago`
  ADD PRIMARY KEY (`ppbident`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `FKei9nl3d1no87q5gnfg2os6mnq` (`idcliente`);

--
-- Indices de la tabla `pedidoitem`
--
ALTER TABLE `pedidoitem`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `FKm8blkrw755a0n7qwy7byud39j` (`id_pedido`),
  ADD KEY `FK7so0cwsomtwsury5ncfffgtm2` (`id_plato`);

--
-- Indices de la tabla `plato`
--
ALTER TABLE `plato`
  ADD PRIMARY KEY (`id_plato`),
  ADD KEY `FK55wxa3u8lifql6rpbln7wvuwi` (`id_categoria`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD PRIMARY KEY (`iduser`,`idrol`),
  ADD KEY `FKj2jmpd5xtmx7cs9j1aj9lx6l2` (`idrol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catalogue`
--
ALTER TABLE `catalogue`
  MODIFY `catabident` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cataloguedet`
--
ALTER TABLE `cataloguedet`
  MODIFY `catdbident` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pasarelapago`
--
ALTER TABLE `pasarelapago`
  MODIFY `ppbident` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `pedidoitem`
--
ALTER TABLE `pedidoitem`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `plato`
--
ALTER TABLE `plato`
  MODIFY `id_plato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cataloguedet`
--
ALTER TABLE `cataloguedet`
  ADD CONSTRAINT `FKcx7xvuwchhqi0kiborhyu6hmw` FOREIGN KEY (`catabident`) REFERENCES `catalogue` (`catabident`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FKei9nl3d1no87q5gnfg2os6mnq` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`);

--
-- Filtros para la tabla `pedidoitem`
--
ALTER TABLE `pedidoitem`
  ADD CONSTRAINT `FK7so0cwsomtwsury5ncfffgtm2` FOREIGN KEY (`id_plato`) REFERENCES `plato` (`id_plato`),
  ADD CONSTRAINT `FKm8blkrw755a0n7qwy7byud39j` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `FK55wxa3u8lifql6rpbln7wvuwi` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD CONSTRAINT `FKhr763hd6t17sfgyb0exif7c9d` FOREIGN KEY (`iduser`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `FKj2jmpd5xtmx7cs9j1aj9lx6l2` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
