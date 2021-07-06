-- MySQL dump 10.13  Distrib 8.0.23, for osx10.15 (x86_64)
--
-- Host: 0.0.0.0    Database: api_demo
-- ------------------------------------------------------
-- Server version	5.7.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autores`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `estudios` varchar(100) DEFAULT NULL,
  `año_nacimiento` int(11) DEFAULT NULL,
  `año_fallecimiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

INSERT INTO `autores` (`id`, `nombre`, `pais`, `ciudad`, `estudios`, `año_nacimiento`, `año_fallecimiento`) VALUES (1,'Dulac, George','Francia','Nantes','La Sorbonne',1922,NULL),(2,'Bertomeu, Andrés','España','Barcelona','Univ. Valencia',1919,1995),(3,'Uosiken, Fred','Finlandia','Helsinki','Univ. Uppsala',1958,NULL),(4,'Müller, Klaus','Alemania','Düsseldorf','Univ. Viena',1720,1792),(5,'Llorens, Antonia','España','Gerona','Univ. Granada',1959,NULL),(6,'Leverling, Janet','EEUU','Seattle','Univ. Harvard',1969,NULL),(7,'Kröpotkin,Albert','Alemania','Berlín','Univ. París',1842,1897),(8,'Bazilian, Eric','EEUU','Atlanta','Univ. Stanfield',1969,NULL),(9,'Davolio, Nancy','Australia','Canberra','Univ. Sidney',1970,NULL),(10,'Becket, Samuel','Polonia','Varsovia','Univ. Berlín',1902,NULL),(11,'Dion, Paul','Gran Bretaña','Birmingham','Univ. Harvard',1854,1931),(12,'Richter, Helmut','Alemania','Dresde','Univ. Berlín',1911,1994),(13,'Chabrier, Louis','Francia','Toulouse','Univ. París',1892,1950),(14,'Sanabria, Carmelo','España','Salamanca','Univ. Salamanca',1963,NULL),(15,'Plasencia, Juan Luis','España','Toledo','Univ. Sevilla',1960,NULL),(16,'Santos, Miguel','Colombia','Medellín','Univ. Salamanca',1865,1928),(17,'Montenegro, Miguel','Chile','Curicó','Univ. París',1740,1810);

--
-- Table structure for table `editoriales`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editoriales` (
  `codigo` varchar(5) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `persona_de_contacto` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

INSERT INTO `editoriales` (`codigo`, `nombre`, `telefono`, `persona_de_contacto`, `direccion`, `ciudad`) VALUES ('ABR','Publicaciones Abreu',4532318,'Huertas, Noelia','San Andrés, 21','Cartagena'),('CAS','Ediciones Castell, S.A.',4464814,'Gutiérrez , Ernesto','Plaza Luceros, 4','Alicante'),('DEL','Deloria Editores',3245585,'Martínez, Susana','Gran Vía, 77','Madrid'),('GGG','GGG&G',7355654,'Romero , Pedro','León XIII, 12','Zaragoza'),('GRI','Grisham Publishing',5751547,'Brown, Jean','Carlos III,43','Tarragona'),('IBE','Ediciones Ibérica',8767856,'Guilló, Martín','Alfonso Paso, 3','Madrid'),('LAR','Larrosa Mas,S.L.',9887763,'Ortiz, Jose','Espronceda, 11','Elche'),('MCOY','McCoy Hill',1219229,'Del Olmo, Rosa Mª','Sants Metges, 2','Barcelona'),('TEC','TechiBooks',7777903,'Zapata, Gustavo','Fuensanta, 3','Alcobendas');

--
-- Table structure for table `libros`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `isbn` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `fk_autor` int(11) DEFAULT NULL,
  `fk_temas` varchar(5) DEFAULT NULL,
  `fk_editorial` varchar(5) DEFAULT NULL,
  `año` int(11) DEFAULT NULL,
  `lugar_de_edicion` varchar(100) DEFAULT NULL,
  `numero_edicion` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `cubierta` varchar(20) DEFAULT NULL,
  `paginas` int(11) DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  KEY `libros_autores_id_fk` (`fk_autor`),
  KEY `libros_editoriales_codigo_fk` (`fk_editorial`),
  KEY `libros_topicos_codigo_fk` (`fk_temas`),
  CONSTRAINT `libros_autores_id_fk` FOREIGN KEY (`fk_autor`) REFERENCES `autores` (`id`),
  CONSTRAINT `libros_editoriales_codigo_fk` FOREIGN KEY (`fk_editorial`) REFERENCES `editoriales` (`codigo`),
  CONSTRAINT `libros_topicos_codigo_fk` FOREIGN KEY (`fk_temas`) REFERENCES `topicos` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

INSERT INTO `libros` (`isbn`, `titulo`, `fk_autor`, `fk_temas`, `fk_editorial`, `año`, `lugar_de_edicion`, `numero_edicion`, `precio`, `cubierta`, `paginas`) VALUES (1,'El tránsito terreno',15,'FIL','LAR',1996,'Alicante',1,22162,'Blanda',152),(2,'Sisfk_temas operativos',8,'TEC','GGG',1994,'Nueva York',2,21268,'Dura',470),(3,'Poemas intrínsecos',5,'POE','DEL',1997,'Barcelona',1,26135,'Blanda',173),(4,'Avances en Arquitectura',12,'TEC','TEC',1991,'Londres',5,13720,'Dura',422),(5,'Las balas del bien',6,'NOV','GGG',1995,'Londres',1,28666,'Dura',181),(6,'La mente y el sentir',15,'FIL','LAR',1992,'Madrid',2,20811,'Blanda',196),(7,'Ensayos póstumos',2,'PSI','DEL',1995,'Gerona',1,20537,'Dura',290),(8,'La dualidad aparente',14,'FIL','LAR',1994,'Salamanca',2,23775,'Dura',157),(9,'Arquitectura y arte',12,'HIS','GRI',1992,'Londres',6,27727,'Dura',512),(10,'Historia de Occidente',1,'HIS','MCOY',1995,'París',2,24814,'Dura',250),(11,'Sentimiento popular',5,'POE','LAR',1994,'Barcelona',2,20009,'Dura',199),(12,'Amigos o enemigos',14,'PSI','GGG',1996,'Bilbao',1,23556,'Blanda',233),(13,'La burguesía del XIX',1,'HIS','DEL',1996,'París',1,15142,'Dura',376),(14,'Procesadores cuánticos',8,'TEC','GRI',1997,'Washington',1,14094,'Dura',452),(15,'Canto de esperanza',9,'POE','MCOY',1995,'Denver',1,21778,'Blanda',198);

--
-- Table structure for table `topicos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topicos` (
  `codigo` varchar(5) NOT NULL,
  `tema` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topicos`
--

INSERT INTO `topicos` (`codigo`, `tema`) VALUES ('ART','Arte'),('CIE','Ciencia'),('FIC','Ficción'),('FIL','Filosofía'),('HIS','Historia'),('NOV','Novela'),('POE','Poesía'),('PSI','Psicología'),('SAL','Salud'),('TEC','Técnica');
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-05 13:09:36
