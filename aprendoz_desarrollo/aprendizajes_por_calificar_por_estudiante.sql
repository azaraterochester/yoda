SELECT 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	asignatura.Asignatura, 
	Aprendizaje.Aprendizaje, 
	Aprendizaje.Id_Aprendizaje,
	Aprendizaje.Fecha_Esperada,
	exists (select * from calificacion_final where calificacion_final.Aprendizaje_Id_Aprendizaje = Aprendizaje.Id_Aprendizaje and calificacion_final.Persona_Id_Persona = PERSONA.Id_Persona)
FROM asignatura INNER JOIN Insc_Alum_Asig ON asignatura.Id_Asignatura = Insc_Alum_Asig.Asignatura_Id_Asignatura
	 INNER JOIN Unidad ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN Subtopico ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN Aprendizaje ON Aprendizaje.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Insc_Alum_Asig.Persona_Id_Persona
WHERE Asignatura.SY_Id_SY = 4 and persona.codigo = 21048 and !exists (select * from calificacion_final where calificacion_final.Aprendizaje_Id_Aprendizaje = Aprendizaje.Id_Aprendizaje and calificacion_final.Persona_Id_Persona = PERSONA.Id_Persona and calificacion_final.calificacion <> "En Progreso")
	