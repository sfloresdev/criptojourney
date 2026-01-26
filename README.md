# Proyecto historia de la criptografia
# 🔐 CriptoJourney

**Un viaje interactivo por la historia de la criptografía**

[![Deploy Status](https://img.shields.io/badge/deploy-vercel-black?logo=vercel)](https://criptojourney.org)
[![HTML5](https://img.shields.io/badge/HTML5-E34F26?logo=html5&logoColor=white)](https://developer.mozilla.org/es/docs/Web/HTML)
[![CSS3](https://img.shields.io/badge/CSS3-1572B6?logo=css3&logoColor=white)](https://developer.mozilla.org/es/docs/Web/CSS)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black)](https://developer.mozilla.org/es/docs/Web/JavaScript)

---

🌐 **Demo:** [Visita CriptoJourney](https://criptojourney.org)

---

## 📖 Sobre el Proyecto

CriptoJourney es una plataforma educativa interactiva que enseña la evolución histórica de la criptografía desde la antigüedad hasta la era digital. A través de demostraciones prácticas y una narrativa cronológica, los visitantes pueden experimentar directamente con los algoritmos que han protegido la información a lo largo de la historia.

---

## 🎯 Objetivos

- **Educar:** Explicar los fundamentos de los principales algoritmos de encriptación destacando su contexto histórico y relevancia.  
- **Interactuar:** Ofrecer demostraciones prácticas donde los usuarios experimenten directamente con cada algoritmo.  
- **Inspirar:** Demostrar la importancia de la criptografía y su impacto en la seguridad digital actual.  
- **Conectar:** Mostrar cómo cada avance criptográfico fue construido sobre los anteriores mediante una narrativa cronológica.  

---

## 💡 Filosofía

CriptoJourney nace bajo la filosofía que dio origen a Internet: el libre acceso a la información y el intercambio del conocimiento sin restricciones, independientemente del nivel técnico o contexto del usuario.

---

## ✨ Características

- 🖱️ Demostraciones interactivas de cada algoritmo criptográfico  
- ♿ Accesible y responsive  
- 🔓 Código abierto – Disponible para la comunidad  
- 🔐 Sistema de registro de usuarios y valoraciones de artículos  

---

## 🛠️ Tecnologías

| Tecnología      | Uso                                               |
|-----------------|--------------------------------------------------|
| HTML5           | Estructura semántica y accesible                |
| CSS3            | Estilos, animaciones, responsive design        |
| JavaScript      | Lógica de cifrado, interactividad, animaciones |
| Web Crypto API  | Implementación real de SHA-256                 |
| PHP / MySQL     | Backend y gestión de base de datos              |
| Git & GitHub    | Control de versiones y colaboración            |

---

## 🔐 Algoritmos Implementados

1. **Cifrado César (100 AC)**  
   - Input de texto interactivo  
   - Slider de desplazamiento (1-25 posiciones)  
   - Visualización de alfabetos  
   - Contexto histórico: Julio César y comunicaciones militares romanas  

2. **Máquina Enigma (1918)**  
   - Simulación visual de la máquina  
   - Rotores animados con CSS  
   - Historia: Arthur Scherbius, Alan Turing y la ruptura del código  

3. **RSA (1977)**  
   - Explicación conceptual con metáforas visuales  
   - Diagrama de flujo: cifrado/descifrado  
   - Animaciones de candado abierto/cerrado  
   - Contexto: Rivest, Shamir, Adleman  

4. **SHA-256 (2001)**  
   - Generación de hash en tiempo real con Web Crypto API  
   - Demostración del "efecto avalancha"  
   - Relevancia: Bitcoin, blockchain y certificados digitales  

---

## 🛠️ Base de Datos

La plataforma incluye un **sistema de autenticación y valoraciones** para usuarios y artículos.

### Modelo de Datos

**Entidades principales:**

- `usuarios`: Información de los usuarios registrados (nombre, email, contraseña hash, fecha de registro)  
- `articulos`: Artículos sobre criptografía (título, subtítulo, resumen, contenido, fecha de publicación)  
- `valoraciones`: Valoraciones de usuarios sobre artículos (puntuación 1-5, comentario, fecha)  

**Relaciones:**

- Un usuario puede realizar varias valoraciones  
- Un artículo puede recibir varias valoraciones  
- Cada valoración pertenece a un único usuario y a un único artículo  

### Reglas de negocio

- Solo usuarios autenticados pueden valorar artículos o acceder a la wiki  
- La puntuación debe estar entre 1 y 5  
- Un usuario no puede valorar el mismo artículo más de una vez  
- Contraseñas siempre cifradas  

### Script SQL de creación

```sql
CREATE DATABASE IF NOT EXISTS criptojourney_db;
USE criptojourney_db;

-- Tabla usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fec_reg DATE NOT NULL
);

-- Tabla articulos
CREATE TABLE IF NOT EXISTS articulos (
    id_articulo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    subtitulo VARCHAR(255),
    resumen TEXT,
    contenido LONGTEXT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla valoraciones
CREATE TABLE IF NOT EXISTS valoraciones (
    id_valoracion INT AUTO_INCREMENT PRIMARY KEY,
    id_articulo INT NOT NULL,
    id_usuario INT NOT NULL,
    puntuacion TINYINT NOT NULL CHECK (puntuacion BETWEEN 1 AND 5),
    comentario TEXT NOT NULL,
    fec_val DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_usuario, id_articulo),
    FOREIGN KEY (id_articulo) REFERENCES articulos(id_articulo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
);
---

## 🚀 Instalación y Uso

### Prerrequisitos

- Navegador web moderno (Chrome, Firefox, Safari, Edge)
- Editor de código (VS Code recomendado)
- Git instalado

### Clonar el repositorio
```bash
git clone https://github.com/tu-usuario/criptojourney.git
cd criptojourney
```

### Ejecutar localmente

**Opción 1: Live Server (VS Code)**
1. Instala la extensión "Live Server"
2. Click derecho en `index.html` → "Open with Live Server"
   
**Opción 2: Simplemente abrir**
```bash
open index.html  # macOS
start index.html # Windows
```
---

## 🤝 Contribuciones

Este es un proyecto académico, pero estamos abiertos a sugerencias y mejoras:

1. Fork el proyecto
2. Crea una rama (`git checkout -b feature/mejora`)
3. Commit tus cambios (`git commit -m 'Añadir nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/mejora`)
5. Abre un Pull Request

---

## 👨‍💻 Autores

- **[Mario Cajas]** - *Desarrollo Frontend y UI/UX Designer* - [@mcajas-rdev](https://github.com/mcajas-rdev)
- **[Sergio Flores]** - *Desarrollo Frontend y DevOps* - [@sfloresdev](https://github.com/sfloresdev)
  
---

## 🙏 Agradecimientos

- Proyecto desarrollado para la asignatura **Diseño de Interfaces Web**
- Centro: [IES Tetuán de las Victorias]
- Inspiración: La comunidad de criptografía y seguridad informática
- Recursos históricos: Wikipedia, Crypto Museum, Historia de la Criptografía

---

## 📞 Contacto

¿Preguntas, sugerencias o feedback?

- 📧 Email: [mario12cajas@gmail.com](mailto:mario12cajas@gmail.com)
- 📧 Email: [sergiofloresperaltarafael@gmail.com](mailto:sergiofloresperaltarafael@gmail.com)
- 🌐 Web: [criptojourney.org](https://criptojourney.org)
- 💬 Problemas: [GitHub Issues](https://github.com/tu-usuario/criptojourney/issues)

---

## 🌟 Apoya el Proyecto

Si te ha gustado CriptoJourney:

- ⭐ Dale una estrella en GitHub
- 🔗 Compártelo con quien le pueda interesar
- 📢 Difunde el conocimiento libre

---

<div align="center">

**Hecho con 🤍 para democratizar el conocimiento sobre criptografía**

*CriptoJourney © 2025*

</div>