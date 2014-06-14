SELECT Grado.Grado, 
	Curso.Curso, 
	PERSONA.Id_Persona, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.No_Documento, 
	PERSONA.Codigo,
	factura_por_davivienda_porcodigo(PERSONA.Codigo)
FROM Grado INNER JOIN Curso ON Grado.Id_Grado = Curso.Grado_Id_Grado
	 INNER JOIN Insc_Alum_Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
WHERE
	Insc_Alum_Curso.Curso_Id_Curso >= 10101 and
	Insc_Alum_Curso.Curso_Id_Curso <= 40403 and
	Insc_Alum_Curso.SY_Id_SY = 4 and
	PERSONA.Activo_Retirado = 1
GROUP BY PERSONA.Id_Persona
ORDER BY PERSONA.Id_Persona