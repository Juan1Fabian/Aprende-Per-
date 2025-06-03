<?php
require_once '/config/database.php';

class Pregunta {
    private $pdo;

    public function __construct() {
        $this->pdo = (new Conexion())->pdo;
    }

    // Crear una pregunta
    public function create($evaluacion_id, $enunciado, $puntaje) {
        $sql = "INSERT INTO pregunta (evaluacion_id, enunciado, puntaje)
                VALUES (?, ?, ?)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([$evaluacion_id, $enunciado, $puntaje]);
        return $this->pdo->lastInsertId();
    }

    // Obtener todas las preguntas de una evaluación
    public function getByEvaluacion($evaluacion_id) {
        $sql = "SELECT * FROM pregunta WHERE evaluacion_id = ?";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([$evaluacion_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Obtener una pregunta con sus alternativas
    public function getConAlternativas($pregunta_id) {
        $sql = "SELECT * FROM pregunta WHERE id = ?";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([$pregunta_id]);
        $pregunta = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($pregunta) {
            $sql2 = "SELECT id, texto FROM alternativa WHERE pregunta_id = ?";
            $stmt2 = $this->pdo->prepare($sql2);
            $stmt2->execute([$pregunta_id]);
            $pregunta['alternativas'] = $stmt2->fetchAll(PDO::FETCH_ASSOC);
        }

        return $pregunta;
    }
}
?>
