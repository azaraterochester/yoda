SELECT PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.Codigo
FROM PERSONA INNER JOIN Insc_Alum_Curso ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
WHERE Insc_Alum_Curso.SY_Id_SY = 2 and Insc_Alum_Curso.Curso_Id_Curso < 40401
ORDER BY PERSONA.Apellido1 ASC, PERSONA.Apellido2 ASC, PERSONA.Nombre1 ASC, PERSONA.Nombre2 ASC