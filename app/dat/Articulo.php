<?php
class Articulo {
    private $id_articulo;
    private $titulo;
    private $subtitulo;
    private $resumen;
    private $contenido;
    private $autor;
    private $fec_pub;
    private $id_wiki; 

    public function __construct($id_articulo = null, $subtitulo = null, $resumen = null, $contenido = null, $titulo = null, $autor = null, $fec_pub = null, $id_wiki = null) {
        $this->id_articulo = $id_articulo;
        $this->titulo = $titulo;
        $this->subtitulo = $subtitulo;
        $this->resumen = $resumen;
        $this->contenido = $contenido;
        $this->autor = $autor;
        $this->fec_pub = $fec_pub;
        $this->id_wiki = $id_wiki; 
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