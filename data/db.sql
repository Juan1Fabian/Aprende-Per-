CREATE DATABASE aprende_peru;

USE aprende_peru;

-- Tabla de áreas o tipos de evaluaciones
CREATE TABLE area (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de administradores
CREATE TABLE administrador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla de estudiantes
CREATE TABLE estudiante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla de evaluaciones
CREATE TABLE evaluacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    area_id INT NOT NULL,
    administrador_id INT NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    tiempo_limite_minutos INT NOT NULL,
    FOREIGN KEY (area_id) REFERENCES area(id),
    FOREIGN KEY (administrador_id) REFERENCES administrador(id)
);

-- Tabla de preguntas
CREATE TABLE pregunta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    evaluacion_id INT NOT NULL,
    enunciado TEXT NOT NULL,
    puntaje NUMERIC(5,2) NOT NULL,
    FOREIGN KEY (evaluacion_id) REFERENCES evaluacion(id)
);

-- Tabla de alternativas para preguntas
CREATE TABLE alternativa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pregunta_id INT NOT NULL,
    texto TEXT NOT NULL,
    es_correcta BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (pregunta_id) REFERENCES pregunta(id)
);

-- Asignación de evaluaciones a estudiantes
CREATE TABLE asignacion_evaluacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    evaluacion_id INT NOT NULL,
    estudiante_id INT NOT NULL,
    UNIQUE(evaluacion_id, estudiante_id),
    FOREIGN KEY (evaluacion_id) REFERENCES evaluacion(id),
    FOREIGN KEY (estudiante_id) REFERENCES estudiante(id)
);

-- Intentos de exámenes realizados
CREATE TABLE intento_examen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    evaluacion_id INT NOT NULL,
    estudiante_id INT NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    puntaje_total NUMERIC(5,2),
    UNIQUE(evaluacion_id, estudiante_id),
    FOREIGN KEY (evaluacion_id) REFERENCES evaluacion(id),
    FOREIGN KEY (estudiante_id) REFERENCES estudiante(id)
);

-- Respuestas de cada intento
CREATE TABLE respuesta_intento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    intento_examen_id INT NOT NULL,
    pregunta_id INT NOT NULL,
    alternativa_id INT NOT NULL,
    UNIQUE(intento_examen_id, pregunta_id),
    FOREIGN KEY (intento_examen_id) REFERENCES intento_examen(id),
    FOREIGN KEY (pregunta_id) REFERENCES pregunta(id),
    FOREIGN KEY (alternativa_id) REFERENCES alternativa(id)
);