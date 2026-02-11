<?php
class Wiki {
    private $id_wiki;
    private $titulo_wiki;
    private $cuerpo_wiki;
    private $enlace_externo;

    public function __construct($id_wiki = null, $titulo_wiki = null, $cuerpo_wiki = null, $enlace_externo = null) {
        $this->id_wiki = $id_wiki;
        $this->titulo_wiki = $titulo_wiki;
        $this->cuerpo_wiki = $cuerpo_wiki;
        $this->enlace_externo = $enlace_externo;
    }

    public function __get($propiedad) {
        if (property_exists($this, $propiedad)) {
            return $this->$propiedad;
        }
    }

    public function __set($propiedad, $valor) {
        if (property_exists($this, $propiedad)) {
            $this->$propiedad = $valor;
        }
    }
}