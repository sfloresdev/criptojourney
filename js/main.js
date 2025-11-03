// Bloque para el menu
let btn = document.getElementById('menu-btn');
let menu = document.getElementById('menu');

btn.addEventListener("click", () => {
  menu.classList.toggle("active");
});

document.addEventListener("click", (event) => {
  if (!btn.contains(event.target) && !menu.contains(event.target)) {
    menu.classList.remove("active");
  }
});


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