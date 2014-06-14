SELECT PERSONA.Codigo
FROM Grado INNER JOIN Curso ON Grado.Id_Grado = Curso.Grado_Id_Grado
	 INNER JOIN Insc_Alum_Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN PERSONA ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
WHERE Curso.Id_Curso >= 10101 and
	Curso.Id_Curso <= 40403 and
	Insc_Alum_Curso.SY_Id_SY = 3 and
	PERSONA.Activo_Retirado = 1 AND
	PERSONA.matriculado = 1
ORDER BY Curso.Id_Curso ASC