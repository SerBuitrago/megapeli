-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-06-2019 a las 18:41:49
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `megapeli`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actorp`
--

CREATE TABLE `actorp` (
  `id` int(10) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `nacionalidad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `actorp`
--

INSERT INTO `actorp` (`id`, `nombre`, `fechanacimiento`, `nacionalidad`) VALUES
(1, 'Jessica Rothe', '2019-05-07', 'Estados Unidos'),
(2, 'Israel Broussard', '2018-01-02', 'Estados Unidos'),
(3, 'Phi Vu', '2019-05-08', 'Estados Unidos'),
(4, 'Suraj Sharma', '2019-05-14', 'Estados Unidos'),
(5, 'Missy Yager', '2019-05-07', 'Estados Unidos'),
(6, 'Charles Aitken', '2019-05-01', 'Estados Unidos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacionp`
--

CREATE TABLE `clasificacionp` (
  `id` int(1) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clasificacionp`
--

INSERT INTO `clasificacionp` (`id`, `descripcion`) VALUES
(1, 'adultos'),
(2, 'niños'),
(3, 'adolecentes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentariop`
--

CREATE TABLE `comentariop` (
  `id` int(10) NOT NULL,
  `idUsuario` int(10) NOT NULL,
  `idPelicula` int(10) NOT NULL,
  `fechaComentario` date NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directorp`
--

CREATE TABLE `directorp` (
  `id` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `nacionalidad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `directorp`
--

INSERT INTO `directorp` (`id`, `nombre`, `fechaNacimiento`, `nacionalidad`) VALUES
(1, 'Sergio Buitrago', '2019-05-01', 'Colombia'),
(2, 'Christopher Landon', '2019-05-07', 'Colombia'),
(3, 'Tatsuya Nagamine', '2019-06-04', 'Japon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generop`
--

CREATE TABLE `generop` (
  `id` int(2) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `generop`
--

INSERT INTO `generop` (`id`, `descripcion`) VALUES
(1, 'accion'),
(2, 'terror'),
(3, 'romantica'),
(4, 'suspenso'),
(5, 'aventura'),
(6, 'comedia'),
(7, 'ciencia ficcion'),
(8, 'fantasia'),
(9, 'drama'),
(10, 'animacion'),
(11, 'crimen'),
(12, 'misterio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculap`
--

CREATE TABLE `peliculap` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `link` varchar(150) NOT NULL,
  `fechalanzamiento` date NOT NULL,
  `idDirector` int(10) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `sinopsis` text NOT NULL,
  `idioma` varchar(200) NOT NULL,
  `idGenero` int(2) NOT NULL,
  `calidad` text NOT NULL,
  `idClasificacion` int(1) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `idUsuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `peliculap`
--

INSERT INTO `peliculap` (`id`, `nombre`, `link`, `fechalanzamiento`, `idDirector`, `pais`, `sinopsis`, `idioma`, `idGenero`, `calidad`, `idClasificacion`, `imagen`, `idUsuario`) VALUES
(1, 'Feliz día de tu muerte 2', 'https://mega.nz/#!iS4DjKIK!5H6JocM0E5T2HfvtnyEkNvzqz6C9EdPdPtJIQh9BxDY', '2019-05-01', 2, 'Estados Unidos', 'Tree Gelbman descubre que morir una y otra vez fue sorprendentemente fácil comparado con los peligros que se aproximan cuando Ryan, el compañero de cuarto de Carter, afirma que está reviviendo el mismo día una y otra vez.', 'Español', 2, 'Full HD Bluray - AVC 2000kbps | AAC 160kbps', 1, 'http://t1.gstatic.com/images?q=tbn:ANd9GcT8P0Sp5e_0BtIaHva89Se9Cz8cDIxNQ_liI5-XfoICQGgWoHQ-', 2),
(2, 'Dragon Ball Super: Broly', 'https://mega.nz/#!rdVkGYDS!s-MXQEM6Ole7-hAG5BqyvLjl9nViwUuFG2ZViKdU42I', '2019-06-05', 3, 'Japon', 'Goku y Vegeta se encuentran con Broly, un poderoso guerrero Saiyajin, muy diferente a cualquier otro luchador que hayan enfrentado anteriormente.', 'Español', 10, 'Full Hd', 2, 'https://www.cinelandia.com.co/archivos/medium/Afiche_Nuevos_dra.jpg', 3),
(3, 'Alien Warfare ', 'https://mega.nz/#!bu51hYCY!vmpYCsr5nl39ycZpA4REoTzXCWJOl16EWGvwiwRtxbo', '2019-06-05', 2, 'Estados Unidos', 'Un equipo de Navy Seals está investigando un misterioso puesto científico, solo para tener que enfrentarse a un escuadrón de formidables soldados extraterrestres.', 'Español', 7, 'Full HD', 3, 'https://www.cinecalidad.to/wp-content/uploads/2019/05/alien-warfare.jpg', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje`
--

CREATE TABLE `personaje` (
  `id` int(10) NOT NULL,
  `idPelicula` int(10) NOT NULL,
  `idRol` int(1) NOT NULL,
  `idActor` int(10) NOT NULL,
  `papel` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personaje`
--

INSERT INTO `personaje` (`id`, `idPelicula`, `idRol`, `idActor`, `papel`) VALUES
(1, 1, 1, 1, 'UHH');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolp`
--

CREATE TABLE `rolp` (
  `id` int(1) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rolp`
--

INSERT INTO `rolp` (`id`, `descripcion`) VALUES
(1, 'protagonista'),
(2, 'secundario'),
(3, 'de reparto'),
(4, 'pequeñas partes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripcion`
--

CREATE TABLE `suscripcion` (
  `id` int(10) NOT NULL,
  `idUsuario` int(10) NOT NULL,
  `idSuscripto` int(10) NOT NULL,
  `fechaSuscripcion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `suscripcion`
--

INSERT INTO `suscripcion` (`id`, `idUsuario`, `idSuscripto`, `fechaSuscripcion`) VALUES
(5, 1, 3, '2019-06-12'),
(6, 1, 2, '2019-06-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int(1) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `descripcion`) VALUES
(1, 'usuario'),
(2, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariop`
--

CREATE TABLE `usuariop` (
  `id` int(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `idTipoUsuario` int(1) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `fechaRegistro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuariop`
--

INSERT INTO `usuariop` (`id`, `nombre`, `apellido`, `email`, `password`, `idTipoUsuario`, `fechaNacimiento`, `fechaRegistro`) VALUES
(1, 'Sergio', 'Buitrago', 'sergio@gmail.com', '123456789k', 1, '2019-05-07', '2019-05-02'),
(2, 'Stives', 'Barrios', 'stives@gmail.com', '123456789a', 2, '3919-03-03', '3919-03-03'),
(3, 'claudia', 'buitrago', 'claudia2@gmail.com', '123456789a', 2, '2019-05-21', '2019-05-29'),
(4, 'maria', 'fernandez', 'fernanda@gmail.com', '123456789a', 2, '2019-05-23', '2019-05-29'),
(6, 'angie', 'gomez', 'gomesx@gmail.com', '123456789a', 2, '2019-05-21', '2019-05-29'),
(7, 'Maria', 'Martinez', 'martinez@gmail.com', '123456789ñ', 1, '2019-06-20', '2019-06-02'),
(8, 'Jose', 'Buitrago', 'josefito@gmail.com', '147852369ñ', 2, '2019-06-20', '2019-06-02'),
(9, 'Jose', 'Buitrago', 'josefito3@gmail.com', '147852369ñ', 2, '2019-06-20', '2019-06-02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actorp`
--
ALTER TABLE `actorp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clasificacionp`
--
ALTER TABLE `clasificacionp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentariop`
--
ALTER TABLE `comentariop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario_idC` (`idUsuario`),
  ADD KEY `idPelicula_idC` (`idPelicula`);

--
-- Indices de la tabla `directorp`
--
ALTER TABLE `directorp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generop`
--
ALTER TABLE `generop`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `peliculap`
--
ALTER TABLE `peliculap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idGenero_id` (`idGenero`),
  ADD KEY `idClasificacion_id` (`idClasificacion`),
  ADD KEY `idDirector_id` (`idDirector`),
  ADD KEY `idUsuario_idd` (`idUsuario`);

--
-- Indices de la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRol_id` (`idRol`),
  ADD KEY `idActor_idA` (`idActor`),
  ADD KEY `idPelicula_id` (`idPelicula`);

--
-- Indices de la tabla `rolp`
--
ALTER TABLE `rolp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario_idS` (`idUsuario`),
  ADD KEY `idSuscripto_id` (`idSuscripto`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuariop`
--
ALTER TABLE `usuariop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTipoUsuario_id` (`idTipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actorp`
--
ALTER TABLE `actorp`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comentariop`
--
ALTER TABLE `comentariop`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `directorp`
--
ALTER TABLE `directorp`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `peliculap`
--
ALTER TABLE `peliculap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `personaje`
--
ALTER TABLE `personaje`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuariop`
--
ALTER TABLE `usuariop`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentariop`
--
ALTER TABLE `comentariop`
  ADD CONSTRAINT `idPelicula_idC` FOREIGN KEY (`idPelicula`) REFERENCES `peliculap` (`id`),
  ADD CONSTRAINT `idUsuario_idC` FOREIGN KEY (`idUsuario`) REFERENCES `usuariop` (`id`);

--
-- Filtros para la tabla `peliculap`
--
ALTER TABLE `peliculap`
  ADD CONSTRAINT `idClasificacion_id` FOREIGN KEY (`idClasificacion`) REFERENCES `clasificacionp` (`id`),
  ADD CONSTRAINT `idDirector_id` FOREIGN KEY (`idDirector`) REFERENCES `directorp` (`id`),
  ADD CONSTRAINT `idGenero_id` FOREIGN KEY (`idGenero`) REFERENCES `generop` (`id`),
  ADD CONSTRAINT `idUsuario_idd` FOREIGN KEY (`idUsuario`) REFERENCES `usuariop` (`id`);

--
-- Filtros para la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD CONSTRAINT `idActor_idA` FOREIGN KEY (`idActor`) REFERENCES `actorp` (`id`),
  ADD CONSTRAINT `idPelicula_id` FOREIGN KEY (`idPelicula`) REFERENCES `peliculap` (`id`),
  ADD CONSTRAINT `idRol_id` FOREIGN KEY (`idRol`) REFERENCES `rolp` (`id`);

--
-- Filtros para la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD CONSTRAINT `idSuscripto_id` FOREIGN KEY (`idSuscripto`) REFERENCES `usuariop` (`id`),
  ADD CONSTRAINT `idUsuario_idS` FOREIGN KEY (`idUsuario`) REFERENCES `usuariop` (`id`);

--
-- Filtros para la tabla `usuariop`
--
ALTER TABLE `usuariop`
  ADD CONSTRAINT `idTipoUsuario_id` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
