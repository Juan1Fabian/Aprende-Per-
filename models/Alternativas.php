<?php
require_once '../config/database.php';

class Alternativa {
    private $pdo;

    public function __construct() {
        $this->pdo = (new Conexion())->pdo;
    }

    // Crear una alternativa
    public function create($pregunta_id, $texto, $es_correcta) {
        $sql = "INSERT INTO alternativa (pregunta_id, texto, es_correcta)
                VALUES (?, ?, ?)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([$pregunta_id, $texto, $es_correcta]);
        return $this->pdo->lastInsertId();
    }

    // Obtener todas las alternativas de una pregunta
    public function getByPregunta($pregunta_id) {
        $sql = "SELECT * FROM alternativa WHERE pregunta_id = ?";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([$pregunta_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Verificar si una alternativa es correcta
    public function esCorrecta($alternativa_id) {
        $sql = "SELECT es_correcta FROM alternativa WHERE id = ?";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([$alternativa_id]);
        $resultado = $stmt->fetch(PDO::FETCH_ASSOC);
        return $resultado ? (bool)$resultado['es_correcta'] : false;
    }
}
?>
