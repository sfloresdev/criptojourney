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