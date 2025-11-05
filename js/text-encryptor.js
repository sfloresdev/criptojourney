const text = "nosotros";
const textDisplay = document.getElementById('encryptedText');
const cipherLabel = document.getElementById('cipherLabel');

// Funciones base de transformacion
const caesar = (shift) => (char) => {
	if (!/[a-z]/.test(char)) return char;
	return String.fromCharCode(((char.charCodeAt(0) - 97 + shift) % 26) + 97);
};

const toHex = (char) => char.charCodeAt(0).toString(16);

const fromSet = (set) => (char, index) => {
	return set[(char.charCodeAt(0) + index) % set.length];
};

// == Conjunto de simbolos ==
const symbolSets = {
	unicode: ['◆', '●', '■', '★', '✦', '◊', '▲', '▼'],
	math: ['∞', '≈', '±', '∓', '∑', '∫', '∝', '∣'],
	glyphs: ['!', '¶', '=', '?', '$', '&', '¡', '#'],
	morse: ['.', '-', '-', '-', '.', '-', '.', '-'],
	binary: ['1', '1', '1', '0', '1', '0', '0'],
	standard: ['c', 'o', 'n', 'o', 'c', 'e', 'l', 'o', 's']
}

// Definicion de cifrados
const ciphers = [
	{ name: "Conocelos...", transform: fromSet(symbolSets.standard) },
	{ name: "Cifrado César +1", transform: caesar(1) },
	{ name: "Cifrado César +5", transform: caesar(5) },
	{ name: "ROT13", transform: caesar(13) },
	{ name: "Cifrado César +9", transform: caesar(9) },
	{ name: "Representación Hexadecimal", transform: toHex },
	{ name: "Simbolos Unicode", transform: fromSet(symbolSets.unicode) },
	{ name: "Operadores Matematicos", transform: fromSet(symbolSets.math) },
	{ name: "Glifos Especiales", transform: fromSet(symbolSets.glyphs) },
	{ name: "Código Morse", transform: fromSet(symbolSets.morse) },
	{ name: "Estilo Binario", transform: fromSet(symbolSets.binary) }
]

let currentCipherIndex = 0;

function renderText() {
	let html = "";

	const cipher = ciphers[currentCipherIndex];

	for (let i = 0; i < text.length; i++) {
		const char = text[i];
		const transformedChar = cipher.transform(char, i);
		const direction = Math.random() > 0.5 ? 'up' : 'down';

		html += `<span class="char-wheel ${direction}">
			<span class="char-wheel-content" style="animation-delay: ${i * 0.2}s">
			${transformedChar}
			</span>
		</span>`;
	}
	textDisplay.innerHTML = html;
	cipherLabel.textContent = cipher.name;
}

function updateCipher () {
	currentCipherIndex = (currentCipherIndex + 1) % ciphers.length;
	renderText();
}

//Render inicial + intervalo de tiempo
renderText();
setInterval(updateCipher, 3300);