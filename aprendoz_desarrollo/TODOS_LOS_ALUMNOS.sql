SELECT DISTINCT 
	Curso.Curso,
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2,
	PERSONA.No_Documento,
	PERSONA.Codigo
FROM Curso INNER JOIN Insc_Alum_Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
WHERE
Curso.Id_Curso >= 10101 and
Curso.Id_Curso <= 40403 and
Insc_Alum_Curso.SY_Id_SY = 3
ORDER BY
Curso.Id_Curso, PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2