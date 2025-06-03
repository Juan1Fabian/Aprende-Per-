<?php
require_once '../config/database.php';

class Evaluacion {
    private $pdo;

    public function __construct() {
        $this->pdo = (new Conexion())->pdo;
    }

    public function create($titulo, $area_id, $admin_id, $fecha_inicio, $fecha_fin, $tiempo_limite) {
        $sql = "INSERT INTO evaluacion (titulo, area_id, administrador_id, fecha_inicio, fecha_fin, tiempo_limite_minutos)
                VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([$titulo, $area_id, $admin_id, $fecha_inicio, $fecha_fin, $tiempo_limite]);
        return $this->pdo->lastInsertId();
    }

    public function getAll() {
        $stmt = $this->pdo->query("SELECT * FROM evaluacion");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Obtener evaluación con preguntas y alternativas
    public function getEvaluacionCompleta($evaluacion_id) {
        $sql = "SELECT * FROM pregunta WHERE evaluacion_id = ?";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([$evaluacion_id]);
        $preguntas = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($preguntas as &$pregunta) {
            $sql2 = "SELECT id, texto FROM alternativa WHERE pregunta_id = ?";
            $stmt2 = $this->pdo->prepare($sql2);
            $stmt2->execute([$pregunta['id']]);
            $pregunta['alternativas'] = $stmt2->fetchAll(PDO::FETCH_ASSOC);
        }

        return $preguntas;
    }
}
?>

