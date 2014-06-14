SELECT 
	PERSONA.Id_Persona,
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	Curso.Curso, 
	PERSONA.Codigo
FROM Curso INNER JOIN Insc_Alum_Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
WHERE (tiene_costo_inscrito(PERSONA.Id_Persona,4,"0023") = 1 or
	tiene_costo_inscrito(PERSONA.Id_Persona,4,"0025") = 1) and
Curso.Id_Curso >= 10101 and
Curso.Id_Curso <= 40403 and
Insc_Alum_Curso.SY_Id_SY = 4
ORDER BY Curso.Id_Curso ASC, PERSONA.Apellido1 ASC, PERSONA.Apellido2 ASC, PERSONA.Nombre1 ASC, PERSONA.Nombre2 ASC