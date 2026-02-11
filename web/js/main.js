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
if (canvas) {
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
}


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

const logout = document.querySelectorAll('.logout a');
const highlight_logout= document.querySelector('.logout .highlight');

logout.forEach(l => {
  l.addEventListener('mouseenter', e => {
    const { offsetTop, offsetHeight, offsetWidth, offsetLeft } = e.target;
    highlight_logout.style.top = offsetTop + 'px';
    highlight_logout.style.left = offsetLeft + 'px';
    highlight_logout.style.width = offsetWidth + 'px';
    highlight_logout.style.height = offsetHeight + 'px';
  });
});

document.querySelector('.logout').addEventListener('mouseleave', () => {
  highlight_logout.style.width = 0;
});

(function() {
    const initCesar = () => {
        const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        const strip = document.getElementById('cesar-strip');
        const input = document.getElementById('cesar-input');
        const output = document.getElementById('cesar-output');
        const shiftInput = document.getElementById('cesar-shift');
        const toggle = document.getElementById('cesar-mode-toggle');
        const modeText = document.getElementById('cesar-mode-text');
        // Referencia al botón de copiar
        const btnCopy = document.getElementById('cesar-copy-btn');

        if (!strip) return;

        // Generamos los 3 alfabetos para la rueda infinita
        const tripleAlpha = alphabet + alphabet + alphabet;
        strip.innerHTML = tripleAlpha.split('').map((l, index) => {
            return `<div class="letter-box">${l}</div>`;
        }).join('');

        const letterBoxes = strip.querySelectorAll('.letter-box');

        // FUNCIÓN DE ACTUALIZACIÓN (Rueda + Cifrado)
        const update = () => {
            let n = parseInt(shiftInput.value) || 0;
            const isDecrypt = toggle.checked;
            
            if(modeText) modeText.innerText = isDecrypt ? "Descifrar" : "Cifrar";

            let shift = n % 26;
            if (shift < 0) shift += 26; 

            let effectiveN = isDecrypt ? (26 - shift) % 26 : shift;

            const boxWidth = letterBoxes[0].getBoundingClientRect().width;
            const gap = 10; 
            const step = boxWidth + gap;

            const totalTranslate = (26 + effectiveN) * step;
            strip.style.transform = `translateX(${-totalTranslate}px)`;

            letterBoxes.forEach((box, i) => {
                box.classList.toggle('active', i === (26 + effectiveN));
            });

            output.value = input.value.split('').map(char => {
                if (char.match(/[a-z]/i)) {
                    const code = char.charCodeAt(0);
                    const base = (code >= 65 && code <= 90) ? 65 : 97;
                    return String.fromCharCode(((code - base + effectiveN) % 26) + base);
                }
                return char;
            }).join('');
        };

        // --- LÓGICA DEL BOTÓN DE COPIAR ---
        if (btnCopy) {
            btnCopy.addEventListener('click', () => {
                if (!output.value) return;

                // Seleccionamos el contenido del textarea
                output.select();
                output.setSelectionRange(0, 99999); // Soporte para móviles

                // Intentamos copiar
                try {
                    // Usamos el método clásico que es infalible si el texto ya está seleccionado
                    const exitoso = document.execCommand('copy');
                    if (exitoso) {
                        const textoOriginal = btnCopy.innerText;
                        btnCopy.innerText = "Copiado!";
                        
                        // Feedback visual (opcional, ajusta a tus estilos)
                        btnCopy.style.boxShadow = "0 0 15px rgba(0, 114, 245, 0.4)";
                        
                        setTimeout(() => {
                            btnCopy.innerText = textoOriginal;
                            btnCopy.style.boxShadow = "";
                        }, 2000);
                    }
                } catch (err) {
                    console.error('Error al intentar copiar:', err);
                }
            });
        }

        // Listeners de eventos
        input.addEventListener('input', update);
        shiftInput.addEventListener('input', update);
        toggle.addEventListener('change', update);
        
        // Disparar update inicial
        setTimeout(update, 100); 
    };

    // Inicialización al cargar el DOM
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initCesar);
    } else {
        initCesar();
    }
})();


const btnCopy = document.getElementById('enigma-copy-btn');
(function() {
    // Configuraciones de cableado reales de la Enigma I
    const mappings = {
        I:   "EKMFLGDQVZNTOWYHXUSPAIBRCJ",
        II:  "AJDKSIRUXBLHWTMCQGZNPYFVOE",
        III: "BDFHJLCPRTXVZNYEIWGAKMUSQO",
        UKW: "YRUHQSLDPXNGOKMIEBFZCWVJAT" // Reflector B
    };

    let pos = [0, 0, 0]; // Posiciones iniciales de los rotores (A, A, A)

    const initEnigma = () => {
        const input = document.getElementById('enigma-input');
        const output = document.getElementById('enigma-output');
        const rotorDivs = [
            document.getElementById('rotor-3'),
            document.getElementById('rotor-2'),
            document.getElementById('rotor-1')
        ];

        const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

        function cipherLetter(char) {
            let c = char.toUpperCase();
            if (!alphabet.includes(c)) return char;

            // 1. Girar rotores (Mecánica de odómetro)
            pos[0]++;
            if (pos[0] > 25) { pos[0] = 0; pos[1]++; }
            if (pos[1] > 25) { pos[1] = 0; pos[2]++; }
            if (pos[2] > 25) { pos[2] = 0; }

            updateRotorVisuals();

            // 2. Lógica de paso por rotores (simplificada para educación)
            let index = alphabet.indexOf(c);
            
            // Ida a través de los 3 rotores
            for (let i = 0; i < 3; i++) {
                let shift = pos[i];
                index = (index + shift) % 26;
                let letter = mappings[Object.keys(mappings)[i]][index];
                index = (alphabet.indexOf(letter) - shift + 26) % 26;
            }

            // Reflector
            let reflectedLetter = mappings.UKW[index];
            index = alphabet.indexOf(reflectedLetter);

            // Vuelta a través de los rotores
            for (let i = 2; i >= 0; i--) {
                let shift = pos[i];
                index = (index + shift) % 26;
                // Buscar letra inversa en el mapping
                let letter = alphabet[index];
                let map = mappings[Object.keys(mappings)[i]];
                index = (map.indexOf(letter) - shift + 26) % 26;
            }

            return alphabet[index];
        }

        function updateRotorVisuals() {
            pos.forEach((p, i) => {
                if (rotorDivs[i]) {
                    rotorDivs[i].innerText = alphabet[p];
                    // Pequeña animación de rebote
                    rotorDivs[i].style.transform = "scale(1.1)";
                    setTimeout(() => rotorDivs[i].style.transform = "scale(1)", 100);
                }
            });
        }

        input.addEventListener('input', (e) => {
            const text = input.value;
            // Reiniciamos posición para simular desde cero o procesar letra a letra
            // En una Enigma real, el estado es persistente
            let result = "";
            let tempPos = [0,0,0]; // Para el simulador de texto completo, reseteamos visualmente
            
            // Re-procesar todo el texto para mantener consistencia visual
            pos = [0, 0, 0]; 
            for (let char of text) {
                result += cipherLetter(char);
            }
            output.value = result;
        });

        // --- LÓGICA DEL BOTÓN DE COPIAR ---
        if (btnCopy) {
            btnCopy.addEventListener('click', () => {
                if (!output.value) return;

                // Seleccionamos el contenido del textarea
                output.select();
                output.setSelectionRange(0, 99999); // Soporte para móviles

                // Intentamos copiar
                try {
                    // Usamos el método clásico que es infalible si el texto ya está seleccionado
                    const exitoso = document.execCommand('copy');
                    if (exitoso) {
                        const textoOriginal = btnCopy.innerText;
                        btnCopy.innerText = "Copiado!";
                        
                        // Feedback visual (opcional, ajusta a tus estilos)
                        btnCopy.style.boxShadow = "0 0 15px rgba(0, 114, 245, 0.4)";
                        
                        setTimeout(() => {
                            btnCopy.innerText = textoOriginal;
                            btnCopy.style.boxShadow = "";
                        }, 2000);
                    }
                } catch (err) {
                    console.error('Error al intentar copiar:', err);
                }
            });
        }

        window.resetEnigma = () => {
            pos = [0, 0, 0];
            input.value = "";
            output.value = "";
            updateRotorVisuals();
        };
    };

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initEnigma);
    } else {
        initEnigma();
    }
})();

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

let imagenes = document.getElementsByClassName('himage');
let texto = document.getElementsByClassName('texto-imagen');

for (let i = 0; i < imagenes.length; i++) {
  imagenes[i].addEventListener('mouseenter', e =>{
    texto[i].innerHTML = imagenes[i].alt + '<span class="underline"></span>';
  });

  imagenes[i].addEventListener('mouseleave', l =>{
    texto[i].textContent = '';
  });
  
}