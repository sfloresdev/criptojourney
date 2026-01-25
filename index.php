<?php
session_start();
$msg = '';
require __DIR__ . '/app/dat/loginController.php';
require __DIR__ . '/app/dat/registerController.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($_POST['action'] === 'login') {
        $loginController = new login();
        if ($loginController->loginValido($_POST['email'], $_POST['password'])) {
            $_SESSION['guest'] = false;
            header('Location: main.php');
            exit;
        } else {
            $msg = 'Usuario y/o contraseña inválidos';
            require __DIR__ . '/app/views/login.php';
            exit;
        }
    }

    if ($_POST['action'] === 'register') {
        $registerController = new register();
        if ($registerController->registroValido($_POST['username'], $_POST['email'], $_POST['password'])) {
            $msg = 'Usuario registrado correctamente, por favor inicie sesión';
        } else {
            $msg = 'No se ha podido registrar el usuario, inténtelo de nuevo.';
        }
        require __DIR__ . '/app/views/login.php';
        exit;
    }

    if ($_POST['action'] === 'guest') {
        $_SESSION['guest'] = true;
        header('Location: main.php');
        exit;
    }
}

require __DIR__ . '/app/views/login.php';
