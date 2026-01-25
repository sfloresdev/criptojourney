<?php

include_once __DIR__."/AccesoDatos.php";

class register{
    private $db = null;
    public function __construct()
    {
        $this->db = AccesoDatos::initModelo();
    }

    public function registroValido($nombre, $mail, $password):bool{
        if ($this->db->addUsuario($nombre,$mail,$password)) {
            return true;
        }
        return false;
    }
}

?>
