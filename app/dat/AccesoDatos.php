<?php
    require_once __DIR__. "/Articulo.php";
    require_once __DIR__. "/Usuario.php";
    require_once __DIR__. "/Valoracion.php";
    require_once __DIR__. "/Hero_images.php";
    /*
    * Acceso a datos con BD y Patrón Singleton
    */
    class AccesoDatos {
        
        private static $modelo = null;
        private $dbh = null;
        private $stmt_usuarios = null;
        private $stmt_addUsuario = null;
        private $stmt_imagen = null;
        private $stmt_articulos = null;
        private $stmt_valoraciones = null;
        private $stmt_getValoraciones = null;
        
        public static function initModelo(){
            if (self::$modelo == null){
                self::$modelo = new AccesoDatos();
            }
            return self::$modelo;
        }
        
        
        private function __construct(){
            
            try {
                $dsn = "mysql:host=localhost;dbname=criptojourney_db;charset=utf8";
                $this->dbh = new PDO($dsn, "root", "");
                $this->dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $e){
                echo "Error de conexión ".$e->getMessage();
                exit();
            }
            // Construyo la consulta 
            $this->stmt_usuarios = $this->dbh->prepare("SELECT * FROM usuarios");
            $this->stmt_addUsuario = $this->dbh->prepare("INSERT INTO usuarios (nombre, email, password, fec_reg) VALUES(:nombre, :email, :password, :fec_reg)");    
            $this->stmt_imagen = $this->dbh->prepare("SELECT imagen, alt, html_id FROM hero_images WHERE activa = 1 ORDER BY orden");   
            $this->stmt_articulos = $this->dbh->prepare("SELECT * FROM articulos ORDER BY fecha DESC");
            $this->stmt_valoraciones = $this->dbh->prepare("INSERT INTO valoraciones (id_articulo, id_usuario, puntuacion, comentario) VALUES (:id_articulo, :id_usuario, :puntuacion, :comentario)" );
            $this->stmt_getValoraciones = $this->dbh->prepare("SELECT v.*, u.nombre AS usuario FROM valoraciones v JOIN usuarios u ON v.id_usuario = u.id_usuario WHERE v.id_articulo = :id_articulo ORDER BY v.fec_val DESC");
            
        }

        public function getUsuarios(){
            $usuarios = [];
            $this->stmt_usuarios->setFetchMode(PDO::FETCH_CLASS | PDO::FETCH_PROPS_LATE, 'Usuario');
            if ($this->stmt_usuarios->execute()){
                $usuarios = $this->stmt_usuarios->fetchAll();
            }
            return $usuarios;
        }

        public function addUsuario($nombre, $mail, $password):bool{
            try{
                $fec_reg = new DateTime(); 
                $this->stmt_addUsuario->bindValue(':nombre', $nombre);
                $this->stmt_addUsuario->bindValue(':email', $mail);
                $this->stmt_addUsuario->bindValue(':password', password_hash($password, PASSWORD_DEFAULT))  ;
                $this->stmt_addUsuario->bindValue(':fec_reg', $fec_reg->format('Y-m-d'));

            return $this->stmt_addUsuario->execute();
            }catch(PDOException $e){
                echo 'Error: '. $e->getMessage();
                return false;
            }
            
        }

        public function getHeroImages() {
            $imagenes = [];
                $this->stmt_imagen->setFetchMode(PDO::FETCH_CLASS | PDO::FETCH_PROPS_LATE, 'Hero_images');
                if ($this->stmt_imagen->execute()){
                    $imagenes = $this->stmt_imagen->fetchAll();
                }
                return $imagenes;
        }

        public function getArticulos() {
            $articulos = [];
            $this->stmt_articulos->setFetchMode(PDO::FETCH_CLASS | PDO::FETCH_PROPS_LATE, 'Articulo');
            if ($this->stmt_articulos->execute()) {
                $articulos = $this->stmt_articulos->fetchAll();
            }
            return $articulos;
        }
        public function insertValoracion($id_articulo, $id_usuario, $puntuacion, $comentario) {
            try {
                $this->stmt_valoraciones->bindValue(':id_articulo', (int)$id_articulo, PDO::PARAM_INT);
                $this->stmt_valoraciones->bindValue(':id_usuario', (int)$id_usuario, PDO::PARAM_INT);
                $this->stmt_valoraciones->bindValue(':puntuacion', (int)$puntuacion, PDO::PARAM_INT);
                $this->stmt_valoraciones->bindValue(':comentario', $comentario, PDO::PARAM_STR);
                $this->stmt_valoraciones->execute();
            } catch (PDOException $e) {
                // Mostrar el error para depuración
                echo "Error al insertar la valoración: " . $e->getMessage();
                exit;
            }
        }

        public function getValoraciones($id_articulo) {
            $this->stmt_getValoraciones->bindParam(':id_articulo', $id_articulo);
            $this->stmt_getValoraciones->execute();
            return $this->stmt_getValoraciones->fetchAll(PDO::FETCH_OBJ);
        }
    }
?>