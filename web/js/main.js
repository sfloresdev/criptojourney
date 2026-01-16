// Animacion de las imagenes al cargar
window.addEventListener('load', () => {
  const imgs = document.querySelectorAll('.hero-images img');

  // Esperar a que el navegador pinte el estado inicial
  requestAnimationFrame(() => {
    imgs.forEach((img, i) => {
      // Añadimos con retraso para que entren una tras otra
      setTimeout(() => {
        img.classList.add('visible');
      }, i * 500);
    });
  });
});

// Bloque para animacion de fondo en hero Section
const canvas = document.getElementById('heroCanvas');
const ctx = canvas.getContext('2d');

// Ajusta tamaño del canvas
canvas.width = canvas.offsetWidth;
canvas.height = canvas.offsetHeight;

// --- CONFIGURACIÓN ---
const SYMBOLS = 'αβγδεζηθλμπ♃∂∫∂∇01ᛚᛟ∞ΛΩΞIβ@#$%&*!';
const SYMBOL_COUNT = 15;   // pocos símbolos, menos ruido visual
const SYMBOL_SIZE = 22;    // tamaño uniforme
const SPEED = 0.15;        // ⚠️ más lento (antes era 0.4)


// Crear símbolos
const symbols = [];
for (let i = 0; i < SYMBOL_COUNT; i++) {
  symbols.push({
    x: Math.random() * canvas.width,
    y: Math.random() * canvas.height,
    color: '#727171c8',
    char: SYMBOLS.charAt(Math.floor(Math.random() * SYMBOLS.length)),
    opacity: 1,
  });
}

// Función de animación
function animate() {
  // Sin estela 
  ctx.fillStyle = '#000';
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  ctx.font = `${SYMBOL_SIZE}px monospace`;
  ctx.textAlign = 'center';
  ctx.textBaseline = 'middle';

  for (let i = 0; i < SYMBOL_COUNT; i++) {
    const s = symbols[i];

    ctx.fillStyle = s.color;
    ctx.globalAlpha = s.opacity;
    ctx.fillText(s.char, s.x, s.y);

    // Movimiento más lento y fluido
    s.y += SPEED * 60 * 0.16;

    // Reinicio al salir de pantalla
    if (s.y > canvas.height + SYMBOL_SIZE) {
      s.y = -SYMBOL_SIZE;
      s.x = Math.random() * canvas.width;
      s.color = '#727171c8';
      s.char = SYMBOLS.charAt(Math.floor(Math.random() * SYMBOLS.length),);
    }
  }

  ctx.globalAlpha = 1.0;
  requestAnimationFrame(animate);
}
// Ajustar al redimensionar
window.addEventListener('resize', () => {
  canvas.width = canvas.offsetWidth;
  canvas.height = canvas.offsetHeight;
});
// Iniciar
animate();


// Bloque para el menu
let btn = document.getElementById('menu-btn');
let menu = document.getElementById('menu');
const link = document.querySelectorAll('.menu-header a');

btn.addEventListener("click", () => {
  menu.classList.toggle("active");
});

document.addEventListener("click", (event) => {
  if (!btn.contains(event.target) && !menu.contains(event.target)) {
    menu.classList.remove("active");
  }
});

for (let i = 0; i < link.length; i++) {
    link[i].addEventListener("click", () => {
      menu.classList.remove("active");
    }); 
}

/*--------Animación del menu--------*/
const links = document.querySelectorAll('.menu-header a');
const highlight = document.querySelector('.menu-header .highlight');

links.forEach(link => {
  link.addEventListener('mouseenter', e => {
    const { offsetTop, offsetHeight, offsetWidth, offsetLeft } = e.target;
    highlight.style.top = offsetTop + 'px';
    highlight.style.left = offsetLeft + 'px';
    highlight.style.width = offsetWidth + 'px';
    highlight.style.height = offsetHeight + 'px';
  });
});

document.querySelector('.menu-header').addEventListener('mouseleave', () => {
  highlight.style.width = 0;
});

const encryptionSection = document.querySelector('.encryption-section');

const observer = new IntersectionObserver((entries) =>{
	entries.forEach((entry)=> {
		if (entry.isIntersecting) {
			entry.target.classList.add('visible');
			observer.unobserve(entry.target);
		}
	});
}, {threshold: 0.5});
observer.observe(encryptionSection);

// Bloque para actualizar los visitantes del sitio
async function updateVisitors() {
  try {
    const response = await fetch('/api/visitas');
    const data = await response.json();

    const contadorSpan = document.getElementById('visitor-count');
    if (contadorSpan){
      contadorSpan.textContent = data.visitas.toLocaleString();
    }
  } catch (err){
    console.error('ERROR al obtener el contador', err);
  }
}

window.addEventListener('DOMContentLoaded', updateVisitors);

// Bloque para el status de la pagina en el footer
// Objeto que almacena los posibles estados del sitio
const projectStates = {
  active: { text: "Active", className: "active" },
  maintenance: { text: "In maintenance", className: "maintenance" },
  offline: { text: "Offline", className: "offline" }
}

function updateStatus(newStatusKey) {
  // Elementos del DOM
  const statusIndicator = document.querySelector('.status-indicator');
  const statusText = document.querySelector('.status-text');

  // Si los elementos aun no se han cargado
  if (!statusIndicator || !statusText) return;

  const newState = projectStates[newStatusKey];
  if (!newState) return; // si no existe, no hace nada

  statusIndicator.className = "status-indicator " + newState.className;
  statusText.textContent = newState.text;
}

updateStatus("maintenance");