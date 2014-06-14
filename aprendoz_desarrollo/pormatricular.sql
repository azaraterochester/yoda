SELECT 
	Curso.Curso,  
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	madre.Apellido1, 
	madre.Apellido2, 
	madre.Nombre1, 
	madre.Nombre2, 
	madre.Telefono, 
	madre.Telefono2, 
	madre.Celular, 
	padre.Apellido1, 
	padre.Apellido2, 
	padre.Nombre1, 
	padre.Nombre2, 
	padre.Telefono, 
	padre.Telefono2, 
	padre.Celular
FROM Insc_Alum_Curso INNER JOIN PERSONA ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN PERSONA padre ON padre.Grupo_Familiar_ID_Grupo_Familiar = PERSONA.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN PERSONA madre ON madre.Grupo_Familiar_ID_Grupo_Familiar = PERSONA.Grupo_Familiar_ID_Grupo_Familiar
	 LEFT OUTER JOIN matricula ON PERSONA.Id_Persona = matricula.Persona_Id_Persona
	 INNER JOIN Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
WHERE Insc_Alum_Curso.SY_Id_SY = 2 AND matricula.Persona_Id_Persona is null 
and Curso.Id_Curso <> 40401
and Curso.Id_Curso <> 40402
and Curso.Id_Curso <> 40403
and (madre.Tipo_Persona_Id_Tipo_Persona = 12 or madre.Tipo_Persona_Id_Tipo_Persona = 4)
and (padre.Tipo_Persona_Id_Tipo_Persona = 2 or padre.Tipo_Persona_Id_Tipo_Persona = 10 or padre.Tipo_Persona_Id_Tipo_Persona = 4)
ORDER BY Curso.Id_Curso ASC, PERSONA.Apellido1 ASC, PERSONA.Apellido2 ASC, PERSONA.Nombre1 ASC, PERSONA.Nombre2 ASC