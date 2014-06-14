SELECT DISTINCT
	Curso.Curso,
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre2, 
	PERSONA.Nombre1
FROM Insc_Alum_Curso INNER JOIN PERSONA ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 LEFT OUTER JOIN matricula ON matricula.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
WHERE Insc_Alum_Curso.SY_Id_SY = 2 and matricula.id_matricula is null and PERSONA.Activo_Retirado = 1
and Curso.Id_Curso <> 40401
and Curso.Id_Curso <> 40402
and Curso.Id_Curso <> 40403
ORDER BY Curso.Id_Curso ASC, PERSONA.Apellido1 ASC, PERSONA.Apellido2 ASC, PERSONA.Nombre1 ASC, PERSONA.Nombre2 ASC