SELECT DISTINCT
	Curso.Curso
	/*calificacion_final.calificacion,*/
FROM calificacion_final INNER JOIN Aprendizaje ON calificacion_final.Aprendizaje_Id_Aprendizaje = Aprendizaje.Id_Aprendizaje
	 INNER JOIN Subtopico ON Aprendizaje.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 INNER JOIN Unidad ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN asignatura ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = calificacion_final.Persona_Id_Persona
	 INNER JOIN Insc_Alum_Curso ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN Curso ON Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso
WHERE 
/*PERSONA.Id_Persona >= 800 and */
/*PERSONA.Id_Persona <= 825 and */
/*Insc_Alum_Curso.Curso_Id_Curso = 10101 and*/
(
/*calificacion_final.calificacion = "No_Calificado" or */
calificacion_final.calificacion = "Competente"
or calificacion_final.calificacion = "Avanzado"
or calificacion_final.calificacion = "Magistral"
) and 
Aprendizaje.Fecha_Esperada <= '2012-11-07' and 
calificacion_final.fecha_logro <= '2012-11-07' and
Curso.Id_Curso >= 10101 and
Curso.Id_Curso <= 40103 and
Insc_Alum_Curso.SY_Id_SY = 3
GROUP BY Curso.Id_Curso
/*, calificacion_final.calificacion*/
ORDER BY Curso.Id_Curso, PERSONA.Apellido1, PERSONA.Apellido2, PERSONA.Nombre1, PERSONA.Nombre2