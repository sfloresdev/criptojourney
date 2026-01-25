<?php
session_start();

$MAX_INACTIVIDAD = 600; // 10 min
$ahora = time();

// Inicializar última actividad si no existe
if (!isset($_SESSION['ultima_actividad'])) {
    $_SESSION['ultima_actividad'] = $ahora;
}

// Control de inactividad
if ($ahora - $_SESSION['ultima_actividad'] > $MAX_INACTIVIDAD) {
    session_unset();
    session_destroy();
    $msg = 'Sesión expirada por inactividad';
    require './app/views/login.php';
    exit;
}

// Actualizar última actividad
$_SESSION['ultima_actividad'] = $ahora;

// Determinar si es invitado o usuario
$guest = $_SESSION['guest'] ?? true;
