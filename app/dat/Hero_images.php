<?php

class Hero_images{
    private $id;
    private $imagen;
    private $alt;
    private $html_id;
    private $orden;
    private $activa;

    public function __construct($id = null, $imagen = null, $alt = null, $html_id = null, $orden = null, $activa = null)
    {
        $this->id = $id;
        $this->imagen = $imagen;
        $this->alt = $alt;
        $this->html_id = $html_id;
        $this->orden = $orden;
        $this->activa = $activa;
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