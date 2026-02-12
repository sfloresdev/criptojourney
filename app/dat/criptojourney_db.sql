-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 12, 2026 at 06:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `criptojourney_db`
--
CREATE DATABASE IF NOT EXISTS `criptojourney_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `criptojourney_db`;

-- --------------------------------------------------------

--
-- Table structure for table `articulos`
--

CREATE TABLE IF NOT EXISTS `articulos` (
  `id_articulo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `subtitulo` varchar(255) DEFAULT NULL,
  `resumen` text DEFAULT NULL,
  `contenido` longtext DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `id_wiki` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_articulo`),
  UNIQUE KEY `titulo` (`titulo`),
  KEY `fk_articulo_wiki` (`id_wiki`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los artículos de la pagina web. Tiene como clave primaria un identificador único\r\n							que se auto incrementa por cada nuevo artículo introducido, el titulo es único, no se repiten artículos';

--
-- Dumping data for table `articulos`
--

INSERT INTO `articulos` (`id_articulo`, `titulo`, `subtitulo`, `resumen`, `contenido`, `autor`, `fecha`, `id_wiki`) VALUES
(10, 'Cifrado Cesar', 'Un vistazo a la historia', 'Este es un resumen del articulo, da una idea general del lo que vamos a hablar en este apartado', '<article id=\"article1\">\n        <div class=\"article-summary\">\n            <p>Este es un resumen del articulo, da una idea general del lo que vamos a hablar en este apartado</p>\n        </div>\n        <article id=\"cesar-interactivo\">\n    <div class=\"article-header\">\n        <h2>Cifrado César</h2>\n        <h3>Explora la criptografía clásica de forma interactiva</h3>\n    </div>\n\n    <article class=\"articles\">\n    <div class=\"article-header\">\n        <h2>Cifrado César Interactivo</h2>\n        <h3>Ajusta el desplazamiento y observa la rotación</h3>\n    </div>\n\n    <div class=\"interactive-area\">\n        <div class=\"cesar-card\">\n            <div class=\"input-group\">\n                <label>Mensaje Original</label>\n                <textarea id=\"cesar-input\" placeholder=\"Escribe tu mensaje aquí...\" rows=\"3\"></textarea>\n            </div>\n\n            <div class=\"cesar-controls\">\n                <div class=\"control-item\">\n                    <label>Desplazamiento ($n$)</label>\n                    <input type=\"number\" id=\"cesar-shift\" value=\"3\" min=\"0\" max=\"25\">\n                </div>\n                <div class=\"control-item\">\n                    <label>Modo</label>\n                    <div class=\"mode-container\">\n                        <span id=\"cesar-mode-text\">Cifrar</span>\n                        <input type=\"checkbox\" id=\"cesar-mode-toggle\">\n                    </div>\n                </div>\n            </div>\n\n            <div class=\"wheel-outer\">\n                <div id=\"cesar-strip\" class=\"alphabet-strip\">\n                    </div>\n            </div>\n\n            <div class=\"input-group\">\n                <label>Resultado</label>\n                <textarea id=\"cesar-output\" readonly rows=\"3\"></textarea>\n            </div>\n\n            <div class=\"article-footer\">\n                <button class=\"btn\" id=\"cesar-copy-btn\">Copiar Resultado</button>\n            </div>\n        </div>\n    </div>\n</article>\n\n    <div class=\"detailed-explanation\">\n        <p>\n            El cifrado César es una técnica de cifrado por sustitución en la que cada letra del texto original es reemplazada por otra letra que se encuentra un número fijo de posiciones más adelante en el alfabeto.\n        </p>\n    </div>\n</article>\n        <div class=\"detailed-explanation\" id=\"detailed-1\">\n            <h4>Explicacion detallada</h4>\n            <p>Texto mas largo en la que explicamos ese contexto desarrollamos el contenido y po ultimo invitamos si desean a ver nuestra vista wiki detallada</p>\n        </div>\n    </article>', 'CriptoJourney Team', '2026-01-25 13:40:26', 1),
(11, 'Máquina Enigma', 'La encriptación de Alan Turing', 'Este es un resumen del articulo, da una idea general del lo que vamos a hablar en este apartado', '<article id=\"article2\">\n        <div class=\"article-summary\">\n            <p>Este es un resumen del articulo, da una idea general del lo que vamos a hablar en este apartado</p>\n        </div>\n        <div class=\"interactive-area\">\n        <div class=\"enigma-card\">\n            <div class=\"enigma-rotors-container\">\n                <div class=\"rotor-unit\">\n                    <label>Rotor I</label>\n                    <div class=\"rotor-display\" id=\"rotor-1\">A</div>\n                </div>\n                <div class=\"rotor-unit\">\n                    <label>Rotor II</label>\n                    <div class=\"rotor-display\" id=\"rotor-2\">A</div>\n                </div>\n                <div class=\"rotor-unit\">\n                    <label>Rotor III</label>\n                    <div class=\"rotor-display\" id=\"rotor-3\">A</div>\n                </div>\n            </div>\n\n            <div class=\"input-group\">\n                <label>Entrada (Teclado)</label>\n                <textarea id=\"enigma-input\" placeholder=\"Escribe para ver cómo giran los rotores...\" rows=\"3\"></textarea>\n            </div>\n\n            <div class=\"input-group\">\n                <label>Salida (Lámparas)</label>\n                <textarea id=\"enigma-output\" readonly rows=\"3\"></textarea>\n            </div>\n\n            <div class=\"article-footer\">\n                <button class=\"btn\" id=\"enigma-copy-btn\">📋 Copiar Cifrado</button>\n                <button class=\"btn\" style=\"background: #333;\" onclick=\"resetEnigma()\">🔄 Reiniciar Rotores</button>\n            </div>\n        </div>\n        <div class=\"detailed-explanation\" id=\"detailed-2\">\n            <h4>Explicacion detallada</h4>\n            <p>Texto mas largo en la que explicamos ese contexto desarrollamos el contenido y po ultimo invitamos si desean a ver nuestra vista wiki detallada</p>\n        </div>\n    </article>', 'CriptoJourney Team', '2026-01-25 13:40:26', 2),
(12, 'RSA', 'Revolución de la clave pública', 'Este es un resumen del articulo, da una idea general del lo que vamos a hablar en este apartado', '<article id=\"article3\">\n        <div class=\"article-summary\">\n            <p>Este es un resumen del articulo, da una idea general del lo que vamos a hablar en este apartado</p>\n        </div>\n        <div class=\"interactive-area\" id=\"int-area3\">\n            ANIMACIONES Y AREA INTERACTIVA\n        </div>\n        <div class=\"detailed-explanation\" id=\"detailed-3\">\n            <h4>Explicacion detallada</h4>\n            <p>Texto mas largo en la que explicamos ese contexto desarrollamos el contenido y po ultimo invitamos si desean a ver nuestra vista wiki detallada</p>\n        </div>\n    </article>', 'CriptoJourney Team', '2026-01-25 13:40:26', 3),
(13, 'SHA-256', 'La base de blockchain', 'Este es un resumen del articulo, da una idea general del lo que vamos a hablar en este apartado', '<article id=\"article4\">\n        <div class=\"article-summary\">\n            <p>Este es un resumen del articulo, da una idea general del lo que vamos a hablar en este apartado</p>\n        </div>\n        <div class=\"interactive-area\" id=\"int-area4\">\n            ANIMACIONES Y AREA INTERACTIVA\n        </div>\n        <div class=\"detailed-explanation\" id=\"detailed-4\">\n            <h4>Explicacion detallada</h4>\n            <p>Texto mas largo en la que explicamos ese contexto desarrollamos el contenido y po ultimo invitamos si desean a ver nuestra vista wiki detallada</p>\n        </div>\n    </article>', 'CriptoJourney Team', '2026-01-25 13:40:26', 4);

-- --------------------------------------------------------

--
-- Table structure for table `hero_images`
--

CREATE TABLE IF NOT EXISTS `hero_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `html_id` varchar(50) DEFAULT NULL,
  `orden` int(11) NOT NULL,
  `activa` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hero_images`
--

INSERT INTO `hero_images` (`id`, `imagen`, `alt`, `html_id`, `orden`, `activa`) VALUES
(1, 'julio-cesar-colorized-1.png', 'Julio Cesar', 'imagen-cesar', 1, 1),
(2, 'alan-turing-16old-color.png', 'Alan Turing', 'imagen-alan', 2, 1),
(3, 'Adi-Shamir-colorized-2.png', 'Adi Shamir', 'imagen-adi', 3, 1),
(4, 'Whitfield-Diffie-colorized-1.png', 'Whitfield Diffie', 'imagen-diffie', 4, 1),
(5, 'satoshi-nakamoto-colorized-1.png', 'Satoshi Nakamoto', 'imagen-satoshi', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fec_reg` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los usuarios  registrados. Tiene como clave primaria un id único \r\n							que se auto incrementa por cada nuevo usuario, la contraseña es guardada en hash \r\n							para la seguridad del usuario';

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `password`, `fec_reg`) VALUES
(1, 'SergioGAY', 'soysergiogay@gmail.com', 'M3Gust4nP3n35', '2025-12-26 00:00:00'),
(2, 'pepe', 'pepe@gmail.com', '$2y$10$Fn8MfhYjh8YBlTqIV96tbuV5VHmwWphf19OELRTOyIL5bMdCklAAm', '2026-01-24 00:00:00'),
(3, 'ElenaMARIO\'SSOULMATE', 'elena.angelova.sir@gmail.com', '$2y$10$L2xnurH0BMISOkvHha4la.rHnktC8nhWifRR9H84FJ/Wqt919Rl7u', '2026-01-24 00:00:00'),
(5, 'Mario', 'mario@gmail.com', '$2y$10$wq/kfidYV9Jvy8/JeOPTO.lvl0shAM0.sei9sH5NqaGqMA35mWt/a', '2026-01-24 00:00:00'),
(6, 'Adam', 'adamfazgh@gmail.com', '$2y$10$P6puBSskhXmrWLQZJS7Bjel8xSU2H67.zA/S.Zrgbs/.cBYmrjTSi', '2026-01-25 00:00:00'),
(7, 'Nuria', 'nuriamormag@gmail.com', '$2y$10$Wnr/WihJCTl/084UbunHPef0d3H.dAXIXhRXNoxv7kaTbnVJ628s6', '2026-01-26 00:00:00'),
(8, 'negro_de_mierdañ', 'sergio@gmai.com', '$2y$10$N24DzY1eDkdUAmnka5n2F.Lfl2Dn8COldATXH6m4kwdifJfEK3nUy', '2026-01-26 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `valoraciones`
--

CREATE TABLE IF NOT EXISTS `valoraciones` (
  `id_valoracion` int(11) NOT NULL AUTO_INCREMENT,
  `id_articulo` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `puntuacion` tinyint(4) NOT NULL,
  `comentario` text NOT NULL,
  `fec_val` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_valoracion`),
  UNIQUE KEY `uni_valoraciones_id` (`id_usuario`,`id_articulo`),
  KEY `fk_valoraciones_articulos` (`id_articulo`)
) ;

--
-- Dumping data for table `valoraciones`
--

INSERT INTO `valoraciones` (`id_valoracion`, `id_articulo`, `id_usuario`, `puntuacion`, `comentario`, `fec_val`) VALUES
(5, 10, 1, 5, 'buen articulo', '2026-01-25 15:31:14'),
(6, 11, 2, 5, 'hola', '2026-01-25 15:31:55'),
(7, 12, 2, 4, 'bueno', '2026-01-25 15:35:33'),
(8, 10, 5, 4, 'holaaa', '2026-01-25 15:36:48'),
(9, 13, 2, 5, 'buenos', '2026-01-25 16:38:11'),
(10, 13, 5, 3, 'que bueno', '2026-01-25 16:39:05'),
(11, 10, 6, 3, 'Very good, very nice.', '2026-01-25 16:51:19'),
(12, 10, 7, 1, 'amazing', '2026-01-26 08:42:58'),
(13, 10, 8, 4, 'Negros de mierda, parecen cucarachas que se amontonan en la basura', '2026-01-26 13:37:22');

-- --------------------------------------------------------

--
-- Table structure for table `wikis`
--

CREATE TABLE IF NOT EXISTS `wikis` (
  `id_wiki` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_wiki` varchar(150) NOT NULL,
  `cuerpo_wiki` text DEFAULT NULL,
  `enlace_externo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_wiki`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wikis`
--

INSERT INTO `wikis` (`id_wiki`, `titulo_wiki`, `cuerpo_wiki`, `enlace_externo`) VALUES
(1, 'Cifrado César', '<div class=\"wiki-container\">\n    \n    <section class=\"wiki-header\">\n        <h1 class=\"wiki-title\">El Cifrado César: El Arte <br> de la Sustitución</h1>\n        <span class=\"underline\"></span>\n    </section>\n    <section class=\"wiki-header\">\n        <p class=\"wiki-subtitle\">Explorando los orígenes de la criptografía clásica y el legado de las legiones romanas.</p>\n    </section>\n\n    <section class=\"wiki-section\">\n        <h2>1. Introducción: El Nacimiento de la Criptografía Política</h2>\n        <p>\n            El <strong>Cifrado César</strong> es, posiblemente, el método de ocultación de información más icónico de la historia. Se encuadra dentro de lo que los expertos denominan <strong>criptografía clásica</strong>, específicamente en la categoría de los <strong>cifrados de sustitución monoalfabética</strong>. Su nombre no es casualidad; rinde homenaje a una de las mentes militares más brillantes de la Antigua Roma, convirtiéndose en el símbolo de una era donde la información valía tanto como el oro o las espadas.\n        </p>\n        <p>\n            A diferencia de los métodos modernos que utilizan algoritmos matemáticos complejos y computación de alto nivel, el Cifrado César se basa en la <strong>geometría del alfabeto</strong>. Es un sistema de \"clave simétrica\", lo que implica que tanto el emisor como el receptor deben compartir el mismo secreto —el número de posiciones desplazadas— antes de que el primer mensaje sea enviado. Sin ese acuerdo previo, la comunicación se convierte en un galimatías de letras sin sentido.\n        </p>\n    </section>\n\n    <section class=\"wiki-section\">\n        <h2>2. Contexto Histórico: El Secreto de las Legiones</h2>\n        <p>\n            Para entender este cifrado, debemos viajar al siglo I a.C. El Imperio Romano estaba en plena expansión, y la comunicación entre Roma y sus generales en el frente era vital. Julio César se enfrentaba a un problema crítico: si un mensajero era capturado por tribus bárbaras o espías del Senado, sus planes de invasión quedarían al descubierto.\n        </p>\n        <p>\n            Según el historiador romano <strong>Suetonio</strong> en su obra <em>De vita Caesarum</em>, el general romano utilizaba un desplazamiento de <strong>tres posiciones</strong>. En un mundo donde el analfabetismo era la norma absoluta, ver un pergamino con letras latinas que no formaban palabras coherentes era interpretado a menudo como un mensaje escrito en un idioma bárbaro desconocido o incluso un texto mágico.\n        </p>\n        \n        <div class=\"wiki-quote\">\n            \"Si tenía algo confidencial que decir, lo escribía cifrado, es decir, cambiando el orden de las letras de tal manera que ninguna palabra pudiera entenderse.\" — Suetonio.\n        </div>\n    </section>\n\n    <section class=\"wiki-section\">\n        <h2>3. Mecánica del Algoritmo: La Lógica del Desplazamiento</h2>\n        <p>\n            El funcionamiento técnico del Cifrado César es engañosamente simple. Imaginemos el alfabeto dispuesto en una línea. Para cifrar, movemos cada letra un número determinado de lugares (la \"llave\") hacia la derecha.\n        </p>\n        <ul class=\"wiki-list\">\n            <li><strong>Paso a paso:</strong> Si elegimos una llave de 5, la letra \'A\' se desplaza cinco posiciones y se convierte en \'F\'.</li>\n            <li><strong>El Problema del Final:</strong> El alfabeto se trata como un círculo. Después de la \'Z\', el conteo reinicia automáticamente en la \'A\'.</li>\n        </ul>\n        \n        <div class=\"wiki-formula\">\n            Para los entusiastas de las matemáticas, este proceso se define con la fórmula: <br>\n            <code>C = (x + n) mod 26</code>\n        </div>\n    </section>\n\n    <section class=\"wiki-section\">\n        <h2>4. Vulnerabilidades: El Fin del Reinado del César</h2>\n        <p>\n            Durante siglos, el Cifrado César fue considerado inexpugnable. Sin embargo, su extrema simplicidad es también su mayor debilidad bajo la mirada de un criptoanalista moderno.\n        </p>\n        \n        <div class=\"wiki-info-box\">\n            <h3>A. El Ataque de Fuerza Bruta</h3>\n            <p>Dado que el alfabeto occidental estándar tiene 26 letras, solo existen <strong>25 desplazamientos posibles</strong>. Un atacante no necesita ser un genio matemático; solo necesita paciencia para probar cada combinación. En la informática actual, este ataque toma menos de un microsegundo.</p>\n        </div>\n\n        <div class=\"wiki-info-box\">\n            <h3>B. El Análisis de Frecuencias</h3>\n            <p>Este es el golpe de gracia. En cualquier idioma, las letras no aparecen con la misma frecuencia. En español, la letra <strong>\'E\'</strong> es la más común. Si interceptamos un texto cifrado y notamos que la letra más frecuente es la \'W\', hay una probabilidad altísima de que \'W\' sea en realidad \'E\'.</p>\n        </div>\n        \n    </section>\n\n    <section class=\"wiki-section\">\n        <h2>5. Legado y Curiosidades Modernas</h2>\n        <ul class=\"wiki-list\">\n            <li><strong>ROT13:</strong> Una variante usada en internet que utiliza un desplazamiento de 13. Se usa para ocultar \"spoilers\" porque al aplicarlo dos veces, el texto vuelve a la normalidad.</li>\n            <li><strong>Uso Educativo:</strong> Es la primera lección que recibe cualquier estudiante de ciberseguridad, ya que enseña los conceptos fundamentales de entrada, clave y salida.</li>\n        </ul>\n    </section>\n</div>', 'https://es.wikipedia.org/wiki/Cifrado_C%C3%A9sar'),
(2, 'Máquina Enigma', '<div class=\"wiki-container\">\n    \n    <section class=\"wiki-header\">\n        <h1 class=\"wiki-title\">Máquina Enigma: El Laberinto <br> de los Rotores</h1>\n        <span class=\"underline\"></span>\n    </section>\n    <section class=\"wiki-header\">\n        <p class=\"wiki-subtitle\">Descifrando el ingenio electromecánico que desafió al mundo durante la Segunda Guerra Mundial.</p>\n    </section>\n\n    <section class=\"wiki-section\">\n        <h2>1. Introducción: La Cúspide de la Criptografía Mecánica</h2>\n        <p>\n            La <strong>Máquina Enigma</strong> es, sin duda, el dispositivo criptográfico más famoso del siglo XX. Desarrollada originalmente para usos comerciales y bancarios, fue rápidamente adoptada y perfeccionada por las fuerzas armadas alemanas. A diferencia de los métodos manuales, Enigma automatizaba el proceso de cifrado mediante un complejo sistema de rotores, convirtiendo cada mensaje en un código que se consideraba virtualmente inexpugnable.\n        </p>\n        <p>\n            Su importancia fue tal que el desenlace de la Segunda Guerra Mundial estuvo ligado directamente a la capacidad de los Aliados para comprender sus secretos. Lo que parecía un caos de letras aleatorias era en realidad un laberinto eléctrico diseñado para cambiar su configuración con cada pulsación de tecla.\n        </p>\n    </section>\n\n    <section class=\"wiki-section\">\n        <h2>2. Contexto Histórico: El Silencio de los Océanos</h2>\n        <p>\n            Durante el apogeo del conflicto, la comunicación segura era la espina dorsal de la estrategia alemana, especialmente para la coordinación de los submarinos U-Boot en el Atlántico. La confianza en Enigma era absoluta; los operadores creían que, incluso si una máquina caía en manos enemigas, las posibilidades de adivinar la configuración diaria eran nulas.\n        </p>\n        <p>\n            Fue en este escenario donde surgió el mito de la \"irrompibilidad\" de Enigma. Mientras los mensajes cruzaban el éter, en las sombras de <strong>Bletchley Park</strong>, un grupo de mentes brillantes trabajaba para romper un silencio que costaba miles de vidas.\n        </p>\n        \n        <div class=\"wiki-quote\">\n            \"No se trata solo de vencer a una máquina, sino de vencer a la mente que cree que su código es eterno.\" — Reflexión sobre el criptoanálisis en Bletchley Park.\n        </div>\n    </section>\n\n    <section class=\"wiki-section\">\n        <h2>3. Mecánica del Algoritmo: El Ciclo de la Corriente</h2>\n        <p>\n            El funcionamiento de Enigma se basaba en un circuito eléctrico cerrado que pasaba por varios componentes clave. Cada vez que el operador pulsaba una letra, la corriente realizaba un viaje de ida y vuelta antes de iluminar el panel de lámparas.\n        </p>\n        <ul class=\"wiki-list\">\n            <li><strong>Los Rotores:</strong> Discos con 26 contactos en cada cara que giraban como un cuentakilómetros, cambiando el alfabeto de sustitución en cada letra.</li>\n            <li><strong>El Panel de Cables (Plugboard):</strong> Un tablero frontal que permitía intercambiar pares de letras manualmente, añadiendo trillones de combinaciones posibles.</li>\n            <li><strong>El Reflector:</strong> Una pieza clave que permitía que la misma configuración sirviera para cifrar y descifrar, aunque impedía que una letra se cifrara como sí misma.</li>\n        </ul>\n        \n        <div class=\"wiki-formula\">\n            Si \"P\" es el panel de cables, \"R\" los rotores y \"U\" el reflector, la letra cifrada (E) es: <br>\n            <code>E = P · R · U · R⁻¹ · P⁻¹</code>\n        </div>\n    </section>\n\n    <section class=\"wiki-section\">\n        <h2>4. Vulnerabilidades: El Error Humano y la Lógica</h2>\n        <p>\n            A pesar de su complejidad matemática, Enigma tenía debilidades que los criptoanalistas supieron explotar mediante la lógica y la observación.\n        </p>\n        \n        <div class=\"wiki-info-box\">\n            <h3>A. La Prohibición de la Identidad</h3>\n            <p>Debido al diseño del reflector, una letra <strong>nunca podía cifrarse como sí misma</strong>. Si un analista encontraba una palabra donde ninguna letra coincidía con el original, podía empezar a deducir la posición de los rotores.</p>\n        </div>\n\n        <div class=\"wiki-info-box\">\n            <h3>B. Las \"Cribs\" y la Rutina</h3>\n            <p>Los operadores a menudo cometían errores de procedimiento, como enviar el parte meteorológico cada mañana con la misma estructura. Estas frases predecibles, llamadas \"cribs\", daban a los Aliados la palanca necesaria para forzar la entrada al código.</p>\n        </div>\n        \n    </section>\n\n    <section class=\"wiki-section\">\n        <h2>5. Legado y el Nacimiento de la Computación</h2>\n        <ul class=\"wiki-list\">\n            <li><strong>Alan Turing y la Bomba:</strong> Turing perfeccionó una máquina electromecánica capaz de descartar millones de configuraciones de Enigma en minutos, reduciendo drásticamente el tiempo de descifrado.</li>\n            <li><strong>El fin de la guerra:</strong> Se estima que el descifrado de los códigos Enigma acortó la guerra al menos dos años, salvando millones de vidas.</li>\n            <li><strong>Padre de la informática:</strong> Los principios utilizados para vencer a Enigma sentaron las bases de lo que hoy conocemos como computación moderna y algoritmos complejos.</li>\n        </ul>\n    </section>\n</div>', 'https://es.wikipedia.org/wiki/Enigma_(m%C3%A1quina)'),
(3, 'RSA', '<div class=\"wiki-container\">\r\n    \r\n    <section class=\"wiki-header\">\r\n        <h1 class=\"wiki-title\">Algoritmo RSA: El Pilar <br> de la Clave Pública</h1>\r\n        <span class=\"underline\"></span>\r\n    </section>\r\n    <section class=\"wiki-header\">\r\n        <p class=\"wiki-subtitle\">Explorando la revolución de la criptografía asimétrica y el poder de los números primos.</p>\r\n    </section>\r\n\r\n    <section class=\"wiki-section\">\r\n        <h2>1. Introducción: La Revolución Asimétrica</h2>\r\n        <p>\r\n            El algoritmo <strong>RSA</strong>, bautizado en honor a sus inventores Rivest, Shamir y Adleman, marcó un antes y un después en la historia de la informática en 1977. Antes de su llegada, la criptografía era puramente simétrica: si querías enviar un mensaje seguro, debías compartir primero la llave secreta con el receptor, lo cual era un riesgo crítico de seguridad.\r\n        </p>\r\n        <p>\r\n            RSA introdujo el concepto de <strong>criptografía de clave pública</strong>. Por primera vez, fue posible cifrar un mensaje con una llave que todo el mundo conocía (llave pública), pero que solo el destinatario podía descifrar con su llave secreta (llave privada). Este avance es el que permite que hoy podamos realizar compras seguras en internet o enviar correos privados sin haber conocido nunca en persona al receptor.\r\n        </p>\r\n    </section>\r\n\r\n    <section class=\"wiki-section\">\r\n        <h2>2. Contexto Histórico: El Problema de la Distribución</h2>\r\n        <p>\r\n            En la década de los 70, matemáticos de todo el mundo buscaban una \"función de trampilla\": una operación matemática fácil de realizar en un sentido, pero casi imposible de revertir sin una pieza de información específica. La búsqueda terminó cuando el equipo del MIT descubrió que la clave estaba en la <strong>teoría de números</strong>.\r\n        </p>\r\n        <p>\r\n            Aunque el algoritmo fue patentado por el MIT, su diseño es ahora un estándar abierto. RSA ha resistido el paso del tiempo durante casi cinco décadas, convirtiéndose en el protocolo de cifrado más utilizado en la historia de la humanidad, protegiendo desde cuentas bancarias hasta secretos de estado.\r\n        </p>\r\n        \r\n        <div class=\"wiki-quote\">\r\n            \"La criptografía asimétrica no solo oculta mensajes; crea una infraestructura de confianza en un mundo digital donde no podemos vernos las caras.\" — Reflexión sobre el impacto de RSA.\r\n        </div>\r\n    </section>\r\n\r\n    <section class=\"wiki-section\">\r\n        <h2>3. Mecánica del Algoritmo: La Magia de la Factorización</h2>\r\n        <p>\r\n            La seguridad de RSA se basa en un problema matemático extremadamente difícil: la <strong>factorización de números enteros grandes</strong>. Es muy sencillo multiplicar dos números primos gigantes, pero es una tarea de milenios para las computadoras actuales averiguar cuáles fueron esos números si solo conocen el resultado.\r\n        </p>\r\n\r\n        \r\n\r\n        <div class=\"wiki-formula\">\r\n            Primero, generamos el módulo \"n\" multiplicando dos números primos (p y q): <br>\r\n            <code>n = p * q</code>\r\n        </div>\r\n\r\n        <p>\r\n            A partir de ahí, se elige un exponente de cifrado (e) y se calcula el exponente de descifrado (d). La operación de cifrado para un mensaje (M) es:\r\n        </p>\r\n\r\n        <div class=\"wiki-formula\">\r\n            Cifrado del mensaje: <br>\r\n            <code>C = Mᵉ mod n</code>\r\n        </div>\r\n\r\n        <ul class=\"wiki-list\">\r\n            <li><strong>Clave Pública (n, e):</strong> Se comparte libremente para que cualquiera pueda cifrar un mensaje para ti.</li>\r\n            <li><strong>Clave Privada (d):</strong> Se mantiene en secreto absoluto para descifrar los mensajes recibidos.</li>\r\n            <li><strong>Seguridad:</strong> Cuanto más largos son los números primos (2048 o 4096 bits), más difícil es para un atacante romper el cifrado.</li>\r\n        </ul>\r\n    </section>\r\n\r\n    <section class=\"wiki-section\">\r\n        <h2>4. Vulnerabilidades: El Futuro y la Computación Cuántica</h2>\r\n        <p>\r\n            RSA ha demostrado ser robusto, pero no es invulnerable. Su seguridad depende totalmente de la capacidad de cómputo actual.\r\n        </p>\r\n        \r\n        <div class=\"wiki-info-box\">\r\n            <h3>A. Factorización por Fuerza Bruta</h3>\r\n            <p>Con el avance del hardware, llaves que antes eran seguras (como las de 512 bits) ahora pueden ser rotas en minutos. Por ello, la longitud de las llaves debe aumentar constantemente para mantenerse por delante de los atacantes.</p>\r\n        </div>\r\n\r\n        <div class=\"wiki-info-box\">\r\n            <h3>B. La Amenaza Cuántica</h3>\r\n            <p>El mayor desafío para RSA es el <strong>Algoritmo de Shor</strong>. En teoría, una computadora cuántica lo suficientemente potente podría factorizar números gigantes en segundos, lo que obligará a la humanidad a migrar a criptografía post-cuántica en el futuro cercano.</p>\r\n        </div>\r\n        \r\n    </section>\r\n\r\n    <section class=\"wiki-section\">\r\n        <h2>5. Legado y Aplicaciones Modernas</h2>\r\n        <ul class=\"wiki-list\">\r\n            <li><strong>Protocolo HTTPS:</strong> El candado que ves en tu navegador utiliza RSA para intercambiar llaves de sesión seguras.</li>\r\n            <li><strong>Firmas Digitales:</strong> RSA permite verificar la autenticidad de un documento, asegurando que no ha sido alterado.</li>\r\n            <li><strong>SSH y VPN:</strong> Las conexiones seguras de red para administradores y trabajadores remotos dependen habitualmente de este algoritmo.</li>\r\n        </ul>\r\n    </section>\r\n</div>', 'https://es.wikipedia.org/wiki/RSA'),
(4, 'SHA-256', '<div class=\"wiki-container\">\r\n    \r\n    <section class=\"wiki-header\">\r\n        <h1 class=\"wiki-title\">Algoritmo SHA-256: La <br> Huella de la Inmutabilidad</h1>\r\n        <span class=\"underline\"></span>\r\n    </section>\r\n    <section class=\"wiki-header\">\r\n        <p class=\"wiki-subtitle\">Descubriendo la función hash que asegura la integridad de la red global y el mundo Blockchain.</p>\r\n    </section>\r\n\r\n    <section class=\"wiki-section\">\r\n        <h2>1. Introducción: Más allá del Cifrado</h2>\r\n        <p>\r\n            El <strong>SHA-256</strong> (Secure Hash Algorithm 256-bit) pertenece a una familia de algoritmos diseñados por la NSA, pero a diferencia de RSA o César, no es un sistema de cifrado. Su objetivo no es esconder un mensaje para que alguien lo lea después, sino crear una <strong>huella digital única</strong> e irreversible de cualquier bloque de datos.\r\n        </p>\r\n        <p>\r\n            En la criptografía moderna, SHA-256 actúa como el sello de garantía. Si un archivo tiene un hash determinado, podemos estar 100% seguros de que el contenido es exacto. Es la herramienta definitiva para verificar la integridad de la información en un mundo donde los datos pueden ser alterados en milisegundos.\r\n        </p>\r\n    </section>\r\n\r\n    <section class=\"wiki-section\">\r\n        <h2>2. Contexto Histórico: El Estándar de Oro</h2>\r\n        <p>\r\n            Publicado en 2001, SHA-256 fue creado para sustituir a algoritmos anteriores como MD5 y SHA-1, que empezaban a mostrar debilidades ante ataques de colisión. Su diseño fue tan robusto que se convirtió rápidamente en el estándar federal de procesamiento de información en los Estados Unidos y, posteriormente, en la base de la seguridad en internet.\r\n        </p>\r\n        <p>\r\n            Su fama mundial llegó en 2008, cuando Satoshi Nakamoto lo eligió como el componente central de <strong>Bitcoin</strong>. Desde entonces, SHA-256 no solo protege datos, sino que sostiene una economía entera basada en la confianza matemática.\r\n        </p>\r\n        \r\n        <div class=\"wiki-quote\">\r\n            \"En el mundo digital, SHA-256 es la ley de la gravedad: es constante, predecible y hace que sea imposible engañar a la historia de los datos.\" — Sobre la inmutabilidad en Blockchain.\r\n        </div>\r\n    </section>\r\n\r\n    <section class=\"wiki-section\">\r\n        <h2>3. Mecánica del Algoritmo: La Función de una Sola Vía</h2>\r\n        <p>\r\n            La magia de SHA-256 reside en que es una <strong>función unidireccional</strong>. Puedes convertir un libro entero en un hash en microsegundos, pero es matemáticamente imposible realizar el proceso inverso para recuperar el libro a partir del hash.\r\n        </p>\r\n\r\n        \r\n\r\n        <div class=\"wiki-formula\">\r\n            Tamaño de la salida (Hash): <br>\r\n            <code>256 bits / 64 caracteres hexadecimales</code>\r\n        </div>\r\n\r\n        <p>\r\n            El proceso divide el mensaje en bloques de 512 bits y aplica una serie de operaciones lógicas y constantes matemáticas (basadas en raíces cuadradas de números primos) para mezclar los datos de forma caótica pero controlada.\r\n        </p>\r\n\r\n        <ul class=\"wiki-list\">\r\n            <li><strong>Determinismo:</strong> La misma entrada siempre produce exactamente el mismo hash.</li>\r\n            <li><strong>Efecto Avalancha:</strong> Si cambias un solo bit en la entrada, más de la mitad de los bits del hash resultante cambiarán drásticamente.</li>\r\n            <li><strong>Resistencia a Colisiones:</strong> Es virtualmente imposible encontrar dos entradas diferentes que produzcan el mismo hash.</li>\r\n        </ul>\r\n    </section>\r\n\r\n    <section class=\"wiki-section\">\r\n        <h2>4. Aplicaciones Críticas: Blockchain y Seguridad</h2>\r\n        <p>\r\n            SHA-256 es el motor que permite la existencia de bases de datos que nadie puede manipular.\r\n        </p>\r\n        \r\n        <div class=\"wiki-info-box\">\r\n            <h3>Minería de Bitcoin (Proof of Work)</h3>\r\n            <p>Los mineros de Bitcoin compiten por encontrar un hash SHA-256 que cumpla con una dificultad específica. Este proceso requiere billones de cálculos por segundo, asegurando que nadie pueda tomar el control de la red de forma barata.</p>\r\n        </div>\r\n\r\n        <div class=\"wiki-info-box\">\r\n            <h3>Integridad de Archivos</h3>\r\n            <p>Cuando descargas un software importante, el desarrollador suele darte su \"checksum\" en SHA-256. Al calcular el hash en tu computadora y compararlo, verificas que el instalador no contiene malware inyectado durante la descarga.</p>\r\n        </div>\r\n        \r\n    </section>\r\n\r\n    <section class=\"wiki-section\">\r\n        <h2>5. Legado y Seguridad Futura</h2>\r\n        <ul class=\"wiki-list\">\r\n            <li><strong>Inmunidad Temporal:</strong> A diferencia de RSA, SHA-256 se considera mucho más resistente a los ataques de computadoras cuánticas iniciales.</li>\r\n            <li><strong>Gestión de Contraseñas:</strong> Las bases de datos seguras almacenan hashes de contraseñas, nunca las contraseñas en texto plano, protegiendo al usuario en caso de hackeo.</li>\r\n            <li><strong>Firmas de Software:</strong> Es la base para asegurar que las actualizaciones de tu sistema operativo son legítimas y provienen del fabricante oficial.</li>\r\n        </ul>\r\n    </section>\r\n</div>', 'https://es.wikipedia.org/wiki/SHA-2');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `fk_articulo_wiki` FOREIGN KEY (`id_wiki`) REFERENCES `wikis` (`id_wiki`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `valoraciones`
--
ALTER TABLE `valoraciones`
  ADD CONSTRAINT `fk_valoraciones_articulos` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_valoraciones_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
