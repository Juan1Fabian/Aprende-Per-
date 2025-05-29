-- Agregar más alumnos
INSERT INTO estudiante (nombre, email) VALUES
('María López', 'maria.lopez@student.edu'),      -- id = 4
('Diego Ramírez', 'diego.ramirez@student.edu'),  -- id = 5
('Sofía Herrera', 'sofia.herrera@student.edu'),  -- id = 6
('Luis Castillo', 'luis.castillo@student.edu');  -- id = 7

-- Asignar evaluaciones a los nuevos alumnos
INSERT INTO asignacion_evaluacion (evaluacion_id, estudiante_id) VALUES
(1, 4), -- María López a Matemáticas
(1, 5), -- Diego Ramírez a Matemáticas
(2, 6), -- Sofía Herrera a Lenguaje
(2, 7); -- Luis Castillo a Lenguaje

-- Insertar intentos de examen aprobados y desaprobados:

-- María López (aprobada en Matemáticas)
INSERT INTO intento_examen (evaluacion_id, estudiante_id, fecha_inicio, fecha_fin, puntaje_total)
VALUES (1, 4, '2025-06-01 08:10:00', '2025-06-01 08:45:00', 13);

-- Diego Ramírez (desaprobado en Matemáticas)
INSERT INTO intento_examen (evaluacion_id, estudiante_id, fecha_inicio, fecha_fin, puntaje_total)
VALUES (1, 5, '2025-06-01 08:15:00', '2025-06-01 08:50:00', 7);

-- Sofía Herrera (aprobada en Lenguaje)
INSERT INTO intento_examen (evaluacion_id, estudiante_id, fecha_inicio, fecha_fin, puntaje_total)
VALUES (2, 6, '2025-06-02 09:15:00', '2025-06-02 09:47:00', 14);

-- Luis Castillo (desaprobado en Lenguaje)
INSERT INTO intento_examen (evaluacion_id, estudiante_id, fecha_inicio, fecha_fin, puntaje_total)
VALUES (2, 7, '2025-06-02 09:20:00', '2025-06-02 09:55:00', 6);

-- También puedes agregar respuestas (opcional) para estos intentos si lo necesitas