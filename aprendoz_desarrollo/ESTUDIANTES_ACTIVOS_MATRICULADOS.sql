SELECT Nivel.Nivel, 
	Grado.Grado, 
	curso.Curso, 
	PERSONA.Codigo, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	Insc_Alum_Curso.Curso_Id_Curso, 
	PERSONA.Tipo_Documento, 
	PERSONA.No_Documento, 
	matricula.fecha_matricula
FROM Insc_Alum_Curso INNER JOIN PERSONA ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN curso ON Insc_Alum_Curso.Curso_Id_Curso = curso.Id_Curso
	 INNER JOIN Grado ON Grado.Id_Grado = curso.Grado_Id_Grado
	 INNER JOIN Nivel ON Nivel.Id_Nivel = Grado.Nivel_Id_Nivel
	 INNER JOIN matricula ON PERSONA.Id_Persona = matricula.Persona_Id_Persona
WHERE Insc_Alum_Curso.Curso_Id_Curso >= 10101
AND Insc_Alum_Curso.Curso_Id_Curso <= 40403
AND Insc_Alum_Curso.SY_Id_SY = 4
AND PERSONA.Activo_Retirado = 1
and matricula.SY_Id_SY = 4
ORDER BY Insc_Alum_Curso.Curso_Id_Curso ASC, PERSONA.Apellido1 ASC