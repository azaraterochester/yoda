SELECT Curso.Curso, 
	PERSONA.Activo_Retirado, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PADRE.Apellido1, 
	PADRE.Apellido2, 
	PADRE.Nombre1, 
	PADRE.Nombre2, 
	MADRE.Apellido1, 
	MADRE.Apellido2, 
	MADRE.Nombre1, 
	MADRE.Nombre2, 
	ACUDIENTE.Apellido1, 
	ACUDIENTE.Apellido2, 
	ACUDIENTE.Nombre1, 
	ACUDIENTE.Nombre2
FROM Insc_Alum_Curso INNER JOIN PERSONA ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN Curso ON Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso
	 INNER JOIN Grado ON Curso.Grado_Id_Grado = Grado.Id_Grado
	 INNER JOIN Nivel ON Grado.Nivel_Id_Nivel = Nivel.Id_Nivel
	 LEFT OUTER JOIN PERSONA PADRE ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = PADRE.Grupo_Familiar_ID_Grupo_Familiar
	 LEFT OUTER JOIN PERSONA MADRE ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = MADRE.Grupo_Familiar_ID_Grupo_Familiar
	 LEFT OUTER JOIN PERSONA ACUDIENTE ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = ACUDIENTE.Grupo_Familiar_ID_Grupo_Familiar
WHERE PERSONA.Tipo_Persona_Id_Tipo_Persona = 1 AND
	(PADRE.Tipo_Persona_Id_Tipo_Persona = 10 OR PADRE.Tipo_Persona_Id_Tipo_Persona = 2 OR  PADRE.Tipo_Persona_Id_Tipo_Persona = 8)  AND
	(MADRE.Tipo_Persona_Id_Tipo_Persona = 12 OR MADRE.Tipo_Persona_Id_Tipo_Persona = 4 OR MADRE.Tipo_Persona_Id_Tipo_Persona = 10) AND
	(ACUDIENTE.Tipo_Persona_Id_Tipo_Persona = 3) AND
	PADRE.Sexo = "MASCULINO" AND 
	MADRE.Sexo = "FEMENINO" AND 
	Insc_Alum_Curso.SY_Id_SY = 3 AND
	/*curso.Grado_Id_Grado = 101 and */
curso.Id_Curso > 10100 and curso.Id_Curso < 500000