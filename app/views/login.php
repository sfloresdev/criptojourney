<?php

$title = "Login";
$extra_styles = true;
$extra_styles_filename = 'login' ?? "";

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Acceso | CryptoJourney</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
        }

        body {
            height: 100vh;
            background: radial-gradient(circle at top, #111 0%, #000 65%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
        }

        .auth-container {
            width: 100%;
            max-width: 420px;
            padding: 45px;
            background: rgba(0, 0, 0, 0.85);
            border: 2px solid #ffffff61;
            border-radius: 15px;
            box-shadow: 0 0 50px rgba(255, 255, 255, 0.2);
            text-align: center;
        }

        .auth-container h1 {
            font-size: 1.9rem;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }

        .subtitle {
            font-size: 0.9rem;
            color: #aaa;
            margin-bottom: 35px;
        }

        .auth-form {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .auth-form input {
            background: transparent;
            border: none;
            border-bottom: 1px solid #444;
            padding: 10px 5px;
            color: #fff;
            font-size: 0.95rem;
        }

        .auth-form input::placeholder {
            color: #666;
        }

        .auth-form input:focus {
            outline: none;
            border-bottom: 1px solid #fff;
        }

        .primary {
            margin-top: 15px;
            padding: 12px;
            background: #fff;
            color: #000;
            border: none;
            font-weight: 900;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.7s ease;
        }

        .primary:hover {
            background: #000;
            color: #fff;
            border: 1px solid #fff;
        }

        .secondary {
            margin-top: 25px;
            padding: 10px;
            background: transparent;
            border: 1px solid #333;
            color: #aaa;
            font-size: 0.85rem;
            cursor: pointer;
            transition: all 0.3s;
        }

        .secondary:hover {
            border-color: #fff;
            color: #fff;
        }

        .switch {
            margin-top: 25px;
            font-size: 0.8rem;
            color: #666;
        }

        .switch button {
            background: none;
            border: none;
            color: #fff;
            cursor: pointer;
            margin-left: 6px;
            font-weight: 500;
        }

        .hidden {
            display: none;
        }
    </style>
</head>

<body>

    <div class="auth-container">

        <h1>CryptoJourney</h1>
        <p class="subtitle">Explora la encriptación</p>
        <?= $msg ?>

        <!-- LOGIN -->
        <form class="auth-form" method="POST" action="/desarrolloCJ/index.php">

            <input type="text" name="username" id="username" placeholder="Nombre de usuario" class="hidden">

            <input type="email" name="email" placeholder="Email">

            <input type="password" name="password" placeholder="Contraseña">

            <button type="submit" name="action" value="login" class="primary" id="loginBtn">
                Iniciar sesión
            </button>

            <button type="submit" name="action" value="register" class="primary hidden" id="registerBtn">
                Registrarse
            </button>

            <button type="submit" name="action" value="guest" class="secondary">
                Entrar como invitado
            </button>

            <div class="switch">
                <span id="switchText">¿No tienes cuenta?</span>
                <button type="button" id="switchBtn">Registrarse</button>
            </div>

        </form>

    </div>

    <script>
        const switchBtn = document.getElementById("switchBtn");
        const switchText = document.getElementById("switchText");
        const usernameInput = document.getElementById("username");
        const loginBtn = document.getElementById("loginBtn");
        const registerBtn = document.getElementById("registerBtn");

        let isLogin = true;

        switchBtn.addEventListener("click", () => {
            isLogin = !isLogin;

            usernameInput.classList.toggle("hidden");
            loginBtn.classList.toggle("hidden");
            registerBtn.classList.toggle("hidden");

            switchText.textContent = isLogin
            ? "¿No tienes cuenta?"
            : "¿Ya tienes cuenta?";

            switchBtn.textContent = isLogin
            ? "Registrarse"
            : "Iniciar sesión";
        });
    </script>


</body>

</html>