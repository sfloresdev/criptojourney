<?php

class Valoracion{

    private $id_valoracion;
    private $id_usuario;
    private $id_articulo;
    private $puntuacion;
    private $comentario;
    private $fec_val;

    public function __construct
    (
        $id_valoracion = null, $id_usuario = null, $id_articulo = null,
        $puntuacion = null, $comentario = null, $fec_val = null 
    )
    {
        $this->id_valoracion = $id_valoracion;
        $this->id_usuario = $id_usuario;
        $this->id_articulo= $id_articulo;
        $this->puntuacion = $puntuacion;
        $this->comentario = $comentario;
        $this->fec_val = $fec_val;
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