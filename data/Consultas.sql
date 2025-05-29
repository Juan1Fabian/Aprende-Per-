-- a. ¿Cuántos alumnos desaprobados tenemos en total?
SELECT COUNT(DISTINCT estudiante_id) AS alumnos_desaprobados
FROM intento_examen
WHERE puntaje_total < 11;

-- b. ¿Cuántos alumnos aprobados en un determinado curso tenemos?
-- Por ejemplo para Matemáticas (evaluacion_id = 1)
SELECT COUNT(DISTINCT estudiante_id) AS alumnos_aprobados
FROM intento_examen
WHERE evaluacion_id = 1 AND puntaje_total >= 11;

-- Para Lenguaje (evaluacion_id = 2)
SELECT COUNT(DISTINCT estudiante_id) AS alumnos_aprobados
FROM intento_examen
WHERE evaluacion_id = 2 AND puntaje_total >= 11;

-- c. ¿A cuántos exámenes está inscrito un alumno y cuántos de ellos están resueltos y pendientes?
-- Por ejemplo para Juan Torres (estudiante_id = 1)

-- Exámenes inscritos
SELECT COUNT(*) AS examenes_inscritos
FROM asignacion_evaluacion
WHERE estudiante_id = 1;

-- Exámenes resueltos
SELECT COUNT(*) AS examenes_resueltos
FROM intento_examen
WHERE estudiante_id = 1;

-- Exámenes pendientes (inscritos menos resueltos)
SELECT 
    (SELECT COUNT(*) FROM asignacion_evaluacion WHERE estudiante_id = 1) -
    (SELECT COUNT(*) FROM intento_examen WHERE estudiante_id = 1) 
    AS examenes_pendientes;

-- d. ¿Cuál es la mejor y peor calificación de una determinada evaluación?
-- Por ejemplo para Matemáticas (evaluacion_id = 1)
SELECT 
    MAX(puntaje_total) AS mejor_calificacion,
    MIN(puntaje_total) AS peor_calificacion
FROM intento_examen
WHERE evaluacion_id = 1;

-- e. ¿Cómo calcularíamos el promedio de calificaciones de un estudiante?
-- Por ejemplo para Pedro Martínez (estudiante_id = 3)
SELECT AVG(puntaje_total) AS promedio_calificaciones
FROM intento_examen
WHERE estudiante_id = 3;