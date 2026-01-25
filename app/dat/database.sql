    -- ===========================================
-- CREACIÓN DE LA BASE DE DATOS
-- ===========================================

CREATE DATABASE IF NOT EXISTS criptojourney_db;
USE criptojourney_db;

-- ===========================================
-- CREACIÓN DE LA TABLA USUARIOS
-- ===========================================

CREATE TABLE IF NOT EXISTS usuarios
(
	id_usuario INTEGER AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL,
	fec_reg DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) COMMENT = 'Tabla que almacena los usuarios  registrados. Tiene como clave primaria un id único 
							que se auto incrementa por cada nuevo usuario, la contraseña es guardada en hash 
							para la seguridad del usuario';

-- ===========================================
-- CREACIÓN DE LA TABLA ARTICULOS
-- ===========================================

CREATE TABLE IF NOT EXISTS articulos
(
	id_articulo INTEGER AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(50) NOT NULL UNIQUE ,
	fec_pub DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) COMMENT = 'Tabla que almacena los artículos de la pagina web. Tiene como clave primaria un identificador único
							que se auto incrementa por cada nuevo artículo introducido, el titulo es único, no se repiten artículos';

-- ===========================================
-- CREACIÓN DE LA TABLA VALORACIONES
-- ===========================================

CREATE TABLE IF NOT EXISTS valoraciones
(
	id_valoracion INTEGER AUTO_INCREMENT PRIMARY KEY,
	id_articulo INTEGER,
	id_usuario INTEGER,
	puntuacion TINYINT NOT NULL,
	comentario TEXT  NOT NULL,
	fec_val DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	
	-- -- Restricción que impide que un usuario valore el mismo artículo más de una vez.
	CONSTRAINT uni_valoraciones_id
	UNIQUE(id_usuario, id_articulo),
	
	-- Clave foránea que relaciona cada valoración con un artículo
	CONSTRAINT fk_valoraciones_articulos
	FOREIGN KEY (id_articulo)
	REFERENCES articulos(id_articulo)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	-- Clave foránea que relaciona cada valoración con un usuario
	CONSTRAINT fk_valoraciones_usuarios
	FOREIGN KEY (id_usuario)
	REFERENCES usuarios(id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	-- Restricción que asegura que la puntuación esté comprendida entre 1 y 5
	CONSTRAINT ck_puntuacion
	CHECK ( puntuacion BETWEEN 1 and 5)
) COMMENT = 'Tabla que almacena las valoraciones de la pagina web. Tiene como clave primaria un identificador único
							que se auto incrementa por cada nueva valoración la cual es hecha por un usuario unico a un articulo unico, 
							la puntuación es entre 1 y 5';