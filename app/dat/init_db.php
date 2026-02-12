<?php
// 1. Configuración (ajusta esto a tu gusto)
$host = "localhost";
$user = "root";
$pass = "";
$dbName = "criptojourneydb";
$archivo_sql = __DIR__ . "/criptojourney_db.sql";

try {
    $pdo = new PDO("mysql:host=$host", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // 1. Intentamos seleccionar la base de datos
    $query = $pdo->query("SELECT COUNT(*) FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '$dbName'");
    $dbExists = $query->fetchColumn();

    if (!$dbExists) {
        // Si no existe la BD, ejecutamos todo el script (Creación + Inserts)
        $sql = file_get_contents($archivo_sql);
        $pdo->exec($sql);
    } else {
        // 2. Si la BD existe, entramos en ella y vemos si tiene tablas
        $pdo->exec("USE `$dbName` ");
        $tables = $pdo->query("SHOW TABLES");
        
        if ($tables->rowCount() == 0) {
            // Si la BD existe pero está vacía, ejecutamos el SQL
            $sql = file_get_contents($archivo_sql);
            $pdo->exec($sql);
        }
    }
    // Si ya existe la BD y tiene tablas, no hace nada. ¡Cero errores!

} catch (PDOException $e) {
    // Solo mostramos error si no es un error de "entrada duplicada"
    if ($e->getCode() != 23000) {
        die("Error crítico: " . $e->getMessage());
    }
}