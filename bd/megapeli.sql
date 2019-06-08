-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2019 a las 01:04:10
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
(3, 'Tatsuya Nagamine', '2019-06-04', 'Japon'),
(4, 'Anna Boden', '2019-06-04', 'Estados Unidos');

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
  `link` varchar(200) NOT NULL,
  `fechalanzamiento` date NOT NULL,
  `fechapublicacion` date NOT NULL,
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

INSERT INTO `peliculap` (`id`, `nombre`, `link`, `fechalanzamiento`, `fechapublicacion`, `idDirector`, `pais`, `sinopsis`, `idioma`, `idGenero`, `calidad`, `idClasificacion`, `imagen`, `idUsuario`) VALUES
(1, 'Feliz día de tu muerte 2', 'https://mega.nz/embed#!iS4DjKIK!5H6JocM0E5T2HfvtnyEkNvzqz6C9EdPdPtJIQh9BxDY', '2019-05-01', '2019-06-04', 2, 'Estados Unidos', 'Tree Gelbman descubre que morir una y otra vez fue sorprendentemente fácil comparado con los peligros que se aproximan cuando Ryan, el compañero de cuarto de Carter, afirma que está reviviendo el mismo día una y otra vez.', 'Español', 2, 'Full HD Bluray - AVC 2000kbps | AAC 160kbps', 1, 'http://t1.gstatic.com/images?q=tbn:ANd9GcT8P0Sp5e_0BtIaHva89Se9Cz8cDIxNQ_liI5-XfoICQGgWoHQ-', 2),
(2, 'Dragon Ball Super: Broly', 'https://mega.nz/embed#!PFU03Sya!T3pK2S43tFQwQMo7Fymv3vQ_qxj8GKNL6_75biJiDh0', '2019-06-05', '2019-06-12', 3, 'Japon', 'Goku y Vegeta se encuentran con Broly, un poderoso guerrero Saiyajin, muy diferente a cualquier otro luchador que hayan enfrentado anteriormente.', 'Español', 10, 'Full Hd', 2, 'https://www.cinelandia.com.co/archivos/medium/Afiche_Nuevos_dra.jpg', 3),
(3, 'Alien Warfare ', 'https://mega.nz/embed#!bu51hYCY!vmpYCsr5nl39ycZpA4REoTzXCWJOl16EWGvwiwRtxbo', '2019-06-05', '2019-06-05', 2, 'Estados Unidos', 'Un equipo de Navy Seals está investigando un misterioso puesto científico, solo para tener que enfrentarse a un escuadrón de formidables soldados extraterrestres.', 'Español', 7, 'Full HD', 3, 'https://www.cinecalidad.to/wp-content/uploads/2019/05/alien-warfare.jpg', 4),
(4, 'Blood Brother', 'https://mega.nz/embed#!oDZVXCQL!YYXJpe12Ypz6RsqqU9XiVeg6zCFNZaRGBh9a8Kojhsg', '2019-06-11', '2019-06-03', 2, 'Francia', 'Cuando un ex convicto inicia una venganza homicida en contra de sus amigos de la infancia que cree que lo dejaron caer por un crimen que cometieron juntos, uno de ellos, ahora un policía, arriesga su vida para detenerlo', 'Español', 11, 'Full Hd', 3, 'https://www.cinecalidad.to/wp-content/uploads/2019/05/blood-brother.jpg', 2),
(5, 'Venganza', 'https://mega.nz/embed#!OZFSEIxQ!tUuJJuf0E8nAnE_IZT_f5CDnvH5SjHtQ37FS_t20JdQ', '2019-06-25', '2019-06-17', 3, 'Estados Unidos', 'Nels, conductor de quitanieves en un pueblo en las Rocallosas, debe abandonar su tranquila vida en la montaña para obtener su venganza contra los narcotraficantes que mataron a su hijo.', 'Español', 1, 'Full HD Bluray - AVC 2000kbps | AAC 160kbps', 1, 'https://www.cinecalidad.to/wp-content/uploads/2019/05/venganza.jpg', 2),
(6, 'El Gordo y el Flaco', 'https://mega.nz/embed#!a0swzQbK!baheHEusSFfD6Ma252bbU-WTUN625onlG7KOCJ6gsJQ', '2019-06-10', '2019-06-05', 4, 'Francia', 'Laurel y Hardy, el dúo de comedia más famoso del mundo, intentan reiniciar sus carreras en el cine embarcándose en un agotador tour de teatro en Gran Bretaña e Irlanda.', 'Español', 6, 'Full HD Bluray - AVC 2000kbps | AAC 160kbps', 2, 'https://www.cinecalidad.to/wp-content/uploads/2019/04/el-gordo-y-el-flaco.jpg', 2),
(7, 'IO', 'https://mega.nz/embed#!6R1wjYpI!zugyhRFwKK4SdOgbjihKqDvv8rbRbcePQhFKn-Z5wJE', '2019-06-18', '2019-06-25', 4, 'Colombia', 'Mientras una joven científica busca alguna manera de salvar a la Tierra, encuentra una conexión con un hombre que quiere alcanzar el último transbordador hacia una distante colonia.', 'Español', 5, 'Full HD Bluray - AVC 2000kbps | AAC 160kbps', 1, 'https://www.cinecalidad.to/wp-content/uploads/2019/01/io.jpg', 2),
(8, 'El traficante', 'https://mega.nz/embed#!DCZTwACQ!cIC83yHCUxJIPwmLA5RFqDu70dsc3jGRwVv2GG4nzuo', '2019-06-13', '2019-06-04', 4, 'España', '	\r\nSean tiene tan solo una hora para entregar su carga ilegal y convencer a un cartel de drogas, un sicario y a la DEA de que todo está bien. Y debe hacerlo todo desde la cabina de su Cessna.', 'Español', 1, 'Full HD Bluray - AVC 2000kbps | AAC 160kbps', 1, 'https://www.cinecalidad.to/wp-content/uploads/2019/05/beast-of-burden.jpg', 2),
(9, 'Triple frontera', 'https://mega.nz/embed#!9XIzlAzB!M1ihiTMGgBBhofWh2JPQgs-32HG2WNXFPUbSrAJDOLE', '2019-06-11', '2019-06-12', 4, 'Colombia', 'Un equipo de ex soldados de las fuerzas especiales planea robar todo el dinero de la casa de un narcotraficante en la jungla del Amazonas, en la frontera de Perú, Brasil y Colombia. Pero los problemas surgen una vez iniciado el plan.', 'Español', 1, 'full hd', 3, 'https://www.cinecalidad.to/wp-content/uploads/2019/03/triple-frontera.jpg', 2),
(10, 'Maligno', 'https://mega.nz/embed#!D5AwiSJb!v00JWtxyauN3NtJEFAOis5LF54rQrZDucDeWmZeKDHc', '2019-06-04', '2019-06-04', 3, 'España', 'Sarah está preocupada por el comportamiento perturbador de su pequeño hijo, y tiene la creencia de que posiblemente una fuerza sobrenatural maligna está comenzando a manipularlo.', 'Español', 4, 'Full HD Bluray - AVC 2000kbps | AAC 160kbps', 3, 'https://www.cinecalidad.to/wp-content/uploads/2019/04/the-prodigy.jpg', 2),
(11, 'Verano del 84', 'https://mega.nz/embed#!CKghHY7Y!1fWz1DugwIcgQZnSmpnz3YhgRqJevOh9vl-tqdiQimY', '2019-06-05', '2019-06-04', 3, 'Estados Unidos', 'Con la sospecha que su vecino policía es un asesino en serie, un grupo de amigos adolescentes se la pasa espiándolo durante el verano y reuniendo evidencia, pero conforme se acercan a descubrir la verdad, las cosas de vuelven peligrosas.', 'Español', 9, 'Full HD Bluray - AVC 2000kbps | AAC 160kbps', 3, 'https://www.cinecalidad.to/wp-content/uploads/2019/05/verano-del-84.jpg', 2),
(12, 'Eliminar amigo 2', 'https://mega.nz/embed#!2hhW1KYR!E0G4Mo2MUH7U38jS07f-1NxHzecNbF4jDpBlykyu5IQ', '2019-06-02', '2019-06-04', 4, 'Estados Unidos', 'Un joven queda en posesión de una nueva laptop pero pronto descubre que podría ser robada y que el anterior dueño no está solamente observándolo, sino que hará todo lo posible por recuperarla.', 'Español', 12, 'Full HD Bluray - AVC 2000kbps | AAC 160kbps', 3, 'https://www.cinecalidad.to/wp-content/uploads/2019/04/unfriended-dark-web.jpg', 2),
(13, 'La cita perfecta', 'https://mega.nz/embed#!rl5GgQpb!aw2AhfNrYHlIppbLDmi1XM60UP5PVj3S63yrodXVDzE', '2019-06-03', '2019-06-12', 2, 'España', 'Para ahorrar dinero para la universidad, Brooks Rattigan convence a su amigo de que le desarrolle una aplicación para que cualquiera pueda pagar para que él sea la pareja perfecta para cualquier ocasión.', 'Español', 3, 'Full HD Bluray - AVC 2000kbps | AAC 160kbps', 3, 'https://www.cinecalidad.to/wp-content/uploads/2019/04/the-perfect-date.jpg', 2),
(14, 'La niñera', 'https://mega.nz/embed#!Tt9hyApD!Bc-Wllbjn8Mw0spiJ_OFNO15-kfHUNJOEHz2eyc22G0', '2019-06-18', '2019-06-14', 3, 'Inglaterra', 'Una niña, Noa, sospecha que su nueva niñera no pertenece a este mundo. Ella hace lo posible por revelar la identidad de la nueva niñera, la cual es más retorcida de lo que ella se imagina.', 'Español', 8, 'Full Hd', 1, 'https://www.cinecalidad.to/wp-content/uploads/2019/04/the-nanny.jpg', 2),
(15, 'Velocidad mortal', 'https://mega.nz/embed#!rBJQ2KBY!SYk5apITOmoAPYmNsFul4GQJjOK2bY_NRAn8_XIXj0s', '2019-06-25', '2019-06-12', 1, 'Francia', 'El multimillonario campeón de lanchas de carreras, Ben Aronoff, lleva una doble vida que lo mete en problemas con la ley y con narcotraficantes.', 'Español', 1, 'Full Hd', 3, 'https://www.cinecalidad.to/wp-content/uploads/2019/03/speed-kills.jpg', 2),
(16, 'Nación asesina', 'https://mega.nz/embed#!VwwGiA6a!gORZSh0XVuEwyseUTS9uYjn8xpBP8hrvvPItib7e2h0', '2019-06-04', '2019-06-12', 1, 'Inglaterra', 'Después de que un hackeo malicioso de datos expone los secretos del perpetuo pueblo americano de Salem, el caos se apodera y cuatro chicas deben luchar para sobrevivir.', 'Español', 1, 'Full HD Bluray - AVC 2000kbps | AAC 160kbps', 3, 'https://www.cinecalidad.to/wp-content/uploads/2019/03/nacion-asesina.jpg', 3),
(17, 'Mis huellas a casa', 'https://mega.nz/embed#!CfR2zQxA!lTrWHsMizpeXQjyYYGmmtGirie2CsNvZ2xMV5H7voz8', '2019-06-04', '2019-06-13', 1, 'Brazil', 'Una perra recorre cientos de kilómetros en búsqueda de su dueño a través de la región salvaje de Colorado.', 'Español', 10, 'Full Hd', 2, 'https://www.cinecalidad.to/wp-content/uploads/2019/03/mis-huellas-a-casa.jpg', 3),
(18, 'Atentado en el estadio', 'https://mega.nz/embed#!CToFxYZZ!BmqzyuTW0KYDCbzzIVy_8k9vkU2oKB0nuHgl_mcOGd4', '2019-06-04', '2019-06-06', 1, 'Rusia', 'Después de que unos terroristas secuestraran a su hija durante un partido de fútbol, un ex soldado con habilidades letales libra una guerra de un hombre para salvarla y evitar una catástrofe.', 'Español', 1, 'Full Hd', 3, 'https://www.cinecalidad.to/wp-content/uploads/2019/05/atentado-en-el-estadio.jpg', 3),
(19, 'El amor menos pensado', 'https://mega.nz/embed#!TxZAgIRY!L8A01nGyF0zRGY2co4Whky5E_Z1yxWqIFTDXSFX_bCI', '2019-06-02', '2019-06-01', 2, 'España', 'Después que su hijo único parte para estudiar en el extranjero, un matrimonio de 25 años enfrenta su separación, cuestionándose sobre el amor, deseo, el paso del tiempo y qué es lo que realmente quieren en la vida.', 'Español', 3, 'Full Hd', 3, 'https://www.cinecalidad.to/wp-content/uploads/2019/04/el-amor-menos-pensado.jpg', 3);

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
(1, 1, 1, 1, 'UHH'),
(2, 1, 2, 5, ''),
(3, 1, 1, 3, '');

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
(49, 1, 3, '2019-06-08'),
(50, 1, 4, '2019-06-08'),
(56, 1, 2, '2019-06-08');

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
(10, 'Josefito', 'Maranillo', 'josefito3@gmail.com', '123456789s', 2, '2019-06-05', '2019-06-08');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `peliculap`
--
ALTER TABLE `peliculap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `personaje`
--
ALTER TABLE `personaje`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `usuariop`
--
ALTER TABLE `usuariop`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
