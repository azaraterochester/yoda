SELECT PERSONA.Id_Persona, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	padre.Apellido1, 
	padre.Apellido2, 
	padre.Nombre1, 
	padre.Nombre2, 
	padre.email
FROM PERSONA INNER JOIN Insc_Alum_Curso ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 INNER JOIN PERSONA padre ON padre.Grupo_Familiar_ID_Grupo_Familiar = PERSONA.Grupo_Familiar_ID_Grupo_Familiar
WHERE Insc_Alum_Curso.SY_Id_SY = 4 and
Insc_Alum_Curso.Curso_Id_Curso BETWEEN 10101 AND 40403
and (padre.Tipo_Persona_Id_Tipo_Persona = 12 or padre.Tipo_Persona_Id_Tipo_Persona = 2 OR padre.Tipo_Persona_Id_Tipo_Persona = 4 or padre.Tipo_Persona_Id_Tipo_Persona = 6 or padre.Tipo_Persona_Id_Tipo_Persona = 8 or padre.Tipo_Persona_Id_Tipo_Persona = 10)
and PERSONA.Activo_Retirado = 1