SELECT 
	CONCAT(PERSONA.Nombre1," ",PERSONA.Nombre2," ",PERSONA.Apellido1," ",PERSONA.Apellido2),
	Grado.Grado, 	
	PERSONA.Codigo, 
	PERSONA.No_Documento, 
	PERSONA.Tipo_Documento
FROM Insc_Alum_Curso INNER JOIN PERSONA ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN Grado ON Grado.Id_Grado = Curso.Grado_Id_Grado
WHERE
	Insc_Alum_Curso.SY_Id_SY = 3 and
	Curso.Id_Curso >= 10301 and
	Curso.Id_Curso <= 140403
ORDER BY
	Curso.Id_Curso, PERSONA.Nombre1, PERSONA.Nombre2 ,PERSONA.Apellido1, PERSONA.Apellido2