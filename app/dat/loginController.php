<?php

include_once __DIR__."/AccesoDatos.php";

class login{
    private $db;

    public function __construct()
    {
        $this->db = AccesoDatos::initModelo();
    }

    public function loginValido($mail, $password){
        $usuarios = $this->db->getUsuarios();
            foreach ($usuarios as $usuario) {
                if ($usuario->email == $mail && password_verify($password, $usuario->password)) {
                     // 1️⃣ Crear la sesión aquí (o en el script que llama a esta función)
                    $_SESSION['usuario'] = $usuario->id_usuario;

                    // 2️⃣ Guardar la hora de última actividad
                    $_SESSION['ultima_actividad'] = time();
                    return true;
                }    
            }
            
        return false;
    }
}


?>