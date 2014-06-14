SELECT DISTINCT asignatura.Asignatura, 
	Unidad.Unidad, 
	Subtopico.Subtopico, 
	Aprendizaje.Aprendizaje, 
	Aprendizaje.Fecha_Esperada,
	calificacion_final.calificacion_num, 
	calificacion_final.calificacion, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre2, 
	PERSONA.Nombre1
FROM calificacion_final INNER JOIN Aprendizaje ON calificacion_final.Aprendizaje_Id_Aprendizaje = Aprendizaje.Id_Aprendizaje
	 INNER JOIN Subtopico ON Aprendizaje.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 INNER JOIN Unidad ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN asignatura ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = calificacion_final.Persona_Id_Persona
WHERE (calificacion_final.calificacion = "No_Calificado") and asignatura.SY_Id_SY = 4