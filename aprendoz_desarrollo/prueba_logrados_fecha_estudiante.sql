SELECT COUNT(*) AS esperados
FROM Aprendizaje INNER JOIN Subtopico ON Aprendizaje.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 INNER JOIN Unidad ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN asignatura ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN Insc_Alum_Asig ON Insc_Alum_Asig.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN calificacion_final ON calificacion_final.Aprendizaje_Id_Aprendizaje = Aprendizaje.Id_Aprendizaje AND calificacion_final.Persona_Id_Persona = Insc_Alum_Asig.Persona_Id_Persona
WHERE Aprendizaje.Fecha_Esperada <= CURDATE() and
Insc_Alum_Asig.Persona_Id_Persona = 195 AND
asignatura.SY_Id_SY = sy_actual() and
(calificacion_final.calificacion = "Competente" or calificacion_final.calificacion = "Avanzado" calificacion_final.calificacion = "Magistral")