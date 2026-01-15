# Documentación de la Base de Datos  
## Criptojourney.org

---

## 1. Introducción

Esta documentación describe la estructura y funcionamiento de la base de datos utilizada en Criptojourney.org.
La base de datos se emplea exclusivamente para gestionar el **sistema de inicio de sesión** y el **sistema de valoraciones de artículos**.

---

## 2. Objetivo de la Base de Datos

- Gestionar usuarios registrados y su autenticación.
- Permitir a los usuarios valorar artículos de criptografía y acceder a la wiki interna de la web.
- Mantener la integridad, seguridad y consistencia de los datos.

---

## 3. Tecnología

- **Tipo de base de datos:** Relacional.
- **SGBD:** PHPMyAdmin(MySQL). 

---

## 4. Modelo Entidad–Relación (EER)

### 4.1 Entidades
- **Usuario**
- **Artículo**
- **Valoración**

### 4.2 Relaciones
- Un **usuario** puede realizar **varias valoraciones**.
- Un **artículo** puede recibir **varias valoraciones**.
- Cada **valoración** pertenece a **un único usuario** y **un único artículo**.

### 4.3 Diagrama EER (ASCII)

![Diagrama EER](https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22Page-1%22%20id%3D%2214RJLx7UqkI2-8BSdtQa%22%3E7Z1tb9o6FMc%2FDdJ2pU2QB0pfDrpu0rrdq3VX215VLnGJd03MdZwB%2B%2FTXJjYhQFKvNw%2BUHKkSsWNMcs4vzj%2FnOG7PncxX7zhahB9ZgGnP6QernnvVc5yB5wzlh6pZpzUXl7pixkmgG2UVt%2BQX1pV9XZuQAMe5hoIxKsgiXzllUYSnIleHOGfLfLMHRvO%2FukAzfFBxO0X0sPYrCUSY1o78flb%2FHpNZaH550Nd75sg01hVxiAK23Kly3%2FbcCWdMpFvz1QRTZTxjl%2FR71wV7twfGcSRsvoB%2F%2BAv2%2FYOX%2BH9%2Bff%2F2C%2F9x%2FT14daQXXRWLtbGBPPKF2hToXlWNY4G40K5y%2B7JCGl8gEmEuKwabMqVoEZNN87QmJDS4QWuWCNORKY0fyAoHn1NPqbbSaTeyM1VUnT%2FIzm%2F1wajdiJJZJLen8ojVL445juWx3KBY6BahmFO9mZ7LT0QTfS5JnCBOWKx3YC7waue8teneYTbHgq9lk3DXuyPty2WGguvqOt3NUBc1786lLiMN4mzbdeYruaHd9Ruucw5dV%2BbiIn9%2BVkyOQ8bJL%2BVFqq2%2B6%2BNNeUnmFEUSdhTsVY3Z5uLe%2BIpQOmGUKRAiFuEDFlSjgLPFF8RnWOiKBSOR2JjHH8s%2FabBJ%2F7Xf8%2BWxTmR5kJXln2rOxYRFseCSOdUHlq5fYuX%2BsWAL3SnFD6Z%2Frj2otu%2BZEGxeRMeTqHBLoFjnm1QOgWsJgVMIgfyqIIh%2BloMnimY0ddlmLEWZy4749ailt9bdN%2Fv%2BRcykjR%2FoZjgMSRBgeUGPlyER%2BHaBpqrRUt5OHrmU%2F%2FpQlbvKrlHdWWaf3%2B4NUTlORUjICyWJgvjA59vjfDoG3jPBwIzdadtxLJ1NotlN%2Bs3hHid%2BRZyQ4E6P%2BlXxMvDyY361%2FGx7bxCgARBURpA0SVXo9PPolN4ansBOv3l2fBAi%2F0eI9JsUIsO6hMjQEgK%2F5fEDB8T0V5UO%2BfQJdIj27sUzoeDRu0gVXERsfs%2Bln4ZU%2F0aUO%2BXhv4l69E%2B7fRWn%2Fb5R1uN4051pILdm%2BrPnuJfpFk1rrtNuTQOQNwW3Htt7VCfA%2FIn4NET8hdN%2FCbKmEIURyJpnI2tqC7JdWkIwOk9ZM%2FkbtM32Ou8%2FExYauYfgOSIUBEchLLbPQ52AxQgOHwRHGTNHknGgOE5UcQycuiTHwDqxV8zBsxYdoDdS99rm9lrnoJF7yALF8ZLxADRHIQe20bduAGNEx2AIoqOEBQhzVCU6qtcYfm0awzauMWj7%2BQQ0Rp1XvxGxp89BI7eMBzy943gGEqOQF%2BtH1E7wciWNDdqimJYjT7LnPbtYoT1N6FOnFzslmkB3MxrlNUKN84ut55Y6IA3Pd4axYz0z0G15yIc5xvWO5rZzKFoHoa1Zxmb0B%2F1YiIZtWqyjDME84zImbOObIEhOIEFW20xjxzZiaXg5t9gVTMrZ8bFtILN1GBoJSAgiQH%2BUUGAOA3DZnBLMy7GCxjboCbrjBHRHbfEw90g0s5SXc9MdIDlS99rGRVvnoKmcWYjuFsk9qI5CEGxDqN0gBrJm5Ws5HBlfzjtrJjcZl6Qx9QNPAWO7WlRJ4sy7aCpx5tle7l5xkLPTevE8Emeebb7E8AKJs%2FMUjJ5t0qN1ENpKnGU3ABCRhXDYZj86ShGkzsqYsM2ZgCQ5gRBWbakzzzZb4rU9fbOGENa1VCQTiGNlS53Y5kJah6GRqATM37FhxjYV0hFmQHSUwWKbMAHRcQKio7ZwmG%2BbLzG8gOg4Y9FhGxttHYamRAcsTfwYMtZr93UDGdAcZQxYx1pBc7SvOepbRMe3Xol2eH6i48UfLyegO%2FJutg2Ats5DM4vpJJFIIOFSjoxtsLQbyAgSrUF7lC6Bbx1QBe1xRmvpDG1jooaPc5IaIDCMc22Dna1T0MjdYioNKocuCGyUkWAbGO0GMl%2FwCtRFCQQwq%2FSE1cWoNnVhG%2F0ctj3tC946qvXytw1sts5BYyv1ySKIi0IMbAOg3eAF3jkqp0WHR3Fw8N%2FQD19CYgmf4pLODtNwqlsz4Vfey0M2YxGib7PaMVenho3QyNrcsA1Lyqc%2FsBBrLVBQIlje4%2FIo%2BfqbuRWpwndVeO2b4tVqd%2BeVETDpsQqjTorOKc0tHqLCMUWC%2FMwbrXoRcFmlew71YRP%2BWRGxdY%2Fc3vGOLGXOUYX1rqe%2B7Tq4Up%2Bmc9Ta8ql5Ha38NT%2BhHopyhjw28kllzP7Be6PwkYH54DU9NRiSKaJv9I65HF%2BP%2BPtgOB1UNZYO80Opu%2FeSnjuoS1dflFxBnTX%2FyGvM%2FEfCZc%2FG%2FJUlzfbMf7G3tqvr%2BnWZ3%2Bod446Z3zMrXBrzD3%2Ff%2FLLImfqvrZk6k1YKP7IAqxb%2FAQ%3D%3D%3C%2Fdiagram%3E%3C%2Fmxfile%3E)


---

## 5. Modelo Relacional

---

### 5.1 Tabla `usuarios`

Almacena la información de los usuarios registrados en la web.

| Campo       | Tipo          | Restricciones                     | Descripción                          |
|------------|---------------|----------------------------------|--------------------------------------|
| id_usuario | INT           | PK, AUTO_INCREMENT               | Identificador único del usuario      |
| nombre     | VARCHAR(50)   | NOT NULL                         | Nombre del usuario                   |
| email      | VARCHAR(100)  | NOT NULL, UNIQUE                 | Correo electrónico                   |
| password   | VARCHAR(255)  | NOT NULL                         | Contraseña cifrada (hash)            |
| fecha_reg  | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Fecha de registro                    |

---

### 5.2 Tabla `articulos`

Contiene los artículos informativos sobre criptografía.

| Campo       | Tipo          | Restricciones                     | Descripción                          |
|------------|---------------|----------------------------------|--------------------------------------|
| id_articulo| INT           | PK, AUTO_INCREMENT               | Identificador del artículo           |
| titulo     | VARCHAR(150)  | NOT NULL                         | Título del artículo                  |
| contenido  | TEXT          | NOT NULL                         | Contenido del artículo               |
| fecha_pub  | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Fecha de publicación                 |

---

### 5.3 Tabla `valoraciones`

Registra las valoraciones realizadas por los usuarios sobre los artículos.

| Campo         | Tipo     | Restricciones                                             | Descripción                         |
|---------------|----------|-----------------------------------------------------------|-------------------------------------|
| id_valoracion | INT      | PK, AUTO_INCREMENT                                        | Identificador de la valoración      |
| id_usuario    | INT      | FK → usuarios(id_usuario), NOT NULL                      | Usuario que realiza la valoración   |
| id_articulo   | INT      | FK → articulos(id_articulo), NOT NULL                    | Artículo valorado                   |
| puntuacion    | TINYINT  | NOT NULL, CHECK (puntuacion BETWEEN 1 AND 5)             | Puntuación del 1 al 5               |
| comentario    | TEXT     | NULL                                                      | Comentario opcional                 |
| fecha_val     | DATETIME | NOT NULL, DEFAULT CURRENT_TIMESTAMP                      | Fecha de la valoración              |

---

## 6. Reglas de Negocio

- Un usuario solo puede valorar artículos si está autenticado.
- Un usuario solo puede acceder a la wiki de la web si esta autenticado.
- La puntuación de una valoración debe estar entre 1 y 5.
- Un usuario no debería valorar el mismo artículo más de una vez (restricción lógica desde la aplicación).
- Las contraseñas nunca se almacenan en texto plano.

---

## 7. Seguridad

- Uso de **hash seguro** para contraseñas.
- Validación de datos de entrada para prevenir SQL Injection.
- Uso de claves foráneas para mantener integridad referencial.
- Acceso restringido a la base de datos mediante credenciales seguras.

---

## 8. Consultas SQL Frecuentes

### 8.1 Obtener valoraciones de un artículo
```sql
SELECT u.nombre, v.puntuacion, v.comentario, v.fecha_val
FROM valoraciones v
JOIN usuarios u ON v.id_usuario = u.id_usuario
WHERE v.id_articulo = 1;
```

### 8.2 Calcular la puntuación media de un artículo
```
SELECT id_articulo, AVG(puntuacion) AS media
FROM valoraciones
GROUP BY id_articulo;
```

### 8.3 Insertar un nuevo usuario
```
INSERT INTO usuarios (nombre, email, password)
VALUES ('Usuario Ejemplo', 'usuario@ejemplo.com', '<hash_contraseña>');
```

### 8.4 Insertar una valoración
```

INSERT INTO valoraciones (id_usuario, id_articulo, puntuacion, comentario)
VALUES (1, 3, 4, 'Artículo claro y bien explicado');
```
