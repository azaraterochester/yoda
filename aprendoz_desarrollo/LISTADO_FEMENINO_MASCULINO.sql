SELECT Grado.Grado, 
	Curso.Id_Curso, 
	Curso.Curso, 
	vista_alumnos_activos.Sexo, 
	vista_alumnos_activos.Codigo
FROM Insc_Alum_Curso INNER JOIN vista_alumnos_activos ON Insc_Alum_Curso.Persona_Id_Persona = vista_alumnos_activos.Id_Persona
	 INNER JOIN Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN Grado ON Grado.Id_Grado = Curso.Grado_Id_Grado
WHERE Insc_Alum_Curso.SY_Id_SY = 4 and curso.Id_Curso between 10101 AND 40403