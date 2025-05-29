-- Insertar áreas
INSERT INTO area (nombre) VALUES
('Matemáticas'),
('Lenguaje'),
('Ciencias'),
('Historia');

-- Insertar administradores
INSERT INTO administrador (nombre, email) VALUES
('Ana Pérez', 'ana.perez@colegio.edu'),
('Carlos Ruiz', 'carlos.ruiz@colegio.edu');

-- Insertar estudiantes
INSERT INTO estudiante (nombre, email) VALUES
('Juan Torres', 'juan.torres@student.edu'),
('Lucía González', 'lucia.gonzalez@student.edu'),
('Pedro Martínez', 'pedro.martinez@student.edu');

-- Insertar evaluaciones
INSERT INTO evaluacion (titulo, area_id, administrador_id, fecha_inicio, fecha_fin, tiempo_limite_minutos) VALUES
('Evaluación de Matemáticas 1', 1, 1, '2025-06-01 08:00:00', '2025-06-01 10:00:00', 60),
('Evaluación de Lenguaje 1', 2, 2, '2025-06-02 09:00:00', '2025-06-02 11:00:00', 60);

-- Insertar preguntas para Matemáticas
INSERT INTO pregunta (evaluacion_id, enunciado, puntaje) VALUES
(1, '¿Cuánto es 5 + 7?', 5),
(1, '¿Cuál es el resultado de 9 x 3?', 5);

-- Insertar alternativas para la primera pregunta de Matemáticas
INSERT INTO alternativa (pregunta_id, texto, es_correcta) VALUES
(1, '10', FALSE),
(1, '12', TRUE),
(1, '13', FALSE),
(1, '14', FALSE);

-- Insertar alternativas para la segunda pregunta de Matemáticas
INSERT INTO alternativa (pregunta_id, texto, es_correcta) VALUES
(2, '18', FALSE),
(2, '27', TRUE),
(2, '36', FALSE),
(2, '24', FALSE);

-- Insertar preguntas para Lenguaje
INSERT INTO pregunta (evaluacion_id, enunciado, puntaje) VALUES
(2, '¿Cuál es el sinónimo de “feliz”?', 5),
(2, '¿Cuál es el antónimo de “rápido”?', 5);

-- Insertar alternativas para la primera pregunta de Lenguaje
INSERT INTO alternativa (pregunta_id, texto, es_correcta) VALUES
(3, 'Contento', TRUE),
(3, 'Triste', FALSE),
(3, 'Enojado', FALSE),
(3, 'Cansado', FALSE);

-- Insertar alternativas para la segunda pregunta de Lenguaje
INSERT INTO alternativa (pregunta_id, texto, es_correcta) VALUES
(4, 'Ágil', FALSE),
(4, 'Lento', TRUE),
(4, 'Rápido', FALSE),
(4, 'Ligero', FALSE);

-- Asignación de evaluaciones a estudiantes
INSERT INTO asignacion_evaluacion (evaluacion_id, estudiante_id) VALUES
(1, 1), -- Juan Torres tiene Matemáticas
(2, 2), -- Lucía González tiene Lenguaje
(1, 3); -- Pedro Martínez tiene Matemáticas

-- Simular intento de examen de Juan Torres en Matemáticas
INSERT INTO intento_examen (evaluacion_id, estudiante_id, fecha_inicio, fecha_fin, puntaje_total)
VALUES (1, 1, '2025-06-01 08:05:00', '2025-06-01 08:40:00', 10);

-- Registrar respuestas del intento de Juan Torres (responde bien ambas)
INSERT INTO respuesta_intento (intento_examen_id, pregunta_id, alternativa_id) VALUES
(1, 1, 2), -- Pregunta 1, alternativa correcta '12'
(1, 2, 6); -- Pregunta 2, alternativa correcta '27'

-- Simular intento de examen de Lucía González en Lenguaje
INSERT INTO intento_examen (evaluacion_id, estudiante_id, fecha_inicio, fecha_fin, puntaje_total)
VALUES (2, 2, '2025-06-02 09:10:00', '2025-06-02 09:45:00', 10);

-- Registrar respuestas del intento de Lucía (responde bien ambas)
INSERT INTO respuesta_intento (intento_examen_id, pregunta_id, alternativa_id) VALUES
(2, 3, 9), -- Pregunta 1, alternativa correcta 'Contento'
(2, 4, 11); -- Pregunta 2, alternativa correcta 'Lento'