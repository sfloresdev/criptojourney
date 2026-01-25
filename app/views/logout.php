<?php
session_start();
session_unset();
session_destroy();
$msg = 'sesion cerrada por ianctividad';
require __DIR__."/login.php";
exit;
