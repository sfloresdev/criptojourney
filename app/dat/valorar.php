<?php
include_once __DIR__."/AccesoDatos.php";
session_start();

// Solo usuarios logueados pueden valorar
if (!isset($_SESSION['usuario'])) {
    header('Location: ../views/login.php'); // redirige al login
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_articulo = intval($_POST['id_articulo']);
    $id_usuario = (int)$_SESSION['usuario']; // id del usuario logueado
    $puntuacion = (int)($_POST['puntuacion'] ?? 0);
    $comentario = trim($_POST['comentario']);

    try {
        $modelo = AccesoDatos::initModelo();
        $modelo->insertValoracion($id_articulo, $id_usuario, $puntuacion, $comentario);
    } catch (PDOException $e) {
        echo "Error al insertar la valoración: " . $e->getMessage();
        exit;
    }

    header('Location: ../../main.php');
    exit;
}
