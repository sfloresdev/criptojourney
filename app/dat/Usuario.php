<?php

class Usuario{

    private $id_usuario;
    private $nombre;
    private $email;
    private $password;
    private $fec_reg;

    public function __construct($id_usuario = null, $nombre = null, $email = null, $password = null, $fec_reg = null )
    {
        $this->id_usuario = $id_usuario;
        $this->nombre = $nombre;
        $this->email = $email;
        $this->password = $password;
        $this->fec_reg = $fec_reg;
    }

    public function __get($propiedad)
    {
        if (property_exists($this, $propiedad)) {
            return $this->$propiedad;
        }
    }
        public function __set($propiedad, $valor)
    {
        if (property_exists($this, $propiedad)) {
            $this->$propiedad = $valor;
        }
    }
}

?>