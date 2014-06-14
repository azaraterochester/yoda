SELECT DISTINCT 
	estudiante.Id_Persona,
	estudiante.Apellido1, 
	estudiante.Apellido2, 
	estudiante.Nombre1, 
	estudiante.Nombre2,
    asignatura.Asignatura,
    Aprendizaje.Aprendizaje,
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2
FROM PERSONA AS estudiante
	 INNER JOIN	calificacion_final on estudiante.Id_Persona = calificacion_final.Persona_Id_Persona
     INNER JOIN Aprendizaje ON calificacion_final.Aprendizaje_Id_Aprendizaje = Aprendizaje.Id_Aprendizaje
	 INNER JOIN Subtopico ON Aprendizaje.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 INNER JOIN Unidad ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN asignatura ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN Insc_Curso_Asig ON asignatura.Id_Asignatura = Insc_Curso_Asig.Asignatura_Id_Asignatura
	 INNER JOIN PERSONA ON Insc_Curso_Asig.Persona_Id_Persona = PERSONA.Id_Persona
WHERE 
Grado_Id_Grado = 404 AND 
SY_Id_SY = 2 AND 
(calificacion_num < 0.825 or calificacion_num =  null) and 
estudiante.Tipo_Persona_Id_Tipo_Persona = 1 and 
PERSONA.Tipo_Persona_Id_Tipo_Persona = 4 
/*and estudiante.Id_Persona = 208*/
ORDER BY estudiante.Id_Persona