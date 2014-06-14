SELECT SY.School_year, 
	Grado.Grado, 
	Curso.Curso, 
	PERSONA.Id_Persona,
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	asignatura.Asignatura,
	asignatura.Id_Asignatura
FROM SY INNER JOIN Insc_Alum_Curso ON SY.Id_SY = Insc_Alum_Curso.SY_Id_SY
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 INNER JOIN Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN Insc_Alum_Asig ON Insc_Alum_Asig.Persona_Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 INNER JOIN asignatura ON asignatura.Id_Asignatura = Insc_Alum_Asig.Asignatura_Id_Asignatura
	 INNER JOIN Grado ON Grado.Id_Grado = Curso.Grado_Id_Grado
	 INNER JOIN Grado grado2 ON grado2.Id_Grado = asignatura.Grado_Id_Grado
WHERE Insc_Alum_Curso.SY_Id_SY = 4
	and Insc_Alum_Curso.Curso_Id_Curso between 10101 and 40403
	/*and Insc_Alum_Asig.Periodo_Id_Periodo = 1*/
	and Asignatura.SY_Id_SY = 4
	and grado.Id_Grado <> grado2.Id_Grado
	and grado2.Id_Grado <> 405